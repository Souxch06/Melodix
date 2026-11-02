#!/usr/bin/env python3
"""Redact Android UIAutomator output and verify Preview screenshot pixels.

Only booleans, safe view classes/packages/resource ids, counts, and pixel bounds
are written. Raw Spotify text, account data, URLs, and unredacted XML are never
uploaded.
"""

import json
import re
import sys
import unicodedata
import xml.etree.ElementTree as ET
from pathlib import Path

from PIL import Image

BOUNDS_RE = re.compile(r"\[(\d+),(\d+)\]\[(\d+),(\d+)\]")
SAFE_IDENTIFIER_RE = re.compile(r"[^A-Za-z0-9_.$:/-]")
HOME_STATUS_MARKERS = (
    "connexion a spotify",
    "connexion spotify non confirmee",
    "connexion spotify impossible a verifier",
    "verification de la session",
    "etat de connexion non confirme",
    "chargement de votre accueil",
    "votre accueil n'a pas pu etre charge",
    "les donnees spotify ne sont pas disponibles",
    "les donnees n'ont pas pu etre lues",
    "touchez pour reessayer",
)
HOME_ERROR_MARKERS = (
    "votre accueil n'a pas pu etre charge",
    "les donnees spotify ne sont pas disponibles",
    "les donnees n'ont pas pu etre lues",
    "touchez pour reessayer",
)


def normalized_text(value):
    normalized = unicodedata.normalize("NFKD", value).casefold()
    return "".join(character for character in normalized if not unicodedata.combining(character))


def is_home_status_message(value):
    normalized = normalized_text(value)
    return any(marker in normalized for marker in HOME_STATUS_MARKERS)


def is_home_error_message(value):
    normalized = normalized_text(value)
    return any(marker in normalized for marker in HOME_ERROR_MARKERS)


def safe_identifier(value):
    if not value:
        return None
    return SAFE_IDENTIFIER_RE.sub("?", value)[:160]


def parse_bounds(value):
    match = BOUNDS_RE.fullmatch(value or "")
    if not match:
        return None
    return tuple(int(part) for part in match.groups())


def fail(reason):
    # Surface a bounded, redacted cause in the GitHub check annotation as well
    # as stderr. This keeps a failed UI run diagnosable without uploading raw XML.
    print(f"::error title=Android UI hierarchy check::{reason}")
    raise SystemExit(reason)


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
        bright_pixel_threshold = 8 if region_name == "home_status" else 0
        result[f"{region_name}_bright_pixel_threshold"] = bright_pixel_threshold
        result[f"{region_name}_pixels_rendered"] = distinct > 2 and bright > bright_pixel_threshold
        crop.close()
    image.close()
    return result


def main():
    if len(sys.argv) != 5 or sys.argv[1] not in {"login", "empty-home", "home-status", "native-route", "web-home"}:
        raise SystemExit("usage: inspect_hierarchy.py login|empty-home|home-status|native-route|web-home WINDOW.xml SCREEN.png SUMMARY.json")
    phase, xml_path, screenshot_path, summary_path = sys.argv[1:]
    xml_root = ET.parse(xml_path).getroot()
    hierarchy_nodes = [node for node in xml_root.iter() if node.tag == "node"]
    top_node = hierarchy_nodes[0] if hierarchy_nodes else None
    hierarchy_top_class = safe_identifier(top_node.get("class")) if top_node is not None else None
    hierarchy_top_package = safe_identifier(top_node.get("package")) if top_node is not None else None
    hierarchy_top_resource_id = safe_identifier(top_node.get("resource-id")) if top_node is not None else None

    nodes = []
    webview_bounds = None
    ids = set()
    visible_texts = []
    webview_class_present = False
    webview_bounds_present = False
    webview_visible_to_user = False
    webview_class_visible = False
    home_status_bounds = None
    home_status_message_accessible = False
    home_status_message_visible = False
    home_error_message_accessible = False
    home_error_message_visible = False
    web_home_brand_accessible = False
    web_home_brand_visible = False
    web_home_fixture_playlist_title_visible = False
    web_home_fixture_album_title_visible = False
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
        # Inspect this bounded label allowlist in-process; never export raw UI text.
        status_text = (text + " " + content_description).lower()
        if is_home_status_message(status_text):
            home_status_message_accessible = True
            if accessibility_visible:
                home_status_message_visible = True
                home_status_bounds = bounds
        if is_home_error_message(status_text):
            home_error_message_accessible = True
            if accessibility_visible:
                home_error_message_visible = True
        if "melodix" in status_text:
            web_home_brand_accessible = True
            web_home_brand_visible = web_home_brand_visible or accessibility_visible
        if "route fixture playlist" in status_text and accessibility_visible:
            web_home_fixture_playlist_title_visible = True
        if "route fixture album" in status_text and accessibility_visible:
            web_home_fixture_album_title_visible = True
        if "WebView" in class_name:
            webview_class_present = True
            webview_bounds_present = webview_bounds_present or has_visible_bounds
            webview_visible_to_user = webview_visible_to_user or visible_to_user
            if accessibility_visible:
                webview_class_visible = True
                webview_bounds = bounds

        relevant = (
            any(name in resource_id for name in (
                "nativeRoot", "nativeHomeTab", "nativeRowsScroll", "webViewContainer", "splashOverlay"
            ))
            or ("WebView" in class_name and has_visible_bounds)
            or (is_home_status_message(status_text) and has_visible_bounds)
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
    native_root_bounds = next(
        (node["bounds_px"] for node in nodes
         if "nativeRoot" in node["resource_id"] and node["accessibility_visible"]),
        None,
    )
    native_home_tab_visible = any(
        "nativeHomeTab" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    rows_scroll_visible = any(
        "nativeRowsScroll" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    web_container_present = any("webViewContainer" in value for value in resource_ids)
    web_container_visible = any(
        "webViewContainer" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    splash_present = any("splashOverlay" in value for value in resource_ids)
    splash_visible = any(
        "splashOverlay" in node["resource_id"] and node["accessibility_visible"] for node in nodes
    )
    screen_text = " ".join(visible_texts)
    login_words_visible = any(
        phrase in screen_text
        for phrase in ("log in", "sign in", "s'inscrire", "se connecter", "connexion", "network error")
    )

    phase_name = {
        "login": "unauthenticated_webview_surface",
        "empty-home": "empty_home_native_error_state",
        "home-status": "native_home_status_panel",
        "native-route": "native_route_owner_shell",
        "web-home": "web_home_renderer_on_app_route",
    }[phase]
    summary = {
        "phase": phase_name,
        "ui_hierarchy_node_count": len(hierarchy_nodes),
        "ui_hierarchy_top_node_class": hierarchy_top_class,
        "ui_hierarchy_top_node_package": hierarchy_top_package,
        "ui_hierarchy_top_node_resource_id": hierarchy_top_resource_id,
        "ui_hierarchy_nodes_redacted": nodes,
        "native_root_accessibility_node_present": native_root_present,
        "native_root_accessibility_visible": native_root_visible,
        "native_root_accessibility_bounds_px": native_root_bounds,
        "native_home_tab_accessibility_node_present": native_home_tab_present,
        "native_home_tab_accessibility_visible": native_home_tab_visible,
        "native_rows_scroll_node_present": rows_scroll_present,
        "native_rows_scroll_accessibility_visible": rows_scroll_visible,
        "webview_container_node_present": web_container_present,
        "webview_container_accessibility_visible": web_container_visible,
        "webview_accessibility_node_present": webview_class_present,
        "webview_accessibility_node_has_bounds": webview_bounds_present,
        "webview_accessibility_node_visible_to_user": webview_visible_to_user,
        "webview_accessibility_node_visible": webview_class_visible,
        "splash_accessibility_node_present": splash_present,
        "splash_accessibility_visible": splash_visible,
        "login_or_network_text_detected": login_words_visible,
        "home_status_message_accessible": home_status_message_accessible,
        "home_status_message_visible_to_user": home_status_message_visible,
        "home_error_message_accessible": home_error_message_accessible,
        "home_error_message_visible_to_user": home_error_message_visible,
        "home_status_accessibility_bounds_px": list(home_status_bounds) if home_status_bounds else None,
        "web_home_brand_accessible": web_home_brand_accessible,
        "web_home_brand_visible_to_user": web_home_brand_visible,
        "web_home_fixture_playlist_title_visible_to_user": web_home_fixture_playlist_title_visible,
        "web_home_fixture_album_title_visible_to_user": web_home_fixture_album_title_visible,
    }

    if phase == "login":
        # A visible WebView node does not by itself prove that the login DOM
        # exists. The Android harness separately checks the DOM and records only
        # a boolean; this hierarchy field is strictly text-accessibility evidence.
        summary["login_text_detected_in_hierarchy"] = login_words_visible
    elif phase == "empty-home":
        summary["playlist_payload_injected"] = False
        summary["native_home_error_status_expected"] = True
    elif phase == "home-status":
        summary["playlist_payload_injected"] = False
        summary["native_root_hidden"] = not native_root_visible
        summary["home_tabs_hidden"] = not native_home_tab_visible
    elif phase == "native-route":
        summary["playlist_payload_injected"] = False
        summary["authenticated_home_test_performed"] = False
        summary["native_route_shell_owner_expected"] = True
    else:
        summary["test_only_resource_links_present"] = bool(
            web_home_fixture_playlist_title_visible and web_home_fixture_album_title_visible
        )
        summary["fixture_brand_and_link_titles_accessible"] = bool(
            web_home_brand_visible and web_home_fixture_playlist_title_visible and web_home_fixture_album_title_visible
        )
        summary["authenticated_home_test_performed"] = False

    native_status_phase = phase in {"empty-home", "home-status"}
    region_name = (
        "home_status" if native_status_phase
        else "native_root" if phase == "native-route"
        else "webview"
    )
    region_bounds = (
        home_status_bounds if native_status_phase
        else native_root_bounds if phase == "native-route"
        else webview_bounds
    )
    summary["screenshot_pixels"] = inspect_screenshot(
        screenshot_path, region_bounds, region_name
    )
    summary[f"{region_name}_accessibility_bounds_px"] = (
        list(region_bounds) if region_bounds else None
    )
    Path(summary_path).write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    if phase in {"empty-home", "home-status"}:
        if not home_status_message_visible or home_status_bounds is None:
            fail("visible_native_home_status_accessibility_node_missing")
        if phase == "empty-home" and not home_error_message_visible:
            fail("native_empty_home_error_and_retry_message_missing")
        if not native_root_visible or not native_home_tab_visible or splash_visible:
            fail(
                "native_home_status_surface_not_visible;"
                f" native_root_visible={native_root_visible};"
                f" home_tab_visible={native_home_tab_visible};"
                f" splash_visible={splash_visible}"
            )
        if not web_container_present or not webview_class_present:
            fail(
                "mounted_webview_under_native_home_surface_not_observed;"
                f" web_container_present={web_container_present};"
                f" web_container_visible={web_container_visible};"
                f" webview_class_present={webview_class_present};"
                f" webview_class_visible={webview_class_visible};"
                f" webview_bounds_present={webview_bounds_present};"
                f" native_root_visible={native_root_visible};"
                f" hierarchy_node_count={len(hierarchy_nodes)}"
            )
        if not summary["screenshot_pixels"].get("home_status_pixels_rendered"):
            fail("home_status_bounds_have_no_rendered_screenshot_pixels")
        if phase == "empty-home":
            print("Empty Home: native error/retry status, native tabs, and screenshot pixels verified; WebView remains mounted; no playlist data.")
            print(
                "::notice title=Android native empty-Home visibility::"
                f"native_error_visible={home_error_message_visible}; "
                f"native_root_visible={native_root_visible}; home_tab_visible={native_home_tab_visible}; "
                f"splash_visible={splash_visible}; webview_mounted={webview_class_present}; "
                f"webview_container_present={web_container_present}; playlist_payload_injected=false; "
                f"status_pixels_rendered={summary['screenshot_pixels']['home_status_pixels_rendered']}; "
                f"status_crop_unique_colors={summary['screenshot_pixels']['home_status_crop_unique_colors']}"
            )
        else:
            print("Native Home status fixture: distinct visible status node and screenshot pixels verified; no playlist data.")
            print(
                "::notice title=Android native Home status visibility::"
                f"status_accessibility_visible={home_status_message_visible}; "
                f"native_root_visible={native_root_visible}; home_tab_visible={native_home_tab_visible}; "
                f"splash_visible={splash_visible}; playlist_payload_injected=false; "
                f"status_pixels_rendered={summary['screenshot_pixels']['home_status_pixels_rendered']}; "
                f"status_crop_unique_colors={summary['screenshot_pixels']['home_status_crop_unique_colors']}; "
                f"status_crop_bright_pixels={summary['screenshot_pixels']['home_status_crop_bright_pixels']}"
            )
        return

    if phase == "native-route":
        if not native_root_visible or not native_home_tab_visible or splash_visible:
            fail(
                "native_route_owner_surface_not_visible;"
                f" native_root_visible={native_root_visible};"
                f" home_tab_visible={native_home_tab_visible};"
                f" splash_visible={splash_visible}"
            )
        if not web_container_present or not webview_class_present:
            fail("native_route_webview_not_mounted_under_shell")
        if not summary["screenshot_pixels"].get("native_root_pixels_rendered"):
            fail("native_route_root_bounds_have_no_rendered_screenshot_pixels")
        print("Native route shell: nativeRoot, dock, mounted WebView, and screenshot pixels verified; account content not tested.")
        print(
            "::notice title=Android native route owner visibility::"
            f"native_root_visible={native_root_visible}; home_tab_visible={native_home_tab_visible}; "
            f"splash_visible={splash_visible}; webview_mounted={webview_class_present}; "
            f"native_root_pixels_rendered={summary['screenshot_pixels']['native_root_pixels_rendered']}"
        )
        return

    if phase == "web-home":
        if not web_home_brand_visible or not web_home_fixture_playlist_title_visible or not web_home_fixture_album_title_visible:
            fail(
                "web_home_brand_or_card_title_missing_from_accessibility_hierarchy;"
                f" brand_visible={web_home_brand_visible};"
                f" playlist_title_visible={web_home_fixture_playlist_title_visible};"
                f" album_title_visible={web_home_fixture_album_title_visible}"
            )

    if not webview_class_visible or webview_bounds is None:
        fail(
            "visible_bounded_webview_node_missing;"
            f" node_present={webview_class_present};"
            f" bounds_present={webview_bounds_present};"
            f" visible_to_user={webview_visible_to_user};"
            f" hierarchy_nodes={len(hierarchy_nodes)};"
            f" top_node_class={hierarchy_top_class or 'none'};"
            f" top_node_package={hierarchy_top_package or 'none'};"
            f" container_present={web_container_present};"
            f" container_visible={web_container_visible};"
            f" splash_visible={splash_visible};"
            f" native_root_visible={native_root_visible};"
            f" screen_nonuniform={summary['screenshot_pixels']['nonuniform_screen_pixels']};"
            f" screen_sampled_colors={summary['screenshot_pixels']['sampled_unique_colors']}"
        )
    if splash_visible:
        fail("startup_splash_accessibility_visible")
    if native_root_visible or native_home_tab_visible or rows_scroll_visible:
        fail("native_home_accessibility_visible_over_webview")
    if not summary["screenshot_pixels"].get(f"{region_name}_pixels_rendered"):
        fail("webview_bounds_have_no_rendered_screenshot_pixels")

    pixel_report = summary["screenshot_pixels"]
    if phase == "login":
        print("Unauthenticated first-launch WebView: visible bounds and unobscured screenshot pixels verified; raw text redacted.")
        print(
            "::notice title=Android login surface visibility::"
            f"webview_accessible=true; splash_visible=false; native_home_visible=false; "
            f"login_accessibility_text={login_words_visible}; "
            f"webview_pixels_rendered={pixel_report['webview_pixels_rendered']}; "
            f"webview_crop_unique_colors={pixel_report['webview_crop_unique_colors']}; "
            f"webview_crop_bright_pixels={pixel_report['webview_crop_bright_pixels']}"
        )
    elif phase == "web-home":
        print("Packaged Web Home renderer: /app route, MELODIX and both test-only card titles are visible in Android's hierarchy and screenshot.")
        print(
            "::notice title=Android Web Home renderer visibility::"
            f"webview_accessible=true; native_home_visible=false; splash_visible=false; "
            f"melodix_brand_accessible={web_home_brand_visible}; "
            f"test_only_card_titles_visible={web_home_fixture_playlist_title_visible and web_home_fixture_album_title_visible}; "
            f"webview_pixels_rendered={pixel_report['webview_pixels_rendered']}; "
            f"webview_crop_unique_colors={pixel_report['webview_crop_unique_colors']}"
        )
    else:
        print("Web Home renderer: visible test-only fixture content verified.")


if __name__ == "__main__":
    main()
