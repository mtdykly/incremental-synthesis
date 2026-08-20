#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

Json = dict[str, Any]


def load_json(path: Path) -> Json:
    with path.open("r", encoding="utf-8") as f:
        value = json.load(f)

    if not isinstance(value, dict):
        raise ValueError(f"JSON root must be an object: {path}")

    return value


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open("w", encoding="utf-8") as f:
        json.dump(
            value,
            f,
            ensure_ascii=False,
            indent=2,
            sort_keys=True,
        )
        f.write("\n")


def normalize_name(name: str) -> str:
    return name[1:] if name.startswith("\\") else name


def resolve_module_name(
    modules: Json,
    requested: str,
) -> str:
    if requested in modules:
        return requested

    normalized = normalize_name(requested)

    matches = [
        name
        for name in modules
        if normalize_name(name) == normalized
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


def hierarchical_children(
    modules: Json,
    module_name: str,
) -> list[Json]:
    resolved = resolve_module_name(
        modules,
        module_name,
    )

    module = modules[resolved]

    result: list[Json] = []

    for instance_name, cell in (
        module.get("cells", {}).items()
    ):
        child_module = try_resolve_module_name(
            modules,
            cell.get("type"),
        )

        if child_module is None:
            continue

        result.append({
            "instance_name": instance_name,
            "display_instance_name": normalize_name(
                instance_name
            ),
            "module_type": child_module,
            "display_module_type": normalize_name(
                child_module
            ),
            "parameters": cell.get(
                "parameters",
                {},
            ),
        })

    result.sort(
        key=lambda item:
        item["display_instance_name"]
    )

    return result


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Extract direct-child fine-grained "
            "regions inside dirty partitions"
        )
    )

    parser.add_argument(
        "--hier-json",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--partition-manifest",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--reuse-plan",
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
            args.partition_manifest
        )

        reuse_plan = load_json(
            args.reuse_plan
        )

        modules = design.get(
            "modules",
            {},
        )

        partitions = manifest.get(
            "partitions",
            {},
        )

        dirty_partitions = reuse_plan.get(
            "dirty_partitions",
            [],
        )

        if not modules:
            raise ValueError(
                "hierarchical JSON has no modules"
            )

        if not isinstance(
            dirty_partitions,
            list,
        ):
            raise ValueError(
                "reuse_plan.dirty_partitions "
                "must be a list"
            )

        output_partitions: Json = {}

        for partition_name in dirty_partitions:
            partition = partitions.get(
                partition_name
            )

            if partition is None:
                continue

            root_module = resolve_module_name(
                modules,
                partition["root_module"],
            )

            root_path = partition[
                "root_instance_path"
            ]

            children = hierarchical_children(
                modules,
                root_module,
            )

            regions: Json = {}

            for child in children:
                region_id = (
                    f"{root_path}."
                    f"{child['display_instance_name']}"
                )

                regions[region_id] = {
                    "kind":
                        "direct_child_instance",

                    "instance_name":
                        child["instance_name"],

                    "instance_path":
                        region_id,

                    "module_type":
                        child["module_type"],

                    "parameters":
                        child["parameters"],
                }

            output_partitions[
                partition_name
            ] = {
                "root_module":
                    root_module,

                "root_instance_path":
                    root_path,

                "root_parameters":
                    partition.get(
                        "root_parameters",
                        {},
                    ),

                "root_glue": {
                    "kind":
                        "partition_root_local_logic",

                    "region_id":
                        (
                            f"{root_path}."
                            "__root_glue__"
                        ),

                    "module_type":
                        root_module,
                },

                "region_count":
                    len(regions),

                "regions":
                    regions,
            }

        output = {
            "schema_version": 1,

            "strategy":
                (
                    "dirty_partition_"
                    "direct_child_instances"
                ),

            "source_hier_json":
                str(args.hier_json),

            "source_partition_manifest":
                str(
                    args.partition_manifest
                ),

            "source_reuse_plan":
                str(args.reuse_plan),

            "dirty_partition_count":
                len(output_partitions),

            "partitions":
                output_partitions,
        }

        write_json(
            args.output,
            output,
        )

        print(
            "Dirty partitions analyzed: "
            f"{len(output_partitions)}"
        )

        for name, partition in (
            output_partitions.items()
        ):
            print(
                f"{name}: {partition['region_count']} direct-child regions"
            )

            for region in partition["regions"].values():
                instance_name = normalize_name(
                    region["instance_name"]
                )
                module_type = normalize_name(
                    region["module_type"]
                )

                print(
                    f"  - {instance_name}: {module_type}"
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