#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TERSER_VERSION="5.51.2"

for ASSET in spotify_bridge native_ui_shell melodix_home; do
  SOURCE="$ROOT/scripts/${ASSET}.source.js"
  OUTPUT="$ROOT/assets/${ASSET}.js"
  TMP="$(mktemp)"
  trap 'rm -f "$TMP" "$OUTPUT.tmp"' EXIT

  if [[ ! -s "$SOURCE" ]]; then
    echo "Missing JavaScript source: $SOURCE" >&2
    exit 1
  fi

  # Whitespace/comment removal only: keep the AST unchanged and do not mangle
  # exported names or identifiers used by the Android bridge.
  npx --yes --package="terser@$TERSER_VERSION" terser "$SOURCE" \
    --ecma 2020 --no-compress --no-mangle --comments false --output "$TMP"
  SOURCE_SHA256="$(sha256sum "$SOURCE" | awk '{print $1}')"
  {
    printf '/* generated from scripts/%s.source.js; sha256=%s; terser=%s; no-compress,no-mangle */\n' \
      "$ASSET" "$SOURCE_SHA256" "$TERSER_VERSION"
    cat "$TMP"
  } > "$OUTPUT.tmp"
  mv "$OUTPUT.tmp" "$OUTPUT"
  rm -f "$TMP"
  trap - EXIT
done
