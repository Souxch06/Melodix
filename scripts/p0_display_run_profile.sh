#!/usr/bin/env bash
# Run the display-ownership instrumentation for one already-verified APK/profile.
# Only the strict redacted sidecar is kept. Raw instrumentation stdout is piped
# through an allowlist parser and discarded; no logcat, screenshot, UI hierarchy,
# cookie, token, or Spotify account data is read or retained.
set -euo pipefail

die() {
  echo "::error title=P0 display profile capture::$*" >&2
  exit 1
}

[[ $# -eq 7 ]] || die "usage: p0_display_run_profile.sh PROFILE APK TEST_APK SOURCE_REF RUN_ID APK_SHA256 STATE_DIR"
profile="$1"
apk="$2"
test_apk="$3"
source_ref="$4"
run_id="$5"
apk_sha256="$6"
state_dir="$7"

[[ "$profile" == "phone" || "$profile" == "tablet" ]] || die "profile must be phone or tablet"
[[ -s "$apk" ]] || die "verified target APK is missing"
[[ -s "$test_apk" ]] || die "verified instrumentation APK is missing"
[[ "$source_ref" =~ ^[0-9a-f]{40}$ ]] || die "source_ref must be a full lowercase commit SHA"
[[ "$run_id" =~ ^[0-9]{1,20}$ ]] || die "run_id must be a numeric CI run identifier"
[[ "$apk_sha256" =~ ^[0-9a-f]{64}$ ]] || die "apk_sha256 must be a lowercase SHA-256 digest"
# The boot script persists the emulator PID/serial/deadlines here. Without it we
# cannot prove the emulator is still alive around the instrumentation.
: "${P0_DISPLAY_AVD_STATE_DIR:?P0_DISPLAY_AVD_STATE_DIR must point at the boot script STATE_DIR}"
avd_state_dir="$P0_DISPLAY_AVD_STATE_DIR"
[[ -d "$avd_state_dir" ]] || die "AVD state directory is missing"
[[ -s "$avd_state_dir/emulator.pid" ]] || die "recorded emulator PID is missing"
emulator_pid="$(cat "$avd_state_dir/emulator.pid")"
[[ "$emulator_pid" =~ ^[0-9]{1,7}$ && "$emulator_pid" -gt 1 ]] || die "recorded emulator PID is invalid"
emulator_alive() {
  kill -0 "$emulator_pid" 2>/dev/null
}
emulator_alive || die "the recorded emulator process is not alive before instrumentation"
command -v adb >/dev/null 2>&1 || die "adb is unavailable"
adb get-state >/dev/null 2>&1 || die "no Android device is connected"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tooling_root="$(dirname "$script_dir")"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$state_dir"

adb install -r "$apk" >"$tmp/install-target.txt" 2>&1 || die "target APK installation failed"
adb install -r "$test_apk" >"$tmp/install-harness.txt" 2>&1 || die "instrumentation APK installation failed"
adb shell pm clear com.melodix.music.preview >/dev/null 2>&1 || die "could not clear the target app state"
adb shell pm grant com.melodix.music.preview android.permission.BLUETOOTH_CONNECT >/dev/null 2>&1 || die "could not grant BLUETOOTH_CONNECT"
permission_state="$(adb shell dumpsys package com.melodix.music.preview | grep -F 'android.permission.BLUETOOTH_CONNECT:' || true)"
[[ "$permission_state" == *granted=true* ]] || die "Android did not report BLUETOOTH_CONNECT granted"
adb shell run-as com.melodix.music.preview rm -f files/melodix-preview-display-ownership.json >/dev/null 2>&1 || true

cat >"$tmp/status-filter.py" <<'PY'
import json
import pathlib
import re
import sys

out = pathlib.Path(sys.argv[1])
expected_profile = sys.argv[2]
allowed = {
    "overall": re.compile(r"(?:passed|failed)\Z"),
    "profile": re.compile(r"(?:phone|tablet)\Z"),
    "display_ownership_report_saved": re.compile(r"(?:true|false)\Z"),
    "authenticated_home_test_performed": re.compile(r"(?:true|false)\Z"),
    "failure_phase": re.compile(r"[a-z0-9_]{1,64}\Z"),
    "failure_type": re.compile(r"[A-Za-z0-9_$]{1,80}\Z"),
}
statuses = {}
status_codes = []
result_code = None
for line in sys.stdin:
    line = line.rstrip("\r\n")
    if line.startswith("INSTRUMENTATION_STATUS: "):
        payload = line[len("INSTRUMENTATION_STATUS: "):]
        if "=" not in payload:
            continue
        key, value = payload.split("=", 1)
        pattern = allowed.get(key)
        if pattern is not None and pattern.fullmatch(value):
            statuses[key] = value
    elif line.startswith("INSTRUMENTATION_STATUS_CODE: "):
        value = line[len("INSTRUMENTATION_STATUS_CODE: "):]
        if re.fullmatch(r"-?[0-9]{1,4}", value):
            status_codes.append(int(value))
    elif line.startswith("INSTRUMENTATION_CODE: "):
        value = line[len("INSTRUMENTATION_CODE: "):]
        if re.fullmatch(r"-?[0-9]{1,4}", value):
            result_code = int(value)
safe = {
    "profile": expected_profile,
    "statuses": statuses,
    "status_codes": status_codes[-16:],
    "result_code": result_code,
}
out.write_text(json.dumps(safe, sort_keys=True) + "\n", encoding="utf-8")
ok = (
    statuses.get("overall") == "passed"
    and statuses.get("profile") == expected_profile
    and statuses.get("display_ownership_report_saved") == "true"
    and statuses.get("authenticated_home_test_performed") == "false"
    and result_code == -1
)
raise SystemExit(0 if ok else 1)
PY

# Global capture deadline written by the boot script, so boot + instrumentation
# together stay inside an explicit budget rather than only the job timeout.
instrument_budget=180
if [[ -s "$avd_state_dir/capture-deadline_epoch" ]]; then
  capture_deadline_epoch="$(cat "$avd_state_dir/capture-deadline_epoch")"
  [[ "$capture_deadline_epoch" =~ ^[0-9]{9,12}$ ]] || die "recorded capture deadline is invalid"
  remaining=$((capture_deadline_epoch - $(date +%s)))
  [[ "$remaining" -gt 30 ]] || die "the global capture deadline has already expired"
  if [[ "$remaining" -lt "$instrument_budget" ]]; then
    instrument_budget="$remaining"
  fi
fi

# Liveness watchdog DURING the instrumentation. If the emulator dies, the adb
# client is signalled directly (its PID is recorded by the wrapper below) so the
# run fails fast instead of waiting for the full timeout.
(
  while :; do
    if ! kill -0 "$emulator_pid" 2>/dev/null; then
      : >"$tmp/emulator-died"
      if [[ -s "$tmp/instrument.pid" ]]; then
        kill -TERM "$(cat "$tmp/instrument.pid")" 2>/dev/null || true
      fi
      exit 0
    fi
    sleep 2
  done
) &
watchdog_pid=$!
trap 'kill "$watchdog_pid" 2>/dev/null || true; rm -rf "$tmp"' EXIT

# Only allowlisted failure_phase/failure_type are surfaced; the raw stream is
# still discarded. This keeps a failed run diagnosable without retaining UI or
# account data.
report_failure() {
  local message="$1"
  if [[ -s "$tmp/safe-status.json" ]]; then
    python3 - "$tmp/safe-status.json" <<'PY' || true
import json
import pathlib
import sys

safe = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
statuses = safe.get("statuses", {})
phase = statuses.get("failure_phase", "unknown")
kind = statuses.get("failure_type", "unknown")
print(f"::error title=P0 display instrumentation detail::failure_phase={phase}; failure_type={kind}")
PY
  fi
  die "$message"
}

set +e
timeout --signal=TERM --kill-after=10s "${instrument_budget}s" \
  bash -c 'echo $$ >"$1"; shift; exec "$@"' _ "$tmp/instrument.pid" \
  adb shell am instrument -w -r \
  -e mode display-ownership \
  -e profile "$profile" \
  -e source_ref "$source_ref" \
  -e run_id "$run_id" \
  -e apk_sha256 "$apk_sha256" \
  com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation \
  | python3 "$tmp/status-filter.py" "$tmp/safe-status.json" "$profile"
pipe_status=("${PIPESTATUS[@]}")
set -e
kill "$watchdog_pid" 2>/dev/null || true
[[ ! -e "$tmp/emulator-died" ]] || report_failure "the emulator process died during instrumentation"
[[ "${pipe_status[0]}" -eq 0 ]] || report_failure "instrumentation command failed or timed out"
[[ "${pipe_status[1]}" -eq 0 ]] || report_failure "instrumentation did not emit the required allowlisted success statuses"
emulator_alive || die "the recorded emulator process died before the sidecar could be read"

adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-display-ownership.json >"$tmp/sidecar.json" 2>"$tmp/pull-stderr.txt" || die "could not retrieve the redacted display-ownership sidecar"
[[ -s "$tmp/sidecar.json" ]] || die "display-ownership sidecar is empty"
adb shell run-as com.melodix.music.preview rm -f files/melodix-preview-display-ownership.json >/dev/null 2>&1 || true

python3 - "$tmp/sidecar.json" "$profile" "$source_ref" "$run_id" "$apk_sha256" "$tooling_root" <<'PY'
import importlib.util
import pathlib
import sys

sidecar, profile, source_ref, run_id, apk_sha256, tooling_root = sys.argv[1:]
script = pathlib.Path(tooling_root) / "scripts/aggregate_p0_display_ownership.py"
spec = importlib.util.spec_from_file_location("aggregate_p0_display_ownership", script)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
try:
    module._validate_profile(
        pathlib.Path(sidecar),
        expected_profile=profile,
        source_ref=source_ref,
        run_id=run_id,
        apk_sha256=apk_sha256,
    )
except ValueError as exc:
    print(f"::error title=P0 display sidecar validation::{exc}", file=sys.stderr)
    raise SystemExit(1)
PY

emulator_alive || die "the recorded emulator process died after instrumentation"
mv "$tmp/sidecar.json" "$state_dir/display-ownership-$profile.json"
echo "::notice title=P0 display profile captured::profile=$profile; source=$source_ref; run_id=$run_id; apk_sha256=$apk_sha256; emulator_pid=$emulator_pid; emulator_alive_before_during_after=true; instrument_budget_s=$instrument_budget; raw_ui_or_account_data_retained=false"
