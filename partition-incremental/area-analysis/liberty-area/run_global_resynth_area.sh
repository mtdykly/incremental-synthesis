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

MANIFEST="$CASE_OUT/new/partition_manifest.json"

LINKED_GENERIC="$CASE_OUT/incremental/linked/linked.json"

AREA_ROOT="$CASE_OUT/area-analysis/liberty-area"

FULL_STAT="$AREA_ROOT/full-mapped/stat.json"
INC_STAT="$AREA_ROOT/incremental-mapped/linked/stat.json"
GLOBAL_MAP_STAT="$AREA_ROOT/global-reopt-mapped/stat.json"

OUT="$AREA_ROOT/global-resynth-mapped"

MEASURE="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/measure_mapped_design.sh"

LATCH_MAP="$REPO_ROOT/partition-incremental/area-analysis/liberty-area/nangate45_latch_map.v"

for path in \
    "$MANIFEST" \
    "$LINKED_GENERIC" \
    "$FULL_STAT" \
    "$INC_STAT" \
    "$GLOBAL_MAP_STAT" \
    "$LIBERTY_FILE" \
    "$MEASURE" \
    "$LATCH_MAP"
do
    if [[ ! -e "$path" ]]; then
        echo "ERROR: missing:"
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

YS="$OUT/run_global_resynth.ys"

cat > "$YS" <<YOSYS
read_json "$LINKED_GENERIC"

hierarchy -check -top $TOP_MODULE
check

# ------------------------------------------------------------
# 1. Remove partition boundaries
# ------------------------------------------------------------
flatten -noscopeinfo
opt_clean
check

write_json "$OUT/before_global_resynth.json"

# ------------------------------------------------------------
# 2. Re-run the same generic synthesis pass used by Full
# ------------------------------------------------------------
synth -top $TOP_MODULE
opt_clean -purge
check

write_json "$OUT/global_resynth_generic.json"
write_rtlil "$OUT/global_resynth_generic.rtlil"

# ------------------------------------------------------------
# 3. Global Nangate45 technology mapping
# ------------------------------------------------------------
dfflibmap -liberty "$LIBERTY_FILE"
abc -liberty "$LIBERTY_FILE"

techmap -map "$LATCH_MAP"
opt_clean -purge
check

write_json "$OUT/mapped.json"

write_verilog -noattr -noexpr -nodec \
    "$OUT/mapped_netlist.v"
YOSYS

echo
echo "============================================================"
echo "Global generic re-synthesis + global mapping"
echo "============================================================"

/usr/bin/time \
    -p \
    -o "$OUT/time.txt" \
    yosys \
    -l "$OUT/yosys.log" \
    -s "$YS"

echo
echo "============================================================"
echo "Measure result"
echo "============================================================"

"$MEASURE" \
    "$OUT/mapped.json" \
    "$TOP_MODULE" \
    "$LIBERTY_FILE" \
    "$OUT"

python3 - \
    "$FULL_STAT" \
    "$INC_STAT" \
    "$GLOBAL_MAP_STAT" \
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
    }

full = load(sys.argv[1])
inc = load(sys.argv[2])
gmap = load(sys.argv[3])
gres = load(sys.argv[4])

def overhead(x):
    return (
        x["total"] - full["total"]
    ) / full["total"] * 100.0

print()
print(
    f"{'Method':<42}"
    f"{'Area':>14}"
    f"{'vs Full':>14}"
)

print("-" * 70)

rows = [
    ("Full", full),
    ("Incremental", inc),
    ("Incremental + global mapping", gmap),
    (
        "Incremental + global resynth + mapping",
        gres,
    ),
]

for name, d in rows:
    print(
        f"{name:<42}"
        f"{d['total']:>14.3f}"
        f"{overhead(d):>+13.3f}%"
    )

original_delta = (
    inc["total"] - full["total"]
)

if original_delta != 0:
    recovered = (
        inc["total"] - gres["total"]
    ) / original_delta * 100.0

    print()
    print(
        "Recovered original area overhead: "
        f"{recovered:.2f}%"
    )

print()
print("Combinational / sequential breakdown:")
print()

for name, d in rows:
    print(
        f"{name:<42}"
        f"comb={d['comb']:.3f}  "
        f"seq={d['seq']:.3f}  "
        f"total={d['total']:.3f}"
    )
PY