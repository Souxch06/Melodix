#!/usr/bin/env bash
# Disposable CI emulator only: Chromium trunk snapshot, NOT a stable release,
# no real Spotify session. Verify provider before and after all fixture work.
set -euo pipefail
provider='com.android.webview'
version='156.0.8078.0'
[[ "$(adb shell getprop ro.build.type | tr -d '\r')" == userdebug ]]
! adb shell pm list packages | tr -d '\r' | grep -Fxq "package:$provider"
adb install "$RUNNER_TEMP/webview156.apk"
adb shell cmd webviewupdate set-webview-implementation "$provider"
check_provider() {
  adb shell dumpsys webviewupdate | tr -d '\r' > "$RUNNER_TEMP/provider.txt"
  grep -Fxq "  Current WebView package (name, version): ($provider, $version)" "$RUNNER_TEMP/provider.txt" || \
  grep -Fxq "Current WebView package (name, version): ($provider, $version)" "$RUNNER_TEMP/provider.txt"
}
check_provider
bash scripts/bridge_navigation_emulator.sh
check_provider
major="$(sed -nE 's/^INSTRUMENTATION_RESULT: webview_major=([0-9]{1,4})$/\1/p' "$RUNNER_TEMP/bridge-timing.txt" | head -1)"
[[ "$major" == 156 ]]
echo '::notice title=Offline Chromium fixture::version=156.0.8078.0 snapshot=1706493 stable_channel=no'
