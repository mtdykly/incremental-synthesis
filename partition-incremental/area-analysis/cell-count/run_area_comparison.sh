#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir>"
    echo
    echo "Example:"
    echo "  $0 eco-001 benchmarks/riscv-eco-001-new"
}

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
NEW_MANIFEST="$CASE_OUT/new/partition_manifest.json"

LINKED_JSON="$CASE_OUT/incremental/linked/linked.json"

AREA_OUT="$CASE_OUT/area-analysis/cell-count"
FULL_OUT="$AREA_OUT/full-reference"

FULL_JSON="$FULL_OUT/full_reference.json"
FULL_FLAT_JSON="$AREA_OUT/full_flat.json"
INCREMENTAL_FLAT_JSON="$AREA_OUT/incremental_flat.json"

SYNTH_FULL="$REPO_ROOT/partition-incremental/scripts/pipeline/synth_full_reference.sh"

FLATTEN_FOR_STATS="$REPO_ROOT/partition-incremental/area-analysis/cell-count/flatten_netlist_for_stats.sh"

COMPARE="$REPO_ROOT/partition-incremental/area-analysis/cell-count/compare_cell_counts.py"


for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$LINKED_JSON" \
    "$SYNTH_FULL" \
    "$FLATTEN_FOR_STATS" \
    "$COMPARE"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done


TOP_MODULE="$(
    jq -r '.top.module_name' "$NEW_MANIFEST"
)"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing from manifest"
    exit 1
fi


rm -rf "$AREA_OUT"

mkdir -p "$AREA_OUT"


echo
echo "============================================================"
echo "1. Build full New reference"
echo "============================================================"

"$SYNTH_FULL" \
    "$NEW_SOURCE_DIR" \
    "$FULL_OUT" \
    "$TOP_MODULE"


if [[ ! -s "$FULL_JSON" ]]; then
    echo "ERROR: full reference JSON was not generated:"
    echo "  $FULL_JSON"
    exit 1
fi


echo
echo "============================================================"
echo "2. Normalize full reference for counting"
echo "============================================================"

"$FLATTEN_FOR_STATS" \
    "$FULL_JSON" \
    "$TOP_MODULE" \
    "$FULL_FLAT_JSON"


echo
echo "============================================================"
echo "3. Flatten incremental linked design for counting only"
echo "============================================================"

"$FLATTEN_FOR_STATS" \
    "$LINKED_JSON" \
    "$TOP_MODULE" \
    "$INCREMENTAL_FLAT_JSON"


echo
echo "============================================================"
echo "4. Compare cell counts"
echo "============================================================"

python3 "$COMPARE" \
    "$FULL_FLAT_JSON" \
    "$INCREMENTAL_FLAT_JSON" \
    "$TOP_MODULE" \
    "$AREA_OUT"
