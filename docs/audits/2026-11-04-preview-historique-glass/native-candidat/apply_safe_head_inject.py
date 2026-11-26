#!/usr/bin/env python3
"""Inject Melodix styles even before <head> exists.

Android 16 logcat of the user's Preview: 'Uncaught TypeError: Cannot read
properties of null (reading appendChild)' one second after start: the
sf-custom-style / sf-tv-focus injections and three spotify_bridge.js blocks call
document.head.appendChild while the page has no <head> yet, and the exception
stops the rest of that script. Fall back to <html> (a <style> there applies the
same way, as classic_login.js already does). The id checks that prevent
duplicates are unchanged. Runs last: earlier patches pin these files' hashes.
"""
import sys
from pathlib import Path

EDITS = {  # file: number of document.head.appendChild( calls expected
    'smali/c91.smali': 2,
    'smali/o6.smali': 1,
    'assets/spotify_bridge.js': 3,
}
OLD, NEW = 'document.head.appendChild(', '(document.head||document.documentElement).appendChild('

def prepare(root, name, expected):
    text = (root/name).read_text(encoding='utf8')
    found = text.count(OLD)
    if found != expected: raise ValueError(f'{name}: {found} head injections, expected {expected}')
    return text.replace(OLD, NEW)

if __name__ == '__main__':
    root = Path(sys.argv[1])
    out = {n: prepare(root, n, c) for n, c in EDITS.items()}  # validate all before writing any
    for n, t in out.items(): (root/n).write_text(t, encoding='utf8')
