#!/usr/bin/env bash

set -euo pipefail


usage() {
    echo "Usage:"
    echo "  $0 <cv32e40p_worktree> <output_dir>"
    echo
    echo "Example:"
    echo "  $0 /workspace/cv32e40p-eco001-base \\"
    echo "     benchmarks/cv32e40p-eco-001-base"
}


if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi


SOURCE="$(realpath "$1")"
OUTPUT="$(realpath -m "$2")"

TOP_MODULE="cv32e40p_core"

OUTPUT_COMMON="$OUTPUT/core/common"
ADAPTER_OUT="$OUTPUT/adapter"

NORMALIZED_VERILOG="$OUTPUT_COMMON/normalized_cv32e40p.v"

SLANG_SCRIPT="$ADAPTER_OUT/read_slang.ys"
SLANG_LOG="$ADAPTER_OUT/slang.log"
LOWERED_JSON="$ADAPTER_OUT/slang_lowered.json"

SMOKE_SCRIPT="$ADAPTER_OUT/read_verilog_smoke.ys"
SMOKE_LOG="$ADAPTER_OUT/read_verilog_smoke.log"
SMOKE_JSON="$ADAPTER_OUT/normalized_design.json"


# ============================================================
# 0. Basic checks
# ============================================================

if [[ ! -d "$SOURCE/rtl" ]]; then
    echo "ERROR: invalid CV32E40P source tree:"
    echo "  $SOURCE"
    exit 1
fi


if [[ ! -d "$SOURCE/bhv" ]]; then
    echo "ERROR: missing CV32E40P bhv directory:"
    echo "  $SOURCE/bhv"
    exit 1
fi


if ! command -v yosys >/dev/null 2>&1; then
    echo "ERROR: yosys not found"
    exit 1
fi


if ! command -v python3 >/dev/null 2>&1; then
    echo "ERROR: python3 not found"
    exit 1
fi


if ! yosys -m slang -p 'help read_slang' \
    >/dev/null 2>&1
then
    echo "ERROR: yosys slang frontend is unavailable."
    echo
    echo "Expected:"
    echo "  yosys -m slang -p 'help read_slang'"
    exit 1
fi


rm -rf "$OUTPUT"

mkdir -p \
    "$OUTPUT_COMMON" \
    "$ADAPTER_OUT"


TEMP_DIR="$(mktemp -d)"
STAGE_DIR="$TEMP_DIR/source"

mkdir -p "$STAGE_DIR"


cleanup() {
    rm -rf "$TEMP_DIR"
}

trap cleanup EXIT


# ============================================================
# 1. Source list
# ============================================================

SOURCE_FILES=(
    rtl/include/cv32e40p_apu_core_pkg.sv
    rtl/include/cv32e40p_fpu_pkg.sv
    rtl/include/cv32e40p_pkg.sv

    rtl/cv32e40p_if_stage.sv
    rtl/cv32e40p_cs_registers.sv
    rtl/cv32e40p_register_file_ff.sv
    rtl/cv32e40p_load_store_unit.sv
    rtl/cv32e40p_id_stage.sv
    rtl/cv32e40p_aligner.sv
    rtl/cv32e40p_decoder.sv
    rtl/cv32e40p_compressed_decoder.sv
    rtl/cv32e40p_fifo.sv
    rtl/cv32e40p_prefetch_buffer.sv
    rtl/cv32e40p_hwloop_regs.sv
    rtl/cv32e40p_mult.sv
    rtl/cv32e40p_int_controller.sv
    rtl/cv32e40p_ex_stage.sv
    rtl/cv32e40p_alu_div.sv
    rtl/cv32e40p_alu.sv
    rtl/cv32e40p_ff_one.sv
    rtl/cv32e40p_popcnt.sv
    rtl/cv32e40p_apu_disp.sv
    rtl/cv32e40p_controller.sv
    rtl/cv32e40p_obi_interface.sv
    rtl/cv32e40p_prefetch_controller.sv
    rtl/cv32e40p_sleep_unit.sv
    rtl/cv32e40p_core.sv

    bhv/cv32e40p_sim_clock_gate.sv
)


echo
echo "============================================================"
echo "1. Stage CV32E40P sources"
echo "============================================================"


STAGED_FILES=()

index=0

for relative_path in "${SOURCE_FILES[@]}"
do
    input="$SOURCE/$relative_path"

    if [[ ! -f "$input" ]]; then
        echo "ERROR: missing source:"
        echo "  $input"
        exit 1
    fi

    printf -v prefix "%03d" "$index"

    basename="$(basename "$relative_path")"

    output_file="$STAGE_DIR/${prefix}_${basename}"

    cp "$input" "$output_file"

    STAGED_FILES+=("$output_file")

    index=$((index + 1))
done


# Also copy include-only headers.
for include_dir in \
    "$SOURCE/rtl/include" \
    "$SOURCE/bhv/include"
do
    if [[ ! -d "$include_dir" ]]; then
        continue
    fi

    while IFS= read -r header
    do
        cp "$header" "$STAGE_DIR/"
    done < <(
        find "$include_dir" \
            -maxdepth 1 \
            -type f \
            \( \
                -name '*.svh' \
                -o \
                -name '*.vh' \
            \) \
            | sort
    )
done


echo "Staged ${#STAGED_FILES[@]} SystemVerilog files."


# ============================================================
# 2. Configure selected ECO
#
# This ECO modifies PULP SIMD instruction decoding.
# Therefore COREV_PULP must be enabled.
# ============================================================

echo
echo "============================================================"
echo "2. Configure CV32E40P parameters"
echo "============================================================"


python3 - "$STAGE_DIR" <<'PY'
import re
import sys
from pathlib import Path


stage = Path(sys.argv[1])


def find_one(basename: str) -> Path:
    matches = list(stage.glob(f"*_{basename}"))

    if len(matches) != 1:
        raise RuntimeError(
            f"Expected exactly one {basename}, "
            f"found {matches}"
        )

    return matches[0]


def set_parameter(
    text: str,
    name: str,
    value: str,
    required: bool,
):
    pattern = (
        rf"(parameter\s+{re.escape(name)}"
        rf"\s*=\s*)[^,\n\)]+"
    )

    new_text, count = re.subn(
        pattern,
        rf"\g<1>{value}",
        text,
        count=1,
    )

    if required and count != 1:
        raise RuntimeError(
            f"Failed to configure parameter {name}"
        )

    if count == 1:
        print(f"Configured {name}={value}")

    return new_text


core = find_one("cv32e40p_core.sv")

text = core.read_text(encoding="utf-8")


text = set_parameter(
    text,
    "COREV_PULP",
    "1",
    True,
)

text = set_parameter(
    text,
    "COREV_CLUSTER",
    "0",
    False,
)

text = set_parameter(
    text,
    "FPU",
    "0",
    False,
)


core.write_text(
    text,
    encoding="utf-8",
)
PY


# ============================================================
# 3. Slang frontend + RTLIL normalization
#
# IMPORTANT:
#
# read_slang may leave:
#
#   processes
#   $bmux
#   $bwmux
#   $demux
#   $pmux
#
# So:
#
#   1. proc first
#   2. mux lowering second
#   3. only then write JSON / Verilog
#
# We DO NOT run:
#
#   flatten
#   synth
#   techmap
#   abc
#
# here.
# ============================================================

echo
echo "============================================================"
echo "3. Slang elaboration and frontend lowering"
echo "============================================================"


{
    printf 'read_slang --keep-hierarchy --top %s' \
        "$TOP_MODULE"

    for source_file in "${STAGED_FILES[@]}"
    do
        printf ' %s' "$source_file"
    done

    printf '\n\n'

    printf 'hierarchy -check -top %s\n' \
        "$TOP_MODULE"

    printf '\n'

    # --------------------------------------------------------
    # Critical:
    # JSON and Verilog backends should not receive RTLIL
    # processes from the Slang frontend.
    # --------------------------------------------------------

    printf 'proc\n'

    printf '\n'

    # --------------------------------------------------------
    # Lower internal mux types that do not round-trip cleanly
    # through Verilog.
    # --------------------------------------------------------

    printf 'pmuxtree\n'
    printf 'bmuxmap\n'
    printf 'demuxmap\n'
    printf 'bwmuxmap\n'

    printf '\n'

    printf 'check\n'

    printf '\n'

    printf 'write_json %s\n' \
        "$LOWERED_JSON"

    printf '\n'

    # Do not use -noexpr.
    printf 'write_verilog -noattr %s\n' \
        "$NORMALIZED_VERILOG"

    printf '\n'

    printf 'stat -top %s\n' \
        "$TOP_MODULE"

} > "$SLANG_SCRIPT"


echo
echo "Generated Slang script:"
echo "  $SLANG_SCRIPT"
echo


yosys \
    -m slang \
    -l "$SLANG_LOG" \
    -s "$SLANG_SCRIPT"


if [[ ! -s "$LOWERED_JSON" ]]; then
    echo
    echo "ERROR: lowered JSON was not generated:"
    echo "  $LOWERED_JSON"
    exit 1
fi


if [[ ! -s "$NORMALIZED_VERILOG" ]]; then
    echo
    echo "ERROR: normalized Verilog was not generated:"
    echo "  $NORMALIZED_VERILOG"
    exit 1
fi


echo
echo "PASS: Slang frontend lowering completed."


# ============================================================
# 4. Check for internal mux cells that should have disappeared
# ============================================================

echo
echo "============================================================"
echo "4. Check normalized Verilog"
echo "============================================================"


BAD_CELL_FOUND=0

for cell_type in \
    '\$bwmux' \
    '\$bmux' \
    '\$demux'
do
    if grep -Fq "$cell_type" "$NORMALIZED_VERILOG"
    then
        echo "ERROR: normalized Verilog still contains:"
        echo "  $cell_type"

        grep -Fn \
            "$cell_type" \
            "$NORMALIZED_VERILOG" \
            | head -10

        BAD_CELL_FOUND=1
    fi
done


if [[ "$BAD_CELL_FOUND" -ne 0 ]]; then
    exit 1
fi


echo "PASS: unsupported mux cells were lowered."


# ============================================================
# 5. Ordinary read_verilog smoke test
#
# Important:
#
# write_verilog may legitimately reconstruct always blocks
# for registers.
#
# Therefore after reading normalized Verilog we once again
# run proc BEFORE write_json.
# ============================================================

echo
echo "============================================================"
echo "5. Smoke test using ordinary read_verilog"
echo "============================================================"


cat > "$SMOKE_SCRIPT" <<YOSYS
read_verilog -sv $NORMALIZED_VERILOG

hierarchy -check -top $TOP_MODULE

proc

check

write_json $SMOKE_JSON

stat -top $TOP_MODULE
YOSYS


yosys \
    -l "$SMOKE_LOG" \
    -s "$SMOKE_SCRIPT"


if [[ ! -s "$SMOKE_JSON" ]]; then
    echo
    echo "ERROR: smoke-test JSON was not generated:"
    echo "  $SMOKE_JSON"
    exit 1
fi


echo
echo "PASS: normalized Verilog can be read by ordinary read_verilog."


# ============================================================
# 6. Verify hierarchy
# ============================================================

echo
echo "============================================================"
echo "6. Verify first-level hierarchy"
echo "============================================================"


python3 - "$SMOKE_JSON" "$TOP_MODULE" <<'PY'
import json
import sys
from pathlib import Path


json_path = Path(sys.argv[1])
requested_top = sys.argv[2]


with json_path.open(
    encoding="utf-8",
) as f:
    design = json.load(f)


modules = design.get("modules", {})


def normalize(name):
    if name.startswith("\\"):
        return name[1:]

    return name


top_matches = [
    name
    for name in modules
    if normalize(name) == requested_top
]


if len(top_matches) != 1:
    raise RuntimeError(
        f"Cannot resolve top module {requested_top}: "
        f"{top_matches}"
    )


top = top_matches[0]


children = []

for instance_name, cell in (
    modules[top].get("cells", {}).items()
):
    cell_type = cell.get("type")

    if cell_type not in modules:
        continue

    children.append(
        (
            normalize(instance_name),
            normalize(cell_type),
        )
    )


children.sort()


print(f"Top module: {normalize(top)}")
print(
    "First-level hierarchical instances: "
    f"{len(children)}"
)

print()

for instance_name, module_type in children:
    print(
        f"  {instance_name}"
        f" -> "
        f"{module_type}"
    )


expected = [
    "cs_registers_i",
    "ex_stage_i",
    "id_stage_i",
    "if_stage_i",
    "load_store_unit_i",
    "sleep_unit_i",
]


actual_names = [
    name
    for name, _ in children
]


missing = [
    expected_name
    for expected_name in expected
    if not any(
        expected_name in actual
        for actual in actual_names
    )
]


if missing:
    raise RuntimeError(
        "Missing expected first-level instances: "
        + ", ".join(missing)
    )


if len(children) != 6:
    raise RuntimeError(
        "Expected exactly 6 first-level hierarchical "
        f"instances, found {len(children)}"
    )


print()
print(
    "PASS: all six expected first-level "
    "hierarchical instances are preserved."
)
PY


# ============================================================
# 7. Metadata
# ============================================================

COMMIT="$(
    git -C "$SOURCE" rev-parse HEAD
)"


cat > "$OUTPUT/benchmark_info.json" <<EOF
{
  "benchmark": "cv32e40p",
  "upstream_commit": "$COMMIT",
  "logical_top": "$TOP_MODULE",
  "frontend_adapter": "slang_proc_mux_lowering_write_verilog",
  "keep_hierarchy": true,
  "configuration": {
    "COREV_PULP": 1,
    "COREV_CLUSTER": 0,
    "FPU": 0
  },
  "frontend_lowering": [
    "proc",
    "pmuxtree",
    "bmuxmap",
    "demuxmap",
    "bwmuxmap"
  ],
  "normalized_source": "core/common/normalized_cv32e40p.v"
}
EOF


echo
echo "============================================================"
echo "CV32E40P benchmark preparation completed successfully"
echo "============================================================"
echo
echo "Source:"
echo "  $SOURCE"
echo
echo "Commit:"
echo "  $COMMIT"
echo
echo "Prepared benchmark:"
echo "  $OUTPUT"
echo
echo "Normalized source:"
echo "  $NORMALIZED_VERILOG"
echo
echo "Debug artifacts:"
echo "  $LOWERED_JSON"
echo "  $SLANG_LOG"
echo "  $SMOKE_JSON"
echo "  $SMOKE_LOG"