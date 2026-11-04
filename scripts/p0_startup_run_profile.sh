#!/usr/bin/env bash
# Run the startup-timeline instrumentation for one already-verified APK/profile.
#
# This answers WHY the first display checkpoints are undetermined: it measures
# the real duration of onCreate/onStart/onResume, the first layout/draw/focus,
# and attributes main-thread busy time to a closed set of categories.
#
# Only the strict redacted sidecar is kept. Raw instrumentation stdout is piped
# through an allowlist parser and discarded. No logcat, screenshot, UI
# hierarchy, cookie, token or Spotify account data is read or retained. The
# stack sampler never exports a frame: only closed-vocabulary bucket counts.
set -euo pipefail

die() {
  echo "::error title=P0 startup capture::$*" >&2
  exit 1
}

[[ $# -eq 7 ]] || die "usage: p0_startup_run_profile.sh PROFILE APK TEST_APK SOURCE_REF RUN_ID APK_SHA256 STATE_DIR"
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
adb shell run-as com.melodix.music.preview rm -f files/melodix-preview-startup-timeline.json >/dev/null 2>&1 || true

cat >"$tmp/status-filter.py" <<'FILTER'
import json
import pathlib
import re
import sys

out = pathlib.Path(sys.argv[1])
expected_profile = sys.argv[2]

BUCKETS = (
    "webview_provider_init", "webview_ctor", "xml_inflate", "form_widgets_in_oncreate",
    "melodix_oncreate_other", "melodix_other", "resources_assets", "graphics_render",
    "binder_ipc", "main_idle", "other",
)
bucket_alt = "(?:" + "|".join(BUCKETS) + ")"
histogram = re.compile(r"(?:none|" + bucket_alt + r":[0-9]{1,6}(?:," + bucket_alt + r":[0-9]{1,6}){0,10})\Z")
integer = re.compile(r"-?[0-9]{1,7}\Z")

allowed = {
    "overall": re.compile(r"(?:passed|failed)\Z"),
    "profile": re.compile(r"(?:phone|tablet)\Z"),
    "startup_timeline_report_saved": re.compile(r"(?:true|false)\Z"),
    "failure_phase": re.compile(r"[a-z0-9_]{1,64}\Z"),
    "failure_type": re.compile(r"[A-Za-z0-9_$]{1,80}\Z"),
    "st_form": re.compile(r"(?:built|not_observed|unavailable)\Z"),
    "st_oncreate_top": histogram,
    "st_all_top": histogram,
}
for key in ("st_oncreate", "st_created", "st_resumed", "st_draw", "st_native", "st_views"):
    allowed[key] = integer
for label in ("200ms", "1s", "3s", "8s", "20s"):
    allowed["st_" + label] = re.compile(
        r"(?:native|web|login|unknown);(?:native_shell|splash|web|unknown);"
        r"(?:measured|no_activity|main_busy);[0-9]{1,7}\Z"
    )

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
    and statuses.get("startup_timeline_report_saved") == "true"
    and result_code == -1
)
raise SystemExit(0 if ok else 1)
FILTER

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

# Surface the allowlisted startup measurements whether the capture passed or
# failed. Only closed-vocabulary tokens and bounded integers are printed.
report_measurements() {
  [[ -s "$tmp/safe-status.json" ]] || return 0
  python3 - "$tmp/safe-status.json" "$1" <<'MEAS' || true
import json
import pathlib
import sys

safe = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
s = safe.get("statuses", {})
p = sys.argv[2]
def show(label, key):
    print(f"::notice title=P0 startup timing::{p} {label}={s.get(key, 'not_measured')}")
show("oncreate_ms", "st_oncreate")
show("launch_to_created_ms", "st_created")
show("launch_to_resumed_ms", "st_resumed")
show("launch_to_first_draw_ms", "st_draw")
show("launch_to_native_visible_ms", "st_native")
show("view_count", "st_views")
show("login_form", "st_form")
print(f"::notice title=P0 startup attribution::{p} oncreate_samples={s.get('st_oncreate_top', 'not_measured')}")
print(f"::notice title=P0 startup attribution::{p} all_samples={s.get('st_all_top', 'not_measured')}")
for label in ("200ms", "1s", "3s", "8s", "20s"):
    value = s.get("st_" + label)
    if value is None:
        print(f"::notice title=P0 startup checkpoint::{p} {label}=not_measured")
        continue
    owner, center, reason, observed = value.split(";")
    print(f"::notice title=P0 startup checkpoint::{p} {label} owner={owner}; center={center}; reason={reason}; observed_ms={observed}")
MEAS
}

report_failure() {
  local message="$1"
  if [[ -s "$tmp/safe-status.json" ]]; then
    python3 - "$tmp/safe-status.json" <<'FAIL' || true
import json
import pathlib
import sys

safe = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
statuses = safe.get("statuses", {})
phase = statuses.get("failure_phase", "unknown")
kind = statuses.get("failure_type", "unknown")
print(f"::error title=P0 startup instrumentation detail::failure_phase={phase}; failure_type={kind}")
FAIL
  fi
  die "$message"
}

set +e
timeout --signal=TERM --kill-after=10s "${instrument_budget}s" \
  bash -c 'echo $$ >"$1"; shift; exec "$@"' _ "$tmp/instrument.pid" \
  adb shell am instrument -w -r \
  -e mode startup-timeline \
  -e profile "$profile" \
  -e source_ref "$source_ref" \
  -e run_id "$run_id" \
  -e apk_sha256 "$apk_sha256" \
  com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation \
  | python3 "$tmp/status-filter.py" "$tmp/safe-status.json" "$profile"
pipe_status=("${PIPESTATUS[@]}")
set -e
kill "$watchdog_pid" 2>/dev/null || true
report_measurements "$profile"
[[ ! -e "$tmp/emulator-died" ]] || report_failure "the emulator process died during instrumentation"
[[ "${pipe_status[0]}" -eq 0 ]] || report_failure "instrumentation command failed or timed out"
[[ "${pipe_status[1]}" -eq 0 ]] || report_failure "instrumentation did not emit the required allowlisted success statuses"
emulator_alive || die "the recorded emulator process died before the sidecar could be read"

adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-startup-timeline.json >"$tmp/sidecar.json" 2>"$tmp/pull-stderr.txt" || die "could not retrieve the redacted startup sidecar"
[[ -s "$tmp/sidecar.json" ]] || die "startup sidecar is empty"
adb shell run-as com.melodix.music.preview rm -f files/melodix-preview-startup-timeline.json >/dev/null 2>&1 || true

python3 - "$tmp/sidecar.json" "$profile" "$source_ref" "$run_id" "$apk_sha256" <<'VALIDATE'
import json
import pathlib
import re
import sys

path, profile, source_ref, run_id, apk_sha256 = sys.argv[1:6]
BUCKETS = {
    "webview_provider_init", "webview_ctor", "xml_inflate", "form_widgets_in_oncreate",
    "melodix_oncreate_other", "melodix_other", "resources_assets", "graphics_render",
    "binder_ipc", "main_idle", "other",
}
EVENTS = {
    "process_start", "launch_command", "activity_pre_created", "activity_post_created",
    "activity_pre_started", "activity_post_started", "activity_pre_resumed",
    "activity_post_resumed", "first_layout", "first_draw", "window_focused",
    "native_root_present", "native_root_visible", "splash_present", "splash_hidden",
    "web_container_visible", "webview_present", "login_form_built",
}
DURATIONS = {
    "oncreate_ms", "onstart_ms", "onresume_ms", "launch_to_created_ms",
    "launch_to_resumed_ms", "launch_to_first_draw_ms", "launch_to_first_focus_ms",
    "launch_to_native_visible_ms",
}
TOP = {"schema_version", "profile", "source_commit", "run_id", "apk_sha256", "timeline_origin",
       "session_state", "sample_interval_ms", "view_count_at_first_observation",
       "login_form_probe", "events", "durations", "main_thread_samples",
       "oncreate_main_thread_samples", "checkpoints"}
CHECKPOINT_KEYS = {"target_elapsed_ms", "observed_elapsed_ms", "display_owner",
                   "center_surface_owner", "native_root_visible", "webview_container_visible",
                   "native_owner_verified", "undetermined_reason"}
LABELS = {"200ms": 200, "1s": 1000, "3s": 3000, "8s": 8000, "20s": 20000}

def fail(message):
    print(f"::error title=P0 startup sidecar validation::{message}", file=sys.stderr)
    raise SystemExit(1)

try:
    report = json.loads(pathlib.Path(path).read_text(encoding="utf-8"))
except (OSError, ValueError) as exc:
    fail(f"unreadable sidecar: {exc}")

if not isinstance(report, dict) or set(report) != TOP:
    fail("sidecar does not match the exact schema")
if report["schema_version"] != 1: fail("schema_version mismatch")
if report["profile"] != profile: fail("profile mismatch")
if report["source_commit"] != source_ref: fail("source_commit mismatch")
if report["run_id"] != run_id: fail("run_id mismatch")
if report["apk_sha256"] != apk_sha256: fail("apk_sha256 mismatch")
if report["timeline_origin"] != "app_launch": fail("timeline origin must be the app launch")
if report["session_state"] != "unauthenticated": fail("this mode never claims an authenticated session")
if report["login_form_probe"] not in {"built", "not_observed", "unavailable"}:
    fail("login_form_probe is outside its vocabulary")
if not isinstance(report["sample_interval_ms"], int) or not 1 <= report["sample_interval_ms"] <= 1000:
    fail("sample interval is out of range")
if not isinstance(report["view_count_at_first_observation"], int) or not -1 <= report["view_count_at_first_observation"] <= 100000:
    fail("view count is out of range")

events = report["events"]
if not isinstance(events, dict) or not set(events) <= EVENTS:
    fail("events contain an unknown name")
for name, value in events.items():
    if not isinstance(value, int) or not -600000 <= value <= 600000:
        fail(f"event {name} is out of range")
if events.get("launch_command") != 0:
    fail("the launch command must be the timeline origin")

durations = report["durations"]
if not isinstance(durations, dict) or set(durations) != DURATIONS:
    fail("durations do not match the exact schema")
for name, value in durations.items():
    if not isinstance(value, int) or not -1 <= value <= 600000:
        fail(f"duration {name} is out of range")

for key in ("main_thread_samples", "oncreate_main_thread_samples"):
    value = report[key]
    if not isinstance(value, str):
        fail(f"{key} must be a string")
    if value != "none":
        for part in value.split(","):
            if ":" not in part: fail(f"{key} is malformed")
            name, count = part.split(":", 1)
            if name not in BUCKETS: fail(f"{key} contains an unknown bucket")
            if not re.fullmatch(r"[0-9]{1,6}", count): fail(f"{key} count is malformed")

checkpoints = report["checkpoints"]
if not isinstance(checkpoints, dict) or set(checkpoints) != set(LABELS):
    fail("checkpoints do not cover exactly the five launch-relative targets")
previous = -1
for label, target in LABELS.items():
    cp = checkpoints[label]
    if not isinstance(cp, dict) or set(cp) != CHECKPOINT_KEYS:
        fail(f"checkpoint {label} does not match the exact schema")
    if cp["target_elapsed_ms"] != target: fail(f"checkpoint {label} target mismatch")
    observed = cp["observed_elapsed_ms"]
    if not isinstance(observed, int) or observed < target or observed - target > 1500:
        fail(f"checkpoint {label} is not launch-relative within tolerance")
    if observed < previous: fail(f"checkpoint {label} observations are not monotonic")
    previous = observed
    if cp["display_owner"] not in {"native", "web", "login", "unknown"}: fail(f"checkpoint {label} owner invalid")
    if cp["center_surface_owner"] not in {"native_shell", "splash", "web", "unknown"}: fail(f"checkpoint {label} centre invalid")
    if cp["undetermined_reason"] not in {"measured", "no_activity", "main_busy"}: fail(f"checkpoint {label} reason invalid")
    for key in ("native_root_visible", "webview_container_visible", "native_owner_verified"):
        if not isinstance(cp[key], bool): fail(f"checkpoint {label}.{key} must be a boolean")
    # An unmeasured checkpoint must never be dressed up as an observation.
    if cp["undetermined_reason"] != "measured":
        if cp["display_owner"] != "unknown" or cp["center_surface_owner"] != "unknown" or cp["native_owner_verified"]:
            fail(f"checkpoint {label} claims an observation it did not make")

# Privacy: the sidecar carries only closed vocabularies and bounded integers.
def scan(node):
    if isinstance(node, dict):
        for key, value in node.items():
            if not re.fullmatch(r"[a-z0-9_]{1,40}", str(key)): fail("unexpected key shape")
            scan(value)
    elif isinstance(node, list):
        for value in node: scan(value)
    elif isinstance(node, str):
        if not re.fullmatch(r"[a-z0-9_:,.]{1,400}", node): fail("a string is outside the closed vocabulary")
        lowered = node.lower()
        for forbidden in ("http", "cookie", "token", "bearer", "password", "spotify.com"):
            if forbidden in lowered: fail("a forbidden token appeared in the sidecar")
scan(report)
VALIDATE

emulator_alive || die "the recorded emulator process died after instrumentation"
mv "$tmp/sidecar.json" "$state_dir/startup-timeline-$profile.json"
echo "::notice title=P0 startup profile captured::profile=$profile; source=$source_ref; run_id=$run_id; apk_sha256=$apk_sha256; emulator_pid=$emulator_pid; emulator_alive_before_during_after=true; instrument_budget_s=$instrument_budget; raw_ui_or_account_data_retained=false"
