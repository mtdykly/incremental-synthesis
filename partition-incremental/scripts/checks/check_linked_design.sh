#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <partition_manifest.json> <linked.json>"
}

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

MANIFEST="$(realpath "$1")"
LINKED_JSON="$(realpath "$2")"

TOP_MODULE="$(
    jq -r '.top.module_name' "$MANIFEST"
)"

failed=0
temporary_dir="$(mktemp -d)"

cleanup() {
    rm -rf "$temporary_dir"
}

trap cleanup EXIT

expected_modules="$temporary_dir/expected.txt"
actual_modules="$temporary_dir/actual.txt"

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
    "$LINKED_JSON" |
sort -u > "$actual_modules"

if diff -u "$expected_modules" "$actual_modules"; then
    echo "PASS: linked design contains expected modules"
else
    echo "FAIL: linked design module set is incorrect"
    failed=1
fi

while IFS=$'\t' read -r instance_name root_module
do
    if jq -e \
        --arg top "$TOP_MODULE" \
        --arg instance "$instance_name" \
        --arg root "$root_module" \
        '
        .modules[$top].cells[$instance] != null
        and
        .modules[$top].cells[$instance].type == $root
        and
        .modules[$root] != null
        ' \
        "$LINKED_JSON" >/dev/null
    then
        echo "PASS: $instance_name resolves to $root_module"
    else
        echo "FAIL: $instance_name does not resolve to $root_module"
        failed=1
    fi

    if jq -e \
        --arg root "$root_module" \
        '
        (.modules[$root].attributes.blackbox // null) == null
        ' \
        "$LINKED_JSON" >/dev/null
    then
        echo "PASS: $root_module has a real implementation"
    else
        echo "FAIL: $root_module is still a blackbox"
        failed=1
    fi

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [
            .value.root_instance_name,
            .value.root_module
          ]
        | @tsv
    ' "$MANIFEST"
)

echo

if [[ "$failed" -ne 0 ]]; then
    echo "Linked design checks failed."
    exit 1
fi

echo "All linked design checks passed."
