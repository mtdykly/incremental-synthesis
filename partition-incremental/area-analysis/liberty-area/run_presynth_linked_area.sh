#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <case_name> [liberty_file]"
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
    usage
    exit 1
fi

CASE_NAME="$1"

REPO_ROOT="$(git rev-parse --show-toplevel)"

DEFAULT_LIB="$REPO_ROOT/partition-incremental/area-analysis/lib/NangateOpenCellLibrary_typical.lib"
LIBERTY_FILE="$(realpath "${2:-$DEFAULT_LIB}")"

CASE_OUT="$REPO_ROOT/results/partition-incremental/$CASE_NAME"

NEW_OUT="$CASE_OUT/new"

MANIFEST="$NEW_OUT/partition_manifest.json"
HIER_JSON="$NEW_OUT/frontend_hier.json"
PARTITION_FRONTENDS="$NEW_OUT/partition-frontends"

AREA_ROOT="$CASE_OUT/area-analysis/liberty-area"
OUT="$AREA_ROOT/presynth-linked-mapped"

FULL_STAT="$AREA_ROOT/full-mapped/stat.json"
INC_STAT="$AREA_ROOT/incremental-mapped/linked/stat.json"

MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/measure_mapped_design.sh"

LATCH_MAP="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/nangate45_latch_map.v"

for path in \
    "$MANIFEST" \
    "$HIER_JSON" \
    "$PARTITION_FRONTENDS" \
    "$FULL_STAT" \
    "$INC_STAT" \
    "$LIBERTY_FILE" \
    "$MEASURE" \
    "$LATCH_MAP"
do
    if [[ ! -e "$path" ]]; then
        echo "ERROR: required path missing:"
        echo "  $path"
        exit 1
    fi
done

TOP_MODULE="$(jq -r '.top.module_name' "$MANIFEST")"

if [[ -z "$TOP_MODULE" || "$TOP_MODULE" == "null" ]]; then
    echo "ERROR: top module missing"
    exit 1
fi

rm -rf "$OUT"
mkdir -p "$OUT"

TOP_SHELL_YS="$OUT/build_presynth_top_shell.ys"
MAIN_YS="$OUT/run_presynth_linked.ys"

# ============================================================
# Phase 1
# Extract an UNSYNTHESIZED top shell.
# ============================================================

{
    echo "# Load full frontend hierarchy."
    printf 'read_json "%s"\n\n' "$HIER_JSON"

    echo "# Replace first-level partition implementations with blackboxes."

    while IFS=$'\t' read -r partition_name root_module
    do
        printf '# %s -> %s\n' \
            "$partition_name" \
            "$root_module"

        printf 'blackbox %s\n' \
            "$root_module"

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

    echo
    printf 'hierarchy -check -top %s\n' "$TOP_MODULE"
    echo "check"
    echo

    echo "# Export ONLY the unsynthesized top module."
    echo "select -clear"
    printf 'select %s\n' "$TOP_MODULE"

    printf 'write_json -selected "%s"\n' \
        "$OUT/presynth_top_shell.json"

    echo "select -clear"

} > "$TOP_SHELL_YS"


echo
echo "============================================================"
echo "1. Build pre-synthesis top shell"
echo "============================================================"

yosys \
    -l "$OUT/top_shell.log" \
    -s "$TOP_SHELL_YS"


# ============================================================
# Phase 2
# Link UNSYNTHESIZED partition frontends, then perform one
# global synthesis and one global technology mapping.
# ============================================================

{
    echo "# Load unsynthesized top shell."
    printf 'read_json "%s"\n\n' \
        "$OUT/presynth_top_shell.json"

    echo "# Load partition frontends."
    echo "# These partitions have been internally flattened,"
    echo "# but have NOT passed through synth."

    while IFS=$'\t' read -r partition_name root_module
    do

        PART_RTLIL="$PARTITION_FRONTENDS/$partition_name/flattened.rtlil"

        if [[ ! -f "$PART_RTLIL" ]]; then
            echo "ERROR: missing partition frontend:" >&2
            echo "  $PART_RTLIL" >&2
            exit 1
        fi

        printf '# %s -> %s\n' \
            "$partition_name" \
            "$root_module"

        printf 'read_rtlil "%s"\n' \
            "$PART_RTLIL"

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

    echo
    echo "# Validate reconstructed pre-synthesis hierarchy."

    printf 'hierarchy -check -top %s\n' \
        "$TOP_MODULE"

    echo "check"
    echo

    echo "# Save design BEFORE global flatten/synthesis."

    printf 'write_json "%s"\n' \
        "$OUT/presynth_linked.json"

    printf 'write_rtlil "%s"\n' \
        "$OUT/presynth_linked.rtlil"

    echo
    echo "# Remove partition boundaries globally."

    echo "flatten -noscopeinfo"
    echo "opt_clean"
    echo "check"

    printf 'write_json "%s"\n' \
        "$OUT/presynth_linked_flattened.json"

    echo
    echo "# Perform ONE global generic synthesis."

    printf 'synth -top %s\n' \
        "$TOP_MODULE"

    echo "opt_clean -purge"
    echo "check"

    printf 'write_json "%s"\n' \
        "$OUT/global_synth.json"

    printf 'write_rtlil "%s"\n' \
        "$OUT/global_synth.rtlil"

    echo
    echo "# Perform ONE global Nangate45 technology mapping."

    printf 'dfflibmap -liberty "%s"\n' \
        "$LIBERTY_FILE"

    printf 'abc -liberty "%s"\n' \
        "$LIBERTY_FILE"

    printf 'techmap -map "%s"\n' \
        "$LATCH_MAP"

    echo "opt_clean -purge"
    echo "check"

    printf 'write_json "%s"\n' \
        "$OUT/mapped.json"

    printf 'write_verilog -noattr -noexpr -nodec "%s"\n' \
        "$OUT/mapped_netlist.v"

} > "$MAIN_YS"


echo
echo "============================================================"
echo "2. Pre-synthesis link + global synthesis + global mapping"
echo "============================================================"

/usr/bin/time \
    -p \
    -o "$OUT/time.txt" \
    yosys \
    -l "$OUT/yosys.log" \
    -s "$MAIN_YS"


echo
echo "============================================================"
echo "3. Measure mapped area"
echo "============================================================"

"$MEASURE" \
    "$OUT/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$OUT"


echo
echo "============================================================"
echo "4. Comparison"
echo "============================================================"

python3 - \
    "$FULL_STAT" \
    "$INC_STAT" \
    "$OUT/stat.json" <<'PY'

import json
import sys


def load(path):
    with open(path, encoding="utf-8") as f:
        d = json.load(f)["design"]

    total = float(d["area"])
    seq = float(d.get("sequential_area", 0.0))

    return {
        "total": total,
        "seq": seq,
        "comb": total - seq,
        "cells": int(d.get("num_cells", 0)),
    }


full = load(sys.argv[1])
inc = load(sys.argv[2])
pre = load(sys.argv[3])


def overhead(x, ref):
    return (
        x["total"] - ref["total"]
    ) / ref["total"] * 100.0


print()
print(
    f"{'Method':<42}"
    f"{'Area':>14}"
    f"{'vs Full':>14}"
)

print("-" * 70)

for name, d in [
    ("Full", full),
    ("Incremental", inc),
    ("Pre-synth linked + global synth + map", pre),
]:
    print(
        f"{name:<42}"
        f"{d['total']:>14.3f}"
        f"{overhead(d, full):>+13.3f}%"
    )


original_delta = (
    inc["total"] - full["total"]
)

remaining_delta = (
    pre["total"] - full["total"]
)

if original_delta != 0:
    recovered = (
        inc["total"] - pre["total"]
    ) / original_delta * 100.0

    print()
    print(
        "Recovered original area overhead: "
        f"{recovered:.2f}%"
    )

print()
print(
    "Residual area difference vs Full: "
    f"{remaining_delta:+.3f}"
)

print()

print("Combinational / sequential breakdown:")
print()

for name, d in [
    ("Full", full),
    ("Incremental", inc),
    ("Pre-synth linked", pre),
]:
    print(
        f"{name:<30}"
        f"comb={d['comb']:.3f}  "
        f"seq={d['seq']:.3f}  "
        f"total={d['total']:.3f}  "
        f"cells={d['cells']}"
    )

PY

echo
echo "Generated:"
echo "  $OUT/presynth_top_shell.json"
echo "  $OUT/presynth_linked.json"
echo "  $OUT/presynth_linked_flattened.json"
echo "  $OUT/global_synth.json"
echo "  $OUT/mapped.json"
echo "  $OUT/stat.json"
echo