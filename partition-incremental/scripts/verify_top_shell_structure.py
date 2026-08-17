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
        module = modules[requested]
        if not isinstance(module, dict):
            raise ValueError(
                f"Module {requested!r} is not a JSON object"
            )
        return requested, module

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


def stable_hash(value: Any) -> str:
    data = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(data).hexdigest()


def object_sort_key(value: Any) -> str:
    return json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def is_generated_cell_name(name: str) -> bool:
    """Return True for Yosys-generated cell identifiers.

    Yosys internal/generated cell names are normally '$'-prefixed
    after removing a leading RTLIL escape.  Their numeric suffixes are
    not semantically meaningful and may drift after unrelated RTL
    changes.  User/RTL instance names such as 'id_stage_i' remain part
    of the structural identity.
    """

    return normalize_name(name).startswith("$")


def cell_base_descriptor(
    cell_name: str,
    cell: JsonObject,
) -> JsonObject:
    result: JsonObject = {
        "type": normalize_name(str(cell.get("type", ""))),
        "parameters": clean(cell.get("parameters", {})),
        "port_directions": clean(
            cell.get("port_directions", {})
        ),
    }

    if not is_generated_cell_name(cell_name):
        result["stable_name"] = normalize_name(cell_name)

    return result


def build_raw_net_endpoints(
    module: JsonObject,
) -> dict[int, list[JsonObject]]:
    net_endpoints: dict[int, list[JsonObject]] = defaultdict(list)

    ports = module.get("ports", {})
    if not isinstance(ports, dict):
        raise ValueError("Top module ports must be an object")

    for port_name, port in ports.items():
        if not isinstance(port, dict):
            raise ValueError(
                f"Port {port_name!r} is not a JSON object"
            )
        bits = port.get("bits", [])
        for index, bit in enumerate(bits):
            if isinstance(bit, int):
                net_endpoints[bit].append(
                    {
                        "kind": "top_port",
                        "name": normalize_name(port_name),
                        "index": index,
                        "direction": port.get("direction"),
                    }
                )

    cells = module.get("cells", {})
    if not isinstance(cells, dict):
        raise ValueError("Top module cells must be an object")

    for cell_name, cell in cells.items():
        if not isinstance(cell, dict):
            raise ValueError(
                f"Cell {cell_name!r} is not a JSON object"
            )
        connections = cell.get("connections", {})
        if not isinstance(connections, dict):
            raise ValueError(
                f"Cell {cell_name!r} connections are not an object"
            )
        directions = cell.get("port_directions", {})
        if not isinstance(directions, dict):
            directions = {}

        for port_name, bits in connections.items():
            for index, bit in enumerate(bits):
                if isinstance(bit, int):
                    net_endpoints[bit].append(
                        {
                            "kind": "cell_port",
                            "cell_name": cell_name,
                            "port": normalize_name(port_name),
                            "index": index,
                            "direction": directions.get(port_name),
                        }
                    )

    return net_endpoints


def structural_cell_labels(
    module: JsonObject,
    net_endpoints: dict[int, list[JsonObject]],
) -> dict[str, str]:
    """Build name-independent labels for generated cells.

    Labels are refined from intrinsic cell properties and surrounding
    connectivity.  Stable RTL instance names stay in the seed; Yosys
    generated '$...' names do not.
    """

    cells = module.get("cells", {})
    if not isinstance(cells, dict):
        raise ValueError("Top module cells must be an object")

    base = {
        name: cell_base_descriptor(name, cell)
        for name, cell in cells.items()
    }
    labels = {
        name: stable_hash(descriptor)
        for name, descriptor in base.items()
    }

    # One round propagates structural information across one cell-net
    # boundary. N+1 rounds are enough to cover the top-shell graph.
    rounds = max(2, len(cells) + 1)

    for _ in range(rounds):
        new_labels: dict[str, str] = {}

        for cell_name, cell in cells.items():
            connections = cell.get("connections", {})
            directions = cell.get("port_directions", {})
            if not isinstance(connections, dict):
                connections = {}
            if not isinstance(directions, dict):
                directions = {}

            connection_features: list[JsonObject] = []

            for port_name in sorted(connections):
                bits = connections[port_name]
                for index, bit in enumerate(bits):
                    own_endpoint = {
                        "port": normalize_name(port_name),
                        "index": index,
                        "direction": directions.get(port_name),
                    }

                    if not isinstance(bit, int):
                        connection_features.append(
                            {
                                **own_endpoint,
                                "constant": bit,
                            }
                        )
                        continue

                    neighbours: list[JsonObject] = []
                    for endpoint in net_endpoints.get(bit, []):
                        if endpoint.get("kind") == "top_port":
                            neighbours.append(
                                {
                                    "kind": "top_port",
                                    "name": endpoint.get("name"),
                                    "index": endpoint.get("index"),
                                    "direction": endpoint.get(
                                        "direction"
                                    ),
                                }
                            )
                            continue

                        other_name = endpoint.get("cell_name")
                        if not isinstance(other_name, str):
                            continue

                        if (
                            other_name == cell_name
                            and endpoint.get("port")
                            == normalize_name(port_name)
                            and endpoint.get("index") == index
                        ):
                            neighbours.append(
                                {"kind": "self"}
                            )
                        else:
                            neighbours.append(
                                {
                                    "kind": "cell_port",
                                    "cell_label": labels[other_name],
                                    "port": endpoint.get("port"),
                                    "index": endpoint.get("index"),
                                    "direction": endpoint.get(
                                        "direction"
                                    ),
                                }
                            )

                    connection_features.append(
                        {
                            **own_endpoint,
                            "net": sorted(
                                neighbours,
                                key=object_sort_key,
                            ),
                        }
                    )

            descriptor = {
                "base": base[cell_name],
                "connections": sorted(
                    connection_features,
                    key=object_sort_key,
                ),
            }
            new_labels[cell_name] = stable_hash(descriptor)

        labels = new_labels

    return labels


def canonical_cell_reference(
    cell_name: str,
    labels: dict[str, str],
) -> JsonObject:
    if is_generated_cell_name(cell_name):
        return {
            "kind": "generated",
            "structural_id": labels[cell_name],
        }

    return {
        "kind": "stable",
        "name": normalize_name(cell_name),
    }


def canonical_top(
    design: JsonObject,
    top_name: str,
) -> JsonObject:
    modules = design.get("modules", {})
    if not isinstance(modules, dict):
        raise ValueError("Design has no modules object")

    _, module = resolve_module(modules, top_name)
    net_endpoints = build_raw_net_endpoints(module)
    labels = structural_cell_labels(module, net_endpoints)

    ports_result: list[JsonObject] = []
    constant_connections: list[JsonObject] = []

    ports = module.get("ports", {})
    for port_name in sorted(ports):
        port = ports[port_name]
        bits = port.get("bits", [])
        ports_result.append(
            {
                "name": normalize_name(port_name),
                "direction": port.get("direction"),
                "width": len(bits),
            }
        )

        for index, bit in enumerate(bits):
            if not isinstance(bit, int):
                constant_connections.append(
                    {
                        "endpoint": {
                            "kind": "top_port",
                            "name": normalize_name(port_name),
                            "index": index,
                            "direction": port.get("direction"),
                        },
                        "constant": bit,
                    }
                )

    cells = module.get("cells", {})
    cells_result: list[JsonObject] = []

    for cell_name, cell in cells.items():
        cell_result = cell_base_descriptor(cell_name, cell)
        cell_result["identity"] = canonical_cell_reference(
            cell_name,
            labels,
        )
        cells_result.append(cell_result)

        connections = cell.get("connections", {})
        directions = cell.get("port_directions", {})
        if not isinstance(directions, dict):
            directions = {}

        for port_name, bits in connections.items():
            for index, bit in enumerate(bits):
                if not isinstance(bit, int):
                    constant_connections.append(
                        {
                            "endpoint": {
                                "kind": "cell_port",
                                "cell": canonical_cell_reference(
                                    cell_name,
                                    labels,
                                ),
                                "cell_type": normalize_name(
                                    str(cell.get("type", ""))
                                ),
                                "port": normalize_name(port_name),
                                "index": index,
                                "direction": directions.get(
                                    port_name
                                ),
                            },
                            "constant": bit,
                        }
                    )

    cells_result.sort(key=object_sort_key)

    nets_result: list[list[JsonObject]] = []
    for endpoints in net_endpoints.values():
        canonical_endpoints: list[JsonObject] = []

        for endpoint in endpoints:
            if endpoint.get("kind") == "top_port":
                canonical_endpoints.append(
                    {
                        "kind": "top_port",
                        "name": endpoint.get("name"),
                        "index": endpoint.get("index"),
                        "direction": endpoint.get("direction"),
                    }
                )
                continue

            cell_name = endpoint.get("cell_name")
            if not isinstance(cell_name, str):
                raise ValueError(
                    "Cell endpoint is missing cell_name"
                )
            cell = cells[cell_name]
            canonical_endpoints.append(
                {
                    "kind": "cell_port",
                    "cell": canonical_cell_reference(
                        cell_name,
                        labels,
                    ),
                    "cell_type": normalize_name(
                        str(cell.get("type", ""))
                    ),
                    "port": endpoint.get("port"),
                    "index": endpoint.get("index"),
                    "direction": endpoint.get("direction"),
                }
            )

        nets_result.append(
            sorted(
                canonical_endpoints,
                key=object_sort_key,
            )
        )

    nets_result.sort(key=object_sort_key)
    constant_connections.sort(key=object_sort_key)

    return {
        "top_module": normalize_name(top_name),
        "ports": ports_result,
        "cells": cells_result,
        "nets": nets_result,
        "constant_connections": constant_connections,
    }


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
                "generated_cell_name_policy": (
                    "ignore_yosys_generated_names_and_use_"
                    "connectivity_refined_structural_ids"
                ),
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