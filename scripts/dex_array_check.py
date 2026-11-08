#!/usr/bin/env python3
"""dex_array_check.py — flags array element-type mistakes that ART rejects at
class-verification time (they build fine with apktool/dx but crash on device):

  * new-array vA, vB, [I followed by aput-object  (reference stored in int[])
  * new-array vA, vB, [Lcom/...; followed by aput (primitive stored in ref[])
  * aput/aput-object where the array register holds the wrong array kind
  * new-array whose size register was previously used as a reference

Usage: python3 scripts/dex_array_check.py [smali-root ...]
"""
import io
import os
import re
import sys

NEW_ARRAY = re.compile(r"new-array(?:/range)?\s+([vp]\d+),\s*([vp]\d+),\s*(\[+\S+)")
APUT = re.compile(r"aput(?:-object|-boolean|-byte|-char|-short|-wide)?\s+([vp]\d+),\s*([vp]\d+),\s*([vp]\d+)")


PRIM_ARRAYS = {"[I", "[Z", "[B", "[C", "[S", "[J", "[F", "[D"}


def array_kind(desc):
    # [B is a primitive array whose *elements* are bytes, but the array type
    # itself is a reference, so aput-object is legal on it.
    return "int" if desc in PRIM_ARRAYS else "ref"


def scan(path):
    src = io.open(path, encoding="utf8", errors="replace").read().split("\n")
    problems = []
    kinds = {}
    for i, line in enumerate(src, 1):
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        if s.startswith(".end method"):
            kinds = {}
            continue
        m = NEW_ARRAY.match(s)
        if m:
            dst, _size, desc = m.groups()
            kinds[dst] = array_kind(desc)
            continue
        m = APUT.match(s)
        if m:
            _val, arr, _idx = m.groups()
            op = s.split()[0]
            want = "ref" if op == "aput-object" else "int"
            have = kinds.get(arr)
            if have and have != want:
                problems.append((i, f"{op} on {arr} typed as {have}[]: {s[:100]}"))
            continue
        # any other write to a tracked register invalidates the array typing
        m = re.match(r"(?:move\S*|const\S*|new-instance|sget\S*|iget\S*|move-result\S*)\s+([vp]\d+)", s)
        if m:
            kinds.pop(m.group(1), None)
    return problems


def main():
    roots = sys.argv[1:] or ["smali", "smali_classes2", "smali_classes3"]
    roots = [r for r in roots if os.path.isdir(r)]
    total = 0
    for root in roots:
        for dirpath, _d, files in os.walk(root):
            for f in sorted(files):
                if not f.endswith(".smali"):
                    continue
                p = os.path.join(dirpath, f)
                for ln, msg in scan(p):
                    total += 1
                    print(f"{p}:{ln}: {msg}")
    print(f"{'ARRAY TYPE ERRORS: ' + str(total) if total else 'no array element-type errors'}")
    sys.exit(1 if total else 0)


if __name__ == "__main__":
    main()
