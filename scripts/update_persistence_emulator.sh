#!/usr/bin/env bash
# Disposable emulator only. Synthetic test origin: no real Spotify session.
set -euo pipefail
phase=setup
trap 'rc=$?; if (( rc != 0 )); then echo "::error title=Synthetic WebView upgrade::phase=$phase exit=$rc"; for f in "$RUNNER_TEMP/update-seed.txt" "$RUNNER_TEMP/update-verify.txt"; do if [[ -f "$f" ]]; then while IFS= read -r line; do echo "::error title=Synthetic fixture outcome::$line"; done < <(grep -E "^INSTRUMENTATION_RESULT: (phase|overall|error_class)=[A-Za-z0-9_-]+$" "$f" || true); fi; done; fi' EXIT
old="$(find update-before -name '*.apk' -print -quit)"
new="$(find update-after -name '*.apk' -print -quit)"
[[ -s "$old" && -s "$new" ]]
# Restrict the synthetic run to local WebView fixture data, not Spotify.
phase=disable_network
adb shell svc wifi disable
adb shell svc data disable
phase=install_before
adb install "$old"
phase=install_runner
adb install "$RUNNER_TEMP/update-test.apk"
fixture=com.melodix.music.preview.test/com.melodix.test.UpdatePersistenceInstrumentation
# Independent synthetic origins distinguish instrumentation restart and force
# stop from an APK replacement. The strict primary upgrade test below remains
# unchanged and its origin is never pre-seeded by these probes.
run_probe() {
  local kind="$1" seed_file="$RUNNER_TEMP/update-probe-$1-seed.txt" verify_file="$RUNNER_TEMP/update-probe-$1-verify.txt"
  if ! timeout 90s adb shell am instrument -w -r -e origin_case "$kind" -e mode seed "$fixture" > "$seed_file" || ! grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$seed_file"; then
    echo "::warning title=Synthetic storage control::case=$kind seed=failed"
    return
  fi
  if [[ "$kind" == force_stop ]]; then adb shell am force-stop com.melodix.music.preview; fi
  if timeout 90s adb shell am instrument -w -r -e origin_case "$kind" -e mode verify "$fixture" > "$verify_file" && grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$verify_file"; then
    echo "::notice title=Synthetic storage control::case=$kind verify=passed"
  else
    local failure_phase
    failure_phase="$(sed -nE 's/^INSTRUMENTATION_RESULT: phase=(verify_cookie|verify_storage_callback|verify_storage_value)$/\1/p' "$verify_file" | head -1)"
    [[ -n "$failure_phase" ]] || failure_phase=unknown
    echo "::warning title=Synthetic storage control::case=$kind verify=failed phase=$failure_phase"
  fi
}
phase=controls
run_probe restart
run_probe force_stop
phase=seed
timeout 90s adb shell am instrument -w -r -e mode seed "$fixture" > "$RUNNER_TEMP/update-seed.txt"
cat "$RUNNER_TEMP/update-seed.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-seed.txt"
# Model system process termination followed by normal replacement, never uninstall or clear.
phase=force_stop
adb shell am force-stop com.melodix.music.preview
phase=install_after
adb install -r "$new"
phase=verify
timeout 90s adb shell am instrument -w -r -e mode verify "$fixture" > "$RUNNER_TEMP/update-verify.txt"
cat "$RUNNER_TEMP/update-verify.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-verify.txt"
echo '::notice title=Synthetic WebView upgrade::cookie and localStorage survived install -r; no Spotify authentication was tested'
