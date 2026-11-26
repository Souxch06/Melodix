#!/usr/bin/env python3
"""Classic Spotify login by screen position + keyboard (the WebView exposes no accessibility
nodes and DevTools did not answer). Positions measured on Pixel 6 1080x2400 captures.
Credentials only from env, never printed; captures taken after typing show masked dots."""
import os, subprocess, sys, time
email, password = os.environ.get('SPOTIFY_TEST_EMAIL'), os.environ.get('SPOTIFY_TEST_PASSWORD')
if not email or not password: print('missing-secrets'); sys.exit(2)
out = sys.argv[1]
def adb(*a): return subprocess.run(['adb', *a], capture_output=True, timeout=40)
def shot(n): open(f'{out}/login-{n}.png', 'wb').write(adb('exec-out', 'screencap', '-p').stdout)
def key(k): adb('shell', 'input', 'keyevent', str(k))
def typ(s):  # adb input text: %s = space; backslash-escape shell metacharacters
    adb('shell', 'input', 'text', ''.join('%s' if c == ' ' else ('\\' + c if c in '\\\'"`$&|;<>()*?![]{}~#%^' else c) for c in s))
adb('shell', 'input', 'tap', '540', '1296'); time.sleep(8); shot('1-classic')   # "Email + Password Classic Login"
adb('shell', 'input', 'tap', '540', '840'); time.sleep(2); typ(email); time.sleep(1); shot('2-email')
key(61); time.sleep(1); typ(password); time.sleep(1); shot('3-password')       # TAB to password
key(66); time.sleep(25); shot('4-submitted')                                    # ENTER submits
print('submitted')
