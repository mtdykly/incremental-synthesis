#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Any


JsonObject = dict[str, Any]


def normalize_name(name: str) -> str:
    """去掉 Yosys 标识符可能带有的反斜杠。"""
    if name.startswith("\\"):
        return name[1:]
    return name


def safe_partition_name(instance_name: str) -> str:
    """将实例名称转换为适合作为目录名和 JSON key 的名称。"""
    name = normalize_name(instance_name)
    name = re.sub(r"[^A-Za-z0-9_.-]+", "_", name)
    return name.strip("_") or "partition"


def resolve_module_name(
    modules: JsonObject,
    requested_name: str,
) -> str:
    """兼容 riscv_core 和反斜杠转义名称。"""
    if requested_name in modules:
        return requested_name

    normalized_requested = normalize_name(requested_name)

    matches = [
        module_name
        for module_name in modules
        if normalize_name(module_name) == normalized_requested
    ]

    if len(matches) == 1:
        return matches[0]

    if not matches:
        raise ValueError(
            f"module not found: {requested_name}"
        )

    raise ValueError(
        f"ambiguous module name: {requested_name}, "
        f"matches={matches}"
    )


def get_hierarchical_children(
    modules: JsonObject,
    module_name: str,
) -> list[JsonObject]:
    """
    提取模块中的层次化子模块实例。

    当 cell type 同时出现在 design.modules 中时，
    将该 cell 判断为用户模块实例。
    """
    module = modules[module_name]
    children: list[JsonObject] = []

    for instance_name, cell in module.get("cells", {}).items():
        cell_type = cell.get("type")

        if cell_type not in modules:
            continue

        children.append(
            {
                "instance_name": instance_name,
                "module_type": cell_type,
                "parameters": cell.get("parameters", {}),
                "attributes": cell.get("attributes", {}),
            }
        )

    children.sort(
        key=lambda item: normalize_name(
            item["instance_name"]
        )
    )

    return children


def collect_module_closure(
    modules: JsonObject,
    root_module: str,
) -> set[str]:
    """
    从分区根模块开始递归遍历。

    返回该分区内部会被展平的全部模块定义。
    """
    visited: set[str] = set()
    stack = [root_module]

    while stack:
        current_module = stack.pop()

        if current_module in visited:
            continue

        visited.add(current_module)

        for child in get_hierarchical_children(
            modules,
            current_module,
        ):
            stack.append(child["module_type"])

    return visited


def build_instance_tree(
    modules: JsonObject,
    module_name: str,
    instance_path: str,
    active_modules: set[str] | None = None,
) -> JsonObject:
    """构建分区内部实例树。"""
    active_modules = set(active_modules or set())

    if module_name in active_modules:
        return {
            "instance_path": instance_path,
            "module_type": module_name,
            "recursive_reference": True,
            "children": [],
        }

    next_active = active_modules | {module_name}
    children: list[JsonObject] = []

    for child in get_hierarchical_children(
        modules,
        module_name,
    ):
        child_instance_name = child["instance_name"]

        child_path = (
            f"{instance_path}."
            f"{normalize_name(child_instance_name)}"
        )

        child_tree = build_instance_tree(
            modules=modules,
            module_name=child["module_type"],
            instance_path=child_path,
            active_modules=next_active,
        )

        child_tree["instance_name"] = child_instance_name
        child_tree["parameters"] = child["parameters"]

        children.append(child_tree)

    return {
        "instance_path": instance_path,
        "module_type": module_name,
        "children": children,
    }


def get_module_source(
    modules: JsonObject,
    module_name: str,
) -> str | None:
    attributes = modules[module_name].get(
        "attributes",
        {},
    )

    source = attributes.get("src")

    if source is None:
        return None

    return str(source)


def build_manifest(
    design: JsonObject,
    requested_top: str,
) -> JsonObject:
    modules = design.get("modules", {})

    if not modules:
        raise ValueError(
            "input JSON does not contain modules"
        )

    top_module = resolve_module_name(
        modules,
        requested_top,
    )

    first_level_instances = get_hierarchical_children(
        modules,
        top_module,
    )

    if not first_level_instances:
        raise ValueError(
            f"no first-level module instances found in "
            f"{requested_top}"
        )

    partitions: JsonObject = {}
    module_to_partitions: defaultdict[
        str,
        list[str],
    ] = defaultdict(list)

    used_partition_names: set[str] = set()

    for partition_index, instance in enumerate(
        first_level_instances,
        start=1,
    ):
        instance_name = instance["instance_name"]
        root_module = instance["module_type"]

        base_name = safe_partition_name(instance_name)
        partition_name = base_name

        suffix = 2
        while partition_name in used_partition_names:
            partition_name = f"{base_name}_{suffix}"
            suffix += 1

        used_partition_names.add(partition_name)

        instance_path = (
            f"{normalize_name(top_module)}."
            f"{normalize_name(instance_name)}"
        )

        module_closure = collect_module_closure(
            modules,
            root_module,
        )

        internal_modules: list[JsonObject] = []

        for module_name in sorted(
            module_closure,
            key=normalize_name,
        ):
            internal_modules.append(
                {
                    "module_name": module_name,
                    "display_name": normalize_name(
                        module_name
                    ),
                    "source": get_module_source(
                        modules,
                        module_name,
                    ),
                }
            )

            module_to_partitions[module_name].append(
                partition_name
            )

        partitions[partition_name] = {
            "partition_index": partition_index,
            "root_instance_name": instance_name,
            "root_instance_path": instance_path,
            "root_module": root_module,
            "root_parameters": instance["parameters"],
            "flatten_internal": True,
            "module_count": len(module_closure),
            "internal_modules": internal_modules,
            "instance_tree": build_instance_tree(
                modules=modules,
                module_name=root_module,
                instance_path=instance_path,
            ),
        }

    shared_module_types = {
        module_name: sorted(set(partition_names))
        for module_name, partition_names
        in module_to_partitions.items()
        if len(set(partition_names)) > 1
    }

    hierarchical_instance_names = {
        instance["instance_name"]
        for instance in first_level_instances
    }

    top_local_cells = []

    for cell_name, cell in (
        modules[top_module].get("cells", {}).items()
    ):
        if cell_name in hierarchical_instance_names:
            continue

        top_local_cells.append(
            {
                "cell_name": cell_name,
                "cell_type": cell.get("type"),
            }
        )

    return {
        "schema_version": 1,
        "strategy": "top_first_level_instances",
        "top": {
            "module_name": top_module,
            "display_name": normalize_name(top_module),
            "local_cell_count": len(top_local_cells),
            "local_cells": top_local_cells,
        },
        "partition_count": len(partitions),
        "partitions": partitions,
        "shared_module_types": shared_module_types,
    }


def print_summary(manifest: JsonObject) -> None:
    print(
        f"Top module: "
        f"{manifest['top']['display_name']}"
    )
    print(
        f"Partition count: "
        f"{manifest['partition_count']}"
    )
    print()

    for partition_name, partition in (
        manifest["partitions"].items()
    ):
        print(f"Partition: {partition_name}")
        print(
            "  Root instance: "
            f"{partition['root_instance_path']}"
        )
        print(
            "  Root module: "
            f"{normalize_name(partition['root_module'])}"
        )
        print(
            "  Internal module count: "
            f"{partition['module_count']}"
        )

        for module in partition["internal_modules"]:
            print(f"    - {module['display_name']}")

        print()

    shared_modules = manifest["shared_module_types"]

    if shared_modules:
        print("Shared module definitions:")

        for module_name, partition_names in (
            shared_modules.items()
        ):
            print(
                f"  {normalize_name(module_name)}: "
                f"{', '.join(partition_names)}"
            )
    else:
        print("No shared module definitions found.")


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Extract first-level instance partitions "
            "from hierarchical Yosys JSON"
        )
    )

    parser.add_argument(
        "input_json",
        type=Path,
        help="Yosys JSON generated before flatten",
    )

    parser.add_argument(
        "--top",
        required=True,
        help="top module name, for example riscv_core",
    )

    parser.add_argument(
        "--output",
        type=Path,
        required=True,
        help="output partition manifest JSON",
    )

    args = parser.parse_args()

    try:
        with args.input_json.open(
            "r",
            encoding="utf-8",
        ) as file:
            design = json.load(file)

        manifest = build_manifest(
            design=design,
            requested_top=args.top,
        )

        args.output.parent.mkdir(
            parents=True,
            exist_ok=True,
        )

        with args.output.open(
            "w",
            encoding="utf-8",
        ) as file:
            json.dump(
                manifest,
                file,
                ensure_ascii=False,
                indent=2,
                sort_keys=True,
            )
            file.write("\n")

        print_summary(manifest)

        print()
        print(f"Manifest written to: {args.output}")

    except (
        OSError,
        json.JSONDecodeError,
        ValueError,
    ) as error:
        parser.error(str(error))


if __name__ == "__main__":
    main()
