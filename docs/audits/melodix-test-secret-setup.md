# Poser le secret de signature de test `MELODIX_TEST_KEYSTORE_B64` — sans jamais exposer la clé

MEL-BUG-023 exige une clé de signature **persistante** pour les pre-releases de test. La clé privée
(`melodix-test-release.p12`, alias `melodix-test`) est livrée **hors du dépôt** — elle ne doit jamais
être commitée, journalisée, collée dans un chat, ni imprimée à l'écran.

Empreinte SHA-256 du certificat (publique, publiée dans les notes de release) :
`05:47:8B:C0:52:4C:EC:88:02:D9:13:04:CC:58:84:80:87:B4:9B:05:25:DE:B7:35:42:D1:24:44:EA:9B:06:17`

## Méthode recommandée (script fourni, rien n'est affiché)

Depuis la racine du dépôt, avec le `.p12` placé dans votre `$HOME` :

```bash
./scripts/set_test_signing_secret.sh ~/melodix-test-release.p12 Souxch06/Melodix
```

Le script lit le fichier localement, l'encode en base64 et le passe à `gh secret set` **par tube
(stdin)** : la valeur n'apparaît jamais dans le terminal, les logs, l'historique shell ou le chat.
Il refuse de s'exécuter si le fichier se trouve dans le dépôt, et n'affiche ensuite que le **nom** du
secret.

## Méthode équivalente en une commande

```bash
base64 -w0 ~/melodix-test-release.p12 | gh secret set MELODIX_TEST_KEYSTORE_B64 --repo Souxch06/Melodix --body-file -
```

> Ne faites **pas** `base64 -w0 fichier` seul (la valeur serait affichée), ne stockez pas la sortie
> dans une variable ou un fichier, et ne la copiez-collez nulle part.

## Méthode manuelle (interface GitHub)

1. GitHub → dépôt `Souxch06/Melodix` → **Settings** → **Secrets and variables** → **Actions** →
   **New repository secret**.
2. Name : `MELODIX_TEST_KEYSTORE_B64`.
3. Value : collez le contenu de `base64 -w0 ~/melodix-test-release.p12` généré **localement sur
   votre machine** (pas dans CI, pas dans un chat). Ne collez jamais le fichier `.p12` brut.
4. **Save**. La valeur devient illisible côté GitHub ; `gh secret list` ne montre que le nom.

## Vérification sans exposer la valeur

```bash
gh secret list --repo Souxch06/Melodix        # ne liste que les noms
```

Puis poussez un commit sur `arena/6b935c3e-melodix` : le job `build-qa-apk` doit passer (plus de
fail-loud), la preuve de stabilité de signature s'exécute (2 signatures → même empreinte de
certificat), et la pre-release de test se publie automatiquement **uniquement** si les 6 jobs sont
verts.

## Historique et migration (2026-11-06, recréation depuis Arena)

- La clé précédente (`45:62:21:…:8C:B1:AF`) a été générée dans un bac à sable dont le système de fichiers a été
  réinitialisé : elle n'a **jamais** été posée comme secret et n'a signé **aucune** release publiée (les builds
  correspondants ont échoué volontairement, fail-loud). Les pre-releases publiées jusqu'à `test.45` étaient signées
  par des clés jetables par run (MEL-BUG-023) : elles ne sont **pas** installables par-dessus une build signée avec
  la clé persistante. **Migration** : désinstaller l'ancienne build de test avant d'installer la première build
  signée avec la clé persistante.
- Nouvelle clé persistante recréée depuis l'environnement Arena (openssl 3, PKCS12 AES-256-CBC / MAC SHA-256,
  alias `melodix-test`, validité 30 ans) : empreinte SHA-256 du certificat ci-dessus.
- Pose du secret : **bloquée côté Arena** — le token GitHub connecté renvoie HTTP 403 sur tous les endpoints
  `actions/secrets` (y compris `public-key`), il manque la permission « Secrets » en écriture. Action requise :
  reconnecter GitHub dans Arena avec un token autorisé à gérer les secrets Actions du dépôt (PAT fine-grained :
  permission dépôt « Secrets: Read and write »), puis relancer `./scripts/set_test_signing_secret.sh` depuis Arena.

## Règles absolues

- Jamais de `genkeypair` dans le workflow : secret absent = build en échec volontaire (fail-loud),
  **aucune release publiée** tant que le secret manque.
- Ne jamais commiter `*.p12`, `*.jks`, `*.keystore` ni aucun base64 de clé (un test de garde
  (`tests/ui_layout_audit.test.js`) bloque ces fichiers).
- Ne jamais déclarer la mise à jour install-par-dessus réussie sans un run CI vert l'attestant.
