#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir> [repeat_count]"
}

if [[ $# -lt 3 || $# -gt 4 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"
REPEAT_COUNT="${4:-5}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
BASE_OUT="$CASE_OUT/base"
BENCHMARK_OUT="$CASE_OUT/benchmark-profiled"

SYNTH_FULL="$REPO_ROOT/partition-incremental/scripts/synth_full_reference.sh"
RUN_PROFILED="$REPO_ROOT/partition-incremental/scripts/run_profiled_incremental_synthesis.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"

for required_path in \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR" \
    "$SYNTH_FULL" \
    "$RUN_PROFILED" \
    "$BASE_OUT/partition_signatures.json" \
    "$BASE_OUT/partitions" \
    "$BASE_OUT/frontend_hier.json" \
    "$BASE_OUT/partition_manifest.json"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

if ! [[ "$REPEAT_COUNT" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: repeat_count must be a positive integer"
    exit 1
fi

# Base top shell is historical cache and must not be part of New timing.
if [[ ! -s "$BASE_OUT/top-shell/top_shell_netlist.v" ]]; then
    echo "Preparing Base top-shell cache outside benchmark..."

    "$SYNTH_TOP_SHELL" \
        "$BASE_OUT/frontend_hier.json" \
        "$BASE_OUT/partition_manifest.json" \
        "$BASE_OUT/top-shell"
fi

rm -rf "$BENCHMARK_OUT"
mkdir -p "$BENCHMARK_OUT"

RESULTS_CSV="$BENCHMARK_OUT/results.csv"

printf '%s\n' \
  'iteration,order,full_seconds,incremental_core_seconds,speedup,time_reduction_percent,detection_seconds,export_hierarchy_seconds,extract_partitions_seconds,prepare_partition_frontends_seconds,compute_signatures_seconds,compare_signatures_seconds,materialize_partitions_seconds,reuse_copy_seconds,rebuild_wall_seconds,rebuild_yosys_seconds,top_shell_seconds,link_partitions_seconds,check_linked_seconds,unattributed_overhead_seconds,reuse_count,rebuild_count,top_shell_action' \
  > "$RESULTS_CSV"

run_full() {
    local iteration="$1"
    local run_dir="$BENCHMARK_OUT/run-$iteration/full"
    local time_file="$BENCHMARK_OUT/run-$iteration/full.seconds"

    rm -rf "$run_dir"
    mkdir -p "$run_dir"

    /usr/bin/time \
        -f '%e' \
        -o "$time_file" \
        "$SYNTH_FULL" \
            "$NEW_SOURCE_DIR" \
            "$run_dir" \
            riscv_core

    test -s "$run_dir/full_reference.json"
}

run_incremental() {
    local iteration="$1"
    local profile="$BENCHMARK_OUT/run-$iteration/incremental_profile.json"

    mkdir -p "$BENCHMARK_OUT/run-$iteration"

    "$RUN_PROFILED" \
        "$CASE_NAME" \
        "$BASE_SOURCE_DIR" \
        "$NEW_SOURCE_DIR" \
        "$profile"

    test -s "$profile"
}

for iteration in $(seq 1 "$REPEAT_COUNT")
do
    echo
    echo "============================================================"
    echo "Profiled benchmark $iteration / $REPEAT_COUNT"
    echo "============================================================"

    if (( iteration % 2 == 1 )); then
        order="full-first"
        run_full "$iteration"
        run_incremental "$iteration"
    else
        order="incremental-first"
        run_incremental "$iteration"
        run_full "$iteration"
    fi

    full_seconds="$(
        tr -d '[:space:]' \
            < "$BENCHMARK_OUT/run-$iteration/full.seconds"
    )"

    profile="$BENCHMARK_OUT/run-$iteration/incremental_profile.json"
    incremental_core_seconds="$(
        jq -r '.totals.pipeline_core_seconds' "$profile"
    )"

    read -r speedup reduction < <(
        python3 - "$full_seconds" "$incremental_core_seconds" <<'PY'
import sys
full = float(sys.argv[1])
incremental = float(sys.argv[2])
print(
    f"{full / incremental:.6f} "
    f"{(full - incremental) / full * 100.0:.6f}"
)
PY
    )

    detection_seconds="$(jq -r '.detection.phase_wall_seconds' "$profile")"
    export_hierarchy_seconds="$(jq -r '.detection.export_hierarchy_seconds' "$profile")"
    extract_partitions_seconds="$(jq -r '.detection.extract_partitions_seconds' "$profile")"
    prepare_partition_frontends_seconds="$(jq -r '.detection.prepare_partition_frontends_seconds' "$profile")"
    compute_signatures_seconds="$(jq -r '.detection.compute_signatures_seconds' "$profile")"
    compare_signatures_seconds="$(jq -r '.detection.compare_signatures_seconds' "$profile")"
    materialize_partitions_seconds="$(jq -r '.build.materialize_partitions_seconds' "$profile")"
    reuse_copy_seconds="$(jq -r '.build.materialization.reuse_copy_seconds' "$profile")"
    rebuild_wall_seconds="$(jq -r '.build.materialization.rebuild_wall_seconds' "$profile")"
    rebuild_yosys_seconds="$(jq -r '.build.materialization.rebuild_yosys_seconds' "$profile")"
    top_shell_seconds="$(jq -r '.build.top_shell_seconds' "$profile")"
    link_partitions_seconds="$(jq -r '.build.link_partitions_seconds' "$profile")"
    check_linked_seconds="$(jq -r '.build.check_linked_seconds' "$profile")"
    unattributed_overhead_seconds="$(jq -r '.totals.unattributed_core_overhead_seconds' "$profile")"
    reuse_count="$(jq -r '.build.materialization.reuse_count' "$profile")"
    rebuild_count="$(jq -r '.build.materialization.rebuild_count' "$profile")"
    top_shell_action="$(jq -r '.reuse_plan.top_shell.status' "$profile")"

    printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
        "$iteration" \
        "$order" \
        "$full_seconds" \
        "$incremental_core_seconds" \
        "$speedup" \
        "$reduction" \
        "$detection_seconds" \
        "$export_hierarchy_seconds" \
        "$extract_partitions_seconds" \
        "$prepare_partition_frontends_seconds" \
        "$compute_signatures_seconds" \
        "$compare_signatures_seconds" \
        "$materialize_partitions_seconds" \
        "$reuse_copy_seconds" \
        "$rebuild_wall_seconds" \
        "$rebuild_yosys_seconds" \
        "$top_shell_seconds" \
        "$link_partitions_seconds" \
        "$check_linked_seconds" \
        "$unattributed_overhead_seconds" \
        "$reuse_count" \
        "$rebuild_count" \
        "$top_shell_action" \
        >> "$RESULTS_CSV"
done

python3 - "$RESULTS_CSV" "$BENCHMARK_OUT/summary.json" <<'PY'
import csv
import json
import statistics
import sys

csv_path, output_path = sys.argv[1:]

with open(csv_path, encoding="utf-8") as file:
    rows = list(csv.DictReader(file))

numeric_fields = [
    "full_seconds",
    "incremental_core_seconds",
    "detection_seconds",
    "export_hierarchy_seconds",
    "extract_partitions_seconds",
    "prepare_partition_frontends_seconds",
    "compute_signatures_seconds",
    "compare_signatures_seconds",
    "materialize_partitions_seconds",
    "reuse_copy_seconds",
    "rebuild_wall_seconds",
    "rebuild_yosys_seconds",
    "top_shell_seconds",
    "link_partitions_seconds",
    "check_linked_seconds",
    "unattributed_overhead_seconds",
]

medians = {
    field: statistics.median(float(row[field]) for row in rows)
    for field in numeric_fields
}

incremental = medians["incremental_core_seconds"]

stage_fields = [
    "export_hierarchy_seconds",
    "extract_partitions_seconds",
    "prepare_partition_frontends_seconds",
    "compute_signatures_seconds",
    "compare_signatures_seconds",
    "materialize_partitions_seconds",
    "top_shell_seconds",
    "link_partitions_seconds",
    "unattributed_overhead_seconds",
]

stage_breakdown = []
for field in stage_fields:
    seconds = medians[field]
    stage_breakdown.append(
        {
            "stage": field.removesuffix("_seconds"),
            "median_seconds": seconds,
            "percent_of_incremental": (
                seconds / incremental * 100.0
                if incremental > 0
                else 0.0
            ),
        }
    )

stage_breakdown.sort(
    key=lambda item: item["median_seconds"],
    reverse=True,
)

full = medians["full_seconds"]
summary = {
    "iteration_count": len(rows),
    "full_median_seconds": full,
    "incremental_core_median_seconds": incremental,
    "speedup": full / incremental,
    "time_reduction_percent": (
        (full - incremental) / full * 100.0
    ),
    "stage_medians": medians,
    "stage_breakdown": stage_breakdown,
    "check_linked_median_seconds_excluded_from_core": medians[
        "check_linked_seconds"
    ],
}

with open(output_path, "w", encoding="utf-8") as file:
    json.dump(summary, file, indent=2, ensure_ascii=False)
    file.write("\n")

print()
print("================ Profile summary ================")
print(f"Full median:              {full:.6f} s")
print(f"Incremental core median:  {incremental:.6f} s")
print(f"Speedup:                  {summary['speedup']:.3f}x")
print(
    "Time reduction:           "
    f"{summary['time_reduction_percent']:.2f}%"
)
print()
print("Incremental stage breakdown:")
for item in stage_breakdown:
    print(
        f"  {item['stage']:<30} "
        f"{item['median_seconds']:>9.6f} s  "
        f"{item['percent_of_incremental']:>6.2f}%"
    )
print()
print(
    "  check_linked (excluded)        "
    f"{medians['check_linked_seconds']:.6f} s"
)
PY

echo
echo "Results:"
echo "  $RESULTS_CSV"
echo "  $BENCHMARK_OUT/summary.json"
