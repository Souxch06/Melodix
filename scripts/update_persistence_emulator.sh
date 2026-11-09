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
  local seed_mode=seed
  if [[ "$kind" == settled ]]; then seed_mode=seed_settled; fi
  if ! timeout 90s adb shell am instrument -w -r -e origin_case "$kind" -e mode "$seed_mode" "$fixture" > "$seed_file" || ! grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$seed_file"; then
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
    local value_kind
    value_kind="$(sed -nE 's/^INSTRUMENTATION_RESULT: value_kind=(null|expected|other)$/\1/p' "$verify_file" | head -1)"
    [[ -n "$value_kind" ]] || value_kind=unknown
    echo "::warning title=Synthetic storage control::case=$kind verify=failed phase=$failure_phase value=$value_kind"
  fi
}
phase=controls
if timeout 90s adb shell am instrument -w -r -e origin_case same_process -e mode roundtrip "$fixture" > "$RUNNER_TEMP/update-roundtrip.txt" && grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-roundtrip.txt"; then
  echo "::notice title=Synthetic storage control::case=same_process verify=passed"
else
  echo "::warning title=Synthetic storage control::case=same_process verify=failed"
fi
run_probe restart
run_probe force_stop
run_probe settled
# Separate origin: write and keep the WebView alive for five seconds BEFORE
# the primary immediate-write origin is seeded. This control cannot seed or
# delay the primary origin and does not replace its fail-closed assertion.
phase=settled_upgrade_seed
timeout 90s adb shell am instrument -w -r -e origin_case settled_upgrade -e mode seed_settled "$fixture" > "$RUNNER_TEMP/update-settled-seed.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-settled-seed.txt"
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
primary_ok=false
if timeout 90s adb shell am instrument -w -r -e mode verify "$fixture" > "$RUNNER_TEMP/update-verify.txt" && grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-verify.txt"; then
  primary_ok=true
fi
cat "$RUNNER_TEMP/update-verify.txt"
# Evaluate the settled-write control even if the primary strict test failed.
# This is observational only and cannot turn a primary failure into success.
if timeout 90s adb shell am instrument -w -r -e origin_case settled_upgrade -e mode verify "$fixture" > "$RUNNER_TEMP/update-settled-verify.txt" && grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-settled-verify.txt"; then
  echo '::notice title=Synthetic storage control::case=settled_upgrade verify=passed'
else
  echo '::warning title=Synthetic storage control::case=settled_upgrade verify=failed'
fi
if [[ "$primary_ok" != true ]]; then exit 1; fi
echo '::notice title=Synthetic WebView upgrade::cookie and localStorage survived install -r; no Spotify authentication was tested'
