#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

Json = dict[str, Any]
IGNORED_ATTRIBUTES = {"src", "hdlname", "top"}


def load_json(path: Path) -> Json:
    with path.open("r", encoding="utf-8") as f:
        value = json.load(f)
    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")
    return value


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        json.dump(value, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")


def stable_hash(value: Any) -> str:
    encoded = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def file_hash(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def clean(value: Any) -> Any:
    """删除路径、源码行号等不应影响缓存的属性。"""
    if isinstance(value, dict):
        return {
            key: clean(item)
            for key, item in sorted(value.items())
            if key not in IGNORED_ATTRIBUTES
        }
    if isinstance(value, list):
        return [clean(item) for item in value]
    return value


def canonical_module(module: Json) -> Json:
    """
    生成保守的模块结构表示。

    netnames 主要保存信号名称和源码属性，实际连接已经体现在
    ports、cells 和 connections 中，因此不纳入实现签名。
    """
    return {
        "attributes": clean(module.get("attributes", {})),
        "parameter_default_values": clean(
            module.get("parameter_default_values", {})
        ),
        "ports": clean(module.get("ports", {})),
        "cells": clean(module.get("cells", {})),
        "memories": clean(module.get("memories", {})),
    }


def interface_descriptor(module: Json) -> list[Json]:
    """接口签名不使用内部 bit 编号，只使用接口语义。"""
    result: list[Json] = []
    netnames = module.get("netnames", {})

    for name in sorted(module.get("ports", {})):
        port = module["ports"][name]
        net = netnames.get(name, {})

        item: Json = {
            "name": name,
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
) -> Json:
    records = []

    for path in sorted(flow_files, key=lambda p: p.as_posix()):
        if not path.is_file():
            raise ValueError(f"flow file not found: {path}")

        records.append(
            {
                "path": path.as_posix(),
                "sha256": file_hash(path),
            }
        )

    return {
        "yosys_version": yosys_version,
        "flow_files": records,
    }


def internal_module_names(partition: Json) -> list[str]:
    names: set[str] = set()

    for record in partition.get("internal_modules", []):
        if isinstance(record, str):
            names.add(record)
        else:
            name = record.get("module_name")
            if not name:
                raise ValueError(
                    "internal_modules record lacks module_name"
                )
            names.add(name)

    root = partition.get("root_module")
    if root:
        names.add(root)

    return sorted(names)


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compute partition interface and implementation signatures "
            "from hierarchical Yosys JSON"
        )
    )
    parser.add_argument("--hier-json", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
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
        design = load_json(args.hier_json)
        manifest = load_json(args.manifest)
        modules = design.get("modules", {})

        if not modules:
            raise ValueError("hierarchical JSON has no modules")

        top_module = manifest.get("top", {}).get("module_name")
        if not top_module or top_module not in modules:
            raise ValueError(f"top module not found: {top_module}")

        partition_flow = flow_descriptor(
            args.yosys_version,
            args.partition_flow_file,
        )
        top_flow = flow_descriptor(
            args.yosys_version,
            args.top_flow_file,
        )

        partition_environment_signature = stable_hash(partition_flow)
        top_environment_signature = stable_hash(top_flow)

        module_signatures: dict[str, str] = {}

        def get_module_signature(name: str) -> str:
            if name not in modules:
                raise ValueError(f"module not found: {name}")
            if name not in module_signatures:
                module_signatures[name] = stable_hash(
                    canonical_module(modules[name])
                )
            return module_signatures[name]

        partitions: Json = {}

        for partition_name, partition in sorted(
            manifest.get("partitions", {}).items()
        ):
            root_module = partition.get("root_module")
            if not root_module or root_module not in modules:
                raise ValueError(
                    f"{partition_name}: invalid root module "
                    f"{root_module}"
                )

            module_records = [
                {
                    "module_name": name,
                    "module_signature": get_module_signature(name),
                }
                for name in internal_module_names(partition)
            ]

            interface = interface_descriptor(modules[root_module])

            implementation_payload = {
                "schema_version": 1,
                "partition_name": partition_name,
                "root_instance_name": partition.get(
                    "root_instance_name"
                ),
                "root_module": root_module,
                "root_parameters": partition.get(
                    "root_parameters", {}
                ),
                "flatten_internal": partition.get(
                    "flatten_internal", True
                ),
                "internal_modules": module_records,
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
                "root_module": root_module,
                "root_parameters": partition.get(
                    "root_parameters", {}
                ),
                "module_count": len(module_records),
                "interface": interface,
                "interface_signature": stable_hash(interface),
                "internal_module_signatures": module_records,
                "implementation_signature": stable_hash(
                    implementation_payload
                ),
            }

        top_interface = interface_descriptor(modules[top_module])

        top_payload = {
            "schema_version": 1,
            "top_module": top_module,
            "module": canonical_module(modules[top_module]),
            "partition_roots": [
                {
                    "partition_name": name,
                    "root_instance_name": record.get(
                        "root_instance_name"
                    ),
                    "root_module": record.get("root_module"),
                    "root_parameters": record.get(
                        "root_parameters", {}
                    ),
                }
                for name, record in sorted(partitions.items())
            ],
            "environment_signature": top_environment_signature,
        }

        output = {
            "schema_version": 1,
            "top_module": top_module,
            "partition_environment": partition_flow,
            "partition_environment_signature": (
                partition_environment_signature
            ),
            "top_environment": top_flow,
            "top_environment_signature": top_environment_signature,
            "top": {
                "interface": top_interface,
                "interface_signature": stable_hash(top_interface),
                "implementation_signature": stable_hash(top_payload),
            },
            "partitions": partitions,
        }

        write_json(args.output, output)

        print(f"Top module: {top_module}")
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
