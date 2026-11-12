#!/usr/bin/env python3
"""Actual launcher and user taps only. No session proof, account or fixture injection."""
import json, pathlib, re, subprocess, sys, time, xml.etree.ElementTree as ET
from session_watchdog_observation import observe_watchdog
from launcher_surface import login_surface

pkg = 'com.melodix.music.preview'
out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
summary = {'launcher': None, 'first_screen': None, 'steps': [], 'failure': None}

def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout

def nodes():
    adb('shell', 'uiautomator', 'dump', '/sdcard/launcher-acceptance.xml')
    xml = adb('shell', 'cat', '/sdcard/launcher-acceptance.xml')
    return list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))

def image(name):
    data = adb('exec-out', 'screencap', '-p')
    if not data.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid screenshot ' + name)
    (out / (name + '.png')).write_bytes(data)

def text_node(items, text):
    return next((n for n in items if n.get('text') == text or n.get('content-desc') == text), None)

def find_id(items, idname):
    return next((n for n in items if n.get('resource-id', '').endswith(':id/' + idname)), None)

def real_surface(items):
    # The login header title is deliberately GONE. Recognize the actual
    # functional login WebView, while keeping the old native error/settings
    # surfaces and never treating login as proof of authenticated settings.
    session = find_id(items, 'sessionTitle')
    if session is not None:
        return session
    settings = find_id(items, 'nativeSettingsButton')
    if settings is not None:
        return settings
    return login_surface(items)

def wait(predicate, label, limit=60):
    until = time.monotonic() + limit
    while time.monotonic() < until:
        items = nodes(); match = predicate(items)
        if match is not None: return match
        # Runtime permission dialogs are acted on only on this fresh emulator;
        # do not change app state or any authentication proof.
        if any('permissioncontroller:id/permission_message' in n.get('resource-id', '') for n in items):
            message = next((n.get('text', '') for n in items if 'permissioncontroller:id/permission_message' in n.get('resource-id', '')), '')
            summary['steps'].append('Android permission dialog: ' + message)
            allow = next((n for n in items if n.get('resource-id', '').endswith(':id/permission_allow_button') or n.get('resource-id', '').endswith(':id/permission_allow_foreground_only_button')), None)
            if allow is not None: tap(allow)
        time.sleep(2)
    items = nodes()
    visible = [n.get('text') for n in items if n.get('text')]
    raise RuntimeError(label + ' not observed; visible=' + repr(visible[:15]))

def tap(node):
    box = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not box: raise RuntimeError('invalid or unavailable tap bounds')
    x1,y1,x2,y2 = map(int, box.groups())
    if x2 <= x1 or y2 <= y1: raise RuntimeError('tap target has empty bounds')
    adb('shell', 'input', 'tap', str((x1+x2)//2), str((y1+y2)//2))
    time.sleep(1)

def screenshot(name, step):
    image(name); summary['steps'].append(step)
    print('::notice title=Launcher acceptance::' + step, flush=True)

try:
    adb('shell', 'svc', 'wifi', 'disable'); adb('shell', 'svc', 'data', 'disable')
    resolved = adb('shell', 'cmd', 'package', 'resolve-activity', '--brief', '-a', 'android.intent.action.MAIN', '-c', 'android.intent.category.LAUNCHER', pkg).decode().strip()
    summary['launcher'] = resolved.splitlines()[-1]
    if not summary['launcher'].startswith(pkg + '/'): raise RuntimeError('launcher resolution failed: ' + resolved)
    adb('shell', 'am', 'force-stop', pkg)
    # Only the app's launcher intent, not a direct Activity component.
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    time.sleep(3); image('01-premier-ecran')
    items = nodes(); visible = [n.get('text') for n in items if n.get('text')]
    summary['first_screen'] = visible[:20]
    print('::notice title=Launcher first screen::' + repr(visible[:20]), flush=True)
    wait(lambda n: text_node(n, 'Melodix Preview · réglages de test'), 'launcher test settings')
    wait(lambda n: text_node(n, 'Essayer le mode démo'), 'launcher demo button')
    screenshot('02-reglages-test', 'launcher settings / Essayer le mode démo')
    tap(wait(lambda n: text_node(n, 'Ouvrir Melodix'), 'open real app'))
    wait(real_surface, 'real session surface', 90)
    entry = wait(lambda n: text_node(n, 'Essayer le mode démo'), 'real session demo button', 90)
    screenshot('03-session', 'real session / Essayer le mode démo')
    tap(entry)
    wait(lambda n: text_node(n, 'MODE DÉMO · HORS LIGNE'), 'demo home')
    screenshot('04-accueil-demo', 'demo home opened from session')
    tap(wait(lambda n: find_id(n, 'nativeMiniPlayer'), 'demo mini player'))
    wait(lambda n: text_node(n, 'Lecture en cours'), 'demo player')
    wait(lambda n: text_node(n, 'MODE DÉMO · HORS LIGNE'), 'demo player badge')
    screenshot('05-lecteur-demo', 'demo player')
    # The real watchdog fires after 60s. Leave the demo in front longer than
    # that, then require the session surface to stay usable after returning.
    # This does not authenticate or dismiss any overlay.
    observe_watchdog(nodes, 'demo', 70)
    summary['steps'].append('demo remained visible during 70s watchdog window')
    tap(wait(lambda n: text_node(n, 'Quitter la démo'), 'demo exit'))
    wait(real_surface, 'real surface after demo exit', 90)
    observe_watchdog(nodes, 'after-exit', 10)
    screenshot('06-apres-sortie', 'real surface after demo exit; no content diagnostic for 10s')
    # Require genuine, visible settings. No synthetic authentication to cross
    # the session gate; if blocked, record the failure rather than invent proof.
    items = nodes()
    settings = find_id(items, 'nativeSettingsButton')
    if find_id(items, 'sessionTitle') is not None or login_surface(items) is not None or settings is None:
        raise RuntimeError('real settings inaccessible: session gate is visible, no authenticated session on fresh offline emulator')
    tap(settings)
    wait(lambda n: text_node(n, 'Mode démo'), 'real settings / Mode démo')
    screenshot('07-reglages-reels', 'real settings / Mode démo')
except Exception as exc:
    summary['failure'] = str(exc)
    try: image('echec-etat-observe')
    except Exception: pass
    print('::error title=Launcher acceptance::' + str(exc), flush=True)
    raise
finally:
    (out / 'observations.json').write_text(json.dumps(summary, ensure_ascii=False, indent=2) + '\n')
