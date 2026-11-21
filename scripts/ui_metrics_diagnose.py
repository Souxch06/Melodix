#!/usr/bin/env python3
"""Explain WHY the shell could not be measured, without leaking screen content.

When the measurement step fails there are two very different causes and they
need different fixes:

  * the dump is empty or missing  -> uiautomator could not reach an idle state
    (a continuously animating WebView is the usual reason), so the tool never
    saw the UI at all;
  * the dump has nodes but no nativeRoot -> the UI was readable and the native
    shell genuinely had not taken over yet.

Only structural facts are reported: node counts and the app's own resource-id
names. No text, no content description, no account data, no screenshot content.

Usage: ui_metrics_diagnose.py PROFILE DUMP_PATH
"""

import pathlib
import re
import sys
import xml.etree.ElementTree as ET

PREFIX = "com.melodix.music:id/"


def main():
    if len(sys.argv) != 3:
        print(__doc__, file=sys.stderr)
        return 2
    profile, dump_path = sys.argv[1:3]
    path = pathlib.Path(dump_path)

    if not path.exists() or path.stat().st_size == 0:
        print(f"::error title=UI diagnosis {profile}::"
              "dump=absent; uiautomator produced no output at all, so the UI was never read "
              "(an animating WebView can prevent the idle state it waits for)")
        return 0

    raw = path.read_text(encoding="utf-8", errors="replace")
    try:
        root = ET.fromstring(raw)
    except ET.ParseError:
        head = raw[:120].replace("\n", " ")
        looks_like_error = bool(re.search(r"ERROR|could not|null root", head, re.I))
        print(f"::error title=UI diagnosis {profile}::"
              f"dump=unparseable; bytes={len(raw)}; uiautomator_error={str(looks_like_error).lower()}; "
              "the UI was not read, so no conclusion about the shell is drawn")
        return 0

    nodes = list(root.iter("node"))
    ids = sorted({n.get("resource-id", "")[len(PREFIX):] for n in nodes
                  if n.get("resource-id", "").startswith(PREFIX)})
    packages = sorted({n.get("package", "") for n in nodes if n.get("package")})
    has_shell = "nativeRoot" in ids

    print(f"::notice title=UI diagnosis {profile}::"
          f"dump=ok; nodes={len(nodes)}; app_ids={len(ids)}; nativeRoot={str(has_shell).lower()}; "
          f"packages={','.join(packages) or 'none'}; ids={','.join(ids[:24]) or 'none'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
