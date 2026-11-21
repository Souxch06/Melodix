#!/usr/bin/env python3
"""Audit that every native control reaches a real implementation.

Answers "is this button wired?" with evidence rather than assumption, by walking
the whole chain:

    layout android:onClick
      -> MainActivity.smali handler
        -> window.<fn> referenced in the injected JavaScript
          -> definition in scripts/*.source.js

Classifications:
  wired       - handler exists and every JS function it references is defined;
  native      - handler does real work through a native method (live search,
                settings load) rather than injecting JS directly;
  navigation  - handler only changes the native screen: legitimate for tabs,
                back and expand;
  partial     - handler exists but at least one referenced JS function has no
                definition in the sources;
  missing     - no handler found at all.

Diagnostic flags (window.__sfNativeUiRoot*, set by the native side) are not
functions and are not counted as missing.

This is a static wiring audit. It proves the chain exists, NOT that Spotify
honours it at runtime: that needs an authenticated session.

Usage: ui_wiring_audit.py [OUT_JSON]
"""

import json
import pathlib
import re
import sys

REPO = pathlib.Path(__file__).resolve().parent.parent
LAYOUTS = ["res/layout/activity_main.xml", "res/layout-sw600dp/activity_main.xml"]
SOURCES = ["scripts/native_ui_shell.source.js", "scripts/spotify_bridge.source.js",
           "scripts/melodix_home.source.js"]

# Boolean/number flags published by the native side, not callable functions.
FLAG_PREFIXES = ("__sfNativeUiRoot", "__sfNativeUiShowMethodCalled", "__sfMelodixBridgeStarted")


def handlers_in_layout(text):
    out = []
    for match in re.finditer(r"<([A-Za-z0-9_.]+)((?:[^>\"']|\"[^\"]*\"|'[^']*')*?)/?>", text, re.S):
        attrs = match.group(2)
        handler = re.search(r'android:onClick="(\w+)"', attrs)
        if not handler:
            continue
        view = re.search(r'android:id="@id/(\w+)"', attrs)
        out.append((view.group(1) if view else None, handler.group(1)))
    return out


def method_body(smali, name):
    start = re.search(r"\.method public final " + re.escape(name) + r"\(Landroid/view/View;\)V", smali)
    if not start:
        return None
    end = smali.index(".end method", start.start())
    return smali[start.start():end]


def defined_functions():
    names = set()
    for rel in SOURCES:
        path = REPO / rel
        if not path.exists():
            continue
        text = path.read_text(encoding="utf-8")
        # window.fn = anything  /  function fn(  /  fn: function
        names.update(re.findall(r"window\.(\w+)\s*=", text))
        names.update(re.findall(r"function\s+(\w+)\s*\(", text))
        names.update(re.findall(r"(\w+)\s*:\s*function", text))
    return names


def main():
    out_path = sys.argv[1] if len(sys.argv) > 1 else None
    activity = (REPO / "smali/com/melodix/music/MainActivity.smali").read_text(encoding="utf-8")
    defined = defined_functions()

    seen = {}
    for rel in LAYOUTS:
        path = REPO / rel
        if not path.exists():
            continue
        for view, handler in handlers_in_layout(path.read_text(encoding="utf-8")):
            entry = seen.setdefault(handler, {"handler": handler, "views": [], "layouts": []})
            if view and view not in entry["views"]:
                entry["views"].append(view)
            if rel not in entry["layouts"]:
                entry["layouts"].append(rel)

    results = []
    for handler, entry in sorted(seen.items()):
        body = method_body(activity, handler)
        if body is None:
            entry.update({"status": "missing", "js_references": [], "undefined_js": []})
            results.append(entry)
            continue
        referenced = sorted(set(re.findall(r"window\.(\w+)", body)))
        callable_refs = [n for n in referenced if not n.startswith(FLAG_PREFIXES)]
        undefined = [n for n in callable_refs if n not in defined]
        internal = re.findall(r"Lcom/melodix/music/MainActivity;->(\w+)\(", body)
        entry["internal_calls"] = sorted(set(internal))
        entry["js_references"] = callable_refs
        entry["undefined_js"] = undefined
        native_actions = {"performNativeLiveSearch", "applyNativeUiData", "openNativeSettings",
                          "beginNativeSettingsLoad", "openNativeRow"}
        if undefined:
            entry["status"] = "partial"
        elif callable_refs:
            entry["status"] = "wired"
        elif native_actions.intersection(internal):
            entry["status"] = "native"
        else:
            entry["status"] = "navigation"
        results.append(entry)

    # Row taps go through a listener, not android:onClick, and they carry the
    # Library -> Playlist -> Player path, so they are audited too.
    listener = (REPO / "smali/com/melodix/music/NativeRowClickListener.smali").read_text(encoding="utf-8")
    row_target = re.search(r"MainActivity;->(\w+)\(", listener)
    row_entry = {"handler": "NativeRowClickListener -> " + (row_target.group(1) if row_target else "?"),
                 "views": ["nativeContent rows"], "layouts": LAYOUTS}
    row_body_start = re.search(r"\.method public final openNativeRow\(", activity)
    if row_body_start:
        row_body = activity[row_body_start.start():activity.index(".end method", row_body_start.start())]
        refs = sorted({n for n in re.findall(r"window\.(\w+)", row_body)
                       if not n.startswith(FLAG_PREFIXES)})
        undefined = [n for n in refs if n not in defined]
        row_entry.update({"js_references": refs, "undefined_js": undefined,
                          "status": "partial" if undefined else "wired"})
    else:
        row_entry.update({"js_references": [], "undefined_js": [], "status": "missing"})
    results.append(row_entry)

    counts = {}
    for entry in results:
        counts[entry["status"]] = counts.get(entry["status"], 0) + 1

    report = {
        "schema_version": 1,
        "scope": "static wiring only; runtime behaviour needs an authenticated session",
        "handler_count": len(results),
        "counts": counts,
        "handlers": results,
    }
    if out_path:
        pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                         encoding="utf-8")

    for entry in results:
        detail = ",".join(entry["js_references"]) or ",".join(entry.get("internal_calls", []))
        print(f"{entry['status']:11s} {entry['handler']:32s} {detail}")
    print(f"\n{len(results)} handlers: " + ", ".join(f"{k}={v}" for k, v in sorted(counts.items())))

    broken = counts.get("missing", 0) + counts.get("partial", 0)
    return 1 if broken else 0


if __name__ == "__main__":
    sys.exit(main())
