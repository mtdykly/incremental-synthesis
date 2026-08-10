#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <base_source_dir> <base_hier_json> \\"
    echo "     <base_fine_manifest.json> <partition_name> \\"
    echo "     <output_cache_dir>"
}

if [[ $# -ne 5 ]]; then
    usage
    exit 1
fi

BASE_SOURCE_DIR="$(realpath "$1")"
BASE_HIER_JSON="$(realpath "$2")"
BASE_FINE_MANIFEST="$(realpath "$3")"
PARTITION_NAME="$4"
OUTPUT_DIR="$(realpath -m "$5")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

BUILD_MANIFEST="$REPO_ROOT/partition-incremental/scripts/build_fine_partition_manifest.py"
SYNTH_PARTITION="$REPO_ROOT/partition-incremental/scripts/synth_partition.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"

for required in \
    "$BASE_SOURCE_DIR" \
    "$BASE_HIER_JSON" \
    "$BASE_FINE_MANIFEST" \
    "$BUILD_MANIFEST" \
    "$SYNTH_PARTITION" \
    "$SYNTH_TOP_SHELL"
do
    if [[ ! -e "$required" ]]; then
        echo "ERROR: required path missing:"
        echo "  $required"
        exit 1
    fi
done

rm -rf "$OUTPUT_DIR"

mkdir -p \
    "$OUTPUT_DIR/regions" \
    "$OUTPUT_DIR/root-shell"

FINE_PARTITION_MANIFEST="$OUTPUT_DIR/fine_partition_manifest.json"

python3 "$BUILD_MANIFEST" \
    --fine-manifest "$BASE_FINE_MANIFEST" \
    --partition "$PARTITION_NAME" \
    --output "$FINE_PARTITION_MANIFEST"

echo
echo "============================================================"
echo "Build Base fine-region cache"
echo "Partition: $PARTITION_NAME"
echo "============================================================"

while IFS=$'\t' read -r region_name root_module
do
    echo
    echo "------------------------------------------------------------"
    echo "Region: $region_name"
    echo "Root  : $root_module"
    echo "------------------------------------------------------------"

    "$SYNTH_PARTITION" \
        "$BASE_SOURCE_DIR" \
        "$OUTPUT_DIR/regions/$region_name" \
        "$region_name" \
        "$root_module"

done < <(
    jq -r '
      .partitions
      | to_entries[]
      | [
          .key,
          .value.root_module
        ]
      | @tsv
    ' "$FINE_PARTITION_MANIFEST"
)

echo
echo "============================================================"
echo "Build Base root-shell cache"
echo "============================================================"

"$SYNTH_TOP_SHELL" \
    "$BASE_HIER_JSON" \
    "$FINE_PARTITION_MANIFEST" \
    "$OUTPUT_DIR/root-shell"

jq -n \
    --arg partition "$PARTITION_NAME" \
    --arg manifest "$FINE_PARTITION_MANIFEST" \
    '{
        partition: $partition,
        manifest: $manifest,
        status: "ready"
    }' \
    > "$OUTPUT_DIR/cache_summary.json"

echo
echo "Fine Base cache ready:"
echo "  $OUTPUT_DIR"