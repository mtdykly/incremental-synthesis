#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir> [top_module]"
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
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"

REPO_ROOT="$(git rev-parse --show-toplevel)"
PIPELINE_DIR="$REPO_ROOT/partition-incremental/scripts/pipeline"
CHECKS_DIR="$REPO_ROOT/partition-incremental/scripts/checks"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

BASE_OUT="$CASE_OUT/base"
NEW_OUT="$CASE_OUT/new"
PLAN_FILE="$CASE_OUT/plan/reuse_plan.json"
INCREMENTAL_OUT="$CASE_OUT/incremental"

BASE_MANIFEST="$BASE_OUT/partition_manifest.json"
BASE_HIER_JSON="$BASE_OUT/frontend_hier.json"

NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
TOP_MODULE="$(
    jq -r '.top.module_name' "$NEW_MANIFEST"
)"
NEW_HIER_JSON="$NEW_OUT/frontend_hier.json"

MATERIALIZE_PARTITIONS="$PIPELINE_DIR/materialize_incremental_partitions.sh"
SYNTH_TOP_SHELL="$PIPELINE_DIR/synth_top_shell.sh"
LINK_PARTITIONS="$PIPELINE_DIR/link_partitions.sh"
CHECK_LINKED="$CHECKS_DIR/check_linked_design.sh"

for required_file in \
    "$PLAN_FILE" \
    "$BASE_MANIFEST" \
    "$BASE_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$NEW_HIER_JSON" \
    "$MATERIALIZE_PARTITIONS" \
    "$SYNTH_TOP_SHELL" \
    "$LINK_PARTITIONS"
do
    if [[ ! -e "$required_file" ]]; then
        echo "ERROR: required file does not exist:"
        echo "  $required_file"
        exit 1
    fi
done

if [[ ! -d "$BASE_SOURCE_DIR" ]]; then
    echo "ERROR: Base source directory does not exist:"
    echo "  $BASE_SOURCE_DIR"
    exit 1
fi

if [[ ! -d "$NEW_SOURCE_DIR" ]]; then
    echo "ERROR: New source directory does not exist:"
    echo "  $NEW_SOURCE_DIR"
    exit 1
fi

TOP_SHELL_ACTION="$(
    jq -r '.top_shell.status' "$PLAN_FILE"
)"

if [[ "$TOP_SHELL_ACTION" != "reuse" \
   && "$TOP_SHELL_ACTION" != "rebuild" ]]
then
    echo "ERROR: invalid top shell action:"
    echo "  $TOP_SHELL_ACTION"
    exit 1
fi

rm -rf "$INCREMENTAL_OUT"

mkdir -p \
    "$INCREMENTAL_OUT/partitions" \
    "$INCREMENTAL_OUT/top-shell" \
    "$INCREMENTAL_OUT/linked"

START_TIME_NS="$(date +%s%N)"

echo
echo "============================================================"
echo "1. Materialize partitions"
echo "============================================================"

"$MATERIALIZE_PARTITIONS" \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$PLAN_FILE" \
    "$INCREMENTAL_OUT/partitions"

echo
echo "============================================================"
echo "2. Materialize top shell"
echo "Action: $TOP_SHELL_ACTION"
echo "============================================================"

if [[ "$TOP_SHELL_ACTION" == "reuse" ]]; then
    BASE_TOP_SHELL="$BASE_OUT/top-shell"

    # 如果以前没有为该 ECO 建立 Base top shell，
    # 先生成一次作为缓存。
    if [[ ! -s "$BASE_TOP_SHELL/top_shell.rtlil" ]]; then
        echo "Base top-shell cache does not exist."
        echo "Generating Base top shell..."

        rm -rf "$BASE_TOP_SHELL"

        "$SYNTH_TOP_SHELL" \
            "$BASE_HIER_JSON" \
            "$BASE_MANIFEST" \
            "$BASE_TOP_SHELL"
    fi

    cp -a \
        "$BASE_TOP_SHELL/." \
        "$INCREMENTAL_OUT/top-shell/"

    TOP_SHELL_SOURCE="base_cache"
    TOP_SHELL_SOURCE_PATH="$BASE_TOP_SHELL"
else
    "$SYNTH_TOP_SHELL" \
        "$NEW_HIER_JSON" \
        "$NEW_MANIFEST" \
        "$INCREMENTAL_OUT/top-shell"

    TOP_SHELL_SOURCE="new_synthesis"
    TOP_SHELL_SOURCE_PATH="$NEW_HIER_JSON"
fi

jq -n \
    --arg action "$TOP_SHELL_ACTION" \
    --arg source_kind "$TOP_SHELL_SOURCE" \
    --arg source_path "$TOP_SHELL_SOURCE_PATH" \
    --argjson reasons "$(
        jq -c '.top_shell.reasons // []' "$PLAN_FILE"
    )" \
    '{
        action: $action,
        source_kind: $source_kind,
        source_path: $source_path,
        reasons: $reasons
    }' \
    > "$INCREMENTAL_OUT/top-shell/materialization_info.json"

if [[ ! -s \
  "$INCREMENTAL_OUT/top-shell/top_shell.rtlil" ]]
then
    echo "ERROR: top shell RTLIL was not generated."
    exit 1
fi

echo
echo "============================================================"
echo "3. Link top shell and partitions"
echo "============================================================"

"$LINK_PARTITIONS" \
    "$INCREMENTAL_OUT/top-shell/top_shell.rtlil" \
    "$NEW_MANIFEST" \
    "$INCREMENTAL_OUT/partitions" \
    "$INCREMENTAL_OUT/linked"

if [[ ! -s "$INCREMENTAL_OUT/linked/linked.json" ]]; then
    echo "ERROR: linked.json was not generated."
    exit 1
fi

if [[ ! -s \
  "$INCREMENTAL_OUT/linked/linked_netlist.v" ]]
then
    echo "ERROR: linked_netlist.v was not generated."
    exit 1
fi

echo
echo "============================================================"
echo "4. Check linked design"
echo "============================================================"

if [[ -x "$CHECK_LINKED" ]]; then
    "$CHECK_LINKED" \
        "$NEW_MANIFEST" \
        "$INCREMENTAL_OUT/linked/linked.json"
else
    echo "WARNING: check_linked_design.sh not found."
    echo "Only running a basic Yosys check."

cat > "$INCREMENTAL_OUT/check_linked.ys" <<YOSYS
read_json "$INCREMENTAL_OUT/linked/linked.json"
hierarchy -check -top $TOP_MODULE
check
YOSYS

    yosys -s "$INCREMENTAL_OUT/check_linked.ys"
fi

END_TIME_NS="$(date +%s%N)"

ELAPSED_SECONDS="$(
    python3 - "$START_TIME_NS" "$END_TIME_NS" <<'PY'
import sys

start_ns = int(sys.argv[1])
end_ns = int(sys.argv[2])

print(f"{(end_ns - start_ns) / 1_000_000_000:.6f}")
PY
)"

REUSE_COUNT="$(
    jq '.reuse_count' \
        "$INCREMENTAL_OUT/partitions/materialization_summary.json"
)"

REBUILD_COUNT="$(
    jq '.rebuild_count' \
        "$INCREMENTAL_OUT/partitions/materialization_summary.json"
)"

jq -n \
    --arg case_name "$CASE_NAME" \
    --arg reuse_plan "$PLAN_FILE" \
    --arg top_shell_action "$TOP_SHELL_ACTION" \
    --arg linked_json "$INCREMENTAL_OUT/linked/linked.json" \
    --arg linked_netlist "$INCREMENTAL_OUT/linked/linked_netlist.v" \
    --arg elapsed_seconds "$ELAPSED_SECONDS" \
    --argjson reuse_count "$REUSE_COUNT" \
    --argjson rebuild_count "$REBUILD_COUNT" \
    '{
        case_name: $case_name,
        reuse_plan: $reuse_plan,
        reuse_count: $reuse_count,
        rebuild_count: $rebuild_count,
        top_shell_action: $top_shell_action,
        linked_json: $linked_json,
        linked_netlist: $linked_netlist,
        incremental_build_seconds: (
            $elapsed_seconds | tonumber
        )
    }' \
    > "$INCREMENTAL_OUT/build_summary.json"

printf 'elapsed_seconds=%s\n' "$ELAPSED_SECONDS" \
    > "$INCREMENTAL_OUT/incremental_build_time.txt"

echo
echo "Incremental design successfully built."
echo

cat "$INCREMENTAL_OUT/build_summary.json"
