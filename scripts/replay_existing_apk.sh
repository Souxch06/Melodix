#!/usr/bin/env sh
set -eu
apk=$(find target-apk -type f -name '*.apk' -print -quit)
test -s "$apk" || { echo '::error title=Replay setup::APK file missing from downloaded artifact'; exit 1; }
echo '54231b677bc382f608f67c1bd5f8ff8409c34b76620fc4bdc2fb4b2f67364066  '"$apk" | sha256sum -c - || { echo '::error title=Replay setup::APK hash mismatch'; exit 1; }
echo '::notice title=Replay setup::original APK hash verified'
adb install -r "$apk" || { echo '::error title=Replay setup::adb install failed'; exit 1; }
echo '::notice title=Replay setup::installed'
# Only this fresh CI emulator: match the explicit runtime permissions used by the session-gate tests.
adb shell pm grant com.melodix.music.preview android.permission.POST_NOTIFICATIONS
adb shell pm grant com.melodix.music.preview android.permission.BLUETOOTH_CONNECT
echo '::notice title=Replay setup::CI emulator runtime permissions granted'
python3 scripts/replay_demo_entry.py > replay-output.txt 2>&1 || {
  cat replay-output.txt
  message=$(tail -8 replay-output.txt | tr '\n' ' ' | cut -c1-1000)
  echo "::error title=Replay script::$message"
  exit 1
}
cat replay-output.txt
