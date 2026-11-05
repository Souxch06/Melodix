#!/usr/bin/env python3
"""Record one navigation step and whether the expected screen was reached.

The walk runs on a clean, unauthenticated install. That is deliberate: it proves
the native navigation graph works without an account, and it makes the boundary
explicit - anything that needs a real Spotify session is recorded as
BLOCKED_NO_SESSION rather than silently skipped or faked.

Verdicts:
  reached            - every required view for the step is on screen;
  not_reached        - a required view is missing: a real navigation defect;
  blocked_no_session - the step cannot be attempted without a signed-in session;
  unreadable         - the UI could not be dumped, so nothing is claimed.

Only resource-id names are recorded. No text, no content description.

Usage: ui_qa_trace.py STEP PROFILE DUMP_XML TRACE_JSON
"""

import json
import pathlib
import sys
import xml.etree.ElementTree as ET

PREFIX = "com.melodix.music:id/"

# required: must be visible for the step to count as reached.
# optional: recorded when present, never required.
STEPS = {
    "home": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab", "nativeScreenTitle"],
        "optional": ["nativeContent", "nativeMiniPlayer"],
    },
    "library": {
        "required": ["nativeRoot", "nativeLibraryTab", "nativeLibraryCategories"],
        "optional": ["nativeContent", "nativeRowsScroll"],
    },
    "search": {
        "required": ["nativeRoot", "nativeSearchPanel", "nativeSearchInput"],
        "optional": ["nativeGenreScroll"],
    },
    "browse-tile": {
        "required": ["nativeRoot"],
        "optional": ["nativeContent", "nativeRowsScroll", "nativeSearchInput"],
    },
    "settings": {
        "required": ["nativeRoot", "nativeContent", "nativeBackButton"],
        "optional": ["nativeScreenTitle"],
    },
    "back-from-settings": {
        "required": ["nativeRoot", "nativeTabBar"],
        "optional": ["nativeContent"],
    },
    "home-again": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab"],
        "optional": ["nativeContent"],
    },
    # Needs real playback: never attempted on a clean install.
    "player": {
        "required": ["nativePlayerPanel"],
        "optional": ["nativePlayerLargeArtwork", "nativePlayerLargePlayPauseButton"],
        "needs_session": True,
    },
    "mini-player": {
        "required": ["nativeMiniPlayer"],
        "optional": ["nativePlayPauseButton", "nativeMiniProgress"],
        "needs_session": True,
    },
}


def main():
    if len(sys.argv) != 5:
        print(__doc__, file=sys.stderr)
        return 2
    step, profile, dump_path, trace_path = sys.argv[1:5]
    if step not in STEPS:
        print(f"unknown step {step}", file=sys.stderr)
        return 2
    spec = STEPS[step]

    trace_file = pathlib.Path(trace_path)
    trace = []
    if trace_file.exists():
        try:
            trace = json.loads(trace_file.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError):
            trace = []

    path = pathlib.Path(dump_path)
    visible = []
    readable = False
    if path.exists() and path.stat().st_size > 0:
        try:
            root = ET.parse(path).getroot()
            visible = sorted({n.get("resource-id", "")[len(PREFIX):] for n in root.iter("node")
                              if n.get("resource-id", "").startswith(PREFIX)})
            readable = True
        except ET.ParseError:
            readable = False

    present = [v for v in spec["required"] if v in visible]
    missing = [v for v in spec["required"] if v not in visible]
    optional_present = [v for v in spec["optional"] if v in visible]

    if not readable:
        verdict = "unreadable"
    elif missing and spec.get("needs_session"):
        verdict = "blocked_no_session"
    elif missing:
        verdict = "not_reached"
    else:
        verdict = "reached"

    entry = {
        "step": step, "profile": profile, "verdict": verdict,
        "required_present": present, "required_missing": missing,
        "optional_present": optional_present, "visible_id_count": len(visible),
    }
    trace.append(entry)
    trace_file.write_text(json.dumps(trace, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    if verdict == "not_reached":
        level = "error"
    elif verdict == "unreadable":
        level = "error"
    else:
        level = "notice"
    print(f"::{level} title=Navigation {profile}/{step}::{verdict}; "
          f"missing={','.join(missing) or 'none'}; "
          f"optional={','.join(optional_present) or 'none'}; visible_ids={len(visible)}")

    return 1 if verdict in ("not_reached", "unreadable") else 0


if __name__ == "__main__":
    sys.exit(main())
