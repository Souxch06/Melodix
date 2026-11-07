#!/usr/bin/env bash
# Report what the built APK actually contains for the design tokens, per
# configuration.
#
# Why this exists: on the tablet captures, tokens applied from XML resolve to
# their sw600dp value (tab bar 76dp, genre grid 4x2), while tokens resolved at
# runtime through Resources.getIdentifier() land on their phone-sized fallback
# (settings row 64dp instead of 76dp, status card 560dp instead of 720dp).
#
# XML references are compiled to numeric ids and need no names at runtime;
# getIdentifier() needs the name string in resources.arsc. This probe separates
# the two possible causes:
#   - the name or the sw600dp value is missing from the APK  -> packaging;
#   - both are present                                      -> runtime lookup.
#
# It never guesses: it prints what aapt2 reports, or says it could not run.
#
# Usage: ui_resource_probe.sh APK OUT_TXT

set -euo pipefail

apk="${1:?usage: ui_resource_probe.sh APK OUT_TXT}"
out="${2:?usage: ui_resource_probe.sh APK OUT_TXT}"

mkdir -p "$(dirname "$out")"

tokens="mel_tab_bar_height mel_settings_row_height mel_status_max_width mel_gutter mel_row_height"

aapt2=""
for base in "${ANDROID_HOME:-}" "${ANDROID_SDK_ROOT:-}" /usr/local/lib/android/sdk; do
  [[ -n "$base" ]] || continue
  candidate="$(ls -1 "$base"/build-tools/*/aapt2 2>/dev/null | sort -V | tail -1 || true)"
  if [[ -n "$candidate" ]]; then aapt2="$candidate"; break; fi
done
if [[ -z "$aapt2" ]]; then
  aapt2="$(command -v aapt2 || true)"
fi

{
  echo "apk=$apk"
  if [[ ! -s "$apk" ]]; then
    echo "status=apk_missing"
    exit 0
  fi
  echo "apk_bytes=$(wc -c < "$apk")"
  if [[ -z "$aapt2" ]]; then
    echo "status=aapt2_unavailable"
    exit 0
  fi
  echo "aapt2=$aapt2"
  echo "status=ok"
  echo
  dump="$(mktemp)"
  trap 'rm -f "$dump"' EXIT
  if ! "$aapt2" dump resources "$apk" > "$dump" 2>&1; then
    echo "status=dump_failed"
    head -20 "$dump"
    exit 0
  fi
  echo "resource_name_count=$(grep -cE '^ *resource [0-9a-fx]+ ' "$dump" || true)"
  # getIdentifier(name, type, getPackageName()) returns 0 when the package of the
  # resource table differs from the manifest package. The APK is built with
  # forcedPackageId, so this is the last packaging-side suspect to rule out.
  echo "--- resource table package"
  grep -m3 -E '^Package |^ *Package Groups|package ' "$dump" || echo "  (no package header found)"
  echo "--- manifest package"
  "$aapt2" dump packagename "$apk" 2>/dev/null || echo "  (packagename unavailable)"
  for token in $tokens; do
    echo "--- $token"
    # Print the resource block: its id, then each configuration and value.
    if ! awk -v want="$token" '
      $0 ~ ("dimen/" want "$") { found=1; print; next }
      found && /^ *resource / { found=0 }
      found { print }
    ' "$dump" | grep -q .; then
      echo "  ABSENT_FROM_RESOURCE_TABLE"
    else
      awk -v want="$token" '
        $0 ~ ("dimen/" want "$") { found=1; print; next }
        found && /^ *resource / { found=0 }
        found { print }
      ' "$dump"
    fi
  done
} > "$out"

cat "$out"
