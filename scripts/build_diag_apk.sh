#!/usr/bin/env bash
# Builds the standalone media-session diagnostic APK (com.melodix.diag).
# Signed with an ephemeral key created for this build: it is NOT a Melodix release key.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-$ROOT/diag-out}"
BT="$ANDROID_HOME/build-tools/35.0.0"
JAR="$ANDROID_HOME/platforms/android-36/android.jar"
mkdir -p "$OUT/classes" "$OUT/dex"

"$BT/aapt2" link -o "$OUT/base.apk" -I "$JAR" --manifest "$ROOT/diag/AndroidManifest.xml" --min-sdk-version 24 --target-sdk-version 35 --version-code 1 --version-name diag-1
javac --release 8 -classpath "$JAR" -d "$OUT/classes" $(find "$ROOT/diag/src" -name '*.java')
"$BT/d8" --lib "$JAR" --min-api 24 --output "$OUT/dex" $(find "$OUT/classes" -name '*.class')
(cd "$OUT/dex" && zip -q "$OUT/base.apk" classes.dex)
"$BT/zipalign" -f 4 "$OUT/base.apk" "$OUT/aligned.apk"

KS="$OUT/diag-ephemeral.jks"
PASS="$(head -c 24 /dev/urandom | base64)"
keytool -genkeypair -keystore "$KS" -storepass "$PASS" -keypass "$PASS" -alias diag -keyalg RSA -keysize 2048 -validity 2 -dname "CN=Melodix diagnostic (ephemeral)" >/dev/null 2>&1
"$BT/apksigner" sign --ks "$KS" --ks-key-alias diag --ks-pass "pass:$PASS" --key-pass "pass:$PASS" --out "$OUT/melodix-diag.apk" "$OUT/aligned.apk"
"$BT/apksigner" verify --verbose --min-sdk-version 24 "$OUT/melodix-diag.apk"
echo "built: $OUT/melodix-diag.apk"
