#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <input_json> <top_module> <output_json>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

INPUT_JSON="$(realpath "$1")"
TOP_MODULE="$2"
OUTPUT_JSON="$(realpath -m "$3")"

if [[ ! -f "$INPUT_JSON" ]]; then
    echo "ERROR: input JSON does not exist:"
    echo "  $INPUT_JSON"
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_JSON")"

TEMP_DIR="$(mktemp -d)"

cleanup() {
    rm -rf "$TEMP_DIR"
}

trap cleanup EXIT

RUN_SCRIPT="$TEMP_DIR/flatten_for_stats.ys"

cat > "$RUN_SCRIPT" <<YOSYS
read_json "$INPUT_JSON"

hierarchy -check -top $TOP_MODULE
check

# Important:
# Flatten only for structural counting.
# Do NOT run opt, synth, techmap or abc here.
flatten -noscopeinfo

check

write_json "$OUTPUT_JSON"
YOSYS

yosys -q -s "$RUN_SCRIPT"

echo "Generated flattened statistics netlist:"
echo "  $OUTPUT_JSON"