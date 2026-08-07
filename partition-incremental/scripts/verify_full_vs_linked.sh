#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <full_reference.json> <linked.json> \\"
    echo "     <partition_manifest.json> <output_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

FULL_JSON="$(realpath "$1")"
LINKED_JSON="$(realpath "$2")"
MANIFEST="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"

for required_file in \
    "$FULL_JSON" \
    "$LINKED_JSON" \
    "$MANIFEST"
do
    if [[ ! -f "$required_file" ]]; then
        echo "ERROR: required file does not exist:"
        echo "  $required_file"
        exit 1
    fi
done

TOP_MODULE="$(
    jq -r '.top.module_name' "$MANIFEST"
)"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing from manifest"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_equivalence.ys"
LOG_FILE="$OUTPUT_DIR/equivalence.log"
TIME_FILE="$OUTPUT_DIR/time.txt"

FULL_INTERFACE="$OUTPUT_DIR/full_interface.json"
LINKED_INTERFACE="$OUTPUT_DIR/linked_interface.json"

extract_interface() {
    local input_json="$1"
    local output_json="$2"

    jq -S \
        --arg top "$TOP_MODULE" \
        '
        if .modules[$top] == null then
            error("top module does not exist")
        else
            .modules[$top].ports
            | to_entries
            | map({
                name: .key,
                direction: .value.direction,
                width: (.value.bits | length)
              })
            | sort_by(.name)
        end
        ' \
        "$input_json" \
        > "$output_json"
}

extract_interface "$FULL_JSON" "$FULL_INTERFACE"
extract_interface "$LINKED_JSON" "$LINKED_INTERFACE"

if ! cmp -s "$FULL_INTERFACE" "$LINKED_INTERFACE"; then
    echo "ERROR: top-level interfaces do not match."
    diff -u "$FULL_INTERFACE" "$LINKED_INTERFACE" || true
    exit 1
fi

echo "PASS: top-level interfaces match"

yosys_quote() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '"%s"' "$value"
}

{
    printf '# ==================================================\n'
    printf '# Prepare full synthesis result as the gold design.\n'
    printf '# ==================================================\n'

    printf 'read_json '
    yosys_quote "$FULL_JSON"
    printf '\n'

    printf 'hierarchy -check -top %s\n' "$TOP_MODULE"
    printf 'flatten -noscopeinfo\n'
    printf 'opt_clean\n'

    # Normalize asynchronous FFs before SAT-based checking.
    printf 'async2sync\n'
    printf 'opt_clean\n'

    printf 'rename %s gold\n' "$TOP_MODULE"
    printf 'design -stash gold_design\n'
    printf 'design -reset\n\n'

    printf '# ==================================================\n'
    printf '# Prepare partition-linked result as the gate design.\n'
    printf '# ==================================================\n'

    printf 'read_json '
    yosys_quote "$LINKED_JSON"
    printf '\n'

    printf 'hierarchy -check -top %s\n' "$TOP_MODULE"
    printf 'flatten -noscopeinfo\n'
    printf 'opt_clean\n'

    # Apply the same normalization to the linked design.
    printf 'async2sync\n'
    printf 'opt_clean\n'

    printf 'rename %s gate\n' "$TOP_MODULE"
    printf 'design -stash gate_design\n'
    printf 'design -reset\n\n'

    printf '# Restore both normalized designs.\n'
    printf 'design -copy-from gold_design gold\n'
    printf 'design -copy-from gate_design gate\n\n'

    printf '# Construct the equivalence-checking design.\n'
    printf 'equiv_make gold gate equiv\n'
    printf 'hierarchy -check -top equiv\n'
    printf 'check\n\n'

    printf 'write_json '
    yosys_quote "$OUTPUT_DIR/equiv_before_proof.json"
    printf '\n\n'

    printf '# Report initial equivalence state.\n'
    printf 'equiv_status\n\n'

    printf '# Establish easy sequential state correspondences first.\n'
    printf 'equiv_induct -seq 1\n'
    printf 'equiv_status\n\n'

    printf '# Prove combinational cones independently.\n'
    printf 'equiv_simple -short -nogroup -seq 1\n'
    printf 'equiv_status\n\n'

    printf '# Strengthen remaining sequential proofs.\n'
    printf 'equiv_induct -seq 2\n'
    printf 'equiv_status\n\n'

    printf '# Retry remaining combinational equivalence cells.\n'
    printf 'equiv_simple -short -nogroup -seq 1\n'
    printf 'equiv_status\n\n'

    printf '# Fail if any equivalence cell remains unproven.\n'
    printf 'equiv_status -assert\n'
} > "$RUN_SCRIPT"

echo "Top module     : $TOP_MODULE"
echo "Gold design    : $FULL_JSON"
echo "Gate design    : $LINKED_JSON"
echo "Output         : $OUTPUT_DIR"
echo

set +e

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    timeout \
        --signal=TERM \
        --kill-after=30s \
        5m \
        yosys \
        -l "$LOG_FILE" \
        -s "$RUN_SCRIPT"

VERIFY_STATUS=$?

set -e

if [[ "$VERIFY_STATUS" -eq 124 \
   || "$VERIFY_STATUS" -eq 137 ]]
then
    jq -n \
        --arg status "timeout" \
        --arg top_module "$TOP_MODULE" \
        --arg gold_design "$FULL_JSON" \
        --arg gate_design "$LINKED_JSON" \
        --arg timeout "5m" \
        '{
            status: $status,
            top_module: $top_module,
            gold_design: $gold_design,
            gate_design: $gate_design,
            timeout: $timeout
        }' \
        > "$OUTPUT_DIR/summary.json"

    echo "ERROR: equivalence verification timed out after 5 minutes."
    echo "See:"
    echo "  $LOG_FILE"
    exit 124
fi

if [[ "$VERIFY_STATUS" -ne 0 ]]; then
    echo "ERROR: equivalence verification failed."
    echo "Exit status: $VERIFY_STATUS"
    echo "See:"
    echo "  $LOG_FILE"
    exit "$VERIFY_STATUS"
fi

jq -n \
    --arg status "proven" \
    --arg top_module "$TOP_MODULE" \
    --arg gold_design "$FULL_JSON" \
    --arg gate_design "$LINKED_JSON" \
    --arg ff_normalization "async2sync" \
    '{
        status: $status,
        top_module: $top_module,
        gold_design: $gold_design,
        gate_design: $gate_design,
        ff_normalization: $ff_normalization
    }' \
    > "$OUTPUT_DIR/summary.json"

echo
echo "Equivalence successfully proven."
echo
echo "Generated:"
echo "  $OUTPUT_DIR/equivalence.log"
echo "  $OUTPUT_DIR/equiv_before_proof.json"
echo "  $OUTPUT_DIR/full_interface.json"
echo "  $OUTPUT_DIR/linked_interface.json"
echo "  $OUTPUT_DIR/summary.json"
echo "  $OUTPUT_DIR/time.txt"
