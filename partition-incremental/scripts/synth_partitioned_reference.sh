#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <new_source_dir> <new_frontend_hier.json> \\"
    echo "     <new_partition_manifest.json> <output_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

NEW_SOURCE_DIR="$(realpath "$1")"
NEW_HIER_JSON="$(realpath "$2")"
NEW_MANIFEST="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

SYNTH_ALL="$REPO_ROOT/partition-incremental/scripts/synth_all_partitions.sh"
SYNTH_TOP="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"
CHECK_TOP="$REPO_ROOT/partition-incremental/scripts/check_top_shell.sh"
LINK="$REPO_ROOT/partition-incremental/scripts/link_partitions.sh"
CHECK_LINKED="$REPO_ROOT/partition-incremental/scripts/check_linked_design.sh"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$SYNTH_ALL" \
    "$SYNTH_TOP" \
    "$CHECK_TOP" \
    "$LINK" \
    "$CHECK_LINKED"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

START_NS="$(date +%s%N)"

echo
echo "============================================================"
echo "1. Synthesize every New partition"
echo "============================================================"

"$SYNTH_ALL" \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$OUTPUT_DIR/partitions"

echo
echo "============================================================"
echo "2. Synthesize the New top shell"
echo "============================================================"

"$SYNTH_TOP" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$OUTPUT_DIR/top-shell"

echo
echo "============================================================"
echo "3. Check the New top shell"
echo "============================================================"

"$CHECK_TOP" \
    "$NEW_MANIFEST" \
    "$OUTPUT_DIR/top-shell/top_shell.json" \
    "$OUTPUT_DIR/partitions"

echo
echo "============================================================"
echo "4. Link all New partitions"
echo "============================================================"

"$LINK" \
    "$OUTPUT_DIR/top-shell/top_shell_netlist.v" \
    "$NEW_MANIFEST" \
    "$OUTPUT_DIR/partitions" \
    "$OUTPUT_DIR/linked"

echo
echo "============================================================"
echo "5. Check the linked New reference"
echo "============================================================"

"$CHECK_LINKED" \
    "$NEW_MANIFEST" \
    "$OUTPUT_DIR/linked/linked.json"

END_NS="$(date +%s%N)"

ELAPSED_SECONDS="$(
    python3 - "$START_NS" "$END_NS" <<'PY'
import sys

start = int(sys.argv[1])
end = int(sys.argv[2])

print(f"{(end - start) / 1_000_000_000:.6f}")
PY
)"

PARTITION_COUNT="$(
    jq '.partitions | length' "$NEW_MANIFEST"
)"

jq -n \
    --arg source_dir "$NEW_SOURCE_DIR" \
    --arg hierarchy_json "$NEW_HIER_JSON" \
    --arg manifest "$NEW_MANIFEST" \
    --arg linked_json "$OUTPUT_DIR/linked/linked.json" \
    --arg linked_netlist "$OUTPUT_DIR/linked/linked_netlist.v" \
    --arg elapsed_seconds "$ELAPSED_SECONDS" \
    --argjson partition_count "$PARTITION_COUNT" \
    '{
        reference_kind: "all_new_partitioned_reference",
        source_dir: $source_dir,
        hierarchy_json: $hierarchy_json,
        manifest: $manifest,
        partition_count: $partition_count,
        linked_json: $linked_json,
        linked_netlist: $linked_netlist,
        build_seconds: ($elapsed_seconds | tonumber),
        note: "Verification-only reference; excluded from incremental timing"
    }' \
    > "$OUTPUT_DIR/reference_summary.json"

echo
echo "Partitioned New reference successfully generated:"
echo "  $OUTPUT_DIR/linked/linked.json"
echo "  $OUTPUT_DIR/linked/linked_netlist.v"
echo "  $OUTPUT_DIR/reference_summary.json"
