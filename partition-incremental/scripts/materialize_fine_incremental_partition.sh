#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <new_source_dir> <new_hier_json> \\"
    echo "     <new_fine_manifest.json> <fine_reuse_plan.json> \\"
    echo "     <partition_name> <base_cache_dir> <output_dir>"
}

if [[ $# -ne 7 ]]; then
    usage
    exit 1
fi

NEW_SOURCE_DIR="$(realpath "$1")"
NEW_HIER_JSON="$(realpath "$2")"
NEW_FINE_MANIFEST="$(realpath "$3")"
FINE_REUSE_PLAN="$(realpath "$4")"
PARTITION_NAME="$5"
BASE_CACHE="$(realpath "$6")"
OUTPUT_DIR="$(realpath -m "$7")"

REPO_ROOT="$(git rev-parse --show-toplevel)"

BUILD_MANIFEST="$REPO_ROOT/partition-incremental/scripts/build_fine_partition_manifest.py"
SYNTH_PARTITION="$REPO_ROOT/partition-incremental/scripts/synth_partition.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"
LINK_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/link_partitions.sh"

for required in \
    "$NEW_SOURCE_DIR" \
    "$NEW_HIER_JSON" \
    "$NEW_FINE_MANIFEST" \
    "$FINE_REUSE_PLAN" \
    "$BASE_CACHE" \
    "$BUILD_MANIFEST" \
    "$SYNTH_PARTITION" \
    "$SYNTH_TOP_SHELL" \
    "$LINK_PARTITIONS"
do
    if [[ ! -e "$required" ]]; then
        echo "ERROR: required path missing:"
        echo "  $required"
        exit 1
    fi
done

rm -rf "$OUTPUT_DIR"

mkdir -p \
    "$OUTPUT_DIR/regions" \
    "$OUTPUT_DIR/root-shell" \
    "$OUTPUT_DIR/linked"

FINE_MANIFEST="$OUTPUT_DIR/fine_partition_manifest.json"

python3 "$BUILD_MANIFEST" \
    --fine-manifest "$NEW_FINE_MANIFEST" \
    --partition "$PARTITION_NAME" \
    --output "$FINE_MANIFEST"

SUMMARY_TSV="$OUTPUT_DIR/materialization_summary.tsv"

printf 'region\troot_module\taction\tbuild_seconds\n' \
    > "$SUMMARY_TSV"

echo
echo "============================================================"
echo "Fine materialization"
echo "Partition: $PARTITION_NAME"
echo "============================================================"

while IFS=$'\t' read -r \
    region_name \
    root_module \
    region_id
do
    action="$(
        jq -r \
          --arg partition "$PARTITION_NAME" \
          --arg region "$region_id" \
          '
          .partitions[$partition]
          .decisions[$region]
          .status // empty
          ' \
          "$FINE_REUSE_PLAN"
    )"

    if [[ "$action" != "reuse" \
       && "$action" != "rebuild" ]]
    then
        echo "ERROR: invalid fine action:"
        echo "  partition=$PARTITION_NAME"
        echo "  region=$region_id"
        echo "  action=$action"
        exit 1
    fi

    region_output="$OUTPUT_DIR/regions/$region_name"

    echo
    echo "------------------------------------------------------------"
    echo "Region : $region_name"
    echo "Root   : $root_module"
    echo "Action : $action"
    echo "------------------------------------------------------------"

    if [[ "$action" == "reuse" ]]; then
        cache_dir="$BASE_CACHE/regions/$region_name"

        if [[ ! -s "$cache_dir/synth.json" ]]; then
            echo "ERROR: Base fine cache missing:"
            echo "  $cache_dir/synth.json"
            exit 1
        fi

        cp -a \
            "$cache_dir" \
            "$region_output"

        build_seconds="0.000000"

    else
        "$SYNTH_PARTITION" \
            "$NEW_SOURCE_DIR" \
            "$region_output" \
            "$region_name" \
            "$root_module"

        build_seconds="$(
            awk '
              $1 == "real" {
                print $2
              }
            ' "$region_output/time.txt"
        )"
    fi

    test -s "$region_output/synth.json"

    printf '%s\t%s\t%s\t%s\n' \
        "$region_name" \
        "$root_module" \
        "$action" \
        "$build_seconds" \
        >> "$SUMMARY_TSV"

done < <(
    jq -r '
      .partitions
      | to_entries[]
      | [
          .key,
          .value.root_module,
          .value.region_id
        ]
      | @tsv
    ' "$FINE_MANIFEST"
)

ROOT_ACTION="$(
    jq -r \
      --arg partition "$PARTITION_NAME" \
      '
      .partitions[$partition]
      .root_glue.status // empty
      ' \
      "$FINE_REUSE_PLAN"
)"

if [[ "$ROOT_ACTION" != "reuse" \
   && "$ROOT_ACTION" != "rebuild" ]]
then
    echo "ERROR: invalid root_glue action:"
    echo "  $ROOT_ACTION"
    exit 1
fi

echo
echo "============================================================"
echo "Root shell: $ROOT_ACTION"
echo "============================================================"

if [[ "$ROOT_ACTION" == "reuse" ]]; then

    if [[ ! -s \
      "$BASE_CACHE/root-shell/top_shell_netlist.v" ]]
    then
        echo "ERROR: Base root-shell cache missing"
        exit 1
    fi

    cp -a \
        "$BASE_CACHE/root-shell/." \
        "$OUTPUT_DIR/root-shell/"

else

    "$SYNTH_TOP_SHELL" \
        "$NEW_HIER_JSON" \
        "$FINE_MANIFEST" \
        "$OUTPUT_DIR/root-shell"
fi

echo
echo "============================================================"
echo "Link fine regions"
echo "============================================================"

"$LINK_PARTITIONS" \
    "$OUTPUT_DIR/root-shell/top_shell_netlist.v" \
    "$FINE_MANIFEST" \
    "$OUTPUT_DIR/regions" \
    "$OUTPUT_DIR/linked"

test -s "$OUTPUT_DIR/linked/linked.json"
test -s "$OUTPUT_DIR/linked/linked.rtlil"
test -s "$OUTPUT_DIR/linked/linked_netlist.v"

echo
echo "============================================================"
echo "Flatten fine-linked partition for outer linking"
echo "============================================================"

ROOT_MODULE="$(
    jq -r \
      '.top.module_name' \
      "$FINE_MANIFEST"
)"

if [[ -z "$ROOT_MODULE" || "$ROOT_MODULE" == "null" ]]; then
    echo "ERROR: cannot determine fine partition root module"
    exit 1
fi

FINALIZE_YS="$OUTPUT_DIR/finalize_fine_partition.ys"

cat > "$FINALIZE_YS" <<EOF
read_json $OUTPUT_DIR/linked/linked.json

hierarchy -check -top $ROOT_MODULE

flatten

hierarchy -check -top $ROOT_MODULE

check

write_json $OUTPUT_DIR/synth.json
write_rtlil $OUTPUT_DIR/synth.rtlil
write_verilog -noattr $OUTPUT_DIR/partition_netlist.v
EOF

yosys \
  -l "$OUTPUT_DIR/finalize_fine_partition.log" \
  -s "$FINALIZE_YS"

test -s "$OUTPUT_DIR/synth.json"
test -s "$OUTPUT_DIR/synth.rtlil"
test -s "$OUTPUT_DIR/partition_netlist.v"

REUSE_COUNT="$(
    awk -F '\t' '
      NR > 1 && $3 == "reuse" {
        count++
      }
      END {
        print count + 0
      }
    ' "$SUMMARY_TSV"
)"

REBUILD_COUNT="$(
    awk -F '\t' '
      NR > 1 && $3 == "rebuild" {
        count++
      }
      END {
        print count + 0
      }
    ' "$SUMMARY_TSV"
)"

REBUILD_YOSYS_SECONDS="$(
    awk -F '\t' '
      NR > 1 && $3 == "rebuild" {
        total += $4
      }
      END {
        printf "%.6f", total + 0
      }
    ' "$SUMMARY_TSV"
)"

jq -n \
    --arg partition "$PARTITION_NAME" \
    --arg root_action "$ROOT_ACTION" \
    --argjson reuse_count "$REUSE_COUNT" \
    --argjson rebuild_count "$REBUILD_COUNT" \
    --arg rebuild_yosys_seconds "$REBUILD_YOSYS_SECONDS" \
    '{
        partition: $partition,
        root_glue_action: $root_action,
        reuse_count: $reuse_count,
        rebuild_count: $rebuild_count,
        rebuild_yosys_seconds:
            ($rebuild_yosys_seconds | tonumber),
        status: "materialized"
    }' \
    > "$OUTPUT_DIR/materialization_summary.json"

echo
echo "Fine partition successfully materialized."
echo
cat "$OUTPUT_DIR/materialization_summary.json"