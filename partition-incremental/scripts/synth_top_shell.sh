#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <frontend_hier.json> <partition_manifest.json> <output_dir>"
}

if [[ $# -ne 3 ]]; then
    usage
    exit 1
fi

HIER_JSON="$(realpath "$1")"
MANIFEST="$(realpath "$2")"
OUTPUT_DIR="$(realpath -m "$3")"

if [[ ! -f "$HIER_JSON" ]]; then
    echo "ERROR: hierarchical JSON not found:"
    echo "  $HIER_JSON"
    exit 1
fi

if [[ ! -f "$MANIFEST" ]]; then
    echo "ERROR: partition manifest not found:"
    echo "  $MANIFEST"
    exit 1
fi

TOP_MODULE="$(
    jq -r '.top.module_name' "$MANIFEST"
)"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module is missing from manifest"
    exit 1
fi

mapfile -t ROOT_MODULES < <(
    jq -r '
        .partitions
        | to_entries[]
        | .value.root_module
    ' "$MANIFEST" |
    sort -u
)

if [[ ${#ROOT_MODULES[@]} -eq 0 ]]; then
    echo "ERROR: no partition roots found"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_synth_top_shell.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
TIME_FILE="$OUTPUT_DIR/time.txt"

yosys_quote() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '"%s"' "$value"
}

{
    printf '# Load elaborated hierarchical design.\n'
    printf 'read_json '
    yosys_quote "$HIER_JSON"
    printf '\n\n'

    printf '# Replace partition implementations with blackboxes.\n'

    for root_module in "${ROOT_MODULES[@]}"; do
        printf 'blackbox %s\n' "$root_module"
    done

    printf '\n'
    printf 'hierarchy -check -top %s\n' "$TOP_MODULE"
    printf 'check\n\n'

    printf '# Synthesize only the top shell.\n'
    printf 'synth -top %s\n' "$TOP_MODULE"
    printf 'opt_clean -purge\n'
    printf 'check\n'
    printf 'stat -top %s\n\n' "$TOP_MODULE"

    # Only store the real top module in top_shell.json.
    #
    # Partition roots are blackboxes at this point. They are deliberately
    # omitted from the JSON because link_partitions.sh will later load the
    # real independently synthesized partition implementations.
    printf 'select -clear\n'
    printf 'select %s\n' "$TOP_MODULE"

    printf 'write_json -selected '
    yosys_quote "$OUTPUT_DIR/top_shell.json"
    printf '\n'

    printf 'select -clear\n\n'

    printf 'write_rtlil '
    yosys_quote "$OUTPUT_DIR/top_shell.rtlil"
    printf '\n'

    # 默认不输出 blackbox 模块定义，只输出顶层 shell。
    printf 'write_verilog -noattr -noexpr -nodec '
    yosys_quote "$OUTPUT_DIR/top_shell_netlist.v"
    printf '\n'
} > "$RUN_SCRIPT"

echo "Top module       : $TOP_MODULE"
echo "Partition roots  : ${ROOT_MODULES[*]}"
echo "Input hierarchy  : $HIER_JSON"
echo "Output directory : $OUTPUT_DIR"
echo

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

jq -n \
    --arg top_module "$TOP_MODULE" \
    --argjson partition_roots "$(
        printf '%s\n' "${ROOT_MODULES[@]}" |
        jq -R . |
        jq -s .
    )" \
    '{
        top_module: $top_module,
        partition_roots: $partition_roots
    }' \
    > "$OUTPUT_DIR/top_shell_info.json"

echo
echo "Generated:"
echo "  $OUTPUT_DIR/top_shell.json"
echo "  $OUTPUT_DIR/top_shell.rtlil"
echo "  $OUTPUT_DIR/top_shell_netlist.v"
echo "  $OUTPUT_DIR/yosys.log"
echo "  $OUTPUT_DIR/time.txt"
