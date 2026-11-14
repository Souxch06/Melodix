#!/usr/bin/env bash
# Drive the REAL authenticated Spotify observation on a device you control.
#
# Nothing is automated: the script installs the two APKs, starts the passive
# observer, and then waits while YOU sign in on the device screen. It never
# types a credential, never injects a cookie or token, never calls a Spotify
# endpoint, and never reads logcat, screenshots or the UI hierarchy.
#
# NEVER type your password into this terminal, into a report, or into a chat.
# The only place a credential belongs is the Spotify sign-in page shown on the
# device itself.
#
# Usage:
#   scripts/p0_authenticated_session.sh TARGET_APK HARNESS_APK OUTPUT_DIR [TIMEOUT_MS]
#
# Both APKs come from the same CI run so they share a signing certificate:
#   Melodix-Preview-...-display-ownership.apk
#   melodix-display-tooling-<run>/melodix-display-harness.apk
set -euo pipefail

die() {
  echo "ERROR: $*" >&2
  exit 1
}

[[ $# -eq 3 || $# -eq 4 ]] || die "usage: p0_authenticated_session.sh TARGET_APK HARNESS_APK OUTPUT_DIR [TIMEOUT_MS]"
target_apk="$1"
harness_apk="$2"
out_dir="$3"
timeout_ms="${4:-900000}"

[[ -s "$target_apk" ]] || die "target APK is missing: $target_apk"
[[ -s "$harness_apk" ]] || die "harness APK is missing: $harness_apk"
[[ "$timeout_ms" =~ ^[0-9]{4,7}$ ]] || die "TIMEOUT_MS must be a numeric duration"
(( timeout_ms >= 60000 && timeout_ms <= 900000 )) || die "TIMEOUT_MS must be between 60000 and 900000"

command -v adb >/dev/null 2>&1 || die "adb is unavailable; install Android platform-tools"
mkdir -p "$out_dir"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

# Exactly one device: never guess which device to install on.
mapfile -t devices < <(adb devices | awk 'NR>1 && $2=="device" {print $1}')
[[ "${#devices[@]}" -eq 1 ]] || die "exactly one connected device is required (found ${#devices[@]})"
serial="${devices[0]}"

target_sha="$(sha256sum "$target_apk" | cut -d' ' -f1)"
harness_sha="$(sha256sum "$harness_apk" | cut -d' ' -f1)"

# If apksigner is available, refuse a mismatched pair before installing.
if command -v apksigner >/dev/null 2>&1; then
  a="$(apksigner verify --print-certs "$target_apk" 2>/dev/null | sed -n 's/^Signer #1 certificate SHA-256 digest: //p' | head -n1 | tr '[:upper:]' '[:lower:]')"
  b="$(apksigner verify --print-certs "$harness_apk" 2>/dev/null | sed -n 's/^Signer #1 certificate SHA-256 digest: //p' | head -n1 | tr '[:upper:]' '[:lower:]')"
  [[ "$a" =~ ^[0-9a-f]{64}$ && "$a" == "$b" ]] || die "the two APKs are not signed by the same certificate"
  signer_verified=true
else
  signer_verified=false
fi

cat <<INTRO

=== Melodix authenticated observation ===
Device            : $serial
Target APK sha256 : $target_sha
Harness APK sha256: $harness_sha
Signer check      : $signer_verified
Observation window: $((timeout_ms / 1000)) s

WHAT YOU DO
  1. The app opens on the device.
  2. Sign in to Spotify ON THE DEVICE SCREEN, exactly as you normally would.
  3. Once signed in, open Home, then Search, then Library, then back to Home.
  4. Open a real playlist. Start real playback if your account allows it.
  5. Press the Android back key once, and briefly background then resume the app.

WHAT THIS SCRIPT DOES NOT DO
  - it does not type, read, store or transmit any credential
  - it does not inject cookies, tokens or server responses
  - it does not clear your app data or your existing session
  - it does not capture logcat, screenshots or the UI hierarchy

Only allowlisted booleans, counters and category names are written to:
  $out_dir/authenticated-observation.json

INTRO

adb -s "$serial" install -r "$target_apk" >"$tmp/i1.txt" 2>&1 || die "target APK installation failed"
adb -s "$serial" install -r "$harness_apk" >"$tmp/i2.txt" 2>&1 || die "harness APK installation failed"

cat >"$tmp/filter.py" <<'FILTER'
import json
import pathlib
import re
import sys

out = pathlib.Path(sys.argv[1])

BOOL = re.compile(r"(?:true|false)\Z")
COUNT = re.compile(r"[0-9]{1,6}\Z")
CATEGORY = re.compile(r"[a-z0-9_]{1,48}\Z")
PHASE = re.compile(r"[a-z0-9_]{1,64}\Z")

boolean_keys = {
    "activity_foreground", "activity_lifecycle_observer_registered",
    "activity_lifecycle_observer_unregistered", "activity_recreated_during_observation",
    "activity_resumed_after_background", "android_back_key_seen",
    "android_back_return_to_home_observed", "app_process_restart_verified",
    "authenticated_home_requires_real_playlist", "authenticated_home_test_performed",
    "fixture_test_only", "home_to_library_observed", "home_to_search_observed",
    "library_to_home_observed", "manual_auth_or_navigation_is_automated",
    "navigation_coverage_complete", "navigation_mutation_observed",
    "observation_deadline_reached", "observation_timeout_ms_capped",
    "probe_sample_count_capped", "process_restart_observed",
    "process_restart_requires_a_new_observation_run", "real_library_playlist_observed",
    "search_to_home_observed", "target_activity_resumed_callback_seen",
    "window_callback_observer_active", "window_callback_observer_installed",
    "window_callback_observer_restored",
}
count_keys = {
    "android_back_key_up_count", "target_activity_create_count",
    "target_activity_destroy_count", "target_activity_pause_count",
    "target_activity_resume_count", "target_activity_stop_count",
    "target_version_code",
}
category_keys = {
    "current_defective_condition", "first_defective_condition", "first_failure_stage",
    "first_home_defective_condition", "last_host_category", "last_route_category",
    "observed_route_sequence", "target_package", "target_version_name",
}

allowed = {"overall": CATEGORY, "phase": PHASE, "next_action": re.compile(r"[a-z0-9_;,. ]{1,120}\Z")}
for key in boolean_keys: allowed[key] = BOOL
for key in count_keys: allowed[key] = COUNT
for key in category_keys: allowed[key] = CATEGORY

statuses = {}
result_code = None
last_phase = None
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
            if key == "phase" and value != last_phase:
                last_phase = value
                print(f"[observer] phase={value}", flush=True)
            if key == "next_action":
                print(f"[observer] {value}", flush=True)
            if key == "authenticated_home_test_performed" and value == "true":
                print("[observer] a REAL authenticated home was observed", flush=True)
            if key == "real_library_playlist_observed" and value == "true":
                print("[observer] a REAL library playlist was observed", flush=True)
    elif line.startswith("INSTRUMENTATION_CODE: "):
        value = line[len("INSTRUMENTATION_CODE: "):]
        if re.fullmatch(r"-?[0-9]{1,4}", value):
            result_code = int(value)

safe = {"statuses": statuses, "result_code": result_code}
out.write_text(json.dumps(safe, sort_keys=True, indent=2) + "\n", encoding="utf-8")
raise SystemExit(0 if result_code == -1 else 1)
FILTER

echo "[observer] starting; sign in on the device now"
set +e
adb -s "$serial" shell am instrument -w -r \
  -e mode authenticated-home \
  -e timeout_ms "$timeout_ms" \
  com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation \
  | python3 "$tmp/filter.py" "$out_dir/authenticated-observation.json"
status=$?
set -e

python3 - "$out_dir/authenticated-observation.json" "$target_sha" "$harness_sha" "$serial" <<'SUMMARY'
import json
import pathlib
import sys

path, target_sha, harness_sha, serial = sys.argv[1:5]
data = json.loads(pathlib.Path(path).read_text(encoding="utf-8"))
s = data.get("statuses", {})
def flag(key):
    return s.get(key, "not_reported")
print()
print("=== Result ===")
print(f"device                       : {serial}")
print(f"target apk sha256            : {target_sha}")
print(f"harness apk sha256           : {harness_sha}")
print(f"authenticated test performed : {flag('authenticated_home_test_performed')}")
print(f"real library playlist        : {flag('real_library_playlist_observed')}")
print(f"home -> search / search -> home : {flag('home_to_search_observed')} / {flag('search_to_home_observed')}")
print(f"home -> library / library -> home : {flag('home_to_library_observed')} / {flag('library_to_home_observed')}")
print(f"android back returns home    : {flag('android_back_return_to_home_observed')}")
print(f"resumed after background     : {flag('activity_resumed_after_background')}")
print(f"navigation coverage complete : {flag('navigation_coverage_complete')}")
print(f"last route category          : {flag('last_route_category')}")
print(f"first defective condition    : {flag('first_home_defective_condition')}")
print(f"credentials captured         : false (by construction)")
print(f"redacted record              : {path}")
SUMMARY

exit "$status"
