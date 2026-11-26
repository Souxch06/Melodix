#!/usr/bin/env python3
"""Classic Spotify login through the visible UI (adb taps + text). Credentials only from env, never printed."""
import os, re, subprocess, sys, time
email, password = os.environ.get('SPOTIFY_TEST_EMAIL'), os.environ.get('SPOTIFY_TEST_PASSWORD')
if not email or not password: print('missing-secrets'); sys.exit(2)
def adb(*a, timeout=30): return subprocess.run(['adb', *a], capture_output=True, text=True, timeout=timeout).stdout
def nodes():
    x = adb('exec-out', 'uiautomator', 'dump', '/dev/tty')
    out = []
    for n in re.findall(r'<node [^>]*>', x):
        b = re.search(r'bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"', n)
        if not b: continue
        a = list(map(int, b.groups()))
        g = lambda k: (re.search(k + r'="([^"]*)"', n) or [None, ''])[1]
        out.append({'text': g('text'), 'desc': g('content-desc'), 'cls': g('class'), 'x': (a[0]+a[2])//2, 'y': (a[1]+a[3])//2})
    return out
def find(pred, tries=15):
    for _ in range(tries):
        for n in nodes():
            if pred(n): return n
        time.sleep(2)
def tap(n): adb('shell', 'input', 'tap', str(n['x']), str(n['y']))
def typ(s):
    # adb input text: %s is a space; backslash-escape shell metacharacters.
    esc = ''.join('%s' if c == ' ' else ('\\' + c if c in '\\\'"`$&|;<>()*?![]{}~#%^' else c) for c in s)
    adb('shell', 'input', 'text', esc)
classic = find(lambda n: 'Classic Login' in (n['text'] + n['desc']))
if not classic: print('classic-button-not-found'); sys.exit(3)
tap(classic); time.sleep(6)
fields = None
for _ in range(15):
    f = [n for n in nodes() if n['cls'] == 'android.widget.EditText']
    if len(f) >= 2: fields = f; break
    time.sleep(2)
if not fields: print('password-form-not-found'); sys.exit(4)
tap(fields[0]); time.sleep(1); typ(email); time.sleep(1)
tap(fields[1]); time.sleep(1); typ(password); time.sleep(1)
adb('shell', 'input', 'keyevent', '4')  # hide keyboard so the button is reachable
time.sleep(1)
btn = find(lambda n: (n['text'] + n['desc']).strip().lower() in ('log in', 'login', 'se connecter', 'connexion'), tries=5)
if btn: tap(btn)
else: adb('shell', 'input', 'keyevent', '66')
for _ in range(30):
    time.sleep(2)
    t = ' '.join(n['text'] + ' ' + n['desc'] for n in nodes())
    if 'Welcome back' not in t and 'Email or username' not in t and 'Password' not in t:
        print('left-login-screen'); sys.exit(0)
alerts = [n['text'] for n in nodes() if n['text'] and any(k in n['text'].lower() for k in ('incorrect', 'wrong', 'error', 'captcha', 'verify', 'code', 'robot'))]
print('still-on-login alerts=' + repr(alerts[:3])); sys.exit(5)
