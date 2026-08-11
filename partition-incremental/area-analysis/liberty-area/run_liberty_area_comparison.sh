#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir> [liberty_file]"
    echo
    echo "Example:"
    echo "  $0 eco-001 benchmarks/riscv-eco-001-new"
}

if [[ $# -lt 2 || $# -gt 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

DEFAULT_LIB="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"

LIBERTY_FILE="$(
    realpath "${3:-$DEFAULT_LIB}"
)"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

NEW_MANIFEST="$CASE_OUT/new/partition_manifest.json"

GENERIC_INCREMENTAL="$CASE_OUT/incremental"
GENERIC_PARTITIONS="$GENERIC_INCREMENTAL/partitions"
GENERIC_TOP_SHELL="$GENERIC_INCREMENTAL/top-shell/top_shell.json"

AREA_OUT="$CASE_OUT/area-analysis/liberty-area"

FULL_GENERIC="$AREA_OUT/full-generic"
FULL_MAPPED="$AREA_OUT/full-mapped"

INCREMENTAL_MAPPED="$AREA_OUT/incremental-mapped"
MAPPED_TOP_SHELL="$INCREMENTAL_MAPPED/top-shell"
MAPPED_PARTITIONS="$INCREMENTAL_MAPPED/partitions"
MAPPED_LINKED="$INCREMENTAL_MAPPED/linked"

SYNTH_FULL="$REPO_ROOT/partition-incremental/scripts/synth_full_reference.sh"

MAP_GENERIC="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/map_generic_json_to_liberty.sh"

MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/measure_mapped_design.sh"

LINK_AND_MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/link_and_measure_liberty.sh"

COMPARE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/compare_liberty_area.py"


for required in \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$GENERIC_PARTITIONS" \
    "$GENERIC_TOP_SHELL" \
    "$LIBERTY_FILE" \
    "$SYNTH_FULL" \
    "$MAP_GENERIC" \
    "$MEASURE" \
    "$LINK_AND_MEASURE" \
    "$COMPARE"
do
    if [[ ! -e "$required" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required"
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

mkdir -p \
    "$FULL_GENERIC" \
    "$FULL_MAPPED" \
    "$MAPPED_TOP_SHELL" \
    "$MAPPED_PARTITIONS" \
    "$MAPPED_LINKED"


echo
echo "============================================================"
echo "1. Build generic Full New reference"
echo "============================================================"

"$SYNTH_FULL" \
    "$NEW_SOURCE_DIR" \
    "$FULL_GENERIC" \
    "$TOP_MODULE"


echo
echo "============================================================"
echo "2. Map Full New to Liberty"
echo "============================================================"

"$MAP_GENERIC" \
    "$FULL_GENERIC/full_reference.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$FULL_MAPPED"


echo
echo "============================================================"
echo "3. Measure mapped Full New"
echo "============================================================"

"$MEASURE" \
    "$FULL_MAPPED/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$FULL_MAPPED"


echo
echo "============================================================"
echo "4. Map incremental top shell"
echo "============================================================"

"$MAP_GENERIC" \
    "$GENERIC_TOP_SHELL" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$MAPPED_TOP_SHELL"


echo
echo "============================================================"
echo "5. Map incremental partitions independently"
echo "============================================================"

while IFS=$'\t' read -r partition_name root_module
do
    echo
    echo "------------------------------------------------------------"
    echo "Partition : $partition_name"
    echo "Root      : $root_module"
    echo "------------------------------------------------------------"

    INPUT_JSON="$GENERIC_PARTITIONS/$partition_name/synth.json"
    OUTPUT_DIR="$MAPPED_PARTITIONS/$partition_name"

    if [[ ! -f "$INPUT_JSON" ]]; then
        echo "ERROR: generic incremental partition missing:"
        echo "  $INPUT_JSON"
        exit 1
    fi

    "$MAP_GENERIC" \
        "$INPUT_JSON" \
        "$root_module" \
        "$LIBERTY_FILE" \
        "$OUTPUT_DIR"

done < <(
    jq -r '
      .partitions
      | to_entries[]
      | [.key, .value.root_module]
      | @tsv
    ' "$NEW_MANIFEST"
)


echo
echo "============================================================"
echo "6. Link mapped incremental design and measure area"
echo "============================================================"

"$LINK_AND_MEASURE" \
    "$MAPPED_TOP_SHELL/mapped_netlist.v" \
    "$NEW_MANIFEST" \
    "$MAPPED_PARTITIONS" \
    "$LIBERTY_FILE" \
    "$MAPPED_LINKED"


echo
echo "============================================================"
echo "7. Compare Full vs Incremental mapped area"
echo "============================================================"

python3 "$COMPARE" \
    "$FULL_MAPPED/stat.json" \
    "$MAPPED_LINKED/stat.json" \
    "$LIBERTY_FILE" \
    "$AREA_OUT/summary.json"


echo
echo "============================================================"
echo "Liberty area experiment completed"
echo "============================================================"
echo
echo "Summary:"
echo "  $AREA_OUT/summary.json"