#!/usr/bin/env bash
# Separate instrumentation APK, synthetic content, fresh offline emulator only.
set -Eeuo pipefail
phase='preconditions'
trap 'echo "::error title=Visual fixture phase::$phase" >&2' ERR
: "${ANDROID_HOME:?}" "${RUNNER_TEMP:?}" "${MELODIX_PREVIEW_KEYSTORE_B64:?}" "${MELODIX_PREVIEW_KEYSTORE_PASSWORD:?}" "${MELODIX_PREVIEW_KEY_PASSWORD:?}"
adb shell dumpsys connectivity | tr -d '\r' | grep -E '^[[:space:]]*Active default network: (null|none)[[:space:]]*$' >/dev/null
serial="$(adb get-serialno)"; [[ "$serial" == emulator-* ]]
base="$(cd "$(dirname "$0")" && pwd)"; work="$(mktemp -d "$RUNNER_TEMP/visual-fixture.XXXXXX")"; trap 'rm -rf "$work"' EXIT
umask 077
printf '%s' "$MELODIX_PREVIEW_KEYSTORE_B64" | base64 --decode > "$work/preview.jks"
mkdir -p "$work/classes" "$work/dex" "${GITHUB_WORKSPACE:?}/visual-fixture-output"
sdk="$ANDROID_HOME/platforms/android-35/android.jar"; tools="$ANDROID_HOME/build-tools/35.0.0"
phase='compile fixture'
javac -encoding UTF-8 -source 8 -target 8 -classpath "$sdk" -d "$work/classes" "$base/VisualFixture.java"
(cd "$work/classes" && jar cf "$work/fixture.jar" .)
"$tools/d8" --min-api 24 --output "$work/dex" "$work/fixture.jar"
phase='package fixture'
"$tools/aapt" package -f -M "$base/AndroidManifest.xml" -I "$sdk" -F "$work/unsigned.apk"
(cd "$work/dex" && zip -q "$work/unsigned.apk" classes.dex)
"$tools/zipalign" -f 4 "$work/unsigned.apk" "$work/aligned.apk"
phase='sign fixture'
"$tools/apksigner" sign --ks "$work/preview.jks" --ks-key-alias MELODIX_PREVIEW \
  --ks-pass env:MELODIX_PREVIEW_KEYSTORE_PASSWORD --key-pass env:MELODIX_PREVIEW_KEY_PASSWORD \
  --out "$work/fixture.apk" "$work/aligned.apk"
phase='install fixture'
adb install "$work/fixture.apk" >/dev/null
phase='execute synthetic visual fixture'
adb shell am instrument -w -r com.melodix.visualfixture/.VisualFixture | tr -d '\r' > "$work/result"
if ! grep -Fx 'INSTRUMENTATION_RESULT: result=GLASS_FIXTURE_OK' "$work/result" >/dev/null; then
  cat "$work/result" >&2
  python3 - "$work/result" <<'PYCODE'
import pathlib,sys
s=pathlib.Path(sys.argv[1]).read_text(errors='replace')
line=next((x for x in s.splitlines() if 'GLASS_FIXTURE_FAIL:' in x),'fixture did not report success')
print('::error title=Visual fixture result::'+line[:500].replace('%','%25').replace('\r','%0D').replace('\n','%0A'))
PYCODE
  exit 1
fi
phase='copy synthetic screenshots'
for screen in settings playlist; do
  adb pull "/sdcard/Android/data/com.melodix.music.preview/files/glass-fixture-$screen.png" "${GITHUB_WORKSPACE}/visual-fixture-output/$screen.png" >/dev/null || \
    echo "::warning::Could not retrieve synthetic $screen screenshot."
done
echo '::notice title=Offline Glass fixture::Settings and playlist synthetic views executed on Android; no Spotify account, network or playback.'
