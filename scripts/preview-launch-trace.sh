#!/usr/bin/env bash
# Runs with an Android emulator already booted and adb connected.
# Installs the published preview APK, launches it, and writes screenshots,
# UI dumps, logcat, prefs and a report into $RUNNER_TEMP/state.
set -uo pipefail

package_id="com.melodix.music.preview"
activity_id="com.melodix.music.MainActivity"
apk_path="${APK_PATH:-$RUNNER_TEMP/apk/Melodix-Preview-v1.2.2-test1.apk}"
state="${RUNNER_TEMP:-/tmp}/state"
mkdir -p "$state"

note() {
  printf '::notice title=preview-launch::%s\n' "$1"
}

stamp() {
  date -u +%Y%m%dT%H%M%SZ
}

capture() {
  local label="$1"
  local ts
  ts="$(stamp)"
  adb exec-out screencap -p > "$state/${label}-${ts}.png" 2>/dev/null || true
  adb shell uiautomator dump --compressed /sdcard/window.xml >/dev/null 2>&1 || true
  adb exec-out cat /sdcard/window.xml > "$state/${label}-${ts}.xml" 2>/dev/null || true
  grep -o 'text="[^"]*"' "$state/${label}-${ts}.xml" 2>/dev/null | head -n 80 > "$state/${label}-${ts}-text.txt" || true
  note "${label}: $(tr '\n' ' ' < "$state/${label}-${ts}-text.txt" 2>/dev/null | cut -c1-240)"
}

adb install -r "$apk_path" > "$state/install.txt" 2>&1
cat "$state/install.txt"
adb shell dumpsys package "$package_id" 2>/dev/null \
  | grep -E 'versionName|versionCode' | head -n 2 > "$state/installed.txt"
note "installed: $(tr '\n' ' ' < "$state/installed.txt" | cut -c1-300)"
note "release_ref: ${RELEASE_REF:-unknown}"

adb logcat -c >/dev/null 2>&1
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb shell monkey -p "$package_id" -c android.intent.category.LAUNCHER 1 > "$state/monkey.txt" 2>&1

capture "boot-2s"
sleep 8
capture "boot-10s"
sleep 20
capture "boot-30s"

adb shell dumpsys activity activities 2>/dev/null \
  | grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' | head -n 3 > "$state/resumed.txt"
note "resumed: $(tr '\n' ' ' < "$state/resumed.txt" | cut -c1-300)"

adb root >/dev/null 2>&1
sleep 3
adb shell cat "/data/data/$package_id/shared_prefs/melodix_native.xml" > "$state/prefs.xml" 2>/dev/null || true
note "stage: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-300)"

adb logcat -d -b crash > "$state/crash.txt" 2>&1
adb logcat -d > "$state/logcat.txt" 2>&1
grep -n -A 60 'FATAL EXCEPTION' "$state/logcat.txt" > "$state/fatal.txt" 2>/dev/null || true

# Demo-home extra paints labelled playlists without Spotify login.
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb shell am start -n "${package_id}/${activity_id}" --ez melodix_demo_home true > "$state/demo-start.txt" 2>&1
sleep 8
capture "demo-8s"
grep -c 'DEMO' "$state"/demo-8s-*-text.txt > "$state/demo-hits.txt" 2>/dev/null || echo 0 > "$state/demo-hits.txt"

{
  echo "installed: $(tr '\n' ' ' < "$state/installed.txt" 2>/dev/null)"
  echo "release advertises: ${RELEASE_REF:-unknown}"
  echo "resumed: $(tr '\n' ' ' < "$state/resumed.txt" 2>/dev/null)"
  echo "stage prefs: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-600)"
  echo "demo hits: $(cat "$state/demo-hits.txt" 2>/dev/null)"
  echo "visible boot-30s: $(tr '\n' ' ' < "$state"/boot-30s-*-text.txt 2>/dev/null | cut -c1-600)"
  echo "visible demo-8s: $(tr '\n' ' ' < "$state"/demo-8s-*-text.txt 2>/dev/null | cut -c1-600)"
  echo "--- fatal ---"
  head -c 3000 "$state/fatal.txt" 2>/dev/null
  echo "--- crash buffer ---"
  head -c 2000 "$state/crash.txt" 2>/dev/null
} > "$state/report.txt"

note "fatal: $(grep -c . "$state/fatal.txt" 2>/dev/null) line(s) captured"
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

exit 0
