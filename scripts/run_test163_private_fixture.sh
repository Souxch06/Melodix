#!/usr/bin/env bash
# TEST-ONLY disposable application signed with a disposable key, never Melodix.
set -euo pipefail
# Expose bounded test-only diagnostics even when the Actions log archive is
# unavailable. No real account, production APK or private payload is used.
log="${RUNNER_TEMP:?}/test163-debug.log"
exec > >(tee "$log") 2>&1
trap 'rc=$?; set +x; echo "::warning title=TEST163 fixture command failed::line $LINENO exit $rc"; tail -60 "$log" | while IFS= read -r line; do echo "::warning title=TEST163 fixture diagnostic::$line"; done' ERR
set -x
: "${ANDROID_HOME:?}" "${RUNNER_TEMP:?}"
dir="$RUNNER_TEMP/test163-private-fixture"
mkdir -p "$dir/smali" "$dir/app-classes" "$dir/test-classes" "$dir/app-dex" "$dir/test-dex" "$dir/target" "$dir/test"
trap 'rm -f "$dir/fixture-key.jks"' EXIT
sdk="$ANDROID_HOME/platforms/android-36/android.jar"
tools="$ANDROID_HOME/build-tools/35.0.0"
npm install --prefix "$dir/tools" --no-audit --no-fund apktool-jar@2.4.1
jar="$dir/tools/node_modules/apktool-jar/bin/apktool_2.4.1.jar"
[[ -f "$jar" ]]
python3 scripts/build_test163_private_fixture.py "$dir/smali"
javac --release 8 -cp "$jar" -d "$dir/app-classes" tests/android/test163/Assemble.java
java -cp "$dir/app-classes:$jar" Assemble "$dir/smali" "$dir/fixture.dex"
javac --release 8 -cp "$sdk" -d "$dir/app-classes" tests/android/test163/Picasso.java
javac --release 8 -cp "$sdk" -d "$dir/test-classes" tests/android/test163/PrivateUiInstrumentation.java
"$tools/d8" --lib "$sdk" --min-api 24 --output "$dir/app-dex" "$dir/fixture.dex" "$dir/app-classes/com/squareup/picasso/Picasso.class"
mapfile -t classes < <(find "$dir/test-classes" -name '*.class')
"$tools/d8" --lib "$sdk" --min-api 24 --output "$dir/test-dex" "${classes[@]}"
cat > "$dir/target/AndroidManifest.xml" <<'XML'
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.melodix.test163.fixture">
 <application android:label="TEST163 synthetic fixture" android:debuggable="true" android:hasCode="true">
  <activity android:name="com.melodix.music.MainActivity" android:exported="true" />
 </application>
</manifest>
XML
cat > "$dir/test/AndroidManifest.xml" <<'XML'
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.melodix.test163.fixture.test">
 <application android:hasCode="true" />
 <instrumentation android:name="com.melodix.test163.PrivateUiInstrumentation" android:targetPackage="com.melodix.test163.fixture" />
</manifest>
XML
for kind in target test; do
 "$tools/aapt" package -f -M "$dir/$kind/AndroidManifest.xml" -I "$sdk" --min-sdk-version 24 --target-sdk-version 35 -F "$dir/$kind-unsigned.apk"
 if [[ "$kind" == target ]]; then dexdir=app-dex; else dexdir=test-dex; fi
 (cd "$dir/$dexdir" && zip -q "$dir/$kind-unsigned.apk" classes.dex)
 "$tools/zipalign" -f 4 "$dir/$kind-unsigned.apk" "$dir/$kind-aligned.apk"
done
keytool -genkeypair -keystore "$dir/fixture-key.jks" -storepass android -keypass android -alias fixture -dname 'CN=Test163 Disposable Fixture' -keyalg RSA -keysize 2048 -validity 1 >/dev/null 2>&1
for kind in target test; do
 "$tools/apksigner" sign --ks "$dir/fixture-key.jks" --ks-key-alias fixture --ks-pass pass:android --key-pass pass:android --out "$dir/$kind.apk" "$dir/$kind-aligned.apk"
 "$tools/apksigner" verify "$dir/$kind.apk"
 adb install "$dir/$kind.apk"
done
set +e
adb shell am instrument -w com.melodix.test163.fixture.test/com.melodix.test163.PrivateUiInstrumentation > "$dir/result.txt" 2>&1
rc=$?
set -e
while IFS= read -r line; do echo "::notice title=TEST163 isolated fixture::$line"; done < "$dir/result.txt"
[[ "$rc" == 0 ]] && grep -q 'PASS synthetic Android fixture: copied production reset and payload runnable' "$dir/result.txt" && grep -q 'INSTRUMENTATION_CODE: -1' "$dir/result.txt"
