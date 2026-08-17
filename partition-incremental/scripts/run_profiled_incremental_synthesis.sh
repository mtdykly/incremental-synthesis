#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> <base_source_dir> <new_source_dir> [profile_json] [top_module]"
}

if [[ $# -lt 3 || $# -gt 5 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"
BASE_SOURCE_DIR="$(realpath "$2")"
NEW_SOURCE_DIR="$(realpath "$3")"
TOP_MODULE="${5:-riscv_core}"
REPO_ROOT="$(git rev-parse --show-toplevel)"
CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"
BASE_OUT="$CASE_OUT/base"
NEW_OUT="$CASE_OUT/new"
PLAN_OUT="$CASE_OUT/plan"
INCREMENTAL_OUT="$CASE_OUT/incremental-profiled"
PROFILE_JSON="${4:-$CASE_OUT/profile/latest.json}"
PROFILE_JSON="$(realpath -m "$PROFILE_JSON")"
PROFILE_DIR="$(dirname "$PROFILE_JSON")"
STAGE_TIME_DIR="$PROFILE_DIR/stage-times"

EXPORT_HIERARCHY="$REPO_ROOT/partition-incremental/scripts/export_hierarchy.sh"
EXTRACT_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/extract_first_level_partitions.py"
PREPARE_FRONTENDS="$REPO_ROOT/partition-incremental/scripts/prepare_all_partition_frontends.sh"
COMPUTE_SIGNATURES="$REPO_ROOT/partition-incremental/scripts/compute_partition_signatures.py"
COMPARE_SIGNATURES="$REPO_ROOT/partition-incremental/scripts/compare_partition_signatures.py"
MATERIALIZE_PROFILED="$REPO_ROOT/partition-incremental/scripts/materialize_incremental_partitions_profiled.sh"
SYNTH_TOP_SHELL="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"
LINK_PARTITIONS="$REPO_ROOT/partition-incremental/scripts/link_partitions.sh"
CHECK_LINKED="$REPO_ROOT/partition-incremental/scripts/check_linked_design.sh"

PARTITION_FLOW="$REPO_ROOT/partition-incremental/yosys/synth_partition.ys"
PARTITION_FRONTEND_SCRIPT="$REPO_ROOT/partition-incremental/scripts/prepare_partition_frontend.sh"
TOP_SCRIPT="$REPO_ROOT/partition-incremental/scripts/synth_top_shell.sh"

BASE_SIGNATURES="$BASE_OUT/partition_signatures.json"
BASE_PARTITIONS="$BASE_OUT/partitions"
BASE_TOP_SHELL="$BASE_OUT/top-shell"

NEW_MANIFEST="$NEW_OUT/partition_manifest.json"
NEW_HIER_JSON="$NEW_OUT/frontend_hier.json"
PLAN_FILE="$PLAN_OUT/reuse_plan.json"

YOSYS_VERSION="$(yosys -V | head -n 1)"

for required_path in \
    "$BASE_SOURCE_DIR" \
    "$NEW_SOURCE_DIR" \
    "$BASE_SIGNATURES" \
    "$BASE_PARTITIONS" \
    "$BASE_OUT/partition_manifest.json" \
    "$EXPORT_HIERARCHY" \
    "$EXTRACT_PARTITIONS" \
    "$PREPARE_FRONTENDS" \
    "$COMPUTE_SIGNATURES" \
    "$COMPARE_SIGNATURES" \
    "$MATERIALIZE_PROFILED" \
    "$SYNTH_TOP_SHELL" \
    "$LINK_PARTITIONS"
do
    if [[ ! -e "$required_path" ]]; then
        echo "ERROR: required path does not exist:"
        echo "  $required_path"
        exit 1
    fi
done

run_timed() {
    local stage_name="$1"
    shift

    local time_file="$STAGE_TIME_DIR/$stage_name.seconds"

    /usr/bin/time \
        -f '%e' \
        -o "$time_file" \
        "$@"
}

read_stage_seconds() {
    tr -d '[:space:]' \
        < "$STAGE_TIME_DIR/$1.seconds"
}

elapsed_seconds() {
    python3 - "$1" "$2" <<'PY'
import sys
start_ns = int(sys.argv[1])
end_ns = int(sys.argv[2])
print(f"{(end_ns - start_ns) / 1_000_000_000:.6f}")
PY
}

rm -rf \
    "$NEW_OUT" \
    "$PLAN_OUT" \
    "$INCREMENTAL_OUT" \
    "$STAGE_TIME_DIR"

rm -f "$PROFILE_JSON"

mkdir -p \
    "$NEW_OUT" \
    "$PLAN_OUT" \
    "$INCREMENTAL_OUT/partitions" \
    "$INCREMENTAL_OUT/top-shell" \
    "$INCREMENTAL_OUT/linked" \
    "$STAGE_TIME_DIR"

pipeline_start_ns="$(date +%s%N)"
detection_start_ns="$pipeline_start_ns"

echo
echo "============================================================"
echo "Detection 1/5: export New hierarchy"
echo "============================================================"
run_timed export_hierarchy \
    "$EXPORT_HIERARCHY" \
        "$NEW_SOURCE_DIR" \
        "$NEW_OUT" \
        "$TOP_MODULE"

echo
echo "============================================================"
echo "Detection 2/5: extract partitions"
echo "============================================================"
run_timed extract_partitions \
    python3 "$EXTRACT_PARTITIONS" "$NEW_HIER_JSON" --top "$TOP_MODULE" --output "$NEW_MANIFEST"

echo
echo "============================================================"
echo "Detection 3/5: prepare isolated partition IR"
echo "============================================================"
run_timed prepare_partition_frontends \
    "$PREPARE_FRONTENDS" \
        "$NEW_SOURCE_DIR" \
        "$NEW_MANIFEST" \
        "$NEW_OUT/partition-frontends"

echo
echo "============================================================"
echo "Detection 4/5: compute signatures"
echo "============================================================"
run_timed compute_signatures \
    python3 "$COMPUTE_SIGNATURES" \
        --hier-json "$NEW_HIER_JSON" \
        --manifest "$NEW_MANIFEST" \
        --partition-ir-dir "$NEW_OUT/partition-frontends" \
        --output "$NEW_OUT/partition_signatures.json" \
        --yosys-version "$YOSYS_VERSION" \
        --partition-flow-file "$PARTITION_FLOW" \
        --partition-flow-file "$PARTITION_FRONTEND_SCRIPT" \
        --top-flow-file "$TOP_SCRIPT"

echo
echo "============================================================"
echo "Detection 5/5: compare signatures"
echo "============================================================"
run_timed compare_signatures \
    python3 "$COMPARE_SIGNATURES" \
        --base-signatures "$BASE_SIGNATURES" \
        --new-signatures "$NEW_OUT/partition_signatures.json" \
        --base-partitions-dir "$BASE_PARTITIONS" \
        --output "$PLAN_FILE"

detection_end_ns="$(date +%s%N)"
detection_phase_seconds="$(
    elapsed_seconds "$detection_start_ns" "$detection_end_ns"
)"

TOP_SHELL_ACTION="$(jq -r '.top_shell.status' "$PLAN_FILE")"

if [[ "$TOP_SHELL_ACTION" != "reuse" \
   && "$TOP_SHELL_ACTION" != "rebuild" ]]
then
    echo "ERROR: invalid top shell action: $TOP_SHELL_ACTION"
    exit 1
fi

if [[ "$TOP_SHELL_ACTION" == "reuse" \
   && ! -s "$BASE_TOP_SHELL/top_shell.rtlil" ]]
then
    echo "ERROR: Base top-shell cache is missing."
    echo "Create it before profiling so Base cache construction is not timed:"
    echo "  $SYNTH_TOP_SHELL \\" 
    echo "    $BASE_OUT/frontend_hier.json \\" 
    echo "    $BASE_OUT/partition_manifest.json \\" 
    echo "    $BASE_TOP_SHELL"
    exit 1
fi

build_start_ns="$(date +%s%N)"

echo
echo "============================================================"
echo "Build 1/4: materialize partitions"
echo "============================================================"
run_timed materialize_partitions \
    "$MATERIALIZE_PROFILED" \
        "$NEW_SOURCE_DIR" \
        "$NEW_MANIFEST" \
        "$PLAN_FILE" \
        "$INCREMENTAL_OUT/partitions"

echo
echo "============================================================"
echo "Build 2/4: materialize top shell ($TOP_SHELL_ACTION)"
echo "============================================================"

if [[ "$TOP_SHELL_ACTION" == "reuse" ]]; then
    run_timed top_shell \
        cp -a \
            "$BASE_TOP_SHELL/." \
            "$INCREMENTAL_OUT/top-shell/"
    TOP_SHELL_SOURCE="base_cache"
else
    run_timed top_shell \
        "$SYNTH_TOP_SHELL" \
            "$NEW_HIER_JSON" \
            "$NEW_MANIFEST" \
            "$INCREMENTAL_OUT/top-shell"
    TOP_SHELL_SOURCE="new_synthesis"
fi

jq -n \
    --arg action "$TOP_SHELL_ACTION" \
    --arg source_kind "$TOP_SHELL_SOURCE" \
    --argjson reasons "$(
        jq -c '.top_shell.reasons // []' "$PLAN_FILE"
    )" \
    '{
        action: $action,
        source_kind: $source_kind,
        reasons: $reasons
    }' \
    > "$INCREMENTAL_OUT/top-shell/materialization_info.json"

echo
echo "============================================================"
echo "Build 3/4: link top shell and partitions"
echo "============================================================"
run_timed link_partitions \
    "$LINK_PARTITIONS" \
        "$INCREMENTAL_OUT/top-shell/top_shell.rtlil" \
        "$NEW_MANIFEST" \
        "$INCREMENTAL_OUT/partitions" \
        "$INCREMENTAL_OUT/linked"

build_core_end_ns="$(date +%s%N)"
build_core_phase_seconds="$(
    elapsed_seconds "$build_start_ns" "$build_core_end_ns"
)"

if [[ ! -s "$INCREMENTAL_OUT/linked/linked.json" ]]; then
    echo "ERROR: linked.json was not generated"
    exit 1
fi

if [[ ! -s "$INCREMENTAL_OUT/linked/linked_netlist.v" ]]; then
    echo "ERROR: linked_netlist.v was not generated"
    exit 1
fi

echo
echo "============================================================"
echo "Build 4/4: check linked design (reported separately)"
echo "============================================================"

if [[ -x "$CHECK_LINKED" ]]; then
    run_timed check_linked \
        "$CHECK_LINKED" \
            "$NEW_MANIFEST" \
            "$INCREMENTAL_OUT/linked/linked.json"
else
    printf '0.000000\n' \
        > "$STAGE_TIME_DIR/check_linked.seconds"
fi

pipeline_end_ns="$(date +%s%N)"
pipeline_core_seconds="$(
    elapsed_seconds "$pipeline_start_ns" "$build_core_end_ns"
)"
pipeline_with_check_seconds="$(
    elapsed_seconds "$pipeline_start_ns" "$pipeline_end_ns"
)"

python3 - \
    "$CASE_NAME" \
    "$PROFILE_JSON" \
    "$STAGE_TIME_DIR" \
    "$NEW_OUT/partition-frontends/frontend_summary.tsv" \
    "$INCREMENTAL_OUT/partitions/materialization_summary.json" \
    "$PLAN_FILE" \
    "$detection_phase_seconds" \
    "$build_core_phase_seconds" \
    "$pipeline_core_seconds" \
    "$pipeline_with_check_seconds" <<'PY'
import csv
import json
import sys
from pathlib import Path

(
    case_name,
    output_path,
    stage_dir,
    frontend_summary_path,
    materialization_summary_path,
    reuse_plan_path,
    detection_phase_seconds,
    build_core_phase_seconds,
    pipeline_core_seconds,
    pipeline_with_check_seconds,
) = sys.argv[1:]

stage_dir = Path(stage_dir)


def stage(name: str) -> float:
    return float(
        (stage_dir / f"{name}.seconds")
        .read_text(encoding="utf-8")
        .strip()
    )

frontend_partitions = []
frontend_summary = Path(frontend_summary_path)
if frontend_summary.is_file():
    with frontend_summary.open(encoding="utf-8") as file:
        reader = csv.DictReader(file, delimiter="\t")
        for row in reader:
            frontend_partitions.append(
                {
                    "partition": row["partition"],
                    "root_module": row["root_module"],
                    "yosys_seconds": float(row["real_seconds"]),
                }
            )

with open(materialization_summary_path, encoding="utf-8") as file:
    materialization = json.load(file)

with open(reuse_plan_path, encoding="utf-8") as file:
    plan = json.load(file)

stages = {
    "export_hierarchy_seconds": stage("export_hierarchy"),
    "extract_partitions_seconds": stage("extract_partitions"),
    "prepare_partition_frontends_seconds": stage(
        "prepare_partition_frontends"
    ),
    "compute_signatures_seconds": stage("compute_signatures"),
    "compare_signatures_seconds": stage("compare_signatures"),
    "materialize_partitions_seconds": stage("materialize_partitions"),
    "top_shell_seconds": stage("top_shell"),
    "link_partitions_seconds": stage("link_partitions"),
    "check_linked_seconds": stage("check_linked"),
}

profiled_stage_sum = sum(
    value
    for key, value in stages.items()
    if key != "check_linked_seconds"
)

profile = {
    "case_name": case_name,
    "timing_policy": {
        "base_cache_build_included": False,
        "equivalence_check_included": False,
        "linked_design_check_in_core_time": False,
        "main_incremental_time": "pipeline_core_seconds",
    },
    "reuse_plan": {
        "reusable_partitions": plan.get("reusable_partitions", []),
        "dirty_partitions": plan.get("dirty_partitions", []),
        "top_shell": plan.get("top_shell", {}),
    },
    "detection": {
        "phase_wall_seconds": float(detection_phase_seconds),
        "export_hierarchy_seconds": stages["export_hierarchy_seconds"],
        "extract_partitions_seconds": stages["extract_partitions_seconds"],
        "prepare_partition_frontends_seconds": stages[
            "prepare_partition_frontends_seconds"
        ],
        "compute_signatures_seconds": stages["compute_signatures_seconds"],
        "compare_signatures_seconds": stages["compare_signatures_seconds"],
        "partition_frontend_yosys": frontend_partitions,
    },
    "build": {
        "phase_wall_seconds": float(build_core_phase_seconds),
        "materialize_partitions_seconds": stages[
            "materialize_partitions_seconds"
        ],
        "top_shell_seconds": stages["top_shell_seconds"],
        "link_partitions_seconds": stages["link_partitions_seconds"],
        "check_linked_seconds": stages["check_linked_seconds"],
        "materialization": materialization,
    },
    "totals": {
        "pipeline_core_seconds": float(pipeline_core_seconds),
        "pipeline_with_check_seconds": float(pipeline_with_check_seconds),
        "profiled_stage_sum_seconds": profiled_stage_sum,
        "unattributed_core_overhead_seconds": max(
            0.0,
            float(pipeline_core_seconds) - profiled_stage_sum,
        ),
    },
}

output = Path(output_path)
output.parent.mkdir(parents=True, exist_ok=True)
with output.open("w", encoding="utf-8") as file:
    json.dump(profile, file, indent=2, ensure_ascii=False)
    file.write("\n")
PY

echo
echo "Profiled incremental synthesis completed."
echo "Profile: $PROFILE_JSON"
echo
jq '{
    reuse_plan,
    detection,
    build: {
        phase_wall_seconds: .build.phase_wall_seconds,
        materialize_partitions_seconds: .build.materialize_partitions_seconds,
        top_shell_seconds: .build.top_shell_seconds,
        link_partitions_seconds: .build.link_partitions_seconds,
        check_linked_seconds: .build.check_linked_seconds,
        materialization: .build.materialization
    },
    totals
}' "$PROFILE_JSON"
