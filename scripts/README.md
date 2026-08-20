# Scripts Directory

`scripts/` 现在按用途分组，方便区分“分析脚本”“辅助流程”和“面向具体案例的检查脚本”：

- `scripts/analysis/`
  - 结构差异分析、ECO 分析脚本。
- `scripts/equiv/`
  - 面向具体 ECO 个案的 Yosys 等价性检查脚本。
- `scripts/flows/`
  - 独立的辅助综合流程脚本。
- `scripts/utils/`
  - 结果规整和其他通用小工具。

常用入口：

- `python3 scripts/analysis/analyze_eco.py --help`
- `python3 scripts/analysis/compare_module_blocks.py --help`
- `python3 scripts/utils/normalize_result_paths.py --help`
- `bash scripts/flows/run_yosys_version.sh <source_dir> <output_dir> [top_module]`

完整仓库工作流见根目录 [README.md](../README.md)。
