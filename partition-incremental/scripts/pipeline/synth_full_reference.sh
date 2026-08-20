#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <source_dir> <output_dir> [top_module]"
    echo
    echo "Example:"
    echo "  $0 benchmarks/riscv-simple-sv \\"
    echo "     results/partition-incremental/riscv-simple-sv/base/full-reference \\"
    echo "     riscv_core"
}

if [[ $# -lt 2 || $# -gt 3 ]]; then
    usage
    exit 1
fi

SOURCE_DIR="$(realpath "$1")"
OUTPUT_DIR="$(realpath -m "$2")"
TOP_MODULE="${3:-riscv_core}"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: source directory does not exist:"
    echo "  $SOURCE_DIR"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_full_reference.ys"
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
    echo "ERROR: no RTL source files found."
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

if [[ ${#INCLUDE_DIRS[@]} -eq 0 ]]; then
    echo "ERROR: no include directories found."
    exit 1
fi

yosys_quote() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '"%s"' "$value"
}

{
    printf '# Read the complete RTL design.\n'
    printf 'read_verilog -sv'

    for include_dir in "${INCLUDE_DIRS[@]}"; do
        printf ' -I%s' "$include_dir"
    done

    for source_file in "${SOURCE_FILES[@]}"; do
        printf ' '
        yosys_quote "$source_file"
    done

    printf '\n\n'

    printf 'hierarchy -check -top %s\n\n' "$TOP_MODULE"

    printf '# Frontend processing.\n'
    printf 'proc\n'
    printf 'opt_clean\n'
    printf 'check\n\n'

    printf 'write_json '
    yosys_quote "$OUTPUT_DIR/frontend.json"
    printf '\n'

    printf 'write_rtlil '
    yosys_quote "$OUTPUT_DIR/frontend.rtlil"
    printf '\n\n'

    printf '# Full-design flattening.\n'
    printf 'flatten -noscopeinfo\n'
    printf 'opt_clean\n'
    printf 'check\n\n'

    printf 'write_json '
    yosys_quote "$OUTPUT_DIR/flattened.json"
    printf '\n'

    printf 'write_rtlil '
    yosys_quote "$OUTPUT_DIR/flattened.rtlil"
    printf '\n\n'

    printf '# Full synthesis of the complete design.\n'
    printf 'synth -top %s\n' "$TOP_MODULE"
    printf 'opt_clean -purge\n'
    printf 'check\n'
    printf 'stat -top %s\n\n' "$TOP_MODULE"

    printf 'write_json '
    yosys_quote "$OUTPUT_DIR/full_reference.json"
    printf '\n'

    printf 'write_rtlil '
    yosys_quote "$OUTPUT_DIR/full_reference.rtlil"
    printf '\n'

    printf 'write_verilog -noattr -noexpr -nodec '
    yosys_quote "$OUTPUT_DIR/full_reference_netlist.v"
    printf '\n'
} > "$RUN_SCRIPT"

echo "Top module       : $TOP_MODULE"
echo "Source directory : $SOURCE_DIR"
echo "Output directory : $OUTPUT_DIR"
echo "Source file count: ${#SOURCE_FILES[@]}"
echo

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

jq -n \
    --arg top_module "$TOP_MODULE" \
    --arg source_dir "$SOURCE_DIR" \
    '{
        top_module: $top_module,
        source_dir: $source_dir,
        synthesis_mode: "complete_flat_synthesis"
    }' \
    > "$OUTPUT_DIR/full_reference_info.json"

echo
echo "Generated:"
echo "  $OUTPUT_DIR/frontend.json"
echo "  $OUTPUT_DIR/flattened.json"
echo "  $OUTPUT_DIR/full_reference.json"
echo "  $OUTPUT_DIR/full_reference.rtlil"
echo "  $OUTPUT_DIR/full_reference_netlist.v"
echo "  $OUTPUT_DIR/yosys.log"
echo "  $OUTPUT_DIR/time.txt"
