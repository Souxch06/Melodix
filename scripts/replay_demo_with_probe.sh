#!/usr/bin/env bash
set -euo pipefail
adb install target-apk/Melodix-Preview-v1.2.2-test157.apk || { echo '::error title=Replay setup::test157 install failed'; exit 1; }
echo '::notice title=Replay setup::exact test157 installed'
if [[ "${MELODIX_DEMO_DOM_PROBE:-0}" == 1 ]]; then
    adb install "$RUNNER_TEMP/melodix-return-probe/probe.apk" || { echo '::error title=Replay setup::instrumentation install failed'; exit 1; }
    echo '::notice title=Replay setup::read-only instrumentation installed'
fi
python3 scripts/diagnose_demo_return.py
