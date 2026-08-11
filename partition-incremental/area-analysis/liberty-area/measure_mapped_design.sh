#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <mapped_json> <top_module> <liberty_file> <output_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

MAPPED_JSON="$(realpath "$1")"
TOP_MODULE="$2"
LIBERTY_FILE="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"

for required in \
    "$MAPPED_JSON" \
    "$LIBERTY_FILE"
do
    if [[ ! -f "$required" ]]; then
        echo "ERROR: required file does not exist:"
        echo "  $required"
        exit 1
    fi
done

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_measure_area.ys"
LOG_FILE="$OUTPUT_DIR/area_measure.log"
AREA_REPORT="$OUTPUT_DIR/area.rpt"
STAT_JSON="$OUTPUT_DIR/stat.json"

cat > "$RUN_SCRIPT" <<YOSYS
read_json "$MAPPED_JSON"

hierarchy -top $TOP_MODULE

tee -o "$AREA_REPORT" \
    stat -top $TOP_MODULE -liberty "$LIBERTY_FILE"

tee -o "$STAT_JSON" \
    stat -top $TOP_MODULE -liberty "$LIBERTY_FILE" -json
YOSYS

yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

if grep -q \
    "Area for cell type .* is unknown" \
    "$AREA_REPORT"
then
    echo
    echo "ERROR: some cells do not have Liberty area information."
    echo "See:"
    echo "  $AREA_REPORT"
    exit 1
fi

echo
echo "Area measurement completed:"
echo "  $AREA_REPORT"
echo "  $STAT_JSON"