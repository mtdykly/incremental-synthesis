#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <gold_synth.json> <gate_synth.json> <root_module> <output_dir> [timeout_seconds]"
}

if [[ $# -lt 4 || $# -gt 5 ]]; then
    usage
    exit 1
fi

GOLD_JSON="$(realpath "$1")"
GATE_JSON="$(realpath "$2")"
ROOT_MODULE="$3"
OUTPUT_DIR="$(realpath -m "$4")"
TIMEOUT_SECONDS="${5:-600}"

for required_file in "$GOLD_JSON" "$GATE_JSON"; do
    if [[ ! -s "$required_file" ]]; then
        echo "ERROR: required JSON is missing or empty:"
        echo "  $required_file"
        exit 1
    fi
done

if ! [[ "$TIMEOUT_SECONDS" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: timeout_seconds must be a positive integer"
    exit 1
fi

if ! command -v eqy >/dev/null 2>&1; then
    echo "ERROR: eqy is not available."
    echo "This fallback is only needed when rebuilt partition hashes differ."
    exit 3
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

CONFIG_FILE="$OUTPUT_DIR/run.eqy"
EQY_RUN_DIR="$OUTPUT_DIR/work"
LOG_FILE="$OUTPUT_DIR/eqy.log"

cat > "$CONFIG_FILE" <<EOF
[options]
splitnets on

[gold]
read_json "$GOLD_JSON"
hierarchy -check -top $ROOT_MODULE
async2sync
memory_map
opt_clean

[gate]
read_json "$GATE_JSON"
hierarchy -check -top $ROOT_MODULE
async2sync
memory_map
opt_clean

[strategy quick_sat]
use sat
depth 2

[strategy pdr]
use sby
engine abc pdr
timeout $TIMEOUT_SECONDS
EOF

SMT_SOLVER=""
for candidate in bitwuzla boolector yices-smt2 z3; do
    if command -v "$candidate" >/dev/null 2>&1; then
        SMT_SOLVER="$candidate"
        break
    fi
done

if [[ -n "$SMT_SOLVER" ]]; then
    cat >> "$CONFIG_FILE" <<EOF

[strategy smt_induction]
use sby
engine smtbmc $SMT_SOLVER
depth 5
timeout $TIMEOUT_SECONDS
EOF
fi

START_NS="$(date +%s%N)"

set +e
timeout \
    --signal=TERM \
    --kill-after=30s \
    "${TIMEOUT_SECONDS}s" \
    eqy \
        -f \
        -j "${EQY_JOBS:-2}" \
        -d "$EQY_RUN_DIR" \
        "$CONFIG_FILE" \
    > "$LOG_FILE" 2>&1
RC=$?
set -e

END_NS="$(date +%s%N)"

ELAPSED_SECONDS="$(
    python3 - "$START_NS" "$END_NS" <<'PY'
import sys
start = int(sys.argv[1])
end = int(sys.argv[2])
print(f"{(end - start) / 1_000_000_000:.6f}")
PY
)"

if [[ -f "$EQY_RUN_DIR/PASS" ]]; then
    STATUS="PASS"
elif [[ "$RC" -eq 124 || "$RC" -eq 137 ]]; then
    STATUS="TIMEOUT"
elif [[ -f "$EQY_RUN_DIR/FAIL" ]]; then
    STATUS="FAIL"
elif [[ -f "$EQY_RUN_DIR/UNKNOWN" ]]; then
    STATUS="UNKNOWN"
else
    STATUS="ERROR"
fi

jq -n \
    --arg status "$STATUS" \
    --arg root_module "$ROOT_MODULE" \
    --arg gold_json "$GOLD_JSON" \
    --arg gate_json "$GATE_JSON" \
    --arg elapsed_seconds "$ELAPSED_SECONDS" \
    --argjson return_code "$RC" \
    '{
        status: $status,
        root_module: $root_module,
        gold_json: $gold_json,
        gate_json: $gate_json,
        elapsed_seconds: ($elapsed_seconds | tonumber),
        return_code: $return_code
    }' \
    > "$OUTPUT_DIR/summary.json"

cat "$OUTPUT_DIR/summary.json"

if [[ "$STATUS" != "PASS" ]]; then
    exit 2
fi
