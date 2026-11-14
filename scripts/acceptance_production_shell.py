#!/usr/bin/env python3
"""TEST162: fresh-emulator production UI acceptance, NEVER the demo or session fixtures.

Run against an APK already installed on a disposable, fresh emulator. A failure
is a real failure, not an authenticated-session pass. Offline operation prevents
accidental account use, but cannot prove absence of all protected network calls.
"""
import json
import pathlib
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

PACKAGE = 'com.melodix.music.preview'
DEMO_BADGE = 'MODE DÉMO · HORS LIGNE'


def bounds(node):
    match = re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', node.get('bounds', ''))
    if not match:
        return None
    x1, y1, x2, y2 = map(int, match.groups())
    return (x1, y1, x2, y2) if x2 > x1 and y2 > y1 else None


def by_id(tree, name, clickable=False):
    for node in tree.iter('node'):
        if (node.get('package') == PACKAGE and
                node.get('resource-id') == PACKAGE + ':id/' + name and
                bounds(node) and node.get('enabled') == 'true' and
                (not clickable or node.get('clickable') == 'true')):
            return node
    return None


def has_demo(tree):
    return any(DEMO_BADGE in (n.get('text', ''), n.get('content-desc', ''))
               for n in tree.iter('node'))


def production_root(tree):
    # Demo uses the same native* ids. Require MainActivity foreground separately,
    # and reject the demo badge; never count standalone lookalike controls.
    if has_demo(tree):
        return None
    root = by_id(tree, 'nativeRoot')
    if root is None:
        return None
    return root if all(by_id(root, name, True) is not None for name in
                       ('nativeHomeTab', 'nativeSearchTab', 'nativeLibraryTab')) else None


def screen_title(tree, value):
    root = production_root(tree)
    node = by_id(root, 'nativeScreenTitle') if root is not None else None
    return node is not None and node.get('text') == value


def connection_state(tree):
    root = production_root(tree)
    if root is None:
        return False
    return any(bounds(n) and re.search(r'connect|connexion',
               n.get('text', '') + ' ' + n.get('content-desc', ''), re.I)
               for n in root.iter('node'))


def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE, timeout=45).stdout


def hierarchy():
    error = None
    for _ in range(3):
        try:
            status = adb('shell', 'uiautomator', 'dump', '/sdcard/test162-ui.xml')
            if b'dumped to' not in status:
                raise RuntimeError('UIAutomator dump failed')
            raw = adb('shell', 'cat', '/sdcard/test162-ui.xml')
            return ET.fromstring(raw[raw.index(b'<?xml'):])
        except (subprocess.CalledProcessError, ValueError, ET.ParseError, RuntimeError) as exc:
            error = exc
            time.sleep(1)
    raise RuntimeError('no current hierarchy after retries') from error


def tap(node):
    rect = bounds(node)
    if rect is None:
        raise RuntimeError('empty tap target')
    x1, y1, x2, y2 = rect
    adb('shell', 'input', 'tap', str((x1 + x2) // 2), str((y1 + y2) // 2))
    time.sleep(1)


def permission(tree):
    for node in tree.iter('node'):
        if node.get('resource-id', '').endswith((':id/permission_allow_button', ':id/permission_allow_foreground_only_button')) and bounds(node):
            tap(node)
            return True
    return False


def foreground_main():
    output = adb('shell', 'dumpsys', 'activity', 'activities').decode(errors='replace')
    resumed = next((line for line in output.splitlines() if 'mResumedActivity:' in line or 'topResumedActivity=' in line), '')
    return re.search(r'\b' + re.escape(PACKAGE) + r'/(?:com\.melodix\.music\.)?MainActivity\b', resumed) is not None


def run(profile, directory):
    out = pathlib.Path(directory)
    out.mkdir(parents=True, exist_ok=True)
    result = {'category': 'production-no-session', 'profile': profile, 'status': 'failed',
              'steps': [], 'spotify_real_session': 'PENDING', 'demo': 'excluded'}
    stage = 'setup'

    def wait(predicate, name, seconds=60):
        deadline = time.monotonic() + seconds
        while time.monotonic() < deadline:
            tree = hierarchy()
            if permission(tree):
                continue
            found = predicate(tree)
            if found is not None and found is not False:
                return found
            time.sleep(2)
        if name == 'visible production shell and three clickable tabs':
            # Closed diagnostics only: neither page text, URLs nor account data.
            tree = hierarchy()
            root = by_id(tree, 'nativeRoot')
            result['home_diagnostic'] = {
                'main_activity_foreground': foreground_main(),
                'demo_badge_visible': has_demo(tree),
                'native_root_in_accessibility_tree': root is not None,
                'visible_clickable_tabs': [key for key in ('nativeHomeTab', 'nativeSearchTab', 'nativeLibraryTab')
                                           if root is not None and by_id(root, key, True) is not None],
            }
        raise RuntimeError(name + ' not observed on production MainActivity')

    def screenshot(name):
        png = adb('exec-out', 'screencap', '-p')
        if not png.startswith(b'\x89PNG\r\n\x1a\n'):
            raise RuntimeError('invalid screenshot')
        (out / (name + '.png')).write_bytes(png)

    def shell(tree):
        return production_root(tree) if foreground_main() else None

    def step(name):
        screenshot(name)
        result['steps'].append(name)
        print('::notice title=TEST162 production shell::' + profile + ':' + name, flush=True)

    try:
        if profile == 'small':
            adb('shell', 'wm', 'size', '360x640'); adb('shell', 'wm', 'density', '160')
        elif profile == 'tablet':
            adb('shell', 'wm', 'size', '1920x1200'); adb('shell', 'wm', 'density', '240')
        elif profile != 'phone':
            raise ValueError('unknown profile')
        adb('shell', 'svc', 'wifi', 'disable'); adb('shell', 'svc', 'data', 'disable')
        adb('logcat', '-c')
        adb('shell', 'am', 'force-stop', PACKAGE)
        adb('shell', 'monkey', '-p', PACKAGE, '-c', 'android.intent.category.LAUNCHER', '1')
        stage = 'launcher'
        button = wait(lambda t: next((n for n in t.iter('node') if n.get('package') == PACKAGE and n.get('text') == 'Ouvrir Melodix' and bounds(n) and n.get('clickable') == 'true'), None), 'launcher')
        tap(button)
        stage = 'home'
        wait(shell, 'visible production shell and three clickable tabs', 90)
        step('home')
        for stage, tab, title in [('library', 'nativeLibraryTab', 'Votre bibliothèque'), ('search', 'nativeSearchTab', 'Rechercher')]:
            root = wait(shell, stage + ' shell')
            tap(by_id(root, tab, True))
            wait(lambda t: shell(t) and screen_title(t, title), stage + ' title')
            if stage == 'library':
                wait(lambda t: shell(t) and connection_state(t), 'library connection-required state')
            step(stage)
        stage = 'settings'
        root = wait(shell, 'settings shell')
        button = by_id(root, 'nativeSettingsButton', True)
        if button is None:
            raise RuntimeError('real settings control unavailable')
        tap(button)
        wait(lambda t: shell(t) and screen_title(t, 'Paramètres'), 'settings title')
        step('settings')
        stage = 'back-home'
        root = wait(shell, 'back home shell')
        tap(by_id(root, 'nativeHomeTab', True))
        wait(lambda t: shell(t) and screen_title(t, 'Accueil'), 'home title')
        step('back-home')
        # Login test requires an accessible connection action on the real home,
        # not the demo entry. Open and require a WebView; offline does not prove
        # a remote Spotify login page, OAuth, or a successful return.
        stage = 'login'
        def connection(tree):
            root = shell(tree)
            if root is None:
                return None
            return next((n for n in root.iter('node') if bounds(n) and n.get('clickable') == 'true' and
                         re.search(r'connect|connexion', n.get('text', '') + ' ' + n.get('content-desc', ''), re.I)), None)
        tap(wait(connection, 'connection action'))
        wait(lambda t: foreground_main() and not has_demo(t) and any(n.get('class') == 'android.webkit.WebView' and n.get('package') == PACKAGE and bounds(n) for n in t.iter('node')), 'login WebView')
        step('login')
        stage = 'login-return'
        adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
        wait(shell, 'production shell after login return')
        step('login-return')
        stage = 'crash-check'
        log = adb('logcat', '-d', '-s', 'AndroidRuntime:E').decode(errors='replace')
        if 'FATAL EXCEPTION' in log:
            raise RuntimeError('AndroidRuntime fatal exception')
        result['status'] = 'passed'
    except Exception as exc:
        result['failure'] = {'stage': stage, 'reason': str(exc)}
        print('::error title=TEST162 production shell::' + profile + ':' + stage + ': ' + str(exc), flush=True)
        try:
            screenshot('failure-' + stage)
        except Exception:
            pass
        raise
    finally:
        (out / 'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
        print('::notice title=TEST162 result::' + json.dumps(result, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        raise SystemExit('usage: acceptance_production_shell.py PROFILE OUTPUT_DIR')
    run(sys.argv[1], sys.argv[2])
