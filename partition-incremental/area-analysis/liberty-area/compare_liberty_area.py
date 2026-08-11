#!/usr/bin/env python3

import argparse
import hashlib
import json
from pathlib import Path


def load_stat(path: Path):
    with path.open(encoding="utf-8") as f:
        data = json.load(f)

    design = data.get("design")

    if not isinstance(design, dict):
        raise RuntimeError(
            f"'design' statistics not found in {path}"
        )

    if "area" not in design:
        raise RuntimeError(
            f"Area not found in {path}. "
            "The design may contain no mapped cells "
            "or area extraction may have failed."
        )

    return data, design


def sha256(path: Path):
    digest = hashlib.sha256()

    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)

    return digest.hexdigest()


def percent(delta, base):
    if base == 0:
        return None

    return delta / base * 100.0


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("full_stat_json", type=Path)
    parser.add_argument("incremental_stat_json", type=Path)
    parser.add_argument("liberty_file", type=Path)
    parser.add_argument("output_json", type=Path)

    args = parser.parse_args()

    full_raw, full = load_stat(args.full_stat_json)
    incremental_raw, incremental = load_stat(
        args.incremental_stat_json
    )

    full_area = float(full["area"])
    incremental_area = float(incremental["area"])

    full_seq = float(full.get("sequential_area", 0.0))
    incremental_seq = float(
        incremental.get("sequential_area", 0.0)
    )

    full_comb = full_area - full_seq
    incremental_comb = incremental_area - incremental_seq

    delta_area = incremental_area - full_area
    overhead = percent(delta_area, full_area)

    ratio = (
        incremental_area / full_area
        if full_area != 0
        else None
    )

    summary = {
        "metric": "liberty_mapped_cell_area",
        "liberty_file": str(args.liberty_file.resolve()),
        "liberty_sha256": sha256(args.liberty_file),

        "full": {
            "area": full_area,
            "sequential_area": full_seq,
            "combinational_area": full_comb,
            "num_cells": full.get("num_cells"),
            "cell_types": full.get(
                "num_cells_by_type",
                {},
            ),
        },

        "incremental": {
            "area": incremental_area,
            "sequential_area": incremental_seq,
            "combinational_area": incremental_comb,
            "num_cells": incremental.get("num_cells"),
            "cell_types": incremental.get(
                "num_cells_by_type",
                {},
            ),
        },

        "comparison": {
            "delta_area": delta_area,
            "area_overhead_percent": overhead,
            "incremental_to_full_ratio": ratio,
        },

        "yosys": {
            "full_creator": full_raw.get("creator"),
            "incremental_creator": incremental_raw.get(
                "creator"
            ),
        },

        "note": (
            "Area is the sum of standard-cell areas "
            "reported from the selected Liberty library. "
            "This is post-synthesis mapped cell area, "
            "not final placed-and-routed chip area."
        ),
    }

    args.output_json.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    with args.output_json.open(
        "w",
        encoding="utf-8",
    ) as f:
        json.dump(
            summary,
            f,
            indent=2,
            ensure_ascii=False,
        )
        f.write("\n")

    print()
    print("============================================================")
    print("Liberty mapped area comparison")
    print("============================================================")

    print(f"Full area          : {full_area:.6f}")
    print(
        f"Incremental area   : "
        f"{incremental_area:.6f}"
    )
    print(f"Delta area         : {delta_area:+.6f}")

    if overhead is not None:
        print(
            f"Area overhead      : "
            f"{overhead:+.3f}%"
        )

    if ratio is not None:
        print(
            f"Incremental / Full : "
            f"{ratio:.6f}x"
        )

    print()
    print("Breakdown:")
    print(
        f"Full combinational : "
        f"{full_comb:.6f}"
    )
    print(
        f"Full sequential    : "
        f"{full_seq:.6f}"
    )
    print(
        f"Incr combinational : "
        f"{incremental_comb:.6f}"
    )
    print(
        f"Incr sequential    : "
        f"{incremental_seq:.6f}"
    )

    print()
    print(f"Generated: {args.output_json}")


if __name__ == "__main__":
    main()