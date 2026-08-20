#!/usr/bin/env python3

from __future__ import annotations

import argparse
import importlib.util
import json
from collections import Counter
from pathlib import Path
from typing import Any


def load_signature_module(script_path: Path):
    spec = importlib.util.spec_from_file_location(
        "partition_signature_impl",
        script_path,
    )

    if spec is None or spec.loader is None:
        raise RuntimeError(
            f"Cannot load signature script: {script_path}"
        )

    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

    return module


def cell_nonconnection_descriptor(
    signature_module: Any,
    cell: dict[str, Any],
) -> dict[str, Any]:
    result = {
        key: value
        for key, value in cell.items()
        if key != "connections"
    }

    return signature_module.clean(result)


def collect_differences(
    base: Any,
    new: Any,
    path: str = "$",
    limit: int = 100,
) -> list[dict[str, Any]]:
    differences: list[dict[str, Any]] = []

    def walk(left: Any, right: Any, current: str) -> None:
        if len(differences) >= limit:
            return

        if type(left) is not type(right):
            differences.append({
                "path": current,
                "base": left,
                "new": right,
                "kind": "type_changed",
            })
            return

        if isinstance(left, dict):
            keys = sorted(set(left) | set(right))

            for key in keys:
                child = f"{current}.{key}"

                if key not in left:
                    differences.append({
                        "path": child,
                        "base": "<missing>",
                        "new": right[key],
                        "kind": "added",
                    })
                elif key not in right:
                    differences.append({
                        "path": child,
                        "base": left[key],
                        "new": "<missing>",
                        "kind": "removed",
                    })
                else:
                    walk(left[key], right[key], child)

                if len(differences) >= limit:
                    return

        elif isinstance(left, list):
            if len(left) != len(right):
                differences.append({
                    "path": current,
                    "base": f"length={len(left)}",
                    "new": f"length={len(right)}",
                    "kind": "length_changed",
                })

            for index, (left_item, right_item) in enumerate(
                zip(left, right)
            ):
                walk(
                    left_item,
                    right_item,
                    f"{current}[{index}]",
                )

                if len(differences) >= limit:
                    return

        elif left != right:
            likely_signal_id = (
                isinstance(left, int)
                and isinstance(right, int)
                and (
                    ".bits" in current
                    or ".connections" in current
                )
            )

            differences.append({
                "path": current,
                "base": left,
                "new": right,
                "kind": (
                    "possible_signal_id_renumbering"
                    if likely_signal_id
                    else "value_changed"
                ),
            })

    walk(base, new, path)

    return differences


def main() -> None:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--base-json",
        type=Path,
        required=True,
    )
    parser.add_argument(
        "--new-json",
        type=Path,
        required=True,
    )
    parser.add_argument(
        "--module",
        required=True,
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        required=True,
    )

    args = parser.parse_args()

    script_path = (
        Path(__file__).resolve().parent
        / "compute_partition_signatures.py"
    )

    sig = load_signature_module(script_path)

    base_design = sig.load_json(args.base_json)
    new_design = sig.load_json(args.new_json)

    base_modules = base_design["modules"]
    new_modules = new_design["modules"]

    base_name = sig.resolve_module_name(
        base_modules,
        args.module,
    )
    new_name = sig.resolve_module_name(
        new_modules,
        args.module,
    )

    base_module = base_modules[base_name]
    new_module = new_modules[new_name]

    base_canonical = sig.canonical_module(base_module)
    new_canonical = sig.canonical_module(new_module)

    base_cells = list(
        base_module.get("cells", {}).values()
    )
    new_cells = list(
        new_module.get("cells", {}).values()
    )

    base_cell_types = Counter(
        cell.get("type")
        for cell in base_cells
    )
    new_cell_types = Counter(
        cell.get("type")
        for cell in new_cells
    )

    base_nonconnection = sorted(
        [
            cell_nonconnection_descriptor(sig, cell)
            for cell in base_cells
        ],
        key=sig.canonical_json,
    )

    new_nonconnection = sorted(
        [
            cell_nonconnection_descriptor(sig, cell)
            for cell in new_cells
        ],
        key=sig.canonical_json,
    )

    differences = collect_differences(
        base_canonical,
        new_canonical,
    )

    args.output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    with (
        args.output_dir / "base_canonical.json"
    ).open("w", encoding="utf-8") as file:
        json.dump(
            base_canonical,
            file,
            indent=2,
            sort_keys=True,
        )
        file.write("\n")

    with (
        args.output_dir / "new_canonical.json"
    ).open("w", encoding="utf-8") as file:
        json.dump(
            new_canonical,
            file,
            indent=2,
            sort_keys=True,
        )
        file.write("\n")

    summary = {
        "module": args.module,
        "base_cell_count": len(base_cells),
        "new_cell_count": len(new_cells),
        "cell_type_counts_equal": (
            base_cell_types == new_cell_types
        ),
        "cell_nonconnection_descriptors_equal": (
            base_nonconnection == new_nonconnection
        ),
        "full_canonical_equal": (
            base_canonical == new_canonical
        ),
        "difference_count_shown": len(differences),
        "difference_kinds": dict(
            Counter(
                item["kind"]
                for item in differences
            )
        ),
        "differences": differences,
    }

    with (
        args.output_dir / "diagnosis.json"
    ).open("w", encoding="utf-8") as file:
        json.dump(
            summary,
            file,
            indent=2,
            sort_keys=True,
        )
        file.write("\n")

    print(json.dumps(
        {
            key: value
            for key, value in summary.items()
            if key != "differences"
        },
        indent=2,
    ))

    print()
    print("First differences:")

    for item in differences[:20]:
        print(
            f"{item['kind']}: "
            f"{item['path']}: "
            f"{item['base']} -> {item['new']}"
        )


if __name__ == "__main__":
    main()
