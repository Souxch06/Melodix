#!/usr/bin/env bash
set -euo pipefail
profile="$1"
apk=$(find target-apk -type f -name '*.apk' -print -quit)
[[ -s "$apk" ]] || { echo '::error title=Replay capture::original APK missing'; exit 1; }
echo '54231b677bc382f608f67c1bd5f8ff8409c34b76620fc4bdc2fb4b2f67364066  '"$apk" | sha256sum -c -
bash scripts/run_demo_capture.sh "$apk" "$profile"
python3 scripts/capture_real_no_session.py "$profile" "captures/$profile/real-no-session"
