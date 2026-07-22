#!/usr/bin/env python3

import argparse
import difflib
import hashlib
import re
from pathlib import Path


def normalize_block(lines: list[str], kind: str) -> str:
    result: list[str] = []

    for line in lines:
        line = line.rstrip()

        # RTLIL 中的源码位置不属于电路结构
        if kind == "rtlil" and re.match(
            r"^\s*attribute\s+\\src\s+",
            line,
        ):
            continue

        result.append(line)

    while result and not result[-1]:
        result.pop()

    return "\n".join(result) + "\n"


def split_modules(
    path: str,
    kind: str,
) -> dict[str, str]:
    text = Path(path).read_text(encoding="utf-8")
    lines = text.splitlines()

    if kind == "rtlil":
        start_pattern = re.compile(
            r"^\s*module\s+(\\?\S+)"
        )
    else:
        start_pattern = re.compile(
            r"^\s*module\s+([^\s(#;]+)"
        )

    modules: dict[str, str] = {}
    current_name: str | None = None
    current_lines: list[str] = []

    for line in lines:
        match = start_pattern.match(line)

        if match:
            if current_name is not None:
                modules[current_name] = normalize_block(
                    current_lines,
                    kind,
                )

            current_name = match.group(1)
            current_lines = [line]
            continue

        if current_name is not None:
            current_lines.append(line)

    if current_name is not None:
        modules[current_name] = normalize_block(
            current_lines,
            kind,
        )

    return modules


def digest(text: str) -> str:
    return hashlib.sha256(
        text.encode("utf-8")
    ).hexdigest()[:16]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", required=True)
    parser.add_argument("--new", required=True)
    parser.add_argument(
        "--kind",
        choices=["rtlil", "verilog"],
        required=True,
    )
    parser.add_argument(
        "--show-diff",
        action="store_true",
    )

    args = parser.parse_args()

    base_modules = split_modules(args.base, args.kind)
    new_modules = split_modules(args.new, args.kind)

    names = sorted(set(base_modules) | set(new_modules))
    changed: list[str] = []

    for name in names:
        base_text = base_modules.get(name)
        new_text = new_modules.get(name)

        if base_text == new_text:
            continue

        changed.append(name)

        print(f"\n变化模块：{name}")

        if base_text is None:
            print("  新增模块")
            continue

        if new_text is None:
            print("  删除模块")
            continue

        print(f"  base hash: {digest(base_text)}")
        print(f"  new  hash: {digest(new_text)}")

        if args.show_diff:
            diff = difflib.unified_diff(
                base_text.splitlines(),
                new_text.splitlines(),
                fromfile=f"base/{name}",
                tofile=f"new/{name}",
                lineterm="",
            )

            for line in diff:
                print(line)

    print("\n" + "=" * 72)
    print(f"变化模块数量：{len(changed)}")

    for name in changed:
        print(f"  {name}")


if __name__ == "__main__":
    main()