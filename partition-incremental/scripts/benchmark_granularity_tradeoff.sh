#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir> [repeat_count] [top_module] [liberty_file]"
    echo
    echo "Examples:"
    echo "  $0 eco-001 \\"
    echo "     benchmarks/riscv-eco-001-base \\"
    echo "     benchmarks/riscv-eco-001-new \\"
    echo "     5 riscv_core"
    echo
    echo "  $0 cv32e40p-eco-001 \\"
    echo "     benchmarks/cv32e40p-eco-001-base \\"
    echo "     benchmarks/cv32e40p-eco-001-new \\"
    echo "     5 cv32e40p_core"
}

if [[ $# -lt 3 || $# -gt 6 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"
REPEAT_COUNT="${4:-5}"

REPO_ROOT="$(git rev-parse --show-toplevel)"

ORIGINAL_CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

# ------------------------------------------------------------
# Use a separate internal case so the existing case results
# are not destroyed by profiled runs.
# ------------------------------------------------------------

WORK_CASE_NAME="__granularity_${CASE_NAME}"
WORK_CASE_OUT="$REPO_ROOT/results/partition-incremental/$WORK_CASE_NAME"

BASE_OUT="$WORK_CASE_OUT/base"
NEW_OUT="$WORK_CASE_OUT/new"
PLAN_OUT="$WORK_CASE_OUT/plan"

COARSE_OUT="$WORK_CASE_OUT/incremental-profiled"
FINE_OUT="$WORK_CASE_OUT/incremental-fine-profiled"

REPORT_OUT="$ORIGINAL_CASE_OUT/granularity-tradeoff"

RUNS_OUT="$REPORT_OUT/runs"
AREA_OUT="$REPORT_OUT/area"

# ------------------------------------------------------------
# Top module
# ------------------------------------------------------------

if [[ $# -ge 5 ]]; then
    TOP_MODULE="$5"
else
    ORIGINAL_MANIFEST="$ORIGINAL_CASE_OUT/base/partition_manifest.json"

    if [[ -f "$ORIGINAL_MANIFEST" ]]; then
        TOP_MODULE="$(
            jq -r '.top.module_name' "$ORIGINAL_MANIFEST"
        )"
    else
        TOP_MODULE="riscv_core"
    fi
fi

# ------------------------------------------------------------
# Liberty
# ------------------------------------------------------------

DEFAULT_LIB="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"

if [[ $# -ge 6 ]]; then
    LIBERTY_FILE="$(realpath "$6")"
else
    LIBERTY_FILE="$(realpath "$DEFAULT_LIB")"
fi

# ============================================================
# Existing repository scripts
# ============================================================

SCRIPT_ROOT="$REPO_ROOT/partition-incremental/scripts"
PIPELINE_DIR="$SCRIPT_ROOT/pipeline"
PLANNING_DIR="$SCRIPT_ROOT/planning"
CHECKS_DIR="$SCRIPT_ROOT/checks"

SYNTH_FULL="$PIPELINE_DIR/synth_full_reference.sh"

RUN_COARSE_PROFILED="$SCRIPT_ROOT/run_profiled_incremental_synthesis.sh"

EXPORT_HIERARCHY="$PIPELINE_DIR/export_hierarchy.sh"

EXTRACT_PARTITIONS="$PIPELINE_DIR/extract_first_level_partitions.py"

PREPARE_FRONTENDS="$PIPELINE_DIR/prepare_all_partition_frontends.sh"

COMPUTE_SIGNATURES="$PLANNING_DIR/compute_partition_signatures.py"

COMPARE_SIGNATURES="$PLANNING_DIR/compare_partition_signatures.py"

EXTRACT_FINE="$PLANNING_DIR/extract_fine_regions.py"

COMPUTE_FINE="$PLANNING_DIR/compute_fine_region_signatures.py"

COMPARE_FINE="$PLANNING_DIR/compare_fine_region_signatures.py"

PREPARE_FINE_CACHE="$PIPELINE_DIR/prepare_fine_base_cache.sh"

MATERIALIZE_FINE="$PIPELINE_DIR/materialize_fine_incremental_partition.sh"

SYNTH_TOP_SHELL="$PIPELINE_DIR/synth_top_shell.sh"

LINK_PARTITIONS="$PIPELINE_DIR/link_partitions.sh"

CHECK_LINKED="$CHECKS_DIR/check_linked_design.sh"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"

PARTITION_FRONTEND_SCRIPT="$PIPELINE_DIR/prepare_partition_frontend.sh"

TOP_FLOW_SCRIPT="$PIPELINE_DIR/synth_top_shell.sh"

SYNTH_PARTITION="$PIPELINE_DIR/synth_partition.sh"

# ============================================================
# Area scripts
# ============================================================

AREA_SCRIPT_DIR="$REPO_ROOT/partition-incremental/area-analysis/liberty-area"

MAP_GENERIC="$AREA_SCRIPT_DIR/map_generic_json_to_liberty.sh"

MEASURE="$AREA_SCRIPT_DIR/measure_mapped_design.sh"

LINK_AND_MEASURE="$AREA_SCRIPT_DIR/link_and_measure_liberty.sh"

# ============================================================
# Checks
# ============================================================

if ! [[ "$REPEAT_COUNT" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: repeat_count must be a positive integer"
    exit 1
fi

for command in \
    git \
    jq \
    yosys \
    python3 \
    awk
do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "ERROR: required command not found:"
        echo "  $command"
        exit 1
    fi
done

for path in \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR" \
    "$ORIGINAL_CASE_OUT/base" \
    "$SYNTH_FULL" \
    "$RUN_COARSE_PROFILED" \
    "$EXPORT_HIERARCHY" \
    "$EXTRACT_PARTITIONS" \
    "$PREPARE_FRONTENDS" \
    "$COMPUTE_SIGNATURES" \
    "$COMPARE_SIGNATURES" \
    "$EXTRACT_FINE" \
    "$COMPUTE_FINE" \
    "$COMPARE_FINE" \
    "$PREPARE_FINE_CACHE" \
    "$MATERIALIZE_FINE" \
    "$SYNTH_TOP_SHELL" \
    "$LINK_PARTITIONS" \
    "$MAP_GENERIC" \
    "$MEASURE" \
    "$LINK_AND_MEASURE" \
    "$LIBERTY_FILE" \
    "$SYNTH_PARTITION" 
do
    if [[ ! -e "$path" ]]; then
        echo
        echo "ERROR: required path missing:"
        echo "  $path"
        exit 1
    fi
done

# ============================================================
# Helpers
# ============================================================

elapsed_seconds() {
    python3 - "$1" "$2" <<'PY'
import sys

start_ns = int(sys.argv[1])
end_ns = int(sys.argv[2])

print(
    f"{(end_ns - start_ns) / 1_000_000_000:.6f}"
)
PY
}

YOSYS_VERSION="$(
    yosys -V | head -n 1
)"

# ============================================================
# Create isolated benchmark workspace
# ============================================================

echo
echo "============================================================"
echo "Granularity trade-off benchmark"
echo "============================================================"
echo
echo "Case        : $CASE_NAME"
echo "Work case   : $WORK_CASE_NAME"
echo "Base source : $BASE_SOURCE_DIR"
echo "New source  : $NEW_SOURCE_DIR"
echo "Top module  : $TOP_MODULE"
echo "Repeats     : $REPEAT_COUNT"
echo "Liberty     : $LIBERTY_FILE"
echo

rm -rf "$WORK_CASE_OUT"
rm -rf "$REPORT_OUT"

mkdir -p \
    "$WORK_CASE_OUT" \
    "$REPORT_OUT" \
    "$RUNS_OUT" \
    "$AREA_OUT"

# Historical Base cache is copied, not timed.
cp -a \
    "$ORIGINAL_CASE_OUT/base" \
    "$BASE_OUT"

# ============================================================
# Coarse detection helper
#
# This is the same detection chain used by the existing
# profiled coarse flow.
# ============================================================

prepare_coarse_detection() {

    rm -rf \
        "$NEW_OUT" \
        "$PLAN_OUT"

    mkdir -p \
        "$NEW_OUT" \
        "$PLAN_OUT"

    "$EXPORT_HIERARCHY" \
        "$NEW_SOURCE_DIR" \
        "$NEW_OUT" \
        "$TOP_MODULE"

    python3 "$EXTRACT_PARTITIONS" \
        "$NEW_OUT/frontend_hier.json" \
        --top "$TOP_MODULE" \
        --output "$NEW_OUT/partition_manifest.json"

    "$PREPARE_FRONTENDS" \
        "$NEW_SOURCE_DIR" \
        "$NEW_OUT/partition_manifest.json" \
        "$NEW_OUT/partition-frontends"

    python3 "$COMPUTE_SIGNATURES" \
        --hier-json \
            "$NEW_OUT/frontend_hier.json" \
        --manifest \
            "$NEW_OUT/partition_manifest.json" \
        --partition-ir-dir \
            "$NEW_OUT/partition-frontends" \
        --output \
            "$NEW_OUT/partition_signatures.json" \
        --yosys-version \
            "$YOSYS_VERSION" \
        --partition-flow-file \
            "$PARTITION_FLOW" \
        --partition-flow-file \
            "$PARTITION_FRONTEND_SCRIPT" \
        --top-flow-file \
            "$TOP_FLOW_SCRIPT"

    python3 "$COMPARE_SIGNATURES" \
        --base-signatures \
            "$BASE_OUT/partition_signatures.json" \
        --new-signatures \
            "$NEW_OUT/partition_signatures.json" \
        --base-partitions-dir \
            "$BASE_OUT/partitions" \
        --output \
            "$PLAN_OUT/reuse_plan.json"
}

# ============================================================
# Prewarm historical Fine cache
#
# IMPORTANT:
# This is intentionally outside all timed runs.
#
# Coarse profiling already excludes historical Base cache
# construction; Fine must follow the same policy.
# ============================================================

echo
echo "============================================================"
echo "Prepare historical Fine cache outside benchmark"
echo "============================================================"

prepare_coarse_detection

BASE_FINE_DIR="$BASE_OUT/fine"

BASE_FINE_MANIFEST="$BASE_FINE_DIR/fine_manifest.json"

BASE_FINE_SIGNATURES="$BASE_FINE_DIR/fine_signatures.json"

mkdir -p "$BASE_FINE_DIR"

python3 "$EXTRACT_FINE" \
    --hier-json \
        "$BASE_OUT/frontend_hier.json" \
    --partition-manifest \
        "$BASE_OUT/partition_manifest.json" \
    --reuse-plan \
        "$PLAN_OUT/reuse_plan.json" \
    --output \
        "$BASE_FINE_MANIFEST"

python3 "$COMPUTE_FINE" \
    --hier-json \
        "$BASE_OUT/frontend_hier.json" \
    --fine-manifest \
        "$BASE_FINE_MANIFEST" \
    --output \
        "$BASE_FINE_SIGNATURES"

# Record dirty coarse partition set.
WARM_DIRTY_SET="$(
    jq -c \
        '.dirty_partitions | sort' \
        "$PLAN_OUT/reuse_plan.json"
)"

echo
echo "Dirty coarse partitions:"
echo "$WARM_DIRTY_SET" | jq .

# ------------------------------------------------------------
# Base top shell is historical cache.
# ------------------------------------------------------------

if [[ ! -s "$BASE_OUT/top-shell/top_shell.json" ]]; then

    echo
    echo "Preparing Base top-shell cache..."

    "$SYNTH_TOP_SHELL" \
        "$BASE_OUT/frontend_hier.json" \
        "$BASE_OUT/partition_manifest.json" \
        "$BASE_OUT/top-shell"
fi

# ------------------------------------------------------------
# Prepare Fine caches for every dirty coarse partition.
# ------------------------------------------------------------

while IFS= read -r partition_name
do
    [[ -n "$partition_name" ]] || continue

    REGION_COUNT="$(
        jq -r \
            --arg p "$partition_name" \
            '.partitions[$p].region_count // 0' \
            "$BASE_FINE_MANIFEST"
    )"

    echo
    echo "Fine capability:"
    echo "  partition = $partition_name"
    echo "  child regions = $REGION_COUNT"

    #
    # Leaf coarse partition:
    # there is no finer synthesis unit below this partition.
    #
    if [[ "$REGION_COUNT" -eq 0 ]]; then
        echo "  -> leaf partition; Fine cache not required"
        continue
    fi

    CACHE_DIR="$BASE_OUT/fine-cache/$partition_name"

    if [[ ! -s "$CACHE_DIR/cache_summary.json" ]]; then

        echo
        echo "Preparing Base Fine cache:"
        echo "  $partition_name"

        "$PREPARE_FINE_CACHE" \
            "$BASE_SOURCE_DIR" \
            "$BASE_OUT/frontend_hier.json" \
            "$BASE_FINE_MANIFEST" \
            "$partition_name" \
            "$CACHE_DIR"
    fi

done < <(
    jq -r \
        '.dirty_partitions[]' \
        "$PLAN_OUT/reuse_plan.json"
)

echo
echo "Fine historical cache ready."
echo

# ============================================================
# Full synthesis timing
# ============================================================

run_full_once() {

    local iteration="$1"

    local RUN_DIR="$RUNS_OUT/run-$iteration/full"

    local TIME_FILE="$RUNS_OUT/run-$iteration/full.seconds"

    rm -rf "$RUN_DIR"
    mkdir -p "$RUN_DIR"

    /usr/bin/time \
        -f '%e' \
        -o "$TIME_FILE" \
        "$SYNTH_FULL" \
            "$NEW_SOURCE_DIR" \
            "$RUN_DIR" \
            "$TOP_MODULE"

    test -s "$RUN_DIR/full_reference.json"
}

# ============================================================
# Coarse incremental timing
#
# Reuse existing profiler exactly.
# ============================================================

run_coarse_once() {

    local iteration="$1"

    local PROFILE="$RUNS_OUT/run-$iteration/coarse_profile.json"

    "$RUN_COARSE_PROFILED" \
        "$WORK_CASE_NAME" \
        "$BASE_SOURCE_DIR" \
        "$NEW_SOURCE_DIR" \
        "$PROFILE" \
        "$TOP_MODULE"

    test -s "$PROFILE"
}

# ============================================================
# Fine incremental end-to-end timing
#
# Includes:
#   coarse detection
#   fine region extraction
#   fine signature computation
#   fine signature comparison
#   coarse reuse copying
#   fine region materialization
#   top shell
#   outer link
#
# Excludes:
#   historical Base cache construction
#   final linked-design correctness check
# ============================================================

run_fine_once() {

    local iteration="$1"

    local RUN_META="$RUNS_OUT/run-$iteration"

    local PROFILE="$RUN_META/fine_profile.json"

    rm -rf \
        "$NEW_OUT" \
        "$PLAN_OUT" \
        "$FINE_OUT"

    mkdir -p \
        "$NEW_OUT" \
        "$PLAN_OUT" \
        "$FINE_OUT/partitions" \
        "$FINE_OUT/top-shell" \
        "$FINE_OUT/linked"

    local START_NS
    local END_NS
    local TOTAL_SECONDS

    START_NS="$(date +%s%N)"

    # --------------------------------------------------------
    # 1. Coarse detection
    # --------------------------------------------------------

    "$EXPORT_HIERARCHY" \
        "$NEW_SOURCE_DIR" \
        "$NEW_OUT" \
        "$TOP_MODULE"

    python3 "$EXTRACT_PARTITIONS" \
        "$NEW_OUT/frontend_hier.json" \
        --top "$TOP_MODULE" \
        --output "$NEW_OUT/partition_manifest.json"

    "$PREPARE_FRONTENDS" \
        "$NEW_SOURCE_DIR" \
        "$NEW_OUT/partition_manifest.json" \
        "$NEW_OUT/partition-frontends"

    python3 "$COMPUTE_SIGNATURES" \
        --hier-json \
            "$NEW_OUT/frontend_hier.json" \
        --manifest \
            "$NEW_OUT/partition_manifest.json" \
        --partition-ir-dir \
            "$NEW_OUT/partition-frontends" \
        --output \
            "$NEW_OUT/partition_signatures.json" \
        --yosys-version \
            "$YOSYS_VERSION" \
        --partition-flow-file \
            "$PARTITION_FLOW" \
        --partition-flow-file \
            "$PARTITION_FRONTEND_SCRIPT" \
        --top-flow-file \
            "$TOP_FLOW_SCRIPT"

    python3 "$COMPARE_SIGNATURES" \
        --base-signatures \
            "$BASE_OUT/partition_signatures.json" \
        --new-signatures \
            "$NEW_OUT/partition_signatures.json" \
        --base-partitions-dir \
            "$BASE_OUT/partitions" \
        --output \
            "$PLAN_OUT/reuse_plan.json"

    # --------------------------------------------------------
    # Ensure dirty partition set is identical to the warmup.
    # --------------------------------------------------------

    CURRENT_DIRTY_SET="$(
        jq -c \
            '.dirty_partitions | sort' \
            "$PLAN_OUT/reuse_plan.json"
    )"

    if [[ "$CURRENT_DIRTY_SET" != "$WARM_DIRTY_SET" ]]; then
        echo
        echo "ERROR: dirty coarse partition set changed."
        echo
        echo "Warm:"
        echo "$WARM_DIRTY_SET" | jq .
        echo
        echo "Current:"
        echo "$CURRENT_DIRTY_SET" | jq .
        echo
        echo "Fine Base cache would no longer be a fair historical cache."
        exit 1
    fi

    # --------------------------------------------------------
    # 2. Fine detection
    # --------------------------------------------------------

    mkdir -p "$NEW_OUT/fine"

    NEW_FINE_MANIFEST="$NEW_OUT/fine/fine_manifest.json"

    NEW_FINE_SIGNATURES="$NEW_OUT/fine/fine_signatures.json"

    FINE_PLAN="$PLAN_OUT/fine_reuse_plan.json"

    python3 "$EXTRACT_FINE" \
        --hier-json \
            "$NEW_OUT/frontend_hier.json" \
        --partition-manifest \
            "$NEW_OUT/partition_manifest.json" \
        --reuse-plan \
            "$PLAN_OUT/reuse_plan.json" \
        --output \
            "$NEW_FINE_MANIFEST"

    python3 "$COMPUTE_FINE" \
        --hier-json \
            "$NEW_OUT/frontend_hier.json" \
        --fine-manifest \
            "$NEW_FINE_MANIFEST" \
        --output \
            "$NEW_FINE_SIGNATURES"

    python3 "$COMPARE_FINE" \
        --base-signatures \
            "$BASE_FINE_SIGNATURES" \
        --new-signatures \
            "$NEW_FINE_SIGNATURES" \
        --output \
            "$FINE_PLAN"

    # --------------------------------------------------------
    # 3. Materialize coarse partitions.
    #
    # Clean coarse partitions are copied directly.
    # Dirty coarse partitions enter Fine materialization.
    # --------------------------------------------------------

    while IFS=$'\t' read -r \
        partition_name \
        root_module
    do

        action="$(
            jq -r \
                --arg p "$partition_name" \
                '.decisions[$p].status' \
                "$PLAN_OUT/reuse_plan.json"
        )"

        destination="$FINE_OUT/partitions/$partition_name"

        if [[ "$action" == "reuse" ]]; then

            cp -a \
                "$BASE_OUT/partitions/$partition_name" \
                "$destination"

        elif [[ "$action" == "rebuild" ]]; then

            BASE_REGION_COUNT="$(
                jq -r \
                    --arg p "$partition_name" \
                    '.partitions[$p].region_count // 0' \
                    "$BASE_FINE_MANIFEST"
            )"

            NEW_REGION_COUNT="$(
                jq -r \
                    --arg p "$partition_name" \
                    '.partitions[$p].region_count // 0' \
                    "$NEW_FINE_MANIFEST"
            )"

            echo
            echo "Fine granularity check:"
            echo "  partition   = $partition_name"
            echo "  Base regions = $BASE_REGION_COUNT"
            echo "  New regions  = $NEW_REGION_COUNT"

            #
            # Fine reuse is meaningful only when both Base and New
            # contain direct-child regions.
            #
            if [[ "$BASE_REGION_COUNT" -eq 0 \
            || "$NEW_REGION_COUNT" -eq 0 ]]
            then

                echo
                echo "  -> no usable fine-grained decomposition"
                echo "  -> fallback to whole coarse-partition rebuild"

                "$SYNTH_PARTITION" \
                    "$NEW_SOURCE_DIR" \
                    "$destination" \
                    "$partition_name" \
                    "$root_module"

                # Mark this result so the benchmark can distinguish
                # leaf fallback from true Fine materialization.
                jq -n \
                    --arg partition "$partition_name" \
                    --arg root_module "$root_module" \
                    --argjson base_regions "$BASE_REGION_COUNT" \
                    --argjson new_regions "$NEW_REGION_COUNT" \
                    '{
                        partition: $partition,
                        root_module: $root_module,
                        mode: "coarse_fallback",
                        reason: "no_direct_child_regions",
                        base_region_count: $base_regions,
                        new_region_count: $new_regions
                    }' \
                    > "$destination/fine_fallback_info.json"

            else

                BASE_CACHE="$BASE_OUT/fine-cache/$partition_name"

                if [[ ! -s "$BASE_CACHE/cache_summary.json" ]]; then
                    echo "ERROR: Fine Base cache missing:"
                    echo "  $BASE_CACHE"
                    exit 1
                fi

                "$MATERIALIZE_FINE" \
                    "$NEW_SOURCE_DIR" \
                    "$NEW_OUT/frontend_hier.json" \
                    "$NEW_FINE_MANIFEST" \
                    "$FINE_PLAN" \
                    "$partition_name" \
                    "$BASE_CACHE" \
                    "$destination"
            fi

        else
            echo "ERROR: invalid coarse action:"
            echo "  $partition_name = $action"
            exit 1
        fi

        test -s "$destination/synth.json"

    done < <(
        jq -r '
            .partitions
            | to_entries[]
            | [
                .key,
                .value.root_module
              ]
            | @tsv
        ' "$NEW_OUT/partition_manifest.json"
    )

    # --------------------------------------------------------
    # 4. Top shell
    # --------------------------------------------------------

    TOP_ACTION="$(
        jq -r \
            '.top_shell.status' \
            "$PLAN_OUT/reuse_plan.json"
    )"

    if [[ "$TOP_ACTION" == "reuse" ]]; then

        cp -a \
            "$BASE_OUT/top-shell/." \
            "$FINE_OUT/top-shell/"

    elif [[ "$TOP_ACTION" == "rebuild" ]]; then

        "$SYNTH_TOP_SHELL" \
            "$NEW_OUT/frontend_hier.json" \
            "$NEW_OUT/partition_manifest.json" \
            "$FINE_OUT/top-shell"

    else
        echo "ERROR: invalid top shell action:"
        echo "  $TOP_ACTION"
        exit 1
    fi

    # --------------------------------------------------------
    # 5. Outer link
    # --------------------------------------------------------

    "$LINK_PARTITIONS" \
        "$FINE_OUT/top-shell/top_shell.rtlil" \
        "$NEW_OUT/partition_manifest.json" \
        "$FINE_OUT/partitions" \
        "$FINE_OUT/linked"

    test -s "$FINE_OUT/linked/linked.json"

    # Core timer ends BEFORE optional correctness check.
    END_NS="$(date +%s%N)"

    TOTAL_SECONDS="$(
        elapsed_seconds \
            "$START_NS" \
            "$END_NS"
    )"

    # --------------------------------------------------------
    # Aggregate Fine materialization metrics.
    # --------------------------------------------------------

    FINE_REBUILD_YOSYS="$(
        python3 - "$FINE_OUT/partitions" <<'PY'
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])

total = 0.0

for path in root.glob(
    "*/materialization_summary.json"
):
    with path.open(
        encoding="utf-8"
    ) as f:
        data = json.load(f)

    total += float(
        data.get(
            "rebuild_yosys_seconds",
            0.0,
        )
    )

print(f"{total:.6f}")
PY
    )"

    # --------------------------------------------------------
    # Fine profile JSON
    # --------------------------------------------------------

    jq -n \
        --arg case_name "$CASE_NAME" \
        --arg total_seconds "$TOTAL_SECONDS" \
        --arg fine_rebuild_yosys "$FINE_REBUILD_YOSYS" \
        --argjson coarse_plan "$(
            jq -c '.' "$PLAN_OUT/reuse_plan.json"
        )" \
        --argjson fine_plan "$(
            jq -c '.' "$FINE_PLAN"
        )" \
        '{
            case_name: $case_name,

            timing_policy: {
                base_cache_build_included: false,
                correctness_check_included: false,
                main_time: "pipeline_core_seconds"
            },

            totals: {
                pipeline_core_seconds:
                    ($total_seconds | tonumber),

                fine_rebuild_yosys_seconds:
                    ($fine_rebuild_yosys | tonumber)
            },

            coarse_reuse_plan: {
                reusable_partitions:
                    $coarse_plan.reusable_partitions,

                dirty_partitions:
                    $coarse_plan.dirty_partitions,

                top_shell:
                    $coarse_plan.top_shell
            },

            fine_summary:
                $fine_plan.summary
        }' \
        > "$PROFILE"

    test -s "$PROFILE"

    # --------------------------------------------------------
    # Run linked correctness check AFTER core timer.
    # --------------------------------------------------------

    if [[ -x "$CHECK_LINKED" ]]; then
        "$CHECK_LINKED" \
            "$NEW_OUT/partition_manifest.json" \
            "$FINE_OUT/linked/linked.json"
    fi
}

# ============================================================
# Benchmark iterations
# ============================================================

RESULTS_CSV="$REPORT_OUT/runtime_results.csv"

printf '%s\n' \
'iteration,order,full_seconds,coarse_seconds,fine_seconds,coarse_speedup,fine_speedup,coarse_rebuild_count,fine_dirty_region_count,fine_reusable_region_count,fine_potential_reuse_ratio,fine_rebuild_yosys_seconds' \
> "$RESULTS_CSV"

for iteration in $(seq 1 "$REPEAT_COUNT")
do

    mkdir -p "$RUNS_OUT/run-$iteration"

    echo
    echo "============================================================"
    echo "Granularity benchmark $iteration / $REPEAT_COUNT"
    echo "============================================================"

    # Rotate order to reduce warm-cache and order bias.
    remainder=$(( iteration % 3 ))

    if [[ "$remainder" -eq 1 ]]; then

        ORDER="full-coarse-fine"

        run_full_once "$iteration"
        run_coarse_once "$iteration"
        run_fine_once "$iteration"

    elif [[ "$remainder" -eq 2 ]]; then

        ORDER="coarse-fine-full"

        run_coarse_once "$iteration"
        run_fine_once "$iteration"
        run_full_once "$iteration"

    else

        ORDER="fine-full-coarse"

        run_fine_once "$iteration"
        run_full_once "$iteration"
        run_coarse_once "$iteration"
    fi

    FULL_SECONDS="$(
        tr -d '[:space:]' \
            < "$RUNS_OUT/run-$iteration/full.seconds"
    )"

    COARSE_PROFILE="$RUNS_OUT/run-$iteration/coarse_profile.json"

    FINE_PROFILE="$RUNS_OUT/run-$iteration/fine_profile.json"

    COARSE_SECONDS="$(
        jq -r \
            '.totals.pipeline_core_seconds' \
            "$COARSE_PROFILE"
    )"

    FINE_SECONDS="$(
        jq -r \
            '.totals.pipeline_core_seconds' \
            "$FINE_PROFILE"
    )"

    COARSE_REBUILD_COUNT="$(
        jq -r \
            '.reuse_plan.dirty_partitions | length' \
            "$COARSE_PROFILE"
    )"

    FINE_DIRTY_REGION_COUNT="$(
        jq -r \
            '.fine_summary.dirty_child_region_count // 0' \
            "$FINE_PROFILE"
    )"

    FINE_REUSABLE_REGION_COUNT="$(
        jq -r \
            '.fine_summary.reusable_child_region_count // 0' \
            "$FINE_PROFILE"
    )"

    FINE_REUSE_RATIO="$(
        jq -r \
            '.fine_summary.potential_frontend_reuse_ratio // 0' \
            "$FINE_PROFILE"
    )"

    FINE_REBUILD_YOSYS="$(
        jq -r \
            '.totals.fine_rebuild_yosys_seconds // 0' \
            "$FINE_PROFILE"
    )"

    read -r \
        COARSE_SPEEDUP \
        FINE_SPEEDUP \
        < <(
            python3 - \
                "$FULL_SECONDS" \
                "$COARSE_SECONDS" \
                "$FINE_SECONDS" <<'PY'
import sys

full = float(sys.argv[1])
coarse = float(sys.argv[2])
fine = float(sys.argv[3])

print(
    f"{full / coarse:.6f} "
    f"{full / fine:.6f}"
)
PY
        )

    printf \
'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
        "$iteration" \
        "$ORDER" \
        "$FULL_SECONDS" \
        "$COARSE_SECONDS" \
        "$FINE_SECONDS" \
        "$COARSE_SPEEDUP" \
        "$FINE_SPEEDUP" \
        "$COARSE_REBUILD_COUNT" \
        "$FINE_DIRTY_REGION_COUNT" \
        "$FINE_REUSABLE_REGION_COUNT" \
        "$FINE_REUSE_RATIO" \
        "$FINE_REBUILD_YOSYS" \
        >> "$RESULTS_CSV"
done

# ============================================================
# Area measurement
#
# IMPORTANT:
# Nangate45 mapping is NOT included in the runtime benchmark.
#
# It is run once afterwards only for QoR measurement.
# ============================================================

echo
echo "============================================================"
echo "Area measurement"
echo "============================================================"

rm -rf "$AREA_OUT"

mkdir -p "$AREA_OUT"

# ------------------------------------------------------------
# Full Area
# ------------------------------------------------------------

FULL_GENERIC_LAST="$RUNS_OUT/run-$REPEAT_COUNT/full/full_reference.json"

FULL_AREA_OUT="$AREA_OUT/full"

mkdir -p "$FULL_AREA_OUT"

"$MAP_GENERIC" \
    "$FULL_GENERIC_LAST" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$FULL_AREA_OUT"

"$MEASURE" \
    "$FULL_AREA_OUT/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$FULL_AREA_OUT"

# ------------------------------------------------------------
# Helper for Coarse or Fine partitioned area.
# ------------------------------------------------------------

measure_partitioned_area() {

    local GENERIC_ROOT="$1"
    local OUTPUT_ROOT="$2"

    local MANIFEST="$NEW_OUT/partition_manifest.json"

    local MAPPED_TOP="$OUTPUT_ROOT/top-shell"
    local MAPPED_PARTS="$OUTPUT_ROOT/partitions"
    local MAPPED_LINKED="$OUTPUT_ROOT/linked"

    rm -rf "$OUTPUT_ROOT"

    mkdir -p \
        "$MAPPED_TOP" \
        "$MAPPED_PARTS" \
        "$MAPPED_LINKED"

    "$MAP_GENERIC" \
        "$GENERIC_ROOT/top-shell/top_shell.json" \
        "$TOP_MODULE" \
        "$LIBERTY_FILE" \
        "$MAPPED_TOP"

    while IFS=$'\t' read -r \
        partition_name \
        root_module
    do

        "$MAP_GENERIC" \
            "$GENERIC_ROOT/partitions/$partition_name/synth.json" \
            "$root_module" \
            "$LIBERTY_FILE" \
            "$MAPPED_PARTS/$partition_name"

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

    "$LINK_AND_MEASURE" \
        "$MAPPED_TOP/mapped_netlist.v" \
        "$MANIFEST" \
        "$MAPPED_PARTS" \
        "$LIBERTY_FILE" \
        "$MAPPED_LINKED"
}

# ------------------------------------------------------------
# Coarse area
# ------------------------------------------------------------

measure_partitioned_area \
    "$COARSE_OUT" \
    "$AREA_OUT/coarse"

# ------------------------------------------------------------
# Fine area
#
# Fine regions have already been linked and flattened back
# into each dirty coarse partition. Therefore the final
# technology mapping boundary remains the same coarse
# partition boundary.
# ------------------------------------------------------------

measure_partitioned_area \
    "$FINE_OUT" \
    "$AREA_OUT/fine"

# ============================================================
# Final summary
# ============================================================

python3 - \
    "$CASE_NAME" \
    "$RESULTS_CSV" \
    "$AREA_OUT/full/stat.json" \
    "$AREA_OUT/coarse/linked/stat.json" \
    "$AREA_OUT/fine/linked/stat.json" \
    "$REPORT_OUT/summary.json" \
    "$REPORT_OUT/summary.csv" \
    "$REPORT_OUT/summary.md" <<'PY'

import csv
import json
import statistics
import sys
from pathlib import Path


(
    case_name,
    runtime_csv,
    full_stat_path,
    coarse_stat_path,
    fine_stat_path,
    json_output,
    csv_output,
    md_output,
) = sys.argv[1:]


with open(
    runtime_csv,
    encoding="utf-8",
) as f:
    runtime_rows = list(
        csv.DictReader(f)
    )


def median(field):
    return statistics.median(
        float(row[field])
        for row in runtime_rows
    )


full_time = median(
    "full_seconds"
)

coarse_time = median(
    "coarse_seconds"
)

fine_time = median(
    "fine_seconds"
)


def load_area(path):
    with open(
        path,
        encoding="utf-8",
    ) as f:
        d = json.load(f)["design"]

    total = float(
        d["area"]
    )

    seq = float(
        d.get(
            "sequential_area",
            0.0,
        )
    )

    return {
        "total": total,
        "comb": total - seq,
        "seq": seq,
        "cells": int(
            d.get(
                "num_cells",
                0,
            )
        ),
    }


full_area = load_area(
    full_stat_path
)

coarse_area = load_area(
    coarse_stat_path
)

fine_area = load_area(
    fine_stat_path
)


def overhead(area):
    return (
        area["total"]
        - full_area["total"]
    ) / full_area["total"] * 100.0


def reduction(
    baseline,
    value,
):
    return (
        baseline - value
    ) / baseline * 100.0


last = runtime_rows[-1]

coarse_rebuild_count = int(
    last[
        "coarse_rebuild_count"
    ]
)

fine_dirty_regions = int(
    last[
        "fine_dirty_region_count"
    ]
)

fine_reusable_regions = int(
    last[
        "fine_reusable_region_count"
    ]
)

fine_reuse_ratio = float(
    last[
        "fine_potential_reuse_ratio"
    ]
)


summary = {

    "case_name":
        case_name,

    "repeat_count":
        len(runtime_rows),

    "timing_policy": {
        "full":
            "full generic synthesis",

        "coarse":
            (
                "coarse incremental core: "
                "detection + materialization + link"
            ),

        "fine":
            (
                "coarse detection + fine detection + "
                "fine materialization + outer link"
            ),

        "base_cache_build_included":
            False,

        "correctness_check_included":
            False,

        "liberty_mapping_included_in_runtime":
            False,
    },

    "runtime": {

        "full_median_seconds":
            full_time,

        "coarse_median_seconds":
            coarse_time,

        "fine_median_seconds":
            fine_time,

        "coarse_speedup":
            full_time / coarse_time,

        "fine_speedup":
            full_time / fine_time,

        "coarse_time_reduction_percent":
            reduction(
                full_time,
                coarse_time,
            ),

        "fine_time_reduction_percent":
            reduction(
                full_time,
                fine_time,
            ),

        "fine_vs_coarse_time_reduction_percent":
            reduction(
                coarse_time,
                fine_time,
            ),
    },

    "area": {

        "full":
            full_area,

        "coarse":
            {
                **coarse_area,
                "overhead_percent":
                    overhead(
                        coarse_area
                    ),
            },

        "fine":
            {
                **fine_area,
                "overhead_percent":
                    overhead(
                        fine_area
                    ),
            },
    },

    "granularity": {

        "coarse_dirty_partition_count":
            coarse_rebuild_count,

        "fine_dirty_child_region_count":
            fine_dirty_regions,

        "fine_reusable_child_region_count":
            fine_reusable_regions,

        "fine_potential_frontend_reuse_ratio_within_dirty_partitions":
            fine_reuse_ratio,
    },
}


Path(
    json_output
).write_text(
    json.dumps(
        summary,
        indent=2,
        ensure_ascii=False,
    ) + "\n",
    encoding="utf-8",
)


table = [
    {
        "method": "Full",
        "time": full_time,
        "speedup": 1.0,
        "time_reduction": 0.0,
        "area": full_area["total"],
        "area_overhead": 0.0,
    },
    {
        "method": "Coarse incremental",
        "time": coarse_time,
        "speedup":
            full_time / coarse_time,
        "time_reduction":
            reduction(
                full_time,
                coarse_time,
            ),
        "area":
            coarse_area["total"],
        "area_overhead":
            overhead(
                coarse_area
            ),
    },
    {
        "method": "Fine incremental",
        "time": fine_time,
        "speedup":
            full_time / fine_time,
        "time_reduction":
            reduction(
                full_time,
                fine_time,
            ),
        "area":
            fine_area["total"],
        "area_overhead":
            overhead(
                fine_area
            ),
    },
]


with open(
    csv_output,
    "w",
    newline="",
    encoding="utf-8",
) as f:

    writer = csv.writer(f)

    writer.writerow(
        [
            "Method",
            "Median runtime (s)",
            "Speedup vs Full",
            "Time reduction (%)",
            "Area",
            "Area overhead (%)",
        ]
    )

    for row in table:
        writer.writerow(
            [
                row["method"],
                f"{row['time']:.6f}",
                f"{row['speedup']:.6f}",
                f"{row['time_reduction']:.6f}",
                f"{row['area']:.3f}",
                f"{row['area_overhead']:.6f}",
            ]
        )


md = []

md.append(
    f"# Granularity Trade-off: {case_name}"
)

md.append("")

md.append(
    "| Method | Median runtime | "
    "Speedup | Time reduction | "
    "Area | Area overhead |"
)

md.append(
    "|---|---:|---:|---:|---:|---:|"
)

for row in table:

    md.append(
        "| "
        f"{row['method']} | "
        f"{row['time']:.3f} s | "
        f"{row['speedup']:.3f}x | "
        f"{row['time_reduction']:+.2f}% | "
        f"{row['area']:.3f} | "
        f"{row['area_overhead']:+.3f}% |"
    )


md.append("")
md.append("## Reuse granularity")
md.append("")

md.append(
    f"- Coarse dirty partitions: "
    f"{coarse_rebuild_count}"
)

md.append(
    f"- Fine dirty child regions: "
    f"{fine_dirty_regions}"
)

md.append(
    f"- Fine reusable child regions: "
    f"{fine_reusable_regions}"
)

md.append(
    "- Fine potential frontend reuse ratio "
    "inside dirty coarse partitions: "
    f"{fine_reuse_ratio * 100:.2f}%"
)

md.append("")

md.append(
    "Nangate45 technology mapping is used only "
    "for area measurement and is not included "
    "in the reported runtime."
)

Path(
    md_output
).write_text(
    "\n".join(md) + "\n",
    encoding="utf-8",
)


print()
print("=" * 86)

print(
    f"{'Method':<24}"
    f"{'Median time':>14}"
    f"{'Speedup':>12}"
    f"{'Area':>16}"
    f"{'Area Δ':>12}"
)

print("=" * 86)

for row in table:

    print(
        f"{row['method']:<24}"
        f"{row['time']:>12.3f} s"
        f"{row['speedup']:>11.3f}x"
        f"{row['area']:>16.3f}"
        f"{row['area_overhead']:>+11.3f}%"
    )

print("=" * 86)

print()
print(
    "Fine vs Coarse runtime reduction: "
    f"{summary['runtime']['fine_vs_coarse_time_reduction_percent']:+.2f}%"
)

print()
print(
    "Coarse dirty partitions: "
    f"{coarse_rebuild_count}"
)

print(
    "Fine regions: "
    f"{fine_reusable_regions} reuse, "
    f"{fine_dirty_regions} rebuild"
)

print(
    "Fine potential reuse ratio: "
    f"{fine_reuse_ratio * 100:.2f}%"
)

PY

echo
echo "============================================================"
echo "Granularity benchmark completed"
echo "============================================================"
echo
echo "Results:"
echo "  $REPORT_OUT/runtime_results.csv"
echo "  $REPORT_OUT/summary.csv"
echo "  $REPORT_OUT/summary.json"
echo "  $REPORT_OUT/summary.md"
echo
echo "Area:"
echo "  $AREA_OUT/full/stat.json"
echo "  $AREA_OUT/coarse/linked/stat.json"
echo "  $AREA_OUT/fine/linked/stat.json"
echo
echo "Internal benchmark workspace:"
echo "  $WORK_CASE_OUT"
echo
