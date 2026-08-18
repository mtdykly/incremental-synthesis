#!/usr/bin/env bash

set -euo pipefail

CASE_NAME="$1"

REPO_ROOT="$(git rev-parse --show-toplevel)"

LIBERTY_FILE="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

MANIFEST="$CASE_OUT/new/partition_manifest.json"

INPUT="$CASE_OUT/area-analysis/liberty-area/full-generic/full_reference.json"

OUT="$CASE_OUT/area-analysis/liberty-area/full-resynth-control"

MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/measure_mapped_design.sh"

LATCH_MAP="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/nangate45_latch_map.v"

TOP_MODULE="$(jq -r '.top.module_name' "$MANIFEST")"

rm -rf "$OUT"
mkdir -p "$OUT"

cat > "$OUT/run.ys" <<YOSYS
read_json "$INPUT"

hierarchy -check -top $TOP_MODULE

# Full reference has already been synthesized once.
# Run synth one additional time as the control experiment.
synth -top $TOP_MODULE
opt_clean -purge
check

write_json "$OUT/resynth_generic.json"

dfflibmap -liberty "$LIBERTY_FILE"
abc -liberty "$LIBERTY_FILE"

techmap -map "$LATCH_MAP"
opt_clean -purge

write_json "$OUT/mapped.json"
YOSYS

yosys \
    -l "$OUT/yosys.log" \
    -s "$OUT/run.ys"

"$MEASURE" \
    "$OUT/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$OUT"

echo
echo "Full resynth control:"
jq '.design | {
    area,
    sequential_area,
    num_cells
}' "$OUT/stat.json"