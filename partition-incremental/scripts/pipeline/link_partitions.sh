#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <top_shell.rtlil> <partition_manifest.json> \\"
    echo "     <partitions_dir> <output_dir>"
}

if [[ $# -ne 4 ]]; then
    usage
    exit 1
fi

TOP_SHELL_RTLIL="$(realpath "$1")"
MANIFEST="$(realpath "$2")"
PARTITIONS_DIR="$(realpath "$3")"
OUTPUT_DIR="$(realpath -m "$4")"

if [[ ! -f "$TOP_SHELL_RTLIL" ]]; then
    echo "ERROR: top shell RTLIL not found:"
    echo "  $TOP_SHELL_RTLIL"
    exit 1
fi

if [[ ! -f "$MANIFEST" ]]; then
    echo "ERROR: partition manifest not found:"
    echo "  $MANIFEST"
    exit 1
fi

if [[ ! -d "$PARTITIONS_DIR" ]]; then
    echo "ERROR: partitions directory not found:"
    echo "  $PARTITIONS_DIR"
    exit 1
fi

TOP_MODULE="$(
    jq -r '.top.module_name' "$MANIFEST"
)"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing from manifest"
    exit 1
fi

partition_count="$(
    jq '.partitions | length' "$MANIFEST"
)"

unique_root_count="$(
    jq '
      [
        .partitions
        | to_entries[]
        | .value.root_module
      ]
      | unique
      | length
    ' "$MANIFEST"
)"

if [[ "$partition_count" -ne "$unique_root_count" ]]; then
    echo "ERROR: multiple partitions use the same root module."
    echo "The current prototype requires unique partition root modules."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_link_partitions.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
TIME_FILE="$OUTPUT_DIR/time.txt"

yosys_quote() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '"%s"' "$value"
}

{
    echo "# Load synthesized top shell in native RTLIL format."
    printf 'read_rtlil '
    yosys_quote "$TOP_SHELL_RTLIL"
    printf '\n\n'

    echo "# Load each independently synthesized partition."
    echo "# Existing blackbox partition definitions in the top shell"
    echo "# are replaced by the real RTLIL implementations."

    while IFS=$'\t' read -r partition_name root_module
    do
        partition_rtlil="$PARTITIONS_DIR/$partition_name/synth.rtlil"

        if [[ ! -f "$partition_rtlil" ]]; then
            echo "ERROR: partition synth RTLIL not found:" >&2
            echo "  $partition_rtlil" >&2
            exit 1
        fi

        printf '# %s -> %s\n' \
            "$partition_name" \
            "$root_module"

        printf 'read_rtlil '
        yosys_quote "$partition_rtlil"
        printf '\n'

    done < <(
        jq -r '
          .partitions
          | to_entries[]
          | [
              .key,
              .value.root_module
            ]
          | @tsv
        ' "$MANIFEST"
    )

    printf '\n'

    echo "# Validate the reconstructed hierarchy."
    printf 'hierarchy -check -top %s\n' "$TOP_MODULE"
    printf 'check\n'
    printf 'stat -top %s\n\n' "$TOP_MODULE"

    echo "# Export linked design."

    printf 'write_json '
    yosys_quote "$OUTPUT_DIR/linked.json"
    printf '\n'

    printf 'write_rtlil '
    yosys_quote "$OUTPUT_DIR/linked.rtlil"
    printf '\n'

    printf 'write_verilog -noattr -noexpr -nodec '
    yosys_quote "$OUTPUT_DIR/linked_netlist.v"
    printf '\n'

} > "$RUN_SCRIPT"

echo "Top module       : $TOP_MODULE"
echo "Top shell RTLIL  : $TOP_SHELL_RTLIL"
echo "Partitions       : $PARTITIONS_DIR"
echo "Output directory : $OUTPUT_DIR"
echo

/usr/bin/time \
    -p \
    -o "$TIME_FILE" \
    yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

echo
echo "Generated:"
echo "  $OUTPUT_DIR/linked.json"
echo "  $OUTPUT_DIR/linked.rtlil"
echo "  $OUTPUT_DIR/linked_netlist.v"
echo "  $OUTPUT_DIR/yosys.log"
echo "  $OUTPUT_DIR/time.txt"