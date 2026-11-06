#!/usr/bin/env bash
# Chaîne de build/signature d'une preview de test DEPUIS Arena (sans secret GitHub Actions).
# Prérequis (hôtes autorisés uniquement) : pip install jdk4py ; npm i apktool-jar apk_sign_ts (dans /home/user/apktools).
# La clé privée n'est jamais affichée, loggée ou commitée : seul le PKCS12 local est lu.
set -euo pipefail
KEYSTORE="${1:-/home/user/melodix-test-release.p12}"
REPO="$(git rev-parse --show-toplevel)"
VERSION_CODE="${2:-1046}"
B="${TMPDIR:-/tmp}/melodix-build"
[[ -f "$KEYSTORE" ]] || { echo "::error::keystore introuvable: $KEYSTORE" >&2; exit 1; }
rm -rf "$B"; mkdir -p "$B/work" "$B/framework"
for item in AndroidManifest.xml META-INF apktool.yml assets kotlin lib original res smali unknown; do
  cp -a "$REPO/$item" "$B/work/"
done
# versionCode dans la COPIE TEMPORAIRE uniquement (le dépôt n'est jamais modifié)
sed -i "s/^  versionCode: .*/  versionCode: $VERSION_CODE/" "$B/work/apktool.yml"
# empreinte du certificat persistant -> copie temporaire (l'app s'auto-vérifie au démarrage)
FP="$(openssl pkcs12 -in "$KEYSTORE" -passin pass:android -nokeys -clcerts 2>/dev/null \
  | openssl x509 -outform DER 2>/dev/null | sha256sum | awk '{print toupper($1)}' | fold -w 2 | paste -sd ':' -)"
[[ "$FP" =~ ^([A-F0-9]{2}:){31}[A-F0-9]{2}$ ]] || { echo "::error::empreinte invalide" >&2; exit 1; }
python3 - "$B/work/res/values/strings.xml" "$FP" <<'PY'
import pathlib, re, sys
p = pathlib.Path(sys.argv[1]); t = p.read_text(encoding="utf-8")
pat = r'(<string name="expected_signature_sha256">)[^<]*(</string>)'
assert len(re.findall(pat, t)) == 1
p.write_text(re.sub(pat, lambda m: m.group(1) + sys.argv[2] + m.group(2), t), encoding="utf-8")
PY
# apktool (jar npm + JRE pypi) : build de la copie temporaire
JAVA="$(python3 -c 'import jdk4py; print(jdk4py.JAVA_HOME + "/bin/java")')"
APKTOOL_JAR="$(find /home/user/apktools/node_modules/apktool-jar -name 'apktool_*.jar' | head -1)"
cp "$REPO/android/apktool-framework/1.apk" "$B/framework/1.apk"
"$JAVA" -jar "$APKTOOL_JAR" if --frame-path "$B/framework" "$B/framework/1.apk"
"$JAVA" -jar "$APKTOOL_JAR" b "$B/work" --frame-path "$B/framework" -o "$B/unsigned.apk" --force-all
# alignement 4 o des entrées stockées (resources.arsc doit rester stocké+aligné, targetSdk 35)
python3 "$REPO/scripts/zipalign4.py" "$B/unsigned.apk" "$B/aligned.apk"
# signature v1+v2+v3 avec la clé persistante (PEM temporaire en mémoire, jamais écrite dans le dépôt)
openssl pkcs12 -in "$KEYSTORE" -passin pass:android -nodes -out "$B/all.pem" 2>/dev/null
node "$REPO/scripts/apk_sign.js" "$B/aligned.apk" "$B/all.pem" "$B/signed.apk"
echo "APK signé: $B/signed.apk"
sha256sum "$B/signed.apk"
echo "empreinte cert: $FP"
