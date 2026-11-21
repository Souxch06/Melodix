#!/usr/bin/env python3
"""Observe the original test158, on a clean emulator; never sign in or inject state."""
import json
import pathlib
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'

def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout

def nodes():
    adb('shell', 'uiautomator', 'dump', '/sdcard/test158-observe.xml')
    raw = adb('shell', 'cat', '/sdcard/test158-observe.xml')
    return list(ET.fromstring(raw[raw.index(b'<?xml'):]).iter('node'))

def find_text(items, text):
    return next((n for n in items if n.get('text') == text or n.get('content-desc') == text), None)

def wait_text(text, timeout=90):
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        items = nodes()
        target = find_text(items, text)
        if target is not None:
            return target
        allow = next((n for n in items if n.get('resource-id', '').endswith(':id/permission_allow_button') or n.get('resource-id', '').endswith(':id/permission_allow_foreground_only_button')), None)
        if allow is not None: tap(allow)
        time.sleep(2)
    raise RuntimeError('visible control not observed: ' + text)

def tap(node):
    m = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not m: raise RuntimeError('invalid bounds')
    x1, y1, x2, y2 = map(int, m.groups())
    if x2 <= x1 or y2 <= y1: raise RuntimeError('empty bounds')
    adb('shell', 'input', 'tap', str((x1+x2)//2), str((y1+y2)//2))
    time.sleep(2)

def observe(stage):
    items = nodes()
    # No text fields or credential contents in annotations, even on a clean device.
    web = [dict(cls=n.get('class'), bounds=n.get('bounds'), package=n.get('package'))
           for n in items if n.get('class') == 'android.webkit.WebView']
    demo = [dict(bounds=n.get('bounds'), clickable=n.get('clickable'), package=n.get('package'))
            for n in items if n.get('text') == 'Essayer le mode démo']
    title = [dict(bounds=n.get('bounds'), package=n.get('package')) for n in items
             if n.get('resource-id', '').endswith(':id/sessionTitle')]
    known = ['Spotify', 'Welcome back', 'Email', 'Continue', 'MODE DÉMO · HORS LIGNE', 'Lecture en cours']
    result = {'stage': stage, 'webviews': web, 'demo_entries': demo, 'session_titles': title,
              'known_labels': [text for text in known if find_text(items, text) is not None]}
    image = adb('exec-out', 'screencap', '-p')
    if not image.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid screenshot')
    (out / (stage + '.png')).write_bytes(image)
    (out / (stage + '.json')).write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print('::notice title=Test158 observation::' + json.dumps(result, ensure_ascii=False), flush=True)
    return result

try:
    adb('shell', 'svc', 'wifi', 'disable'); adb('shell', 'svc', 'data', 'disable')
    adb('shell', 'am', 'force-stop', pkg)
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    wait_text('Ouvrir Melodix'); observe('launcher'); tap(wait_text('Ouvrir Melodix'))
    # A clean offline device may show either the interactive Spotify login or
    # an unproven native session error. Record the actual WebView and surface;
    # never pretend that either state represents authenticated access.
    end = time.monotonic() + 90
    while time.monotonic() < end:
        items = nodes()
        if any(n.get('class') == 'android.webkit.WebView' for n in items):
            break
        time.sleep(2)
    else:
        raise RuntimeError('WebView not observed')
    time.sleep(5); observe('real-session')
    tap(wait_text('Essayer le mode démo', 45))
    wait_text('MODE DÉMO · HORS LIGNE', 60); observe('demo')
    tap(wait_text('Quitter la démo', 30)); time.sleep(5); observe('after-demo')
except Exception as exc:
    print('::error title=Test158 observation::' + str(exc), flush=True)
    try: observe('error')
    except Exception: pass
    raise
