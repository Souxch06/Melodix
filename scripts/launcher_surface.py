"""Accessibility evidence for the real login, not proof of authentication.

Acceptance runs on a fresh English-locale CI emulator. Require controls inside
Melodix's own WebView, not similarly named text in another window or the demo.
"""
import re

PACKAGE = 'com.melodix.music.preview'


def visible(node):
    match = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not match:
        return False
    x1, y1, x2, y2 = map(int, match.groups())
    return x2 > x1 and y2 > y1


def login_surface(items):
    for web in items:
        if (web.get('class') != 'android.webkit.WebView' or
                web.get('package') != PACKAGE or not visible(web)):
            continue
        descendants = [n for n in web.iter('node') if n.get('package') == PACKAGE and visible(n)]
        def has_label(label):
            return any(label in (n.get('text', ''), n.get('content-desc', '')) for n in descendants)
        if has_label('Welcome back') and has_label('Email') and has_label('Continue'):
            return web
    return None
