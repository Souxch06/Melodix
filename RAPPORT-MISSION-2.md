# Mission 2 — APK installable + GitHub Release

## Build

| Élément                     | Valeur                                                                             |
| --------------------------- | ---------------------------------------------------------------------------------- |
| Workflow utilisé            | `.github/workflows/android-apk.yml` (**l'existant**, aucun second créé)            |
| Déclenchement               | `workflow_dispatch` sur `arena/01a106dd-melodix` avec `publish_test_apk: true`     |
| Version                     | `4.5.0-test.1`                                                                     |
| `versionCode`               | `45001` (convention conservée `major*10000 + minor*1000 + patch` + itération)      |
| `applicationId` / namespace | `com.souxch06.melodix`                                                             |
| APK attendu                 | `Melodix-v4.5.0-test.1.apk` (pas de suffixe SHA : build destiné à être publié)     |
| Node / Java / Gradle        | Node 20 / Java 17 / Gradle (Expo) — versions existantes du workflow, non modifiées |

Ordre du pipeline (23 étapes, vérifié sur le YAML) :

```
1  checkout
2  Valider la config Spotify injectée
3  release_guard : tag + branche + commit   ← NOUVEAU, avant tout build
4-7  Node 20, Java 17, Gradle, dépendances
8  TypeScript + ESLint + Prettier
9  Tests Jest
10 prebuild Android
11 Vérifier la config Android générée (versionCode, versionName, ABI, schemes)
12 Tests Kotlin du module média
13 Compiler l'APK
14 Aligner 16 Kio + signer
17 Vérifier intégrité / installabilité / signature
19 Installer et lancer l'APK sur l'émulateur Android 14
21 Publier l'APK comme artefact
22 Publier la GitHub Release (APK téléchargeable)   ← NOUVEAU
23 Joindre l'APK à la release
```

La Release n'est publiée qu'après le build **et** la validation : l'étape 22 est
conditionnée par `success() && steps.release_guard.outputs.publish_test == 'true'`,
et les étapes étant séquentielles, un build en échec ne l'atteint jamais.
Aucune Release « verte » ne peut sortir d'une étape rouge.

### Garde-fous (étape 3, exécutés avant le build)

- **Branche** : seule `refs/heads/arena/01a106dd-melodix` peut publier. `main`
  ou toute autre branche → échec explicite, aucune Release créée.
- **Commit** : `BUILD_SHA` non vide, sinon échec.
- **Tag** : dérivé de `package.json` (`v4.5.0-test.1`), jamais d'un SHA qui
  changerait à chaque run.
- **Tag déjà pris** : si `v4.5.0-test.1` pointe sur un **autre** commit, on
  incrémente (`v4.5.0-test.2`, …). Aucune Release existante écrasée ou supprimée.
  S'il pointe sur **le commit construit**, la Release est mise à jour
  (re-run idempotent).
- **Tags annotés déréférencés** avant comparaison (voir « Bugs trouvés »).
- **Avant publication** : re-contrôle que le redirect effectif est bien
  `comspotifytestsdk://callback`, sinon échec avant toute publication.
- **APK attaché** : le SHA-256 de l'asset est recalculé et comparé à celui
  calculé dans le workflow.

## APK

| Élément         | Valeur                                                       |
| --------------- | ------------------------------------------------------------ |
| SHA-256         | **à fournir après le run** — je n'ai pas pu construire l'APK |
| Taille          | **à fournir après le run**                                   |
| Commit          | `c7c95d883d1faefa77ac745556669263fce5328c`                   |
| Workflow run ID | **à fournir après le run**                                   |
| Tag             | `v4.5.0-test.1` (vérifié libre sur le remote le 2026-10-04)  |

Je ne dispose d'aucune de ces valeurs réelles et je ne les invente pas.

**Pourquoi je n'ai pas pu construire l'APK :** deux blocages durs et vérifiés.

1. `gh workflow run android-apk.yml` et `POST …/dispatches` renvoient tous deux
   **HTTP 403 « Resource not accessible by integration »** — le jeton de ce
   sandbox n'a pas le scope `workflow`. Testé sur les deux formes, y compris
   l'appel API brut. Le build doit donc être déclenché depuis l'UI GitHub.
2. Aucun outil de build local : `java`, `javac`, `gradle`, `sdkmanager`, `adb`,
   `zipalign`, `apksigner` sont tous **absents**, et `$ANDROID_HOME` n'est pas
   défini. Le sandbox n'a de réseau que vers `api.github.com` et
   `registry.npmjs.org` : `adoptium.net`, `services.gradle.org` et
   `dl.google.com` sont injoignables (SSL_ERROR_SYSCALL). Impossible
   d'installer un JDK ou un SDK Android.

## Release

- Tag : `v4.5.0-test.1`
- Titre : `Melodix v4.5.0-test.1 — Test`
- Asset : `Melodix-v4.5.0-test.1.apk`
- Pré-release, avec l'APK directement en asset (pas de ZIP imbriqué).

**État : la Release n'existe pas encore.** Elle sera créée par l'étape 22 du
workflow au premier run réussi. Les 19 Releases existantes sont intactes.

Notes de release générées : rendu exécuté localement, contient bien une seule
H1 (`# Melodix 4.5.0-test.1 — Test`), la ligne obligatoire
**« Build de test — validation physique nécessaire. »**, le redirect
`comspotifytestsdk://callback`, les vérifications CI réellement exécutées, la
taille et le SHA-256. L'audio en arrière-plan, le Bluetooth, l'écran verrouillé
et la lecture réelle y sont explicitement déclarés **non validés**.

## Validation

Tout ce qui suit a été exécuté localement sur le commit poussé :

| Vérification                                   | Résultat                                                                                              |
| ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `npx tsc --noEmit`                             | exit 0                                                                                                |
| `npx jest --runInBand`                         | **988 passent**, 15 ignorés, 1003 au total, 86 suites                                                 |
| `npm run lint` (ESLint)                        | exit 0                                                                                                |
| `npm run prettier:check`                       | tous conformes                                                                                        |
| `git diff --check`                             | exit 0                                                                                                |
| YAML du workflow (`js-yaml`)                   | valide, 23 étapes, `permissions: {contents: write}`, `on: [pull_request, workflow_dispatch, release]` |
| `bash -n` sur les 17 scripts shell du workflow | syntaxe valide pour les 17                                                                            |
| Scan de secrets dans le diff                   | aucun                                                                                                 |
| `expo prebuild`                                | `versionCode 45001`, `versionName "4.5.0-test.1"`, `com.souxch06.melodix`, 4 ABI                      |
| Manifeste généré (avec le redirect de test)    | contient **`comspotifytestsdk` ET `melodix`**                                                         |
| Bundle Metro (`expo export:embed`)             | 1711 modules, contient le littéral `comspotifytestsdk://callback`                                     |
| Résolution de tag                              | correcte dans les 5 cas testés (voir ci-dessous)                                                      |

### Résolution de tag — 5 cas testés en réel contre le dépôt

| Cas                                   | Comportement                         |
| ------------------------------------- | ------------------------------------ |
| Tag libre                             | utilisé directement                  |
| `v4.4.0` (annoté) sur un autre commit | → `v4.4.0-test.2`                    |
| `v4.3.0` (léger) sur un autre commit  | → `v4.3.0-test.2`                    |
| Tag sur le commit construit           | tag réutilisé + `::notice`           |
| Réponse inattendue / 404              | tag libre (pas d'incrément parasite) |

### Bugs trouvés en exécutant vraiment la logique

Deux bugs réels ont été trouvés par l'exécution, pas par lecture :

1. **Tags annotés vs légers.** `git/ref/tags/v4.4.0` renvoie
   `object.type = tag`, `object.sha = 682b354c…` — un objet **tag**, pas un
   commit. Une comparaison naïve aurait comparé un objet tag au commit construit
   et aurait pu écraser une Release étrangère. Corrigé par déréférencement via
   `git/tags/<sha>`. (`v4.3.0` est léger : `type = commit`.)
   Nota : `git ls-remote …^{}` (peel) renvoie **vide** sur ce remote — inutilisable.
2. **`gh api` écrit le corps d'erreur sur stdout.** Sur un 404, `OBJ_TYPE`
   n'était jamais vide : le script concluait que tout tag libre était « déjà
   pris » et incrémentait jusqu'à `-test.21`, en échec. Corrigé par validation
   du type réel : `case "$OBJ_TYPE" in tag | commit) … *) break ;;`.

## Spotify

- Le redirect de test `comspotifytestsdk://callback` reste **injecté par le
  workflow** (`spotify_redirect_uri`, défaut changé à cette valeur). Il n'est
  codé en dur nulle part dans les sources : `app.config.js` le lit depuis
  l'environnement et construit l'intent-filter correspondant.
- Le scheme natif `melodix://callback` reste déclaré et vérifié dans le
  manifeste. Le build ne peut PAS basculer sur `melodiy://callback` pour ce
  test : le workflow vérifie la présence du littéral dans le bundle **et** du
  scheme dans le manifeste, et re-contrôle le redirect effectif avant de
  publier.
- Authorization Code + PKCE, SecureStore, refresh token : **non modifiés**
  (mission 1). Spotify Web reste désactivé. Aucun client secret ajouté.
- ⚠️ Le dépôt n'a **aucune variable Actions** lisible et le jeton ne peut pas
  lire les variables/secrets (HTTP 403). Si `spotify_client_id` n'est pas défini
  dans l'UI GitHub, l'étape de validation laisse le build continuer **sans**
  Client ID — l'OAuth Spotify ne sera alors pas fonctionnel sur le S24, mais
  l'APK s'installera. À vérifier avant le test physique.

## Git

| Élément            | Valeur                                                            |
| ------------------ | ----------------------------------------------------------------- |
| Branche de travail | `arena/01a106dd-melodix`                                          |
| Commit poussé      | `c7c95d8` `ci(android): publish a real, installable test Release` |
| Parent             | `9dd2b4a` (rapport mission 1)                                     |
| `main`             | `fceab85` — **intact**, local == origin, jamais touché            |
| Fichiers modifiés  | 10 (+232 / −34)                                                   |
| Arbre de travail   | propre                                                            |
| `git ls-remote`    | `arena/01a106dd-melodix` → `c7c95d8`, `main` → `fceab85`          |

Fichiers : `.github/workflows/android-apk.yml`, `.gitignore` (ignore `android/`,
généré par prebuild, jamais versionné), `app.config.js`, `package.json`,
`package-lock.json`, `__mocks__/expo-constants.ts`, les deux tests de réglages,
`scripts/verify-android-apk.sh`, `scripts/smoke-test-android-apk.sh`.
Aucune logique applicative modifiée.

---

## Ce qu'il reste à faire — une seule action de votre côté

**Déclencher le workflow**, car mon jeton n'a pas le scope `workflow` (403) :

> Actions → **APK Android** → _Run workflow_ → branche `arena/01a106dd-melodix` →
> `spotify_redirect_uri` = `comspotifytestsdk://callback` →
> `publish_test_apk` = `true` → Run.

Et si ce n'est pas déjà fait, définir la variable `spotify_client_id` dans
Settings → Secrets and variables → Actions → Variables (valeur = votre Client
ID Spotify public, 32 caractères hexadécimaux — **pas** de client secret).

Dès que le run est terminé, je récupère le SHA-256 réel de l'APK (pas celui de
l'archive Actions), sa taille, le run ID et l'URL de la Release, et je complète
ce rapport.

## Checklist de validation physique — Samsung Galaxy S24

À faire **après** installation. Tant que ce n'est pas fait, rien n'est validé.

1. **Installation** : autoriser les sources inconnues, installer
   `Melodix-v4.5.0-test.1.apk`. `adb install -r` doit fonctionner
   (`versionCode 45001` > `44008`).
2. **Intégrité** : comparer le SHA-256 du fichier téléchargé avec celui de la
   Release.
3. **Login Spotify** : le navigateur doit se fermer et revenir dans l'app via
   `comspotifytestsdk://callback`. C'est le test principal de ce build.
4. **Catalogue** : recherche titres / artistes / albums / playlists ; ouvrir un
   album et un artiste ; titres aimés.
5. **Lecture réelle** : un titre Spotify joue vraiment (le son sort).
6. **Cascade** : un titre absent de Spotify bascule sur Audius, puis YouTube.
7. **Arrière-plan** : verrouiller l'écran, la lecture continue ; commandes du
   casque/Bluetooth ; notification MediaSession.
8. **File** : file d'attente, shuffle, repeat, passage au suivant/précédent.
9. **Historique** : une piste n'entre dans l'historique qu'après lecture
   confirmée.
10. **Stabilité** : pas de crash, pas de blocage d'UI, pas de boucle infinie.

**Rien de ce qui concerne la lecture réelle, l'arrière-plan, le Bluetooth,
l'écran verrouillé ou la cascade Audius/YouTube n'est validé à ce stade.**
