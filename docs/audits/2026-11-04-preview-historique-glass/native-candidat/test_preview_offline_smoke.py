#!/usr/bin/env python3
"""Check the offline smoke script's fail-closed order with fake adb, never Android."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).with_name('preview-offline-smoke.sh')

class OfflineSmokeTest(unittest.TestCase):
    def run_smoke(self, network, digest='7a8c75562f532a209a8d33e9f91917d977db91454468c6c926bd870385a31473', resumed=True):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); log = root/'calls'; apk = root/'synthetic.apk'; apk.touch()
            tools = root/'bin'; tools.mkdir()
            programs = {
                'sha256sum': '#!/bin/sh\nprintf "%s  fake\\n" "$FAKE_DIGEST"\n',
                'sleep': '#!/bin/sh\nexit 0\n',
                'adb': '''#!/bin/sh
printf '%s\\n' "$*" >> "$FAKE_LOG"
case "$*" in
 'shell dumpsys connectivity') printf 'Active default network: %s\\n' "$FAKE_NETWORK" ;;
 'shell dumpsys activity activities')
   if [ "$FAKE_RESUMED" = yes ]; then printf 'topResumedActivity: com.melodix.music.preview/com.melodix.music.MainActivity\\n'; fi ;;
esac
exit 0
''',
            }
            for name, content in programs.items():
                path = tools/name; path.write_text(content); path.chmod(0o755)
            env = dict(os.environ, PATH=f'{tools}:{os.environ["PATH"]}', FAKE_LOG=str(log), FAKE_DIGEST=digest,
                       FAKE_NETWORK=network, FAKE_RESUMED='yes' if resumed else 'no')
            result = subprocess.run(['bash', str(SCRIPT), str(apk)], env=env, text=True, capture_output=True)
            return result, log.read_text().splitlines() if log.exists() else []

    def test_online_fails_before_install_and_launch(self):
        result, calls = self.run_smoke('100')
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(any(c.startswith(('install ', 'shell am start')) for c in calls))
        self.assertIn('refusing to launch', result.stderr)

    def test_wrong_hash_fails_before_touching_emulator(self):
        result, calls = self.run_smoke('null', digest='incorrect')
        self.assertNotEqual(result.returncode, 0); self.assertEqual(calls, [])

    def test_offline_launch_then_orientation_smoke(self):
        result, calls = self.run_smoke('null')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertLess(calls.index('shell dumpsys connectivity'), next(i for i,c in enumerate(calls) if c.startswith('install ')))
        self.assertTrue(any(c.startswith('shell am start -W') for c in calls))
        self.assertIn('shell settings put system user_rotation 1', calls)
        self.assertIn('shell settings put system user_rotation 0', calls)
        self.assertFalse(any('logcat' in c or 'uiautomator' in c for c in calls))

    def test_non_resumed_activity_fails(self):
        result, calls = self.run_smoke('null', resumed=False)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(any('user_rotation 1' in c for c in calls))

if __name__ == '__main__': unittest.main(verbosity=2)
