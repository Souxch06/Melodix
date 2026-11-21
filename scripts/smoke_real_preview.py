#!/usr/bin/env python3
"""Start the actual launcher on a clean emulator; never create or bypass a session."""
import json
import pathlib
import subprocess
import sys
import time

out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'
result = {'status': 'failed', 'checks': [],
          'scope': 'launcher/process smoke only; no authenticated shell or Spotify session verified'}


def adb(*args):
    return subprocess.run(['adb', *args], check=True, stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE, timeout=40).stdout


try:
    adb('logcat', '-c')
    adb('shell', 'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER', '1')
    time.sleep(20)
    if not adb('shell', 'pidof', pkg).strip():
        raise RuntimeError('main application process is not running')
    result['checks'].append('main-process-running')
    activities = adb('shell', 'dumpsys', 'activity', 'activities').decode(errors='replace')
    if 'com.melodix.music.MainActivity' not in activities:
        raise RuntimeError('MainActivity not present in the activity stack')
    result['checks'].append('real-main-activity-in-stack')
    image = adb('exec-out', 'screencap', '-p')
    if not image.startswith(b'\x89PNG\r\n\x1a\n'):
        raise RuntimeError('invalid screenshot')
    (out / 'launcher.png').write_bytes(image)
    log = adb('logcat', '-d', '-s', 'AndroidRuntime:E').decode(errors='replace')
    if 'FATAL EXCEPTION' in log:
        raise RuntimeError('AndroidRuntime FATAL EXCEPTION while launching')
    result['checks'].append('no-androidruntime-fatal')
    result['status'] = 'passed'
except Exception as exc:
    result['failure'] = str(exc)
    print('::error title=Real preview launcher::' + str(exc), flush=True)
    raise
finally:
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print('::notice title=Real preview launcher::' + json.dumps(result), flush=True)
