#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <new_source_dir> [eqy_timeout_seconds]"
    echo
    echo "Validation policy:"
    echo "  reuse   -> signatures + environment + cache byte identity"
    echo "  rebuild -> independent New rebuild hash, EQY only on mismatch"
    echo "  top     -> independently generated New top-shell structure"
}

if [[ $# -lt 2 || $# -gt 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
NEW_SOURCE_DIR="$(realpath "$2")"
EQY_TIMEOUT="${3:-600}"

if ! [[ "$EQY_TIMEOUT" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: eqy timeout must be a positive integer"
    exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
PIPELINE_DIR="$REPO_ROOT/partition-incremental/scripts/pipeline"
CHECKS_DIR="$REPO_ROOT/partition-incremental/scripts/checks"

BASE_OUT="$CASE_OUT/base"
NEW_OUT="$CASE_OUT/new"
PLAN_OUT="$CASE_OUT/plan"
INCREMENTAL_OUT="$CASE_OUT/incremental"

VERIFY_OUT="$CASE_OUT/verification/certified-compositional"
REFERENCE_OUT="$VERIFY_OUT/reference"

BASE_SIGNATURES="$BASE_OUT/partition_signatures.json"
NEW_SIGNATURES="$NEW_OUT/partition_signatures.json"
NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
NEW_HIER_JSON="$NEW_OUT/frontend_hier.json"
REUSE_PLAN="$PLAN_OUT/reuse_plan.json"

BASE_PARTITIONS="$BASE_OUT/partitions"
INCREMENTAL_PARTITIONS="$INCREMENTAL_OUT/partitions"

SYNTH_PARTITION="$PIPELINE_DIR/synth_partition.sh"
SYNTH_TOP_SHELL="$PIPELINE_DIR/synth_top_shell.sh"
VERIFY_TOP_STRUCTURE="$CHECKS_DIR/verify_top_shell_structure.py"
VERIFY_PARTITION_EQY="$CHECKS_DIR/verify_partition_with_eqy.sh"

for required_path in \
    "$NEW_SOURCE_DIR" \
    "$BASE_SIGNATURES" \
    "$NEW_SIGNATURES" \
    "$NEW_MANIFEST" \
    "$NEW_HIER_JSON" \
    "$REUSE_PLAN" \
    "$BASE_PARTITIONS" \
    "$INCREMENTAL_PARTITIONS" \
    "$INCREMENTAL_OUT/top-shell/top_shell.json" \
    "$SYNTH_PARTITION" \
    "$SYNTH_TOP_SHELL" \
    "$VERIFY_TOP_STRUCTURE" \
    "$VERIFY_PARTITION_EQY"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

TOP_MODULE="$(
    jq -r '.top.module_name' "$NEW_MANIFEST"
)"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing from manifest"
    exit 1
fi

BASE_ENV="$(
    jq -r '.partition_environment_signature' \
        "$BASE_SIGNATURES"
)"

NEW_ENV="$(
    jq -r '.partition_environment_signature' \
        "$NEW_SIGNATURES"
)"

rm -rf "$VERIFY_OUT"
mkdir -p \
    "$VERIFY_OUT" \
    "$REFERENCE_OUT/partitions" \
    "$REFERENCE_OUT/top-shell" \
    "$VERIFY_OUT/eqy"

RESULTS_TSV="$VERIFY_OUT/partitions.tsv"

printf 'partition\troot_module\taction\tstatus\tmethod\tdetail\n' \
    > "$RESULTS_TSV"

OVERALL_STATUS="PASS"

file_sha256() {
    sha256sum "$1" | awk '{print $1}'
}

files_identical() {
    local left="$1"
    local right="$2"

    [[ -s "$left" ]] \
        && [[ -s "$right" ]] \
        && cmp -s "$left" "$right"
}

echo
echo "============================================================"
echo "1. Validate partitions"
echo "============================================================"

while IFS=$'\t' read -r partition_name root_module
do
    action="$(
        jq -r \
            --arg p "$partition_name" \
            '.decisions[$p].status // empty' \
            "$REUSE_PLAN"
    )"

    echo
    echo "Partition : $partition_name"
    echo "Root      : $root_module"
    echo "Action    : $action"

    status="FAIL"
    method=""
    detail=""

    if [[ "$action" == "reuse" ]]; then
        base_interface="$(
            jq -r \
                --arg p "$partition_name" \
                '.partitions[$p].interface_signature // empty' \
                "$BASE_SIGNATURES"
        )"

        new_interface="$(
            jq -r \
                --arg p "$partition_name" \
                '.partitions[$p].interface_signature // empty' \
                "$NEW_SIGNATURES"
        )"

        base_impl="$(
            jq -r \
                --arg p "$partition_name" \
                '.partitions[$p].implementation_signature // empty' \
                "$BASE_SIGNATURES"
        )"

        new_impl="$(
            jq -r \
                --arg p "$partition_name" \
                '.partitions[$p].implementation_signature // empty' \
                "$NEW_SIGNATURES"
        )"

        plan_reasons="$(
            jq -c \
                --arg p "$partition_name" \
                '.decisions[$p].reasons // []' \
                "$REUSE_PLAN"
        )"

        if [[ "$BASE_ENV" != "$NEW_ENV" ]]; then
            detail="partition_environment_signature_mismatch"

        elif [[ "$base_interface" != "$new_interface" ]]; then
            detail="interface_signature_mismatch"

        elif [[ "$base_impl" != "$new_impl" ]]; then
            detail="implementation_signature_mismatch"

        elif [[ "$plan_reasons" != "[]" ]]; then
            detail="reuse_plan_contains_rebuild_reasons"

        else
            cache_dir="$BASE_PARTITIONS/$partition_name"
            incremental_dir="$INCREMENTAL_PARTITIONS/$partition_name"

            cache_ok=true

            for artifact in \
                synth.json \
                synth.rtlil \
                partition_netlist.v
            do
                if ! files_identical \
                    "$cache_dir/$artifact" \
                    "$incremental_dir/$artifact"
                then
                    cache_ok=false
                    detail="materialized_cache_differs:$artifact"
                    break
                fi
            done

            if [[ "$cache_ok" == true ]]; then
                status="PASS"
                method="certified_reuse"
                detail="same_interface+same_IR+same_environment+exact_base_cache_copy"
            fi
        fi

    elif [[ "$action" == "rebuild" ]]; then
        reference_dir="$REFERENCE_OUT/partitions/$partition_name"

        "$SYNTH_PARTITION" \
            "$NEW_SOURCE_DIR" \
            "$reference_dir" \
            "$partition_name" \
            "$root_module"

        incremental_dir="$INCREMENTAL_PARTITIONS/$partition_name"

        all_identical=true

        for artifact in \
            synth.json \
            synth.rtlil \
            partition_netlist.v
        do
            if ! files_identical \
                "$reference_dir/$artifact" \
                "$incremental_dir/$artifact"
            then
                all_identical=false
                break
            fi
        done

        if [[ "$all_identical" == true ]]; then
            status="PASS"
            method="identical_new_reference"
            detail="independent_New_rebuild_is_byte_identical"
        else
            echo "Rebuild hashes differ; invoking EQY fallback..."

            eqy_out="$VERIFY_OUT/eqy/$partition_name"

            set +e
            "$VERIFY_PARTITION_EQY" \
                "$reference_dir/synth.json" \
                "$incremental_dir/synth.json" \
                "$root_module" \
                "$eqy_out" \
                "$EQY_TIMEOUT"
            eqy_rc=$?
            set -e

            if [[ "$eqy_rc" -eq 0 ]]; then
                status="PASS"
                method="eqy_fallback"
                detail="hash_mismatch_but_EQY_proved_equivalent"
            else
                status="FAIL"
                method="eqy_fallback"
                detail="hash_mismatch_and_EQY_not_proven"
            fi
        fi

    else
        detail="invalid_or_missing_reuse_plan_action"
    fi

    if [[ "$status" != "PASS" ]]; then
        OVERALL_STATUS="FAIL"
    fi

    printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$partition_name" \
        "$root_module" \
        "$action" \
        "$status" \
        "$method" \
        "$detail" \
        >> "$RESULTS_TSV"

    echo "$status: $method ($detail)"

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [
            .key,
            .value.root_module
          ]
        | @tsv
    ' "$NEW_MANIFEST"
)

echo
echo "============================================================"
echo "2. Validate top shell"
echo "============================================================"

"$SYNTH_TOP_SHELL" \
    "$NEW_HIER_JSON" \
    "$NEW_MANIFEST" \
    "$REFERENCE_OUT/top-shell"

TOP_STATUS="PASS"

set +e
python3 "$VERIFY_TOP_STRUCTURE" \
    --gold-json "$REFERENCE_OUT/top-shell/top_shell.json" \
    --gate-json "$INCREMENTAL_OUT/top-shell/top_shell.json" \
    --top "$TOP_MODULE" \
    --output-dir "$VERIFY_OUT/top-shell"
top_rc=$?
set -e

if [[ "$top_rc" -ne 0 ]]; then
    TOP_STATUS="FAIL"
    OVERALL_STATUS="FAIL"
fi

echo
echo "============================================================"
echo "3. Write validation summary"
echo "============================================================"

python3 - \
    "$RESULTS_TSV" \
    "$VERIFY_OUT/summary.json" \
    "$OVERALL_STATUS" \
    "$TOP_STATUS" \
    "$CASE_NAME" <<'PY'
import csv
import json
import sys

tsv_path, output_path, overall, top_status, case_name = sys.argv[1:]

with open(tsv_path, encoding="utf-8") as file:
    partitions = list(
        csv.DictReader(
            file,
            delimiter="\t",
        )
    )

summary = {
    "case_name": case_name,
    "status": overall,
    "validation_method": "certified_compositional",
    "top_shell_status": top_status,
    "partition_count": len(partitions),
    "pass_count": sum(
        item["status"] == "PASS"
        for item in partitions
    ),
    "methods": {
        "certified_reuse": sum(
            item["method"] == "certified_reuse"
            for item in partitions
        ),
        "identical_new_reference": sum(
            item["method"] == "identical_new_reference"
            for item in partitions
        ),
        "eqy_fallback": sum(
            item["method"] == "eqy_fallback"
            for item in partitions
        ),
    },
    "partitions": partitions,
    "statement": (
        "Reuse partitions are certified by equal isolated implementation "
        "and interface signatures under the same synthesis environment, "
        "plus exact cache materialization. Rebuilt partitions are checked "
        "against an independent New rebuild, with EQY only as a fallback. "
        "The top-shell connectivity is checked structurally."
    ),
}

with open(output_path, "w", encoding="utf-8") as file:
    json.dump(
        summary,
        file,
        indent=2,
        ensure_ascii=False,
    )
    file.write("\n")

print(json.dumps(summary, indent=2, ensure_ascii=False))
PY

if [[ "$OVERALL_STATUS" != "PASS" ]]; then
    echo
    echo "ERROR: certified compositional validation failed."
    exit 2
fi

echo
echo "Certified compositional validation passed."
echo "Summary:"
echo "  $VERIFY_OUT/summary.json"
