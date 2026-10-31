#!/usr/bin/env python3
"""Redact Android UIAutomator output and verify Preview screenshot pixels.

Only booleans, view classes/resource ids, and pixel bounds are written. Raw
Spotify text, account data, URLs, and the unredacted XML are never uploaded.
"""

import json
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

from PIL import Image

BOUNDS_RE = re.compile(r"\[(\d+),(\d+)\]\[(\d+),(\d+)\]")


def parse_bounds(value):
    match = BOUNDS_RE.fullmatch(value or "")
    if not match:
        return None
    return tuple(int(part) for part in match.groups())


def inspect_screenshot(path, bounds=None, region_name="region"):
    image = Image.open(path).convert("RGB")
    width, height = image.size
    thumbnail = image.copy()
    thumbnail.thumbnail((256, 512))
    colors = thumbnail.getcolors(maxcolors=256 * 512) or []
    unique_colors = len(colors)
    thumbnail.close()
    result = {
        "width_px": width,
        "height_px": height,
        "sampled_unique_colors": unique_colors,
        "nonuniform_screen_pixels": unique_colors > 8,
    }
    if bounds:
        left, top, right, bottom = bounds
        left, top = max(0, left), max(0, top)
        right, bottom = min(width, right), min(height, bottom)
        if right <= left or bottom <= top:
            raise SystemExit(f"The visible {region_name} bounds do not intersect the screenshot")
        crop = image.crop((left, top, right, bottom))
        crop.thumbnail((256, 512))
        pixels = list(crop.getdata())
        distinct = len(set(pixels))
        bright = sum(1 for red, green, blue in pixels if max(red, green, blue) >= 150)
        result[f"{region_name}_crop_unique_colors"] = distinct
        result[f"{region_name}_crop_bright_pixels"] = bright
        result[f"{region_name}_crop_sampled_pixels"] = len(pixels)
        result[f"{region_name}_pixels_rendered"] = distinct > 2 and bright > 0
        crop.close()
    image.close()
    return result


def main():
    if len(sys.argv) != 5 or sys.argv[1] not in {"login", "empty-home"}:
        raise SystemExit("usage: inspect_hierarchy.py login|empty-home WINDOW.xml SCREEN.png SUMMARY.json")
    phase, xml_path, screenshot_path, summary_path = sys.argv[1:]
    xml_root = ET.parse(xml_path).getroot()

    nodes = []
    webview_bounds = None
    ids = set()
    visible_texts = []
    webview_class_visible = False
    for node in xml_root.iter():
        resource_id = node.get("resource-id", "")
        class_name = node.get("class", "")
        text = node.get("text", "")
        content_description = node.get("content-desc", "")
        bounds = parse_bounds(node.get("bounds", ""))
        has_visible_bounds = bool(bounds and bounds[2] > bounds[0] and bounds[3] > bounds[1])
        visible_to_user_attr = node.get("visible-to-user")
        visible_to_user = visible_to_user_attr is None or visible_to_user_attr.lower() == "true"
        accessibility_visible = has_visible_bounds and visible_to_user
        if resource_id:
            ids.add(resource_id)
        if text or content_description:
            visible_texts.append((text + " " + content_description).lower())
        if "WebView" in class_name and accessibility_visible:
            webview_class_visible = True
            webview_bounds = bounds

        relevant = (
            any(name in resource_id for name in (
                "nativeRoot", "nativeHomeTab", "nativeRowsScroll", "webViewContainer", "splashOverlay"
            ))
            or ("WebView" in class_name and has_visible_bounds)
        )
        if relevant:
            nodes.append({
                "class": class_name,
                "resource_id": resource_id,
                "bounds_px": list(bounds) if bounds else None,
                "visible_bounds": has_visible_bounds,
                "visible_to_user": visible_to_user,
                "accessibility_visible": accessibility_visible,
                "text_present": bool(text),
            })

    resource_ids = list(ids)
    native_root_present = any("nativeRoot" in value for value in resource_ids)
    native_home_tab_present = any("nativeHomeTab" in value for value in resource_ids)
    rows_scroll_present = any("nativeRowsScroll" in value for value in resource_ids)
    native_root_visible = any(
        "nativeRoot" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    native_home_tab_visible = any(
        "nativeHomeTab" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    rows_scroll_visible = any(
        "nativeRowsScroll" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    web_container_present = any("webViewContainer" in value for value in resource_ids)
    splash_present = any("splashOverlay" in value for value in resource_ids)
    screen_text = " ".join(visible_texts)
    login_words_visible = any(
        phrase in screen_text
        for phrase in ("spotify", "log in", "sign in", "s'inscrire", "se connecter", "network error")
    )

    phase_name = "unauthenticated_webview_surface" if phase == "login" else "empty_home_webview_fallback"
    summary = {
        "phase": phase_name,
        "ui_hierarchy_nodes_redacted": nodes,
        "native_root_accessibility_node_present": native_root_present,
        "native_root_accessibility_visible": native_root_visible,
        "native_home_tab_accessibility_node_present": native_home_tab_present,
        "native_home_tab_accessibility_visible": native_home_tab_visible,
        "native_rows_scroll_node_present": rows_scroll_present,
        "native_rows_scroll_accessibility_visible": rows_scroll_visible,
        "webview_container_node_present": web_container_present,
        "webview_accessibility_node_visible": webview_class_visible,
        "splash_accessibility_node_present": splash_present,
        "login_or_network_text_detected": login_words_visible,
    }

    if not webview_class_visible or webview_bounds is None:
        raise SystemExit("The UI hierarchy has no visible, bounded WebView node; container presence is insufficient")
    if native_root_visible or native_home_tab_visible or rows_scroll_visible:
        phase_label = "unauthenticated login" if phase == "login" else "empty-Home fallback"
        raise SystemExit(f"Native Home is visible over the WebView in the {phase_label} hierarchy")

    if phase == "login":
        # A visible WebView node does not by itself prove that the login DOM
        # exists. The Android harness separately checks the DOM and records only
        # a boolean; this hierarchy field is strictly text-accessibility evidence.
        summary["login_text_detected_in_hierarchy"] = login_words_visible
        region_name = "webview"
    else:
        summary["playlist_payload_injected"] = False
        summary["native_root_hidden"] = not native_root_visible
        summary["home_tabs_hidden"] = not native_home_tab_visible
        region_name = "webview"

    summary["screenshot_pixels"] = inspect_screenshot(
        screenshot_path, webview_bounds, region_name
    )
    summary["webview_accessibility_bounds_px"] = list(webview_bounds)
    if not summary["screenshot_pixels"].get(f"{region_name}_pixels_rendered"):
        raise SystemExit("The visible WebView bounds have no rendered screenshot pixels")

    Path(summary_path).write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    if phase == "login":
        print("Unauthenticated first-launch WebView: visible bounds and screenshot pixels verified; raw text redacted.")
    else:
        print("Empty-Home fallback hierarchy: native Home hidden and visible WebView screenshot pixels verified; no playlist data.")


if __name__ == "__main__":
    main()
