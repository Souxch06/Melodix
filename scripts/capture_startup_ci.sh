#!/usr/bin/env bash
# Measurement only on an ephemeral CI emulator. No account, cookies, token,
# library fixture, WebView evaluation, spoof setting or ad setting is injected.
set -euo pipefail
[[ $# -eq 3 ]] || { echo 'usage: capture_startup_ci.sh SERIAL APK OUTPUT_DIR' >&2; exit 2; }
device="$1"
apk="$2"
out="$3"
package="com.melodix.music.preview"
activity="com.melodix.music.MainActivity"
[[ "$device" =~ ^emulator-[0-9]+$ && -s "$apk" ]] || exit 2
mkdir -p "$out"
printf 'source=%s\napk_sha256=%s\naccount=none\n' \
  "$(git rev-parse HEAD)" "$(sha256sum "$apk" | cut -d' ' -f1)" > "$out/provenance.txt"
adb -s "$device" install -r -g "$apk" > "$out/install.txt"

capture() {
  local scenario="$1" wait_seconds="$2"
  adb -s "$device" shell am start -W -n "$package/$activity" \
    | tr -d '\r' > "$out/$scenario-am-start.txt"
  sleep "$wait_seconds"
  local pid
  pid="$(adb -s "$device" shell pidof "$package" | tr -d '\r')"
  [[ "$pid" =~ ^[0-9]+$ ]] || { echo "::error::App did not survive $scenario"; return 1; }
  printf '%s\n' "$pid" > "$out/$scenario-pid.txt"
  # Only the closed measurement grammar is persisted/uploaded. Old duplicate
  # unstamped lines and all unrelated logcat content are discarded.
  adb -s "$device" logcat -d -v brief -s MDXTRACE:I \
    | python3 scripts/startup_timing_journal.py --filter-log - "$out/$scenario.log"
  echo "::notice title=Startup capture $scenario::pid=$pid; entries=$(wc -l < "$out/$scenario.log")"
  if python3 scripts/startup_timing_journal.py "$out/$scenario.log" \
    --json "$out/$scenario.json" --github-notice > "$out/$scenario-table.txt"; then
    cat "$out/$scenario-table.txt"
  else
    echo "::error title=Startup capture $scenario::No usable clock anchor; no timing is claimed."
    return 1
  fi
}

adb -s "$device" shell am force-stop "$package"
adb -s "$device" logcat -c
capture cold 35
# Back/launcher: Android may recreate the Activity or restart the process. The
# sid/anchor and pid show which actually occurred; never assert a warm cache.
adb -s "$device" shell input keyevent KEYCODE_BACK
sleep 3
adb -s "$device" logcat -c
capture warm 20
# HOME/launcher keeps the task instead of using force-stop.
adb -s "$device" shell input keyevent KEYCODE_HOME
sleep 30
adb -s "$device" logcat -c
capture background 20
printf '%s\n' 'CI has no Spotify account: token success, authenticated library and covers are NOT MEASURED unless actually observed; compare phone captures separately.' > "$out/limitations.txt"
