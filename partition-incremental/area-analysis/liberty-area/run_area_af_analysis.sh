#!/usr/bin/env bash

set -euo pipefail

# ============================================================
# A-F area overhead diagnosis
#
# A Full
# B Incremental
# C Incremental + global mapping
# D Incremental + global resynth + global mapping
# E Full resynth control
# F Pre-synth linked + global synth + global mapping
#
# Default:
#   case = cv32e40p-eco-001
#   new  = benchmarks/cv32e40p-eco-001-new
#
# Usage:
#   ./run_area_af_analysis.sh
#
# Or:
#   ./run_area_af_analysis.sh <case_name> [new_source_dir] [liberty_file]
# ============================================================


REPO_ROOT="$(git rev-parse --show-toplevel)"

CASE_NAME="${1:-cv32e40p-eco-001}"

NEW_SOURCE_DIR="$(
    realpath "${2:-$REPO_ROOT/benchmarks/${CASE_NAME}-new}"
)"

DEFAULT_LIB="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"

LIBERTY_FILE="$(
    realpath "${3:-$DEFAULT_LIB}"
)"

SCRIPT_DIR="$REPO_ROOT/partition-incremental/area-analysis/liberty-area"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
AREA_ROOT="$CASE_OUT/area-analysis/liberty-area"


# ------------------------------------------------------------
# Existing experiment scripts
# ------------------------------------------------------------

RUN_AB="$SCRIPT_DIR/run_liberty_area_comparison.sh"

RUN_C="$SCRIPT_DIR/run_global_reopt_area.sh"

RUN_D="$SCRIPT_DIR/run_global_resynth_area.sh"

RUN_E="$SCRIPT_DIR/run_full_resynth_control.sh"

RUN_F="$SCRIPT_DIR/run_presynth_linked_area.sh"


# ------------------------------------------------------------
# Basic checks
# ------------------------------------------------------------

for command in \
    git \
    jq \
    yosys \
    python3
do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "ERROR: required command not found:"
        echo "  $command"
        exit 1
    fi
done


for path in \
    "$NEW_SOURCE_DIR" \
    "$LIBERTY_FILE" \
    "$RUN_AB" \
    "$RUN_C" \
    "$RUN_D" \
    "$RUN_E" \
    "$RUN_F"
do
    if [[ ! -e "$path" ]]; then
        echo
        echo "ERROR: required path does not exist:"
        echo "  $path"
        echo
        exit 1
    fi
done


echo
echo "============================================================"
echo "A-F Area Overhead Diagnosis"
echo "============================================================"
echo
echo "Case       : $CASE_NAME"
echo "New source : $NEW_SOURCE_DIR"
echo "Liberty    : $LIBERTY_FILE"
echo


# ============================================================
# A + B
#
# A = Full
# B = Incremental
#
# IMPORTANT:
# run_liberty_area_comparison.sh removes AREA_ROOT first.
# Therefore A/B must always run before C-F.
# ============================================================

echo
echo "============================================================"
echo "[A+B] Full vs Incremental"
echo "============================================================"
echo

bash "$RUN_AB" \
    "$CASE_NAME" \
    "$NEW_SOURCE_DIR" \
    "$LIBERTY_FILE"


# ============================================================
# C
# ============================================================

echo
echo "============================================================"
echo "[C] Incremental + global mapping"
echo "============================================================"
echo

bash "$RUN_C" \
    "$CASE_NAME" \
    "$LIBERTY_FILE"


# ============================================================
# D
# ============================================================

echo
echo "============================================================"
echo "[D] Incremental + global resynth + global mapping"
echo "============================================================"
echo

bash "$RUN_D" \
    "$CASE_NAME" \
    "$LIBERTY_FILE"


# ============================================================
# E
#
# The current control script uses the default Nangate45
# library internally, so only the case name is passed.
# ============================================================

echo
echo "============================================================"
echo "[E] Full resynth control"
echo "============================================================"
echo

bash "$RUN_E" \
    "$CASE_NAME"


# ============================================================
# F
# ============================================================

echo
echo "============================================================"
echo "[F] Pre-synth linked + global synth + global mapping"
echo "============================================================"
echo

bash "$RUN_F" \
    "$CASE_NAME" \
    "$LIBERTY_FILE"


# ============================================================
# Validate A-F outputs
# ============================================================

A_STAT="$AREA_ROOT/full-mapped/stat.json"

B_STAT="$AREA_ROOT/incremental-mapped/linked/stat.json"

C_STAT="$AREA_ROOT/global-reopt-mapped/stat.json"

D_STAT="$AREA_ROOT/global-resynth-mapped/stat.json"

E_STAT="$AREA_ROOT/full-resynth-control/stat.json"

F_STAT="$AREA_ROOT/presynth-linked-mapped/stat.json"


for path in \
    "$A_STAT" \
    "$B_STAT" \
    "$C_STAT" \
    "$D_STAT" \
    "$E_STAT" \
    "$F_STAT"
do
    if [[ ! -f "$path" ]]; then
        echo
        echo "ERROR: expected A-F result missing:"
        echo "  $path"
        exit 1
    fi
done


# ============================================================
# Generate final report
# ============================================================

REPORT_DIR="$AREA_ROOT/af-summary"

rm -rf "$REPORT_DIR"
mkdir -p "$REPORT_DIR"


python3 - \
    "$CASE_NAME" \
    "$REPORT_DIR" \
    "$A_STAT" \
    "$B_STAT" \
    "$C_STAT" \
    "$D_STAT" \
    "$E_STAT" \
    "$F_STAT" <<'PY'

import csv
import html
import json
import math
import sys
from pathlib import Path


case_name = sys.argv[1]
out_dir = Path(sys.argv[2])

stat_paths = {
    "A": Path(sys.argv[3]),
    "B": Path(sys.argv[4]),
    "C": Path(sys.argv[5]),
    "D": Path(sys.argv[6]),
    "E": Path(sys.argv[7]),
    "F": Path(sys.argv[8]),
}


methods = {
    "A": "Full",
    "B": "Incremental",
    "C": "Incremental + global mapping",
    "D": "Incremental + global resynth + mapping",
    "E": "Full resynth control",
    "F": "Pre-synth linked + global synth + mapping",
}


def load_stat(path):
    with path.open(encoding="utf-8") as f:
        raw = json.load(f)

    design = raw.get("design")

    if not isinstance(design, dict):
        raise RuntimeError(
            f"'design' missing in {path}"
        )

    total = float(design["area"])

    seq = float(
        design.get(
            "sequential_area",
            0.0,
        )
    )

    comb = total - seq

    cells = int(
        design.get(
            "num_cells",
            0,
        )
    )

    return {
        "area": total,
        "comb": comb,
        "seq": seq,
        "cells": cells,
    }


data = {
    key: load_stat(path)
    for key, path in stat_paths.items()
}


full_area = data["A"]["area"]
incremental_area = data["B"]["area"]

original_overhead = (
    incremental_area - full_area
)


def percent(delta, base):
    if base == 0:
        return 0.0

    return delta / base * 100.0


rows = []

for key in ["A", "B", "C", "D", "E", "F"]:

    d = data[key]

    delta = d["area"] - full_area

    overhead = percent(
        delta,
        full_area,
    )

    if key == "B":
        recovery = 0.0

    elif key in {"C", "D", "F"}:
        if original_overhead == 0:
            recovery = 0.0
        else:
            recovery = (
                incremental_area
                - d["area"]
            ) / original_overhead * 100.0

    else:
        recovery = None

    rows.append(
        {
            "id": key,
            "method": methods[key],
            "area": d["area"],
            "delta": delta,
            "overhead": overhead,
            "comb": d["comb"],
            "seq": d["seq"],
            "cells": d["cells"],
            "recovery": recovery,
        }
    )


# ============================================================
# CSV
# ============================================================

csv_path = (
    out_dir
    / "area_af_summary.csv"
)

with csv_path.open(
    "w",
    newline="",
    encoding="utf-8",
) as f:

    writer = csv.writer(f)

    writer.writerow(
        [
            "ID",
            "Method",
            "Area",
            "Delta vs A",
            "Overhead vs A (%)",
            "Combinational area",
            "Sequential area",
            "Num cells",
            "Recovered original overhead (%)",
        ]
    )

    for row in rows:

        recovery = (
            ""
            if row["recovery"] is None
            else f"{row['recovery']:.3f}"
        )

        writer.writerow(
            [
                row["id"],
                row["method"],
                f"{row['area']:.3f}",
                f"{row['delta']:+.3f}",
                f"{row['overhead']:+.3f}",
                f"{row['comb']:.3f}",
                f"{row['seq']:.3f}",
                row["cells"],
                recovery,
            ]
        )


# ============================================================
# JSON
# ============================================================

json_path = (
    out_dir
    / "area_af_summary.json"
)

json_path.write_text(
    json.dumps(
        {
            "case": case_name,
            "full_area": full_area,
            "incremental_area": incremental_area,
            "original_area_overhead":
                original_overhead,
            "original_area_overhead_percent":
                percent(
                    original_overhead,
                    full_area,
                ),
            "results": rows,
        },
        indent=2,
        ensure_ascii=False,
    )
    + "\n",
    encoding="utf-8",
)


# ============================================================
# Markdown table
# ============================================================

md_path = (
    out_dir
    / "area_af_summary.md"
)

md = []

md.append(
    f"# A-F Area Overhead Analysis: {case_name}"
)

md.append("")

md.append(
    "| ID | Method | Area | Δ vs A | "
    "Overhead | Comb | Seq | Cells | Recovery |"
)

md.append(
    "|---|---|---:|---:|---:|---:|---:|---:|---:|"
)

for row in rows:

    if row["recovery"] is None:
        recovery = "—"
    else:
        recovery = (
            f"{row['recovery']:.2f}%"
        )

    md.append(
        "| "
        f"{row['id']} | "
        f"{row['method']} | "
        f"{row['area']:.3f} | "
        f"{row['delta']:+.3f} | "
        f"{row['overhead']:+.3f}% | "
        f"{row['comb']:.3f} | "
        f"{row['seq']:.3f} | "
        f"{row['cells']} | "
        f"{recovery} |"
    )


md.append("")
md.append("## Experiment meanings")
md.append("")

md.append(
    "- **A**: Full synthesis baseline."
)

md.append(
    "- **B**: Partition incremental synthesis."
)

md.append(
    "- **C**: B with partition mapping boundaries removed "
    "before global technology mapping."
)

md.append(
    "- **D**: Synthesized partitions are linked, flattened, "
    "globally re-synthesized, then globally mapped."
)

md.append(
    "- **E**: Full design is synthesized for a second time; "
    "this is a control, not a recovery stage."
)

md.append(
    "- **F**: Partitions are linked before independent "
    "generic synthesis, followed by one global synthesis "
    "and one global mapping."
)

md.append("")

md.append(
    "The recovery trend should therefore be interpreted as "
    "**B → C → D → F**. "
    "A is the baseline and E is the full-resynthesis control."
)

md_path.write_text(
    "\n".join(md) + "\n",
    encoding="utf-8",
)


# ============================================================
# SVG recovery trend
#
# Important:
# E is NOT connected into the recovery curve because it is
# only a control experiment.
#
# Curve:
# B -> C -> D -> F
#
# A = 0% baseline
# E = control reference
# ============================================================

trend_ids = [
    "B",
    "C",
    "D",
    "F",
]

trend_rows = {
    row["id"]: row
    for row in rows
}

trend_values = [
    trend_rows[k]["overhead"]
    for k in trend_ids
]

e_overhead = trend_rows["E"]["overhead"]


width = 1000
height = 620

left = 100
right = 60
top = 70
bottom = 130

plot_w = (
    width - left - right
)

plot_h = (
    height - top - bottom
)


max_value = max(
    max(trend_values),
    abs(e_overhead),
    0.5,
)

y_max = (
    math.ceil(
        (max_value + 0.4) * 2
    )
    / 2
)

if y_max <= 0:
    y_max = 1.0


def x_pos(index):
    if len(trend_ids) == 1:
        return left + plot_w / 2

    return (
        left
        + index
        * plot_w
        / (len(trend_ids) - 1)
    )


def y_pos(value):
    return (
        top
        + plot_h
        * (y_max - value)
        / y_max
    )


svg = []

svg.append(
    f'<svg xmlns="http://www.w3.org/2000/svg" '
    f'width="{width}" height="{height}" '
    f'viewBox="0 0 {width} {height}">'
)

svg.append(
    '<rect width="100%" height="100%" fill="white"/>'
)

svg.append(
    '<text x="500" y="34" '
    'text-anchor="middle" '
    'font-family="sans-serif" '
    'font-size="22" '
    'font-weight="bold">'
    'Area Overhead Recovery Trend'
    '</text>'
)

svg.append(
    '<text x="500" y="57" '
    'text-anchor="middle" '
    'font-family="sans-serif" '
    'font-size="13">'
    + html.escape(case_name)
    + '</text>'
)


# grid

tick_step = 0.5

tick = 0.0

while tick <= y_max + 1e-9:

    y = y_pos(tick)

    svg.append(
        f'<line x1="{left}" '
        f'y1="{y:.2f}" '
        f'x2="{width-right}" '
        f'y2="{y:.2f}" '
        'stroke="#dddddd" '
        'stroke-width="1"/>'
    )

    svg.append(
        f'<text x="{left-12}" '
        f'y="{y+5:.2f}" '
        'text-anchor="end" '
        'font-family="sans-serif" '
        'font-size="12">'
        f'{tick:.1f}%'
        '</text>'
    )

    tick += tick_step


# axes

svg.append(
    f'<line x1="{left}" y1="{top}" '
    f'x2="{left}" y2="{top+plot_h}" '
    'stroke="black" stroke-width="1.5"/>'
)

svg.append(
    f'<line x1="{left}" '
    f'y1="{top+plot_h}" '
    f'x2="{width-right}" '
    f'y2="{top+plot_h}" '
    'stroke="black" stroke-width="1.5"/>'
)


# A baseline = 0%

baseline_y = y_pos(0)

svg.append(
    f'<line x1="{left}" '
    f'y1="{baseline_y:.2f}" '
    f'x2="{width-right}" '
    f'y2="{baseline_y:.2f}" '
    'stroke="black" '
    'stroke-width="2"/>'
)

svg.append(
    f'<text x="{width-right}" '
    f'y="{baseline_y-8:.2f}" '
    'text-anchor="end" '
    'font-family="sans-serif" '
    'font-size="12">'
    'A Full baseline'
    '</text>'
)


# E control reference

e_y = y_pos(
    max(e_overhead, 0)
)

svg.append(
    f'<line x1="{left}" '
    f'y1="{e_y:.2f}" '
    f'x2="{width-right}" '
    f'y2="{e_y:.2f}" '
    'stroke="#777777" '
    'stroke-width="1.5" '
    'stroke-dasharray="8,6"/>'
)

svg.append(
    f'<text x="{width-right}" '
    f'y="{e_y-8:.2f}" '
    'text-anchor="end" '
    'font-family="sans-serif" '
    'font-size="12">'
    f'E control: {e_overhead:+.3f}%'
    '</text>'
)


# recovery curve

points = []

for i, key in enumerate(
    trend_ids
):
    value = trend_rows[key]["overhead"]

    points.append(
        f"{x_pos(i):.2f},"
        f"{y_pos(value):.2f}"
    )

svg.append(
    '<polyline '
    f'points="{" ".join(points)}" '
    'fill="none" '
    'stroke="#2563eb" '
    'stroke-width="3"/>'
)


short_labels = {
    "B": "Incremental",
    "C": "Global map",
    "D": "Global resynth",
    "F": "Pre-synth link",
}


for i, key in enumerate(
    trend_ids
):

    row = trend_rows[key]

    x = x_pos(i)
    y = y_pos(
        row["overhead"]
    )

    svg.append(
        f'<circle cx="{x:.2f}" '
        f'cy="{y:.2f}" '
        'r="6" '
        'fill="#2563eb"/>'
    )

    svg.append(
        f'<text x="{x:.2f}" '
        f'y="{y-14:.2f}" '
        'text-anchor="middle" '
        'font-family="sans-serif" '
        'font-size="13" '
        'font-weight="bold">'
        f'{row["overhead"]:+.3f}%'
        '</text>'
    )

    svg.append(
        f'<text x="{x:.2f}" '
        f'y="{top+plot_h+28}" '
        'text-anchor="middle" '
        'font-family="sans-serif" '
        'font-size="14" '
        'font-weight="bold">'
        f'{key}'
        '</text>'
    )

    svg.append(
        f'<text x="{x:.2f}" '
        f'y="{top+plot_h+48}" '
        'text-anchor="middle" '
        'font-family="sans-serif" '
        'font-size="12">'
        + html.escape(
            short_labels[key]
        )
        + '</text>'
    )


# y label

svg.append(
    '<text x="24" y="290" '
    'text-anchor="middle" '
    'font-family="sans-serif" '
    'font-size="14" '
    'transform="rotate(-90 24 290)">'
    'Area overhead vs Full (%)'
    '</text>'
)


# explanatory footer

svg.append(
    f'<text x="{left}" y="{height-35}" '
    'font-family="sans-serif" '
    'font-size="12">'
    'Recovery path: B → C → D → F. '
    'E is shown only as a Full-resynthesis control.'
    '</text>'
)

svg.append('</svg>')


svg_path = (
    out_dir
    / "area_recovery_trend.svg"
)

svg_path.write_text(
    "\n".join(svg),
    encoding="utf-8",
)


# ============================================================
# Terminal output
# ============================================================

print()
print("=" * 108)

print(
    f"{'ID':<4}"
    f"{'Method':<45}"
    f"{'Area':>13}"
    f"{'vs A':>13}"
    f"{'Overhead':>12}"
    f"{'Recovery':>12}"
)

print("=" * 108)


for row in rows:

    if row["recovery"] is None:
        recovery = "-"

    else:
        recovery = (
            f"{row['recovery']:.2f}%"
        )

    print(
        f"{row['id']:<4}"
        f"{row['method']:<45}"
        f"{row['area']:>13.3f}"
        f"{row['delta']:>+13.3f}"
        f"{row['overhead']:>+11.3f}%"
        f"{recovery:>12}"
    )


print("=" * 108)

print()

print(
    "Original Incremental overhead: "
    f"{original_overhead:+.3f} "
    f"({percent(original_overhead, full_area):+.3f}%)"
)

print()

print("Generated:")

for path in [
    csv_path,
    json_path,
    md_path,
    svg_path,
]:
    print(f"  {path}")

PY


echo
echo "============================================================"
echo "A-F experiment completed"
echo "============================================================"
echo
echo "Final report:"
echo "  $REPORT_DIR/area_af_summary.csv"
echo "  $REPORT_DIR/area_af_summary.json"
echo "  $REPORT_DIR/area_af_summary.md"
echo "  $REPORT_DIR/area_recovery_trend.svg"
echo