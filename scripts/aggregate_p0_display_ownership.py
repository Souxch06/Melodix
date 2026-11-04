#!/usr/bin/env python3
"""Combine two already-redacted phone/tablet display-ownership profile reports.

This helper never reads raw logcat, UI hierarchy text, screenshots, cookies,
tokens, Spotify account data, or private content. It accepts only the strict
sidecar schema described in docs/audits/melodix-phone-tablet-display-ownership-2026-11-02.md
and fails closed on any unexpected field, missing checkpoint, mismatched APK,
profile/configuration mismatch, or privacy-scan hit.

A validated combined report is evidence, not a P0 resolution.

Schema v2 separates the two questions that schema v1 conflated:

* At the 200 ms launch checkpoint the app may still be in its normal splash
  transition. Native ownership is therefore NOT required there. What is
  required is a *determinate* answer to "did Spotify Web take possession of the
  central surface?". `splash` and `native_shell` are positively distinguished
  from `web`, and an `undetermined` answer fails closed -- absence of data is
  never treated as absence of takeover.
* At the four settled checkpoints (1 s, 3 s, 8 s, 20 s) the full native owner
  verification is still required, including visibility, geometry and dock.

`p0_display_ownership_satisfied` is true only when both profiles report native
display ownership at all four settled checkpoints, no Spotify Web center
takeover at any of the five checkpoints, and every checkpoint of both profiles
is determinate.
"""
from __future__ import annotations

import argparse
import json
import pathlib
import re
import sys
from typing import Any

SOURCE_RE = re.compile(r"[0-9a-f]{40}\Z")
RUN_ID_RE = re.compile(r"[0-9]{1,20}\Z")
SHA256_RE = re.compile(r"[0-9a-f]{64}\Z")
SCHEMA_VERSION = 2
CHECKPOINTS = ("200ms", "1s", "3s", "8s", "20s")
TARGET_MS = {"200ms": 200, "1s": 1000, "3s": 3000, "8s": 8000, "20s": 20000}
LAUNCH_CHECKPOINT = "200ms"
SETTLED_CHECKPOINTS = ("1s", "3s", "8s", "20s")
MAX_OVERSHOOT_MS = 1500
PROFILES = ("phone", "tablet")
OWNERS = {"native", "web", "login", "unknown"}
ROUTES = {"home", "login", "search", "library", "detail", "player", "unknown"}
GUI_MODES = {"csshack", "bigwindow", "other", "unknown"}
ORIENTATIONS = {"portrait", "landscape"}
# Which surface actually owns the centre of the display, measured from the
# native view hierarchy (always available, even before any WebView exists).
CENTER_SURFACES = {"native_shell", "splash", "web", "unknown"}
# What the WebView DOM says about its own centre (may be unavailable early).
WEB_CENTER_CATEGORIES = {"spotify_web", "melodix_web", "login_web", "other_web", "unavailable"}
TAKEOVER_STATES = {"observed", "not_observed", "undetermined"}
DETERMINATE_TAKEOVER_STATES = {"observed", "not_observed"}
# Surfaces whose DOM classification proves Spotify Web owns the centre.
SPOTIFY_WEB_CATEGORIES = {"spotify_web"}
# Web surfaces that are legitimate for an unauthenticated Melodix session.
BENIGN_WEB_CATEGORIES = {"melodix_web", "login_web"}

REPORT_KEYS = {
    "schema_version",
    "profile",
    "source_commit",
    "run_id",
    "apk_sha256",
    "authenticated_spotify_test",
    "session_state",
    "timeline_origin",
    "device",
    "webview_viewport",
    "sf_config_gui_mode",
    "body_class_flags",
    "checkpoints",
    "owner_transitions",
}
DEVICE_KEYS = {
    "physical_width_px",
    "physical_height_px",
    "density_dpi",
    "width_dp",
    "height_dp",
    "smallest_screen_width_dp",
    "orientation",
}
VIEWPORT_KEYS = {
    "inner_width_css_px",
    "inner_height_css_px",
    "screen_width_css_px",
    "screen_height_css_px",
    "device_pixel_ratio",
}
BODY_FLAG_KEYS = {"melodix", "mobile"}
CHECKPOINT_KEYS = {
    "target_elapsed_ms",
    "observed_elapsed_ms",
    "native_root_visible",
    "webview_container_visible",
    "native_root_bounds_px",
    "webview_container_bounds_px",
    "display_owner",
    "route_category",
    "native_owner_verified",
    "webview_mounted_under_native_root",
    "center_surface_owner",
    "splash_transient",
    "web_center_category",
    "web_center_takeover_state",
    "web_center_probe_elapsed_ms",
}
TRANSITION_KEYS = {"elapsed_ms", "from_owner", "to_owner", "route_category"}

FORBIDDEN_PATTERNS = {
    "credential_marker": re.compile(
        r"(?i)access[_-]?token|refresh[_-]?token|authorization|set-cookie|cookie|bearer|client[_-]?secret|password"
    ),
    "uri": re.compile(r"(?i)(?:https?|wss?)://|\bspotify:"),
    "private_path": re.compile(r"/(?:data/(?:app|user|data)|storage/emulated)/"),
    "private_query": re.compile(r"[?&][^\s)>,]+"),
    "opaque_value": re.compile(r"(?<![A-Za-z0-9])[A-Za-z0-9_+/=-]{48,}(?![A-Za-z0-9])"),
    "email": re.compile(r"(?i)\b[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,190}\.[A-Z]{2,24}\b"),
}


def _require_int(value: Any, label: str, *, minimum: int = 0, maximum: int = 10_000_000) -> int:
    if not isinstance(value, int) or isinstance(value, bool) or not minimum <= value <= maximum:
        raise ValueError(f"invalid integer field: {label}")
    return value


def _require_number(value: Any, label: str, *, minimum: float = 0.0, maximum: float = 100000.0) -> float:
    if not isinstance(value, (int, float)) or isinstance(value, bool) or not minimum <= value <= maximum:
        raise ValueError(f"invalid numeric field: {label}")
    return float(value)


def _require_bool(value: Any, label: str) -> bool:
    if not isinstance(value, bool):
        raise ValueError(f"invalid boolean field: {label}")
    return value


def _require_bounds(value: Any, label: str) -> list[int] | None:
    if value is None:
        return None
    if not isinstance(value, list) or len(value) != 4:
        raise ValueError(f"invalid bounds field: {label}")
    parts = [_require_int(part, f"{label}[{index}]") for index, part in enumerate(value)]
    if parts[2] <= parts[0] or parts[3] <= parts[1]:
        raise ValueError(f"invalid bounds geometry: {label}")
    return parts


def _strip_provenance_digests(value: Any) -> Any:
    # apk_sha256 fields are required provenance digests, validated against
    # SHA256_RE and the expected APK before this scan. They are not credentials.
    if isinstance(value, dict):
        return {key: _strip_provenance_digests(item) for key, item in value.items() if key != "apk_sha256"}
    if isinstance(value, list):
        return [_strip_provenance_digests(item) for item in value]
    return value


def _privacy_scan(report: dict[str, Any]) -> None:
    payload = _strip_provenance_digests(report)
    encoded = json.dumps(payload, ensure_ascii=True, sort_keys=True)
    hits = [name for name, pattern in FORBIDDEN_PATTERNS.items() if pattern.search(encoded)]
    if hits:
        raise ValueError("profile report failed privacy scan: " + ",".join(hits))


def _expected_takeover_state(center_surface: str, web_category: str) -> str:
    """Derive the only acceptable takeover verdict from the measured surfaces.

    The native hierarchy is authoritative about *whether* the WebView owns the
    centre at all. When it does not, "not_observed" is a positive measurement,
    not an absence of data. When it does, the DOM must classify the content;
    without that classification the answer stays "undetermined" and fails closed.
    """
    if center_surface in {"native_shell", "splash"}:
        return "not_observed"
    if center_surface == "web":
        if web_category in SPOTIFY_WEB_CATEGORIES:
            return "observed"
        if web_category in BENIGN_WEB_CATEGORIES:
            return "not_observed"
        return "undetermined"
    return "undetermined"


def _validate_checkpoint(label: str, checkpoint: Any, previous_observed_ms: int) -> int:
    if not isinstance(checkpoint, dict) or set(checkpoint) != CHECKPOINT_KEYS:
        raise ValueError(f"checkpoint does not match exact schema: {label}")
    target = _require_int(checkpoint["target_elapsed_ms"], f"{label}.target_elapsed_ms")
    if target != TARGET_MS[label]:
        raise ValueError(f"checkpoint target mismatch: {label}")
    observed = _require_int(checkpoint["observed_elapsed_ms"], f"{label}.observed_elapsed_ms")
    if observed < target or observed > target + MAX_OVERSHOOT_MS:
        raise ValueError(f"checkpoint observation is not launch-relative within tolerance: {label}")
    if observed < previous_observed_ms:
        raise ValueError(f"checkpoint observations are not monotonic: {label}")
    probe_elapsed = _require_int(checkpoint["web_center_probe_elapsed_ms"], f"{label}.web_center_probe_elapsed_ms")
    if probe_elapsed < observed or probe_elapsed > target + MAX_OVERSHOOT_MS:
        raise ValueError(f"web centre probe is not inside the launch-relative window: {label}")
    _require_bool(checkpoint["native_root_visible"], f"{label}.native_root_visible")
    _require_bool(checkpoint["webview_container_visible"], f"{label}.webview_container_visible")
    _require_bounds(checkpoint["native_root_bounds_px"], f"{label}.native_root_bounds_px")
    _require_bounds(checkpoint["webview_container_bounds_px"], f"{label}.webview_container_bounds_px")
    if checkpoint["display_owner"] not in OWNERS:
        raise ValueError(f"invalid display owner: {label}")
    if checkpoint["route_category"] not in ROUTES:
        raise ValueError(f"invalid route category: {label}")
    _require_bool(checkpoint["native_owner_verified"], f"{label}.native_owner_verified")
    _require_bool(checkpoint["webview_mounted_under_native_root"], f"{label}.webview_mounted_under_native_root")

    center_surface = checkpoint["center_surface_owner"]
    if center_surface not in CENTER_SURFACES:
        raise ValueError(f"invalid centre surface owner: {label}")
    splash_transient = _require_bool(checkpoint["splash_transient"], f"{label}.splash_transient")
    if splash_transient != (center_surface == "splash"):
        raise ValueError(f"splash transient flag contradicts the measured centre surface: {label}")
    web_category = checkpoint["web_center_category"]
    if web_category not in WEB_CENTER_CATEGORIES:
        raise ValueError(f"invalid web centre category: {label}")
    takeover_state = checkpoint["web_center_takeover_state"]
    if takeover_state not in TAKEOVER_STATES:
        raise ValueError(f"invalid web centre takeover state: {label}")
    if takeover_state != _expected_takeover_state(center_surface, web_category):
        raise ValueError(f"web centre takeover state contradicts the measured surfaces: {label}")
    # A native owner can never be "verified" while the WebView owns the centre.
    if checkpoint["native_owner_verified"] is True and center_surface != "native_shell":
        raise ValueError(f"native owner verified without a native centre surface: {label}")
    return observed


def _validate_profile(path: pathlib.Path, *, expected_profile: str, source_ref: str, run_id: str, apk_sha256: str) -> dict[str, Any]:
    try:
        report = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise ValueError("redacted profile report is unreadable") from exc
    if not isinstance(report, dict) or set(report) != REPORT_KEYS:
        raise ValueError("redacted profile report does not match the exact sidecar schema")
    if report["schema_version"] != SCHEMA_VERSION:
        raise ValueError("unsupported profile report schema")
    if report["profile"] != expected_profile:
        raise ValueError("profile report does not match the requested profile")
    if report["source_commit"] != source_ref or report["run_id"] != run_id or report["apk_sha256"] != apk_sha256:
        raise ValueError("profile report provenance mismatch")
    if report["authenticated_spotify_test"] != "not_performed":
        raise ValueError("authenticated Spotify test is not permitted in this comparison")
    if report["session_state"] != "unauthenticated":
        raise ValueError("comparison requires an unauthenticated session state")
    if report["timeline_origin"] != "app_launch":
        raise ValueError("timeline must be launch-relative, not post-stabilization")
    if report["sf_config_gui_mode"] not in GUI_MODES:
        raise ValueError("invalid SF_CONFIG.guiMode category")

    device = report["device"]
    if not isinstance(device, dict) or set(device) != DEVICE_KEYS:
        raise ValueError("device metrics do not match exact schema")
    for key in ("physical_width_px", "physical_height_px", "density_dpi", "width_dp", "height_dp", "smallest_screen_width_dp"):
        _require_int(device[key], f"device.{key}", minimum=1)
    if device["orientation"] not in ORIENTATIONS:
        raise ValueError("invalid device orientation")
    smallest = device["smallest_screen_width_dp"]
    if expected_profile == "phone" and smallest >= 600:
        raise ValueError("phone profile must have smallestScreenWidthDp below 600")
    if expected_profile == "tablet" and smallest < 600:
        raise ValueError("tablet profile must have smallestScreenWidthDp at least 600")

    viewport = report["webview_viewport"]
    if not isinstance(viewport, dict) or set(viewport) != VIEWPORT_KEYS:
        raise ValueError("WebView viewport metrics do not match exact schema")
    for key in ("inner_width_css_px", "inner_height_css_px", "screen_width_css_px", "screen_height_css_px"):
        _require_number(viewport[key], f"webview_viewport.{key}", minimum=1.0)
    _require_number(viewport["device_pixel_ratio"], "webview_viewport.device_pixel_ratio", minimum=0.1, maximum=16.0)

    flags = report["body_class_flags"]
    if not isinstance(flags, dict) or set(flags) != BODY_FLAG_KEYS:
        raise ValueError("body class flags do not match exact schema")
    for key in BODY_FLAG_KEYS:
        _require_bool(flags[key], f"body_class_flags.{key}")

    checkpoints = report["checkpoints"]
    if not isinstance(checkpoints, dict) or set(checkpoints) != set(CHECKPOINTS):
        raise ValueError("profile report must contain exactly the five launch checkpoints")
    previous = 0
    for label in CHECKPOINTS:
        previous = _validate_checkpoint(label, checkpoints[label], previous)

    transitions = report["owner_transitions"]
    if not isinstance(transitions, list) or len(transitions) > 64:
        raise ValueError("invalid owner transition list")
    previous_elapsed = 0
    for index, transition in enumerate(transitions):
        if not isinstance(transition, dict) or set(transition) != TRANSITION_KEYS:
            raise ValueError(f"owner transition does not match exact schema: {index}")
        elapsed = _require_int(transition["elapsed_ms"], f"owner_transitions[{index}].elapsed_ms")
        if elapsed < previous_elapsed:
            raise ValueError(f"owner transitions are not monotonic: {index}")
        previous_elapsed = elapsed
        if transition["from_owner"] not in OWNERS or transition["to_owner"] not in OWNERS:
            raise ValueError(f"invalid owner transition category: {index}")
        if transition["route_category"] not in ROUTES:
            raise ValueError(f"invalid owner transition route: {index}")

    _privacy_scan(report)
    return report


def _profile_verdict(report: dict[str, Any]) -> dict[str, Any]:
    checkpoints = report["checkpoints"]
    # Native ownership is required at the four settled checkpoints only. At
    # 200 ms the app may legitimately still be in its splash transition.
    native_all = all(
        checkpoints[label]["display_owner"] == "native"
        and checkpoints[label]["native_owner_verified"] is True
        and checkpoints[label]["native_root_visible"] is True
        for label in SETTLED_CHECKPOINTS
    )
    states = {label: checkpoints[label]["web_center_takeover_state"] for label in CHECKPOINTS}
    web_takeover = any(
        states[label] == "observed" or checkpoints[label]["display_owner"] == "web"
        for label in CHECKPOINTS
    )
    undetermined = [label for label in CHECKPOINTS if states[label] not in DETERMINATE_TAKEOVER_STATES]
    launch = checkpoints[LAUNCH_CHECKPOINT]
    return {
        "native_owner_observed_at_all_checkpoints": native_all,
        "native_owner_required_checkpoints": list(SETTLED_CHECKPOINTS),
        "web_takeover_observed": web_takeover,
        "launch_checkpoint_center_surface": launch["center_surface_owner"],
        "launch_checkpoint_splash_transient": launch["splash_transient"],
        "launch_checkpoint_web_center_takeover_state": states[LAUNCH_CHECKPOINT],
        "undetermined_checkpoints": undetermined,
        "all_checkpoints_determinate": not undetermined,
    }


def build_report(args: argparse.Namespace) -> dict[str, Any]:
    source_ref = args.source_ref.lower()
    run_id = args.run_id
    apk_sha256 = args.apk_sha256.lower()
    if not SOURCE_RE.fullmatch(source_ref):
        raise ValueError("source_ref must be a full lowercase commit SHA")
    if not RUN_ID_RE.fullmatch(run_id):
        raise ValueError("run_id must be a numeric CI run identifier")
    if not SHA256_RE.fullmatch(apk_sha256):
        raise ValueError("apk_sha256 must be a lowercase SHA-256 digest")

    phone = _validate_profile(pathlib.Path(args.phone_report), expected_profile="phone", source_ref=source_ref, run_id=run_id, apk_sha256=apk_sha256)
    tablet = _validate_profile(pathlib.Path(args.tablet_report), expected_profile="tablet", source_ref=source_ref, run_id=run_id, apk_sha256=apk_sha256)

    phone_verdict = _profile_verdict(phone)
    tablet_verdict = _profile_verdict(tablet)
    # No success may be inferred from missing data: every checkpoint of both
    # profiles must carry a determinate takeover verdict.
    satisfied = (
        phone_verdict["native_owner_observed_at_all_checkpoints"]
        and tablet_verdict["native_owner_observed_at_all_checkpoints"]
        and not phone_verdict["web_takeover_observed"]
        and not tablet_verdict["web_takeover_observed"]
        and phone_verdict["all_checkpoints_determinate"]
        and tablet_verdict["all_checkpoints_determinate"]
    )
    report = {
        "schema_version": SCHEMA_VERSION,
        "source_commit": source_ref,
        "comparison_run_id": run_id,
        "apk_sha256": apk_sha256,
        "authenticated_spotify_test": "not_performed",
        "session_state": "unauthenticated",
        "profiles": {"phone": phone, "tablet": tablet},
        "comparison": {
            "same_apk_sha256": True,
            "same_source_commit": True,
            "five_launch_checkpoints_per_profile": True,
            "launch_checkpoint": LAUNCH_CHECKPOINT,
            "native_owner_required_checkpoints": list(SETTLED_CHECKPOINTS),
            "phone": phone_verdict,
            "tablet": tablet_verdict,
            "p0_display_ownership_satisfied": satisfied,
            "p0_resolution_claimed": False,
        },
    }
    _privacy_scan(report)
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-ref", required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--apk-sha256", required=True)
    parser.add_argument("--phone-report", required=True)
    parser.add_argument("--tablet-report", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    output = pathlib.Path(args.output)
    try:
        report = build_report(args)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    except (OSError, ValueError) as exc:
        output.unlink(missing_ok=True)
        print(f"redacted_display_ownership_report=failed; reason={exc}", file=sys.stderr)
        return 1
    comparison = report["comparison"]
    print(
        "redacted_display_ownership_report=validated; "
        f"phone_native_owner={str(comparison['phone']['native_owner_observed_at_all_checkpoints']).lower()}; "
        f"tablet_native_owner={str(comparison['tablet']['native_owner_observed_at_all_checkpoints']).lower()}; "
        f"web_takeover_observed={str(comparison['phone']['web_takeover_observed'] or comparison['tablet']['web_takeover_observed']).lower()}; "
        f"launch_200ms_takeover_phone={comparison['phone']['launch_checkpoint_web_center_takeover_state']}; "
        f"launch_200ms_takeover_tablet={comparison['tablet']['launch_checkpoint_web_center_takeover_state']}; "
        f"all_checkpoints_determinate={str(comparison['phone']['all_checkpoints_determinate'] and comparison['tablet']['all_checkpoints_determinate']).lower()}; "
        f"p0_display_ownership_satisfied={str(comparison['p0_display_ownership_satisfied']).lower()}; "
        "raw_ui_or_account_data_retained=false"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
