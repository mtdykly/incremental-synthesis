#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import copy
import json
import sys
from pathlib import Path
from typing import Any

JsonObject = dict[str, Any]
IGNORED_ATTRIBUTES = {"src", "hdlname", "top"}


def load_json(path: Path) -> JsonObject:
    with path.open("r", encoding="utf-8") as file:
        value = json.load(file)
    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")
    return value


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as file:
        json.dump(value, file, ensure_ascii=False, indent=2, sort_keys=True)
        file.write("\n")


def stable_hash(value: Any) -> str:
    data = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(data).hexdigest()


def file_hash(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as file:
        for chunk in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def normalize_name(name: str) -> str:
    return name[1:] if name.startswith("\\") else name


def resolve_module_name(modules: JsonObject, requested_name: str) -> str:
    if requested_name in modules:
        return requested_name

    requested = normalize_name(requested_name)
    matches = [
        name for name in modules
        if normalize_name(name) == requested
    ]

    if len(matches) == 1:
        return matches[0]
    if not matches:
        raise ValueError(f"module not found: {requested_name}")
    raise ValueError(f"ambiguous module name: {requested_name}")


def clean(value: Any) -> Any:
    if isinstance(value, dict):
        return {
            key: clean(item)
            for key, item in sorted(value.items())
            if key not in IGNORED_ATTRIBUTES
        }
    if isinstance(value, list):
        return [clean(item) for item in value]
    return value


def canonical_json(value: Any) -> str:
    """生成稳定的 JSON 字符串，用于排序。"""
    return json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def memory_reference_descriptor(
    cell: JsonObject,
) -> JsonObject:
    """
    描述一个 memory 访问 cell，但忽略原始 MEMID。

    原始 MEMID 通常包含 Yosys 自动编号，不稳定。
    """
    result = copy.deepcopy(cell)

    parameters = result.get("parameters", {})

    if "MEMID" in parameters:
        parameters["MEMID"] = "<MEMORY>"

    return clean(result)


def canonical_memories(
    module: JsonObject,
) -> tuple[dict[str, str], list[JsonObject]]:
    """
    为每个 memory 生成稳定标识。

    稳定标识由以下内容决定：
    1. memory 自身属性；
    2. 引用该 memory 的 cell 内容；
    3. 引用 cell 中忽略原始 MEMID。

    返回：
    - 原始 memory 名称到稳定 ID 的映射；
    - 规范化后的 memory 列表。
    """
    memories = module.get("memories", {})
    cells = module.get("cells", {})

    memory_id_map: dict[str, str] = {}
    canonical_records: list[JsonObject] = []

    for memory_name, memory in memories.items():
        references = []

        for cell in cells.values():
            parameters = cell.get("parameters", {})

            if parameters.get("MEMID") == memory_name:
                references.append(
                    memory_reference_descriptor(cell)
                )

        references.sort(key=canonical_json)

        descriptor = {
            "definition": clean(memory),
            "references": references,
        }

        stable_id = (
            "memory:"
            + stable_hash(descriptor)
        )

        memory_id_map[memory_name] = stable_id

        canonical_records.append({
            "stable_id": stable_id,
            "definition": clean(memory),
            "references": references,
        })

    canonical_records.sort(key=canonical_json)

    return memory_id_map, canonical_records


def canonical_cells(
    module: JsonObject,
    memory_id_map: dict[str, str],
) -> list[JsonObject]:
    """
    规范化 cell，并将不稳定的 MEMID 替换为稳定 memory ID。
    """
    result = []

    for original_cell in module.get(
        "cells", {}
    ).values():
        cell = copy.deepcopy(original_cell)

        parameters = cell.get("parameters", {})
        memory_id = parameters.get("MEMID")

        if (
            isinstance(memory_id, str)
            and memory_id in memory_id_map
        ):
            parameters["MEMID"] = (
                memory_id_map[memory_id]
            )

        result.append(clean(cell))

    result.sort(key=canonical_json)

    return result


def canonical_module(
    module: JsonObject,
) -> JsonObject:
    memory_id_map, memories = canonical_memories(
        module
    )

    return {
        "attributes": clean(
            module.get("attributes", {})
        ),
        "parameter_default_values": clean(
            module.get(
                "parameter_default_values", {}
            )
        ),
        "ports": clean(
            module.get("ports", {})
        ),
        "cells": canonical_cells(
            module,
            memory_id_map,
        ),
        "memories": memories,
    }


def interface_descriptor(module: JsonObject) -> list[JsonObject]:
    result: list[JsonObject] = []
    netnames = module.get("netnames", {})

    for name in sorted(module.get("ports", {})):
        port = module["ports"][name]
        net = netnames.get(name, {})
        item: JsonObject = {
            "name": normalize_name(name),
            "direction": port.get("direction"),
            "width": len(port.get("bits", [])),
        }
        for key in ("offset", "upto", "signed"):
            if key in port:
                item[key] = port[key]
            elif key in net:
                item[key] = net[key]
        result.append(item)

    return result


def flow_descriptor(
    yosys_version: str,
    flow_files: list[Path],
) -> JsonObject:
    records = []

    for path in sorted(flow_files, key=lambda item: item.as_posix()):
        if not path.is_file():
            raise ValueError(f"flow file not found: {path}")
        records.append({
            "path": path.as_posix(),
            "sha256": file_hash(path),
        })

    return {
        "yosys_version": yosys_version,
        "flow_files": records,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compute interface signatures from hierarchical JSON and "
            "implementation signatures from isolated partition flattened JSON"
        )
    )
    parser.add_argument("--hier-json", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument(
        "--partition-ir-dir",
        type=Path,
        required=True,
        help="Directory containing <partition>/flattened.json",
    )
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--yosys-version", required=True)
    parser.add_argument(
        "--partition-flow-file",
        type=Path,
        action="append",
        default=[],
    )
    parser.add_argument(
        "--top-flow-file",
        type=Path,
        action="append",
        default=[],
    )
    args = parser.parse_args()

    try:
        hierarchical_design = load_json(args.hier_json)
        manifest = load_json(args.manifest)
        hierarchical_modules = hierarchical_design.get("modules", {})

        if not hierarchical_modules:
            raise ValueError("hierarchical JSON has no modules")

        requested_top = manifest.get("top", {}).get("module_name")
        top_module = resolve_module_name(
            hierarchical_modules,
            requested_top,
        )

        partition_environment = flow_descriptor(
            args.yosys_version,
            args.partition_flow_file,
        )
        top_environment = flow_descriptor(
            args.yosys_version,
            args.top_flow_file,
        )
        partition_environment_signature = stable_hash(
            partition_environment
        )
        top_environment_signature = stable_hash(top_environment)

        partitions: JsonObject = {}

        for partition_name, partition in sorted(
            manifest.get("partitions", {}).items()
        ):
            requested_root = partition.get("root_module")
            hierarchy_root = resolve_module_name(
                hierarchical_modules,
                requested_root,
            )

            flattened_path = (
                args.partition_ir_dir
                / partition_name
                / "flattened.json"
            )
            if not flattened_path.is_file():
                raise ValueError(
                    f"{partition_name}: flattened JSON not found: "
                    f"{flattened_path}"
                )

            flattened_design = load_json(flattened_path)
            flattened_modules = flattened_design.get("modules", {})
            flattened_root = resolve_module_name(
                flattened_modules,
                requested_root,
            )

            interface = interface_descriptor(
                hierarchical_modules[hierarchy_root]
            )
            implementation_payload = {
                "schema_version": 4,
                "partition_name": partition_name,
                "root_instance_name": partition.get(
                    "root_instance_name"
                ),
                "root_module": normalize_name(requested_root),
                "root_parameters": clean(
                    partition.get("root_parameters", {})
                ),
                "flatten_internal": True,
                "isolated_flattened_root": canonical_module(
                    flattened_modules[flattened_root]
                ),
                "environment_signature": (
                    partition_environment_signature
                ),
            }

            partitions[partition_name] = {
                "root_instance_name": partition.get(
                    "root_instance_name"
                ),
                "root_instance_path": partition.get(
                    "root_instance_path"
                ),
                "root_module": requested_root,
                "root_parameters": partition.get(
                    "root_parameters", {}
                ),
                "partition_ir": str(flattened_path),
                "interface": interface,
                "interface_signature": stable_hash(interface),
                "implementation_signature": stable_hash(
                    implementation_payload
                ),
            }

        top_interface = interface_descriptor(
            hierarchical_modules[top_module]
        )
        top_payload = {
            "schema_version": 4,
            "top_module": normalize_name(top_module),
            "module": canonical_module(
                hierarchical_modules[top_module]
            ),
            "partition_roots": [
                {
                    "partition_name": name,
                    "root_instance_name": record.get(
                        "root_instance_name"
                    ),
                    "root_module": normalize_name(
                        record.get("root_module", "")
                    ),
                    "root_parameters": clean(
                        record.get("root_parameters", {})
                    ),
                }
                for name, record in sorted(partitions.items())
            ],
            "environment_signature": top_environment_signature,
        }

        output = {
            "schema_version": 4,
            "signature_method": (
                "isolated_partition_flattened_ir_"
                "with_stable_memory_ids"
            ),
            "top_module": top_module,
            "partition_environment": partition_environment,
            "partition_environment_signature": (
                partition_environment_signature
            ),
            "top_environment": top_environment,
            "top_environment_signature": top_environment_signature,
            "top": {
                "interface": top_interface,
                "interface_signature": stable_hash(top_interface),
                "implementation_signature": stable_hash(top_payload),
            },
            "partitions": partitions,
        }

        write_json(args.output, output)

        print(f"Signature method: {output['signature_method']}")
        print(f"Top module: {normalize_name(top_module)}")
        print(f"Partition count: {len(partitions)}")
        for name, record in partitions.items():
            print(
                f"{name}: "
                f"interface={record['interface_signature'][:12]} "
                f"implementation="
                f"{record['implementation_signature'][:12]}"
            )
        print(f"Written: {args.output}")

    except (OSError, ValueError, json.JSONDecodeError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)


if __name__ == "__main__":
    main()
