# Audit complet du projet Melodix — 2026-11-04

**Branche auditée :** `arena/6b935c3e-melodix` (HEAD `f045da3`), à jour avec `origin`.
**Périmètre :** dépôt entier à la racine `/home/user/Melodix` — code Apktool décompilé,
assets JS, workflows CI, tests, documentation, état Git/releases. Aucun appareil
physique n'a été testé pendant cet audit ; les seules exécutions sont la suite de
tests Node locale et la lecture de l'état CI via l'API GitHub.

Cet audit reprend la convention de preuve du projet :

| Niveau | Signification |
| --- | --- |
| **Code** | relu dans le dépôt |
| **Test** | vérifié par la suite Node locale |
| **CI** | vérifié via l'API GitHub (runs, annotations, releases) |
| **Exécution** | lancé sur émulateur/appareil (rare ; distingué explicitement) |

---

## 1. Résumé exécutif

Melodix est une application Android **construite à partir d'un APK décompilé**
(Apktool/smali), pas un projet Gradle source. Elle encapsule le lecteur Web
Spotify dans une WebView avec une couche native de secours (shell, Home,
bibliothèque) et un pont JS↔natif (`AndBridge`).

**Points forts vérifiés :**
- Suite de tests **544/544 verte** (41 fichiers de test), avec des garde-fous
  explicites anti-capture de credentials et anti-proxy Spotify.
- Pont JS **restreint à l'origine `open.spotify.com:443`**, garde SSRF sur
  `loadWebPlayerUrl`, whitelist d'assets stricte (`spotify_bridge.js` seul).
- **Vérification du certificat de signature au démarrage** ; self-updater avec
  **SHA-256 systématique** ; aucun matériel de signature dans le dépôt.
- Assets JS générés **synchrones** avec leurs sources (hash vérifié).
- Le replay du VerifyError historique fonctionne et reproduit le P0 ; le source
  courant porte déjà le correctif.

**Problèmes principaux (détaillés en §8–9) :**
- **README très obsolète** : annonce la release `test.3` alors que la dernière
  publiée est `test.95`.
- **Le job CI principal ne se déclenche pas sur la branche courante** (push
  filtré sur `arena/7142700d-melodix`).
- **P0 « interface absente » téléphone/tablette non résolu** et non vérifié sur
  appareil réel ; **401 `libraryV3`** rapporté sur téléphone non reproduit ici.
- Durcissement manifeste perfectible : `allowBackup=true`,
  `usesCleartextTraffic=true`, plusieurs composants exportés sans permission,
  `setMixedContentMode=COMPATIBILITY_MODE`.
- Deux PR ouvertes (#6, #7) et plusieurs branches `arena/*` divergentes.

---

## 2. État Git, CI et releases

### Git (CI)
- Branche courante `arena/6b935c3e-melodix` = `f045da3`, propre, poussée.
- Branches distantes : `main` (`81ef774`), `arena/7142700d-melodix` (`44902d9`,
  PR #7), `arena/dbf2d44f-melodix` (`5d38b1f`, PR #6), plus la branche courante.
- **PR ouvertes :** #7 « remédiation complète pont natif/JS, navigation Android
  15, recherche, déconnexion et SSRF » (tête `arena/7142700d-melodix`) et #6
  « Fix startup sign-in and refresh the mobile UI » (tête `arena/dbf2d44f-melodix`).
- La branche courante est une reprise de `44902d9` ; elle n'est la tête d'aucune
  PR. `main` n'est pas modifiée.

### Releases (CI)
- Deux pré-releases publiées : **`v1.2.2-test.95-preview`** (2026-11-01) et
  `v1.2.2-test.91-preview` (2026-10-31). Tags `test.86`→`test.95` présents.
- **Écart documentation :** le README et le rapport `RAPPORT_A_H.md` décrivent
  des états antérieurs (`test.3` pour le README, `test.91` pour le rapport) ;
  aucun des deux ne reflète `test.95`.

### CI (CI)
- Dernier run de replay `41796437131` : **VerifyError historique reproduit**
  (échec volontaire de l'étape « P0 finding »), voir
  [`melodix-p0-verifyerror-replay-2026-11-04.md`](melodix-p0-verifyerror-replay-2026-11-04.md).
- Les runs « Capture preview launch trace » sur la branche courante sont
  **skipped** : le job exige le marqueur `[launch-trace]` dans le message de
  commit.
- **Filtre de branche :** `test-preview-emulator.yml` ne se déclenche en push
  que sur `arena/7142700d-melodix` ; `preview-apk.yml` que sur
  `arena/dbf2d44f-melodix`. **Les push sur la branche courante ne lancent donc
  ni le smoke test ni le build APK automatiquement** (il faut `workflow_dispatch`).

---

## 3. Structure et taille

| Répertoire | Taille | Rôle |
| --- | --- | --- |
| `smali/` | 42 Mo | 3 810 fichiers smali (code décompilé), dont **52** sous `com/melodix/music` |
| `android/` | 14 Mo | extraction brute historique de l'APK + branding + framework Apktool |
| `source/` | 11 Mo | archive originale `SpotiDuck-v1.2.2` + extraction (inchangées) |
| `res/` | 3,6 Mo | ressources Android |
| `images/` | 1,5 Mo | maquettes/images |
| `tests/` | 1,4 Mo | 41 fichiers de test Node |
| `docs/` | 2,0 Mo | rapports et notes d'audit |
| `assets/` | 509 Ko | 12 JS (3 générés depuis `scripts/*.source.js`) |
| `scripts/` | 476 Ko | sources JS, build d'assets, sanitizer/aggregator Python |

- `MainActivity.smali` : **10 676 lignes** — fichier monolithique, cœur de la
  logique native (navigation, shell, settings, visibilité).
- `minSdkVersion=24`, `targetSdkVersion=35`, `platformBuildVersionCode=36`.
- Package de base `com.melodix.music` ; la Preview CI réécrit
  `com.melodix.music.preview` (données séparées, installation côte à côte).

**Maintenabilité :** travailler sur du smali décompilé (3 810 fichiers, pas de
sources Kotlin/Java d'origine) est intrinsèquement fragile ; chaque correctif
doit être accompagné d'un test de régression statique, ce que le projet fait
systématiquement. C'est une dette structurelle, pas un défaut ponctuel.

---

## 4. Tests (Test)

- **`npm test` : 544/544 passent**, 0 échec, 0 skip (41 fichiers).
- Les deux échecs « préexistants » mentionnés dans le rapport historique
  (`auth and WebView code do not capture credentials…`, `JavascriptInterface
  annotations are limited…`) ne sont plus en échec : le premier existe toujours
  dans `tests/runtime_state.test.js` et passe ; le second n'apparaît plus sous
  cette forme.
- Couverture notable : pont natif/JS, Home vide, navigation, recherche,
  bibliothèque, lecteur, accessibilité (contrastes + cibles 48dp), intégrité
  CSS, self-updater, diagnostics VerifyError, workflow CI, sanity smali.
- Les tests sont **statiques/synthétiques** (fixtures, jsdom) : ils ne
  remplacent pas une exécution sur appareil. Le projet le documente honnêtement.

---

## 5. Sécurité

### 5.1 Manifeste (Code)
Permissions déclarées : `INTERNET`, `ACCESS_NETWORK_STATE`, `BLUETOOTH`,
`BLUETOOTH_CONNECT`, `FOREGROUND_SERVICE(_MEDIA_PLAYBACK)`, `POST_NOTIFICATIONS`,
`RECEIVE_BOOT_COMPLETED`, `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`,
`REQUEST_INSTALL_PACKAGES`, `WAKE_LOCK`, permissions publicitaires Google
(`AD_ID`, `ACCESS_ADSERVICES_*`), permission signature interne.

Composants exportés (avec intent-filters) :

| Composant | exported | permission |
| --- | --- | --- |
| `MainActivity` | true | aucune (launcher, normal) |
| `LinkHandler` | true | aucune |
| `WebService` | true | aucune |
| `MediaButtonReceiver` (androidx) | true | aucune |
| `WebService$MediaActionReceiver` | true | aucune |
| `HomeWidget` | true | aucune (widget, normal) |
| `ProfileInstallReceiver` (androidx) | true | `android.permission.DUMP` |

Réglages : `allowBackup=true`, `usesCleartextTraffic=true`,
`networkSecurityConfig` absent, `debuggable` absent (non débogable en release).

### 5.2 WebView (Code)
Dans la factory `m9` :
- `setJavaScriptEnabled(true)` (requis), DOM storage + database activés.
- **`setAllowFileAccess(false)`**, **`setAllowContentAccess(false)`** — bon point.
- `setMixedContentMode(1)` = `MIXED_CONTENT_COMPATIBILITY_MODE` (autorise une
  partie du contenu mixte ; moins strict que `NEVER_ALLOW`).
- `setUseWideViewPort(false)`, `setLoadWithOverviewMode(false)` (rendu mobile).

### 5.3 Pont JS `AndBridge` (Code + Test)
- **34 méthodes `@JavascriptInterface`** exposées (UI native, diagnostics,
  lecteur, logout, assets, navigation, signature).
- **Attache/détache selon l'origine** (`c91`) : le pont n'est attaché que pour
  `open.spotify.com` sur port 443/défaut ; détaché sinon.
- **`loadWebPlayerUrl`** : garde SSRF complète — schéma `https` obligatoire,
  hôte `open.spotify.com` exact, `userInfo` interdit, port 443/défaut uniquement.
- **`readBundledAsset` / `readBundledAssetRange` / `injectBundledAsset`** :
  n'acceptent que le nom exact `spotify_bridge.js` (pas de traversée de chemin).
- **Anti-capture de credentials** (test `runtime_state`) : pas de
  `spot_auth_token`/`Client-Token`/`Authorization`, pas de
  `CookieManager.get/set/removeCookies` dans le pont/client, pas de proxy
  `fetch` natif ; `libraryV3` utilise `credentials:'include'` (le navigateur
  fournit sa propre session). `classic_login.js` ne touche ni cookies, ni
  storage, ni `fetch`, ni soumission de formulaire.

### 5.4 Signature et mise à jour (Code + Test)
- **Vérification du certificat au démarrage** : `expected_signature_sha256`
  comparé au digest SHA-256 du certificat signataire ; l'app se ferme si
  mismatch (message « Signature preview refusée »).
- **SelfUpdater** : endpoint `https://api.github.com/repos/Souxch06/Melodix/releases`,
  téléchargement `.apk` + `.apk.sha256`, **vérification SHA-256 systématique**
  (y compris cache corrompu), garde `canRequestPackageInstalls()`, mise à jour
  Android 12+ sous même signature/versionCode.
- **Aucun matériel de signature suivi** (`.jks`/`.keystore`/`.p12` exclus par
  `.gitignore`) ; scan sans clé privée ni mot de passe en dur dans
  scripts/workflows. Les secrets passent par `secrets.*` / `storepass:env`.

### 5.5 Diagnostics et vie privée (Code + Test)
- Sanitizer VerifyError **fail-closed** : n'écrit que des champs normalisés
  autorisés ; supprime chemins privés, URI, cookies, jetons, e-mails ; repli
  détection-seule si le parsing échoue.
- Les rapports CI sont assainis (aucun logcat brut conservé) ; rétention 1 jour.

---

## 6. Problèmes connus / P0 (CI + docs, non reproduits sur appareil ici)

1. **P0 « interface absente » téléphone/tablette** — l'utilisateur rapporte que
   Spotify Web reprend le centre sur téléphone mais pas sur tablette. Non
   reproduit sur émulateur ; la comparaison même APK / deux profils / cinq
   échéances reste à faire. Voir `melodix-phone-tablet-display-ownership-2026-11-02.md`.
2. **401 `libraryV3` sur téléphone réel** — preuve API de session non établie ;
   instrumentation ajoutée (identifiant d'essai, compteur fetch, catégories
   d'erreur) mais pas de nouveau relevé. Voir `melodix-p0-phone-session-401-2026-11-02.md`.
3. **VerifyError Android 16** — historique reproduit par le replay
   (`markNativeSettingsPayloadApplied`, registre `v3` `String`≠`StringBuilder`) ;
   **correctif déjà présent dans le source courant**. Sujet clos côté code,
   reproductible à la demande.
4. **Blocage CI « foreground »** — sur le job principal, la dialogue
   `GrantPermissionsActivity` reste au premier plan et fait échouer la porte
   `main_activity_resumed`. Distinct du replay ; non traité à ce jour.

---

## 7. Documentation

- **README obsolète** : annonce `test.3` comme dernière release (réel : `test.95`),
  décrit un `versionCode` `1020231` et des instructions de reconstruction V1
  qui ne correspondent plus au flux CI actuel.
- `RAPPORT_A_H.md` : note « état courant » du 31/10 (`test.91`), complétée le
  04/11 pour le replay ; les sections historiques décrivent `test.86`.
- `docs/audits/` : 15 notes, honnêtes sur les niveaux de preuve (séparent
  systématiquement code/test/compilation/exécution). Bonne pratique à conserver.
- Le guide `docs/preview-apk.md` existe ; la cohérence avec le flux CI actuel
  (test.95, `version_code_base`) mérite une relecture.

---

## 8. Risques et recommandations (priorisées)

### P0 — fonctionnel / livraison
1. **Résoudre le P0 « interface absente »** : mettre en place la comparaison
   même APK sur profils téléphone + tablette (cinq échéances), seule preuve
   acceptée par le projet. Ne pas déclarer corrigé avant.
2. **Débloquer la porte CI « foreground »** : gérer la dialogue de permission
   (tap « Autoriser » observé ou repli) pour que `MainActivity` soit resumed ;
   sinon le smoke test principal reste rouge même sans VerifyError.
3. **Réconcilier les branches/PR** : #6 et #7 divergent ; la branche courante
   n'est la tête d'aucune PR. Décider quelle branche porte la prochaine release.

### P1 — hygiène / fiabilité
4. **Mettre à jour le README** (dernière release `test.95`, `versionCode` réel,
   flux CI) et aligner `RAPPORT_A_H.md`/`preview-apk.md`.
5. **Élargir le déclencheur CI** : le job principal ne tourne pas sur la branche
   courante ; ajouter la branche active au filtre push ou documenter le recours
   systématique à `workflow_dispatch`.
6. **Traiter le 401 `libraryV3`** : exploiter la nouvelle instrumentation au
   prochain relevé téléphone pour départager session absente/expirée vs refus API.

### P2 — durcissement (à évaluer sans casser le lecteur Spotify)
7. **`usesCleartextTraffic=true`** : passer à `false` ou ajouter un
   `networkSecurityConfig` restreignant le clair aux domaines qui l'exigent.
8. **`allowBackup=true`** : évaluer `false` (ou backup rules) pour éviter
   l'exfiltration de données de session via sauvegarde.
9. **Composants exportés sans permission** (`WebService`, `LinkHandler`,
   `MediaActionReceiver`) : restreindre `exported`/ajouter une permission si le
   flux le permet, sans casser la réception média.
10. **`setMixedContentMode`** : viser `NEVER_ALLOW` si le lecteur Spotify ne
    dépend pas de contenu mixte (à vérifier avant).

### P3 — dette structurelle
11. **Monolithe `MainActivity.smali` (10 676 lignes)** : continuer à extraire des
    classes ciblées (déjà fait : `NativeHomeFallback`, `SpotifyNavigationPolicy`,
    etc.) pour réduire le risque de régression smali.
12. **Base décompilée** : à long terme, la stabilité viendrait d'un vrai projet
    source ; à défaut, maintenir la discipline « tout correctif = test de
    régression statique ».

---

## 9. Limites de cet audit

- Aucune exécution sur téléphone/tablette réel ; les P0 d'affichage et le 401
  sont des **observations utilisateur rapportées**, pas reproduites ici.
- L'état CI est lu via l'API (runs/annotations/releases) ; les artefacts binaires
  (APK, rapports) ne sont pas rapatriables depuis cet environnement (stockage
  Azure hors politique réseau).
- L'audit de sécurité est **statique** (lecture du smali/manifeste/assets +
  tests) ; il ne remplace pas un test d'intrusion ni une revue dynamique.
- Les chiffres de tests (544) sont ceux de la suite Node à la date de l'audit.
