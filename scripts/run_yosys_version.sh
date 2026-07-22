#!/usr/bin/env bash

set -euo pipefail

# 第一个参数：待综合的 riscv-simple-sv 源码目录
SRC_DIR="$(realpath "$1")"

# 第二个参数：结果输出目录
mkdir -p "$2"
OUT_DIR="$(realpath "$2")"

# 第三个参数可选，默认顶层模块为 riscv_core
TOP="${3:-riscv_core}"

FLOW_FILE="$OUT_DIR/flow.ys"

echo "Source directory: $SRC_DIR"
echo "Output directory: $OUT_DIR"
echo "Top module: $TOP"

# 收集 singlecycle 设计需要的 SystemVerilog 文件
mapfile -t SV_FILES < <(
    {
        # 公共 RTL 模块
        # 排除需要外部内存初始化文件的示例 memory
        find "$SRC_DIR/core/common" \
            -maxdepth 1 \
            -type f \
            -name '*.sv' \
            ! -name 'example_data_memory.sv' \
            ! -name 'example_text_memory.sv'

        # 单周期处理器 RTL
        # 排除用于仿真和板级连接的完整顶层
        find "$SRC_DIR/core/singlecycle" \
            -maxdepth 1 \
            -type f \
            -name '*.sv' \
            ! -name 'toplevel.sv'
    } | sort
)

if [ "${#SV_FILES[@]}" -eq 0 ]; then
    echo "Error: no SystemVerilog source files found."
    exit 1
fi

# 生成 Yosys 脚本
{
    # 将所有源文件放在同一个 read_verilog 命令中
    printf 'read_verilog -sv'
    printf ' -I%s' "$SRC_DIR/core/common"
    printf ' -I%s' "$SRC_DIR/core/singlecycle"
    printf ' -I%s' "$SRC_DIR/synth"

    for file in "${SV_FILES[@]}"; do
        printf ' %s' "$file"
    done

    printf '\n\n'

    cat <<EOF
# ============================================================
# 第一阶段：RTL 前端处理
# ============================================================

# 确定顶层模块，并删除顶层不可达模块
hierarchy -check -top $TOP

# 将 always、case、if 等过程结构转换为内部 cell 和连接
proc

# 删除简单的无效逻辑和未使用对象
opt_clean

# 检查当前设计
check

# 将前端处理后的设计写出
write_json $OUT_DIR/frontend.json
write_rtlil $OUT_DIR/frontend.rtlil

# 将当前统计信息写入 yosys.log
stat -top $TOP

# ============================================================
# 第二阶段：完整逻辑综合
# ============================================================

synth -top $TOP

# 清理综合后无用的 cell 和 wire
opt_clean -purge

# 检查综合结果
check

# 输出综合统计信息
stat -top $TOP

# 将综合后的设计写出
write_json $OUT_DIR/synth.json
write_rtlil $OUT_DIR/synth.rtlil

# 输出结构化 Verilog 网表
write_verilog -noattr -noexpr -nodec \
    $OUT_DIR/riscv_core_netlist.v
EOF
} > "$FLOW_FILE"

# ============================================================
# 执行 Yosys
# ============================================================

(
    /usr/bin/time -p \
        -o "$OUT_DIR/time.txt" \
        yosys \
        -l "$OUT_DIR/yosys.log" \
        -s "$FLOW_FILE"
)

echo
echo "Generated files:"
find "$OUT_DIR" -maxdepth 1 -type f | sort