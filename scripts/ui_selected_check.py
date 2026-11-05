#!/usr/bin/env python3
"""Report whether a container has exactly one selected descendant.

A delivered tap is not evidence that anything happened. The browse ring is pure
presentation and must therefore appear without an authenticated session, so this
turns "tap sent" into "the tile really became selected".

Prints `selected=<count>` on the first line, then the matching tags.
"""
import sys
import xml.etree.ElementTree as ET


def main():
    if len(sys.argv) != 3:
        print("usage: ui_selected_check.py DUMP_XML RESOURCE_ID", file=sys.stderr)
        return 2
    dump_path, rid = sys.argv[1:3]
    if "/" not in rid:
        rid = f"com.melodix.music:id/{rid}"
    try:
        root = ET.parse(dump_path).getroot()
    except (ET.ParseError, OSError) as exc:
        print(f"unreadable dump: {exc}")
        return 1
    for node in root.iter("node"):
        if node.get("resource-id") != rid:
            continue
        chosen = [d for d in node.iter("node")
                  if d is not node and d.get("selected") == "true"]
        print(f"selected={len(chosen)}")
        for d in chosen:
            print(f"  cls={d.get('class')} desc={d.get('content-desc')!r} bounds={d.get('bounds')}")
        clickable = [d for d in node.iter("node")
                     if d is not node and d.get("clickable") == "true"]
        print(f"clickable_descendants={len(clickable)}")
        return 0
    print("container absent")
    return 1


if __name__ == "__main__":
    sys.exit(main())
