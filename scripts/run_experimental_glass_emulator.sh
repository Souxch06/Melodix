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
echo '::notice title=Experimental Glass offline check::installing exact candidate'
if ! adb install "candidate/$APK_NAME"; then
  echo '::error title=Experimental Glass offline check::candidate install failed'
  exit 1
fi
set +e
python3 scripts/experimental_glass_emulator.py > "$RUNNER_TEMP/experimental-flow.log" 2>&1
status=$?
set -e
cat "$RUNNER_TEMP/experimental-flow.log"
if (( status != 0 )); then
  # Exception class and our bounded message only; never export UI tree/text.
  grep -E '^(AssertionError|subprocess.CalledProcessError|ValueError):' "$RUNNER_TEMP/experimental-flow.log" | tail -1 | while IFS= read -r line; do
    echo "::error title=Experimental Glass offline check::$line"
  done || true
  echo "::error title=Experimental Glass offline check::flow failed exit=$status"
  exit "$status"
fi
