#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir>"
}

if [[ $# -lt 3 || $# -gt 4 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SRC="$(realpath "$2")"
NEW_SRC="$(realpath "$3")"
TOP_MODULE="${4:-riscv_core}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
PIPELINE_DIR="$REPO_ROOT/partition-incremental/scripts/pipeline"
PLANNING_DIR="$REPO_ROOT/partition-incremental/scripts/planning"
CHECKS_DIR="$REPO_ROOT/partition-incremental/scripts/checks"
BASE_OUT="$OUT/base"
NEW_OUT="$OUT/new"
PLAN_OUT="$OUT/plan"

EXPORT_HIERARCHY="$PIPELINE_DIR/export_hierarchy.sh"
EXTRACT_PARTITIONS="$PIPELINE_DIR/extract_first_level_partitions.py"
SYNTH_ALL="$PIPELINE_DIR/synth_all_partitions.sh"
CHECK_PARTITIONS="$CHECKS_DIR/check_partition_outputs.sh"
PREPARE_ALL_FRONTENDS="$PIPELINE_DIR/prepare_all_partition_frontends.sh"
COMPUTE_SIGNATURES="$PLANNING_DIR/compute_partition_signatures.py"
COMPARE_SIGNATURES="$PLANNING_DIR/compare_partition_signatures.py"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"
PARTITION_FRONTEND_SCRIPT="$PIPELINE_DIR/prepare_partition_frontend.sh"
TOP_SCRIPT="$PIPELINE_DIR/synth_top_shell.sh"

YOSYS_VERSION="$(yosys -V | head -n 1)"

for source_dir in "$BASE_SRC" "$NEW_SRC"; do
    if [[ ! -d "$source_dir" ]]; then
        echo "ERROR: source directory does not exist:"
        echo "  $source_dir"
        exit 1
    fi
done

mkdir -p "$BASE_OUT" "$NEW_OUT" "$PLAN_OUT"

echo
echo "============================================================"
echo "1. Prepare Base hierarchy"
echo "============================================================"

"$EXPORT_HIERARCHY" "$BASE_SRC" "$BASE_OUT" "$TOP_MODULE"

python3 "$EXTRACT_PARTITIONS" \
    "$BASE_OUT/frontend_hier.json" \
    --top "$TOP_MODULE" \
    --output "$BASE_OUT/partition_manifest.json"

echo
echo "============================================================"
echo "2. Build Base partition cache"
echo "============================================================"

rm -rf "$BASE_OUT/partitions"

"$SYNTH_ALL" \
    "$BASE_SRC" \
    "$BASE_OUT/partition_manifest.json" \
    "$BASE_OUT/partitions"

"$CHECK_PARTITIONS" \
    "$BASE_OUT/partition_manifest.json" \
    "$BASE_OUT/partitions"

echo
echo "============================================================"
echo "3. Compute Base signatures from isolated partition IR"
echo "============================================================"

python3 "$COMPUTE_SIGNATURES" \
    --hier-json "$BASE_OUT/frontend_hier.json" \
    --manifest "$BASE_OUT/partition_manifest.json" \
    --partition-ir-dir "$BASE_OUT/partitions" \
    --output "$BASE_OUT/partition_signatures.json" \
    --yosys-version "$YOSYS_VERSION" \
    --partition-flow-file "$PARTITION_FLOW" \
    --partition-flow-file "$PARTITION_FRONTEND_SCRIPT" \
    --top-flow-file "$TOP_SCRIPT"

echo
echo "============================================================"
echo "4. Base self-check"
echo "============================================================"

python3 "$COMPARE_SIGNATURES" \
    --base-signatures "$BASE_OUT/partition_signatures.json" \
    --new-signatures "$BASE_OUT/partition_signatures.json" \
    --base-partitions-dir "$BASE_OUT/partitions" \
    --output "$BASE_OUT/self_reuse_plan.json"

if [[ "$(jq '.dirty_partitions | length' "$BASE_OUT/self_reuse_plan.json")" -ne 0 ]]; then
    echo "ERROR: Base self-check produced dirty partitions."
    jq '.' "$BASE_OUT/self_reuse_plan.json"
    exit 1
fi

if [[ "$(jq -r '.top_shell.status' "$BASE_OUT/self_reuse_plan.json")" != "reuse" ]]; then
    echo "ERROR: Base top shell cannot reuse itself."
    exit 1
fi

echo "PASS: Base self-check marked all partitions reusable."

echo
echo "============================================================"
echo "5. Prepare New hierarchy"
echo "============================================================"

rm -rf "$NEW_OUT/partitions" "$NEW_OUT/partition-frontends"

"$EXPORT_HIERARCHY" "$NEW_SRC" "$NEW_OUT" "$TOP_MODULE"

python3 "$EXTRACT_PARTITIONS" \
    "$NEW_OUT/frontend_hier.json" \
    --top "$TOP_MODULE" \
    --output "$NEW_OUT/partition_manifest.json"

echo
echo "============================================================"
echo "6. Prepare New isolated partition IR without synthesis"
echo "============================================================"

"$PREPARE_ALL_FRONTENDS" \
    "$NEW_SRC" \
    "$NEW_OUT/partition_manifest.json" \
    "$NEW_OUT/partition-frontends"

if find "$NEW_OUT/partition-frontends" \
    -type f \
    \( -name 'synth.json' \
       -o -name 'synth.rtlil' \
       -o -name 'partition_netlist.v' \) \
    | grep -q .
then
    echo "ERROR: New frontend preparation produced synthesis outputs."
    exit 1
fi

echo "PASS: New partition IR generated without synthesis."

echo
echo "============================================================"
echo "7. Compute New signatures from isolated partition IR"
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
echo "8. Compare Base and New signatures"
echo "============================================================"

python3 "$COMPARE_SIGNATURES" \
    --base-signatures "$BASE_OUT/partition_signatures.json" \
    --new-signatures "$NEW_OUT/partition_signatures.json" \
    --base-partitions-dir "$BASE_OUT/partitions" \
    --output "$PLAN_OUT/reuse_plan.json"

echo
echo "============================================================"
echo "9. Reuse plan"
echo "============================================================"

jq '{
    reusable_partitions,
    dirty_partitions,
    interface_changed_partitions,
    top_shell
}' "$PLAN_OUT/reuse_plan.json"

echo
echo "Detailed decisions:"

jq -r '
    .decisions
    | to_entries[]
    | "\(.key): \(.value.status) [\(.value.reasons | join(", "))]"
' "$PLAN_OUT/reuse_plan.json"

echo
echo "Validation completed:"
echo "  $PLAN_OUT/reuse_plan.json"
