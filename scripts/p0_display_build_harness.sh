#!/usr/bin/env bash
# Build the test-only instrumentation runner for the exact verified Preview APK.
# Signing secrets are read only from the environment and the temporary keystore
# is removed on exit. No raw Android output or account data is printed.
set -euo pipefail

die() {
  echo "::error title=P0 display harness build::$*" >&2
  exit 1
}

[[ $# -eq 6 ]] || die "usage: p0_display_build_harness.sh TOOLING_ROOT TARGET_APK VERSION_CODE VERSION_NAME EXPECTED_SIGNER_SHA256 OUTPUT_DIR"
tooling_root="$1"
target_apk="$2"
version_code="$3"
version_name="$4"
expected_signer_sha256="$5"
output_dir="$6"

[[ -d "$tooling_root/tests/android" ]] || die "tooling checkout is missing tests/android"
[[ -s "$target_apk" ]] || die "verified target APK is missing"
[[ "$version_code" =~ ^[0-9]+$ ]] || die "versionCode must be numeric"
[[ -n "$version_name" ]] || die "versionName is required"
[[ "$expected_signer_sha256" =~ ^[0-9a-f]{64}$ ]] || die "expected signer SHA-256 must be lowercase hex"
[[ -n "${MELODIX_PREVIEW_KEYSTORE_B64:-}" && -n "${MELODIX_PREVIEW_KEYSTORE_PASSWORD:-}" && -n "${MELODIX_PREVIEW_KEY_PASSWORD:-}" ]] || die "preview signing secrets are required"
: "${ANDROID_HOME:?ANDROID_HOME must point to the Android SDK}"

android_jar="$ANDROID_HOME/platforms/android-36/android.jar"
build_tools="$ANDROID_HOME/build-tools/35.0.0"
[[ -s "$android_jar" ]] || die "android-36 platform is unavailable"
[[ -x "$build_tools/d8" && -x "$build_tools/aapt" && -x "$build_tools/zipalign" && -x "$build_tools/apksigner" ]] || die "Android build-tools 35.0.0 are unavailable"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
classes_dir="$tmp/classes"
dex_dir="$tmp/dex"
mkdir -p "$classes_dir" "$dex_dir" "$output_dir"

javac --release 8 -classpath "$android_jar" -d "$classes_dir" "$tooling_root/tests/android/HomeRenderInstrumentation.java" >"$tmp/javac.txt" 2>&1 || die "instrumentation Java compilation failed"
mapfile -t harness_classes < <(find "$classes_dir" -type f -name '*.class' -print)
[[ "${#harness_classes[@]}" -gt 0 ]] || die "no compiled instrumentation classes found"
"$build_tools/d8" --lib "$android_jar" --min-api 24 --output "$dex_dir" "${harness_classes[@]}" >"$tmp/d8.txt" 2>&1 || die "instrumentation dexing failed"

unsigned_apk="$tmp/unsigned.apk"
aligned_apk="$tmp/aligned.apk"
test_apk="$tmp/harness.apk"
"$build_tools/aapt" package \
  -f \
  -M "$tooling_root/tests/android/AndroidManifest.xml" \
  -I "$android_jar" \
  --min-sdk-version 24 \
  --target-sdk-version 36 \
  --version-code "$version_code" \
  --version-name "$version_name" \
  -F "$unsigned_apk" >"$tmp/aapt.txt" 2>&1 || die "instrumentation APK packaging failed"
(cd "$dex_dir" && zip -q "$unsigned_apk" classes.dex)
"$build_tools/zipalign" -f 4 "$unsigned_apk" "$aligned_apk" >"$tmp/zipalign.txt" 2>&1 || die "instrumentation APK alignment failed"

keystore="$tmp/preview-signing.jks"
printf '%s' "$MELODIX_PREVIEW_KEYSTORE_B64" | base64 --decode > "$keystore"
chmod 600 "$keystore"
"$build_tools/apksigner" sign \
  --ks "$keystore" \
  --ks-key-alias MELODIX_PREVIEW \
  --ks-pass env:MELODIX_PREVIEW_KEYSTORE_PASSWORD \
  --key-pass env:MELODIX_PREVIEW_KEY_PASSWORD \
  --out "$test_apk" "$aligned_apk" >"$tmp/sign.txt" 2>&1 || die "instrumentation APK signing failed"
rm -f "$keystore"
"$build_tools/apksigner" verify --verbose --min-sdk-version 24 "$test_apk" >"$tmp/verify.txt" 2>&1 || die "instrumentation APK signature verification failed"

"$build_tools/aapt" dump badging "$test_apk" >"$tmp/badging.txt" 2>&1 || die "could not read instrumentation badging"
runner_package="$(sed -n "s/^package: name='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
runner_version_code="$(sed -n "s/^package:.*versionCode='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
runner_version_name="$(sed -n "s/^package:.*versionName='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
[[ "$runner_package" == "com.melodix.music.preview.test" ]] || die "instrumentation package id mismatch"
[[ "$runner_version_code" == "$version_code" && "$runner_version_name" == "$version_name" ]] || die "instrumentation version metadata does not match the target APK"

"$build_tools/apksigner" verify --print-certs "$test_apk" >"$tmp/runner-signer.txt" 2>&1 || die "could not read instrumentation signer"
runner_signer_sha256="$(sed -n 's/^Signer #1 certificate SHA-256 digest: //p' "$tmp/runner-signer.txt" | head -n 1 | tr '[:upper:]' '[:lower:]')"
[[ "$runner_signer_sha256" == "$expected_signer_sha256" ]] || die "instrumentation runner and target APK do not share the same certificate"

"$build_tools/aapt" dump xmltree "$test_apk" AndroidManifest.xml >"$tmp/manifest.txt" 2>&1 || die "could not read instrumentation manifest"
grep -Fq 'com.melodix.test.HomeRenderInstrumentation' "$tmp/manifest.txt" || die "instrumentation manifest does not declare the expected runner"
grep -Fq 'com.melodix.music.preview' "$tmp/manifest.txt" || die "instrumentation manifest does not target the Preview package"

final_apk="$output_dir/melodix-display-harness.apk"
cp "$test_apk" "$final_apk"
harness_sha256="$(sha256sum "$final_apk" | awk '{print $1}')"
echo "::notice title=P0 display harness built::package=com.melodix.music.preview.test; target=com.melodix.music.preview; versionCode=$version_code; versionName=$version_name; sha256=$harness_sha256"
