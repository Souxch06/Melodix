#!/usr/bin/env python3
"""Exercise the exact build-only candidate on a clean, offline Android emulator.

No account, fake session, response fixture, app-data read or private text export.
The UIAutomator tree is inspected in memory and only bounded phase labels are logged.
"""
import re
import subprocess
import time
import xml.etree.ElementTree as ET

PACKAGE = 'com.melodix.music.preview'
current_phase = 'initial'


def adb(*args):
    return subprocess.run(['adb', *map(str, args)], check=True,
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.decode('utf-8', 'replace')


def nodes():
    # Immediately after launch UIAutomator may report an empty window and not
    # create its file even when its shell command itself exits successfully.
    # Retry transient capture errors; never treat missing hierarchy as success.
    for attempt in range(10):
        try:
            adb('shell', 'rm', '-f', '/sdcard/experimental-glass.xml')
            adb('shell', 'uiautomator', 'dump', '/sdcard/experimental-glass.xml')
            raw = adb('shell', 'cat', '/sdcard/experimental-glass.xml')
            return list(ET.fromstring(raw[raw.index('<?xml'):]).iter('node'))
        except (subprocess.CalledProcessError, ValueError, ET.ParseError):
            if attempt == 9:
                raise AssertionError('UI hierarchy unavailable after bounded retries')
            time.sleep(1)


def bounds(node):
    m = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not m:
        raise AssertionError('invalid accessibility bounds')
    x1, y1, x2, y2 = map(int, m.groups())
    if x2 <= x1 or y2 <= y1:
        raise AssertionError('empty accessibility bounds')
    return x1, y1, x2, y2


def find(predicate, timeout=40):
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        for n in nodes():
            if predicate(n):
                bounds(n)
                return n
        time.sleep(1)
    raise AssertionError('required accessible node not observed after ' + current_phase)


def by_id(name):
    return lambda n: n.get('resource-id', '').endswith(':id/' + name)


def text(value):
    return lambda n: n.get('text') == value or n.get('content-desc') == value


def tap(node):
    if node.get('clickable') != 'true':
        raise AssertionError('required node is not clickable')
    x1, y1, x2, y2 = bounds(node)
    adb('shell', 'input', 'tap', (x1 + x2) // 2, (y1 + y2) // 2)


def await_main_foreground(timeout=60):
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        dump = adb('shell', 'dumpsys', 'activity', 'activities')
        resumed = next((line for line in dump.splitlines()
                        if 'mResumedActivity:' in line or 'topResumedActivity=' in line), '')
        window = adb('shell', 'dumpsys', 'window', 'windows')
        focused = next((line for line in window.splitlines() if 'mCurrentFocus=' in line), '')
        if (PACKAGE + '/com.melodix.music.MainActivity' in resumed and
                PACKAGE + '/com.melodix.music.MainActivity' in focused):
            return
        time.sleep(1)
    raise AssertionError('real MainActivity did not regain resumed and focused state')


def phase(label):
    global current_phase
    current_phase = label
    print('::notice title=Experimental Glass offline check::' + label, flush=True)


phase('disabling network')
adb('shell', 'svc', 'wifi', 'disable')
adb('shell', 'svc', 'data', 'disable')
phase('granting declared Bluetooth permission')
adb('shell', 'pm', 'grant', PACKAGE, 'android.permission.BLUETOOTH_CONNECT')
adb('shell', 'am', 'force-stop', PACKAGE)
# Launch via the actual launcher intent, not a special activity or synthetic fixture.
phase('launching via launcher')
adb('shell', 'monkey', '-p', PACKAGE, '-c', 'android.intent.category.LAUNCHER', '1')
phase('checking native root')
root = find(by_id('nativeRoot'))
find(by_id('nativeHomeTab'))
phase('checking status and controls')
find(lambda n: n.get('text') in ('Bibliothèque Spotify indisponible', 'Vérification de la bibliothèque…'))
tap_target = find(text('Réessayer la bibliothèque'))
find(text('Se connecter à Spotify'))
if any(by_id('splashOverlay')(n) for n in nodes()):
    raise AssertionError('splash remains in the accessible window')
phase('fresh launcher: native root, measured accessible status, login and retry visible; splash absent')

for tab, heading in [('nativeLibraryTab', 'Bibliothèque'), ('nativeSearchTab', 'Rechercher'),
                     ('nativeHomeTab', 'Accueil')]:
    tap(find(by_id(tab)))
    find(lambda n: by_id('nativeScreenTitle')(n) and text(heading)(n))
    phase('native navigation: ' + tab)

phase('opening limited settings')
tap(find(by_id('nativeSettingsButton')))
find(lambda n: by_id('nativeScreenTitle')(n) and text('Paramètres')(n))
phase('settings title is accessible')
# On a phone the lower actions can be below the fold: scroll the real content
# before asserting their presence and interactivity; no forced view is added.
x1, y1, x2, y2 = bounds(find(by_id('nativeRoot')))
x = (x1 + x2) // 2
adb('shell', 'input', 'swipe', x, y1 + (y2-y1)*4//5, x, y1 + (y2-y1)*2//5, 450)
find(text('Notifications Android'))
phase('Android notification setting is accessible')
# The demo is packaged only in this explicitly experimental build.
phase('checking demo entry')
demo = find(text('Mode démo'))
tap(demo)
phase('checking offline demo')
find(text('MODE DÉMO · HORS LIGNE'), timeout=60)
phase('isolated offline demo opened from limited settings')
tap(find(text('Quitter la démo')))
# Both activities reuse the nativeRoot resource id; require the real limited
# Settings title before interacting, not merely the demo's identical root.
phase('waiting for real settings after demo exit')
find(lambda n: by_id('nativeScreenTitle')(n) and text('Paramètres')(n), timeout=60)
await_main_foreground()
phase('demo exit returned to real limited Glass')
phase('finding Home tab after demo exit')
tap(find(by_id('nativeHomeTab')))
phase('waiting for Home title after demo exit')
find(lambda n: by_id('nativeScreenTitle')(n) and text('Accueil')(n))

# Retry is voluntary and does not perform a login. Afterwards deliberately open login.
tap(find(text('Réessayer la bibliothèque')))
find(by_id('nativeRoot'), timeout=40)
find(text('Se connecter à Spotify'))
phase('voluntary retry returns to limited Glass without claiming a session')
tap(find(text('Se connecter à Spotify')))
find(lambda n: 'WebView' in n.get('class', ''), timeout=60)
phase('explicit login opened a WebView; no real Spotify authentication tested')

if not adb('shell', 'pidof', PACKAGE).strip():
    raise AssertionError('app process did not survive navigation')
phase('app process alive at end of offline flow')
