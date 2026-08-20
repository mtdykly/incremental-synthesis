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
        json.dump(value, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Compare Base and New partition signatures and "
            "produce a reuse plan"
        )
    )
    parser.add_argument("--base-signatures", type=Path, required=True)
    parser.add_argument("--new-signatures", type=Path, required=True)
    parser.add_argument(
        "--base-partitions-dir",
        type=Path,
        required=True,
        help="Base synthesized partition results used as the cache",
    )
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    try:
        base = load_json(args.base_signatures)
        new = load_json(args.new_signatures)

        base_partitions = base.get("partitions", {})
        new_partitions = new.get("partitions", {})
        names = sorted(set(base_partitions) | set(new_partitions))

        environment_changed = (
            base.get("partition_environment_signature")
            != new.get("partition_environment_signature")
        )

        decisions: Json = {}
        reusable: list[str] = []
        dirty: list[str] = []
        interface_changed: list[str] = []

        for name in names:
            reasons: list[str] = []
            old = base_partitions.get(name)
            current = new_partitions.get(name)

            if old is None:
                reasons.append("new_partition")
            elif current is None:
                reasons.append("removed_partition")
            else:
                for field in (
                    "root_instance_name",
                    "root_module",
                    "root_parameters",
                ):
                    if old.get(field) != current.get(field):
                        reasons.append(f"{field}_changed")

                if (
                    old.get("interface_signature")
                    != current.get("interface_signature")
                ):
                    reasons.append("interface_changed")
                    interface_changed.append(name)

                if (
                    old.get("implementation_signature")
                    != current.get("implementation_signature")
                ):
                    reasons.append("implementation_changed")

                if environment_changed:
                    reasons.append("partition_environment_changed")

            cached_netlist = (
                args.base_partitions_dir
                / name
                / "partition_netlist.v"
            )
            cache_available = cached_netlist.is_file()

            if not reasons and cache_available:
                status = "reuse"
                reusable.append(name)
            else:
                status = "rebuild"
                dirty.append(name)
                if not reasons and not cache_available:
                    reasons.append("cache_miss")

            decisions[name] = {
                "status": status,
                "reasons": reasons,
                "cache_available": cache_available,
                "cached_netlist": (
                    str(cached_netlist)
                    if cache_available
                    else None
                ),
                "base_implementation_signature": (
                    old.get("implementation_signature")
                    if old
                    else None
                ),
                "new_implementation_signature": (
                    current.get("implementation_signature")
                    if current
                    else None
                ),
            }

        top_reasons: list[str] = []

        if base.get("top_module") != new.get("top_module"):
            top_reasons.append("top_module_changed")

        if (
            base.get("top_environment_signature")
            != new.get("top_environment_signature")
        ):
            top_reasons.append("top_environment_changed")

        if (
            base.get("top", {}).get("interface_signature")
            != new.get("top", {}).get("interface_signature")
        ):
            top_reasons.append("top_interface_changed")

        if (
            base.get("top", {}).get("implementation_signature")
            != new.get("top", {}).get("implementation_signature")
        ):
            top_reasons.append("top_implementation_changed")

        if set(base_partitions) != set(new_partitions):
            top_reasons.append("partition_set_changed")

        if interface_changed:
            top_reasons.append("partition_interface_changed")

        output = {
            "schema_version": 1,
            "base_signatures": str(args.base_signatures),
            "new_signatures": str(args.new_signatures),
            "base_partitions_dir": str(args.base_partitions_dir),
            "reusable_partitions": reusable,
            "dirty_partitions": dirty,
            "interface_changed_partitions": sorted(
                set(interface_changed)
            ),
            "top_shell": {
                "status": (
                    "rebuild" if top_reasons else "reuse"
                ),
                "reasons": sorted(set(top_reasons)),
            },
            "decisions": decisions,
        }

        write_json(args.output, output)

        print("Partition decisions:")

        for name in names:
            decision = decisions[name]
            reason_text = ", ".join(
                decision["reasons"]
            ) or "-"
            print(
                f"  {name}: {decision['status']} "
                f"({reason_text})"
            )

        top = output["top_shell"]
        print(
            f"Top shell: {top['status']} "
            f"({', '.join(top['reasons']) or '-'})"
        )
        print(f"Written: {args.output}")

    except (OSError, ValueError, json.JSONDecodeError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)


if __name__ == "__main__":
    main()
