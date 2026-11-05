#!/usr/bin/env python3
"""Print the centre pixel of one view from a uiautomator dump.

Used by the UI metrics workflow to tap a native tab by its real bounds instead
of a hardcoded screen coordinate, which would be wrong on the tablet profile.

Prints "X Y" on success and nothing when the view is absent, so the caller can
skip the interaction rather than tap a guessed point.

Usage: ui_view_center.py DUMP_XML RESOURCE_ID [CHILD_INDEX]

With CHILD_INDEX, return the centre of that clickable descendant instead of the
container itself. Browse tiles carry no id of their own, so they are reached
through their container rather than by a hardcoded coordinate or by their label.
"""

import re
import sys
import xml.etree.ElementTree as ET

BOUNDS = re.compile(r"\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]")


def main():
    if len(sys.argv) not in (3, 4):
        print(__doc__, file=sys.stderr)
        return 2
    dump_path, resource_id = sys.argv[1:3]
    child_index = int(sys.argv[3]) if len(sys.argv) == 4 else None
    if "/" not in resource_id:
        resource_id = f"com.melodix.music:id/{resource_id}"
    try:
        root = ET.parse(dump_path).getroot()
    except (ET.ParseError, OSError):
        return 0
    def centre(element):
        match = BOUNDS.match(element.get("bounds", ""))
        if not match:
            return None
        x1, y1, x2, y2 = (int(v) for v in match.groups())
        if x2 <= x1 or y2 <= y1:
            return None
        return ((x1 + x2) // 2, (y1 + y2) // 2)

    for node in root.iter("node"):
        if node.get("resource-id") != resource_id:
            continue
        if child_index is None:
            point = centre(node)
        else:
            clickable = [d for d in node.iter("node")
                         if d is not node and d.get("clickable") == "true"]
            if child_index >= len(clickable):
                return 0
            point = centre(clickable[child_index])
        if point:
            print(point[0], point[1])
        return 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
