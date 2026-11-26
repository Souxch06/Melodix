#!/usr/bin/env bash
# Connected walk of the user's Preview on a fresh emulator. Secrets only via env (SPOTIFY_TEST_*).
set -u
apk=$1; sum=$2; pkg=com.melodix.music.preview
out=connected-evidence; mkdir -p "$out"
echo "$sum  $apk" | sha256sum -c - || exit 1
adb install -r -g "$apk" || exit 1
fwd() { local pid; pid=$(adb shell pidof "$pkg" | tr -d '\r'); adb forward tcp:9222 localabstract:webview_devtools_remote_"$pid" >/dev/null; }
shot() { adb exec-out screencap -p > "$out/$1.png"; timeout 30 adb exec-out uiautomator dump /dev/tty > "$out/$1.xml" 2>/dev/null || true; }
tap_text() { # tap the first node whose text or content-desc equals $1
  local xml; xml=$(timeout 30 adb exec-out uiautomator dump /dev/tty 2>/dev/null)
  local b; b=$(printf '%s' "$xml" | python3 -c "
import re,sys; x=sys.stdin.read(); t=sys.argv[1]
for m in re.finditer(r'<node [^>]*>', x):
  n=m.group(0)
  if f'text=\"{t}\"' in n or f'content-desc=\"{t}\"' in n:
    a=list(map(int,re.search(r'bounds=\"\[(\d+),(\d+)\]\[(\d+),(\d+)\]\"',n).groups())); print((a[0]+a[2])//2,(a[1]+a[3])//2); break" "$1")
  [ -n "$b" ] && adb shell input tap $b && echo "tap $1 -> $b" >> "$out/steps.txt" || echo "missing $1" >> "$out/steps.txt"
}
adb logcat -c
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null; sleep 8
shot 00-before-login
# DevTools answered only after a relaunch in earlier runs.
adb shell am force-stop "$pkg"; sleep 2
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null; sleep 20
shot 00b-relaunched
pid=$(adb shell pidof "$pkg" | tr -d '\r')
# S0: the DevTools socket must be Melodix's own WebView (socket name carries the app pid).
{ echo "S0 melodix_pid=$pid sockets=$(adb shell cat /proc/net/unix | grep -o 'webview_devtools_remote_[0-9]*' | sort -u | tr '\n' ' ')"; } > "$out/login-result.txt"
adb shell cat /proc/net/unix | grep -q "webview_devtools_remote_$pid" || echo "S0 STOP no-devtools-socket-for-melodix-pid" >> "$out/login-result.txt"
fwd; timeout 150 node scripts/devtools_login.js >> "$out/login-result.txt" 2>&1; echo "login exit $?" >> "$out/login-result.txt"
sleep 10; shot 01a-after-login
# Melodix side: relaunch so the app re-reads its own session state, then look at what it shows.
adb shell am force-stop "$pkg"; sleep 2
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null
sleep 20; shot 01-after-login-20s
fwd; timeout 20 node scripts/devtools_eval.js session > "$out/session-after-relaunch.json" 2>&1
sleep 20; shot 02-home-40s
fwd; timeout 20 node scripts/devtools_eval.js session > "$out/session-40s.json" 2>&1
tap_text "Rechercher"; sleep 6; shot 03-search
tap_text "Bibliothèque"; sleep 8; shot 04-library
tap_text "Titres likés"; sleep 8; shot 05-liked
adb shell input keyevent 4; sleep 4
tap_text "Accueil"; sleep 6; shot 06-home-again
adb shell am force-stop "$pkg"; sleep 2
adb shell am start -W -n "$pkg/com.melodix.music.MainActivity" > /dev/null; sleep 20; shot 07-relaunch-connected
adb logcat -d -b crash > "$out/crash.txt"
pid=$(adb shell pidof "$pkg" | tr -d '\r'); [ -n "$pid" ] && adb logcat -d --pid="$pid" > "$out/logcat-app.txt"
true
