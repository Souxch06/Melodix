#!/usr/bin/env bash
# Cold start of the exact user-supplied APK on a fresh emulator: screenshots + logcat only.
set -u
apk=diagnostics/user-apk/Melodix-Preview-1022454.apk
out=user-apk-evidence; mkdir -p "$out"
echo "2cde36585b4cf37fe104d4d82e1d29592bcba1b0dca235005d97b350db7e4c88  $apk" | sha256sum -c - || exit 1
adb install -r -g "$apk" || exit 1
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
pid=$(adb shell pidof "$pkg" | tr -d '\r')
adb logcat -d > "$out/logcat-all.txt"
adb logcat -d -b crash > "$out/crash.txt"
[ -n "$pid" ] && adb logcat -d --pid="$pid" > "$out/logcat-app.txt"
true
