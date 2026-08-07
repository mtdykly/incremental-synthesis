#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir>"
}

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
NEW_OUT="$CASE_OUT/new"
INCREMENTAL_OUT="$CASE_OUT/incremental"

PARTITIONED_REFERENCE_OUT="$NEW_OUT/partitioned-reference"
VERIFY_OUT="$CASE_OUT/verification/incremental-vs-partitioned-new"

SYNTH_PARTITIONED_REFERENCE="$REPO_ROOT/partition-incremental/scripts/synth_partitioned_reference.sh"
VERIFY="$REPO_ROOT/partition-incremental/scripts/verify_full_vs_linked.sh"

NEW_HIER_JSON="$NEW_OUT/frontend_hier.json"
NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
INCREMENTAL_LINKED_JSON="$INCREMENTAL_OUT/linked/linked.json"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$INCREMENTAL_LINKED_JSON" \
    "$SYNTH_PARTITIONED_REFERENCE" \
    "$VERIFY"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

# The partitioned New reference is generated only for validation.
# It is not included in the incremental synthesis benchmark time.
rm -rf "$PARTITIONED_REFERENCE_OUT" "$VERIFY_OUT"

echo
echo "============================================================"
echo "1. Build an all-New partitioned reference"
echo "============================================================"

"$SYNTH_PARTITIONED_REFERENCE" \
    "$NEW_SOURCE_DIR" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$PARTITIONED_REFERENCE_OUT"

REFERENCE_LINKED_JSON="$PARTITIONED_REFERENCE_OUT/linked/linked.json"

echo
echo "============================================================"
echo "2. Verify partitioned New reference vs incremental result"
echo "============================================================"

"$VERIFY" \
    "$REFERENCE_LINKED_JSON" \
    "$INCREMENTAL_LINKED_JSON" \
    "$NEW_MANIFEST" \
    "$VERIFY_OUT"

jq -n \
    --arg status "proven" \
    --arg case_name "$CASE_NAME" \
    --arg reference_kind "all_new_partitioned_reference" \
    --arg reference_design "$REFERENCE_LINKED_JSON" \
    --arg incremental_design "$INCREMENTAL_LINKED_JSON" \
    --arg equivalence_summary "$VERIFY_OUT/summary.json" \
    '{
        status: $status,
        case_name: $case_name,
        reference_kind: $reference_kind,
        reference_design: $reference_design,
        incremental_design: $incremental_design,
        equivalence_summary: $equivalence_summary
    }' \
    > "$VERIFY_OUT/validation_summary.json"

echo
echo "Partitioned-New vs incremental equivalence proven."
echo
cat "$VERIFY_OUT/validation_summary.json"
