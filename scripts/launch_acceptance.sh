#!/usr/bin/env bash
set -euo pipefail
: "${APK_NAME:?}"
adb install "target-apk/$APK_NAME"
python3 scripts/capture_launcher_acceptance.py evidence
