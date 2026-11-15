#!/usr/bin/env bash
# Fresh unauthenticated emulator only. No logcat, UI dump, account or network data.
set -Eeuo pipefail
phase='integrity'
trap 'echo "::error title=Offline smoke phase::${phase}" >&2' ERR
apk="${1:?exact signed APK path required}"
expected="${2:-7a8c75562f532a209a8d33e9f91917d977db91454468c6c926bd870385a31473}"
[[ "$expected" =~ ^[0-9a-f]{64}$ ]]
pkg='com.melodix.music.preview'
activity='com.melodix.music.MainActivity'
test -f "$apk"
test "$(sha256sum "$apk" | cut -d' ' -f1)" = "$expected"
# Before the app is installed/launched, remove both emulated transports and
# fail closed unless Android reports that there is no default network.
retry_device_command() {
  local attempt
  for attempt in 1 2 3; do
    if "$@" >/dev/null 2>&1; then return 0; fi
    sleep 2
  done
  return 1
}
phase='enable airplane mode on emulator'
retry_device_command adb shell cmd connectivity airplane-mode enable
phase='disable emulator wifi'
retry_device_command adb shell svc wifi disable
phase='disable emulator mobile data'
retry_device_command adb shell svc data disable
phase='verify no default network'
for attempt in $(seq 1 30); do
  if adb shell dumpsys connectivity | tr -d '\r' | grep -Eq '^[[:space:]]*Active default network: (null|none)[[:space:]]*$'; then
    break
  fi
  if [[ "$attempt" == 30 ]]; then echo 'No proof that the emulator is offline; refusing to launch.' >&2; exit 1; fi
  sleep 1
done
echo '::notice title=Offline smoke::No default network observed before install.'
phase='install exact signed APK'
adb install "$apk" >/dev/null
# Fresh emulator, no sign-in or Spotify account. Grant only local runtime UI permissions.
adb shell pm grant "$pkg" android.permission.BLUETOOTH_CONNECT >/dev/null 2>&1 || true
adb shell pm grant "$pkg" android.permission.POST_NOTIFICATIONS >/dev/null 2>&1 || true
phase='start activity offline'
adb shell am start -W -n "$pkg/$activity" >/dev/null
sleep 5
check_resumed() {
  local attempt
  for attempt in $(seq 1 30); do
    if adb shell pidof "$pkg" >/dev/null 2>&1 &&
       adb shell dumpsys activity activities | tr -d '\r' | grep -E 'mResumedActivity|topResumedActivity' | grep -F "$pkg/" | grep -F 'MainActivity' >/dev/null; then
      return 0
    fi
    sleep 1
  done
  # Fresh offline emulator only. Classify a fatal without exposing log lines,
  # page URLs, application data or other process output in CI annotations.
  python3 - "$pkg" <<'PYCODE'
import re,subprocess,sys
p=subprocess.run(['adb','logcat','-d','-v','brief','-s','AndroidRuntime:E'],capture_output=True,text=True)
blocks=re.split(r'(?=FATAL EXCEPTION)', p.stdout)
block=next((b for b in blocks if b.startswith('FATAL EXCEPTION') and ('Process: '+sys.argv[1]) in b), '')
if block:
    kind=next((x for x in ('VerifyError','NoSuchMethodError','NoClassDefFoundError','NullPointerException','SecurityException') if x in block),'other')
    print('::error title=Offline smoke crash classification::fatal=true; type='+kind)
else:
    print('::error title=Offline smoke crash classification::fatal_not_observed; activity_not_confirmed')
PYCODE
  return 1
}
phase='verify first resumed activity'
check_resumed
echo '::notice title=Offline smoke::Activity resumed on fresh emulator.'
# Exercise the platform orientation change only, not an authenticated flow.
phase='verify landscape rotation'
adb shell settings put system accelerometer_rotation 0
adb shell settings put system user_rotation 1
sleep 3
check_resumed
phase='verify portrait rotation'
adb shell settings put system user_rotation 0
sleep 3
check_resumed
printf '%s\n' 'Offline emulator: exact signed APK installed, activity resumed before/after orientation changes.'
printf '%s\n' 'No login, Spotify session, playback, user data, real device or latency was tested.'
