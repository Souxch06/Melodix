#!/usr/bin/env bash
# Runs with an Android emulator already booted and adb connected.
# Installs the published preview APK, launches it, and writes everything that
# explains the launch (resumed activity, on-screen text, stored stage, crash
# buffer) into the step summary, the annotations and a commit comment.
set -uo pipefail

package_id="com.melodix.music.preview"
apk_path="${APK_PATH:-$RUNNER_TEMP/apk/Melodix-Preview-v1.2.2-test1.apk}"
state="${RUNNER_TEMP:-/tmp}/state"
mkdir -p "$state"

note() {
  # Annotations are readable from the API even when run logs are not.
  printf '::notice title=preview-launch::%s\n' "$1"
}

adb install -r "$apk_path" > "$state/install.txt" 2>&1
cat "$state/install.txt"
adb shell dumpsys package "$package_id" 2>/dev/null \
  | grep -E 'versionName|versionCode' | head -n 2 > "$state/installed.txt"
note "installed: $(tr '\n' ' ' < "$state/installed.txt" | cut -c1-300)"

adb logcat -c >/dev/null 2>&1
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb shell monkey -p "$package_id" -c android.intent.category.LAUNCHER 1 > "$state/monkey.txt" 2>&1
sleep 30

adb shell dumpsys activity activities 2>/dev/null \
  | grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' | head -n 3 > "$state/resumed.txt"
note "resumed: $(tr '\n' ' ' < "$state/resumed.txt" | cut -c1-300)"

adb shell uiautomator dump --compressed /sdcard/window.xml >/dev/null 2>&1
adb exec-out cat /sdcard/window.xml > "$state/window.xml" 2>/dev/null
grep -o 'text="[^"]*"' "$state/window.xml" 2>/dev/null | head -n 30 > "$state/window-text.txt"
note "visible: $(tr '\n' ' ' < "$state/window-text.txt" | cut -c1-300)"

adb root >/dev/null 2>&1
sleep 3
adb shell cat "/data/data/$package_id/shared_prefs/melodix_native.xml" > "$state/prefs.xml" 2>/dev/null
note "stage: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-300)"

adb logcat -d -b crash > "$state/crash.txt" 2>&1
adb logcat -d > "$state/logcat.txt" 2>&1
grep -n -A 60 'FATAL EXCEPTION' "$state/logcat.txt" > "$state/fatal.txt" 2>/dev/null

{
  echo "installed: $(tr '\n' ' ' < "$state/installed.txt" 2>/dev/null)"
  echo "release advertises: ${RELEASE_REF:-unknown}"
  echo "resumed: $(tr '\n' ' ' < "$state/resumed.txt" 2>/dev/null)"
  echo "stage prefs: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-600)"
  echo "visible text: $(tr '\n' ' ' < "$state/window-text.txt" 2>/dev/null | cut -c1-600)"
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

# The run is informative, not a gate: exit 0 so the report stays readable.
exit 0
