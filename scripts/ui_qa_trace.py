#!/usr/bin/env python3
"""Record one navigation step and whether the expected screen was reached.

The walk runs on a clean, unauthenticated install. That is deliberate: it proves
the native navigation graph works without an account, and it makes the boundary
explicit - anything that needs a real Spotify session is recorded as
BLOCKED_NO_SESSION rather than silently skipped or faked.

Verdicts:
  reached            - every required view is on screen, no view that belongs
                       to another screen is showing, and the header carries the
                       expected app-chrome title;
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

# required:  must be visible for the step to count as reached.
# optional:  recorded when present, never required.
# forbidden: must NOT be visible. The tab bar and the home tab are on screen on
#            EVERY native screen, settings included, so requiring them proved
#            nothing: an earlier version of this file reported "reached" for a
#            back step that had not left Settings at all. The back button is the
#            discriminator, because it only exists on pushed screens.
# title_is / forbidden_chrome: compared against fixed APP CHROME strings only.
#            The actual text is never echoed, so no account data can leak into
#            the log; only the boolean outcome is reported.
STEPS = {
    "home": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab", "nativeScreenTitle"],
        "optional": ["nativeContent", "nativeMiniPlayer"],
    },
    "library": {
        "required": ["nativeRoot", "nativeLibraryTab", "nativeLibraryCategories"],
        "optional": ["nativeContent", "nativeRowsScroll"],
        "title_is": "Votre bibliothèque",
    },
    "search": {
        "required": ["nativeRoot", "nativeSearchPanel", "nativeSearchInput"],
        "optional": ["nativeGenreScroll"],
    },
    "browse-tile": {
        "required": ["nativeRoot"],
        "optional": ["nativeContent", "nativeRowsScroll", "nativeSearchInput"],
        # "reached" here means the tap was delivered and the shell survived it,
        # NOT that results appeared: a genre search calls searchMediaItems, which
        # needs a session. The capture shows the grid unchanged and the field
        # still empty. The outcome is covered by the authenticated protocol.
        "note": "tap delivered only; genre results require an authenticated session",
    },
    "settings": {
        "required": ["nativeRoot", "nativeContent", "nativeBackButton"],
        "optional": ["nativeScreenTitle"],
        "title_is": "Paramètres",
    },
    "back-from-settings": {
        "required": ["nativeRoot", "nativeTabBar"],
        "forbidden": ["nativeBackButton", "nativeSearchPanel"],
        "optional": ["nativeContent"],
        "title_is": "Accueil",
    },
    "home-again": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab"],
        "forbidden": ["nativeBackButton", "nativeSearchPanel"],
        "optional": ["nativeContent"],
        "title_is": "Accueil",
        # Settings content must not survive the switch back to Home.
        "forbidden_chrome": ["Paramètres indisponibles"],
    },
    # Second visit to Settings, to test Back again after the first fix and to
    # prove a single press lands exactly on Home without overshooting.
    "settings-again": {
        "required": ["nativeRoot", "nativeContent", "nativeBackButton"],
        "title_is": "Paramètres",
    },
    "back-once": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab"],
        "forbidden": ["nativeBackButton"],
        "title_is": "Accueil",
        "forbidden_chrome": ["Paramètres indisponibles"],
    },
    # A second, delayed navigation would show up here: the screen must still be
    # Home after settling, and the app must not have gone to the launcher.
    "back-settled": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab"],
        "forbidden": ["nativeBackButton"],
        "title_is": "Accueil",
    },
    # Back from a tab screen: no native back arrow, so the original WebView
    # chain must still own the key. Recorded, never asserted as a native back.
    "back-from-library": {
        "required": ["nativeRoot", "nativeTabBar"],
        "optional": ["nativeLibraryCategories", "nativeBackButton"],
        "note": "no native back arrow on a tab: the WebView chain owns this key",
    },
    "back-from-search": {
        "required": ["nativeRoot", "nativeTabBar"],
        "optional": ["nativeSearchPanel", "nativeBackButton"],
        "note": "no native back arrow on a tab: the WebView chain owns this key",
    },
    # Lifecycle: HOME then relaunch must restore a coherent native screen.
    "background-resume": {
        "required": ["nativeRoot", "nativeTabBar", "nativeHomeTab"],
        "title_is": "Accueil",
        "forbidden_chrome": ["Paramètres indisponibles"],
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
    title = ""
    all_text = ""
    readable = False
    if path.exists() and path.stat().st_size > 0:
        try:
            root = ET.parse(path).getroot()
            nodes = [n for n in root.iter("node")]
            visible = sorted({n.get("resource-id", "")[len(PREFIX):] for n in nodes
                              if n.get("resource-id", "").startswith(PREFIX)})
            title = ""
            for n in nodes:
                if n.get("resource-id", "") == PREFIX + "nativeScreenTitle":
                    title = n.get("text", "") or ""
                    break
            all_text = " | ".join((n.get("text", "") or "") for n in nodes)
            readable = True
        except ET.ParseError:
            readable = False

    forbidden_present = [v for v in spec.get("forbidden", []) if v in visible]
    chrome_present = [c for c in spec.get("forbidden_chrome", []) if c in all_text]
    expected_title = spec.get("title_is")
    title_ok = (expected_title is None) or (title == expected_title)

    present = [v for v in spec.get("required", []) if v in visible]
    missing = [v for v in spec.get("required", []) if v not in visible]
    optional_present = [v for v in spec.get("optional", []) if v in visible]

    if not readable:
        verdict = "unreadable"
    elif missing and spec.get("needs_session"):
        verdict = "blocked_no_session"
    elif missing:
        verdict = "not_reached"
    elif forbidden_present or chrome_present or not title_ok:
        verdict = "wrong_screen"
    else:
        verdict = "reached"

    entry = {
        "step": step, "profile": profile, "verdict": verdict,
        "required_present": present, "required_missing": missing,
        "optional_present": optional_present, "visible_id_count": len(visible),
        "forbidden_present": forbidden_present,
        "unexpected_chrome_present": bool(chrome_present),
        "title_expected": expected_title,
        "title_matched": title_ok,
    }
    if spec.get("note"):
        entry["scope_note"] = spec["note"]
    trace.append(entry)
    trace_file.write_text(json.dumps(trace, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    level = "notice" if verdict in ("reached", "blocked_no_session") else "error"
    print(f"::{level} title=Navigation {profile}/{step}::{verdict}; "
          f"missing={','.join(missing) or 'none'}; "
          f"forbidden={','.join(forbidden_present) or 'none'}; "
          f"stale_chrome={bool(chrome_present)}; title_matched={title_ok}; "
          f"visible_ids={len(visible)}")

    return 1 if verdict in ("not_reached", "unreadable", "wrong_screen") else 0


if __name__ == "__main__":
    sys.exit(main())
