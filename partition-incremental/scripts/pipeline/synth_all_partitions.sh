#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <source_dir> <partition_manifest.json> <output_dir>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

SOURCE_DIR="$(realpath "$1")"
MANIFEST_FILE="$(realpath "$2")"
OUTPUT_DIR="$(realpath -m "$3")"

REPO_ROOT="$(git rev-parse --show-toplevel)"
SYNTH_ONE="$REPO_ROOT/partition-incremental/scripts/pipeline/synth_partition.sh"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: source directory does not exist:"
    echo "  $SOURCE_DIR"
    exit 1
fi

if [[ ! -f "$MANIFEST_FILE" ]]; then
    echo "ERROR: partition manifest does not exist:"
    echo "  $MANIFEST_FILE"
    exit 1
fi

if [[ ! -x "$SYNTH_ONE" ]]; then
    echo "ERROR: synth_partition.sh is not executable:"
    echo "  $SYNTH_ONE"
    exit 1
fi

jq -e '.partitions | type == "object"' \
    "$MANIFEST_FILE" >/dev/null

mkdir -p "$OUTPUT_DIR"

SUMMARY_FILE="$OUTPUT_DIR/synthesis_summary.tsv"

printf 'partition\troot_module\treal_seconds\n' \
    > "$SUMMARY_FILE"

while IFS=$'\t' read -r \
    partition_name \
    root_module \
    parameter_count
do
    if [[ -z "$partition_name" || -z "$root_module" ]]; then
        echo "ERROR: invalid partition record."
        exit 1
    fi

    if [[ "$root_module" == '$paramod'* ]]; then
        echo "ERROR: parameterized root modules are not supported yet:"
        echo "  partition=$partition_name"
        echo "  root=$root_module"
        exit 1
    fi

    if [[ "$parameter_count" -ne 0 ]]; then
        echo "ERROR: partition root has instance parameters:"
        echo "  partition=$partition_name"
        echo "  root=$root_module"
        echo
        echo "The first prototype only supports roots without parameters."
        exit 1
    fi

    partition_output="$OUTPUT_DIR/$partition_name"

    echo
    echo "============================================================"
    echo "Synthesizing partition: $partition_name"
    echo "Root module           : $root_module"
    echo "============================================================"

    "$SYNTH_ONE" \
        "$SOURCE_DIR" \
        "$partition_output" \
        "$partition_name" \
        "$root_module"

    real_seconds="$(
        awk '$1 == "real" {print $2}' \
            "$partition_output/time.txt"
    )"

    printf '%s\t%s\t%s\n' \
        "$partition_name" \
        "$root_module" \
        "$real_seconds" \
        >> "$SUMMARY_FILE"

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [
            .key,
            .value.root_module,
            ((.value.root_parameters // {}) | length)
          ]
        | @tsv
    ' "$MANIFEST_FILE"
)

echo
echo "All partitions synthesized."
echo "Summary:"
column -t -s $'\t' "$SUMMARY_FILE" || cat "$SUMMARY_FILE"
