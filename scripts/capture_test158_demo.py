#!/usr/bin/env python3
"""Real test158 offline DEMO screenshots from the launcher, no session injection."""
import json
import pathlib
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

profile, folder = sys.argv[1:]
out = pathlib.Path(folder); out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'

def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout

def nodes():
    adb('shell', 'uiautomator', 'dump', '/sdcard/test158-demo.xml')
    xml = adb('shell', 'cat', '/sdcard/test158-demo.xml')
    return list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))

def get(items, *, text=None, ident=None):
    return next((n for n in items if (text is not None and (n.get('text') == text or n.get('content-desc') == text)) or
                 (ident is not None and n.get('resource-id', '').endswith(':id/' + ident))), None)

def tap(node):
    box = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not box: raise RuntimeError('invalid bounds')
    x1, y1, x2, y2 = map(int, box.groups())
    if x2 <= x1 or y2 <= y1: raise RuntimeError('empty tap bounds')
    adb('shell', 'input', 'tap', str((x1+x2)//2), str((y1+y2)//2)); time.sleep(1)

def wait(*, text=None, ident=None, seconds=60):
    end = time.monotonic() + seconds
    while time.monotonic() < end:
        items = nodes(); found = get(items, text=text, ident=ident)
        if found is not None: return found
        allow = next((n for n in items if n.get('resource-id', '').endswith(':id/permission_allow_button') or n.get('resource-id', '').endswith(':id/permission_allow_foreground_only_button')), None)
        if allow is not None: tap(allow)
        time.sleep(2)
    raise RuntimeError('not observed: ' + str(text or ident))

def snap(stage, required):
    items = nodes()
    if get(items, text=required) is None: raise RuntimeError(stage + ' missing ' + required)
    if get(items, text='MODE DÉMO · HORS LIGNE') is None: raise RuntimeError(stage + ' missing offline demo badge')
    png = adb('exec-out', 'screencap', '-p')
    if not png.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid screenshot')
    (out / (stage + '.png')).write_bytes(png)
    summary = {'profile': profile, 'stage': stage, 'required': required, 'offline_demo_badge': True}
    (out / (stage + '.json')).write_text(json.dumps(summary, ensure_ascii=False) + '\n')
    print('::notice title=Test158 real demo screenshot::' + json.dumps(summary, ensure_ascii=False), flush=True)

try:
    if profile == 'small':
        adb('shell', 'wm', 'size', '360x640'); adb('shell', 'wm', 'density', '160')
    elif profile != 'phone': raise RuntimeError('unknown profile')
    adb('shell', 'svc', 'wifi', 'disable'); adb('shell', 'svc', 'data', 'disable')
    adb('shell', 'am', 'force-stop', pkg)
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    tap(wait(text='Essayer le mode démo'))
    wait(text='MODE DÉMO · HORS LIGNE'); snap('accueil', 'MODE DÉMO · HORS LIGNE')
    tap(wait(ident='nativeLibraryTab')); snap('bibliotheque', 'Vos playlists de démonstration')
    tap(wait(text='Escale imaginaire')); snap('playlist', 'Playlist fictive · 12 titres · 43 min')
    tap(wait(ident='nativeSearchTab')); snap('recherche', 'Découvrir')
    tap(wait(ident='nativeHomeTab')); snap('retour-accueil', 'MODE DÉMO · HORS LIGNE')
    tap(wait(ident='nativeMiniPlayer')); snap('lecteur', 'Lecture en cours')
    tap(wait(text='Quitter la démo')); print('::notice title=Test158 demo exit::Quitter la démo clicked; post-exit surface not asserted by this diagnostic', flush=True)
except Exception as exc:
    print('::error title=Test158 demo capture::' + str(exc), flush=True)
    try: (out / 'error.png').write_bytes(adb('exec-out', 'screencap', '-p'))
    except Exception: pass
    raise
