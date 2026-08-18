#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <hier_json> <output_dir> <partition_name> <root_module>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

HIER_JSON="$(realpath "$1")"
OUTPUT_DIR="$(realpath -m "$2")"
PARTITION_NAME="$3"
ROOT_MODULE_RAW="$4"

ROOT_MODULE="$(
    python3 - "$ROOT_MODULE_RAW" <<'PY'
import sys

name = sys.argv[1]

# Some intermediate manifests may contain JSON-style
# double escaping. Yosys internally uses one literal
# backslash in names such as:
#   $paramod\adder\WIDTH=...
while "\\\\" in name:
    name = name.replace("\\\\", "\\")

print(name)
PY
)"

REPO_ROOT="$(git rev-parse --show-toplevel)"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"

if [[ ! -f "$HIER_JSON" ]]; then
    echo "ERROR: hierarchy JSON does not exist:"
    echo "  $HIER_JSON"
    exit 1
fi

if [[ ! -f "$PARTITION_FLOW" ]]; then
    echo "ERROR: partition flow does not exist:"
    echo "  $PARTITION_FLOW"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_synth_partition_from_hier.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
TIME_FILE="$OUTPUT_DIR/time.txt"


quote_yosys_string() {
    local value="$1"

    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"

    printf '"%s"' "$value"
}


{
    echo "# Load already elaborated hierarchical design."

    printf 'read_json '
    quote_yosys_string "$HIER_JSON"
    printf '\n\n'

    echo "# Select derived module implementation."

    printf 'hierarchy -check -top %s\n' \
        "$ROOT_MODULE"

    echo

    echo "proc"
    echo "opt_clean"
    echo "check"
    echo

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/frontend.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/frontend.rtlil"
    printf '\n\n'

    printf 'stat -top %s\n' \
        "$ROOT_MODULE"

    echo
    echo "# Flatten logic below the fine-region root."

    printf 'script %s\n\n' \
        "$PARTITION_FLOW"

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/flattened.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/flattened.rtlil"
    printf '\n\n'

    echo "# Complete generic synthesis."

    printf 'synth -top %s\n' \
        "$ROOT_MODULE"

    echo "opt_clean -purge"
    echo "check"

    printf 'stat -top %s\n' \
        "$ROOT_MODULE"

    echo

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/synth.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/synth.rtlil"
    printf '\n'

    printf 'write_verilog -noattr -noexpr -nodec '
    quote_yosys_string "$OUTPUT_DIR/partition_netlist.v"
    printf '\n'

} > "$RUN_SCRIPT"


echo
echo "============================================================"
echo "Fine-region synthesis from hierarchical JSON"
echo "============================================================"
echo "Region     : $PARTITION_NAME"
echo "Root       : $ROOT_MODULE"
echo "Hierarchy  : $HIER_JSON"
echo


/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"


jq -n \
    --arg partition_name "$PARTITION_NAME" \
    --arg root_module "$ROOT_MODULE" \
    --arg hier_json "$HIER_JSON" \
    '{
        partition_name: $partition_name,
        root_module: $root_module,
        source_hier_json: $hier_json,
        source_kind: "elaborated_hier_json",
        flatten_internal: true
    }' \
    > "$OUTPUT_DIR/partition_info.json"


echo
echo "Generated:"
echo "  $OUTPUT_DIR/frontend.json"
echo "  $OUTPUT_DIR/flattened.json"
echo "  $OUTPUT_DIR/synth.json"
echo "  $OUTPUT_DIR/synth.rtlil"
echo "  $OUTPUT_DIR/time.txt"