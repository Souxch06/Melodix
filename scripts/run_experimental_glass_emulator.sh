#!/usr/bin/env bash
set -euo pipefail
form="$1"
if [[ "$form" == tablet ]]; then
  adb shell wm size 1920x1200
  adb shell wm density 160
else
  adb shell wm size 1080x1920
  adb shell wm density 420
fi
adb install "candidate/$APK_NAME"
python3 scripts/experimental_glass_emulator.py
