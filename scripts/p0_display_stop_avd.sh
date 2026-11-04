#!/usr/bin/env bash
# Stop ONLY the emulator started for this profile.
#
# Targeting rules (never kill another emulator on the host):
#   1. adb -s <recorded serial> emu kill, only for the recorded serial.
#   2. SIGTERM to the recorded PID, and only after confirming that
#      /proc/<pid>/cmdline really is this AVD's emulator (-avd <recorded name>).
#   3. SIGKILL as a last resort, with the same cmdline re-check so a recycled
#      PID belonging to something else is never signalled.
#
# Limit: on runner cancellation or job timeout GitHub kills the process tree and
# `if: always()` steps get only a short grace period, so this script may not run
# to completion. Correctness relies on the runner being ephemeral, not on this
# cleanup being guaranteed.
set -euo pipefail

die() {
  echo "::error title=P0 display AVD stop::$*" >&2
  exit 1
}

[[ $# -eq 1 ]] || die "usage: p0_display_stop_avd.sh STATE_DIR"
state_dir="$1"
[[ -n "$state_dir" ]] || die "STATE_DIR is required"
[[ -d "$state_dir" ]] || die "AVD state directory is missing"

pid_file="$state_dir/emulator.pid"
avd_file="$state_dir/emulator.avd"
device_file="$state_dir/emulator.device"
[[ -s "$pid_file" ]] || die "recorded emulator PID is missing"
pid="$(cat "$pid_file")"
[[ "$pid" =~ ^[0-9]{1,7}$ ]] || die "recorded emulator PID is invalid"
[[ "$pid" -gt 1 ]] || die "refusing to signal PID $pid"
avd_name=""
[[ -s "$avd_file" ]] && avd_name="$(cat "$avd_file")"
device_id=""
[[ -s "$device_file" ]] && device_id="$(cat "$device_file")"

# Confirm the PID still belongs to this AVD before ever signalling it.
pid_is_our_emulator() {
  [[ -r "/proc/$pid/cmdline" ]] || return 1
  local cmdline
  cmdline="$(tr '\0' ' ' <"/proc/$pid/cmdline" 2>/dev/null || true)"
  [[ "$cmdline" == *emulator* ]] || return 1
  [[ -n "$avd_name" ]] || return 1
  [[ "$cmdline" == *"-avd $avd_name"* ]] || return 1
  return 0
}

asked_adb=0
if [[ -n "$device_id" && "$device_id" =~ ^emulator-[0-9]+$ ]] && command -v adb >/dev/null 2>&1; then
  adb -s "$device_id" emu kill >/dev/null 2>&1 || true
  asked_adb=1
fi

# Only wait for a graceful adb shutdown when one was actually requested.
if [[ "$asked_adb" == "1" ]]; then
  for _ in $(seq 1 10); do
    kill -0 "$pid" 2>/dev/null || break
    sleep 1
  done
fi

if kill -0 "$pid" 2>/dev/null; then
  if pid_is_our_emulator; then
    kill -TERM "$pid" 2>/dev/null || true
    for _ in $(seq 1 10); do
      kill -0 "$pid" 2>/dev/null || break
      sleep 1
    done
    if kill -0 "$pid" 2>/dev/null && pid_is_our_emulator; then
      kill -KILL "$pid" 2>/dev/null || true
    fi
  else
    echo "::warning title=P0 display AVD stop::recorded PID no longer belongs to this AVD; no signal sent"
  fi
fi

if kill -0 "$pid" 2>/dev/null; then
  echo "::warning title=P0 display AVD stop::emulator PID $pid still alive; runner teardown will reclaim it"
else
  echo "::notice title=P0 display AVD stopped::pid=$pid; avd=${avd_name:-unknown}; targeted=true"
fi
