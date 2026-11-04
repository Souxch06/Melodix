#!/usr/bin/env python3
"""Compare the dimensions Android actually rendered against the design tokens.

This runs on a booted emulator against a `uiautomator dump` of the live native
shell. It is the only check in the repository that proves the token system
survives inflation: aapt2 compiling a resource is not the same as Android
selecting the sw600dp variant and laying a view out at that size.

It measures the unauthenticated shell, which is what a clean install honestly
shows. Nothing is injected, no playback is faked and no account is used, so the
player and the content shelves are out of reach here and are reported as
NOT MEASURED rather than guessed.

Usage:
    ui_metrics_measure.py PROFILE DENSITY_XML DUMP_XML OUT_JSON

Exit status is non-zero when a required view is missing or a measured size
disagrees with its token, so the workflow is fail-closed.
"""

import json
import pathlib
import re
import sys
import xml.etree.ElementTree as ET

REPO = pathlib.Path(__file__).resolve().parent.parent

# view id -> (token, axis). Only views that exist in the unauthenticated shell.
REQUIRED = {
    "nativeTabBar": ("mel_tab_bar_height", "height"),
    "nativeHomeTab": ("mel_tab_height", "height"),
    "nativeSearchTab": ("mel_tab_height", "height"),
    "nativeLibraryTab": ("mel_tab_height", "height"),
    "nativeSettingsButton": ("mel_header_action", "width"),
}

# Measured when the current screen happens to expose them; never assumed.
OPTIONAL = {
    "nativeSearchInput": ("mel_search_height", "height"),
    "nativeMiniPlayer": ("mel_mini_height", "height"),
}

BOUNDS = re.compile(r"\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]")


def tokens(profile):
    """Resolve the token set exactly as Android would for this profile."""
    base = REPO / "res" / "values" / "mel_dimens.xml"
    values = {}
    for path in [base] + ([REPO / "res" / "values-sw600dp" / "mel_dimens.xml"]
                          if profile == "tablet" else []):
        for name, raw in re.findall(
            r'<dimen name="([A-Za-z0-9_]+)">([^<]+)</dimen>', path.read_text(encoding="utf-8")
        ):
            match = re.fullmatch(r"([0-9]+(?:\.[0-9]+)?)(?:dip|dp|sp)", raw.strip())
            if match is None:
                raise SystemExit(f"token {name} has an unsupported value: {raw!r}")
            values[name] = float(match.group(1))
    return values


def main():
    if len(sys.argv) != 5:
        print(__doc__)
        return 2
    profile, density, dump_path, out_path = sys.argv[1:5]
    if profile not in ("phone", "tablet"):
        print("profile must be phone or tablet", file=sys.stderr)
        return 2

    density = float(density)
    scale = density / 160.0
    expected = tokens(profile)

    root = ET.parse(dump_path).getroot()
    found = {}
    for node in root.iter("node"):
        rid = node.get("resource-id", "")
        if not rid.startswith("com.melodix.music:id/"):
            continue
        name = rid.split("/", 1)[1]
        match = BOUNDS.match(node.get("bounds", ""))
        if not match:
            continue
        x1, y1, x2, y2 = (int(v) for v in match.groups())
        # Keep the first occurrence: the shell is drawn once.
        found.setdefault(name, {
            "px": {"x": x1, "y": y1, "width": x2 - x1, "height": y2 - y1},
            "text": node.get("text", ""),
        })

    measurements = []
    problems = []
    for table, required in ((REQUIRED, True), (OPTIONAL, False)):
        for view, (token, axis) in table.items():
            if view not in found:
                entry = {"view": view, "token": token, "axis": axis, "measured": False}
                measurements.append(entry)
                if required:
                    problems.append(f"{view} was not on screen")
                continue
            px = found[view]["px"][axis]
            measured_dp = px / scale
            want = expected[token]
            # getDimensionPixelSize rounds; allow one dp of rounding slack.
            ok = abs(measured_dp - want) <= 1.0
            measurements.append({
                "view": view, "token": token, "axis": axis, "measured": True,
                "px": px, "dp": round(measured_dp, 2), "expected_dp": want, "ok": ok,
            })
            if not ok:
                problems.append(f"{view}.{axis} = {measured_dp:.1f}dp, token {token} = {want}dp")

    report = {
        "schema_version": 1,
        "profile": profile,
        "density_dpi": density,
        "shell_present": "nativeRoot" in found,
        "screen_width_dp": round(found["nativeRoot"]["px"]["width"] / scale, 1)
        if "nativeRoot" in found else None,
        "measurements": measurements,
        "not_measured": [
            "full player (needs real playback)",
            "content shelves and covers (need a signed-in Spotify session)",
            "collection banner (needs a real playlist)",
        ],
        "problems": problems,
    }
    if "nativeRoot" not in found:
        problems.append("the native shell never appeared")

    pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                     encoding="utf-8")

    measured = [m for m in measurements if m["measured"]]
    summary = "; ".join(
        f"{m['view']}.{m['axis']}={m['dp']}dp(want {m['expected_dp']})" for m in measured
    ) or "no token-backed view was on screen"
    level = "error" if problems else "notice"
    # One consolidated annotation: GitHub caps annotations per step.
    print(f"::{level} title=UI metrics {profile}::"
          f"width={report['screen_width_dp']}dp; {summary}"
          + (f"; PROBLEMS: {' | '.join(problems)}" if problems else ""))

    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
