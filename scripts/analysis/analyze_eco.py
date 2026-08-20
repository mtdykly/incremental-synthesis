#!/usr/bin/env python3

import argparse
import json
import re
from collections import Counter, defaultdict, deque
from pathlib import Path
from typing import Any


def load_json(path: str) -> dict[str, Any]:
    with open(path, "r", encoding="utf-8") as file:
        return json.load(file)


def clean_object(obj: Any) -> Any:
    """
    删除不影响逻辑结构的源码位置属性。
    保留 cell 类型、参数、端口和连接关系。
    """
    if isinstance(obj, dict):
        return {
            key: clean_object(value)
            for key, value in sorted(obj.items())
            if key != "src"
        }

    if isinstance(obj, list):
        return [clean_object(item) for item in obj]

    return obj


def cell_type_counts(module: dict[str, Any]) -> Counter[str]:
    return Counter(
        cell.get("type", "<unknown>")
        for cell in module.get("cells", {}).values()
    )


def print_type_delta(
    base_counts: Counter[str],
    new_counts: Counter[str],
) -> None:
    all_types = sorted(set(base_counts) | set(new_counts))

    changed = False

    for cell_type in all_types:
        base_count = base_counts[cell_type]
        new_count = new_counts[cell_type]
        delta = new_count - base_count

        if delta != 0:
            changed = True
            print(
                f"    {cell_type:<30} "
                f"{base_count:>6} -> {new_count:<6} "
                f"delta={delta:+d}"
            )

    if not changed:
        print("    cell 类型数量没有变化")


def compare_cells(
    base_module: dict[str, Any],
    new_module: dict[str, Any],
) -> tuple[set[str], set[str], set[str]]:
    base_cells = base_module.get("cells", {})
    new_cells = new_module.get("cells", {})

    base_names = set(base_cells)
    new_names = set(new_cells)

    added = new_names - base_names
    removed = base_names - new_names

    modified = {
        name
        for name in base_names & new_names
        if clean_object(base_cells[name]) != clean_object(new_cells[name])
    }

    return added, removed, modified


def print_modified_cell_details(
    name: str,
    base_cell: dict[str, Any],
    new_cell: dict[str, Any],
) -> None:
    print(f"\n    修改 cell：{name}")
    print(
        f"      type: "
        f"{base_cell.get('type')} -> {new_cell.get('type')}"
    )

    base_parameters = clean_object(base_cell.get("parameters", {}))
    new_parameters = clean_object(new_cell.get("parameters", {}))

    if base_parameters != new_parameters:
        print("      parameters 发生变化")

    base_connections = base_cell.get("connections", {})
    new_connections = new_cell.get("connections", {})

    all_ports = sorted(set(base_connections) | set(new_connections))

    for port in all_ports:
        old_bits = base_connections.get(port)
        new_bits = new_connections.get(port)

        if old_bits != new_bits:
            print(f"      port {port}: {old_bits} -> {new_bits}")


def is_real_bit(bit: Any) -> bool:
    return isinstance(bit, int)


def build_graph(
    module: dict[str, Any],
) -> tuple[
    dict[int, set[str]],
    dict[int, set[str]],
    dict[int, list[str]],
]:
    """
    返回：
    consumers：某个 bit 被哪些 cell 作为输入使用
    drivers：某个 bit 被哪些 cell 输出端口驱动
    bit_names：bit 对应的可读 net 名称
    """
    consumers: dict[int, set[str]] = defaultdict(set)
    drivers: dict[int, set[str]] = defaultdict(set)
    bit_names: dict[int, list[str]] = defaultdict(list)

    cells = module.get("cells", {})

    for cell_name, cell in cells.items():
        directions = cell.get("port_directions", {})
        connections = cell.get("connections", {})

        for port_name, bits in connections.items():
            direction = directions.get(port_name)

            for bit in bits:
                if not is_real_bit(bit):
                    continue

                if direction == "output":
                    drivers[bit].add(cell_name)
                elif direction == "input":
                    consumers[bit].add(cell_name)

    for net_name, net_data in module.get("netnames", {}).items():
        for bit in net_data.get("bits", []):
            if is_real_bit(bit):
                bit_names[bit].append(net_name)

    return consumers, drivers, bit_names


def output_bits_by_cell(
    module: dict[str, Any],
    cell_name: str,
) -> set[int]:
    cell = module.get("cells", {}).get(cell_name, {})
    directions = cell.get("port_directions", {})
    connections = cell.get("connections", {})

    result: set[int] = set()

    for port_name, bits in connections.items():
        if directions.get(port_name) != "output":
            continue

        result.update(bit for bit in bits if is_real_bit(bit))

    return result


def cell_is_sequential(cell_type: str) -> bool:
    return bool(
        re.search(
            r"DFF|LATCH|ADFF|SDFF|DLATCH|FF",
            cell_type,
            flags=re.IGNORECASE,
        )
    )


def reconstruct_path(
    target: str,
    predecessor: dict[str, tuple[str, int]],
) -> list[tuple[str, int | None]]:
    path: list[tuple[str, int | None]] = [(target, None)]
    current = target

    while current in predecessor:
        previous, bit = predecessor[current]
        path.append((previous, bit))
        current = previous

    path.reverse()
    return path


def trace_fanout(
    module_name: str,
    module: dict[str, Any],
    seeds: set[str],
    max_depth: int,
    dot_path: str | None,
) -> None:
    cells = module.get("cells", {})
    consumers, _, bit_names = build_graph(module)

    valid_seeds = {name for name in seeds if name in cells}

    if not valid_seeds:
        print("\n  没有可用于追踪的新增或修改 cell。")
        return

    depth_map: dict[str, int] = {
        cell_name: 0 for cell_name in valid_seeds
    }

    predecessor: dict[str, tuple[str, int]] = {}
    queue: deque[str] = deque(sorted(valid_seeds))
    graph_edges: set[tuple[str, str, int]] = set()

    while queue:
        current = queue.popleft()
        current_depth = depth_map[current]

        if current_depth >= max_depth:
            continue

        for bit in output_bits_by_cell(module, current):
            for next_cell in consumers.get(bit, set()):
                if next_cell == current:
                    continue

                graph_edges.add((current, next_cell, bit))

                if next_cell not in depth_map:
                    depth_map[next_cell] = current_depth + 1
                    predecessor[next_cell] = (current, bit)
                    queue.append(next_cell)

    print(f"\n  模块 {module_name} 的下游传播锥")
    print(f"    起始变化 cell 数量：{len(valid_seeds)}")
    print(f"    最大追踪深度：{max_depth}")
    print(f"    下游传播锥 cell 数量：{len(depth_map)}")
    print(f"    模块总 cell 数量：{len(cells)}")

    if cells:
        ratio = len(depth_map) / len(cells) * 100
        print(f"    传播锥占模块比例：{ratio:.2f}%")

    grouped: dict[int, list[str]] = defaultdict(list)

    for cell_name, depth in depth_map.items():
        grouped[depth].append(cell_name)

    for depth in sorted(grouped):
        names = sorted(grouped[depth])

        print(f"\n    深度 {depth}：{len(names)} 个 cell")

        for cell_name in names[:30]:
            cell_type = cells[cell_name].get("type", "<unknown>")
            print(f"      {cell_name}    [{cell_type}]")

        if len(names) > 30:
            print(f"      ……其余 {len(names) - 30} 个未显示")

    sequential_boundaries = [
        name
        for name in depth_map
        if depth_map[name] > 0
        and cell_is_sequential(cells[name].get("type", ""))
    ]

    if sequential_boundaries:
        print("\n  到达的时序边界：")

        for target in sorted(sequential_boundaries)[:10]:
            path = reconstruct_path(target, predecessor)
            rendered = []

            for index, (cell_name, bit) in enumerate(path):
                rendered.append(cell_name)

                if (
                    index < len(path) - 1
                    and bit is not None
                ):
                    names = bit_names.get(bit, [])
                    net_label = names[0] if names else f"bit_{bit}"
                    rendered.append(f"--{net_label}-->")

            print("    " + " ".join(rendered))

    module_output_bits: dict[int, list[str]] = defaultdict(list)

    for port_name, port_data in module.get("ports", {}).items():
        if port_data.get("direction") != "output":
            continue

        for bit in port_data.get("bits", []):
            if is_real_bit(bit):
                module_output_bits[bit].append(port_name)

    reached_outputs: set[str] = set()

    for cell_name in depth_map:
        for bit in output_bits_by_cell(module, cell_name):
            reached_outputs.update(module_output_bits.get(bit, []))

    if reached_outputs:
        print("\n  传播锥到达的模块输出：")
        for port_name in sorted(reached_outputs):
            print(f"    {port_name}")

    if dot_path:
        write_dot(
            dot_path=dot_path,
            cells=cells,
            depth_map=depth_map,
            edges=graph_edges,
            bit_names=bit_names,
            seeds=valid_seeds,
        )


def escape_dot(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def write_dot(
    dot_path: str,
    cells: dict[str, Any],
    depth_map: dict[str, int],
    edges: set[tuple[str, str, int]],
    bit_names: dict[int, list[str]],
    seeds: set[str],
) -> None:
    output = Path(dot_path)
    output.parent.mkdir(parents=True, exist_ok=True)

    with output.open("w", encoding="utf-8") as file:
        file.write("digraph eco_cone {\n")
        file.write("  rankdir=LR;\n")

        for cell_name in sorted(depth_map):
            cell_type = cells[cell_name].get("type", "<unknown>")
            label = escape_dot(f"{cell_name}\\n{cell_type}")

            if cell_name in seeds:
                file.write(
                    f'  "{escape_dot(cell_name)}" '
                    f'[label="{label}", shape=box];\n'
                )
            else:
                file.write(
                    f'  "{escape_dot(cell_name)}" '
                    f'[label="{label}"];\n'
                )

        for source, target, bit in sorted(edges):
            if source not in depth_map or target not in depth_map:
                continue

            names = bit_names.get(bit, [])
            net_label = names[0] if names else f"bit_{bit}"

            file.write(
                f'  "{escape_dot(source)}" -> '
                f'"{escape_dot(target)}" '
                f'[label="{escape_dot(net_label)}"];\n'
            )

        file.write("}\n")

    print(f"\n  已输出传播锥 DOT 文件：{output}")


def analyze(
    base_data: dict[str, Any],
    new_data: dict[str, Any],
    trace_module: str | None,
    max_depth: int,
    dot_path: str | None,
) -> None:
    base_modules = base_data.get("modules", {})
    new_modules = new_data.get("modules", {})

    all_module_names = sorted(set(base_modules) | set(new_modules))

    changed_modules: list[str] = []
    changes_by_module: dict[str, tuple[set[str], set[str], set[str]]] = {}

    print("模块级比较")
    print("=" * 72)

    for module_name in all_module_names:
        if module_name not in base_modules:
            print(f"\n新增模块：{module_name}")
            changed_modules.append(module_name)
            continue

        if module_name not in new_modules:
            print(f"\n删除模块：{module_name}")
            changed_modules.append(module_name)
            continue

        base_module = base_modules[module_name]
        new_module = new_modules[module_name]

        if clean_object(base_module) == clean_object(new_module):
            continue

        changed_modules.append(module_name)

        added, removed, modified = compare_cells(
            base_module,
            new_module,
        )

        changes_by_module[module_name] = (
            added,
            removed,
            modified,
        )

        print(f"\n变化模块：{module_name}")
        print(
            f"  cell 总数："
            f"{len(base_module.get('cells', {}))} "
            f"-> {len(new_module.get('cells', {}))}"
        )
        print(f"  新增 cell：{len(added)}")
        print(f"  删除 cell：{len(removed)}")
        print(f"  修改 cell：{len(modified)}")

        print("\n  cell 类型数量变化：")
        print_type_delta(
            cell_type_counts(base_module),
            cell_type_counts(new_module),
        )

        if added:
            print("\n  新增 cell 名称：")
            for name in sorted(added)[:30]:
                cell_type = new_module["cells"][name].get("type")
                print(f"    {name}    [{cell_type}]")

        if removed:
            print("\n  删除 cell 名称：")
            for name in sorted(removed)[:30]:
                cell_type = base_module["cells"][name].get("type")
                print(f"    {name}    [{cell_type}]")

        if modified:
            print("\n  修改 cell 详情：")
            for name in sorted(modified)[:20]:
                print_modified_cell_details(
                    name,
                    base_module["cells"][name],
                    new_module["cells"][name],
                )

        base_ports = clean_object(base_module.get("ports", {}))
        new_ports = clean_object(new_module.get("ports", {}))

        if base_ports != new_ports:
            print("\n  模块端口定义发生变化")

    print("\n" + "=" * 72)
    print(f"变化模块数量：{len(changed_modules)}")

    for module_name in changed_modules:
        print(f"  {module_name}")

    if trace_module:
        if trace_module not in new_modules:
            raise ValueError(
                f"新版本中不存在模块：{trace_module}"
            )

        added, _, modified = changes_by_module.get(
            trace_module,
            (set(), set(), set()),
        )

        seeds = added | modified

        trace_fanout(
            module_name=trace_module,
            module=new_modules[trace_module],
            seeds=seeds,
            max_depth=max_depth,
            dot_path=dot_path,
        )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="比较两份 Yosys JSON 并追踪变化传播锥"
    )

    parser.add_argument("--base", required=True)
    parser.add_argument("--new", required=True)
    parser.add_argument("--module")
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--dot")

    args = parser.parse_args()

    base_data = load_json(args.base)
    new_data = load_json(args.new)

    analyze(
        base_data=base_data,
        new_data=new_data,
        trace_module=args.module,
        max_depth=args.depth,
        dot_path=args.dot,
    )


if __name__ == "__main__":
    main()