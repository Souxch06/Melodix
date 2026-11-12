#!/usr/bin/env bash
# A disposable Android signing experiment only. Never signs Melodix APKs.
set -euo pipefail
: "${ANDROID_HOME:?}" "${RUNNER_TEMP:?}"
dir="$RUNNER_TEMP/melodix-ephemeral-signing"; tools="$ANDROID_HOME/build-tools/35.0.0"; sdk="$ANDROID_HOME/platforms/android-36/android.jar"
mkdir -p "$dir/classes" "$dir/dex"
phase=key
cleanup() {
  rc=$?
  rm -f "$dir/fixture.jks"
  if (( rc != 0 )); then
    echo "::error title=Ephemeral signing fixture::phase=$phase exit=$rc"
    if [[ -f "$dir/result.txt" ]]; then grep -E '^INSTRUMENTATION_(RESULT|CODE):' "$dir/result.txt" || true; fi
    if [[ -f "$dir/aapt-error.txt" ]]; then
      while IFS= read -r line; do echo "::error title=Disposable manifest compiler::$line"; done < "$dir/aapt-error.txt"
    fi
  fi
}
trap cleanup EXIT
keytool -genkeypair -keystore "$dir/fixture.jks" -storepass test-only -keypass test-only -alias fixture -dname 'CN=Disposable Android CI Fixture' -keyalg RSA -keysize 2048 -validity 1 >/dev/null 2>&1
cat > "$dir/app.xml" <<'EOF'
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.melodix.ci.ephemeralfixture"><uses-sdk android:minSdkVersion="24" android:targetSdkVersion="36"/><application android:label="Disposable signing fixture" android:hasCode="false" /></manifest>
EOF
cat > "$dir/test.xml" <<'EOF'
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.melodix.ci.ephemeralfixture.test"><uses-sdk android:minSdkVersion="24" android:targetSdkVersion="36"/><application android:label="Disposable signing test"/><instrumentation android:name="com.melodix.ci.FixtureInstrumentation" android:targetPackage="com.melodix.ci.ephemeralfixture"/></manifest>
EOF
cat > "$dir/FixtureInstrumentation.java" <<'EOF'
package com.melodix.ci;
public final class FixtureInstrumentation extends android.app.Instrumentation {
 @Override public void onCreate(android.os.Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){android.os.Bundle result=new android.os.Bundle();result.putString("overall","passed");finish(android.app.Activity.RESULT_OK,result);}
}
EOF
phase=compile
javac --release 8 -classpath "$sdk" -d "$dir/classes" "$dir/FixtureInstrumentation.java"
mapfile -t classes < <(find "$dir/classes" -name '*.class')
"$tools/d8" --lib "$sdk" --min-api 24 --output "$dir/dex" "${classes[@]}"
phase=package_app
"$tools/aapt" package -f -M "$dir/app.xml" -I "$sdk" -F "$dir/app-unsigned.apk" 2> "$dir/aapt-error.txt"
phase=package_test
"$tools/aapt" package -f -M "$dir/test.xml" -I "$sdk" -F "$dir/test-unsigned.apk" 2> "$dir/aapt-error.txt"
phase=package_dex
(cd "$dir/dex" && zip -q "$dir/test-unsigned.apk" classes.dex)
phase=sign
for part in app test; do
  "$tools/zipalign" -f 4 "$dir/$part-unsigned.apk" "$dir/$part-aligned.apk"
  "$tools/apksigner" sign --ks "$dir/fixture.jks" --ks-key-alias fixture --ks-pass pass:test-only --key-pass pass:test-only --out "$dir/$part.apk" "$dir/$part-aligned.apk"
  "$tools/apksigner" verify "$dir/$part.apk"
done
phase=compare_certs
appcert=$("$tools/apksigner" verify --print-certs "$dir/app.apk" | sed -n 's/^Signer #1 certificate SHA-256 digest: //p')
testcert=$("$tools/apksigner" verify --print-certs "$dir/test.apk" | sed -n 's/^Signer #1 certificate SHA-256 digest: //p')
[[ "$appcert" =~ ^[0-9a-f]{64}$ && "$appcert" == "$testcert" && "$appcert" != e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f ]]
phase=install
adb install "$dir/app.apk"
adb install -r "$dir/app.apk" # Same-run fixture update, not cross-run persistent signing.
adb install "$dir/test.apk"
phase=instrument
adb shell am instrument -w -r com.melodix.ci.ephemeralfixture.test/com.melodix.ci.FixtureInstrumentation > "$dir/result.txt"
phase=verify_instrumentation
grep -Fxq 'INSTRUMENTATION_RESULT: overall=passed' "$dir/result.txt"
echo '::notice title=Ephemeral signing fixture::isolated package install/update and same-key instrumentation passed; no production APK signed; persistence across runs not tested'
