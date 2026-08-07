#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> [strategy_timeout_seconds] [partition_timeout_seconds]"
    echo
    echo "Example:"
    echo "  $0 eco-003 300 900"
}

if [[ $# -lt 1 || $# -gt 3 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
STRATEGY_TIMEOUT="${2:-300}"
PARTITION_TIMEOUT="${3:-900}"

if ! [[ "$STRATEGY_TIMEOUT" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: strategy timeout must be a positive integer"
    exit 1
fi

if ! [[ "$PARTITION_TIMEOUT" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: partition timeout must be a positive integer"
    exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

MANIFEST="$CASE_OUT/new/partition_manifest.json"
GOLD_PARTITIONS="$CASE_OUT/new/partitioned-reference/partitions"
GATE_PARTITIONS="$CASE_OUT/incremental/partitions"

OUTPUT_DIR="$CASE_OUT/verification/eqy-partitions"
CONFIG_DIR="$OUTPUT_DIR/configs"
RUN_DIR="$OUTPUT_DIR/runs"
LOG_DIR="$OUTPUT_DIR/logs"

for command_name in yosys eqy sby jq timeout; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
        echo "ERROR: command not found: $command_name"
        exit 1
    fi
done

for required_path in \
    "$MANIFEST" \
    "$GOLD_PARTITIONS" \
    "$GATE_PARTITIONS"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

SMT_SOLVER="${EQY_SMT_SOLVER:-}"

if [[ -z "$SMT_SOLVER" ]]; then
    for candidate in bitwuzla boolector yices-smt2 z3; do
        if command -v "$candidate" >/dev/null 2>&1; then
            SMT_SOLVER="$candidate"
            break
        fi
    done
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$CONFIG_DIR" "$RUN_DIR" "$LOG_DIR"

RESULTS_TSV="$OUTPUT_DIR/results.tsv"
printf 'partition\troot_module\tstatus\tmethod\tseconds\treturn_code\n' \
    > "$RESULTS_TSV"

OVERALL_STATUS="PASS"

while IFS=$'\t' read -r partition_name root_module
do
    GOLD_JSON="$GOLD_PARTITIONS/$partition_name/synth.json"
    GATE_JSON="$GATE_PARTITIONS/$partition_name/synth.json"

    for required_file in "$GOLD_JSON" "$GATE_JSON"; do
        if [[ ! -s "$required_file" ]]; then
            echo "ERROR: partition JSON is missing or empty:"
            echo "  $required_file"
            exit 1
        fi
    done

    echo
    echo "============================================================"
    echo "EQY partition : $partition_name"
    echo "Root module   : $root_module"
    echo "============================================================"

    GOLD_SHA="$(
        sha256sum "$GOLD_JSON" | awk '{print $1}'
    )"
    GATE_SHA="$(
        sha256sum "$GATE_JSON" | awk '{print $1}'
    )"

    if [[ "$GOLD_SHA" == "$GATE_SHA" ]]; then
        printf '%s\t%s\tPASS\tidentical_json_hash\t0.000000\t0\n' \
            "$partition_name" \
            "$root_module" \
            >> "$RESULTS_TSV"

        echo "PASS: identical synth.json hashes"
        continue
    fi

    CONFIG_FILE="$CONFIG_DIR/$partition_name.eqy"
    PARTITION_RUN_DIR="$RUN_DIR/$partition_name"
    PARTITION_LOG="$LOG_DIR/$partition_name.log"

    {
        echo "[options]"
        echo "splitnets on"
        echo
        echo "[gold]"
        printf 'read_json "%s"\n' "$GOLD_JSON"
        printf 'hierarchy -check -top %s\n' "$root_module"
        echo "async2sync"
        echo "memory_map"
        echo "opt_clean"
        echo
        echo "[gate]"
        printf 'read_json "%s"\n' "$GATE_JSON"
        printf 'hierarchy -check -top %s\n' "$root_module"
        echo "async2sync"
        echo "memory_map"
        echo "opt_clean"
        echo
        echo "[strategy quick_sat]"
        echo "use sat"
        echo "depth 2"
        echo
        echo "[strategy pdr]"
        echo "use sby"
        echo "engine abc pdr"
        printf 'timeout %s\n' "$STRATEGY_TIMEOUT"

        if [[ -n "$SMT_SOLVER" ]]; then
            echo
            echo "[strategy smt_induction]"
            echo "use sby"
            printf 'engine smtbmc %s\n' "$SMT_SOLVER"
            echo "depth 5"
            printf 'timeout %s\n' "$STRATEGY_TIMEOUT"
        fi
    } > "$CONFIG_FILE"

    START_NS="$(date +%s%N)"

    set +e
    timeout \
        --signal=TERM \
        --kill-after=30s \
        "${PARTITION_TIMEOUT}s" \
        eqy \
            -f \
            -j "${EQY_JOBS:-2}" \
            -d "$PARTITION_RUN_DIR" \
            "$CONFIG_FILE" \
        > "$PARTITION_LOG" 2>&1
    RETURN_CODE=$?
    set -e

    END_NS="$(date +%s%N)"

    SECONDS="$(
        python3 - "$START_NS" "$END_NS" <<'PY'
import sys

start = int(sys.argv[1])
end = int(sys.argv[2])

print(f"{(end - start) / 1_000_000_000:.6f}")
PY
    )"

    if [[ -f "$PARTITION_RUN_DIR/PASS" ]]; then
        STATUS="PASS"
        METHOD="eqy"
    elif [[ -f "$PARTITION_RUN_DIR/FAIL" ]]; then
        STATUS="FAIL"
        METHOD="eqy"
        OVERALL_STATUS="FAIL"
    elif [[ "$RETURN_CODE" -eq 124 \
         || "$RETURN_CODE" -eq 137 ]]
    then
        STATUS="TIMEOUT"
        METHOD="eqy"
        OVERALL_STATUS="FAIL"
    elif [[ -f "$PARTITION_RUN_DIR/UNKNOWN" ]]; then
        STATUS="UNKNOWN"
        METHOD="eqy"
        OVERALL_STATUS="FAIL"
    else
        STATUS="ERROR"
        METHOD="eqy"
        OVERALL_STATUS="FAIL"
    fi

    printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$partition_name" \
        "$root_module" \
        "$STATUS" \
        "$METHOD" \
        "$SECONDS" \
        "$RETURN_CODE" \
        >> "$RESULTS_TSV"

    echo "$STATUS: $partition_name (${SECONDS}s)"
    echo "Log: $PARTITION_LOG"

done < <(
    jq -r '
        .partitions
        | to_entries[]
        | [
            .key,
            .value.root_module
          ]
        | @tsv
    ' "$MANIFEST"
)

python3 - \
    "$RESULTS_TSV" \
    "$OUTPUT_DIR/summary.json" \
    "$OVERALL_STATUS" <<'PY'
import csv
import json
import sys

results_path = sys.argv[1]
summary_path = sys.argv[2]
overall_status = sys.argv[3]

with open(results_path, encoding="utf-8") as file:
    rows = list(
        csv.DictReader(
            file,
            delimiter="\t",
        )
    )

for row in rows:
    row["seconds"] = float(row["seconds"])
    row["return_code"] = int(row["return_code"])

summary = {
    "status": overall_status,
    "partition_count": len(rows),
    "pass_count": sum(
        row["status"] == "PASS"
        for row in rows
    ),
    "fail_count": sum(
        row["status"] != "PASS"
        for row in rows
    ),
    "partitions": rows,
}

with open(summary_path, "w", encoding="utf-8") as file:
    json.dump(summary, file, indent=2)
    file.write("\n")

print()
print(json.dumps(summary, indent=2))
PY

if [[ "$OVERALL_STATUS" != "PASS" ]]; then
    exit 2
fi
