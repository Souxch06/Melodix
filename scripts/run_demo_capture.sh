#!/usr/bin/env bash
set -euo pipefail
apk="$1"; profile="$2"; output="captures/$profile"
adb install -r "$apk"
set +e
python3 scripts/capture_demo_emulator.py "$profile" "$output" > "$RUNNER_TEMP/demo-$profile.log" 2>&1
status=$?
set -e
cat "$RUNNER_TEMP/demo-$profile.log"
if (( status != 0 )); then
  message=$(tail -4 "$RUNNER_TEMP/demo-$profile.log" | tr '\n' ' ' | cut -c1-600)
  echo "::error title=Demo capture $profile::$message"
  adb logcat -d -s AndroidRuntime:E | grep -E 'FATAL EXCEPTION|Exception|Error|com.melodix.demo' | head -20 | while IFS= read -r line; do echo "::error title=Android demo runtime::$line"; done || true
fi
exit "$status"
