#!/usr/bin/env python3
"""dex_merge_check.py — flags primitive-vs-reference register conflicts at smali
label merge points (the VerifyError pattern seen on device: one path leaves a
boolean/int in a register, another leaves an object, and both reach the same
label). Usage: python3 scripts/dex_merge_check.py <smali-file> [method-substr ...]
"""
import io
import re
import sys
import collections

INT, REF, NULL, UNDEF = "int", "ref", "null", "undef"


def merge(a, b):
    if a == UNDEF:
        return b
    if b == UNDEF:
        return a
    if a == b:
        return a
    if NULL in (a, b):
        other = b if a == NULL else a
        return INT if other == INT else REF
    if {a, b} == {INT, REF}:
        return "conflict"
    return REF


INVOKE_RE = re.compile(r"invoke-\S+\s+\{([^}]*)\},\s*\S+->\S+\(([^)]*)\)(\S+)")


def ret_type(sig_ret):
    if sig_ret == "V":
        return None
    if sig_ret.startswith("L") or sig_ret.startswith("["):
        return REF
    return INT  # Z B C S I J F D -> int-ish (wide J/D ignored for conflict check)


def run_method(body):
    insns, labels = [], {}
    for ln, t in body:
        s = t.strip()
        if not s or s.startswith("#"):
            continue
        if s.startswith("."):
            m = re.match(r"\.locals\s+(\d+)", s)
            if m:
                run_method.nlocals = int(m.group(1))
            continue
        m = re.match(r"^:(\S+)(?:\s+(.*))?$", s)
        if m:
            labels[m.group(1)] = len(insns)
            if m.group(2):
                insns.append((ln, m.group(2)))
            continue
        insns.append((ln, s))
    if not insns:
        return []
    N = 64
    P0 = 60
    start = [UNDEF] * N
    for i in range(4):
        start[P0 + i] = REF
    work = collections.deque([(0, tuple(start))])
    seen = {}
    conflicts = []

    def get(r, regs):
        return regs[P0 + int(r[1:])] if r.startswith("p") else regs[int(r[1:])]

    def setr(r, v, regs):
        regs = list(regs)
        if r.startswith("p"):
            regs[P0 + int(r[1:])] = v
        else:
            regs[int(r[1:])] = v
        return tuple(regs)

    while work:
        idx, regs = work.popleft()
        if idx in seen:
            old = seen[idx]
            merged = tuple(merge(a, b) for a, b in zip(old, regs))
            if merged != old:
                seen[idx] = merged
                work.append((idx, merged))
            continue
        seen[idx] = regs
        if idx >= len(insns):
            continue
        ln, s = insns[idx]
        op = s.split(None, 1)[0]
        r = regs
        targets, nxt = [], idx + 1
        if op == "goto":
            targets = [labels.get(s.split()[1].lstrip(":"), len(insns))]
            nxt = None
        elif op.startswith("if-"):
            lab = s.split()[-1].lstrip(":")
            targets = [labels.get(lab, len(insns)), idx + 1]
            nxt = None
        elif op.startswith("return"):
            nxt = None
        else:
            try:
                if op.startswith("move") and op != "move-exception" and "," in s:
                    dst, src = [x.strip() for x in s.split(None, 1)[1].split(",")]
                    r = setr(dst, get(src, r), r)
                elif op == "move-exception":
                    r = setr(s.split()[1], REF, r)
                elif op in ("new-instance", "new-array", "check-cast", "sget-object", "iget-object", "move-result-object"):
                    dst = s.split(",")[0].split()[-1] if op != "check-cast" else s.split(",")[0].split()[-1]
                    r = setr(dst, REF, r)
                elif op in ("move-result", "move-result-wide"):
                    r = setr(s.split()[1], INT, r)
                elif op.startswith("const") or op.startswith("sget") or op.startswith("iget") or op.startswith("aget"):
                    dst = s.split(",")[0].split()[-1]
                    r = setr(dst, INT, r)
                m = INVOKE_RE.match(s)
                if m and not op.startswith("invoke-static"):
                    args = [x.strip() for x in m.group(1).split(",") if x.strip()]
                    if args and get(args[0], r) == INT:
                        conflicts.append((ln, f"invoke receiver {args[0]} is int here: {s[:100]}"))
                    rt = ret_type(m.group(3))
                    if rt and idx + 1 < len(insns):
                        nln, ns = insns[idx + 1]
                        if ns.startswith("move-result"):
                            dst = ns.split()[1]
                            r = setr(dst, rt, r)
            except Exception:
                pass
        for t in targets:
            if t < len(insns):
                if t in seen:
                    old = seen[t]
                    merged = tuple(merge(a, b) for a, b in zip(old, r))
                    if "conflict" in merged:
                        for i, v in enumerate(merged):
                            if v == "conflict":
                                rn = f"p{i-P0}" if i >= P0 else f"v{i}"
                                conflicts.append((ln, f"{rn} merges int+ref at #{t}: {insns[t][1][:80]}"))
                    if merged != old:
                        seen[t] = merged
                        work.append((t, merged))
                else:
                    work.append((t, r))
        if nxt is not None:
            work.append((nxt, r))
    return conflicts


def main():
    path = sys.argv[1]
    filters = sys.argv[2:]
    src = io.open(path, encoding="utf8").read().split("\n")
    methods, cur = [], None
    for i, line in enumerate(src):
        if line.startswith(".method"):
            cur = [(i + 1, line)]
        elif cur is not None:
            cur.append((i + 1, line))
            if line.startswith(".end method"):
                methods.append(cur)
                cur = None
    total = 0
    for m in methods:
        if filters and not any(f in m[0][1] for f in filters):
            continue
        conf = run_method(m)
        if conf:
            total += len(conf)
            print(f"== {m[0][1].strip()}")
            for ln, msg in conf[:15]:
                print(f"   line {ln}: {msg}")
    print(f"{'CONFLICTS: ' + str(total) if total else 'no merge conflicts'} in {path}")
    sys.exit(1 if total else 0)


if __name__ == "__main__":
    main()
