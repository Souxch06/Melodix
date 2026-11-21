#!/usr/bin/env bash
# Verify the exact build-only Preview APK used by the P0 display comparison.
# It writes a small provenance sidecar only after every check passes. It never
# prints raw resource tables, manifests, logcat, UI hierarchies, or account data.
set -euo pipefail

die() {
  echo "::error title=P0 display APK verification::$*" >&2
  exit 1
}

[[ $# -eq 6 ]] || die "usage: p0_display_verify_apk.sh APK_DIR APK_NAME SOURCE_REF EXPECTED_VERSION_CODE EXPECTED_VERSION_NAME PROVENANCE_OUT"
apk_dir="$1"
apk_name="$2"
source_ref="$3"
expected_version_code="$4"
expected_version_name="$5"
provenance_out="$6"

[[ -d "$apk_dir" ]] || die "APK artifact directory is missing"
[[ "$apk_name" =~ ^Melodix-Preview-[A-Za-z0-9._-]+\.apk$ ]] || die "unexpected APK artifact name"
[[ "$source_ref" =~ ^[0-9a-f]{40}$ ]] || die "source_ref must be a full lowercase commit SHA"
[[ "$expected_version_code" =~ ^[0-9]+$ ]] || die "expected versionCode must be numeric"
[[ "$expected_version_name" == "1.2.2-${source_ref:0:7}" ]] || die "expected versionName does not match the source SHA"
[[ -s "$apk_dir/$apk_name" ]] || die "APK file is missing"
[[ -s "$apk_dir/$apk_name.sha256" ]] || die "APK checksum file is missing"
[[ -s "$apk_dir/assets-manifest.json" ]] || die "packaged-assets manifest is missing"

# The exact source checkout is mandatory: without it the packaged assets could
# only be compared against digests the manifest declares about itself, which is
# self-attested provenance, not provenance.
: "${SOURCE_ROOT:?SOURCE_ROOT must point to the exact source checkout under test}"
[[ -d "$SOURCE_ROOT/assets" ]] || die "SOURCE_ROOT has no assets directory"
[[ -d "$SOURCE_ROOT/scripts" ]] || die "SOURCE_ROOT has no scripts directory"

: "${ANDROID_HOME:?ANDROID_HOME must point to the Android SDK}"
build_tools="$ANDROID_HOME/build-tools/35.0.0"
[[ -x "$build_tools/aapt" && -x "$build_tools/apksigner" ]] || die "Android build-tools 35.0.0 are unavailable"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
apk="$apk_dir/$apk_name"

(cd "$apk_dir" && sha256sum -c "$apk_name.sha256" >"$tmp/sha256-check.txt" 2>&1) || die "APK checksum verification failed"
apk_sha256="$(sha256sum "$apk" | awk '{print $1}')"
[[ "$apk_sha256" =~ ^[0-9a-f]{64}$ ]] || die "could not compute APK SHA-256"

"$build_tools/apksigner" verify --verbose --min-sdk-version 24 "$apk" >"$tmp/apksigner-verify.txt" 2>&1 || die "APK signature verification failed"
"$build_tools/aapt" dump badging "$apk" >"$tmp/badging.txt" 2>&1 || die "could not read APK badging"
package_id="$(sed -n "s/^package: name='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
version_code="$(sed -n "s/^package:.*versionCode='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
version_name="$(sed -n "s/^package:.*versionName='\([^']*\)'.*/\1/p" "$tmp/badging.txt")"
[[ "$package_id" == "com.melodix.music.preview" ]] || die "APK package id mismatch"
[[ "$version_code" == "$expected_version_code" ]] || die "APK versionCode mismatch"
[[ "$version_name" == "$expected_version_name" ]] || die "APK versionName mismatch"

"$build_tools/aapt" dump xmltree "$apk" AndroidManifest.xml >"$tmp/manifest-tree.txt" 2>&1 || die "could not read APK manifest"
target_debuggable="$(python3 - "$tmp/manifest-tree.txt" <<'PY'
import pathlib
import re
import sys

text = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8", errors="replace")
line = next((item for item in text.splitlines() if re.search(r"\bandroid:debuggable(?:\(|=)", item)), None)
if line is None:
    print("false")
    raise SystemExit(0)
match = re.search(r"android:debuggable(?:\([^)]*\))?=\s*(?:\([^)]*\))?([^\s]+)", line)
if not match:
    raise SystemExit("unable to parse android:debuggable")
value = match.group(1).lower()
if value in ("true", "false"):
    print(value)
elif re.fullmatch(r"(?:0x[0-9a-f]+|[0-9]+)", value):
    print(str(int(value, 0) != 0).lower())
else:
    raise SystemExit("unrecognized android:debuggable value")
PY
)" || die "could not parse APK debuggable flag"
[[ "$target_debuggable" == "true" ]] || die "display comparison requires the build-only debuggable APK"

"$build_tools/aapt" dump --values resources "$apk" >"$tmp/resources.txt" 2>&1 || die "could not read APK resources"
grep -Fq "$source_ref" "$tmp/resources.txt" || die "APK does not embed the requested source SHA"
"$build_tools/apksigner" verify --print-certs "$apk" >"$tmp/signer.txt" 2>&1 || die "could not read APK signer certificate"
signer_sha256="$(sed -n 's/^Signer #1 certificate SHA-256 digest: //p' "$tmp/signer.txt" | head -n 1 | tr '[:upper:]' '[:lower:]')"
[[ "$signer_sha256" =~ ^[0-9a-f]{64}$ ]] || die "could not verify APK signer fingerprint"
signer_fingerprint="$(printf '%s' "$signer_sha256" | tr '[:lower:]' '[:upper:]' | fold -w 2 | paste -sd ':' -)"
[[ "$signer_fingerprint" =~ ^([A-F0-9]{2}:){31}[A-F0-9]{2}$ ]] || die "could not format APK signer fingerprint"
grep -Fq "$signer_fingerprint" "$tmp/resources.txt" || die "APK signer does not match its embedded expected signature"

python3 - "$apk" "$apk_dir/assets-manifest.json" "$source_ref" "$SOURCE_ROOT" "$tmp/assets-verified.json" <<'PY'
import hashlib
import json
import pathlib
import re
import sys
import zipfile

apk_path, manifest_path, source_ref, source_root, summary_path = sys.argv[1:6]
root = pathlib.Path(source_root)
assets_root = root / "assets"

# The generated assets and their required readable sources are fixed by the
# build contract, never by the manifest. Omitting "source"/"source_sha256" can
# therefore never lower the verification level.
GENERATED = ("spotify_bridge", "native_ui_shell", "melodix_home")
HEADER_RE = re.compile(
    rb"/\* generated from (scripts/[A-Za-z0-9_.-]+\.source\.js); "
    rb"sha256=([0-9a-f]{64}); terser=5\.51\.2; no-compress,no-mangle \*/"
)
HEX64 = re.compile(r"[0-9a-f]{64}")


def safe_relative(value, prefix):
    relative = pathlib.PurePosixPath(value)
    if relative.is_absolute() or ".." in relative.parts or not value.startswith(prefix):
        raise SystemExit(f"unsafe provenance path: {value}")
    return relative


def check_source_binding(name, source, source_sha256):
    if not isinstance(source, str) or not isinstance(source_sha256, str):
        raise SystemExit(f"asset source provenance is missing or invalid: {name}")
    if not HEX64.fullmatch(source_sha256):
        raise SystemExit(f"asset source digest is invalid: {name}")
    safe_relative(source, "scripts/")
    source_path = root / source
    if not source_path.is_file():
        raise SystemExit(f"asset source file is absent from the checkout: {name}")
    if hashlib.sha256(source_path.read_bytes()).hexdigest() != source_sha256:
        raise SystemExit(f"asset manifest source hash mismatch: {name}")


manifest = json.loads(pathlib.Path(manifest_path).read_text(encoding="utf-8"))
if not isinstance(manifest, dict):
    raise SystemExit("asset manifest is not an object")
if manifest.get("source_commit") != source_ref:
    raise SystemExit("asset manifest source SHA mismatch")
entries = manifest.get("assets")
if not isinstance(entries, list) or not entries:
    raise SystemExit("asset manifest is empty")

# The checkout is authoritative: the manifest must cover exactly its assets,
# with no missing, duplicate or extra entry.
expected = {path.relative_to(root).as_posix() for path in assets_root.rglob("*") if path.is_file()}
seen = {}
for entry in entries:
    if not isinstance(entry, dict):
        raise SystemExit("asset manifest entry is not an object")
    name = entry.get("name")
    if not isinstance(name, str) or not name.startswith("assets/"):
        raise SystemExit("asset manifest entry is not a packaged asset")
    if name in seen:
        raise SystemExit(f"asset manifest contains a duplicate entry: {name}")
    seen[name] = entry
missing = sorted(expected - set(seen))
extra = sorted(set(seen) - expected)
if missing:
    raise SystemExit(f"asset manifest is missing checkout assets: {missing[0]}")
if extra:
    raise SystemExit(f"asset manifest declares assets absent from the checkout: {extra[0]}")

verified = 0
generated_verified = set()
with zipfile.ZipFile(apk_path) as apk_file:
    for name in sorted(seen):
        entry = seen[name]
        safe_relative(name, "assets/")
        asset_sha256 = entry.get("asset_sha256")
        byte_count = entry.get("bytes")
        if not isinstance(asset_sha256, str) or not HEX64.fullmatch(asset_sha256):
            raise SystemExit(f"asset manifest digest is invalid: {name}")
        if not isinstance(byte_count, int) or isinstance(byte_count, bool) or byte_count < 0:
            raise SystemExit(f"asset manifest byte count is invalid: {name}")
        packaged = apk_file.read(name)
        if hashlib.sha256(packaged).hexdigest() != asset_sha256 or len(packaged) != byte_count:
            raise SystemExit(f"packaged asset mismatch: {name}")

        # Unconditional: every packaged asset must equal the checked-out file.
        source_asset = root / name
        if not source_asset.is_file():
            raise SystemExit(f"packaged asset has no checkout counterpart: {name}")
        if packaged != source_asset.read_bytes():
            raise SystemExit(f"packaged asset differs from source checkout: {name}")

        pure = pathlib.PurePosixPath(name)
        is_generated = (
            pure.parent.as_posix() == "assets" and pure.suffix == ".js" and pure.stem in GENERATED
        )
        header = HEADER_RE.fullmatch(packaged.split(b"\n", 1)[0])
        if is_generated:
            expected_source = f"scripts/{pure.stem}.source.js"
            if entry.get("source") != expected_source:
                raise SystemExit(f"generated asset must declare its readable source: {name}")
            check_source_binding(name, entry.get("source"), entry.get("source_sha256"))
            if header is None:
                raise SystemExit(f"generated asset has no derivation header: {name}")
            if header.group(1).decode("ascii") != expected_source:
                raise SystemExit(f"generated asset header names the wrong source: {name}")
            if header.group(2).decode("ascii") != entry["source_sha256"]:
                raise SystemExit(f"generated asset header digest disagrees with the manifest: {name}")
            generated_verified.add(pure.stem)
        else:
            # A derivation header, when present, must still be truthful.
            if header is not None:
                declared_source = header.group(1).decode("ascii")
                safe_relative(declared_source, "scripts/")
                declared_path = root / declared_source
                if not declared_path.is_file():
                    raise SystemExit(f"derivation header names an absent source: {name}")
                if hashlib.sha256(declared_path.read_bytes()).hexdigest() != header.group(2).decode("ascii"):
                    raise SystemExit(f"derivation header digest mismatch: {name}")
            if entry.get("source") is not None or entry.get("source_sha256") is not None:
                check_source_binding(name, entry.get("source"), entry.get("source_sha256"))
        verified += 1

absent_generated = sorted(set(GENERATED) - generated_verified)
if absent_generated:
    raise SystemExit(f"generated asset was not source-verified: {absent_generated[0]}")

pathlib.Path(summary_path).write_text(
    json.dumps(
        {
            "assets_source_root_verified": True,
            "assets_verified_count": verified,
            "generated_assets_source_verified_count": len(generated_verified),
        },
        sort_keys=True,
    )
    + "\n",
    encoding="utf-8",
)
PY
assets_manifest_sha256="$(sha256sum "$apk_dir/assets-manifest.json" | awk '{print $1}')"

mkdir -p "$(dirname "$provenance_out")"
python3 - "$tmp/provenance.json" "$apk_name" "$apk_sha256" "$source_ref" "$version_code" "$version_name" "$signer_sha256" "$assets_manifest_sha256" "$tmp/assets-verified.json" <<'PY'
import json
import pathlib
import sys

(out, apk_name, apk_sha256, source_ref, version_code, version_name, signer_sha256,
 assets_manifest_sha256, assets_summary) = sys.argv[1:]
summary = json.loads(pathlib.Path(assets_summary).read_text(encoding="utf-8"))
if summary["assets_source_root_verified"] is not True:
    raise SystemExit("asset provenance summary does not attest a checkout comparison")
if summary["generated_assets_source_verified_count"] != 3:
    raise SystemExit("asset provenance summary does not attest all three generated sources")
report = {
    "schema_version": 2,
    "apk_name": apk_name,
    "apk_sha256": apk_sha256,
    "source_commit": source_ref,
    "version_code": int(version_code),
    "version_name": version_name,
    "signer_sha256": signer_sha256,
    "debuggable": True,
    "assets_manifest_sha256": assets_manifest_sha256,
    "assets_source_root_verified": True,
    "assets_verified_count": summary["assets_verified_count"],
    "generated_assets_source_verified_count": summary["generated_assets_source_verified_count"],
}
pathlib.Path(out).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
PY
mv "$tmp/provenance.json" "$provenance_out"
assets_verified_count="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["assets_verified_count"])' "$provenance_out")"
echo "::notice title=P0 display APK verified::package=com.melodix.music.preview; source=$source_ref; versionCode=$version_code; versionName=$version_name; debuggable=true; sha256=$apk_sha256; assets_source_root_verified=true; assets_verified_count=$assets_verified_count; generated_assets_source_verified_count=3"
