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


def resolve_module(
    modules: JsonObject,
    requested: str,
) -> tuple[str, JsonObject]:
    if requested in modules:
        return requested, modules[requested]

    normalized = normalize_name(requested)

    matches = [
        name
        for name in modules
        if normalize_name(name) == normalized
    ]

    if len(matches) != 1:
        raise ValueError(
            f"Cannot uniquely resolve module {requested!r}"
        )

    name = matches[0]
    module = modules[name]

    if not isinstance(module, dict):
        raise ValueError(
            f"Module {name!r} is not a JSON object"
        )

    return name, module


def endpoint_sort_key(endpoint: JsonObject) -> str:
    return json.dumps(
        endpoint,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def endpoint_group_sort_key(
    endpoints: list[JsonObject],
) -> str:
    ordered = sorted(
        endpoints,
        key=endpoint_sort_key,
    )

    return json.dumps(
        ordered,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def canonical_top(
    design: JsonObject,
    top_name: str,
) -> JsonObject:
    modules = design.get("modules", {})

    if not isinstance(modules, dict):
        raise ValueError("Design has no modules object")

    _, module = resolve_module(
        modules,
        top_name,
    )

    net_endpoints: dict[int, list[JsonObject]] = defaultdict(list)
    constant_connections: list[JsonObject] = []

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
            endpoint: JsonObject = {
                "kind": "top_port",
                "name": normalize_name(port_name),
                "index": index,
                "direction": port.get("direction"),
            }

            if isinstance(bit, int):
                net_endpoints[bit].append(endpoint)
            else:
                constant_connections.append(
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
                    constant_connections.append(
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

    constant_connections.sort(
        key=endpoint_sort_key
    )

    return {
        "top_module": normalize_name(top_name),
        "ports": ports_result,
        "cells": cells_result,
        "nets": nets_result,
        "constant_connections": constant_connections,
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
    path.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

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
    parser = argparse.ArgumentParser()

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
                "gold_hash": stable_hash(gold),
                "gate_hash": stable_hash(gate),
                "gold_json": str(args.gold_json),
                "gate_json": str(args.gate_json),
            },
        )

        print(
            "Top-shell structural check: "
            + ("PASS" if equivalent else "FAIL")
        )

        if not equivalent:
            raise SystemExit(2)

    except (
        OSError,
        ValueError,
        json.JSONDecodeError,
    ) as error:
        print(
            f"ERROR: {error}",
            file=sys.stderr,
        )
        raise SystemExit(1)


if __name__ == "__main__":
    main()
