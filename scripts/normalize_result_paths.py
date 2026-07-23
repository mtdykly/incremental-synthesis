### 路径规范化脚本
#!/usr/bin/env python3

import argparse
import json
import shutil
from pathlib import Path


def build_path_variants(path: Path) -> set[str]:
    """
    返回路径可能出现的几种形式。
    Yosys 脚本中主要使用 realpath 后的绝对路径。
    """
    variants = {
        str(path),
        path.as_posix(),
        str(path.resolve()),
        path.resolve().as_posix(),
    }

    return {item.rstrip("/") for item in variants if item}


def normalize_text(
    text: str,
    replacements: list[tuple[str, str]],
) -> str:
    """
    将真实路径统一替换为虚拟路径。
    路径较长的内容优先替换，避免父目录提前匹配。
    """
    for old, new in sorted(
        replacements,
        key=lambda item: len(item[0]),
        reverse=True,
    ):
        text = text.replace(old, new)

    return text


def normalize_json_file(
    source: Path,
    destination: Path,
    replacements: list[tuple[str, str]],
) -> None:
    """
    对 JSON 先替换路径，再排序键值，减少键顺序导致的差异。
    """
    text = source.read_text(encoding="utf-8")
    text = normalize_text(text, replacements)

    data = json.loads(text)

    destination.write_text(
        json.dumps(
            data,
            indent=2,
            sort_keys=True,
        )
        + "\n",
        encoding="utf-8",
    )


def normalize_file(
    source: Path,
    destination: Path,
    replacements: list[tuple[str, str]],
) -> None:
    destination.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    if source.suffix == ".json":
        normalize_json_file(
            source,
            destination,
            replacements,
        )
        return

    try:
        text = source.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        shutil.copy2(source, destination)
        return

    normalized = normalize_text(
        text,
        replacements,
    )

    destination.write_text(
        normalized,
        encoding="utf-8",
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "复制一份 Yosys 结果，并将源码目录和结果目录"
            "替换为统一的虚拟路径"
        )
    )

    parser.add_argument(
        "--input",
        required=True,
        help="原始结果目录",
    )

    parser.add_argument(
        "--output",
        required=True,
        help="规范化结果输出目录",
    )

    parser.add_argument(
        "--source-root",
        required=True,
        help="该版本对应的 RTL 源码根目录",
    )

    parser.add_argument(
        "--canonical-source",
        default="/__DESIGN_ROOT__",
        help="统一后的源码根目录名称",
    )

    parser.add_argument(
        "--canonical-result",
        default="/__RESULT_ROOT__",
        help="统一后的结果目录名称",
    )

    args = parser.parse_args()

    input_dir = Path(args.input).resolve()
    output_dir = Path(args.output).resolve()
    source_root = Path(args.source_root).resolve()

    if not input_dir.is_dir():
        raise FileNotFoundError(
            f"结果目录不存在：{input_dir}"
        )

    if not source_root.is_dir():
        raise FileNotFoundError(
            f"源码目录不存在：{source_root}"
        )

    if output_dir == input_dir:
        raise ValueError(
            "output 不能与 input 相同，避免覆盖原始结果"
        )

    replacements: list[tuple[str, str]] = []

    for variant in build_path_variants(source_root):
        replacements.append(
            (
                variant,
                args.canonical_source.rstrip("/"),
            )
        )

    for variant in build_path_variants(input_dir):
        replacements.append(
            (
                variant,
                args.canonical_result.rstrip("/"),
            )
        )

    if output_dir.exists():
        shutil.rmtree(output_dir)

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    processed = 0

    for source_file in sorted(input_dir.rglob("*")):
        if not source_file.is_file():
            continue

        relative_path = source_file.relative_to(input_dir)
        destination_file = output_dir / relative_path

        normalize_file(
            source_file,
            destination_file,
            replacements,
        )

        processed += 1

    print(f"输入目录：{input_dir}")
    print(f"输出目录：{output_dir}")
    print(f"源码路径：{source_root}")
    print(f"统一源码路径：{args.canonical_source}")
    print(f"统一结果路径：{args.canonical_result}")
    print(f"处理文件数量：{processed}")


if __name__ == "__main__":
    main()