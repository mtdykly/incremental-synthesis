#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

Json = dict[str, Any]

IGNORED_KEYS = {
    "src",
    "hdlname",
    "top",
}

UNSTABLE_PARAMETER_KEYS = {
    "MEMID",
}


def load_json(path: Path) -> Json:
    with path.open(
        "r",
        encoding="utf-8",
    ) as f:
        value = json.load(f)

    if not isinstance(value, dict):
        raise ValueError(
            f"JSON root must be an object: {path}"
        )

    return value


def write_json(
    path: Path,
    value: Any,
) -> None:
    path.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    with path.open(
        "w",
        encoding="utf-8",
    ) as f:
        json.dump(
            value,
            f,
            ensure_ascii=False,
            indent=2,
            sort_keys=True,
        )
        f.write("\n")


def normalize_name(name: str) -> str:
    return (
        name[1:]
        if name.startswith("\\")
        else name
    )


def stable_hash(value: Any) -> str:
    data = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")

    return hashlib.sha256(
        data
    ).hexdigest()


def canonical_json(value: Any) -> str:
    return json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )


def clean(value: Any) -> Any:
    if isinstance(value, dict):
        result: Json = {}

        for key, item in sorted(
            value.items()
        ):
            if key in IGNORED_KEYS:
                continue

            if key in (
                UNSTABLE_PARAMETER_KEYS
            ):
                result[key] = (
                    "<IGNORED_AUTO_ID>"
                )
            else:
                result[key] = clean(item)

        return result

    if isinstance(value, list):
        return [
            clean(item)
            for item in value
        ]

    return value


def resolve_module_name(
    modules: Json,
    requested: str,
) -> str:
    if requested in modules:
        return requested

    normalized = normalize_name(
        requested
    )

    matches = [
        name
        for name in modules
        if normalize_name(name)
        == normalized
    ]

    if len(matches) == 1:
        return matches[0]

    if not matches:
        raise ValueError(
            f"module not found: {requested}"
        )

    raise ValueError(
        f"ambiguous module name: {requested}"
    )


def try_resolve_module_name(
    modules: Json,
    requested: Any,
) -> str | None:
    if not isinstance(requested, str):
        return None

    try:
        return resolve_module_name(
            modules,
            requested,
        )
    except ValueError:
        return None


def canonical_cells(
    module: Json,
) -> list[Json]:

    cells = [
        clean(cell)
        for cell
        in module.get(
            "cells",
            {},
        ).values()
    ]

    cells.sort(
        key=canonical_json
    )

    return cells


def canonical_memories(
    module: Json,
) -> list[Json]:

    memories = [
        clean(memory)
        for memory
        in module.get(
            "memories",
            {},
        ).values()
    ]

    memories.sort(
        key=canonical_json
    )

    return memories


def canonical_module(
    module: Json,
) -> Json:

    return {
        "attributes":
            clean(
                module.get(
                    "attributes",
                    {},
                )
            ),

        "parameter_default_values":
            clean(
                module.get(
                    "parameter_default_values",
                    {},
                )
            ),

        "ports":
            clean(
                module.get(
                    "ports",
                    {},
                )
            ),

        "cells":
            canonical_cells(module),

        "memories":
            canonical_memories(module),
    }


def interface_descriptor(
    module: Json,
) -> list[Json]:

    result: list[Json] = []

    netnames = module.get(
        "netnames",
        {},
    )

    for name in sorted(
        module.get(
            "ports",
            {},
        )
    ):
        port = module[
            "ports"
        ][name]

        net = netnames.get(
            name,
            {},
        )

        item: Json = {
            "name":
                normalize_name(name),

            "direction":
                port.get("direction"),

            "width":
                len(
                    port.get(
                        "bits",
                        [],
                    )
                ),
        }

        for key in (
            "offset",
            "upto",
            "signed",
        ):
            if key in port:
                item[key] = port[key]

            elif key in net:
                item[key] = net[key]

        result.append(item)

    return result


def collect_module_closure(
    modules: Json,
    root_module: str,
    active: set[str] | None = None,
) -> set[str]:

    active = set(
        active or set()
    )

    resolved = resolve_module_name(
        modules,
        root_module,
    )

    if resolved in active:
        return {resolved}

    closure = {resolved}

    next_active = (
        active | {resolved}
    )

    module = modules[resolved]

    for cell in module.get(
        "cells",
        {},
    ).values():

        child = try_resolve_module_name(
            modules,
            cell.get("type"),
        )

        if child is None:
            continue

        closure |= collect_module_closure(
            modules,
            child,
            next_active,
        )

    return closure


def subtree_payload(
    modules: Json,
    root_module: str,
) -> Json:

    closure = collect_module_closure(
        modules,
        root_module,
    )

    module_records = []

    for module_name in sorted(
        closure,
        key=normalize_name,
    ):
        module_records.append({
            "module_type":
                normalize_name(
                    module_name
                ),

            "body":
                canonical_module(
                    modules[module_name]
                ),
        })

    return {
        "schema_version": 1,

        "root_module":
            normalize_name(
                root_module
            ),

        "module_closure":
            module_records,
    }


def count_instance_subtree(
    modules: Json,
    module_name: str,
    active: set[str] | None = None,
) -> tuple[int, int]:

    active = set(
        active or set()
    )

    resolved = resolve_module_name(
        modules,
        module_name,
    )

    if resolved in active:
        return 0, 0

    next_active = (
        active | {resolved}
    )

    primitive_count = 0
    hierarchical_count = 0

    for cell in modules[
        resolved
    ].get(
        "cells",
        {},
    ).values():

        child = try_resolve_module_name(
            modules,
            cell.get("type"),
        )

        if child is None:
            primitive_count += 1
            continue

        hierarchical_count += 1

        (
            child_primitive,
            child_hier,
        ) = count_instance_subtree(
            modules,
            child,
            next_active,
        )

        primitive_count += (
            child_primitive
        )

        hierarchical_count += (
            child_hier
        )

    return (
        primitive_count,
        hierarchical_count,
    )


def count_root_glue_primitives(
    modules: Json,
    root_module: str,
) -> int:

    resolved = resolve_module_name(
        modules,
        root_module,
    )

    count = 0

    for cell in modules[
        resolved
    ].get(
        "cells",
        {},
    ).values():

        if try_resolve_module_name(
            modules,
            cell.get("type"),
        ) is None:
            count += 1

    return count


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compute fine-grained "
            "structural signatures"
        )
    )

    parser.add_argument(
        "--hier-json",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--fine-manifest",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--output",
        type=Path,
        required=True,
    )

    args = parser.parse_args()

    try:
        design = load_json(
            args.hier_json
        )

        manifest = load_json(
            args.fine_manifest
        )

        modules = design.get(
            "modules",
            {},
        )

        if not modules:
            raise ValueError(
                "hierarchical JSON has no modules"
            )

        output_partitions: Json = {}

        for (
            partition_name,
            partition,
        ) in sorted(
            manifest.get(
                "partitions",
                {},
            ).items()
        ):

            root_module = (
                resolve_module_name(
                    modules,
                    partition[
                        "root_module"
                    ],
                )
            )

            root_glue_payload = {
                "schema_version":
                    1,

                "root_module":
                    normalize_name(
                        root_module
                    ),

                "root_parameters":
                    clean(
                        partition.get(
                            "root_parameters",
                            {},
                        )
                    ),

                "local_module_body":
                    canonical_module(
                        modules[
                            root_module
                        ]
                    ),
            }

            regions: Json = {}

            for (
                region_id,
                region,
            ) in sorted(
                partition.get(
                    "regions",
                    {},
                ).items()
            ):

                module_type = (
                    resolve_module_name(
                        modules,
                        region[
                            "module_type"
                        ],
                    )
                )

                module = modules[
                    module_type
                ]

                interface = (
                    interface_descriptor(
                        module
                    )
                )

                parameters = clean(
                    region.get(
                        "parameters",
                        {},
                    )
                )

                (
                    primitive_count,
                    hierarchical_count,
                ) = count_instance_subtree(
                    modules,
                    module_type,
                )

                implementation_payload = {
                    "schema_version":
                        1,

                    "module_type":
                        normalize_name(
                            module_type
                        ),

                    "parameters":
                        parameters,

                    "subtree":
                        subtree_payload(
                            modules,
                            module_type,
                        ),
                }

                regions[region_id] = {
                    "instance_name":
                        region[
                            "instance_name"
                        ],

                    "instance_path":
                        region[
                            "instance_path"
                        ],

                    "module_type":
                        module_type,

                    "parameters":
                        parameters,

                    "interface":
                        interface,

                    "interface_signature":
                        stable_hash(
                            interface
                        ),

                    "implementation_signature":
                        stable_hash(
                            implementation_payload
                        ),

                    "frontend_primitive_cell_count":
                        primitive_count,

                    "hierarchical_instance_count":
                        hierarchical_count,
                }

            output_partitions[
                partition_name
            ] = {
                "root_module":
                    root_module,

                "root_instance_path":
                    partition[
                        "root_instance_path"
                    ],

                "root_glue": {
                    "region_id":
                        partition[
                            "root_glue"
                        ][
                            "region_id"
                        ],

                    "implementation_signature":
                        stable_hash(
                            root_glue_payload
                        ),

                    "frontend_primitive_cell_count":
                        count_root_glue_primitives(
                            modules,
                            root_module,
                        ),
                },

                "regions":
                    regions,
            }

        output = {
            "schema_version":
                1,

            "signature_method":
                (
                    "direct_child_subtree_"
                    "structural_signature_"
                    "without_cell_names_"
                    "src_or_memid"
                ),

            "source_hier_json":
                str(args.hier_json),

            "source_fine_manifest":
                str(
                    args.fine_manifest
                ),

            "partitions":
                output_partitions,
        }

        write_json(
            args.output,
            output,
        )

        print(
            "Signature method: "
            f"{output['signature_method']}"
        )

        for partition_name, partition in output_partitions.items():
            print(f"Partition: {partition_name}")

            root_glue_signature = (
                partition["root_glue"]["implementation_signature"]
            )

            print(
                "  root_glue: "
                f"{root_glue_signature[:12]}"
            )

            for region_id, region in partition["regions"].items():
                implementation_signature = (
                    region["implementation_signature"]
                )

                primitive_cell_count = (
                    region["frontend_primitive_cell_count"]
                )

                print(
                    f"  {region_id}: "
                    f"impl={implementation_signature[:12]} "
                    f"primitive_cells={primitive_cell_count}"
                )

        print(
            f"Written: {args.output}"
        )
    except (
        OSError,
        ValueError,
        KeyError,
        json.JSONDecodeError,
    ) as error:

        print(
            f"ERROR: {error}",
            file=sys.stderr,
        )

        raise SystemExit(1)


if __name__ == "__main__":
    main()