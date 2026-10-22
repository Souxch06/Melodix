#!/usr/bin/env bash
# Runs with an Android emulator already booted and adb connected.
# Installs the published preview APK, launches it, and writes screenshots,
# dumps, logcat and a report into $RUNNER_TEMP/state.
# Infrastructure success (emulator up, APK installed) is logged separately
# from app success (MainActivity resumed, no Melodix crash).
set -uo pipefail

package_id="com.melodix.music.preview"
activity_id="com.melodix.music.MainActivity"
apk_path="${APK_PATH:-$RUNNER_TEMP/apk/Melodix-Preview-v1.2.2-test1.apk}"
state="${RUNNER_TEMP:-/tmp}/state"
mkdir -p "$state"

note() {
  printf '::notice title=preview-launch::%s\n' "$1"
}

fail() {
  printf '::error title=preview-launch::%s\n' "$1"
  echo "$1" >> "$state/failures.txt"
}

stamp() {
  date -u +%Y%m%dT%H%M%SZ
}

dismiss_system_dialogs() {
  adb shell am broadcast -a android.intent.action.CLOSE_SYSTEM_DIALOGS >/dev/null 2>&1 || true
  # ANR "Wait" / permission overlays: KEYCODE_BACK then KEYCODE_ESCAPE.
  adb shell input keyevent 4 >/dev/null 2>&1 || true
}

capture() {
  local label="$1"
  local ts
  ts="$(stamp)"
  adb exec-out screencap -p > "$state/${label}-${ts}.png" 2>/dev/null || true
  adb shell dumpsys activity activities > "$state/${label}-${ts}-activities.txt" 2>/dev/null || true
  grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' \
    "$state/${label}-${ts}-activities.txt" 2>/dev/null | head -n 6 \
    > "$state/${label}-${ts}-resumed.txt" || true
  note "${label}: $(tr '\n' ' ' < "$state/${label}-${ts}-resumed.txt" 2>/dev/null | cut -c1-240)"
}

wait_for_activity() {
  local want="$1"
  local seconds="${2:-60}"
  local i
  for i in $(seq 1 "$seconds"); do
    dismiss_system_dialogs
    if adb shell dumpsys activity activities 2>/dev/null | grep -q "$want"; then
      echo "$i" > "$state/wait-${want//\//_}.txt"
      return 0
    fi
    sleep 1
  done
  return 1
}

app_fatal() {
  grep -E "FATAL EXCEPTION|ForegroundServiceDidNotStartInTimeException" "$state/logcat.txt" 2>/dev/null \
    | grep -F "$package_id" || true
}

: > "$state/failures.txt"
echo "release_ref=${RELEASE_REF:-unknown}" > "$state/infra.txt"

if ! adb install -r "$apk_path" > "$state/install.txt" 2>&1; then
  cat "$state/install.txt"
  fail "APK install failed"
  cat "$state/install.txt" >> "$state/report.txt"
  exit 1
fi
cat "$state/install.txt"
adb shell dumpsys package "$package_id" 2>/dev/null \
  | grep -E 'versionName|versionCode' | head -n 2 > "$state/installed.txt"
note "installed: $(tr '\n' ' ' < "$state/installed.txt" | cut -c1-300)"
note "release_ref: ${RELEASE_REF:-unknown}"
echo "install_ok=1" >> "$state/infra.txt"

# Runtime permissions that otherwise open GrantPermissionsActivity on API 35.
adb shell pm grant "$package_id" android.permission.POST_NOTIFICATIONS >/dev/null 2>&1 || true
adb shell pm grant "$package_id" android.permission.BLUETOOTH_CONNECT >/dev/null 2>&1 || true
adb shell appops set "$package_id" POST_NOTIFICATION allow >/dev/null 2>&1 || true

adb logcat -c >/dev/null 2>&1
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb shell am start -W -n "${package_id}/${activity_id}" > "$state/start.txt" 2>&1
cat "$state/start.txt"

capture "boot-2s"
if ! wait_for_activity "$activity_id" 45; then
  fail "MainActivity did not resume within 45s after am start"
fi
capture "boot-ready"
sleep 8
capture "boot-10s"
sleep 12
capture "boot-30s"

adb shell dumpsys activity activities 2>/dev/null \
  | grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' | head -n 5 \
  > "$state/resumed.txt"
note "resumed: $(tr '\n' ' ' < "$state/resumed.txt" | cut -c1-300)"

if ! grep -q "$activity_id" "$state/resumed.txt" 2>/dev/null; then
  fail "top activity is not MainActivity: $(tr '\n' ' ' < "$state/resumed.txt")"
fi

adb logcat -d -b crash -t 400 > "$state/crash.txt" 2>&1
adb logcat -d -t 2500 *:E MelodixDemo:I AndroidRuntime:E ActivityManager:I > "$state/logcat.txt" 2>&1
grep -n -A 40 'FATAL EXCEPTION' "$state/logcat.txt" > "$state/fatal.txt" 2>/dev/null || true
grep -n -A 20 'ForegroundServiceDidNotStartInTimeException' "$state/logcat.txt" \
  > "$state/fgs.txt" 2>/dev/null || true

if grep -q "ForegroundServiceDidNotStartInTimeException" "$state/logcat.txt" 2>/dev/null; then
  fail "ForegroundServiceDidNotStartInTimeException present in logcat"
fi
if grep -E "FATAL EXCEPTION" "$state/logcat.txt" 2>/dev/null | grep -q "$package_id"; then
  fail "FATAL EXCEPTION for $package_id"
fi
if grep -q "Process system isn't responding" "$state"/boot-*-resumed.txt 2>/dev/null; then
  fail "system ANR dialog visible"
fi

# Isolated demo-home extra: labelled tiles, not Spotify data.
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb logcat -c >/dev/null 2>&1
adb shell am start -W -n "${package_id}/${activity_id}" --ez melodix_demo_home true \
  > "$state/demo-start.txt" 2>&1
if ! wait_for_activity "$activity_id" 30; then
  fail "demo launch: MainActivity did not resume"
fi
sleep 5
capture "demo-8s"
adb logcat -d -t 800 MelodixDemo:I AndroidRuntime:E *:S > "$state/demo-logcat.txt" 2>&1
grep -c 'MelodixDemo' "$state/demo-logcat.txt" > "$state/demo-hits.txt" 2>/dev/null || echo 0 > "$state/demo-hits.txt"
if ! grep -q 'MelodixDemo' "$state/demo-logcat.txt" 2>/dev/null; then
  fail "demo extra did not log MelodixDemo painted (isolated demo, not Spotify playlists)"
fi

{
  echo "installed: $(tr '\n' ' ' < "$state/installed.txt" 2>/dev/null)"
  echo "release advertises: ${RELEASE_REF:-unknown}"
  echo "infra: $(tr '\n' ' ' < "$state/infra.txt" 2>/dev/null)"
  echo "resumed: $(tr '\n' ' ' < "$state/resumed.txt" 2>/dev/null)"
  echo "demo hits: $(cat "$state/demo-hits.txt" 2>/dev/null)"
  echo "failures: $(tr '\n' ' | ' < "$state/failures.txt" 2>/dev/null)"
  echo "visible boot-30s: $(tr '\n' ' ' < "$state"/boot-30s-*-resumed.txt 2>/dev/null | cut -c1-400)"
  echo "visible demo-8s: $(tr '\n' ' ' < "$state"/demo-8s-*-resumed.txt 2>/dev/null | cut -c1-400)"
  echo "--- fgs ---"
  head -c 2000 "$state/fgs.txt" 2>/dev/null
  echo "--- fatal ---"
  head -c 3000 "$state/fatal.txt" 2>/dev/null
  echo "--- crash buffer ---"
  head -c 2000 "$state/crash.txt" 2>/dev/null
} > "$state/report.txt"

{
  echo "## Preview launch trace"
  echo
  echo '```'
  head -c 60000 "$state/report.txt"
  echo '```'
} >> "${GITHUB_STEP_SUMMARY:-/dev/null}"

comment_ref="${RELEASE_REF:-${GITHUB_SHA:-}}"
if [[ -n "$comment_ref" ]]; then
  python3 - "$state/report.txt" "$state/comment.json" <<'PY'
import json
import pathlib
import sys
body = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8", errors="replace")[:60000]
pathlib.Path(sys.argv[2]).write_text(
    json.dumps({"body": "Preview emulator trace\n\n```\n" + body + "\n```"}),
    encoding="utf-8",
)
PY
  gh api "repos/${GITHUB_REPOSITORY}/commits/${comment_ref}/comments" \
    --input "$state/comment.json" >/dev/null 2>&1 \
    && note "trace posted as a commit comment" \
    || note "commit comment could not be posted"
fi

if [[ -s "$state/failures.txt" ]]; then
  echo "APP_LAUNCH_FAILED"
  cat "$state/failures.txt"
  exit 1
fi
echo "APP_LAUNCH_OK"
exit 0
