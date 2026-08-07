#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir>"
    echo
    echo "Example:"
    echo "  $0 eco-003 benchmarks/riscv-eco-003-new"
}

if [[ $# -lt 2 || $# -gt 4 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"
STRATEGY_TIMEOUT="${3:-1800}"
PARTITION_TIMEOUT="${4:-7200}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

NEW_OUT="$CASE_OUT/new"
INCREMENTAL_OUT="$CASE_OUT/incremental"
REFERENCE_OUT="$NEW_OUT/partitioned-reference"
VERIFY_OUT="$CASE_OUT/verification/eqy-compositional"

SYNTH_REFERENCE="$REPO_ROOT/partition-incremental/scripts/synth_partitioned_reference.sh"
VERIFY_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/verify_incremental_partitions_eqy.sh"
VERIFY_TOP="$REPO_ROOT/partition-incremental/scripts/verify_top_shell_structure.py"

NEW_HIER_JSON="$NEW_OUT/frontend_hier.json"
NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
INCREMENTAL_LINKED="$INCREMENTAL_OUT/linked/linked.json"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$INCREMENTAL_LINKED" \
    "$SYNTH_REFERENCE" \
    "$VERIFY_PARTITIONS" \
    "$VERIFY_TOP"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

# Build the all-New partitioned reference only when it is missing.
# This is verification-only work and is excluded from synthesis timing.
if [[ ! -s "$REFERENCE_OUT/linked/linked.json" ]]; then
    "$SYNTH_REFERENCE" \
        "$NEW_SOURCE_DIR" \
        "$NEW_HIER_JSON" \
        "$NEW_MANIFEST" \
        "$REFERENCE_OUT"
fi

rm -rf "$VERIFY_OUT"
mkdir -p "$VERIFY_OUT"

echo
echo "============================================================"
echo "1. Verify the New and incremental top shells structurally"
echo "============================================================"

python3 "$VERIFY_TOP" \
    --gold-json \
        "$REFERENCE_OUT/top-shell/top_shell.json" \
    --gate-json \
        "$INCREMENTAL_OUT/top-shell/top_shell.json" \
    --top riscv_core \
    --output-dir "$VERIFY_OUT/top-shell"

echo
echo "============================================================"
echo "2. Verify each user-defined partition with EQY"
echo "============================================================"

"$VERIFY_PARTITIONS" \
    "$CASE_NAME" \
    "$STRATEGY_TIMEOUT" \
    "$PARTITION_TIMEOUT"

cp \
  "$CASE_OUT/verification/eqy-partitions/summary.json" \
  "$VERIFY_OUT/partition_summary.json"

jq -n \
    --arg status "PASS" \
    --arg case_name "$CASE_NAME" \
    --arg method "user_partition_compositional_eqy" \
    --arg top_shell_summary \
        "$VERIFY_OUT/top-shell/summary.json" \
    --arg partition_summary \
        "$VERIFY_OUT/partition_summary.json" \
    '{
        status: $status,
        case_name: $case_name,
        method: $method,
        top_shell_summary: $top_shell_summary,
        partition_summary: $partition_summary,
        conclusion: (
            "All user-defined partitions are equivalent " +
            "to their all-New references and the top-shell " +
            "connectivity is identical."
        )
    }' \
    > "$VERIFY_OUT/summary.json"

echo
echo "Compositional EQY validation passed."
cat "$VERIFY_OUT/summary.json"
