#!/usr/bin/env bash
# Connected checks of the final Glass Preview. Secrets only via env (SPOTIFY_TEST_EMAIL/PASSWORD).
# Published evidence: pre-login capture, login stages (no values), summary.json (booleans/counts), crash buffer.
set -u
apk=$1; sum=$2; pkg=com.melodix.music.preview
out=connected-evidence; mkdir -p "$out"
echo "$sum  $apk" | sha256sum -c - > "$out/apk-sha256.txt" 2>&1 || { cat "$out/apk-sha256.txt"; exit 1; }
adb install -r -g "$apk" > "$out/install.txt" 2>&1 || { cat "$out/install.txt"; exit 1; }
adb shell dumpsys package "$pkg" | grep -E 'versionCode|versionName' | head -2 > "$out/installed-version.txt"
fwd() { local pid; pid=$(adb shell pidof "$pkg" | tr -d '\r'); adb forward tcp:9222 localabstract:webview_devtools_remote_"$pid" >/dev/null; }
adb logcat -c
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null; sleep 15
adb exec-out screencap -p > "$out/00-before-login.png"
pid=$(adb shell pidof "$pkg" | tr -d '\r')
echo "S0 melodix_pid=$pid sockets=$(adb shell cat /proc/net/unix | grep -o 'webview_devtools_remote_[0-9]*' | sort -u | tr '\n' ' ')" > "$out/login-result.txt"
fwd; timeout 150 node scripts/devtools_login.js >> "$out/login-result.txt" 2>&1; rc=$?
echo "login exit $rc" >> "$out/login-result.txt"
if [ "$rc" != 0 ]; then echo "login not completed: connected checks skipped" >> "$out/login-result.txt"; adb logcat -d -b crash > "$out/crash.txt"; exit 0; fi
# Melodix must recognise the session itself after a relaunch (not just the Spotify cookie).
adb shell am force-stop "$pkg"; sleep 2
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null; sleep 25
fwd; timeout 20 node scripts/devtools_eval.js session > "$out/session-web.txt" 2>&1
timeout 900 python3 scripts/connected_checks.py "$out" > /dev/null 2> "$out/checks-errors.txt"
adb logcat -d -b crash > "$out/crash.txt"
true
