# Incremental Synthesis Repository

这个仓库主要做两类事情：

1. 用 Yosys 做全量综合实验和 ECO 差异分析。
2. 验证基于分区的增量综合原型，包括复用计划、缓存判定和性能 benchmark。

这次整理主要是“仓库结构层面”的，不改核心算法逻辑：把辅助脚本按用途归类，把常用入口写清楚，让你更容易区分哪些是源码、哪些是实验输入、哪些是生成结果。

## 目录结构

```text
.
├── benchmarks/             # Base / New RTL benchmarks
├── environment/            # Python deps, tool version snapshots, env notes
├── experiments/            # Case-specific diffs and one-off experiment files
├── partition-incremental/  # Core incremental synthesis prototype
├── results/                # Generated outputs, logs, reports, and figures
└── scripts/
    ├── analysis/           # ECO / module-structure analysis helpers
    ├── equiv/              # Per-case Yosys equivalence scripts
    ├── flows/              # Standalone helper synthesis flows
    └── utils/              # Result normalization and small utilities
```

如果你想先看“核心逻辑”，建议先看：

- `partition-incremental/scripts/`
- `partition-incremental/yosys/`
- `scripts/analysis/`

如果你想先看“已有结果”，建议先看：

- `results/eco-*`
- `results/partition-incremental/*`

## 环境准备

主流程默认按 Linux 或 WSL 环境编写，多个脚本依赖 `bash`、`realpath`、`find` 和 `/usr/bin/time`。

必需工具：

- `bash`
- `git`
- `python3`
- `yosys`
- `jq`

按功能可选：

- `graphviz` for rendering `.dot` graphs
- `iverilog` and `vvp` for counterexample/testbench runs
- `eqy` for equivalence checking

安装 Python 依赖：

```bash
python3 -m pip install -r environment/requirements.txt
```

参考环境记录：

- `environment/tool-versions.txt`
- `environment/OSS_CAD_SUITE_INSTALL_INFO.txt`

## 常用命令

### 1. 跑一份普通的 Yosys 全量综合

```bash
bash scripts/flows/run_yosys_version.sh \
  benchmarks/riscv-eco-003-new \
  results/eco-003/new
```

典型输出：

- `frontend.json`
- `synth.json`
- `riscv_core_netlist.v`
- `yosys.log`

### 2. 分析两份 Yosys JSON 的 ECO 差异

```bash
python3 scripts/analysis/analyze_eco.py \
  --base results/eco-001/canonical-base/synth.json \
  --new results/eco-001/canonical-new/synth.json \
  --module singlecycle_ctlpath \
  --depth 8 \
  --dot results/eco-001/frontend-cone.dot
```

这个脚本适合回答两类问题：

- 哪些模块或 cell 发生了变化
- 变化沿扇出路径传播到了哪里

### 3. 比较 RTLIL 或 Verilog 的模块结构

```bash
python3 scripts/analysis/compare_module_blocks.py \
  --base results/eco-001/base/synth.rtlil \
  --new results/eco-001/new/synth.rtlil \
  --kind rtlil
```

如果想直接看文本 diff，可以加 `--show-diff`。

### 4. 规整结果文件里的绝对路径

```bash
python3 scripts/utils/normalize_result_paths.py \
  --input results/eco-001/base \
  --output results/eco-001/normalized/base \
  --source-root benchmarks/riscv-eco-001-base
```

这个脚本可以把结果里依赖本机路径的内容统一成占位路径，方便跨机器比较。

## 分区增量综合工作流

`partition-incremental/` 是仓库里的主原型目录。更细的阶段说明还保留在 `partition-incremental/README.md`；下面这些是最直接可跑的入口。

### 1. 首次为一个 case 建立 Base 缓存并生成复用计划

```bash
bash partition-incremental/scripts/validate_signature_case.sh \
  eco-001 \
  benchmarks/riscv-eco-001-base \
  benchmarks/riscv-eco-001-new
```

这个命令会准备：

- Base 层次导出
- Base 分区缓存
- New 层次导出
- New 签名
- `results/partition-incremental/eco-001/plan/reuse_plan.json`

### 2. 只重算 New 侧的复用计划

前提：`results/partition-incremental/<case>/base/` 已经存在。

```bash
bash partition-incremental/scripts/prepare_new_reuse_plan.sh \
  eco-001 \
  benchmarks/riscv-eco-001-new
```

### 3. 基于已有计划构建增量综合结果

```bash
bash partition-incremental/scripts/build_incremental_design.sh \
  eco-001 \
  benchmarks/riscv-eco-001-base \
  benchmarks/riscv-eco-001-new
```

关键输出：

- `results/partition-incremental/eco-001/incremental/partitions/`
- `results/partition-incremental/eco-001/incremental/top-shell/`
- `results/partition-incremental/eco-001/incremental/linked/`

### 4. 一条命令完成“计划生成 + 增量构建”

```bash
bash partition-incremental/scripts/run_new_incremental_synthesis.sh \
  eco-001 \
  benchmarks/riscv-eco-001-base \
  benchmarks/riscv-eco-001-new
```

### 5. 跑全量综合 vs 增量综合的性能对比

```bash
bash partition-incremental/scripts/benchmark_full_vs_incremental_profiled.sh \
  eco-001 \
  benchmarks/riscv-eco-001-base \
  benchmarks/riscv-eco-001-new \
  3
```

Benchmark 结果会写到：

- `results/partition-incremental/eco-001/benchmark-profiled/results.csv`
- `results/partition-incremental/eco-001/benchmark-profiled/summary.json`

## 结果目录约定

理解 `results/` 时，建议按下面这个方式看：

- `results/eco-*`
  - 单个 ECO 的全量综合、比较分析和等价性检查结果。
- `results/partition-incremental/<case>/base`
  - Base 版本的层次导出、分区缓存和签名。
- `results/partition-incremental/<case>/new`
  - New 版本的层次导出、前端 IR 和签名。
- `results/partition-incremental/<case>/plan`
  - 复用计划输出。
- `results/partition-incremental/<case>/incremental`
  - 增量分区、top shell 和链接结果。
- `results/partition-incremental/<case>/benchmark-profiled`
  - 分阶段 benchmark 数据。

## 维护约定

- 新的分析脚本放到 `scripts/analysis/`。
- 新的通用工具放到 `scripts/utils/`。
- 面向具体 case 的 Yosys 检查脚本放到 `scripts/equiv/<case>/`。
- 原型主流程继续收敛在 `partition-incremental/scripts/`。
- `results/` 只放生成物，不再放长期维护的源码。

## 这次整理没有改动的部分

这次没有删除历史结果，也没有改动 `partition-incremental/` 主流程逻辑。重点是把仓库导航、脚本归类和使用说明补齐，降低后续继续整理时的认知成本。
