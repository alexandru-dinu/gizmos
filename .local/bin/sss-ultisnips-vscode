#!/usr/bin/env python

import json
import re
from argparse import ArgumentParser
from pathlib import Path
from typing import List


def convert(lines: List[str]) -> json:
    header = re.search(r'(snippet) (\w+) "([\w\s]+)" (.*)', lines[0])
    return {
        "prefix": header.groups()[1],
        "description": header.groups()[2],
        "body": ["\n" if not l.rstrip("\n") else l.rstrip("\n") for l in lines[1:]],
    }


def snip_line_gen(file):
    with open(file, "rt") as fp:
        lines = fp.readlines()

    i = 0
    while i < len(lines) - 1:
        while not lines[i].startswith("snippet"):
            i += 1

        snip = []
        while not lines[i].startswith("endsnippet"):
            snip.append(lines[i])
            i += 1

        yield snip


def main():
    snip_lines = snip_line_gen(args.ultisnips_file)

    out = [convert(ls) for ls in snip_lines]
    out = {snip["prefix"]: snip for snip in out}

    lang = args.ultisnips_file.stem
    with open(args.out_dir / f"{lang}.json", "wt") as fp:
        json.dump(out, fp, indent=4)

    print(f"Converted {len(out)} snippets.")


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument(
        "--ultisnips_file", type=Path, required=True, help="<lang>.snippets file"
    )
    parser.add_argument(
        "--out_dir",
        type=Path,
        required=True,
        help="dir for vscode snippets",
    )
    args = parser.parse_args()

    main()
