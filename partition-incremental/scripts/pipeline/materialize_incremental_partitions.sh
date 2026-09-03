#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <new_source_dir> <new_manifest.json> <reuse_plan.json> <output_partitions_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

NEW_SOURCE_DIR="$(realpath "$1")"
NEW_MANIFEST="$(realpath "$2")"
REUSE_PLAN="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"

REPO_ROOT="$(git rev-parse --show-toplevel)"
SYNTH_PARTITION="$REPO_ROOT/partition-incremental/scripts/pipeline/synth_partition.sh"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$REUSE_PLAN" \
    "$SYNTH_PARTITION"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

BASE_PARTITIONS_DIR="$(
    jq -r '.base_partitions_dir' "$REUSE_PLAN"
)"

if [[ -z "$BASE_PARTITIONS_DIR" || "$BASE_PARTITIONS_DIR" == "null" ]]; then
    echo "ERROR: base_partitions_dir is missing from reuse plan"
    exit 1
fi

if [[ ! -d "$BASE_PARTITIONS_DIR" ]]; then
    echo "ERROR: Base partition cache directory does not exist:"
    echo "  $BASE_PARTITIONS_DIR"
    exit 1
fi

jq -e '.partitions | type == "object"' \
    "$NEW_MANIFEST" >/dev/null

jq -e '.decisions | type == "object"' \
    "$REUSE_PLAN" >/dev/null

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

SUMMARY_TSV="$OUTPUT_DIR/materialization_summary.tsv"

printf 'partition\troot_module\taction\tsource\tbuild_seconds\n' \
    > "$SUMMARY_TSV"

while IFS=$'\t' read -r partition_name root_module
do
    action="$(
        jq -r \
            --arg partition "$partition_name" \
            '.decisions[$partition].status // empty' \
            "$REUSE_PLAN"
    )"

    if [[ "$action" != "reuse" && "$action" != "rebuild" ]]; then
        echo "ERROR: invalid or missing action:"
        echo "  partition=$partition_name"
        echo "  action=$action"
        exit 1
    fi

    partition_output="$OUTPUT_DIR/$partition_name"

    reasons_json="$(
        jq -c \
            --arg partition "$partition_name" \
            '.decisions[$partition].reasons // []' \
            "$REUSE_PLAN"
    )"

    base_signature="$(
        jq -r \
            --arg partition "$partition_name" \
            '.decisions[$partition].base_implementation_signature // ""' \
            "$REUSE_PLAN"
    )"

    new_signature="$(
        jq -r \
            --arg partition "$partition_name" \
            '.decisions[$partition].new_implementation_signature // ""' \
            "$REUSE_PLAN"
    )"

    echo
    echo "============================================================"
    echo "Partition : $partition_name"
    echo "Root      : $root_module"
    echo "Action    : $action"
    echo "============================================================"

    if [[ "$action" == "reuse" ]]; then
        cache_dir="$BASE_PARTITIONS_DIR/$partition_name"

        for required_file in \
            "$cache_dir/synth.json" \
            "$cache_dir/synth.rtlil" \
            "$cache_dir/partition_netlist.v"
        do
            if [[ ! -s "$required_file" ]]; then
                echo "ERROR: cached output is missing or empty:"
                echo "  $required_file"
                exit 1
            fi
        done

        # link_partitions.sh 需要 synth.json，
        # 因此复制整个分区结果目录。
        cp -a "$cache_dir" "$partition_output"

        source_kind="base_cache"
        source_path="$cache_dir"
        build_seconds="0.000"
    else
        "$SYNTH_PARTITION" \
            "$NEW_SOURCE_DIR" \
            "$partition_output" \
            "$partition_name" \
            "$root_module"

        for required_file in \
            "$partition_output/synth.json" \
            "$partition_output/synth.rtlil" \
            "$partition_output/partition_netlist.v"
        do
            if [[ ! -s "$required_file" ]]; then
                echo "ERROR: rebuilt output is missing or empty:"
                echo "  $required_file"
                exit 1
            fi
        done

        source_kind="new_synthesis"
        source_path="$NEW_SOURCE_DIR"

        build_seconds="$(
            awk '$1 == "real" {print $2}' \
                "$partition_output/time.txt"
        )"
    fi

    netlist_sha256="$(
        sha256sum "$partition_output/partition_netlist.v" \
            | awk '{print $1}'
    )"

    jq -n \
        --arg partition "$partition_name" \
        --arg root_module "$root_module" \
        --arg action "$action" \
        --arg source_kind "$source_kind" \
        --arg source_path "$source_path" \
        --arg base_signature "$base_signature" \
        --arg new_signature "$new_signature" \
        --arg netlist_sha256 "$netlist_sha256" \
        --argjson reasons "$reasons_json" \
        '{
            partition: $partition,
            root_module: $root_module,
            action: $action,
            source_kind: $source_kind,
            source_path: $source_path,
            reasons: $reasons,
            base_implementation_signature: $base_signature,
            new_implementation_signature: $new_signature,
            partition_netlist_sha256: $netlist_sha256
        }' \
        > "$partition_output/materialization_info.json"

    printf '%s\t%s\t%s\t%s\t%s\n' \
        "$partition_name" \
        "$root_module" \
        "$action" \
        "$source_kind" \
        "$build_seconds" \
        >> "$SUMMARY_TSV"

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [.key, .value.root_module]
        | @tsv
    ' "$NEW_MANIFEST"
)

jq -s \
    '{
        partitions: .,
        reuse_count: (
            [.[] | select(.action == "reuse")]
            | length
        ),
        rebuild_count: (
            [.[] | select(.action == "rebuild")]
            | length
        )
    }' \
    "$OUTPUT_DIR"/*/materialization_info.json \
    > "$OUTPUT_DIR/materialization_summary.json"

echo
echo "Partition materialization completed."

column -t -s $'\t' "$SUMMARY_TSV" \
    || cat "$SUMMARY_TSV"
