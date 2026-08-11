#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <mapped_top_shell_netlist.v> \\"
    echo "     <partition_manifest.json> \\"
    echo "     <mapped_partitions_dir> \\"
    echo "     <liberty_file> \\"
    echo "     <output_dir>"
}

if [[ $# -ne 5 ]]; then
    usage
    exit 1
fi

TOP_SHELL_NETLIST="$(realpath "$1")"
MANIFEST="$(realpath "$2")"
PARTITIONS_DIR="$(realpath "$3")"
LIBERTY_FILE="$(realpath "$4")"
OUTPUT_DIR="$(realpath -m "$5")"

for required in \
    "$TOP_SHELL_NETLIST" \
    "$MANIFEST" \
    "$LIBERTY_FILE"
do
    if [[ ! -f "$required" ]]; then
        echo "ERROR: required file does not exist:"
        echo "  $required"
        exit 1
    fi
done

if [[ ! -d "$PARTITIONS_DIR" ]]; then
    echo "ERROR: mapped partitions directory does not exist:"
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

mkdir -p "$OUTPUT_DIR"

RUN_SCRIPT="$OUTPUT_DIR/run_link_mapped.ys"
LOG_FILE="$OUTPUT_DIR/yosys.log"
AREA_REPORT="$OUTPUT_DIR/area.rpt"
STAT_JSON="$OUTPUT_DIR/stat.json"

{
    printf '# Read mapped top shell.\n'
    printf 'read_verilog -sv "%s"\n\n' \
        "$TOP_SHELL_NETLIST"

    printf '# Read mapped partitions.\n'

    while IFS=$'\t' read -r partition_name root_module
    do
        partition_json="$PARTITIONS_DIR/$partition_name/mapped.json"

        if [[ ! -f "$partition_json" ]]; then
            echo "ERROR: mapped partition does not exist:" >&2
            echo "  $partition_json" >&2
            exit 1
        fi

        printf '# %s -> %s\n' \
            "$partition_name" \
            "$root_module"

        printf 'read_json "%s"\n' \
            "$partition_json"

    done < <(
        jq -r '
          .partitions
          | to_entries[]
          | [.key, .value.root_module]
          | @tsv
        ' "$MANIFEST"
    )

    printf '\n'
    printf 'hierarchy -top %s\n\n' "$TOP_MODULE"

    printf '# Flatten hierarchy only for final measurement.\n'
    printf '# Do NOT run abc or synthesis again here.\n'
    printf 'flatten -noscopeinfo\n\n'

    printf 'write_verilog -noattr -noexpr -nodec "%s"\n\n' \
        "$OUTPUT_DIR/linked_mapped_netlist.v"

    printf 'tee -o "%s" stat -top %s -liberty "%s"\n' \
        "$AREA_REPORT" \
        "$TOP_MODULE" \
        "$LIBERTY_FILE"

    printf 'tee -o "%s" stat -top %s -liberty "%s" -json\n' \
        "$STAT_JSON" \
        "$TOP_MODULE" \
        "$LIBERTY_FILE"

} > "$RUN_SCRIPT"

yosys \
    -l "$LOG_FILE" \
    -s "$RUN_SCRIPT"

if grep -q \
    "Area for cell type .* is unknown" \
    "$AREA_REPORT"
then
    echo
    echo "ERROR: linked incremental design contains cells"
    echo "without Liberty area information."
    echo
    echo "See:"
    echo "  $AREA_REPORT"
    exit 1
fi

echo
echo "Mapped incremental design linked successfully."
echo
echo "Generated:"
echo "  $OUTPUT_DIR/linked_mapped_netlist.v"
echo "  $AREA_REPORT"
echo "  $STAT_JSON"