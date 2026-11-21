#!/usr/bin/env python3
"""dex_ref_check.py — verifies that every invoke/field reference to an app
(Lcom/melodix/...) class resolves to a declared .method / .field in this repo's
smali tree. Catches NoSuchMethodError / NoSuchFieldError that apktool+dx accept
at build time but ART throws at runtime (settings crash pattern).

Usage: python3 scripts/dex_ref_check.py [smali-root ...]
"""
import io
import os
import re
import sys

REF_INVOKE = re.compile(r"invoke-\S+\s+\{[^}]*\},\s*(Lcom/melodix/[^;]+);->([^(\s]+)(\([^)]*\)\S+)")
REF_FIELD = re.compile(r"(?:sget|sput|iget|iput)-\S+\s+[vp]\d+(?:,\s*[vp]\d+)?,\s*(Lcom/melodix/[^;]+);->([^\s:]+):(\S+)")


def build_index(root):
    methods = {}
    fields = {}
    supers = {}
    ops = {}
    for dirpath, _dirnames, files in os.walk(root):
        for f in files:
            if not f.endswith(".smali"):
                continue
            path = os.path.join(dirpath, f)
            cls = None
            src = io.open(path, encoding="utf8", errors="replace").read()
            m = re.search(r"^\.class[^\n]*?(Lcom/melodix/[^;\s]+);", src, re.M)
            if not m:
                continue
            cls = m.group(1)
            methods.setdefault(cls, set())
            fields.setdefault(cls, set())
            sm = re.search(r"^\.super\s+(\S+)", src, re.M)
            if sm:
                supers[cls] = sm.group(1).strip("L;")
            for mm in re.finditer(r"^\.method\s+([^\n]+)$", src, re.M):
                sig = mm.group(1).strip()
                name = sig.split("(")[0].split()[-1]
                methods[cls].add(name)
            for ff in re.finditer(r"^\.field\s+([^\n]+)$", src, re.M):
                sig = ff.group(1).strip()
                nm = sig.split(":")[0].split()[-1]
                fields[cls].add(nm)
            for op in re.finditer(r"invoke-(virtual|direct|static|interface|super)", src):
                ops[op.group(1)] = ops.get(op.group(1), 0) + 1
    return methods, fields, ops, supers


def walk(names, cls, table, supers):
    """True if `names` contains a member declared on cls or an app superclass."""
    seen = set()
    cur = cls
    while cur and cur in table and cur not in seen:
        seen.add(cur)
        if names in table[cur]:
            return True
        cur = supers.get(cur)
    # chain left the app tree (framework/Spotify superclass): the member may be
    # inherited, so it cannot be declared missing here.
    return True if cur and cur not in table else False


def main():
    roots = sys.argv[1:] or ["smali", "smali_classes2", "smali_classes3"]
    roots = [r for r in roots if os.path.isdir(r)]
    methods, fields, _, supers = build_index(".")
    problems = []
    for root in roots:
        for dirpath, _d, files in os.walk(root):
            for f in files:
                if not f.endswith(".smali"):
                    continue
                path = os.path.join(dirpath, f)
                src = io.open(path, encoding="utf8", errors="replace").read()
                target_cls = None
                m = re.search(r"^\.class[^\n]*?(Lcom/melodix/[^;\s]+);", src, re.M)
                if m:
                    target_cls = m.group(1)
                for i, line in enumerate(src.split("\n"), 1):
                    s = line.strip()
                    if not s.startswith(("invoke-", "sget", "sput", "iget", "iput")):
                        continue
                    mi = REF_INVOKE.search(s)
                    if mi:
                        cls, name = mi.group(1), mi.group(2)
                        # same-class refs declared with no args in the pattern
                        if cls not in methods:
                            problems.append((path, i, f"missing class {cls}", s[:110]))
                        elif not walk(name, cls, methods, supers):
                            problems.append((path, i, f"missing method {cls}->{name}", s[:110]))
                        continue
                    mf = REF_FIELD.search(s)
                    if mf:
                        cls, name = mf.group(1), mf.group(2)
                        if cls not in fields:
                            problems.append((path, i, f"missing class {cls}", s[:110]))
                        elif not walk(name, cls, fields, supers):
                            problems.append((path, i, f"missing field {cls}->{name}", s[:110]))
    if problems:
        for p in problems[:80]:
            print(f"{p[0]}:{p[1]}: {p[2]}\n    {p[3]}")
        print(f"\n{len(problems)} unresolved reference(s)")
        sys.exit(1)
    print("all app-class references resolve")


if __name__ == "__main__":
    main()
