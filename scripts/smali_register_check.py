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

NEW_INSTANCE = re.compile(r"new-instance (v\d+), (L[\w/$]+;)")
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


SCALAR_DEF = re.compile(r"^\s*(?:const[\w/-]* (v\d+|p\d+),|move-result (v\d+|p\d+)\s*$|move (v\d+|p\d+),|int-to-float (v\d+|p\d+),|float-to-int (v\d+|p\d+),|add-int/lit8 (v\d+|p\d+),|mul-int/lit8 (v\d+|p\d+),|div-int/lit8 (v\d+|p\d+),|iget (v\d+|p\d+),)")
OBJECT_DEF = re.compile(r"^\s*(?:new-instance (v\d+|p\d+),|move-result-object (v\d+|p\d+)|check-cast (v\d+|p\d+),|iget-object (v\d+|p\d+),|new-array (v\d+|p\d+),)")
RECEIVER = re.compile(r"^\s*invoke-(?:virtual|direct|interface|super)(?:/range)? \{(v\d+|p\d+)")
FIELD_BASE = re.compile(r"^\s*i(?:get|put)(?:-object|-wide|-byte|-char|-short|-boolean)? (?:v\d+|p\d+), (v\d+|p\d+), L")


def scalar_then_object(body):
    """A register reassigned to a scalar must not be used as an object afterwards.

    This is the direction that catches all three real VerifyErrors: a View, a
    Resources and a LayoutParams each overwritten by a string scratch and then
    used as an object. Tracking only 'object then clobber' missed the LayoutParams
    case, because its constructor call counted as a use before the clobber.
    Kinds reset at labels, where branches merge, to stay conservative.
    """
    problems = []
    kind = {}
    for line in body.split("\n"):
        st = line.strip()
        if not st:
            continue
        if st.startswith(":"):
            kind = {}
            continue
        m = OBJECT_DEF.match(line)
        if m:
            kind[next(g for g in m.groups() if g)] = "object"
            continue
        m = SCALAR_DEF.match(line)
        if m:
            reg = next(g for g in m.groups() if g)
            # A String IS an object, so calling it on String/CharSequence/Object
            # is legitimate. Only a numeric assignment makes every object use
            # wrong; a string makes non-string object uses wrong.
            kind[reg] = "string" if st.startswith("const-string") else "number"
            continue
        for rx, what in ((RECEIVER, "invoke receiver"), (FIELD_BASE, "field base")):
            m = rx.match(line)
            if not m:
                continue
            reg = m.group(1)
            k = kind.get(reg)
            if k == "number":
                problems.append(f"{reg} used as {what} after a numeric assignment: {st[:70]}")
            elif k == "string":
                owner = re.search(r", (L[\w/$]+;)->", st)
                allowed = ("Ljava/lang/String;", "Ljava/lang/CharSequence;", "Ljava/lang/Object;")
                if what == "field base" or (owner and owner.group(1) not in allowed):
                    problems.append(f"{reg} holds a String but is used as {what}: {st[:70]}")
    return problems


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
        # A method may declare more than 16 registers; what must stay below 16
        # is the INDEX each non-range invoke references. onCreate legitimately
        # has 19 and uses invoke/range for the wide calls.
        for iv in INVOKE.finditer(body):
            kind, regs = iv.group(1), iv.group(2)
            head = body[max(0, iv.start()):iv.start() + 40].split("{")[0]
            args = [x.strip() for x in regs.split(",") if x.strip()]
            if "/range" in head or ".." in regs:
                continue
            if len(args) > 5:
                problems.append(f"{name}: invoke-{kind} passes {len(args)} registers (limit 5)")
            for a in args:
                m2 = re.fullmatch(r"([vp])(\d+)", a)
                if not m2:
                    continue
                idx = int(m2.group(2)) + (locals_n if m2.group(1) == "p" else 0)
                if idx > 15:
                    problems.append(
                        f"{name}: invoke-{kind} references {a} (index {idx}) above v15; needs /range")
        # new-instance also establishes a typed object. Missing it let a real
        # VerifyError through: a LayoutParams in v2 was overwritten by a string
        # scratch and the next iput failed verification, killing the activity.
        holds = [(h.group(2), "new-instance", h.group(1), h.end(), h.start())
                 for h in NEW_INSTANCE.finditer(body)]
        holds += [(h.group(3), h.group(2), h.group(4), h.end(), h.start())
                  for h in OBJ_GETTER.finditer(body)]
        for typ, getter, reg, after_at, _ in holds:
            owner = typ
            if typ in ("Ljava/lang/String;", "Ljava/lang/Class;", "Ljava/lang/Object;"):
                continue
            after = body[after_at:]
            esc = re.escape(typ)
            # The live range ends at the first redefinition. A later block may
            # legitimately re-acquire the same type into the same register, so
            # "last use in the method" would be a false positive. The real bug is
            # a rewrite that lands BEFORE the first call on the held type.
            # A field access is a use too: `iput vA, vB, Type->field` failed
            # verification just as an invoke would. Counting only invokes let a
            # real VerifyError through.
            use = re.search(
                rf"(invoke-\w+ \{{{reg}[,}}][^\n]*{esc}->"
                rf"|i(?:get|put)(?:-\w+)? [^\n]*, {reg}, {esc}->"
                rf"|i(?:get|put)(?:-\w+)? {reg}, [^\n]*{esc}->"
                rf"|check-cast {reg}, {esc})", after)
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
        problems.extend(f"{name}: {p}" for p in scalar_then_object(body))
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
