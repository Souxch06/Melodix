#!/usr/bin/env bash
# Create and boot one clean Android 16 AVD for the P0 display comparison.
# phone: 1080x2400 @ 420dpi -> smallestScreenWidthDp about 411 (<600).
# tablet: 1600x2560 @ 320dpi -> smallestScreenWidthDp about 800 (>=600).
# The script does not install APKs, read logcat, capture UI, or touch accounts.
#
# Lifecycle contract:
#   * The emulator PID, AVD name, adb serial and both deadlines are persisted in
#     STATE_DIR so the instrumentation script can check liveness before, during
#     and after the run, and so cleanup can target THIS emulator only.
#   * A global boot deadline and a global capture deadline bound the whole
#     capture, well inside the workflow's 45-minute job timeout.
#   * On failure a sanitized boot diagnostic (categories and counts only, never
#     raw emulator output) is written to STATE_DIR before the log is discarded.
#
# Cleanup limit: if the runner itself is cancelled or the job hits its timeout,
# GitHub tears down the whole process tree and `if: always()` steps only get a
# short grace period. The targeted stop script may therefore not run. That is
# acceptable only because the runner is ephemeral; no state survives the job.
set -euo pipefail

die() {
  echo "::error title=P0 display AVD::$*" >&2
  exit 1
}

[[ $# -eq 4 ]] || die "usage: p0_display_boot_avd.sh PROFILE AVD_NAME SYSTEM_IMAGE STATE_DIR"
profile="$1"
avd_name="$2"
system_image="$3"
state_dir="$4"
[[ "$profile" == "phone" || "$profile" == "tablet" ]] || die "profile must be phone or tablet"
[[ "$avd_name" =~ ^MelodixDisplay[A-Za-z0-9]+$ ]] || die "unexpected AVD name"
[[ "$system_image" == "system-images;android-36;google_apis;x86_64" ]] || die "unexpected Android 16 system image"
[[ -n "$state_dir" ]] || die "STATE_DIR is required"
[[ "$(uname -m)" == "x86_64" ]] || die "expected an x86_64 emulator host"
: "${ANDROID_HOME:?ANDROID_HOME must point to the Android SDK}"
[[ -x "$ANDROID_HOME/emulator/emulator" && -x "$ANDROID_HOME/platform-tools/adb" ]] || die "emulator and platform-tools are unavailable"
[[ -e /dev/kvm ]] || die "KVM is unavailable on this runner"
sudo chmod 666 /dev/kvm

mkdir -p "$state_dir"
tmp="$(mktemp -d)"
emulator_log="$tmp/emulator.log"
: >"$emulator_log"
trap 'rm -rf "$tmp"' EXIT

# Global, explicit deadlines. Boot must finish inside BOOT_BUDGET_SECONDS; the
# whole capture (boot + install + instrumentation) must finish inside
# CAPTURE_BUDGET_SECONDS. Both stay well under the 45-minute job timeout, which
# leaves room for the SDK/system-image download performed before this script.
BOOT_BUDGET_SECONDS=900
CAPTURE_BUDGET_SECONDS=1500
start_epoch="$(date +%s)"
boot_deadline_epoch=$((start_epoch + BOOT_BUDGET_SECONDS))
capture_deadline_epoch=$((start_epoch + CAPTURE_BUDGET_SECONDS))
printf '%s\n' "$boot_deadline_epoch" >"$state_dir/boot-deadline_epoch"
printf '%s\n' "$capture_deadline_epoch" >"$state_dir/capture-deadline_epoch"
printf '%s\n' "$avd_name" >"$state_dir/emulator.avd"

# Sanitized boot diagnostic: only a fixed allowlist of categories, marker names
# and counts. No raw emulator line, path, host name or account data is kept.
write_boot_diagnostic() {
  local reason="$1" boot_completed="${2:-false}"
  python3 - "$emulator_log" "$state_dir/boot-diagnostic.json" "$reason" "$profile" "$boot_completed" <<'PY' || true
import json
import pathlib
import re
import sys

log_path, out_path, reason, profile, boot_completed = sys.argv[1:6]
if not re.fullmatch(r"[a-z0-9_]{1,64}", reason):
    reason = "unspecified"
# The caller already restricts PROFILE, but the writer must not depend on that:
# every value it copies into the artifact is validated here, so reusing this
# writer elsewhere cannot turn it into a free-text export.
if profile not in ("phone", "tablet"):
    profile = "unknown"
markers = {
    "kvm_permission": rb"(?i)/dev/kvm|kvm.*permission",
    "kvm_unavailable": rb"(?i)kvm.*(not available|unavailable|failed|missing)",
    "acceleration": rb"(?i)hypervisor|accel|whpx|haxm",
    "gpu": rb"(?i)swiftshader|egl|vulkan|gpu",
    "disk_space": rb"(?i)no space left|disk quota",
    "avd_config": rb"(?i)config\.ini|unknown virtual device|invalid avd",
    "skin": rb"(?i)skin",
    "snapshot": rb"(?i)snapshot",
    "system_image": rb"(?i)system image|system\.img|cannot find package",
    "port_in_use": rb"(?i)address already in use|port.*in use",
    "fatal": rb"(?i)segmentation fault|fatal|abort",
}
path = pathlib.Path(log_path)
present = path.is_file()
data = path.read_bytes() if present else b""
hits = sorted(name for name, pattern in markers.items() if re.search(pattern, data))
report = {
    "schema_version": 1,
    "profile": profile,
    "failure_reason_category": reason,
    "boot_completed": boot_completed == "true",
    "emulator_log_present": present,
    "emulator_log_line_count": data.count(b"\n"),
    "emulator_log_byte_count": len(data),
    "diagnostic_markers": hits,
    "raw_log_retained": False,
}
pathlib.Path(out_path).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
PY
}

boot_fail() {
  write_boot_diagnostic "$1" "${2:-false}"
  die "$1"
}

printf 'no\n' | avdmanager create avd --force --name "$avd_name" --package "$system_image" --device pixel_2 >"$tmp/avdmanager.txt" 2>&1 \
  || boot_fail "avd_create_failed"
avd_config="$HOME/.android/avd/$avd_name.avd/config.ini"
[[ -s "$avd_config" ]] || boot_fail "avd_config_missing"

set_config() {
  local key="$1" value="$2"
  if grep -q "^$key=" "$avd_config"; then
    sed -i "s/^$key=.*/$key=$value/" "$avd_config"
  else
    printf '\n%s=%s\n' "$key" "$value" >> "$avd_config"
  fi
}

if [[ "$profile" == "phone" ]]; then
  width=1080
  height=2400
  density=420
else
  width=1600
  height=2560
  density=320
fi
set_config hw.lcd.width "$width"
set_config hw.lcd.height "$height"
set_config hw.lcd.density "$density"
set_config hw.initialOrientation portrait
set_config skin.dynamic yes
set_config skin.name "${width}x${height}"
set_config skin.path "${width}x${height}"
set_config disk.dataPartition.size 4G
grep -qx "hw.lcd.width=$width" "$avd_config"
grep -qx "hw.lcd.height=$height" "$avd_config"
grep -qx "hw.lcd.density=$density" "$avd_config"
grep -qx 'disk.dataPartition.size=4G' "$avd_config"

# nohup execs the emulator, so $! is the emulator's own PID (not a wrapper's).
# The PID is persisted immediately: the instrumentation script and the targeted
# stop script both need it after this script has exited.
nohup "$ANDROID_HOME/emulator/emulator" \
  -avd "$avd_name" \
  -no-window \
  -no-audio \
  -no-boot-anim \
  -no-snapshot \
  -gpu swiftshader_indirect \
  -accel on \
  >"$emulator_log" 2>&1 &
emulator_pid=$!
printf '%s\n' "$emulator_pid" >"$state_dir/emulator.pid"

emulator_alive() {
  kill -0 "$emulator_pid" 2>/dev/null
}

adb start-server >"$tmp/adb-start.txt" 2>&1 || boot_fail "adb_server_failed"
device_id=""
while [[ "$(date +%s)" -lt "$boot_deadline_epoch" ]]; do
  device_id="$(adb devices | awk '$1 ~ /^emulator-/ && $2 == "device" {print $1; exit}')"
  if [[ -n "$device_id" ]]; then break; fi
  emulator_alive || boot_fail "emulator_exited_before_adb_device"
  sleep 5
done
[[ -n "$device_id" ]] || boot_fail "adb_device_deadline_exceeded"
printf '%s\n' "$device_id" >"$state_dir/emulator.device"

booted=0
while [[ "$(date +%s)" -lt "$boot_deadline_epoch" ]]; do
  if [[ "$(adb -s "$device_id" shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" == "1" ]]; then
    booted=1
    break
  fi
  emulator_alive || boot_fail "emulator_exited_before_boot_completed"
  sleep 5
done
[[ "$booted" == "1" ]] || boot_fail "boot_deadline_exceeded"

adb -s "$device_id" shell settings put global window_animation_scale 0
adb -s "$device_id" shell settings put global transition_animation_scale 0
adb -s "$device_id" shell settings put global animator_duration_scale 0
adb -s "$device_id" shell settings put global device_provisioned 1
adb -s "$device_id" shell settings put secure user_setup_complete 1
adb -s "$device_id" shell pm disable-user --user 0 com.google.android.setupwizard >/dev/null 2>&1 || true
adb -s "$device_id" shell input keyevent KEYCODE_HOME >/dev/null 2>&1 || true
emulator_alive || boot_fail "emulator_exited_after_boot"
write_boot_diagnostic "boot_ok" "true"
echo "::notice title=P0 display AVD booted::profile=$profile; avd=$avd_name; width_px=$width; height_px=$height; density_dpi=$density; device=$device_id; emulator_pid=$emulator_pid; boot_budget_s=$BOOT_BUDGET_SECONDS; capture_budget_s=$CAPTURE_BUDGET_SECONDS"
