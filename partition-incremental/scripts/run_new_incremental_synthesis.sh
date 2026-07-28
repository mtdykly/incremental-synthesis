#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

PREPARE_PLAN="$REPO_ROOT/partition-incremental/scripts/prepare_new_reuse_plan.sh"
BUILD_INCREMENTAL="$REPO_ROOT/partition-incremental/scripts/build_incremental_design.sh"

echo
echo "============================================================"
echo "Phase 1: New cache invalidation analysis"
echo "============================================================"

"$PREPARE_PLAN" \
    "$CASE_NAME" \
    "$NEW_SOURCE_DIR"

echo
echo "============================================================"
echo "Phase 2: Incremental synthesis and linking"
echo "============================================================"

"$BUILD_INCREMENTAL" \
    "$CASE_NAME" \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR"
