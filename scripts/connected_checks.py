#!/usr/bin/env python3
"""Connected Android checks for the Glass Preview. Writes ONLY booleans and counts to
<out>/summary.json: no text from the screen, no screenshots, no UI dumps, no logcat
(they can hold account, playlist or track names). UI dumps stay in a temp dir."""
import json, re, subprocess, sys, tempfile, time
PKG = 'com.melodix.music.preview'; ID = PKG + ':id/'
out = sys.argv[1]; tmp = tempfile.mkdtemp(); R = {}
def adb(*a, t=40): return subprocess.run(['adb', *a], capture_output=True, text=True, timeout=t).stdout
def nodes():
    x = adb('exec-out', 'uiautomator', 'dump', '/dev/tty'); res = []
    for n in re.findall(r'<node [^>]*>', x):
        g = lambda k: (re.search(k + r'="([^"]*)"', n) or [None, ''])[1]
        b = re.search(r'bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"', n)
        a = list(map(int, b.groups())) if b else [0, 0, 0, 0]
        res.append({'id': g('resource-id').replace(ID, ''), 'text': g('text'), 'desc': g('content-desc'), 'click': g('clickable') == 'true',
                    'x': (a[0] + a[2]) // 2, 'y': (a[1] + a[3]) // 2, 'h': a[3] - a[1]})
    return res
def has(ns, i): return any(n['id'] == i and n['h'] > 0 for n in ns)
def tap(n): adb('shell', 'input', 'tap', str(n['x']), str(n['y']))
def by_id(ns, i): return next((n for n in ns if n['id'] == i and n['h'] > 0), None)
def rows(ns):  # clickable rows inside the native list area, counted only
    return [n for n in ns if n['click'] and n['id'] not in ('nativeHomeTab', 'nativeSearchTab', 'nativeLibraryTab', 'nativeBackButton', 'nativePlayPauseButton', 'btnSettings', 'nativeHeaderAvatar') and n['h'] > 60]
def step(name, fn):
    try: R[name] = fn()
    except Exception as e: R[name] = {'error': type(e).__name__}
    json.dump(R, open(f'{out}/summary.json', 'w'), indent=1)
def relaunch(wait=25):
    adb('shell', 'am', 'force-stop', PKG); time.sleep(2)
    adb('shell', 'am', 'start', '-W', '-n', PKG + '/com.melodix.music.MainActivity'); time.sleep(wait)
def glass_home():
    relaunch(); ns = nodes()
    return {'native_root': has(ns, 'nativeRoot'), 'tab_bar': has(ns, 'nativeTabBar'), 'title': has(ns, 'nativeScreenTitle'), 'home_rows': len(rows(ns))}
def library():
    ns = nodes(); t = by_id(ns, 'nativeLibraryTab')
    if not t: return {'library_tab': False}
    tap(t); time.sleep(8); ns = nodes(); r = rows(ns)
    liked = next((n for n in r if re.search(r'lik|aim', n['text'] + n['desc'], re.I)), None)
    return {'library_tab': True, 'library_rows': len(r), 'liked_entry_found': liked is not None}
def liked():
    ns = nodes(); r = rows(ns); l = next((n for n in r if re.search(r'lik|aim', n['text'] + n['desc'], re.I)), None)
    if not l: return {'opened': False}
    tap(l); time.sleep(10); ns = nodes()
    res = {'opened': has(ns, 'nativeBackButton'), 'liked_rows': len(rows(ns))}
    adb('shell', 'input', 'keyevent', '4'); time.sleep(4); return res
def open_playlist():
    ns = nodes(); r = [n for n in rows(ns) if not re.search(r'lik|aim', n['text'] + n['desc'], re.I)]
    if not r: return {'opened': False, 'reason': 'no playlist row'}
    tap(r[0]); time.sleep(10); ns = nodes()
    return {'opened': has(ns, 'nativeBackButton'), 'track_rows': len(rows(ns))}
def playback():
    ns = nodes(); r = rows(ns)
    if not r: return {'started': False, 'reason': 'no track row'}
    tap(r[0]); time.sleep(12); ns = nodes()
    mini = has(ns, 'nativeMiniPlayer') or has(ns, 'nativeMiniPlayerContainer')
    pp = by_id(ns, 'nativePlayPauseButton'); before = pp['desc'] if pp else None
    res = {'mini_player': mini, 'play_pause_button': pp is not None, 'title_shown': bool(by_id(ns, 'nativePlayerTitle'))}
    if pp:
        tap(pp); time.sleep(3); pp2 = by_id(nodes(), 'nativePlayPauseButton')
        res['play_pause_state_changed'] = bool(pp2) and pp2['desc'] != before
    return res
def persistence():
    relaunch(30); ns = nodes()
    return {'native_root_after_relaunch': has(ns, 'nativeRoot'), 'home_rows_after_relaunch': len(rows(ns))}
for name, fn in [('glass_home', glass_home), ('library', library), ('liked_songs', liked), ('open_playlist', open_playlist), ('playback', playback), ('session_persistence', persistence)]:
    step(name, fn)
print(json.dumps(R))
