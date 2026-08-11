#!/usr/bin/env python3

import argparse
import csv
import json
from collections import Counter
from pathlib import Path


def load_cell_counts(json_path: Path, top_module: str):
    with json_path.open(encoding="utf-8") as f:
        design = json.load(f)

    modules = design.get("modules", {})

    if top_module not in modules:
        raise RuntimeError(
            f"Top module '{top_module}' not found in {json_path}"
        )

    top = modules[top_module]
    cells = top.get("cells", {})

    counts = Counter(
        cell["type"]
        for cell in cells.values()
    )

    # Sanity check:
    # after flattening there should not be remaining module instances.
    remaining_hierarchical_types = sorted(
        cell_type
        for cell_type in counts
        if cell_type in modules and cell_type != top_module
    )

    if remaining_hierarchical_types:
        raise RuntimeError(
            "Hierarchy is not fully flattened. "
            "Remaining module cell types: "
            + ", ".join(remaining_hierarchical_types)
        )

    return counts


def percentage(delta, base):
    if base == 0:
        return None
    return delta / base * 100.0


def main():
    parser = argparse.ArgumentParser(
        description="Compare cell counts of full and incremental netlists."
    )

    parser.add_argument("full_json", type=Path)
    parser.add_argument("incremental_json", type=Path)
    parser.add_argument("top_module")
    parser.add_argument("output_dir", type=Path)

    args = parser.parse_args()

    args.output_dir.mkdir(parents=True, exist_ok=True)

    full_counts = load_cell_counts(
        args.full_json,
        args.top_module,
    )

    incremental_counts = load_cell_counts(
        args.incremental_json,
        args.top_module,
    )

    full_total = sum(full_counts.values())
    incremental_total = sum(incremental_counts.values())

    delta_total = incremental_total - full_total

    overhead_percent = percentage(
        delta_total,
        full_total,
    )

    ratio = (
        incremental_total / full_total
        if full_total != 0
        else None
    )

    all_types = sorted(
        set(full_counts) | set(incremental_counts)
    )

    type_rows = []

    for cell_type in all_types:
        full = full_counts.get(cell_type, 0)
        incremental = incremental_counts.get(cell_type, 0)

        delta = incremental - full

        type_rows.append(
            {
                "cell_type": cell_type,
                "full_count": full,
                "incremental_count": incremental,
                "delta": delta,
                "delta_percent": percentage(delta, full),
            }
        )

    summary = {
        "metric": "generic_cell_count_area_proxy",
        "top_module": args.top_module,
        "full_total_cells": full_total,
        "incremental_total_cells": incremental_total,
        "delta_cells": delta_total,
        "cell_overhead_percent": overhead_percent,
        "incremental_to_full_ratio": ratio,
        "note": (
            "This is a logic-size proxy based on generic synthesized "
            "cell counts, not physical silicon area."
        ),
        "cell_types": type_rows,
    }

    summary_path = args.output_dir / "summary.json"

    with summary_path.open("w", encoding="utf-8") as f:
        json.dump(
            summary,
            f,
            indent=2,
            ensure_ascii=False,
        )
        f.write("\n")

    csv_path = args.output_dir / "cell_types.csv"

    with csv_path.open(
        "w",
        newline="",
        encoding="utf-8",
    ) as f:
        writer = csv.DictWriter(
            f,
            fieldnames=[
                "cell_type",
                "full_count",
                "incremental_count",
                "delta",
                "delta_percent",
            ],
        )

        writer.writeheader()
        writer.writerows(type_rows)

    print()
    print("============================================================")
    print("Cell-count area proxy comparison")
    print("============================================================")
    print(f"Top module              : {args.top_module}")
    print(f"Full total cells        : {full_total}")
    print(f"Incremental total cells : {incremental_total}")
    print(f"Delta cells             : {delta_total:+d}")

    if overhead_percent is not None:
        print(
            f"Cell overhead           : "
            f"{overhead_percent:+.2f}%"
        )

    if ratio is not None:
        print(
            f"Incremental / Full      : "
            f"{ratio:.4f}x"
        )

    print()
    print("Cell type breakdown:")
    print()

    header = (
        f"{'Cell type':<28}"
        f"{'Full':>10}"
        f"{'Incremental':>14}"
        f"{'Delta':>10}"
    )

    print(header)
    print("-" * len(header))

    for row in sorted(
        type_rows,
        key=lambda x: abs(x["delta"]),
        reverse=True,
    ):
        print(
            f"{row['cell_type']:<28}"
            f"{row['full_count']:>10}"
            f"{row['incremental_count']:>14}"
            f"{row['delta']:>+10}"
        )

    print()
    print("Generated:")
    print(f"  {summary_path}")
    print(f"  {csv_path}")


if __name__ == "__main__":
    main()