#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

BASE_OUT="$CASE_OUT/base"
NEW_OUT="$CASE_OUT/new"
PLAN_OUT="$CASE_OUT/plan"

OUTPUT="$CASE_OUT/incremental-fine"

COARSE_PLAN="$PLAN_OUT/reuse_plan.json"
FINE_PLAN="$PLAN_OUT/fine_reuse_plan.json"

BASE_FINE_MANIFEST="$BASE_OUT/fine/fine_manifest.json"
NEW_FINE_MANIFEST="$NEW_OUT/fine/fine_manifest.json"

NEW_MANIFEST="$NEW_OUT/partition_manifest.json"

PREPARE_CACHE="$REPO_ROOT/partition-incremental/scripts/prepare_fine_base_cache.sh"
MATERIALIZE_FINE="$REPO_ROOT/partition-incremental/scripts/materialize_fine_incremental_partition.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"
LINK_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/link_partitions.sh"
CHECK_LINKED="$REPO_ROOT/partition-incremental/scripts/check_linked_design.sh"

for required in \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR" \
    "$COARSE_PLAN" \
    "$FINE_PLAN" \
    "$BASE_FINE_MANIFEST" \
    "$NEW_FINE_MANIFEST" \
    "$NEW_MANIFEST" \
    "$PREPARE_CACHE" \
    "$MATERIALIZE_FINE" \
    "$SYNTH_TOP_SHELL" \
    "$LINK_PARTITIONS"
do
    if [[ ! -e "$required" ]]; then
        echo "ERROR: required path missing:"
        echo "  $required"
        exit 1
    fi
done

rm -rf "$OUTPUT"

mkdir -p \
    "$OUTPUT/partitions" \
    "$OUTPUT/top-shell" \
    "$OUTPUT/linked"

echo
echo "============================================================"
echo "1. Materialize top-level partitions"
echo "============================================================"

while IFS=$'\t' read -r \
    partition_name \
    root_module
do

    action="$(
        jq -r \
          --arg partition "$partition_name" \
          '
          .decisions[$partition].status
          ' \
          "$COARSE_PLAN"
    )"

    echo
    echo "------------------------------------------------------------"
    echo "Partition : $partition_name"
    echo "Root      : $root_module"
    echo "Action    : $action"
    echo "------------------------------------------------------------"

    destination="$OUTPUT/partitions/$partition_name"

    if [[ "$action" == "reuse" ]]; then

        cache="$BASE_OUT/partitions/$partition_name"

        if [[ ! -s "$cache/synth.json" ]]; then
            echo "ERROR: Base partition cache missing:"
            echo "  $cache/synth.json"
            exit 1
        fi

        cp -a \
            "$cache" \
            "$destination"

    elif [[ "$action" == "rebuild" ]]; then

        fine_cache="$BASE_OUT/fine-cache/$partition_name"

        if [[ ! -s \
          "$fine_cache/cache_summary.json" ]]
        then
            echo
            echo "Preparing Base fine cache:"
            echo "  $partition_name"

            "$PREPARE_CACHE" \
                "$BASE_SOURCE_DIR" \
                "$BASE_OUT/frontend_hier.json" \
                "$BASE_FINE_MANIFEST" \
                "$partition_name" \
                "$fine_cache"
        fi

        "$MATERIALIZE_FINE" \
            "$NEW_SOURCE_DIR" \
            "$NEW_OUT/frontend_hier.json" \
            "$NEW_FINE_MANIFEST" \
            "$FINE_PLAN" \
            "$partition_name" \
            "$fine_cache" \
            "$destination"

    else
        echo "ERROR: invalid coarse action:"
        echo "  $action"
        exit 1
    fi

    test -s "$destination/synth.json"

done < <(
    jq -r '
      .partitions
      | to_entries[]
      | [
          .key,
          .value.root_module
        ]
      | @tsv
    ' "$NEW_MANIFEST"
)

echo
echo "============================================================"
echo "2. Materialize outer top shell"
echo "============================================================"

TOP_ACTION="$(
    jq -r \
      '.top_shell.status' \
      "$COARSE_PLAN"
)"

if [[ "$TOP_ACTION" == "reuse" ]]; then

    if [[ ! -s \
      "$BASE_OUT/top-shell/top_shell_netlist.v" ]]
    then
        "$SYNTH_TOP_SHELL" \
            "$BASE_OUT/frontend_hier.json" \
            "$BASE_OUT/partition_manifest.json" \
            "$BASE_OUT/top-shell"
    fi

    cp -a \
        "$BASE_OUT/top-shell/." \
        "$OUTPUT/top-shell/"

elif [[ "$TOP_ACTION" == "rebuild" ]]; then

    "$SYNTH_TOP_SHELL" \
        "$NEW_OUT/frontend_hier.json" \
        "$NEW_MANIFEST" \
        "$OUTPUT/top-shell"

else
    echo "ERROR: invalid top-shell action:"
    echo "  $TOP_ACTION"
    exit 1
fi

echo
echo "============================================================"
echo "3. Link complete design"
echo "============================================================"

"$LINK_PARTITIONS" \
    "$OUTPUT/top-shell/top_shell_netlist.v" \
    "$NEW_MANIFEST" \
    "$OUTPUT/partitions" \
    "$OUTPUT/linked"

test -s "$OUTPUT/linked/linked.json"
test -s "$OUTPUT/linked/linked_netlist.v"

echo
echo "============================================================"
echo "4. Check linked design"
echo "============================================================"

if [[ -x "$CHECK_LINKED" ]]; then
    "$CHECK_LINKED" \
        "$NEW_MANIFEST" \
        "$OUTPUT/linked/linked.json"
fi

jq -n \
    --arg case_name "$CASE_NAME" \
    --arg linked_json "$OUTPUT/linked/linked.json" \
    --arg top_shell_action "$TOP_ACTION" \
    '{
        case_name: $case_name,
        method: "partition_plus_fine_grained",
        top_shell_action: $top_shell_action,
        linked_json: $linked_json,
        status: "built"
    }' \
    > "$OUTPUT/build_summary.json"

echo
echo "Fine-grained incremental design built."
echo
cat "$OUTPUT/build_summary.json"