#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <input_json> <top_module> <liberty_file> <output_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

INPUT_JSON="$(realpath "$1")"
TOP_MODULE="$2"
LIBERTY_FILE="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"
SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd
)"
LATCH_MAP="$SCRIPT_DIR/nangate45_latch_map.v"

for required in \
    "$INPUT_JSON" \
    "$LIBERTY_FILE" \
    "$LATCH_MAP"
do
    if [[ ! -f "$required" ]]; then
        echo "ERROR: required file does not exist:"
        echo "  $required"
        exit 1
    fi
done

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_liberty_mapping.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
TIME_FILE="$OUTPUT_DIR/time.txt"

cat > "$RUN_SCRIPT" <<YOSYS
read_json "$INPUT_JSON"

hierarchy -top $TOP_MODULE

dfflibmap -liberty "$LIBERTY_FILE"

abc -liberty "$LIBERTY_FILE"

techmap -map "$LATCH_MAP"

opt_clean -purge

write_json "$OUTPUT_DIR/mapped.json"

write_verilog -noattr -noexpr -nodec \
    "$OUTPUT_DIR/mapped_netlist.v"
YOSYS

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

echo
echo "Liberty mapping completed:"
echo "  input  : $INPUT_JSON"
echo "  top    : $TOP_MODULE"
echo "  liberty: $LIBERTY_FILE"
echo
echo "Generated:"
echo "  $OUTPUT_DIR/mapped.json"
echo "  $OUTPUT_DIR/mapped_netlist.v"
echo "  $OUTPUT_DIR/yosys.log"