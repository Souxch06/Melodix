#!/usr/bin/env python3
"""Record observed real MainActivity surfaces on a fresh, offline CI emulator.

No proof flags, fixtures, accounts, WebView evaluation, or app storage changes.
Missing screens are explicitly reported, never substituted with demo screenshots.
"""
import json, pathlib, re, subprocess, sys, time, xml.etree.ElementTree as ET

profile, directory = sys.argv[1:]
out = pathlib.Path(directory)
out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'

def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout

def image(name):
    png = adb('exec-out', 'screencap', '-p')
    if not png.startswith(b'\x89PNG\r\n\x1a\n'):
        raise RuntimeError('invalid PNG: ' + name)
    (out / (name + '.png')).write_bytes(png)

def nodes():
    adb('shell', 'uiautomator', 'dump', '/sdcard/real-no-session.xml')
    data = adb('shell', 'cat', '/sdcard/real-no-session.xml')
    return list(ET.fromstring(data[data.index(b'<?xml'):]).iter('node'))

def find_id(items, idname):
    return next((n for n in items if n.get('resource-id', '').endswith(':id/' + idname)), None)

def tap(node):
    m = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not m:
        raise RuntimeError('invalid setting button bounds')
    x1, y1, x2, y2 = map(int, m.groups())
    adb('shell', 'input', 'tap', str((x1 + x2) // 2), str((y1 + y2) // 2))

adb('shell', 'am', 'force-stop', pkg)
# Keep the demo's offline emulator; no storage or auth is modified.
adb('shell', 'am', 'start', '-n', pkg + '/com.melodix.music.MainActivity')
image('demarrage-immediat')  # timing only; not asserted to be the splash
# Allow the genuine gate/error state to settle. No forced error is injected.
time.sleep(35)
items = nodes()
image('etat-observe')
texts = [n.get('text', '') for n in items]
ids = sorted({n.get('resource-id', '').split('/')[-1] for n in items if n.get('resource-id')})
error_words = ('erreur', 'refus', 'indisponible', 'pas abouti', 'problème de connexion')
error = any(any(word in t.lower() for word in error_words) for t in texts)
result = {'profile': profile, 'account': 'none', 'network': 'disabled',
          'launch': 'real MainActivity in preview APK', 'visible_ids': ids,
          'startup': 'demarrage-immediat.png (timing only; splash not asserted)',
          'observed': 'etat-observe.png', 'error': 'observed' if error else 'not observed',
          'settings': 'not reached'}
if error:
    image('erreur-observee')
# A session gate owns the surface: never tap through it or synthesize proof.
button = find_id(items, 'nativeSettingsButton')
if button is not None and find_id(items, 'sessionTitle') is None:
    tap(button)
    time.sleep(5)
    items = nodes()
    title = find_id(items, 'nativeScreenTitle')
    if title is not None and title.get('text') == 'Paramètres' and find_id(items, 'sessionTitle') is None:
        image('reglages-reels')
        result['settings'] = 'reached: reglages-reels.png'
    else:
        result['settings'] = 'not reached after visible settings action'
else:
    result['settings'] = 'not reachable: session gate or settings action not visible'
# Exercise the genuine session surface without simulating authentication.
items = nodes()
if find_id(items, 'sessionTitle') is None:
    raise RuntimeError('real session surface was not observed; cannot verify demo entry')
entry = next((n for n in items if n.get('text') == 'Essayer le mode démo'), None)
if entry is None:
    raise RuntimeError('preview demo button not visible on actual session surface')
image('session-entree-demo')
tap(entry)
time.sleep(3)
items = nodes()
if not any('MODE DÉMO' in n.get('text', '') for n in items):
    raise RuntimeError('session demo entry did not open offline demo')
image('demo-depuis-session')
exit_button = next((n for n in items if n.get('content-desc') == 'Quitter la démo'), None)
if exit_button is None:
    raise RuntimeError('demo exit button not visible')
tap(exit_button)
time.sleep(3)
items = nodes()
if find_id(items, 'sessionTitle') is None:
    raise RuntimeError('demo exit did not return to the real session surface')
image('retour-session')
result['demo_entry'] = 'visible and opened from real session surface; exit returned to session'
(out / 'observation.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
print(json.dumps(result, ensure_ascii=False))
