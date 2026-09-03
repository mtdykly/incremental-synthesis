#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <partition_manifest.json> <top_shell.json> <partitions_dir>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

MANIFEST="$(realpath "$1")"
TOP_SHELL_JSON="$(realpath "$2")"
PARTITIONS_DIR="$(realpath "$3")"

TOP_MODULE="$(
    jq -r '.top.module_name' "$MANIFEST"
)"

failed=0
temporary_dir="$(mktemp -d)"

cleanup() {
    rm -rf "$temporary_dir"
}

trap cleanup EXIT

echo "Checking top shell: $TOP_MODULE"
echo

if ! jq -e \
    --arg top "$TOP_MODULE" \
    '.modules[$top] != null' \
    "$TOP_SHELL_JSON" >/dev/null
then
    echo "FAIL: top module is missing"
    exit 1
fi

expected_modules="$temporary_dir/expected_modules.txt"
actual_modules="$temporary_dir/actual_modules.txt"

{
    echo "$TOP_MODULE"

    jq -r '
        .partitions
        | to_entries[]
        | .value.root_module
    ' "$MANIFEST"
} | sort -u > "$expected_modules"

jq -r \
    '.modules | keys[]' \
    "$TOP_SHELL_JSON" |
sort -u > "$actual_modules"

if diff -u "$expected_modules" "$actual_modules"; then
    echo "PASS: top shell contains only top and partition roots"
else
    echo "FAIL: unexpected modules remain in top shell"
    failed=1
fi

while IFS=$'\t' read -r \
    partition_name \
    instance_name \
    root_module
do
    echo
    echo "Partition: $partition_name"
    echo "  Instance: $instance_name"
    echo "  Module  : $root_module"

    if jq -e \
        --arg top "$TOP_MODULE" \
        --arg instance "$instance_name" \
        --arg root "$root_module" \
        '
        .modules[$top].cells[$instance] != null
        and
        .modules[$top].cells[$instance].type == $root
        ' \
        "$TOP_SHELL_JSON" >/dev/null
    then
        echo "  PASS: partition instance remains in top shell"
    else
        echo "  FAIL: partition instance is missing or has wrong type"
        failed=1
    fi

    if jq -e \
        --arg root "$root_module" \
        '
        .modules[$root] != null
        and
        .modules[$root].attributes.blackbox != null
        ' \
        "$TOP_SHELL_JSON" >/dev/null
    then
        echo "  PASS: partition root is a blackbox"
    else
        echo "  FAIL: partition root is not a blackbox"
        failed=1
    fi

    partition_json="$PARTITIONS_DIR/$partition_name/synth.json"

    if [[ ! -f "$partition_json" ]]; then
        echo "  FAIL: partition synth.json is missing"
        failed=1
        continue
    fi

    shell_interface="$temporary_dir/${partition_name}_shell.json"
    partition_interface="$temporary_dir/${partition_name}_partition.json"

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
        | sort_by(.name)
        ' \
        "$TOP_SHELL_JSON" \
        > "$shell_interface"

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
        | sort_by(.name)
        ' \
        "$partition_json" \
        > "$partition_interface"

    if cmp -s "$shell_interface" "$partition_interface"; then
        echo "  PASS: blackbox and partition interfaces match"
    else
        echo "  FAIL: interface mismatch"
        diff -u "$shell_interface" "$partition_interface" || true
        failed=1
    fi

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [
            .key,
            .value.root_instance_name,
            .value.root_module
          ]
        | @tsv
    ' "$MANIFEST"
)

echo

if [[ "$failed" -ne 0 ]]; then
    echo "Top shell checks failed."
    exit 1
fi

echo "All top shell checks passed."
