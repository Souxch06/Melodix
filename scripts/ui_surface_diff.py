#!/usr/bin/env python3
"""Compare real view bounds between two QA runs, per surface and per profile.

MEL-BUG-001 made metric() discard every resolved dimension, so the fix changes
geometry on every surface that reads a token. A code search cannot show that;
only the dumped bounds can. This diffs them and flags what moved.

Usage: ui_surface_diff.py BEFORE_RUN AFTER_RUN [--json out.json]
"""
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent


def load(run, profile):
    base = ROOT / "docs/audits" / f"ui-qa-{run}" / profile
    out = {}
    if not base.is_dir():
        return out
    for f in sorted(base.glob(f"layout-*-{profile}.json")):
        step = f.name[len("layout-"):-len(f"-{profile}.json")]
        d = json.loads(f.read_text())
        views = {v["id"]: v for v in d.get("views", [])}
        items = []
        for container, kids in (d.get("container_items") or {}).items():
            for i, k in enumerate(kids):
                items.append((f"{container}[{i}]", k))
        # Nested tiles and cards, which the one-level list cannot see.
        for container, kids in (d.get("container_items_deep") or {}).items():
            for k in kids:
                items.append((f"{container}{k['path']}", k))
        out[step] = {
            "views": views,
            "items": items,
            "defects": {k: v for k, v in (d.get("defects") or {}).items() if v},
        }
    return out


def dp(v):
    return round(float(v), 1)


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    before, after = sys.argv[1], sys.argv[2]
    report = {"before": before, "after": after, "profiles": {}}
    moved_total = 0
    for profile in ("phone", "tablet"):
        b, a = load(before, profile), load(after, profile)
        steps = sorted(set(b) & set(a))
        rows = []
        for step in steps:
            changes = []
            for vid, av in sorted(a[step]["views"].items()):
                bv = b[step]["views"].get(vid)
                if not bv:
                    changes.append({"view": vid, "kind": "appeared"})
                    continue
                for key in ("w_dp", "h_dp"):
                    if key in av and key in bv and dp(av[key]) != dp(bv[key]):
                        changes.append({"view": vid, "kind": key,
                                        "before": dp(bv[key]), "after": dp(av[key])})
                if "dp" in av and "dp" in bv:
                    if dp(av["dp"][0]) != dp(bv["dp"][0]) or dp(av["dp"][1]) != dp(bv["dp"][1]):
                        changes.append({"view": vid, "kind": "origin",
                                        "before": [dp(bv["dp"][0]), dp(bv["dp"][1])],
                                        "after": [dp(av["dp"][0]), dp(av["dp"][1])]})
            for vid, bv in sorted(b[step]["views"].items()):
                if vid not in a[step]["views"]:
                    changes.append({"view": vid, "kind": "disappeared"})
            # anonymous children: the rows and cards, which have no id
            bi = {k: v for k, v in b[step]["items"]}
            ai = {k: v for k, v in a[step]["items"]}
            for k, av in sorted(ai.items()):
                bv = bi.get(k)
                if not bv:
                    continue
                for key in ("w_dp", "h_dp", "x_dp", "y_dp"):
                    if key in av and key in bv and dp(av[key]) != dp(bv[key]):
                        changes.append({"view": k, "kind": key,
                                        "before": dp(bv[key]), "after": dp(av[key])})
            db = sum(len(v) for v in b[step]["defects"].values())
            da = sum(len(v) for v in a[step]["defects"].values())
            rows.append({"step": step, "changes": changes,
                         "defects_before": db, "defects_after": da,
                         "defects_after_detail": a[step]["defects"]})
            moved_total += len(changes)
        report["profiles"][profile] = rows
    out = None
    if "--json" in sys.argv:
        out = pathlib.Path(sys.argv[sys.argv.index("--json") + 1])
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps(report, indent=1, ensure_ascii=False))
    for profile, rows in report["profiles"].items():
        print(f"== {profile}")
        for r in rows:
            n = len(r["changes"])
            flag = "" if r["defects_after"] == 0 else f"  DEFECTS={r['defects_after']}"
            print(f"  {r['step']:20s} moved={n:2d}  defects {r['defects_before']}->{r['defects_after']}{flag}")
            for c in r["changes"]:
                if c["kind"] in ("appeared", "disappeared"):
                    print(f"      {c['view']}: {c['kind']}")
                else:
                    print(f"      {c['view']}: {c['kind']} {c['before']} -> {c['after']}")
    print(f"total geometry changes: {moved_total}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
