#!/usr/bin/env bash
# Cold start of the exact user-supplied APK on a fresh emulator: screenshots + logcat only.
set -u
apk=${1:-diagnostics/user-apk/Melodix-Preview-1022454.apk}
sum=${2:-2cde36585b4cf37fe104d4d82e1d29592bcba1b0dca235005d97b350db7e4c88}
out=user-apk-evidence; mkdir -p "$out"
echo "$sum  $apk" | sha256sum -c - || exit 1
base=${3:-}
if [ -n "$base" ]; then  # update path: the user's installed APK first, then this one over it
  adb install -r -g "$base" > "$out/install-base.txt" 2>&1 || exit 1
fi
adb install -r -g "$apk" > "$out/install.txt" 2>&1 || { cat "$out/install.txt"; exit 1; }
adb shell dumpsys package com.melodix.music.preview | grep -E 'versionCode|versionName' | head -2 > "$out/installed-version.txt"
pkg=com.melodix.music.preview

probe() { # $1 = label: page URL(s) seen by the WebView DevTools endpoint
  local pid; pid=$(adb shell pidof "$pkg" | tr -d '\r')
  adb forward tcp:9222 localabstract:webview_devtools_remote_"$pid" >/dev/null 2>&1 || true
  curl -s --max-time 5 http://127.0.0.1:9222/json > "$out/devtools-$1.json" || echo "devtools unavailable" > "$out/devtools-$1.json"
  node scripts/devtools_eval.js > "$out/dom-$1.json" 2>&1 || true
  adb forward --remove tcp:9222 >/dev/null 2>&1 || true
}
adb logcat -c
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" | tee "$out/am-start.txt"
for t in 2 6 15 30; do
  sleep $((t - ${prev:-0})); prev=$t
  adb exec-out screencap -p > "$out/cold-${t}s.png"
  probe "cold-${t}s"
  adb exec-out uiautomator dump /dev/tty > "$out/ui-${t}s.xml" 2>/dev/null || true
done
# Second launch after force-stop: cookies/WebView state of the first launch kept.
adb shell am force-stop "$pkg"; sleep 2
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" >/dev/null; sleep 12
adb exec-out screencap -p > "$out/relaunch-12s.png"
probe relaunch-12s
sleep 15; adb exec-out screencap -p > "$out/relaunch-27s.png"; probe relaunch-27s
adb exec-out uiautomator dump /dev/tty > "$out/ui-relaunch.xml" 2>/dev/null || true
# No credentials: does the official classic (allow_password) page render inside Melodix?
adb shell input tap 540 1296; sleep 15
adb exec-out screencap -p > "$out/classic-15s.png"
probe classic-15s
sleep 165; adb exec-out screencap -p > "$out/classic-180s.png"; probe classic-180s
pid=$(adb shell pidof "$pkg" | tr -d '\r')
adb logcat -d > "$out/logcat-all.txt"
grep -E "MelodixWeb|chromium|Console|CONSOLE" "$out/logcat-all.txt" > "$out/logcat-web.txt" || true
adb logcat -d -b crash > "$out/crash.txt"
[ -n "$pid" ] && adb logcat -d --pid="$pid" > "$out/logcat-app.txt"
true
