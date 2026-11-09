#!/usr/bin/env bash
# Disposable CI emulator, fully synthetic HTML responses and no real login.
set -euo pipefail
phase=install
trap 'rc=$?; if (( rc != 0 )); then echo "::error title=Bridge navigation fixture::phase=$phase exit=$rc"; if [[ -f "$RUNNER_TEMP/bridge-timing.txt" ]]; then while IFS= read -r line; do echo "::error title=Bridge fixture outcome::$line"; done < <(grep -E "^INSTRUMENTATION_RESULT: (phase|overall|error_class)=[A-Za-z0-9_-]+$" "$RUNNER_TEMP/bridge-timing.txt" || true); fi; fi' EXIT
adb install "$(find target-apk -name '*.apk' -print -quit)"
adb install "$RUNNER_TEMP/bridge-test.apk"
phase=fixture
timeout 120s adb shell am instrument -w -r com.melodix.music.preview.test/com.melodix.test.BridgeNavigationInstrumentation > "$RUNNER_TEMP/bridge-timing.txt"
cat "$RUNNER_TEMP/bridge-timing.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/bridge-timing.txt"
echo '::notice title=Synthetic bridge navigation::account interface absent; player interface available; account return interface absent; no real Spotify requests'
