#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <source_dir> <output_dir> <partition_name> <root_module>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

SOURCE_DIR="$(realpath "$1")"
OUTPUT_DIR="$(realpath -m "$2")"
PARTITION_NAME="$3"
ROOT_MODULE="$4"

REPO_ROOT="$(git rev-parse --show-toplevel)"
PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: source directory does not exist:"
    echo "  $SOURCE_DIR"
    exit 1
fi

if [[ ! -f "$PARTITION_FLOW" ]]; then
    echo "ERROR: partition Yosys flow does not exist:"
    echo "  $PARTITION_FLOW"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_prepare_partition_frontend.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
TIME_FILE="$OUTPUT_DIR/time.txt"

SOURCE_SEARCH_DIRS=()

if [[ -d "$SOURCE_DIR/core/common" ]]; then
    SOURCE_SEARCH_DIRS+=("$SOURCE_DIR/core/common")
fi

if [[ -d "$SOURCE_DIR/core/singlecycle" ]]; then
    SOURCE_SEARCH_DIRS+=("$SOURCE_DIR/core/singlecycle")
fi

if [[ ${#SOURCE_SEARCH_DIRS[@]} -eq 0 ]]; then
    echo "ERROR: no RTL source directories found."
    exit 1
fi

mapfile -t SOURCE_FILES < <(
    find "${SOURCE_SEARCH_DIRS[@]}" \
        -maxdepth 1 \
        -type f \
        \( -name '*.sv' -o -name '*.v' \) \
        ! -name 'example_data_memory.sv' \
        ! -name 'example_text_memory.sv' \
        ! -name 'toplevel.sv' \
        | sort
)

if [[ ${#SOURCE_FILES[@]} -eq 0 ]]; then
    echo "ERROR: no Verilog source files found."
    exit 1
fi

INCLUDE_DIRS=()

for include_dir in \
    "$SOURCE_DIR/core" \
    "$SOURCE_DIR/core/common" \
    "$SOURCE_DIR/core/singlecycle" \
    "$SOURCE_DIR/synth"
do
    if [[ -d "$include_dir" ]]; then
        INCLUDE_DIRS+=("$include_dir")
    fi
done

quote_yosys_string() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '"%s"' "$value"
}

{
    printf 'read_verilog -sv'

    for include_dir in "${INCLUDE_DIRS[@]}"; do
        printf ' -I%s' "$include_dir"
    done

    for source_file in "${SOURCE_FILES[@]}"; do
        printf ' '
        quote_yosys_string "$source_file"
    done

    printf '\n\n'
    printf 'hierarchy -check -top %s\n\n' "$ROOT_MODULE"

    printf 'proc\n'
    printf 'opt_clean\n'
    printf 'check\n\n'

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/frontend.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/frontend.rtlil"
    printf '\n\n'

    printf 'script %s\n\n' "$PARTITION_FLOW"

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/flattened.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/flattened.rtlil"
    printf '\n'

    printf 'stat -top %s\n' "$ROOT_MODULE"
} > "$RUN_SCRIPT"

echo "Partition        : $PARTITION_NAME"
echo "Root module      : $ROOT_MODULE"
echo "Mode             : frontend-only"
echo "Source directory : $SOURCE_DIR"
echo "Output directory : $OUTPUT_DIR"
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
    --arg source_dir "$SOURCE_DIR" \
    '{
        partition_name: $partition_name,
        root_module: $root_module,
        source_dir: $source_dir,
        mode: "frontend-only",
        flatten_internal: true
    }' \
    > "$OUTPUT_DIR/partition_frontend_info.json"

echo
echo "Generated frontend-only partition:"
echo "  $OUTPUT_DIR/frontend.json"
echo "  $OUTPUT_DIR/frontend.rtlil"
echo "  $OUTPUT_DIR/flattened.json"
echo "  $OUTPUT_DIR/flattened.rtlil"
echo "  $OUTPUT_DIR/yosys.log"
echo "  $OUTPUT_DIR/time.txt"
