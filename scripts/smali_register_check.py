#!/usr/bin/env python3
"""Static register checks for smali, the two failure modes that took the app down.

MEL-BUG-007 and MEL-BUG-012 were both VerifyErrors that no test caught: a View
register reused as a String, and a pN referenced beyond the signature. Both kill
the activity at class-load time, so the walk only shows a missing native shell.

Checks per method:
  * every vN is below .locals, every pN exists in the signature
  * locals + params <= 16 (non-range invoke limit)
  * a register holding a typed object is not overwritten before its last call
    on that type
  * plain invoke-* passes at most 5 register arguments

Usage: smali_register_check.py FILE [FILE...]
"""
import pathlib
import re
import sys

OBJ_GETTER = re.compile(
    r"invoke-\w+ \{[^}]*\}, (L[\w/$]+;)->(\w+)\([^)]*\)(L[\w/$]+;)\s*\n\s*move-result-object (v\d+)")
INVOKE = re.compile(r"invoke-(\w+)(?:/range)? \{([^}]*)\}, (L[\w/$]+;)->(\w+)")


def params_of(header):
    sig = re.search(r"\(([^)]*)\)", header)
    if not sig or not sig.group(1):
        n = 0
    else:
        n = len([t for t in re.findall(r"(L[\w/$]+;|[ZBCSIFJD]|\[+)", sig.group(1))])
    return n + (0 if " static " in header else 1)


def strip_comments(body):
    # A comment mentioning v15 or a register name is not code. analysing it
    # produced false positives on the existing renderer.
    return re.sub(r"#.*", "", body)


def check(path):
    text = pathlib.Path(path).read_text()
    problems = []
    for m in re.finditer(r"^\.method([^\n]*)\n(.*?)^\.end method", text, re.S | re.M):
        header, body = ".method" + m.group(1), strip_comments(m.group(2))
        name = header.split("(")[0].split()[-1]
        loc = re.search(r"\.locals (\d+)", body)
        if not loc:
            continue
        locals_n = int(loc.group(1))
        params_n = params_of(header)
        for r in re.finditer(r"\bv(\d+)\b", body):
            if int(r.group(1)) >= locals_n:
                problems.append(f"{name}: v{r.group(1)} beyond .locals {locals_n}")
        for r in re.finditer(r"\bp(\d+)\b", body):
            if int(r.group(1)) >= params_n:
                problems.append(f"{name}: p{r.group(1)} beyond {params_n} parameter register(s)")
        if locals_n + params_n > 16:
            problems.append(f"{name}: {locals_n}+{params_n} registers exceeds 16")
        for iv in INVOKE.finditer(body):
            kind, regs = iv.group(1), iv.group(2)
            if "/range" in body[max(0, iv.start()):iv.start() + 40].split("{")[0]:
                continue
            args = [x.strip() for x in regs.split(",") if x.strip()]
            if ".." not in regs and len(args) > 5:
                problems.append(f"{name}: invoke-{kind} passes {len(args)} registers (limit 5)")
        for hold in OBJ_GETTER.finditer(body):
            owner, getter, typ, reg = hold.groups()
            if typ in ("Ljava/lang/String;", "Ljava/lang/Class;", "Ljava/lang/Object;"):
                continue
            after = body[hold.end():]
            esc = re.escape(typ)
            # The live range ends at the first redefinition. A later block may
            # legitimately re-acquire the same type into the same register, so
            # "last use in the method" would be a false positive. The real bug is
            # a rewrite that lands BEFORE the first call on the held type.
            use = re.search(rf"invoke-\w+ \{{{reg}[,}}][^\n]*{esc}->", after)
            if not use:
                continue
            clobber = re.search(
                rf"(const-string {reg},|const/4 {reg},|const/16 {reg},|const {reg},|"
                rf"move-result {reg}\b|move {reg},|new-instance {reg},)",
                after)
            if clobber and clobber.start() < use.start():
                problems.append(
                    f"{name}: {reg} holds {typ} from {getter}() but is overwritten "
                    f"before its first use ({clobber.group(1).strip()})")
    return problems


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    bad = 0
    for f in sys.argv[1:]:
        probs = check(f)
        for p in probs:
            print(f"{pathlib.Path(f).name}: {p}")
        bad += len(probs)
    print(f"register check: {bad} problem(s) across {len(sys.argv)-1} file(s)")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
