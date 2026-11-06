#!/usr/bin/env bash
# Publie une pre-release de test via l'API GitHub (autorisée depuis Arena ;
# uploads.github.com est hors allowlist, donc l'APK est servie depuis releases/).
# Usage: publish_preview_release.sh <tag> <apk-name> <sha256> <cert-fingerprint> <commit-sha> [extra-notes-file]
# Exemple: publish_preview_release.sh v1.2.2-test.49-preview Melodix-Test-v1.2.2-test49.apk 29ab… F9:A6:…:24:18 $(git rev-parse HEAD)
set -euo pipefail
TAG="${1:?tag requis (ex. v1.2.2-test.49-preview)}"
APK="${2:?nom de l'APK dans releases/}"
SHA256="${3:?sha256 de l'APK}"
FP="${4:?empreinte SHA-256 du certificat}"
COMMIT="${5:?sha du commit testé}"
EXTRA="${6:-}"
REPO="Souxch06/Melodix"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
BR="arena/6b935c3e-melodix"
[[ "$BRANCH" == "$BR" ]] || { echo "::error::ne publier que depuis $BR" >&2; exit 1; }
[[ "$TAG" =~ ^v[0-9]+\.[0-9]+\.[0-9]+-test\.[0-9]+-preview$ ]] || { echo "::error::tag de pre-release test requis" >&2; exit 1; }

NOTES="$(mktemp)"
{
  echo "## Melodix test release ${TAG} (PRE-RELEASE — test uniquement)"
  echo
  echo "- **Commit testé** : \`${COMMIT}\` (branche \`${BR}\`, PR #8)"
  echo "- **APK** : [${APK}](https://github.com/${REPO}/blob/${BR}/releases/${APK}) (servie depuis le dépôt : uploads.github.com indisponible depuis l'environnement Arena)"
  echo "- **sha256** : \`${SHA256}\`"
  echo "- **Signature** : v1+v2+v3, empreinte certificat \`${FP}\` (stabilité prouvée : 2 signatures → même certificat)."
  echo "- ⚠️ Désinstaller toute preview d'empreinte différente avant installation (chaque preview Arena documente son empreinte)."
  echo
  if [[ -n "$EXTRA" && -f "$EXTRA" ]]; then cat "$EXTRA"; fi
  echo
  echo "### Limites honnêtes"
  echo "Parcours Spotify avec session réelle : non validés en sandbox. Suite automatisée verte au commit. CI : fail-loud volontaire (secret absent) inchangé."
} > "$NOTES"

gh api -X POST "repos/${REPO}/releases" \
  -F tag_name="$TAG" \
  -F name="Melodix Preview ${TAG#v}" \
  -F target_commitish="$COMMIT" \
  -F prerelease=true -F draft=false \
  -F body="$(cat "$NOTES")" \
  --jq '{tag_name, prerelease, draft, html_url}'
rm -f "$NOTES"
# Vérification obligatoire : la release doit exister et l'APK être servie.
gh release view "$TAG" --repo "$REPO" --json tagName,isPrerelease,publishedAt,url >/dev/null
gh api "repos/${REPO}/contents/releases/${APK}?ref=${BR}" --jq '{name,size,download_url}'
echo "Release publiée et vérifiée : ${TAG}"
