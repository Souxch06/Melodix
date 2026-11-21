#!/usr/bin/env bash
# Disposable emulator only. No Spotify account, network or credential fixture.
set -euo pipefail
phase=setup
trap 'rc=$?; if (( rc != 0 )); then echo "::error title=Synthetic session persistence::phase=$phase exit=$rc"; for f in "$RUNNER_TEMP/update-seed.txt" "$RUNNER_TEMP/update-verify.txt"; do if [[ -f "$f" ]]; then while IFS= read -r line; do echo "::error title=Synthetic fixture outcome::$line"; done < <(grep -E "^INSTRUMENTATION_RESULT: (phase|overall|error_class)=[A-Za-z0-9_-]+$" "$f" || true); fi; done; fi' EXIT
old="$(find update-before -name '*.apk' -print -quit)"
new="$(find update-after -name '*.apk' -print -quit)"
[[ -s "$old" && -s "$new" ]]
phase=disable_network
adb shell svc wifi disable
adb shell svc data disable
phase=install_before
adb install "$old"
phase=install_runner
adb install "$RUNNER_TEMP/update-test.apk"
fixture=com.melodix.music.preview.test/com.melodix.test.UpdatePersistenceInstrumentation
phase=same_process
timeout 90s adb shell am instrument -w -r -e origin_case same_process -e mode roundtrip "$fixture" > "$RUNNER_TEMP/update-roundtrip.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-roundtrip.txt"
echo '::notice title=Synthetic session persistence::case=same_process passed'
run_probe() {
  local kind="$1" seed_file="$RUNNER_TEMP/update-probe-$1-seed.txt" verify_file="$RUNNER_TEMP/update-probe-$1-verify.txt"
  phase="${kind}_seed"
  timeout 90s adb shell am instrument -w -r -e origin_case "$kind" -e mode seed "$fixture" > "$seed_file"
  cat "$seed_file"
  grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$seed_file"
  if [[ "$kind" == force_stop ]]; then adb shell am force-stop com.melodix.music.preview; fi
  phase="${kind}_verify"
  timeout 90s adb shell am instrument -w -r -e origin_case "$kind" -e mode verify "$fixture" > "$verify_file"
  cat "$verify_file"
  grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$verify_file"
  echo "::notice title=Synthetic session persistence::case=$kind passed"
}
run_probe restart
run_probe force_stop
phase=seed
timeout 90s adb shell am instrument -w -r -e mode seed "$fixture" > "$RUNNER_TEMP/update-seed.txt"
cat "$RUNNER_TEMP/update-seed.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-seed.txt"
phase=force_stop
adb shell am force-stop com.melodix.music.preview
phase=install_after
adb install -r "$new"
phase=verify
timeout 90s adb shell am instrument -w -r -e mode verify "$fixture" > "$RUNNER_TEMP/update-verify.txt"
cat "$RUNNER_TEMP/update-verify.txt"
grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "$RUNNER_TEMP/update-verify.txt"
echo '::notice title=Synthetic session persistence::committed native metadata and flushed cookie survived install -r; no restored authorization or Spotify authentication tested'
