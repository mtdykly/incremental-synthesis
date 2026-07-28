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
BENCHMARK_OUT="$CASE_OUT/benchmark"

SYNTH_FULL="$REPO_ROOT/partition-incremental/scripts/synth_full_reference.sh"
RUN_INCREMENTAL="$REPO_ROOT/partition-incremental/scripts/run_new_incremental_synthesis.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"

BASE_OUT="$CASE_OUT/base"

for required_path in \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR" \
    "$SYNTH_FULL" \
    "$RUN_INCREMENTAL" \
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

# Base top shell 是旧版本缓存，不进入计时。
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
  'iteration,order,full_seconds,incremental_seconds,speedup,improvement_percent,reuse_count,rebuild_count,top_shell_action' \
  > "$RESULTS_CSV"

run_full() {
    local iteration="$1"
    local run_dir="$BENCHMARK_OUT/run-$iteration/full"
    local time_file="$BENCHMARK_OUT/run-$iteration/full.time"

    rm -rf "$run_dir"
    mkdir -p "$(dirname "$run_dir")"

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
    local time_file="$BENCHMARK_OUT/run-$iteration/incremental.time"

    mkdir -p "$BENCHMARK_OUT/run-$iteration"

    /usr/bin/time \
        -f '%e' \
        -o "$time_file" \
        "$RUN_INCREMENTAL" \
            "$CASE_NAME" \
            "$BASE_SOURCE_DIR" \
            "$NEW_SOURCE_DIR"

    test -s "$CASE_OUT/incremental/linked/linked.json"
    test -s "$CASE_OUT/incremental/build_summary.json"

    cp "$CASE_OUT/plan/reuse_plan.json" \
       "$BENCHMARK_OUT/run-$iteration/reuse_plan.json"

    cp "$CASE_OUT/incremental/build_summary.json" \
       "$BENCHMARK_OUT/run-$iteration/build_summary.json"
}

echo
echo "Running benchmark: $CASE_NAME"
echo "Repeat count     : $REPEAT_COUNT"
echo

for iteration in $(seq 1 "$REPEAT_COUNT")
do
    echo
    echo "============================================================"
    echo "Benchmark iteration $iteration / $REPEAT_COUNT"
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
            < "$BENCHMARK_OUT/run-$iteration/full.time"
    )"

    incremental_seconds="$(
        tr -d '[:space:]' \
            < "$BENCHMARK_OUT/run-$iteration/incremental.time"
    )"

    read -r speedup improvement_percent < <(
        python3 - "$full_seconds" "$incremental_seconds" <<'PY'
import sys

full = float(sys.argv[1])
incremental = float(sys.argv[2])

speedup = full / incremental
improvement = (full - incremental) / full * 100.0

print(f"{speedup:.6f} {improvement:.6f}")
PY
    )

    summary="$BENCHMARK_OUT/run-$iteration/build_summary.json"

    reuse_count="$(jq -r '.reuse_count' "$summary")"
    rebuild_count="$(jq -r '.rebuild_count' "$summary")"
    top_shell_action="$(jq -r '.top_shell_action' "$summary")"

    printf '%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
        "$iteration" \
        "$order" \
        "$full_seconds" \
        "$incremental_seconds" \
        "$speedup" \
        "$improvement_percent" \
        "$reuse_count" \
        "$rebuild_count" \
        "$top_shell_action" \
        >> "$RESULTS_CSV"

    echo
    echo "Full        : $full_seconds s"
    echo "Incremental : $incremental_seconds s"
    echo "Speedup     : ${speedup}x"
    echo "Reduction   : ${improvement_percent}%"
done

python3 - "$RESULTS_CSV" "$BENCHMARK_OUT/summary.json" <<'PY'
import csv
import json
import statistics
import sys

csv_path = sys.argv[1]
summary_path = sys.argv[2]

with open(csv_path, encoding="utf-8") as file:
    rows = list(csv.DictReader(file))

full_times = [float(row["full_seconds"]) for row in rows]
incremental_times = [
    float(row["incremental_seconds"])
    for row in rows
]

median_full = statistics.median(full_times)
median_incremental = statistics.median(incremental_times)

summary = {
    "iteration_count": len(rows),
    "full_seconds": {
        "median": median_full,
        "mean": statistics.mean(full_times),
        "minimum": min(full_times),
        "maximum": max(full_times),
    },
    "incremental_seconds": {
        "median": median_incremental,
        "mean": statistics.mean(incremental_times),
        "minimum": min(incremental_times),
        "maximum": max(incremental_times),
    },
    "median_speedup": (
        median_full / median_incremental
    ),
    "median_time_reduction_percent": (
        (median_full - median_incremental)
        / median_full
        * 100.0
    ),
}

with open(summary_path, "w", encoding="utf-8") as file:
    json.dump(summary, file, indent=2)
    file.write("\n")

print()
print("============== Benchmark summary ==============")
print(f"Full median        : {median_full:.6f} s")
print(f"Incremental median : {median_incremental:.6f} s")
print(
    f"Median speedup     : "
    f"{summary['median_speedup']:.3f}x"
)
print(
    f"Median reduction   : "
    f"{summary['median_time_reduction_percent']:.2f}%"
)
PY

echo
echo "Results:"
echo "  $RESULTS_CSV"
echo "  $BENCHMARK_OUT/summary.json"
