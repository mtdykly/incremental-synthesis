#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir>"
    echo
    echo "Example:"
    echo "  $0 eco-001 \\"
    echo "     benchmarks/riscv-eco-001-base \\"
    echo "     benchmarks/riscv-eco-001-new"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SRC="$(realpath "$2")"
NEW_SRC="$(realpath "$3")"

REPO_ROOT="$(git rev-parse --show-toplevel)"
OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

BASE_OUT="$OUT/base"
NEW_OUT="$OUT/new"
PLAN_OUT="$OUT/plan"

EXPORT_HIERARCHY="$REPO_ROOT/partition-incremental/scripts/export_hierarchy.sh"
EXTRACT_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/extract_first_level_partitions.py"
SYNTH_ALL="$REPO_ROOT/partition-incremental/scripts/synth_all_partitions.sh"
CHECK_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/check_partition_outputs.sh"
COMPUTE_SIGNATURES="$REPO_ROOT/partition-incremental/scripts/compute_partition_signatures.py"
COMPARE_SIGNATURES="$REPO_ROOT/partition-incremental/scripts/compare_partition_signatures.py"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"
PARTITION_SCRIPT="$REPO_ROOT/partition-incremental/scripts/synth_partition.sh"
TOP_SCRIPT="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"

YOSYS_VERSION="$(yosys -V | head -n 1)"

if [[ ! -d "$BASE_SRC" ]]; then
    echo "ERROR: Base source directory does not exist:"
    echo "  $BASE_SRC"
    exit 1
fi

if [[ ! -d "$NEW_SRC" ]]; then
    echo "ERROR: New source directory does not exist:"
    echo "  $NEW_SRC"
    exit 1
fi

mkdir -p "$BASE_OUT" "$NEW_OUT" "$PLAN_OUT"

echo
echo "============================================================"
echo "1. Prepare Base hierarchy"
echo "============================================================"

"$EXPORT_HIERARCHY" \
    "$BASE_SRC" \
    "$BASE_OUT" \
    riscv_core

python3 "$EXTRACT_PARTITIONS" \
    "$BASE_OUT/frontend_hier.json" \
    --top riscv_core \
    --output "$BASE_OUT/partition_manifest.json"

echo
echo "============================================================"
echo "2. Build Base partition cache"
echo "============================================================"

"$SYNTH_ALL" \
    "$BASE_SRC" \
    "$BASE_OUT/partition_manifest.json" \
    "$BASE_OUT/partitions"

"$CHECK_PARTITIONS" \
    "$BASE_OUT/partition_manifest.json" \
    "$BASE_OUT/partitions"

echo
echo "============================================================"
echo "3. Compute Base signatures"
echo "============================================================"

python3 "$COMPUTE_SIGNATURES" \
    --hier-json "$BASE_OUT/frontend_hier.json" \
    --manifest "$BASE_OUT/partition_manifest.json" \
    --output "$BASE_OUT/partition_signatures.json" \
    --yosys-version "$YOSYS_VERSION" \
    --partition-flow-file "$PARTITION_FLOW" \
    --partition-flow-file "$PARTITION_SCRIPT" \
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

SELF_DIRTY_COUNT="$(
    jq '.dirty_partitions | length' \
        "$BASE_OUT/self_reuse_plan.json"
)"

if [[ "$SELF_DIRTY_COUNT" -ne 0 ]]; then
    echo "ERROR: Base self-check produced dirty partitions."
    jq '.' "$BASE_OUT/self_reuse_plan.json"
    exit 1
fi

if [[ "$(
    jq -r '.top_shell.status' \
        "$BASE_OUT/self_reuse_plan.json"
)" != "reuse" ]]; then
    echo "ERROR: Base top shell cannot reuse itself."
    exit 1
fi

echo "PASS: Base self-check marked all partitions reusable."

echo
echo "============================================================"
echo "5. Prepare New hierarchy only"
echo "============================================================"

# 删除以前可能残留的 New 分区综合结果，
# 保证本次检测没有使用 New 分区综合网表。
rm -rf "$NEW_OUT/partitions"

"$EXPORT_HIERARCHY" \
    "$NEW_SRC" \
    "$NEW_OUT" \
    riscv_core

python3 "$EXTRACT_PARTITIONS" \
    "$NEW_OUT/frontend_hier.json" \
    --top riscv_core \
    --output "$NEW_OUT/partition_manifest.json"

python3 "$COMPUTE_SIGNATURES" \
    --hier-json "$NEW_OUT/frontend_hier.json" \
    --manifest "$NEW_OUT/partition_manifest.json" \
    --output "$NEW_OUT/partition_signatures.json" \
    --yosys-version "$YOSYS_VERSION" \
    --partition-flow-file "$PARTITION_FLOW" \
    --partition-flow-file "$PARTITION_SCRIPT" \
    --top-flow-file "$TOP_SCRIPT"

if [[ -d "$NEW_OUT/partitions" ]]; then
    echo "ERROR: New partition synthesis directory unexpectedly exists."
    exit 1
fi

echo "PASS: New detection completed without partition synthesis."

echo
echo "============================================================"
echo "6. Compare Base and New signatures"
echo "============================================================"

python3 "$COMPARE_SIGNATURES" \
    --base-signatures "$BASE_OUT/partition_signatures.json" \
    --new-signatures "$NEW_OUT/partition_signatures.json" \
    --base-partitions-dir "$BASE_OUT/partitions" \
    --output "$PLAN_OUT/reuse_plan.json"

echo
echo "============================================================"
echo "7. Reuse plan"
echo "============================================================"

jq '{
    reusable_partitions,
    dirty_partitions,
    interface_changed_partitions,
    top_shell
}' "$PLAN_OUT/reuse_plan.json"

echo
echo "============================================================"
echo "8. Changed internal modules"
echo "============================================================"

python3 - \
    "$BASE_OUT/partition_signatures.json" \
    "$NEW_OUT/partition_signatures.json" <<'PY'
import json
import sys

with open(sys.argv[1], encoding="utf-8") as file:
    base = json.load(file)

with open(sys.argv[2], encoding="utf-8") as file:
    new = json.load(file)

all_partitions = sorted(
    set(base["partitions"]) | set(new["partitions"])
)

found_change = False

for partition in all_partitions:
    old_partition = base["partitions"].get(partition)
    new_partition = new["partitions"].get(partition)

    if old_partition is None:
        print(f"[{partition}] new partition")
        found_change = True
        continue

    if new_partition is None:
        print(f"[{partition}] removed partition")
        found_change = True
        continue

    old_modules = {
        item["module_name"]: item["module_signature"]
        for item in old_partition["internal_module_signatures"]
    }

    new_modules = {
        item["module_name"]: item["module_signature"]
        for item in new_partition["internal_module_signatures"]
    }

    changed_modules = [
        name
        for name in sorted(set(old_modules) | set(new_modules))
        if old_modules.get(name) != new_modules.get(name)
    ]

    if changed_modules:
        found_change = True
        print(f"[{partition}]")

        for name in changed_modules:
            print(f"  {name}")

if not found_change:
    print("No internal module signature changes.")
PY

echo
echo "Validation completed:"
echo "  $PLAN_OUT/reuse_plan.json"
