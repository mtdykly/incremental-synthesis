#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
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


def safe_region_name(instance_name: str) -> str:
    name = normalize_name(instance_name)

    name = re.sub(
        r"[^A-Za-z0-9_.-]+",
        "_",
        name,
    )

    name = name.strip("_")

    if not name:
        raise ValueError(
            f"cannot create region name from: {instance_name}"
        )

    return name


def main() -> None:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--fine-manifest",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--partition",
        required=True,
    )

    parser.add_argument(
        "--output",
        type=Path,
        required=True,
    )

    args = parser.parse_args()

    try:
        manifest = load_json(args.fine_manifest)

        partitions = manifest.get(
            "partitions",
            {},
        )

        if args.partition not in partitions:
            raise ValueError(
                f"partition not found in fine manifest: "
                f"{args.partition}"
            )

        partition = partitions[
            args.partition
        ]

        root_module = normalize_name(
            partition["root_module"]
        )

        output_partitions: Json = {}

        used_root_modules: set[str] = set()

        for region_id, region in sorted(
            partition.get(
                "regions",
                {},
            ).items()
        ):
            instance_name = region[
                "instance_name"
            ]

            region_name = safe_region_name(
                instance_name
            )

            root = normalize_name(
                region["module_type"]
            )

            if region_name in output_partitions:
                raise ValueError(
                    f"duplicate fine region name: "
                    f"{region_name}"
                )

            #
            # Current link_partitions.sh requires
            # unique root modules.
            #
            if root in used_root_modules:
                raise ValueError(
                    "multiple fine regions use the same "
                    f"root module: {root}"
                )

            used_root_modules.add(root)

            output_partitions[
                region_name
            ] = {
                "root_module": root,
                "region_id": region_id,
                "instance_name":
                    normalize_name(
                        instance_name
                    ),
            }

        if not output_partitions:
            raise ValueError(
                "no direct-child regions found"
            )

        output = {
            "schema_version": 1,

            "top": {
                "module_name":
                    root_module,
            },

            "source_partition":
                args.partition,

            "partitions":
                output_partitions,
        }

        write_json(
            args.output,
            output,
        )

        print(
            f"Fine partition: {args.partition}"
        )

        print(
            f"Top module    : {root_module}"
        )

        for name, item in (
            output_partitions.items()
        ):
            print(
                f"  {name} -> "
                f"{item['root_module']}"
            )

        print(
            f"Written       : {args.output}"
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