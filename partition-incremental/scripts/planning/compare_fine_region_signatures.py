#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

Json = dict[str, Any]


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


def compare_region(
    old: Json | None,
    new: Json | None,
) -> Json:

    reasons: list[str] = []

    if old is None:
        reasons.append(
            "new_region"
        )

    elif new is None:
        reasons.append(
            "removed_region"
        )

    else:
        if (
            old.get("module_type")
            != new.get("module_type")
        ):
            reasons.append(
                "module_type_changed"
            )

        if (
            old.get("parameters")
            != new.get("parameters")
        ):
            reasons.append(
                "parameters_changed"
            )

        if (
            old.get(
                "interface_signature"
            )
            != new.get(
                "interface_signature"
            )
        ):
            reasons.append(
                "interface_changed"
            )

        if (
            old.get(
                "implementation_signature"
            )
            != new.get(
                "implementation_signature"
            )
        ):
            reasons.append(
                "implementation_changed"
            )

    return {
        "status":
            (
                "reuse"
                if not reasons
                else "rebuild"
            ),

        "reasons":
            reasons,

        "base":
            old,

        "new":
            new,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compare Base and New "
            "fine-grained signatures"
        )
    )

    parser.add_argument(
        "--base-signatures",
        type=Path,
        required=True,
    )

    parser.add_argument(
        "--new-signatures",
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
        base = load_json(
            args.base_signatures
        )

        new = load_json(
            args.new_signatures
        )

        base_partitions = base.get(
            "partitions",
            {},
        )

        new_partitions = new.get(
            "partitions",
            {},
        )

        partition_names = sorted(
            set(base_partitions)
            | set(new_partitions)
        )

        output_partitions: Json = {}

        total_new_cells = 0
        reusable_new_cells = 0
        dirty_new_cells = 0

        reusable_region_count = 0
        dirty_region_count = 0

        for partition_name in (
            partition_names
        ):
            old_partition = (
                base_partitions.get(
                    partition_name,
                    {},
                )
            )

            new_partition = (
                new_partitions.get(
                    partition_name,
                    {},
                )
            )

            old_glue = (
                old_partition.get(
                    "root_glue"
                )
            )

            new_glue = (
                new_partition.get(
                    "root_glue"
                )
            )

            glue_reasons: list[str] = []

            if old_glue is None:
                glue_reasons.append(
                    "new_root_glue"
                )

            elif new_glue is None:
                glue_reasons.append(
                    "removed_root_glue"
                )

            elif (
                old_glue.get(
                    "implementation_signature"
                )
                != new_glue.get(
                    "implementation_signature"
                )
            ):
                glue_reasons.append(
                    "root_glue_changed"
                )

            glue_status = (
                "reuse"
                if not glue_reasons
                else "rebuild"
            )

            if new_glue is not None:
                glue_cells = int(
                    new_glue.get(
                        "frontend_primitive_cell_count",
                        0,
                    )
                )

                total_new_cells += (
                    glue_cells
                )

                if glue_status == "reuse":
                    reusable_new_cells += (
                        glue_cells
                    )
                else:
                    dirty_new_cells += (
                        glue_cells
                    )

            old_regions = (
                old_partition.get(
                    "regions",
                    {},
                )
            )

            new_regions = (
                new_partition.get(
                    "regions",
                    {},
                )
            )

            region_ids = sorted(
                set(old_regions)
                | set(new_regions)
            )

            decisions: Json = {}
            reusable_regions: list[str] = []
            dirty_regions: list[str] = []

            for region_id in region_ids:
                decision = compare_region(
                    old_regions.get(
                        region_id
                    ),
                    new_regions.get(
                        region_id
                    ),
                )

                decisions[
                    region_id
                ] = decision

                if (
                    decision["status"]
                    == "reuse"
                ):
                    reusable_regions.append(
                        region_id
                    )

                    reusable_region_count += 1

                else:
                    dirty_regions.append(
                        region_id
                    )

                    dirty_region_count += 1

                current = (
                    new_regions.get(
                        region_id
                    )
                )

                if current is not None:
                    cell_count = int(
                        current.get(
                            "frontend_primitive_cell_count",
                            0,
                        )
                    )

                    total_new_cells += (
                        cell_count
                    )

                    if (
                        decision["status"]
                        == "reuse"
                    ):
                        reusable_new_cells += (
                            cell_count
                        )
                    else:
                        dirty_new_cells += (
                            cell_count
                        )

            output_partitions[
                partition_name
            ] = {
                "root_glue": {
                    "status":
                        glue_status,

                    "reasons":
                        glue_reasons,

                    "base":
                        old_glue,

                    "new":
                        new_glue,
                },

                "reusable_regions":
                    reusable_regions,

                "dirty_regions":
                    dirty_regions,

                "decisions":
                    decisions,
            }

        if total_new_cells:
            potential_reuse_ratio = (
                reusable_new_cells
                / total_new_cells
            )
        else:
            potential_reuse_ratio = 0.0

        output = {
            "schema_version":
                1,

            "base_signatures":
                str(
                    args.base_signatures
                ),

            "new_signatures":
                str(
                    args.new_signatures
                ),

            "summary": {
                "partition_count":
                    len(partition_names),

                "reusable_child_region_count":
                    reusable_region_count,

                "dirty_child_region_count":
                    dirty_region_count,

                "new_frontend_primitive_cells_total":
                    total_new_cells,

                "new_frontend_primitive_cells_reusable":
                    reusable_new_cells,

                "new_frontend_primitive_cells_dirty":
                    dirty_new_cells,

                "potential_frontend_reuse_ratio":
                    potential_reuse_ratio,
            },

            "partitions":
                output_partitions,
        }

        write_json(
            args.output,
            output,
        )

        print("Fine-grained decisions:")

        for partition_name, partition in output_partitions.items():
            print(f"Partition: {partition_name}")

            glue = partition["root_glue"]
            glue_reason_text = ", ".join(glue["reasons"]) or "-"

            print(
                f"  __root_glue__: "
                f"{glue['status']} "
                f"({glue_reason_text})"
            )

            for region_id, decision in partition["decisions"].items():
                reason_text = ", ".join(decision["reasons"]) or "-"

                print(
                    f"  {region_id}: "
                    f"{decision['status']} "
                    f"({reason_text})"
                )

        summary = output["summary"]

        potential_reuse_ratio = summary[
            "potential_frontend_reuse_ratio"
        ]

        print()

        print(
            "Potential frontend reuse ratio: "
            f"{potential_reuse_ratio:.4f}"
        )

        print(f"Written: {args.output}")

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