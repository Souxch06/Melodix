#!/usr/bin/env bash
# Pose le secret GitHub MELODIX_TEST_KEYSTORE_B64 SANS jamais exposer la clé :
# le fichier PKCS12 est lu localement, encodé en base64 et passé à `gh` par
# tube (stdin) — rien n'est affiché, journalisé, commité ni collé dans le chat.
#
# Usage :
#   ./scripts/set_test_signing_secret.sh [chemin-du.p12] [owner/repo]
# Defaults :
#   chemin : $HOME/melodix-test-release.p12
#   repo   : Souxch06/Melodix
#
# Vérifications de sécurité intégrées :
#   - refuse de lancer si le fichier ressemble à une clé copiée dans le dépôt
#   - n'affiche JAMAIS le contenu ni l'encodage du fichier
#   - n'affiche que le NOM du secret après pose (gh ne renvoie jamais la valeur)
set -euo pipefail

KEYSTORE_FILE="${1:-$HOME/melodix-test-release.p12}"
REPO="${2:-Souxch06/Melodix}"
SECRET_NAME="MELODIX_TEST_KEYSTORE_B64"

if [[ ! -f "$KEYSTORE_FILE" ]]; then
    echo "::error::fichier keystore introuvable: $KEYSTORE_FILE" >&2
    echo "Téléchargez d'abord melodix-test-release.p12 hors du dépôt (livré séparément)." >&2
    exit 1
fi

# Garde-fou : la clé ne doit pas vivre dans le dépôt.
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -n "$REPO_ROOT" && "$(cd "$(dirname "$KEYSTORE_FILE")" && pwd)" == "$REPO_ROOT"* ]]; then
    echo "::error::la clé ne doit PAS résider dans le dépôt Git ($REPO_ROOT)." >&2
    echo "Déplacez le .p12 hors du dépôt (ex: \$HOME) avant de continuer." >&2
    exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
    echo "::error::gh CLI requis (connecté à GitHub)." >&2
    exit 1
fi

# Le base64 est produit et consommé dans le même pipe : aucune trace écrite.
base64 -w0 "$KEYSTORE_FILE" | gh secret set "$SECRET_NAME" --repo "$REPO" --body-file -

echo "Secret '$SECRET_NAME' posé sur $REPO (valeur jamais affichée)."
echo "Empreinte SHA-256 du certificat attendue dans les notes de release :"
echo "  05:47:8B:C0:52:4C:EC:88:02:D9:13:04:CC:58:84:80:87:B4:9B:05:25:DE:B7:35:42:D1:24:44:EA:9B:06:17"
echo "Vérification (n'affiche que les noms) : gh secret list --repo $REPO"
echo "Ne committez jamais le .p12, ne collez jamais sa valeur base64 dans le chat."
