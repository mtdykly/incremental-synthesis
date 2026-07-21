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

### 第一次综合实验结果分析

#### 1. 原设计包含哪些模块

Yosys 前端生成的 `frontend.json` 中共包含 31 个模块，其中有 23 个普通模块和 8 个由 Yosys 根据参数自动生成的 `$paramod` 特化模块。

普通模块主要包括处理器核心模块 `riscv_core`、`singlecycle_ctlpath`、`singlecycle_datapath`、`singlecycle_control`、`alu`、`alu_control`、`control_transfer`、`data_memory_interface`、`immediate_generator`、`instruction_decoder` 和 `regfile`；通用组件 `adder`、`register`、`multiplexer`、`multiplexer2`、`multiplexer4` 和 `multiplexer8`；以及示例存储器和外围模块。

指定 `riscv_core` 为顶层模块后，Yosys 删除了 12 个不在该顶层实例层次中的未使用模块，最终保留了 19 个有效模块。

#### 2. `riscv_core` 实例化了哪些子模块

`riscv_core` 直接实例化了以下三个子模块：

1. `data_memory_interface`
2. `singlecycle_ctlpath`
3. `singlecycle_datapath`

其中，`data_memory_interface` 负责数据存储器接口，`singlecycle_ctlpath` 负责控制信号生成，`singlecycle_datapath` 负责指令执行过程中的数据运算和传递。

#### 3. 前端处理后有多少 cell

直接统计 `frontend.json` 中的全部模块，前端阶段共有 189 个 cell。其中包含后续被判断为未使用的 12 个模块。

在指定 `riscv_core` 为顶层并删除未使用模块后，有效设计中共有 135 个前端 cell。`riscv_core` 本身直接包含 3 个 cell，即其三个直接子模块实例。

#### 4. 综合后有多少 cell

完整执行 Yosys 的 `synth` 流程后，设计共有 7566 个 cell。`riscv_core` 本地仍然只有 3 个直接子模块实例，因为本次综合保留了模块层次，并未将整个设计完全展开到顶层。

综合后 cell 数大幅增加，是因为原先的加法器、比较器、存储器和多路选择器等粗粒度 cell 被转换为大量细粒度逻辑门和触发器。

#### 5. 哪些高层 cell 被展开或优化

前端阶段存在 `$add`、`$sub`、`$eq`、`$lt`、`$le`、`$mux`、`$pmux`、`$shl`、`$shr`、`$sshr`、`$mem_v2` 和 `$adffe` 等高层 cell。

完整综合后，这些高层 cell 大部分被展开或映射为 `$_AND_`、`$_NAND_`、`$_OR_`、`$_MUX_`、`$_XOR_`、`$_XNOR_` 和 `$_DFFE_*` 等细粒度门级 cell。

其中变化最明显的是存储器结构。前端阶段的 4 个 `$mem_v2` 在综合后完全消失，并产生了 1024 个 DFFE 类触发器以及大量 MUX。该结果表明寄存器堆中的存储器被展开成了触发器和读选择网络，导致 `regfile` 的 cell 数从 3 个增长到 4853 个。

#### 6. 综合花费多长时间

本次后端综合的实际运行时间为 2.37 秒，用户态 CPU 时间为 2.27 秒，系统态 CPU 时间为 0.15 秒，峰值物理内存约为 39.5 MiB。

该时间统计覆盖从读取 `frontend.json`、执行层次检查和通用综合，到运行 ABC 并输出综合网表的过程，不包括此前仓库自带前端流程生成 `frontend.json` 的时间。

#### 7. 哪个阶段最值得进一步观察

本次实验中最值得首先观察的是 `MEMORY_MAP` 阶段。该阶段将 4 个 `$mem_v2` 存储器 cell 转换为大量触发器和多路选择逻辑，是 `regfile` cell 数大幅增长的主要原因。

其次应观察 `TECHMAP` 和 `ABC`。`TECHMAP` 负责将算术和比较等高层运算映射到更低层结构，ABC 则进一步进行布尔优化和门级映射。对于后续增量综合研究，ABC 尤其重要，因为小范围 RTL 修改可能经过 ABC 优化后引起较大范围的门级网表变化。