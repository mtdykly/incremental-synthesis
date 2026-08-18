#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> [liberty_file]"
    echo
    echo "Example:"
    echo "  $0 cv32e40p-eco-001"
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"

REPO_ROOT="$(git rev-parse --show-toplevel)"

DEFAULT_LIB="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"
LIBERTY_FILE="$(realpath "${2:-$DEFAULT_LIB}")"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

MANIFEST="$CASE_OUT/new/partition_manifest.json"
LINKED_GENERIC="$CASE_OUT/incremental/linked/linked.json"

AREA_OUT="$CASE_OUT/area-analysis/liberty-area"

FULL_STAT="$AREA_OUT/full-mapped/stat.json"
INCREMENTAL_STAT="$AREA_OUT/incremental-mapped/linked/stat.json"

GLOBAL_OUT="$AREA_OUT/global-reopt-mapped"

MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/measure_mapped_design.sh"
LATCH_MAP="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/nangate45_latch_map.v"

for required in \
    "$MANIFEST" \
    "$LINKED_GENERIC" \
    "$LIBERTY_FILE" \
    "$FULL_STAT" \
    "$INCREMENTAL_STAT" \
    "$MEASURE" \
    "$LATCH_MAP"
do
    if [[ ! -e "$required" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required"
        exit 1
    fi
done

TOP_MODULE="$(jq -r '.top.module_name' "$MANIFEST")"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing from manifest"
    exit 1
fi

rm -rf "$GLOBAL_OUT"
mkdir -p "$GLOBAL_OUT"

RUN_SCRIPT="$GLOBAL_OUT/run_global_reopt.ys"
LOG_FILE="$GLOBAL_OUT/yosys.log"
TIME_FILE="$GLOBAL_OUT/time.txt"

cat > "$RUN_SCRIPT" <<YOSYS
read_json "$LINKED_GENERIC"

hierarchy -check -top $TOP_MODULE

# Remove partition hierarchy before technology mapping.
# This is the key difference from normal incremental mapping.
flatten -noscopeinfo

# Only clean the flattened generic design here.
opt_clean -purge

# Perform one global technology mapping.
dfflibmap -liberty "$LIBERTY_FILE"
abc -liberty "$LIBERTY_FILE"

# Keep the same latch mapping used by the existing Liberty-area flow.
techmap -map "$LATCH_MAP"

opt_clean -purge

write_json "$GLOBAL_OUT/mapped.json"

write_verilog -noattr -noexpr -nodec \
    "$GLOBAL_OUT/mapped_netlist.v"
YOSYS

echo
echo "============================================================"
echo "Global re-optimization"
echo "============================================================"
echo "Case : $CASE_NAME"
echo "Top  : $TOP_MODULE"
echo

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

echo
echo "============================================================"
echo "Measure globally re-optimized design"
echo "============================================================"

"$MEASURE" \
    "$GLOBAL_OUT/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$GLOBAL_OUT"

echo
echo "============================================================"
echo "Three-way area comparison"
echo "============================================================"

python3 - \
    "$FULL_STAT" \
    "$INCREMENTAL_STAT" \
    "$GLOBAL_OUT/stat.json" <<'PY'
import json
import sys

def load(path):
    with open(path, encoding="utf-8") as f:
        data = json.load(f)["design"]

    area = float(data["area"])
    seq = float(data.get("sequential_area", 0.0))
    comb = area - seq

    return {
        "area": area,
        "seq": seq,
        "comb": comb,
        "cells": data.get("num_cells"),
    }

full = load(sys.argv[1])
inc = load(sys.argv[2])
glob = load(sys.argv[3])

def overhead(area):
    return (area - full["area"]) / full["area"] * 100.0

print()
print(f"{'Method':<30} {'Area':>15} {'vs Full':>12}")
print("-" * 60)

print(
    f"{'Full':<30} "
    f"{full['area']:>15.3f} "
    f"{0.0:>+11.3f}%"
)

print(
    f"{'Incremental':<30} "
    f"{inc['area']:>15.3f} "
    f"{overhead(inc['area']):>+11.3f}%"
)

print(
    f"{'Incremental + global re-opt':<30} "
    f"{glob['area']:>15.3f} "
    f"{overhead(glob['area']):>+11.3f}%"
)

original_delta = inc["area"] - full["area"]

if original_delta != 0:
    recovered = (
        inc["area"] - glob["area"]
    ) / original_delta * 100.0

    print()
    print(
        "Recovered original area overhead: "
        f"{recovered:.2f}%"
    )

print()
print("Combinational / sequential breakdown:")
print()

for name, d in [
    ("Full", full),
    ("Incremental", inc),
    ("Global re-opt", glob),
]:
    print(
        f"{name:<20} "
        f"comb={d['comb']:.3f}  "
        f"seq={d['seq']:.3f}  "
        f"total={d['area']:.3f}"
    )
PY

echo
echo "Generated:"
echo "  $GLOBAL_OUT/mapped.json"
echo "  $GLOBAL_OUT/mapped_netlist.v"
echo "  $GLOBAL_OUT/stat.json"
echo "  $GLOBAL_OUT/area.rpt"
echo