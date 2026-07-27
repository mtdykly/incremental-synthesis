#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <source_dir> <output_dir> [top_module]"
    echo
    echo "Example:"
    echo "  $0 benchmarks/riscv-simple-sv \\"
    echo "     results/partition-incremental/riscv-simple-sv/base \\"
    echo "     riscv_core"
}

if [[ $# -lt 2 || $# -gt 3 ]]; then
    usage
    exit 1
fi

SOURCE_DIR="$(realpath "$1")"
OUTPUT_DIR="$(realpath -m "$2")"
TOP_MODULE="${3:-riscv_core}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
COMMON_FLOW="$REPO_ROOT/partition-incremental/yosys/export_hierarchy.ys"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: source directory does not exist:"
    echo "  $SOURCE_DIR"
    exit 1
fi

if [[ ! -f "$COMMON_FLOW" ]]; then
    echo "ERROR: Yosys flow does not exist:"
    echo "  $COMMON_FLOW"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_export_hierarchy.ys"
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
    echo "ERROR: no source directories were found."
    echo "Expected:"
    echo "  $SOURCE_DIR/core/common"
    echo "  $SOURCE_DIR/core/singlecycle"
    exit 1
fi

mapfile -t SOURCE_FILES < <(
    find "${SOURCE_SEARCH_DIRS[@]}" \
        -maxdepth 1 \
        -type f \
        \( -name '*.sv' -o -name '*.v' \) \
        ! -name 'example_data_memory.sv' \
        ! -name 'example_text_memory.sv' \
        | sort
)

if [[ ${#SOURCE_FILES[@]} -eq 0 ]]; then
    echo "ERROR: no Verilog or SystemVerilog files were found."
    exit 1
fi

INCLUDE_DIRS=()

mapfile -t INCLUDE_DIRS < <(
    find "$SOURCE_DIR" \
        -type f \
        \( -name '*.sv' -o -name '*.v' \) \
        -printf '%h\n' \
        | sort -u
)


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

    printf 'hierarchy -check -top %s\n\n' "$TOP_MODULE"

    printf 'script %s\n\n' "$COMMON_FLOW"

    printf 'write_json '
    quote_yosys_string "$OUTPUT_DIR/frontend_hier.json"
    printf '\n'

    printf 'write_rtlil '
    quote_yosys_string "$OUTPUT_DIR/frontend_hier.rtlil"
    printf '\n\n'

    printf 'stat -top %s\n' "$TOP_MODULE"
} > "$RUN_SCRIPT"

echo "Source directory : $SOURCE_DIR"
echo "Output directory : $OUTPUT_DIR"
echo "Top module       : $TOP_MODULE"
echo "Source file count: ${#SOURCE_FILES[@]}"
echo

{
    /usr/bin/time \
        -f 'elapsed_seconds=%e
max_rss_kb=%M' \
        -o "$TIME_FILE" \
        yosys -s "$RUN_SCRIPT"
} 2>&1 | tee "$LOG_FILE"

echo
echo "Generated:"
echo "  $OUTPUT_DIR/frontend_hier.json"
echo "  $OUTPUT_DIR/frontend_hier.rtlil"
echo "  $OUTPUT_DIR/yosys.log"
echo "  $OUTPUT_DIR/time.txt"
