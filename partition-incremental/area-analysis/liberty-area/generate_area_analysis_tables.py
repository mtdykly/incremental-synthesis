#!/usr/bin/env python3

import csv
import json
import re
import sys
from pathlib import Path


def load_design(path):
    with open(path, encoding="utf-8") as f:
        raw = json.load(f)

    d = raw["design"]

    area = float(d["area"])
    seq = float(d.get("sequential_area", 0.0))

    return {
        "area": area,
        "sequential": seq,
        "combinational": area - seq,
        "num_cells": int(d.get("num_cells", 0)),
        "cell_types": {
            k: int(v)
            for k, v in d.get(
                "num_cells_by_type",
                {}
            ).items()
        },
    }


def parse_liberty_areas(path):
    text = Path(path).read_text(
        encoding="utf-8",
        errors="ignore"
    )

    result = {}

    pattern = re.compile(
        r"\bcell\s*\(\s*([^)]+?)\s*\)\s*\{"
    )

    for match in pattern.finditer(text):
        name = match.group(1).strip().strip('"')

        brace_start = text.find(
            "{",
            match.start()
        )

        depth = 0
        end = None

        for i in range(
            brace_start,
            len(text)
        ):
            if text[i] == "{":
                depth += 1
            elif text[i] == "}":
                depth -= 1

                if depth == 0:
                    end = i
                    break

        if end is None:
            continue

        block = text[
            brace_start + 1:end
        ]

        area_match = re.search(
            r"(?m)^\s*area\s*:\s*"
            r"([0-9eE+.\-]+)\s*;",
            block,
        )

        if area_match:
            result[name] = float(
                area_match.group(1)
            )

    return result


def pct(delta, base):
    if base == 0:
        return 0.0

    return delta / base * 100.0


def markdown_table(headers, rows):
    lines = []

    lines.append(
        "| " + " | ".join(headers) + " |"
    )

    lines.append(
        "|"
        + "|".join(
            ["---"] * len(headers)
        )
        + "|"
    )

    for row in rows:
        lines.append(
            "| "
            + " | ".join(
                str(x) for x in row
            )
            + " |"
        )

    return "\n".join(lines)


def main():
    if len(sys.argv) != 2:
        print(
            "Usage: "
            "generate_area_analysis_tables.py "
            "<case_name>"
        )
        sys.exit(1)

    case_name = sys.argv[1]

    repo = Path(
        __file__
    ).resolve().parents[3]

    liberty = (
        repo
        / "partition-incremental"
        / "area-analysis"
        / "lib"
        / "NangateOpenCellLibrary_typical.lib"
    )

    area_root = (
        repo
        / "results"
        / "partition-incremental"
        / case_name
        / "area-analysis"
        / "liberty-area"
    )

    full_stat = (
        area_root
        / "full-mapped"
        / "stat.json"
    )

    inc_stat = (
        area_root
        / "incremental-mapped"
        / "linked"
        / "stat.json"
    )

    global_stat = (
        area_root
        / "global-reopt-mapped"
        / "stat.json"
    )

    for path in [
        liberty,
        full_stat,
        inc_stat,
        global_stat,
    ]:
        if not path.exists():
            raise FileNotFoundError(path)

    full = load_design(full_stat)
    inc = load_design(inc_stat)
    glob = load_design(global_stat)

    cell_area = parse_liberty_areas(
        liberty
    )

    out = area_root / "tables"
    out.mkdir(
        parents=True,
        exist_ok=True
    )

    # ========================================================
    # Table 1
    # Cell type differences
    # ========================================================

    cell_rows = []

    all_cells = set(
        full["cell_types"]
    ) | set(
        inc["cell_types"]
    )

    for cell in all_cells:
        f_count = full[
            "cell_types"
        ].get(cell, 0)

        i_count = inc[
            "cell_types"
        ].get(cell, 0)

        delta_count = (
            i_count - f_count
        )

        unit_area = cell_area.get(
            cell
        )

        if unit_area is None:
            continue

        f_area = (
            f_count * unit_area
        )

        i_area = (
            i_count * unit_area
        )

        delta_area = (
            i_area - f_area
        )

        cell_rows.append(
            [
                cell,
                f_count,
                i_count,
                delta_count,
                unit_area,
                f_area,
                i_area,
                delta_area,
            ]
        )

    cell_rows.sort(
        key=lambda x: abs(x[7]),
        reverse=True,
    )

    with open(
        out / "table1_cell_type_area.csv",
        "w",
        newline="",
        encoding="utf-8",
    ) as f:
        writer = csv.writer(f)

        writer.writerow(
            [
                "Cell type",
                "Full count",
                "Incremental count",
                "Count delta",
                "Unit area",
                "Full area",
                "Incremental area",
                "Area delta",
            ]
        )

        writer.writerows(
            cell_rows
        )

    # ========================================================
    # Table 2
    # Comb / sequential area
    # ========================================================

    breakdown_rows = [
        [
            "Combinational",
            full["combinational"],
            inc["combinational"],
            (
                inc["combinational"]
                - full["combinational"]
            ),
            pct(
                inc["combinational"]
                - full["combinational"],
                full["combinational"],
            ),
        ],
        [
            "Sequential",
            full["sequential"],
            inc["sequential"],
            (
                inc["sequential"]
                - full["sequential"]
            ),
            pct(
                inc["sequential"]
                - full["sequential"],
                full["sequential"],
            ),
        ],
        [
            "Total",
            full["area"],
            inc["area"],
            inc["area"] - full["area"],
            pct(
                inc["area"]
                - full["area"],
                full["area"],
            ),
        ],
    ]

    with open(
        out / "table2_comb_seq.csv",
        "w",
        newline="",
        encoding="utf-8",
    ) as f:
        writer = csv.writer(f)

        writer.writerow(
            [
                "Category",
                "Full",
                "Incremental",
                "Delta",
                "Delta percent",
            ]
        )

        writer.writerows(
            breakdown_rows
        )

    # ========================================================
    # Table 3
    # Full vs incremental vs global re-opt
    # ========================================================

    methods = [
        ("Full", full),
        ("Incremental", inc),
        (
            "Incremental + global re-opt",
            glob,
        ),
    ]

    method_rows = []

    for name, data in methods:
        delta = (
            data["area"]
            - full["area"]
        )

        overhead = pct(
            delta,
            full["area"],
        )

        method_rows.append(
            [
                name,
                data["area"],
                delta,
                overhead,
                data["num_cells"],
            ]
        )

    with open(
        out / "table3_global_reopt.csv",
        "w",
        newline="",
        encoding="utf-8",
    ) as f:
        writer = csv.writer(f)

        writer.writerow(
            [
                "Method",
                "Area",
                "Delta vs Full",
                "Overhead percent",
                "Num cells",
            ]
        )

        writer.writerows(
            method_rows
        )

    # ========================================================
    # Markdown output
    # ========================================================

    md = []

    md.append(
        "# Area overhead analysis"
    )

    md.append("")
    md.append(
        "## Table 1. Cell-type area contribution"
    )
    md.append("")

    table1_md = []

    for row in cell_rows:
        table1_md.append(
            [
                row[0],
                row[1],
                row[2],
                f"{row[3]:+d}",
                f"{row[4]:.3f}",
                f"{row[7]:+.3f}",
            ]
        )

    md.append(
        markdown_table(
            [
                "Cell",
                "Full",
                "Incremental",
                "Count Δ",
                "Unit area",
                "Area Δ",
            ],
            table1_md,
        )
    )

    md.append("")
    md.append(
        "## Table 2. Combinational and sequential area"
    )
    md.append("")

    table2_md = []

    for row in breakdown_rows:
        table2_md.append(
            [
                row[0],
                f"{row[1]:.3f}",
                f"{row[2]:.3f}",
                f"{row[3]:+.3f}",
                f"{row[4]:+.3f}%",
            ]
        )

    md.append(
        markdown_table(
            [
                "Category",
                "Full",
                "Incremental",
                "Δ",
                "Δ %",
            ],
            table2_md,
        )
    )

    md.append("")
    md.append(
        "## Table 3. Global re-optimization diagnosis"
    )
    md.append("")

    table3_md = []

    for row in method_rows:
        table3_md.append(
            [
                row[0],
                f"{row[1]:.3f}",
                f"{row[2]:+.3f}",
                f"{row[3]:+.3f}%",
                row[4],
            ]
        )

    md.append(
        markdown_table(
            [
                "Method",
                "Area",
                "Δ vs Full",
                "Overhead",
                "Cells",
            ],
            table3_md,
        )
    )

    original_overhead = (
        inc["area"]
        - full["area"]
    )

    if original_overhead != 0:
        recovered = (
            inc["area"]
            - glob["area"]
        ) / original_overhead * 100

        md.append("")
        md.append(
            "Recovered original area overhead: "
            f"**{recovered:.2f}%**"
        )

    output_md = (
        out / "area_analysis_tables.md"
    )

    output_md.write_text(
        "\n".join(md) + "\n",
        encoding="utf-8",
    )

    print(
        f"Generated: {out}"
    )

    print(
        f"Markdown: {output_md}"
    )


if __name__ == "__main__":
    main()