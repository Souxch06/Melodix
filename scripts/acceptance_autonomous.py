#!/usr/bin/env python3
"""A: actual no-session Preview/demo walk. Does not claim authenticated access."""
import json, pathlib, re, subprocess, sys, time, xml.etree.ElementTree as ET

profile, folder = sys.argv[1:]
out = pathlib.Path(folder); out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'
result = {'category': 'A', 'profile': profile, 'status': 'failed', 'steps': [],
          'authenticated_category_C': 'PENDING: no real session supplied',
          'demo_data': 'synthetic; not personal Spotify data'}

def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=40).stdout

def nodes():
    adb('shell', 'uiautomator', 'dump', '/sdcard/melodix-a.xml')
    raw = adb('shell', 'cat', '/sdcard/melodix-a.xml')
    return list(ET.fromstring(raw[raw.index(b'<?xml'):]).iter('node'))

def find(items, *, text=None, ident=None):
    return next((n for n in items if (text is not None and text in (n.get('text'), n.get('content-desc'))) or
                 (ident is not None and n.get('resource-id', '').endswith(':id/' + ident))), None)

def wait(*, text=None, ident=None, seconds=60):
    end = time.monotonic() + seconds
    while time.monotonic() < end:
        items = nodes(); n = find(items, text=text, ident=ident)
        if n is not None: return n
        allow = next((n for n in items if n.get('resource-id', '').endswith(':id/permission_allow_button') or n.get('resource-id', '').endswith(':id/permission_allow_foreground_only_button')), None)
        if allow is not None: tap(allow)
        time.sleep(2)
    raise RuntimeError('missing control: ' + str(text or ident))

def tap(n):
    m = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', n.get('bounds', ''))
    if not m: raise RuntimeError('invalid bounds')
    x1,y1,x2,y2 = map(int, m.groups())
    if x2 <= x1 or y2 <= y1: raise RuntimeError('empty bounds')
    adb('shell', 'input', 'tap', str((x1+x2)//2), str((y1+y2)//2)); time.sleep(1)

def capture(stage, required, demo=True):
    wait(text=required)
    items = nodes()
    if find(items, text=required) is None: raise RuntimeError(stage + ': missing required content')
    if demo and find(items, text='MODE DÉMO · HORS LIGNE') is None: raise RuntimeError(stage + ': missing synthetic demo badge')
    image = adb('exec-out', 'screencap', '-p')
    if not image.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid PNG')
    (out / (stage + '.png')).write_bytes(image)
    result['steps'].append(stage)
    print('::notice title=Category A::' + profile + ':' + stage, flush=True)

try:
    if profile == 'small':
        adb('shell', 'wm', 'size', '360x640'); adb('shell', 'wm', 'density', '160')
    elif profile == 'tablet':
        adb('shell', 'wm', 'size', '1920x1200'); adb('shell', 'wm', 'density', '240')
    elif profile != 'phone': raise RuntimeError('unknown profile')
    adb('logcat', '-c'); adb('shell', 'am', 'force-stop', pkg)
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    capture('launcher', 'Melodix Preview · réglages de test', False)
    tap(wait(text='Essayer le mode démo')); capture('accueil', 'MODE DÉMO · HORS LIGNE')
    tap(wait(ident='nativeLibraryTab')); capture('bibliotheque', 'Vos playlists de démonstration')
    tap(wait(text='Escale imaginaire')); capture('playlist', 'Playlist fictive · 12 titres · 43 min')
    adb('shell', 'input', 'keyevent', 'KEYCODE_BACK'); capture('retour', 'MODE DÉMO · HORS LIGNE')
    tap(wait(ident='nativeSearchTab')); capture('recherche', 'Découvrir')
    tap(wait(ident='nativeSearchInput')); adb('shell', 'input', 'text', 'Test161Aucun')
    tap(wait(text='Chercher')); adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
    capture('recherche-vide', 'Aucun résultat fictif')
    tap(wait(ident='nativeSettingsButton')); capture('reglages-demo', 'Préférences fictives')
    tap(wait(ident='nativeHomeTab')); capture('accueil-retour', 'MODE DÉMO · HORS LIGNE')
    tap(wait(ident='nativeMiniPlayer')); capture('lecteur', 'Lecture en cours')
    tap(wait(text='Quitter la démo'))
    # Demo exit targets MainActivity, which may need network for Spotify. The
    # autonomous check requires only that the demo actually left the foreground,
    # not that a remote login or authenticated session appears.
    end = time.monotonic() + 45
    while True:
        items = nodes()
        if (any(n.get('package') == pkg for n in items) and
                find(items, text='MODE DÉMO · HORS LIGNE') is None and
                find(items, text='Quitter la démo') is None): break
        if time.monotonic() >= end:
            packages = sorted(set(n.get('package', '') for n in items))
            safe_packages = [x if x in (pkg, 'com.android.systemui', 'com.google.android.permissioncontroller', 'com.android.permissioncontroller') else 'other' for x in packages]
            labels = sorted({v for n in items for v in (n.get('text',''),n.get('content-desc','')) if v in ('MODE DÉMO · HORS LIGNE','Quitter la démo','Welcome back','Email','Continue','Ouvrir Melodix','Essayer le mode démo')})
            diagnostic = {'packages': safe_packages, 'labels': labels, 'webview': any(n.get('class')=='android.webkit.WebView' for n in items)}
            print('::error title=Category A exit diagnostic::' + json.dumps(diagnostic, ensure_ascii=False), flush=True)
            raise RuntimeError('demo did not exit')
        time.sleep(2)
    png = adb('exec-out', 'screencap', '-p')
    if not png.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid PNG')
    (out / 'sortie.png').write_bytes(png); result['steps'].append('sortie')
    adb('shell', 'am', 'force-stop', pkg)
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    capture('relancement', 'Melodix Preview · réglages de test', False)
    log = adb('logcat', '-d', '-s', 'AndroidRuntime:E').decode(errors='replace')
    if 'FATAL EXCEPTION' in log: raise RuntimeError('AndroidRuntime fatal exception during autonomous walk')
    result['status'] = 'passed'; result['android_fatal'] = 0
except Exception as exc:
    result['failure'] = str(exc)
    print('::error title=Category A::' + profile + ': ' + str(exc), flush=True)
    try: (out / 'failure.png').write_bytes(adb('exec-out', 'screencap', '-p'))
    except Exception: pass
    raise
finally:
    (out / 'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print('::notice title=Category A result::' + json.dumps(result, ensure_ascii=False), flush=True)
