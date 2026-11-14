#!/usr/bin/env bash
# Fresh CI emulator only; no real account or session store fixture.
set -euo pipefail
variant="$1"
form="$2"
mkdir -p session-evidence
adb install -r "$(find target-apk -name '*.apk' | head -n 1)"
adb install -r "$RUNNER_TEMP/session-test.apk"
adb shell pm grant com.melodix.music.preview android.permission.POST_NOTIFICATIONS
adb shell pm grant com.melodix.music.preview android.permission.BLUETOOTH_CONNECT
if [[ "$form" == tablet ]]; then adb shell wm size 1920x1200; adb shell wm density 160; else adb shell wm size 1080x1920; adb shell wm density 420; fi
if [[ "$variant" == after && "$form" == phone ]]; then
  timeout 240s adb shell am instrument -w -r com.melodix.music.preview.test/com.melodix.test.SessionGateInstrumentation > session-evidence/result.txt
  cat session-evidence/result.txt
  grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' session-evidence/result.txt
fi
baseline=false
if [[ "$variant" == before ]]; then baseline=true; fi
capture() {
  name="$1"; shift
  adb shell am force-stop com.melodix.music.preview
  adb shell dumpsys gfxinfo com.melodix.music.preview reset > /dev/null
  timeout 90s adb shell am instrument -w -r -e capture_only true -e baseline "$baseline" "$@" com.melodix.music.preview.test/com.melodix.test.SessionGateInstrumentation > "session-evidence/$name.txt"
  cat "session-evidence/$name.txt"
  grep -Fq 'INSTRUMENTATION_RESULT: overall=passed' "session-evidence/$name.txt"
  adb exec-out run-as com.melodix.music.preview cat files/session-captures/status.png > "session-evidence/$name-status.png"
  if [[ "$baseline" == false ]]; then adb exec-out run-as com.melodix.music.preview cat files/session-captures/details.png > "session-evidence/$name-details.png"; fi
  adb exec-out run-as com.melodix.music.preview cat files/session-captures/mdxperf.txt > "session-evidence/$name-mdxperf.txt"
  adb shell dumpsys gfxinfo com.melodix.music.preview | grep -E 'Total frames rendered:|Janky frames:|50th percentile:|90th percentile:|95th percentile:|99th percentile:|Number Missed Vsync:' > "session-evidence/$name-perf.txt" || true
}
capture "$form"
if [[ "$variant" == after && "$form" == phone ]]; then
  adb shell wm size 1080x1000
  adb shell settings put system font_scale 1.6
  capture small-large-font
  adb shell wm size 1080x1920
  adb shell settings put system font_scale 1.0
  capture keyboard -e keyboard true
fi
adb logcat -d -v brief -s MDXPERF:I | grep -E 'sid=[0-9a-f]{8} t=[0-9]+ session-state from=[a-z-]+ state=[a-z-]+ reason=[a-z-]+$' > session-evidence/mdxperf.txt || true
adb logcat -d -v brief -s AndroidRuntime:E | python3 -c 'import re,sys; t=sys.stdin.read(); names=sorted(set(re.findall(r"(?:[A-Za-z_$][\w$]*\.)*[A-Za-z_$][\w$]*(?:Exception|Error)",t))); [print("::error title=Session Android runtime::exception_class="+n) for n in names[:12]]'
