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

FULL_NEW_OUT="$NEW_OUT/full-reference"
VERIFY_OUT="$CASE_OUT/verification/incremental-vs-full-new"

SYNTH_FULL="$REPO_ROOT/partition-incremental/scripts/synth_full_reference.sh"
VERIFY="$REPO_ROOT/partition-incremental/scripts/verify_full_vs_linked.sh"

NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
LINKED_JSON="$INCREMENTAL_OUT/linked/linked.json"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$NEW_MANIFEST" \
    "$LINKED_JSON" \
    "$SYNTH_FULL" \
    "$VERIFY"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

# New 全量综合仅用于验证，
# 不计入增量构建时间。
rm -rf "$FULL_NEW_OUT" "$VERIFY_OUT"

"$SYNTH_FULL" \
    "$NEW_SOURCE_DIR" \
    "$FULL_NEW_OUT" \
    riscv_core

"$VERIFY" \
    "$FULL_NEW_OUT/full_reference.json" \
    "$LINKED_JSON" \
    "$NEW_MANIFEST" \
    "$VERIFY_OUT"

echo
echo "Incremental-vs-Full-New equivalence proven."

cat "$VERIFY_OUT/summary.json"
