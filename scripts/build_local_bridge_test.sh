#!/usr/bin/env bash
# Disposable instrumentation APK only, never a production/Preview APK.
set -euo pipefail
: "${ANDROID_HOME:?}" "${RUNNER_TEMP:?}" "${MELODIX_PREVIEW_KEYSTORE_B64:?}" "${MELODIX_PREVIEW_KEYSTORE_PASSWORD:?}" "${MELODIX_PREVIEW_KEY_PASSWORD:?}"
sdk="$ANDROID_HOME/platforms/android-36/android.jar"
tools="$ANDROID_HOME/build-tools/35.0.0"
dir="$RUNNER_TEMP/melodix-local-bridge"; mkdir -p "$dir/classes" "$dir/dex"
printf '%s' "$MELODIX_PREVIEW_KEYSTORE_B64" | base64 --decode > "$dir/key.jks"
trap 'rm -f "$dir/key.jks"' EXIT
javac --release 8 -classpath "$sdk" -d "$dir/classes" tests/android/LocalBridgeInstrumentation.java
mapfile -t classes < <(find "$dir/classes" -name '*.class')
"$tools/d8" --lib "$sdk" --min-api 24 --output "$dir/dex" "${classes[@]}"
sed 's/HomeRenderInstrumentation/LocalBridgeInstrumentation/g' tests/android/AndroidManifest.xml > "$dir/AndroidManifest.xml"
"$tools/aapt" package -f -M "$dir/AndroidManifest.xml" -I "$sdk" -F "$dir/unsigned.apk"
(cd "$dir/dex" && zip -q "$dir/unsigned.apk" classes.dex)
"$tools/zipalign" -f 4 "$dir/unsigned.apk" "$dir/aligned.apk"
"$tools/apksigner" sign --ks "$dir/key.jks" --ks-key-alias MELODIX_PREVIEW \
    --ks-pass env:MELODIX_PREVIEW_KEYSTORE_PASSWORD --key-pass env:MELODIX_PREVIEW_KEY_PASSWORD \
    --out "$dir/test.apk" "$dir/aligned.apk"
"$tools/apksigner" verify --min-sdk-version 24 "$dir/test.apk"
