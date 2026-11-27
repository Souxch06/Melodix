#!/usr/bin/env python3
"""Content checks for the media-session diagnostic APK. Usage: check_diag_apk.py APK"""
import os
import re
import subprocess
import sys
import zipfile

apk = sys.argv[1]
aapt2 = os.path.join(os.environ['ANDROID_HOME'], 'build-tools', '35.0.0', 'aapt2')
problems = []

with zipfile.ZipFile(apk) as z:
    if z.testzip() is not None:
        problems.append('corrupt zip entry')
    dex_names = [n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex', n)]
    if dex_names != ['classes.dex']:
        problems.append(f'unexpected DEX files: {dex_names}')
    dex = z.read('classes.dex')

tree = subprocess.run([aapt2, 'dump', 'xmltree', '--file', 'AndroidManifest.xml', apk],
                      capture_output=True, text=True, check=True).stdout
if 'android.permission.INTERNET' in tree:
    problems.append('INTERNET permission present: the diagnostic must not be able to send data')
if 'BIND_NOTIFICATION_LISTENER_SERVICE' not in tree:
    problems.append('listener service permission missing')
if 'com.melodix.diag.DiagListenerService' not in tree or 'android.service.notification.NotificationListenerService' not in tree:
    problems.append('NotificationListenerService not declared')
if 'com.melodix.diag.DiagActivity' not in tree:
    problems.append('launcher activity not declared')
if 'com.melodix.music' in tree:
    problems.append('reference to the Melodix production package found in the manifest')

forbidden = {
    b'Landroid/util/Log;': 'logging API (data must not reach logs)',
    b'Ljava/net/': 'network API',
    b'Ljavax/net/': 'network API',
    b'Landroid/net/': 'network API',
    b'Ljava/io/FileOutputStream;': 'file output API (data must not be stored)',
    b'Landroid/content/SharedPreferences;': 'persistent storage API',
}
for needle, why in forbidden.items():
    if needle in dex:
        problems.append(f'{needle.decode()} used: {why}')
for needed in (b'Lcom/melodix/diag/DiagActivity;', b'Lcom/melodix/diag/DiagListenerService;',
               b'Landroid/media/session/MediaSessionManager;', b'getActiveSessions'):
    if needed not in dex:
        problems.append(f'{needed.decode()} missing from DEX')

if problems:
    print('DIAG APK CHECK FAILED:')
    for p in problems:
        print(' -', p)
    raise SystemExit(1)
print('diag APK check: OK (no INTERNET, no logging, no network, no file or preference storage; '
      'listener and launcher declared)')
