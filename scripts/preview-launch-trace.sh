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

adb install -r "$apk_path" > "$state/install.txt" 2>&1 || true
cat "$state/install.txt"
note "install: $(tr '\n' ' ' < "$state/install.txt" | cut -c1-300)"
adb shell dumpsys package "$package_id" 2>/dev/null \
  | grep -E 'versionName|versionCode' | head -n 2 > "$state/installed.txt"
note "installed: $(tr '\n' ' ' < "$state/installed.txt" | cut -c1-300)"

# Fresh CI images boot into the Google setup wizard, which hides every app
# and destabilises uiautomator. Mark the device provisioned and go home
# before launching anything.
for _ in 1 2 3 4 5 6 7 8 9 10; do
  [[ "$(adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" == "1" ]] && break
  sleep 10
done
adb shell settings put global device_provisioned 1 >/dev/null 2>&1 || true
adb shell settings put secure user_setup_complete 1 >/dev/null 2>&1 || true
adb shell pm disable-user --user 0 com.google.android.setupwizard >/dev/null 2>&1 || true
adb shell input keyevent KEYCODE_HOME >/dev/null 2>&1 || true
sleep 3

adb logcat -c >/dev/null 2>&1
adb shell am force-stop "$package_id" >/dev/null 2>&1
adb shell monkey -p "$package_id" -c android.intent.category.LAUNCHER 1 > "$state/monkey.txt" 2>&1
# Wait until OUR activity is the resumed one (up to 120 s), not a fixed sleep.
for _ in $(seq 1 24); do
  sleep 5
  adb shell dumpsys activity activities 2>/dev/null \
    | grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' | head -n 3 > "$state/resumed.txt"
  grep -q "$package_id" "$state/resumed.txt" 2>/dev/null && break
done
note "resumed: $(tr '\n' ' ' < "$state/resumed.txt" | cut -c1-300)"

adb shell timeout 30 uiautomator dump --compressed /sdcard/window.xml >/dev/null 2>&1 || true
adb exec-out cat /sdcard/window.xml > "$state/window.xml" 2>/dev/null || true

# Second launch: the startup-interruption / crash report of the FIRST launch
# is displayed on this one - capture it photo-ready.
adb shell am force-stop "$package_id" >/dev/null 2>&1
sleep 2
adb shell monkey -p "$package_id" -c android.intent.category.LAUNCHER 1 >> "$state/monkey.txt" 2>&1

# TIMELINE. The previous capture sampled twice (as soon as the activity was
# resumed, then 20 s later) and could not tell "slow startup" from "stuck on
# the splash for ever" - both look like empty on-screen text. Sample the same
# launch repeatedly instead: at each sample the stage chain says how far the
# native startup went, and the on-screen text says whether the native shell is
# really painted. A recovery after 30-60 s shows up as a later sample that has
# more stages and real text.
: > "$state/timeline.txt"
# Android puts an "isn't responding" dialog on top of a hung app, and that
# dialog freezes every later sample: the trace then proves the hang and nothing
# else. Tapping its own "Wait" button lets the process finish starting, so the
# following samples answer the real question - does the app ever reach its
# interface, and how long does it take.
dismiss_anr() {
  local bounds
  local x1 y1 x2 y2
  bounds="$(grep -o 'text="\(Wait\|Attendre\)"[^>]*bounds="\[[0-9]*,[0-9]*\]\[[0-9]*,[0-9]*\]"' "$state/at.xml" 2>/dev/null | head -n 1)"
  if [[ -z "$bounds" ]]; then return 0; fi
  x1="$(printf '%s' "$bounds" | sed -n 's/.*bounds="\[\([0-9]*\),\([0-9]*\)\]\[\([0-9]*\),\([0-9]*\)\]".*/\1/p')"
  y1="$(printf '%s' "$bounds" | sed -n 's/.*bounds="\[\([0-9]*\),\([0-9]*\)\]\[\([0-9]*\),\([0-9]*\)\]".*/\2/p')"
  x2="$(printf '%s' "$bounds" | sed -n 's/.*bounds="\[\([0-9]*\),\([0-9]*\)\]\[\([0-9]*\),\([0-9]*\)\]".*/\3/p')"
  y2="$(printf '%s' "$bounds" | sed -n 's/.*bounds="\[\([0-9]*\),\([0-9]*\)\]\[\([0-9]*\),\([0-9]*\)\]".*/\4/p')"
  if [[ -z "$x1" || -z "$y1" || -z "$x2" || -z "$y2" ]]; then return 0; fi
  adb shell input tap $(( (x1 + x2) / 2 )) $(( (y1 + y2) / 2 )) >/dev/null 2>&1 || true
  echo "anr-wait" >> "$state/anr-taps.txt"
}

sample() {
  local at="$1"
  local stages
  local text
  local focus
  adb shell cat "/data/data/$package_id/shared_prefs/melodix_native.xml" > "$state/prefs-at.txt" 2>/dev/null
  stages="$(sed -n 's/.*name="stage_chain">\([^<]*\)<.*/\1/p' "$state/prefs-at.txt" 2>/dev/null | tr -s ' ' ' ')"
  adb shell dumpsys window 2>/dev/null | grep -E 'mCurrentFocus|mFocusedApp' | head -n 2 > "$state/focus-at.txt"
  focus="$(tr '\n' ' ' < "$state/focus-at.txt" | cut -c1-160)"
  adb shell timeout 20 uiautomator dump --compressed /sdcard/at.xml >/dev/null 2>&1 || true
  adb exec-out cat /sdcard/at.xml > "$state/at.xml" 2>/dev/null || true
  text="$(grep -o 'text="[^"]*"' "$state/at.xml" 2>/dev/null | sed 's/text="//;s/"$//' | grep -v '^$' | head -n 8 | tr '\n' '|')"
  if [[ -z "$text" ]]; then text="(aucun texte)"; fi
  printf 't+%ss | stages: %s | focus: %s | texte: %s\n' "$at" "${stages:-(vide)}" "${focus:-(inconnu)}" "$text" >> "$state/timeline.txt"
  case "$text" in
    *"isn't responding"*|*"ne répond pas"*) dismiss_anr ;;
  esac
}
for wait_s in 5 10 15 20 30 45 60 75 90 105; do
  if [[ "$wait_s" -eq 5 ]]; then sleep 5; else sleep $(( wait_s - prev_s )); fi
  prev_s="$wait_s"
  sample "$wait_s"
done

# Keep a "final" screenshot-equivalent for the existing report fields.
adb shell timeout 30 uiautomator dump --compressed /sdcard/window2.xml >/dev/null 2>&1 || true
adb exec-out cat /sdcard/window2.xml > "$state/window2.xml" 2>/dev/null || true
grep -o 'text="[^"]*"' "$state/window2.xml" 2>/dev/null | head -n 30 > "$state/window-text2.txt"
adb shell dumpsys activity activities 2>/dev/null \
  | grep -E 'mResumedActivity|topResumedActivity|ResumedActivity' | head -n 3 > "$state/resumed2.txt"
note "visible2: $(tr '\n' ' ' < "$state/window-text2.txt" | cut -c1-300)"
grep -o 'text="[^"]*"' "$state/window.xml" 2>/dev/null | head -n 30 > "$state/window-text.txt"
note "visible: $(tr '\n' ' ' < "$state/window-text.txt" | cut -c1-300)"

# Emulation speed decides what the timings mean: without /dev/kvm the guest
# runs fully emulated and every startup is 10-50x slower than on a phone. A
# hang measured there says nothing about a real device unless this is known.
{
  echo "kvm: $(adb shell ls -l /dev/kvm 2>&1 | head -n 1)"
  echo "cpu: $(adb shell getprop ro.product.cpu.abi 2>/dev/null) $(adb shell getprop ro.build.version.release 2>/dev/null)"
  echo "cores: $(adb shell cat /proc/cpuinfo 2>/dev/null | grep -c processor)"
} > "$state/emulator.txt" 2>&1

adb root >/dev/null 2>&1
sleep 3
adb shell cat "/data/data/$package_id/shared_prefs/melodix_native.xml" > "$state/prefs.xml" 2>/dev/null
note "stage: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-300)"

adb logcat -d -b crash > "$state/crash.txt" 2>&1
adb logcat -d > "$state/logcat.txt" 2>&1

# ANR evidence. The device keeps the "why is the main thread blocked" stack in
# /data/anr; logcat only says "ANR in <package>". Without this stack a hang can
# only be guessed at, and the previous run stopped exactly there.
{
  if adb shell test -f /data/anr/traces.txt 2>/dev/null; then
    adb shell cat /data/anr/traces.txt 2>/dev/null
  fi
  for f in $(adb shell ls /data/anr/ 2>/dev/null | grep -E '^anr_' | head -n 3); do
    adb shell cat "/data/anr/$f" 2>/dev/null
  done
} > "$state/anr.txt" 2>&1
# The file holds every process: keep only the block whose "Cmd line:" is ours.
# A plain grep for "main" matched system_server's thread and told us nothing
# about this app's hang.
awk -v pkg="$package_id" '/Cmd line: /{keep=($0 ~ pkg)} keep' "$state/anr.txt" > "$state/anr-app.txt" 2>/dev/null || true
grep -A 45 '^"main"' "$state/anr-app.txt" 2>/dev/null | head -n 50 > "$state/anr-main.txt" || true
grep -n -A 12 'ANR in' "$state/logcat.txt" 2>/dev/null | head -n 40 > "$state/anr-logcat.txt" || true
# The main-thread stack collected by the app's own watchdog at 60 s.
adb shell cat "/data/data/$package_id/shared_prefs/melodix_native.xml" 2>/dev/null \
  | sed -n 's/.*name="last_crash">\([^<]*\)<.*/\1/p' > "$state/last-crash.txt"
grep -n -A 60 'FATAL EXCEPTION' "$state/logcat.txt" > "$state/fatal.txt" 2>/dev/null

# P0 V30 diagnostic: extract the startup-chain traces the fix added
# (MDXTRACE: bridge start/done, js-shell, main-view, home-rows, ready /
# ready-blocked, native-shell, js-error) plus JS/WebView console errors.
# These answer: does the bridge run, does the shell run, how many playlist
# rows arrive, was ready blocked, what is on screen when it goes blank.
grep -E 'MDXTRACE|chromium.*[Cc]onsole|Web Console' "$state/logcat.txt" 2>/dev/null | tail -n 120 > "$state/trace.txt"
grep -ciE 'ready-blocked' "$state/logcat.txt" > "$state/trace-blocked.txt" 2>/dev/null
note "mdxtrace: $(grep -c . "$state/trace.txt" 2>/dev/null) line(s) captured"

{
  echo "install: $(tr '\n' ' ' < "$state/install.txt" 2>/dev/null)"
  echo "installed: $(tr '\n' ' ' < "$state/installed.txt" 2>/dev/null)"
  echo "emulateur: $(tr '\n' ' | ' < "$state/emulator.txt" 2>/dev/null)"
  echo "release advertises: ${RELEASE_REF:-unknown}"
  echo "resumed: $(tr '\n' ' ' < "$state/resumed.txt" 2>/dev/null)"
  echo "stage prefs: $(tr -d '\n' < "$state/prefs.xml" 2>/dev/null | cut -c1-600)"
  echo "visible text: $(tr '\n' ' ' < "$state/window-text.txt" 2>/dev/null | cut -c1-600)"
  echo "visible text (2e lancement): $(tr '\n' ' ' < "$state/window-text2.txt" 2>/dev/null | cut -c1-600)"
  echo "--- chronologie du 2e lancement ---"
  head -c 4000 "$state/timeline.txt" 2>/dev/null
  echo "--- ANR: raison (logcat) ---"
  head -c 900 "$state/anr-logcat.txt" 2>/dev/null
  echo "--- ANR: pile du thread principal de l'application ---"
  head -c 2600 "$state/anr-main.txt" 2>/dev/null
  echo "--- ANR: en-tete du processus ---"
  head -c 400 "$state/anr-app.txt" 2>/dev/null
  echo "--- chien de garde (last_crash) ---"
  head -c 700 "$state/last-crash.txt" 2>/dev/null
  echo "--- MDXTRACE startup chain ---"
  head -c 8000 "$state/trace.txt" 2>/dev/null
  echo "--- fatal ---"
  head -c 3000 "$state/fatal.txt" 2>/dev/null
  echo "--- crash buffer ---"
  head -c 2000 "$state/crash.txt" 2>/dev/null
} > "$state/report.txt"

note "ready-blocked count: $(cat "$state/trace-blocked.txt" 2>/dev/null || echo 0)"

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
