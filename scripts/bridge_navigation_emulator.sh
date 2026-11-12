#!/usr/bin/env bash
# Disposable CI emulator, fully synthetic HTML responses and no real login.
set -euo pipefail
phase=install
trap 'rc=$?; if (( rc != 0 )); then echo "::error title=Bridge navigation fixture::phase=$phase exit=$rc"; if [[ -f "$RUNNER_TEMP/bridge-timing.txt" ]]; then while IFS= read -r line; do echo "::error title=Bridge fixture outcome::$line"; done < <(grep -E "^INSTRUMENTATION_RESULT: (phase|overall|error_class)=[A-Za-z0-9_-]+$" "$RUNNER_TEMP/bridge-timing.txt" || true); fi; fi' EXIT
adb install "$(find target-apk -name '*.apk' -print -quit)"
adb install "$RUNNER_TEMP/bridge-test.apk"
# Disposable emulator only: bundled JS may schedule requests; prevent any
# traffic and use only the intercepted synthetic pages, never a real account.
phase=disable_network
adb shell svc wifi disable
adb shell svc data disable
phase=fixture
timeout 120s adb shell am instrument -w -r com.melodix.music.preview.test/com.melodix.test.BridgeNavigationInstrumentation > "$RUNNER_TEMP/bridge-timing.txt"
cat "$RUNNER_TEMP/bridge-timing.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/bridge-timing.txt"
major="$(sed -nE 's/^INSTRUMENTATION_RESULT: webview_major=([0-9]{1,4}|unknown)$/\1/p' "$RUNNER_TEMP/bridge-timing.txt" | head -1)"
[[ -n "$major" ]] || major=unknown
echo "::notice title=Offline WebView version::major=$major"
# Export only fixed enum outcomes, never an exception or page content.
for key in gc_replaced_collected gc_replaced_result gc_retained_collected gc_retained_result; do
  value="$(sed -nE "s/^INSTRUMENTATION_RESULT: ${key}=(yes|no|number|null|undefined|exception|boolean|string|object)$/\1/p" "$RUNNER_TEMP/bridge-timing.txt" | head -1)"
  [[ -n "$value" ]] || { echo "::error title=Bridge collection probe::missing $key"; exit 1; }
  echo "::notice title=Bridge collection probe::$key=$value"
done
for key in proxy_unretained_collected proxy_retained_collected proxy_unretained_result proxy_retained_result; do
  value="$(sed -nE "s/^INSTRUMENTATION_RESULT: ${key}=(yes|no|number_string|null_null|[a-z]+_[a-z]+)$/\1/p" "$RUNNER_TEMP/bridge-timing.txt" | head -1)"
  [[ -n "$value" ]] || { echo "::error title=Bridge proxy probe::missing $key"; exit 1; }
  echo "::notice title=Bridge proxy probe::$key=$value"
done
echo '::notice title=Synthetic bridge navigation::account interface absent; player interface available; account return interface absent; actual retry generation checked without network; no real Spotify requests'
