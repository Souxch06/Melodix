#!/usr/bin/env python3
"""Detect layout defects from a live uiautomator dump.

Complements looking at the screenshot: some defects are obvious to the eye but
easy to miss across ten surfaces and two form factors, and some are invisible in
a screenshot but obvious in the bounds.

Reported, per surface:
  * collapsed   - a view Android laid out with zero width or height;
  * offscreen   - a view whose bounds leave the display (clipped content);
  * small_target- a clickable view under 48dp on either axis;
  * overlap     - two clickable views that are not ancestor/descendant and whose
                  bounds intersect, so a tap is ambiguous.

Only structural facts are reported: resource-id names, class names, pixel and dp
numbers. Never text, never content descriptions, never account data.

Usage: ui_layout_audit.py SURFACE PROFILE DENSITY DUMP_XML OUT_JSON
Exit status is 1 when a defect is found, so the caller can fail closed.
"""

import json
import pathlib
import re
import sys
import xml.etree.ElementTree as ET

PREFIX = "com.melodix.music:id/"
BOUNDS = re.compile(r"\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]")
MIN_TARGET_DP = 48


def parse_bounds(raw):
    match = BOUNDS.match(raw or "")
    if not match:
        return None
    x1, y1, x2, y2 = (int(v) for v in match.groups())
    return (x1, y1, x2, y2)


def short_id(node):
    rid = node.get("resource-id", "")
    return rid[len(PREFIX):] if rid.startswith(PREFIX) else ""


def intersection(a, b):
    x1 = max(a[0], b[0])
    y1 = max(a[1], b[1])
    x2 = min(a[2], b[2])
    y2 = min(a[3], b[3])
    if x2 <= x1 or y2 <= y1:
        return 0
    return (x2 - x1) * (y2 - y1)


def audit(root, scale, screen):
    nodes = []
    parents = {}

    def walk(element, ancestors):
        for child in element:
            if child.tag != "node":
                walk(child, ancestors)
                continue
            box = parse_bounds(child.get("bounds"))
            if box is not None:
                entry = {
                    "id": short_id(child),
                    "class": (child.get("class") or "").split(".")[-1],
                    "bounds": box,
                    "clickable": child.get("clickable") == "true",
                    "ancestors": ancestors,
                }
                nodes.append(entry)
                parents[id(child)] = entry
                walk(child, ancestors + [entry])
            else:
                walk(child, ancestors)

    walk(root, [])

    screen_w, screen_h = screen
    defects = {"collapsed": [], "offscreen": [], "small_target": [], "overlap": []}

    for entry in nodes:
        if not entry["id"]:
            continue  # only our own views can be attributed to a Melodix defect
        x1, y1, x2, y2 = entry["bounds"]
        w, h = x2 - x1, y2 - y1
        label = entry["id"]
        if w <= 0 or h <= 0:
            defects["collapsed"].append({"view": label, "width_px": w, "height_px": h})
            continue
        # A 1px tolerance absorbs rounding at fractional densities.
        if x1 < -1 or y1 < -1 or x2 > screen_w + 1 or y2 > screen_h + 1:
            defects["offscreen"].append({
                "view": label, "bounds_px": [x1, y1, x2, y2],
                "screen_px": [screen_w, screen_h],
            })
        if entry["clickable"]:
            w_dp, h_dp = w / scale, h / scale
            if w_dp < MIN_TARGET_DP - 0.5 or h_dp < MIN_TARGET_DP - 0.5:
                defects["small_target"].append({
                    "view": label, "width_dp": round(w_dp, 1), "height_dp": round(h_dp, 1),
                })

    clickable = [e for e in nodes if e["clickable"] and e["id"]]
    for i, a in enumerate(clickable):
        for b in clickable[i + 1:]:
            if a in b["ancestors"] or b in a["ancestors"]:
                continue  # a button inside a clickable row is intentional
            area = intersection(a["bounds"], b["bounds"])
            if area > 0:
                defects["overlap"].append({
                    "views": [a["id"], b["id"]], "overlap_px2": area,
                })

    return defects, len(nodes)


def main():
    if len(sys.argv) != 6:
        print(__doc__, file=sys.stderr)
        return 2
    surface, profile, density, dump_path, out_path = sys.argv[1:6]
    scale = float(density) / 160.0
    path = pathlib.Path(dump_path)

    report = {
        "schema_version": 1, "surface": surface, "profile": profile,
        "density_dpi": float(density), "readable": False, "defects": {},
    }

    if not path.exists() or path.stat().st_size == 0:
        report["reason"] = "dump_absent"
        pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                         encoding="utf-8")
        print(f"::error title=Layout audit {profile}/{surface}::dump=absent; nothing was inspected")
        return 1

    try:
        root = ET.parse(path).getroot()
    except ET.ParseError:
        report["reason"] = "dump_unparseable"
        pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                         encoding="utf-8")
        print(f"::error title=Layout audit {profile}/{surface}::dump=unparseable; nothing was inspected")
        return 1

    root_box = None
    for node in root.iter("node"):
        box = parse_bounds(node.get("bounds"))
        if box and (box[2] - box[0]) > 0:
            root_box = box
            break
    if root_box is None:
        report["reason"] = "no_bounds"
        pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                         encoding="utf-8")
        print(f"::error title=Layout audit {profile}/{surface}::no usable bounds")
        return 1

    screen = (root_box[2], root_box[3])
    defects, count = audit(root, scale, screen)
    # Geometry only: id, class and bounds, never the text. Pixel guessing led to
    # a wrong diagnosis once already; the dump is the authoritative measurement,
    # and publishing it without text keeps account data out of the repository.
    views = []
    for node in root.iter("node"):
        rid = node.get("resource-id", "")
        if not rid.startswith("com.melodix.music:id/"):
            continue
        box = parse_bounds(node.get("bounds"))
        if not box:
            continue
        views.append({
            "id": rid[len("com.melodix.music:id/"):],
            "cls": (node.get("class", "") or "").rsplit(".", 1)[-1],
            "px": list(box),
            "dp": [round(v / scale, 1) for v in box],
            "w_dp": round((box[2] - box[0]) / scale, 1),
            "h_dp": round((box[3] - box[1]) / scale, 1),
        })
    # Rows, shelf cards and genre tiles are built in code WITHOUT an id, so the
    # id-filtered list above cannot measure them. That gap is what made an earlier
    # diagnosis rely on pixel guessing. Record the geometry of the anonymous
    # children of the known item containers instead. Still no text.
    containers = ("nativeContent", "nativeGenreScroll", "nativeLibraryCategories",
                  "nativeQuickGrid", "nativeShelfRow")
    items = {}
    deep_items = {}
    for node in root.iter("node"):
        rid = node.get("resource-id", "")
        if not rid.startswith("com.melodix.music:id/"):
            continue
        name = rid[len("com.melodix.music:id/"):]
        if name not in containers:
            continue
        kids = []
        for kid in node.findall("node"):
            box = parse_bounds(kid.get("bounds"))
            if not box:
                continue
            kids.append({
                "cls": (kid.get("class", "") or "").rsplit(".", 1)[-1],
                "px": list(box),
                "w_dp": round((box[2] - box[0]) / scale, 1),
                "h_dp": round((box[3] - box[1]) / scale, 1),
                "x_dp": round(box[0] / scale, 1),
                "y_dp": round(box[1] / scale, 1),
            })
        if kids:
            items[name] = kids
        # The genre grid and the shelves wrap their tiles in an extra layout, so
        # the direct children above are containers, not the tiles themselves.
        # Search showed exactly one child and no tile was ever measured. Walk the
        # descendants too, keeping a stable path so runs can be diffed. Still no
        # text is recorded.
        deep = []

        def walk(node, path, depth):
            if depth > 3:
                return
            for i, kid in enumerate(node.findall("node")):
                box = parse_bounds(kid.get("bounds"))
                if not box:
                    continue
                here = f"{path}/{i}"
                deep.append({
                    "path": here,
                    "depth": depth,
                    "cls": (kid.get("class", "") or "").rsplit(".", 1)[-1],
                    "px": list(box),
                    "w_dp": round((box[2] - box[0]) / scale, 1),
                    "h_dp": round((box[3] - box[1]) / scale, 1),
                    "x_dp": round(box[0] / scale, 1),
                    "y_dp": round(box[1] / scale, 1),
                    "kids": len(kid.findall("node")),
                })
                walk(kid, here, depth + 1)

        walk(node, "", 1)
        if deep:
            deep_items[name] = deep
    report.update({"readable": True, "node_count": count,
                   "screen_px": list(screen), "defects": defects, "views": views,
                   "container_items": items, "container_items_deep": deep_items})
    pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                     encoding="utf-8")

    total = sum(len(v) for v in defects.values())
    parts = []
    for kind, items in defects.items():
        if not items:
            continue
        names = ",".join(sorted({(i.get("view") or "+".join(i.get("views", []))) for i in items})[:8])
        parts.append(f"{kind}={len(items)}({names})")
    level = "error" if total else "notice"
    print(f"::{level} title=Layout audit {profile}/{surface}::"
          f"nodes={count}; defects={total}" + ("; " + "; ".join(parts) if parts else ""))
    return 1 if total else 0


if __name__ == "__main__":
    sys.exit(main())
