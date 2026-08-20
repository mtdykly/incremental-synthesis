#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir>"
}

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"

REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
PIPELINE_DIR="$REPO_ROOT/partition-incremental/scripts/pipeline"
PLANNING_DIR="$REPO_ROOT/partition-incremental/scripts/planning"

BASE_OUT="$CASE_OUT/base"
NEW_OUT="$CASE_OUT/new"
PLAN_OUT="$CASE_OUT/plan"
BASE_MANIFEST="$BASE_OUT/partition_manifest.json"

EXPORT_HIERARCHY="$PIPELINE_DIR/export_hierarchy.sh"
EXTRACT_PARTITIONS="$PIPELINE_DIR/extract_first_level_partitions.py"
PREPARE_FRONTENDS="$PIPELINE_DIR/prepare_all_partition_frontends.sh"
COMPUTE_SIGNATURES="$PLANNING_DIR/compute_partition_signatures.py"
COMPARE_SIGNATURES="$PLANNING_DIR/compare_partition_signatures.py"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"
PARTITION_FRONTEND_SCRIPT="$PIPELINE_DIR/prepare_partition_frontend.sh"
TOP_SCRIPT="$PIPELINE_DIR/synth_top_shell.sh"

BASE_SIGNATURES="$BASE_OUT/partition_signatures.json"
BASE_PARTITIONS="$BASE_OUT/partitions"
TOP_MODULE="$(
    jq -r '.top.module_name' "$BASE_MANIFEST"
)"

YOSYS_VERSION="$(yosys -V | head -n 1)"

if [[ ! -d "$NEW_SOURCE_DIR" ]]; then
    echo "ERROR: New source directory does not exist:"
    echo "  $NEW_SOURCE_DIR"
    exit 1
fi

for required_file in \
    "$BASE_SIGNATURES" \
    "$BASE_MANIFEST"
do
    if [[ ! -s "$required_file" ]]; then
        echo "ERROR: Base cache information is missing:"
        echo "  $required_file"
        exit 1
    fi
done

if [[ ! -d "$BASE_PARTITIONS" ]]; then
    echo "ERROR: Base partition cache does not exist:"
    echo "  $BASE_PARTITIONS"
    exit 1
fi

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top.module_name is missing from Base manifest:"
    echo "  $BASE_MANIFEST"
    exit 1
fi

# 只删除 New 分析和旧计划，不删除 Base 缓存。
rm -rf "$NEW_OUT" "$PLAN_OUT"
mkdir -p "$NEW_OUT" "$PLAN_OUT"

echo
echo "============================================================"
echo "1. Export New hierarchy"
echo "============================================================"

"$EXPORT_HIERARCHY" \
    "$NEW_SOURCE_DIR" \
    "$NEW_OUT" \
    "$TOP_MODULE"

echo
echo "============================================================"
echo "2. Extract New partitions"
echo "============================================================"

python3 "$EXTRACT_PARTITIONS" \
    "$NEW_OUT/frontend_hier.json" \
    --top "$TOP_MODULE" \
    --output "$NEW_OUT/partition_manifest.json"

echo
echo "============================================================"
echo "3. Prepare New isolated partition IR"
echo "============================================================"

"$PREPARE_FRONTENDS" \
    "$NEW_SOURCE_DIR" \
    "$NEW_OUT/partition_manifest.json" \
    "$NEW_OUT/partition-frontends"

echo
echo "============================================================"
echo "4. Compute New signatures"
echo "============================================================"

python3 "$COMPUTE_SIGNATURES" \
    --hier-json "$NEW_OUT/frontend_hier.json" \
    --manifest "$NEW_OUT/partition_manifest.json" \
    --partition-ir-dir "$NEW_OUT/partition-frontends" \
    --output "$NEW_OUT/partition_signatures.json" \
    --yosys-version "$YOSYS_VERSION" \
    --partition-flow-file "$PARTITION_FLOW" \
    --partition-flow-file "$PARTITION_FRONTEND_SCRIPT" \
    --top-flow-file "$TOP_SCRIPT"

echo
echo "============================================================"
echo "5. Compare Base and New"
echo "============================================================"

python3 "$COMPARE_SIGNATURES" \
    --base-signatures "$BASE_SIGNATURES" \
    --new-signatures "$NEW_OUT/partition_signatures.json" \
    --base-partitions-dir "$BASE_PARTITIONS" \
    --output "$PLAN_OUT/reuse_plan.json"

echo
echo "New reuse plan generated:"

jq '{
    reusable_partitions,
    dirty_partitions,
    interface_changed_partitions,
    top_shell
}' "$PLAN_OUT/reuse_plan.json"
