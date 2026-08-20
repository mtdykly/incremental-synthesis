#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <partition_manifest.json> <partitions_output_dir>"
}

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

MANIFEST_FILE="$(realpath "$1")"
OUTPUT_DIR="$(realpath "$2")"

if [[ ! -f "$MANIFEST_FILE" ]]; then
    echo "ERROR: manifest not found:"
    echo "  $MANIFEST_FILE"
    exit 1
fi

if [[ ! -d "$OUTPUT_DIR" ]]; then
    echo "ERROR: output directory not found:"
    echo "  $OUTPUT_DIR"
    exit 1
fi

failed=0

while IFS=$'\t' read -r partition_name root_module
do
    partition_dir="$OUTPUT_DIR/$partition_name"

    frontend_json="$partition_dir/frontend.json"
    flattened_json="$partition_dir/flattened.json"
    synth_json="$partition_dir/synth.json"
    netlist="$partition_dir/partition_netlist.v"

    echo
    echo "Checking partition: $partition_name"
    echo "Root module       : $root_module"

    for required_file in \
        "$frontend_json" \
        "$flattened_json" \
        "$synth_json" \
        "$netlist"
    do
        if [[ ! -s "$required_file" ]]; then
            echo "  FAIL: missing or empty file: $required_file"
            failed=1
        fi
    done

    if [[ "$failed" -ne 0 ]]; then
        continue
    fi

    if ! jq -e \
        --arg root "$root_module" \
        '.modules[$root] != null' \
        "$flattened_json" >/dev/null
    then
        echo "  FAIL: root module missing after flatten"
        failed=1
        continue
    fi

    if ! jq -e \
        --arg root "$root_module" \
        '.modules[$root] != null' \
        "$synth_json" >/dev/null
    then
        echo "  FAIL: root module missing after synthesis"
        failed=1
        continue
    fi

    hierarchical_cell_count="$(
        jq \
            --arg root "$root_module" \
            '
            . as $design
            | [
                $design.modules[$root].cells
                | to_entries[]
                | select(
                    $design.modules[.value.type] != null
                )
              ]
            | length
            ' \
            "$flattened_json"
    )"

    if [[ "$hierarchical_cell_count" -ne 0 ]]; then
        echo "  FAIL: hierarchical cells remain after flatten:"
        jq -r \
            --arg root "$root_module" \
            '
            . as $design
            | $design.modules[$root].cells
            | to_entries[]
            | select(
                $design.modules[.value.type] != null
              )
            | "    \(.key) -> \(.value.type)"
            ' \
            "$flattened_json"

        failed=1
    else
        echo "  PASS: no hierarchical cells remain"
    fi

    jq -S \
        --arg root "$root_module" \
        '
        .modules[$root].ports
        | to_entries
        | map({
            name: .key,
            direction: .value.direction,
            width: (.value.bits | length)
          })
        ' \
        "$frontend_json" \
        > "$partition_dir/interface_frontend.json"

    jq -S \
        --arg root "$root_module" \
        '
        .modules[$root].ports
        | to_entries
        | map({
            name: .key,
            direction: .value.direction,
            width: (.value.bits | length)
          })
        ' \
        "$synth_json" \
        > "$partition_dir/interface_synth.json"

    if cmp -s \
        "$partition_dir/interface_frontend.json" \
        "$partition_dir/interface_synth.json"
    then
        echo "  PASS: root interface preserved"
    else
        echo "  FAIL: root interface changed"
        diff -u \
            "$partition_dir/interface_frontend.json" \
            "$partition_dir/interface_synth.json" || true
        failed=1
    fi

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [.key, .value.root_module]
        | @tsv
    ' "$MANIFEST_FILE"
)

echo

if [[ "$failed" -ne 0 ]]; then
    echo "Partition output checks failed."
    exit 1
fi

echo "All partition output checks passed."
