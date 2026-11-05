#!/usr/bin/env bash
# Walk the native navigation graph on a booted device and capture every surface.
#
# Runs on a clean, unauthenticated install. Nothing is injected and no account
# is used, so surfaces that need real playback are recorded as
# blocked_no_session rather than faked.
#
# For each step: dump the hierarchy, screenshot it, record whether the expected
# screen was reached, and audit the bounds for layout defects.
#
# Usage: ui_qa_walk.sh DEVICE PROFILE DENSITY OUT_DIR
set -uo pipefail

[[ $# -eq 4 ]] || { echo "usage: ui_qa_walk.sh DEVICE PROFILE DENSITY OUT_DIR" >&2; exit 2; }
device="$1"; profile="$2"; density="$3"; out="$4"
mkdir -p "$out"
trace="$out/navigation-$profile.json"
: > "$trace"
failures=0

dump_now() {
  local target="$1"
  adb -s "$device" shell uiautomator dump /sdcard/melodix-qa.xml >/dev/null 2>&1 || true
  adb -s "$device" shell cat /sdcard/melodix-qa.xml > "$target" 2>/dev/null || true
}

# capture STEP -> dump, screenshot, navigation verdict, layout audit
capture() {
  local step="$1"
  local xml="$out/$step-$profile.xml"
  dump_now "$xml"
  adb -s "$device" exec-out screencap -p > "$out/$step-$profile.png" 2>/dev/null || true
  python3 scripts/ui_qa_trace.py "$step" "$profile" "$xml" "$trace" || failures=$((failures + 1))
  python3 scripts/ui_layout_audit.py "$step" "$profile" "$density" "$xml" \
    "$out/layout-$step-$profile.json" || failures=$((failures + 1))
}

# tap ID [CHILD_INDEX] -> returns 1 when the target is not on screen
tap() {
  local id="$1" index="${2:-}"
  local point
  if [[ -n "$index" ]]; then
    point="$(python3 scripts/ui_view_center.py "$out/current-$profile.xml" "$id" "$index" || true)"
  else
    point="$(python3 scripts/ui_view_center.py "$out/current-$profile.xml" "$id" || true)"
  fi
  [[ -n "$point" ]] || return 1
  # shellcheck disable=SC2086
  adb -s "$device" shell input tap $point >/dev/null 2>&1 || return 1
  sleep 3
  return 0
}

refresh() { dump_now "$out/current-$profile.xml"; }

# settle ID [BUDGET_S] -> poll until the expected view is on screen.
# A fixed sleep is not enough on the tablet profile: the first tablet walk
# reported Library and Search as not_reached with only 15 visible ids, i.e. it
# dumped mid-transition. Waiting for the view that defines the screen removes
# that false defect. It never waits on a screen we EXPECT to be wrong, so a real
# navigation failure is still recorded as a failure.
settle() {
  local id="$1" budget="${2:-24}"
  local deadline=$(( $(date +%s) + budget ))
  while [[ "$(date +%s)" -lt "$deadline" ]]; do
    refresh
    if grep -q "com.melodix.music:id/$id" "$out/current-$profile.xml" 2>/dev/null; then
      return 0
    fi
    sleep 2
  done
  echo "::notice title=QA walk $profile::$id did not appear within ${budget}s"
  return 1
}

# ---- wait for the native shell to own the display -------------------------
deadline=$(( $(date +%s) + 180 ))
ready=0
while [[ "$(date +%s)" -lt "$deadline" ]]; do
  refresh
  if grep -q 'com.melodix.music:id/nativeRoot' "$out/current-$profile.xml" 2>/dev/null; then
    ready=1
    break
  fi
  sleep 6
done
if [[ "$ready" != "1" ]]; then
  echo "::error title=QA walk $profile::the native shell never appeared; no surface was inspected"
  # A crash is the first thing to rule out. Without this the only symptom is
  # "the launcher is showing", which says nothing about the cause.
  adb -s "$device" logcat -d -b crash 2>/dev/null | tail -120 > "$out/crash.txt" || true
  adb -s "$device" logcat -d 2>/dev/null | grep -iE "AndroidRuntime|FATAL|melodix" | tail -80 > "$out/app-log.txt" || true
  head -25 "$out/crash.txt" || true
  python3 scripts/ui_metrics_diagnose.py "$profile" "$out/current-$profile.xml" || true
  exit 1
fi

# ---- 1. Home -------------------------------------------------------------
capture home
refresh

# ---- 2. Home -> Library --------------------------------------------------
if tap nativeLibraryTab; then settle nativeLibraryCategories || true; capture library; else
  echo "::error title=QA walk $profile::the Library tab is not on screen"; failures=$((failures + 1))
fi
refresh

# ---- 3. Library -> Search (browse grid) ----------------------------------
if tap nativeSearchTab; then settle nativeSearchInput || true; capture search; else
  echo "::error title=QA walk $profile::the Search tab is not on screen"; failures=$((failures + 1))
fi
refresh

# ---- 4. Browse tile -> live search --------------------------------------
if tap nativeGenreScroll 0; then capture browse-tile; else
  echo "::notice title=QA walk $profile::no browse tile was tappable on this surface"
  capture browse-tile
fi
refresh

# ---- 5. Navigation -> Settings ------------------------------------------
# The header settings button is reachable from Home; go back there first.
tap nativeHomeTab || true
refresh
if tap nativeSettingsButton; then settle nativeBackButton || true; capture settings; else
  echo "::error title=QA walk $profile::the Settings button is not on screen"; failures=$((failures + 1))
fi
refresh

# ---- 6. Back and resume -------------------------------------------------
adb -s "$device" shell input keyevent KEYCODE_BACK >/dev/null 2>&1 || true
# Deliberately generous: to claim the system Back key does not leave Settings,
# the screen must have had ample time to change.
sleep 8
capture back-from-settings
refresh

# ---- 7. Return to Home --------------------------------------------------
tap nativeHomeTab || true
# Same reasoning: stale content must not be a screenshot taken too early.
sleep 6
capture home-again
refresh

# ---- 8. Surfaces that need real playback --------------------------------
# Recorded honestly from whatever is on screen: without a session the mini
# player and the full player are absent, which the trace marks as blocked.
capture mini-player
capture player

# MEL-BUG-001: what the runtime resolver actually saw, per token. Deduplicated
# because metric() runs on every render; each token/configuration pair once.
adb -s "$device" logcat -d -s MelBack:I 2>/dev/null \
  | sed -n 's/.*MelBack: //p' | sort | uniq -c > "$out/back-key.txt" || true
adb -s "$device" logcat -d -s MelMetrics:I 2>/dev/null \
  | sed -n 's/.*MelMetrics: //p' | sort -u > "$out/metrics-resolution.txt" || true
echo "::notice title=QA walk $profile::metric lines=$(wc -l < "$out/metrics-resolution.txt" || echo 0)"

echo "::notice title=QA walk $profile::failures=$failures; trace=$trace"
exit "$failures"
