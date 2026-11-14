#!/usr/bin/env python3
"""Make a separate Preview project from d0f206b0 and the complete Glass CSS.

Run only on a disposable copy. This intentionally preserves historical login,
headers, WebView behavior and runtime assets. Never run against the normal app.
"""
import hashlib
import pathlib
import re
import sys
import xml.etree.ElementTree as ET

BASE = "d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6"
EXPECTED = {
    "assets/spotify_bridge.js": "0681f77be1cfe480b87a859b54e3865c3975577478d45469a72265878bdb4395",
    "assets/native_ui_shell.js": "a6bea27c1b715b02f50e9a5b68e58a751f4d896a65e6c32057798aed47930906",
}
CSS_SHA = "0d1ab6aa71f6978c5b5e1268566306d2811dfcf30c83831027293d36c38ab2f3"

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    if len(sys.argv) != 6:
        raise SystemExit("usage: prepare_preview.py PROJECT GLASS_CSS CERT_SHA256 VERSION_CODE DELIVERY_SHA")
    root, css = map(pathlib.Path, sys.argv[1:3])
    cert, code, delivery = sys.argv[3:]
    if not re.fullmatch(r"[0-9A-F]{64}", cert) or not code.isdigit() or int(code) <= 1021487 or not re.fullmatch(r"[0-9a-f]{40}", delivery):
        raise SystemExit("Invalid certificate, Preview version code or delivery SHA")
    if not (root / "apktool.yml").is_file() or sha(css) != CSS_SHA:
        raise SystemExit("Unexpected project or Glass CSS")
    for name, expected in EXPECTED.items():
        if sha(root / name) != expected:
            raise SystemExit(f"Unexpected historical asset: {name}")
    (root / "assets/css_hacks.css").write_bytes(css.read_bytes())

    android = "{http://schemas.android.com/apk/res/android}"
    ET.register_namespace("android", "http://schemas.android.com/apk/res/android")
    manifest = root / "AndroidManifest.xml"
    tree = ET.parse(manifest)
    app = tree.getroot()
    old, preview = "com.melodix.music", "com.melodix.music.preview"
    if app.get("package") != old:
        raise SystemExit("Unexpected package")
    app.set("package", preview)
    application = app.find("application")
    if application is None:
        raise SystemExit("Application missing")
    application.attrib.pop(android + "debuggable", None)
    for element in app.iter():
        if element.get(android + "name") == old + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION":
            element.set(android + "name", preview + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION")
        authority = element.get(android + "authorities")
        if authority and authority.startswith(old + "."):
            element.set(android + "authorities", preview + authority[len(old):])
        if element.get(android + "label") == "Melodix":
            element.set(android + "label", "Melodix Preview historique")
    tree.write(manifest, encoding="utf-8", xml_declaration=True, short_empty_elements=True)

    strings = root / "res/values/strings.xml"
    text = strings.read_text(encoding="utf-8")
    colon_cert = ":".join(cert[i:i+2] for i in range(0, 64, 2))
    text, count = re.subn(r'(<string name="expected_signature_sha256">)[^<]*(</string>)', lambda m: m[1] + colon_cert + m[2], text)
    if count != 1 or 'name="preview_source_commit"' in text or text.count('</resources>') != 1:
        raise SystemExit("Unexpected strings.xml")
    text = text.replace('</resources>', f'    <string name="preview_source_commit">{BASE}</string>\n    <string name="preview_delivery_commit">{delivery}</string>\n</resources>')
    strings.write_text(text, encoding="utf-8")

    yaml = root / "apktool.yml"
    text = yaml.read_text(encoding="utf-8")
    for pattern, value in [(r'^apkFileName:.*$', 'apkFileName: Melodix-Preview-historique-glass.apk'),
                           (r'^  versionCode:.*$', '  versionCode: ' + code),
                           (r'^  versionName:.*$', '  versionName: 1.2.2-d0f206b-glass')]:
        text, count = re.subn(pattern, value, text, flags=re.MULTILINE)
        if count != 1:
            raise SystemExit("Unexpected apktool.yml")
    yaml.write_text(text, encoding="utf-8")
    for file in (root / "smali").rglob("*.smali"):
        text = file.read_text(encoding="utf-8")
        replaced = text.replace("com.melodix.music.PIP_", "com.melodix.music.preview.PIP_")
        if replaced != text:
            file.write_text(replaced, encoding="utf-8")
    for name, expected in EXPECTED.items():
        if sha(root / name) != expected:
            raise SystemExit(f"Historical asset changed: {name}")
    print("Prepared Preview from", BASE, "delivery", delivery, "CSS", CSS_SHA)

if __name__ == '__main__':
    main()
