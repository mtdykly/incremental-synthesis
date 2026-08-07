#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any

JsonObject = dict[str, Any]

IGNORED_ATTRIBUTES = {
    "src",
    "hdlname",
    "top",
}


def load_json(path: Path) -> JsonObject:
    with path.open("r", encoding="utf-8") as file:
        value = json.load(file)

    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")

    return value


def normalize_name(name: str) -> str:
    return name[1:] if name.startswith("\\") else name


def resolve_module(
    modules: JsonObject,
    requested: str,
) -> tuple[str, JsonObject]:
    if requested in modules:
        return requested, modules[requested]

    target = normalize_name(requested)

    matches = [
        name
        for name in modules
        if normalize_name(name) == target
    ]

    if len(matches) != 1:
        raise ValueError(
            f"Cannot uniquely resolve module {requested!r}"
        )

    name = matches[0]
    return name, modules[name]


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


def endpoint_sort_key(endpoint: JsonObject) -> str:
    """为单个连接端点生成稳定排序键。"""
    return json.dumps(
        endpoint,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def endpoint_group_sort_key(
    endpoints: list[JsonObject],
) -> str:
    """为一组属于同一根网络的端点生成稳定排序键。"""
    ordered_endpoints = sorted(
        endpoints,
        key=endpoint_sort_key,
    )

    return json.dumps(
        ordered_endpoints,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def canonical_top(
    design: JsonObject,
    top_name: str,
) -> JsonObject:
    modules = design.get("modules", {})
    _, module = resolve_module(modules, top_name)

    net_endpoints: dict[int, list[JsonObject]] = defaultdict(list)
    constants: list[JsonObject] = []

    ports_result: list[JsonObject] = []

    for port_name in sorted(module.get("ports", {})):
        port = module["ports"][port_name]
        bits = port.get("bits", [])

        ports_result.append(
            {
                "name": normalize_name(port_name),
                "direction": port.get("direction"),
                "width": len(bits),
            }
        )

        for index, bit in enumerate(bits):
            endpoint = {
                "kind": "top_port",
                "name": normalize_name(port_name),
                "index": index,
                "direction": port.get("direction"),
            }

            if isinstance(bit, int):
                net_endpoints[bit].append(endpoint)
            else:
                constants.append(
                    {
                        "endpoint": endpoint,
                        "constant": bit,
                    }
                )

    cells_result: list[JsonObject] = []

    for cell_name in sorted(module.get("cells", {})):
        cell = module["cells"][cell_name]

        cells_result.append(
            {
                "name": normalize_name(cell_name),
                "type": normalize_name(
                    str(cell.get("type", ""))
                ),
                "parameters": clean(
                    cell.get("parameters", {})
                ),
                "port_directions": clean(
                    cell.get("port_directions", {})
                ),
            }
        )

        for port_name in sorted(
            cell.get("connections", {})
        ):
            bits = cell["connections"][port_name]

            for index, bit in enumerate(bits):
                endpoint = {
                    "kind": "cell_port",
                    "cell": normalize_name(cell_name),
                    "cell_type": normalize_name(
                        str(cell.get("type", ""))
                    ),
                    "port": normalize_name(port_name),
                    "index": index,
                    "direction": (
                        cell.get(
                            "port_directions", {}
                        ).get(port_name)
                    ),
                }

                if isinstance(bit, int):
                    net_endpoints[bit].append(endpoint)
                else:
                    constants.append(
                        {
                            "endpoint": endpoint,
                            "constant": bit,
                        }
                    )

    nets_result: list[list[JsonObject]] = [
        sorted(
            endpoints,
            key=endpoint_sort_key,
        )
        for _, endpoints in sorted(
            net_endpoints.items(),
            key=lambda item: endpoint_group_sort_key(
                item[1]
            ),
        )
    ]

    constants.sort(key=endpoint_sort_key)

    return {
        "top_module": normalize_name(top_name),
        "ports": ports_result,
        "cells": cells_result,
        "nets": nets_result,
        "constant_connections": constants,
    }


def stable_hash(value: Any) -> str:
    data = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")

    return hashlib.sha256(data).hexdigest()


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open("w", encoding="utf-8") as file:
        json.dump(
            value,
            file,
            ensure_ascii=False,
            indent=2,
            sort_keys=True,
        )
        file.write("\n")


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compare two top-shell JSON designs while "
            "ignoring Yosys numeric bit identifiers and "
            "source attributes."
        )
    )

    parser.add_argument(
        "--gold-json",
        type=Path,
        required=True,
    )
    parser.add_argument(
        "--gate-json",
        type=Path,
        required=True,
    )
    parser.add_argument(
        "--top",
        required=True,
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        required=True,
    )

    args = parser.parse_args()

    try:
        gold = canonical_top(
            load_json(args.gold_json),
            args.top,
        )
        gate = canonical_top(
            load_json(args.gate_json),
            args.top,
        )

        gold_hash = stable_hash(gold)
        gate_hash = stable_hash(gate)
        equivalent = gold == gate

        write_json(
            args.output_dir / "gold_canonical.json",
            gold,
        )
        write_json(
            args.output_dir / "gate_canonical.json",
            gate,
        )
        write_json(
            args.output_dir / "summary.json",
            {
                "status": (
                    "PASS" if equivalent else "FAIL"
                ),
                "top_module": args.top,
                "gold_hash": gold_hash,
                "gate_hash": gate_hash,
                "gold_json": str(args.gold_json),
                "gate_json": str(args.gate_json),
            },
        )

        print(
            f"Top shell structural comparison: "
            f"{'PASS' if equivalent else 'FAIL'}"
        )
        print(f"Gold hash: {gold_hash}")
        print(f"Gate hash: {gate_hash}")

        if not equivalent:
            raise SystemExit(2)

    except (
        OSError,
        ValueError,
        json.JSONDecodeError,
    ) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)


if __name__ == "__main__":
    main()
