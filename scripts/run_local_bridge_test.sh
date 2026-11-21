#!/usr/bin/env bash
set -euo pipefail
mkdir -p evidence-bridge
adb install target-apk/Melodix-Preview-v1.2.2-test160.apk
adb install "$RUNNER_TEMP/melodix-local-bridge/test.apk"
adb logcat -c
set +e
timeout 180s adb shell am instrument -w -r com.melodix.music.preview.test/com.melodix.test.LocalBridgeInstrumentation > evidence-bridge/instrumentation.txt
rc=$?
set -e
# The harness emits fixed phase names and exception class only, never page/credentials.
cat evidence-bridge/instrumentation.txt
if (( rc != 0 )) || ! grep -Fxq 'INSTRUMENTATION_RESULT: overall=passed' evidence-bridge/instrumentation.txt; then
  echo '::error title=Category B::local bridge fixture failed; see the fixed phase and class'
  exit 1
fi
if adb logcat -d -s AndroidRuntime:E | grep -q 'FATAL EXCEPTION'; then
  echo '::error title=Category B::Android fatal exception'; exit 1
fi
echo '::notice title=Category B::synthetic local fixture passed, not a real Spotify session'
