#!/usr/bin/env bash
# Disposable emulator only. Synthetic test origin: no real Spotify session.
set -euo pipefail
old="$(find update-before -name '*.apk' -print -quit)"
new="$(find update-after -name '*.apk' -print -quit)"
[[ -s "$old" && -s "$new" ]]
# Restrict the synthetic run to local WebView fixture data, not Spotify.
adb shell svc wifi disable
adb shell svc data disable
adb install "$old"
adb install "$RUNNER_TEMP/update-test.apk"
fixture=com.melodix.music.preview.test/com.melodix.test.UpdatePersistenceInstrumentation
timeout 90s adb shell am instrument -w -r -e mode seed "$fixture" > "$RUNNER_TEMP/update-seed.txt"
cat "$RUNNER_TEMP/update-seed.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-seed.txt"
# Model system process termination followed by normal replacement, never uninstall or clear.
adb shell am force-stop com.melodix.music.preview
adb install -r "$new"
timeout 90s adb shell am instrument -w -r -e mode verify "$fixture" > "$RUNNER_TEMP/update-verify.txt"
cat "$RUNNER_TEMP/update-verify.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-verify.txt"
echo '::notice title=Synthetic WebView upgrade::cookie and localStorage survived install -r; no Spotify authentication was tested'
