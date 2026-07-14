# riscv-simple-sv 第一次综合实验

## 项目信息

- 项目：riscv-simple-sv
- commit：#d66581
- 研究对象：singlecycle
- 顶层模块：riscv_core

## 工具版本

- Yosys：
- Verilator：
- Icarus Verilog：

## 生成结果

- frontend.json：
- frontend.rtlil：
- synth.json：
- synth.rtlil：
- riscv_core_netlist.v：

## 初步观察

1. 原设计包含哪些模块？
2. riscv_core 实例化了哪些子模块？
3. 前端处理后有多少 cell？
4. 综合后有多少 cell？
5. 哪些高层 cell 被展开或优化？
6. 综合花费多长时间？
7. 哪个阶段的日志最值得进一步观察？
