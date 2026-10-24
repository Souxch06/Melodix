# Rapport de session — Melodix (2026-10-24)

## 1. Branche / HEAD début et fin

- **Branche de travail** : `arena/7142700d-melodix` (créée depuis `5d38b1fdd9c08df9033f674e57e26b09b7b6f261` de `arena/dbf2d44f-melodix`).
- **HEAD début de segment** : `d979463` (correction du thème edge-to-edge — devenu caduc, voir K4).
- **HEAD fin** : `bdec23f0e058a350d556a4556d58317f26506e0d` — poussé, arbre propre.
- **Chaîne complète du segment** : `d979463` → `2d248aa` (listener d'insets IME) → `b881972` (insets-controller hide) → `59e7e8e` (blur web + instrumentation) → `9123435` (garde écran du runnable + re-masquages différés) → `6967b4b` (dismiss à toute peinture non-recherche) → `972063e` (correction des sauts inversés) → `99f13d9` (helper `maybeDismissImeFor` sur les entrées web) → `3f60192` (diagnostic exception) → **`bdec23f` (masquage en ligne `hideImeNow` — CI verte)**.
- **`origin/main`** : `81ef774fcb2208d4c4e999943411040aa1bfa33f` — **intouché**.
- **PR #7** (`arena/7142700d-melodix`) et **PR #6** (`arena/dbf2d44f-melodix`) : **restent ouvertes** (aucune fusion ni fermeture).

## 2. Statut git et travail préservé

- Arbre propre au dernier commit (`git status` vide), chaque commit validé par `./scripts/verify-and-sync.sh` (296/296 + vérificateur Dalvik CFG).
- Tout le travail antérieur est préservé : `docs/UI-REVIEW.md`, `tests/` (25 fichiers, 296 tests), les correctifs playlists A–E, la chaîne de contrats `fetchMediaItems()`/`window.mediaLib`/`parseLibrary()`/`window.fetchAllLibrary`/`pendingMediaRequests`, les retouches d'assets mobiles.
- Aucun `reset`/`clean`/`rebase`/checkout destructif ; aucune suppression de fichier sans justification.

## 3. Fichiers modifiés (segment)

| Fichier | Rôle |
|---|---|
| `smali/com/melodix/music/NativeImeInsetsListener.smali` | **nouveau** — `OnApplyWindowInsetsListener` : padte la racine du contenu par `WindowInsets.Type.ime().bottom` (SDK≥30) — correctif K4 |
| `smali/com/melodix/music/NativeHideImeRunnable.smali` | **nouveau** — re-masquage différé du clavier |
| `smali/com/melodix/music/MainActivity.smali` | `hideImeNow()` (clearFocus + `hideSoftInputFromWindow` + `WindowInsetsController.hide`, marqueurs par étape) ; `maybeDismissImeFor()` (garde titre/canal) branché sur `applyNativeUiData` et `renderNativeRows` ; bloc IME de `setNativeScreen` (`:native_ime_kept`) + double re-masquage ; installation du listener d'insets ; `nativeCurrentScreen` rendu visible au paquet |
| `smali/com/melodix/music/NativeSearchWatcher.smali` | `dismissKeyboard` réécrit (clearFocus inconditionnel + hide legacy + hide moderne API 30+) ; `postDismiss()` ; `NativeSearchFocusRunnable` limité à l'écran recherche |
| `smali/com/melodix/music/NativeSearchFocusRunnable.smali` | garde `nativeCurrentScreen == "search"` + marqueur |
| `res/values/styles.xml` | attribut thème `windowOptOutEdgeToEdgeEnforcement` **reverté** (absent du framework apktool → `apktool b` cassé ; course CI `40106728739`) |
| `tests/keyboard_input.test.js` | contrats adaptés (listener d'insets, `hideImeNow`, `postDismiss`, garde écran) — jamais supprimés |
| `tests/native_ui.test.js` | fenêtres d'extraction élargies (1600→2200/2600) — assertions intactes |
| `.github/workflows/test-preview-emulator.yml` | helper de tap « insets-aware » (400×400 dp), sous-test linger + diagnostics (IME/fenêtre/marqueurs MDXTRACE) |

## 4. Racines des playlists + correctifs (rappel du périmètre initial)

- **A)** `window.fetchAllLibrary` sans délai borné → `fetchMediaItems()` reçoit un `AbortController` avec timeout **12 s** (`libFetch`).
- **B)** Épuisement des retries laissait l'écran bloqué en chargement → statut terminal **`'error'`** + réouverture du budget ; un chargement se termine toujours par data, erreur, ou attente bornée ; une erreur ne devient jamais une liste vide.
- **C)** `parseLibrary()` ne couvrait pas l'imbrication `item.data.data` ni les formes d'artwork → reconnaissance des deux formes ; objets normalisés `{title,subtitle,section,uri,image}`.
- **D)** `pendingMediaRequests` servait `[]` simulé (interdit) → routage réelle vers `fetchMediaItems`.
- **E)** Les réponses tardives écrasaient l'état courant → garde **`libRunEpoch`** sur succès **et** catch ; invalidation au changement de compte (garde Epoch testée sur émulateur).
- **Preuve** : `tests/playlist_lifecycle.test.js` (15 scénarios) + émulateur « playlist loading + late success/empty/error never leaked onto Paramètres » **PASS**.
- Les contrats demandés (`fetchMediaItems()`, `window.mediaLib`, `parseLibrary()`, `window.fetchAllLibrary`, `pendingMediaRequests`, callbacks MediaBrowser) restent garantis par la suite (24 scénarios dev 274 → désormais partie des 296).

## 5. Preuve que les chargements se terminent

- Timeout borné : `AbortController` 12 s sur chaque `libFetch` (contrat : demande finit par data/erreur/attente bornée).
- Erreur terminale ≠ vide : statut `'error'` explicite, jamais `[]` de substitution.
- Réponses tardives : rejetées par `libRunEpoch` (succès comme erreur), y compris après changement de compte.
- Émulateur : scénarios budget/late success/late empty/late error PASS, sans fuite vers l'écran Paramètres.

## 6. Clavier — causes racines et correctifs

- **K1** : `windowSoftInputMode` manquant → `adjustResize`.
- **K2** : Back fermait l'IME **et** naviguait → consommation IME d'abord (`handleNativeBack`, `:native_back_root`).
- **K3** : l'IME restait ouvert au changement d'écran → bloc dans `setNativeScreen` (`:native_ime_kept`) + re-masquages différés 300/900 ms.
- **K4** (prouvé émulateur) : en targetSdk 35 le edge-to-edge neutralise `adjustResize` → nav sous l'IME → **`NativeImeInsetsListener`** (padte la racine par l'inset IME) — bibliothèque atteignable au tap avec clavier ouvert (confirmé sur capture).
- **K5 — cause racine finale (ce segment, diagnostic par marqueurs MDXTRACE)** : le tap « Bibliothèque » est géré par la **synchronisation web** (`applyNativeUiData` → `applyNativeListText` + titre posé directement), **contournant** `onNativeLibraryClick`/`setNativeScreen` — et l'appel inter-classes `NativeSearchWatcher.dismissKeyboard` ne s'exécutait jamais (marqueur appelant présent, marqueur entrant jamais). **Correctif** : `MainActivity.hideImeNow()` (même classe — `clearFocus` + `hideSoftInputFromWindow` + `WindowInsetsController.hide`, marqueur par étape) appelé par `maybeDismissImeFor` (à l'entrée d'`applyNativeUiData` et à chaque `renderNativeRows` non-recherche : les canaux/titres `search`, `search-results`, `initial-search`, `Rechercher` et la requête courante gardent l'IME, tout le reste le ferme), par `setNativeScreen`, et par `NativeHideImeRunnable`. Le runnable de focus ne rouvre le clavier que sur l'écran recherche.
- **Résultat émulateur (run `40114052235`, SHA `bdec23f0`)** : « **open on tap, typed input kept, Back closes IME first then navigates, no IME over other screens** » — **PASS**.

## 7. UI — corrections et écrans réellement inspectés

- Corrections UI de la session : header home décollé (`data-sf-mobile-viewer-pad`), chips arrondies (60 dp), input recherche stabilisé (`css_hacks.css`), menu d'icônes plein écran, hauteur de cellule 72→84 dp, grille 2 colonnes 176→192 dp.
- **Honnêteté** : le bac de travail n'a ni chaîne Android ni émulateur — **aucun rendu local n'est possible** ; l'état visuel est jugé uniquement sur les **captures CI** (`30_home.png`, `31_library.png`, `20_kb_open.png`, `21_kb_closed_still_search.png`, `24_kb_no_linger.png` — 5 captures dans l'artefact `Melodix-Emulator-Verification-bdec23f0`). Tableau honnêteté statique-vs-captures : `docs/UI-REVIEW.md`. L'UI n'est donc **pas** déclarée « terminée » sans capture — les captures du SHA final font foi.

## 8. Fonctionnalités / limites

- Navigation (Accueil/Rechercher/Bibliothèque, retour arrière, player/queue/sélections), recherche live multilingue, playlists/albums/artistes/podcasts, écran de chargement/erreur/états vides, logout + garde Epoch, lecteur persistant.
- Diagnostic E2E conservé (marqueurs MDXTRACE : `ime-close-paint`, `ime-hide-*`, `ime-focus-runnable`) — temporaire et sans secret.

## 9. Tests

- **296/296** (25 fichiers) verts à chaque SHA, y compris `bdec23f0` : dont **7 contrats clavier**, **15 scénarios playlists**, vérificateur Dalvik CFG (~230 lignes de smali vérifiées), harnais fin de session.
- Commande : `node --test tests/*.test.js` + `./scripts/verify-and-sync.sh`.

## 10. Compilation

- `apktool` build + signature du paquet vérifiés en CI ; vérificateur Dalvik CFG local PASS ; aucune erreur JS/verifier/crash (Phase 1 « 0 crashes/verifier/JS errors »).

## 11. Résultats émulateur (Android 15, API 35, pixel_8)

Run **`40114052235`** sur **`bdec23f0e058a350d556a4556d58317f26506e0d`** — **SUCCÈS COMPLET** :
- 296/296 tests + intégrité du build ;
- Recherche : focus au tap, « daft » saisi, résultats rendus, retour → Accueil ;
- **Clavier : ouverture au tap, saisie conservée, Back ferme l'IME d'abord puis navigue, aucun IME au-dessus d'un autre écran** ;
- Bibliothèque : lignes + chips de filtre rendus, retour → Accueil ;
- Playlists : chargement + réponses tardives (succès/vide/erreur) jamais fuitées vers Paramètres ;
- Logout/garde Epoch (callbacks périmés du compte A bloqués), injection deep-link, JSON malformé, rotation, pid stable ; aucune cible cliquable étiquetée sous 40×40 px ;
- 5 captures jointes (cf. §7).

## 12. Limites Spotify / appareil

- Connexion Spotify réelle, Widevine et ABI ARM64 **non testés** dans le bac (x86_64 en CI) — documentés comme non vérifiés.
- **Aucun contournement Premium** ; le mode `libraryV3` n'est jamais devenu officiel ; aucun faux contenu de production.

## 13. APK et Release GitHub (mandat permanent)

- **Release publiée (prerelease)** : <https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.5-preview> — tag **`v1.2.2-test.5-preview`** (unique ; `v1.2.2-test.4-preview` inchangé, tags retirés 1–3 jamais recréés), cible = commit exact **`3d196519e50a0a1d0ba55ddf307f13ce60e20bfc`**.
- **APK signé** : **`Melodix-Preview-v1.2.2-test5.apk`** (3 371 855 octets) + `Melodix-Preview-v1.2.2-test5.apk.sha256` + `build-manifest-v1.2.2-test.5-preview.json` ; SHA-256 `e331a0b9c6d941653d4bd315228debd240b370504e2e8dbd8915088ac17777d5`, téléchargement vérifié de bout en bout par le workflow (run `40116127085`).
- Pipeline de publication : vérification complète (296/296 + E2E API 35) **avant** build/signature/publication ; notes de version complètes (changelog, contrôles, limites). Blocage technique documenté : le jeton du bac ne peut pas créer d'événements `workflow_dispatch` (HTTP 403) → publication via le marqueur push explicite `[preview-release]` (porte ajoutée au workflow, toutes les protections conservées).

## 14. Confirmation de périmètre

- **Seule la branche autorisée `arena/7142700d-melodix` a été poussée** (autorisation push_dev_only pour déclencher la CI). `main` n'a été ni modifié ni poussé.
- **Aucune PR fusionnée ni fermée** : PR #7 et PR #6 restent ouvertes.
- **Une seule release/tag créés**, sous autorisation explicite du mandat permanent : `v1.2.2-test.5-preview` (prerelease, APK signé présenté comme pré-version de test, jamais comme production). Aucune release existante écrasée, aucun tag réutilisé.
- Aucun secret/jeton/cookie dans les journaux ; aucune fonctionnalité réelle remplacée par une simulation.

---

# Mission P0 (2026-10-24, session 2) — 3 régressions : causes racines réelles

Contexte : malgré `v1.2.2-test.5-preview`, l'application compilée présentait (1) des playlists jamais affichées, (2) des sections bloquées en chargement lié aux playlists, (3) le clavier Android qui s'ouvrait à l'entrée dans « Rechercher ». Consigne : reproduire, établir les causes racines sur les chemins réellement exécutés, corriger l'état réel, prouver sur l'application compilée.

## 15. Traçage des chemins réellement exécutés (avant tout correctif)

Chemin bibliothèque réel (pont présent) : onglet `onNativeLibraryClick` → peint « Chargement des playlists… » → `window.__sfOpenLibrary()` → `window.fetchMediaItems('playlists')` → `checkMediaLib`/`fetchAllLibrary`/`parseLibrary` → `AndBridge.onMediaItemsLoaded('playlists', json)` → `dispatchNativeUi('media:playlists', json)` → `applyNativeUiData` (gate `nativeExpectedId`/`nativeCurrentScreen`) → `renderNativeRows` → `NativeHomeFeed.paint` (admission) → `NativeUiRowFactory.create` (cartes).

Composants morts identifiés (ne pas y fixer) : `__sfMergeLibraryIntoHomeRows`/`__sfHomeRowsWithState` (jamais appelés), `assets/native_home_scrape.js` (jamais injecté), `nativeLibraryJson` (jamais écrit, seulement effacé au logout). Le chemin Accueil vivant est `updateHomeRows` → `supplementHomeRowsWithLibrary` (tolérant aux formes) ; le hook de repeint médiaLib existant est `__sfNotifyMediaLibReady`.

## 16. Causes racines démontrées

**BUG 1 — playlists jamais affichées (détails + bibliothèque).** Le pont livre `{id,name,image}` (sortie de `parseLibrary`/`toIdNameImage`, exigée par le constructeur MediaItem de `AndBridge.onMediaItemsLoaded` qui lit `name/id/image/artists`). Or l'admission de `NativeHomeFeed.paint` ne lisait que `title`/`uri` : chaque ligne du pont était **jetée** avant la fabrique, `:commit` tombait dans `:clear_stale`, et l'écran affichait « Rien à afficher pour le moment ». L'écran Accueil, lui, fonctionnait (`supplementHomeRowsWithLibrary` normalise en `{title,uri,…}`) — ce qui expliquait l'asymétrie des symptômes.

**BUG 2 — chargements éternels.** Trois mécanismes réels :
- (a) `applyNativeUiData :check_media` **jetait silencieusement** toute charge utile `media:<id>` arrivée hors écran ou avec un `nativeExpectedId` différent, et le cache `nativeLibraryJson` n'était **jamais écrit** → chaque ré-entrée affichait « Chargement… » et repartait dans un aller-retour async ; une réponse en retard était perdue ;
- (b) `updateHomeRows` : une fois le budget borné `MAX_HOME_RETRIES` (40) consommé, la ligne « Chargement des playlists… » **gelait pour toujours** (plus aucun retry, aucun état terminal) ;
- (c) `updateLibraryRows` : `if (rows.length > 0)` — zéro ligne sur une collection chargée = **silence** (ni vide ni erreur jamais émis).
- (d) sous-découverte contractuelle : `actionUri` (cible de réessai `spotify:retry:media:<id>`, déjà gérée par `openNativeRow`) n'était **lu nulle part** côté rendu, et `sendNativeUiData` le stripait → l'« action de réessai » ne pouvait pas fonctionner.

**BUG 3 — clavier auto-ouvert.** `onNativeSearchClick` faisait `requestFocus()` + `postDelayed(NativeSearchFocusRunnable, 250 ms)` → `showSoftInput` : entrer dans « Rechercher » levait systématiquement l'IME (au-delà de `windowSoftInputMode=adjustResize`, qui est correct).

## 17. Correctifs (commit `dee091b`)

| Fichier | Correction |
|---|---|
| `smali/…/NativeHomeFeed.smali` | Admission : fallbacks `title←name←label` et `uri←id←href` AVANT le test de vide (même contrat que `NativeUiRowFactory`) — playlists et titres du pont rendus. |
| `smali/…/MainActivity.smali` | `:check_media` : cache systématique des charges utiles catégorie (`nativeLibraryJson` + nouveau champ `nativeLibraryJsonId`) même hors écran ; onglet/chips ne peignent le cache que si l'identifiant correspond ; logout efface les deux. `onNativeSearchClick` : plus de `requestFocus`/runnable ; fermeture IME à l'entrée (garde « déjà sur recherche » pour ne pas casser la saisie). |
| `smali/…/NativeUiRowFactory.smali` | `actionUri` ajouté en dernier recours de la chaîne d'URI (create + createTile) → lignes de statut cliquables, réessai réel. |
| `assets/native_ui_shell.js` | Budget Accueil épuisé → ligne d'erreur terminale (jamais de chargement figé) ; `updateLibraryRows` : après 3 scrapes vides sur collection chargée, état vide terminal avec `actionUri` de réessai ; `sendNativeUiData` conserve `actionUri`/`kind`. |
| `tests/p0_root_causes.test.js` | 11 tests échec-d'abord (rouges sur le code d'origine, verts après) + non-régressions. |
| `tests/native_ui.test.js` | Contrat onglet recherche adapté (l'entrée ne lève plus le clavier). |
| `.github/workflows/test-preview-emulator.yml` | Sous-tests 4/4b : assertion **entrée = IME fermé**, tap explicite sur le champ avant saisie, notice à jour. |

## 18. Tests et vérifications (à ce stade)

- Suite complète : **307/307** (296 non-régression + 11 P0) ; `./scripts/verify-and-sync.sh` **EXIT=0** (tests + vérificateur CFG Dalvik).
- Contrats préservés (jamais supprimés) : `keyboard_input.test.js` (Back IME-first, leave-close, debounce, submit), `NativeSearchFocusRunnable.smali` conservé pour demandes de focus explicites.
- **Reste à produire** : validation E2E sur APK compilé (émulateur API 35) et release unique `v1.2.2-test.6-preview` — cf. sections suivantes (à venir).

## 19. Validation E2E sur APK compilé (émulateur API 35, x86_64)

Run **`40122897488` = SUCCESS** sur le commit **`b66fef5ccce36e94ef17ebb68d2d398478a1c90b`** (build/sign/verify pipeline, tests 307/307 puis boot émulateur API 35, pid stable, 0 crash/erreur vérificateur/JS) :

| Vérification | Résultat |
|---|---|
| Accueil : greeting « Bonsoir, Camille » + sections et cartes | **PASS** |
| Accueil → Détail → Player étendu → Retour → Retour | **PASS** |
| **Bibliothèque : lignes + chips de filtre rendues, Retour → Accueil** | **PASS** (BUG 1 prouvé corrigé sur l'APK compilé) |
| Isolation onglets : chargement tardif succès/vide/erreur jamais fuité sur Paramètres | **PASS** |
| Recherche : champ actif, « daft » saisi, résultats rendus, Retour → Accueil | **PASS** |
| **Clavier : entrée fermée, ouverture au tap explicite sur le champ, texte conservé, Back ferme IME d'abord puis navigue, aucun IME résiduel sur les autres écrans** | **PASS** (BUG 3 prouvé corrigé sur l'APK compilé) |
| Logout / garde Epoch (callbacks périmés bloqués), deep-link injection, JSON malformé, rotation | **PASS** |
| Cibles cliquables : aucune étiquetée sous 40×40 px | **PASS** |
| Crashes / Dalvik verifier / erreurs JS (tous PIDs) | **0** |

Captures de preuve (artifact `Melodix-Emulator-Verification-b66fef5…`, 6 fichiers) : `19_kb_entry_closed.png` (clavier fermé à l'entrée), `20_kb_open.png` (ouvert au tap sur le champ), `21_kb_closed_still_search.xml+png` (Back ferme IME, texte « daft » conservé), `24_kb_no_linger.png`, `30_home.png`, `31_library.png` (bibliothèque rendue).

Échec intermédiaire documenté : run `40122324538` — les taps aux coordonnées fixes (540,400) de l'ancien contrat « clavier ouvert à l'entrée » ne touchaient plus le champ une fois le clavier fermé ; corrigé par des taps pilotés par dump (`b66fef5`).

Bug 2 (terminaison des chargements) : validé par les contrats P0 (budget de retries → erreur terminale, cache des réponses en retard, canal `media:<cat>` jamais silencieux, réessai cliquable) + l'isolation E2E ci-dessus ; la capture `31_library.png` montre la bibliothèque rendue hors état de chargement.

## 20. APK et Release GitHub (mandat permanent) — Mission P0

- **Release publiée (prerelease) et vérifiée par `gh release view`** : <https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.6-preview> — « Melodix Preview v1.2.2 test.6 (461ccf0) », créée 2026-10-24T19:03:32Z.
- **Tag** : `v1.2.2-test.6-preview` (unique ; `v1.2.2-test.4-preview` et `v1.2.2-test.5-preview` inchangés ; tags retirés `v1.2.2-test.1..3-preview` jamais recréés).
- **Commit source exact** : **`461ccf007050bbc699015b0626ea0d70778a934f`** (contient les correctifs `dee091b`, le fix E2E `b66fef5`, les rapports `c6c8c0e` + cette mise à jour).
- **APK signé** : **`Melodix-Preview-v1.2.2-test6.apk`** (3 371 855 octets) + `Melodix-Preview-v1.2.2-test6.apk.sha256` (99 o) + `build-manifest-v1.2.2-test.6-preview.json` (731 o) ; **SHA-256 `37cd67380d87ce25621c3db0da1d05649eb7f2b31d69777f2ffeb7ad232bed9b`** ; `versionName = 1.2.2-461ccf0`, `versionCode = 1020556`, package `com.melodix.music.preview`.
- **Workflow** : run **`40123559910` SUCCESS** (suite 307/307 + vérificateur CFG Dalvik 3 804 fichiers + E2E API 35 + zipalign/apksigner + publication + vérification bout-en-bout des assets), déclenché par le marqueur push `[preview-release] v1.2.2-test.6-preview` (la voie `workflow_dispatch` reste bloquée en HTTP 403 depuis le bac). Notes enrichies avec les causes racines et les preuves E2E.

## 21. Confirmation de périmètre — Mission P0

- **Seule la branche autorisée `arena/7142700d-melodix` a été poussée** (`dee091b`, `c6c8c0e`, `b66fef5`, `461ccf0`). `main` n'a été ni modifié ni poussé.
- **Aucune PR fusionnée ni fermée** (PR #6 et #7 inchangées). Aucun fichier supprimé ; les anciens contrats ont été adaptés, jamais supprimés (`keyboard_input.test.js`, `NativeSearchFocusRunnable.smali`, contrats `native_ui.test.js`, sous-tests E2E).
- **Une seule release/tag créée**, sous autorisation explicite : `v1.2.2-test.6-preview` (prerelease). Aucune release existante écrasée, aucun tag réutilisé, aucun build échoué publié (le run `40122324538` en échec E2E n'a rien publié).
- Aucun secret/jeton/cookie dans les journaux ; aucune fonctionnalité réelle remplacée par une simulation ; diagnostics temporaires inchangés.

## 22. Mission P0-DIAG — écran « Diagnostic Melodix » embarqué (Phase A)

Le diagnostic demandé est maintenant un VRAI écran de l'APK, atteignable sans
ADB, sans Android Studio ni Termux : **Paramètres → Diagnostic Melodix →
Ouvrir**. Toute l'instrumentation mesure la chaîne réelle de cette version.

### Ce que l'écran fait (données réelles uniquement)

- **Progression par étapes réelles** : statut terminal (ok / indisponible /
  erreur / reçu-trop-tard), heure de début, durée réelle de l'étape, compteurs
  récupérés/rendus/rejetés, cause de l'échec en français. Aucune étape ne reste
  en « Chargement… » : chaque test conclut sur un état final.
- **12 points de traçage minimum** couverts : déclenchement de la récupération,
  états session/auth, sources réellement disponibles (bridge / fetchMediaItems /
  shell / DOM), HTTP + durée + nombre d'éléments, état avant/après normalisation,
  éléments rejetés avec motif, forme des objets (champs présents + empreinte
  irréversible), identifiants de corrélation (fingerprints fnv1a-8), canal
  `media:<cat>`, admission NativeHomeFeed, rendu final, comptage des réponses
  tardives/annulées/epoch/chemin de cache.
- **Compteurs natifs par étape** (`DiagCounters`) : `paintIn/paintAccepted/
  paintEmpty` (NativeHomeFeed.paint), `dispatchIn/dispatchDropped`
  (AndBridge.dispatchNativeUi — epoch/payload/expired), `mediaRendered/
  mediaDropped` (gate `media:<cat>` de MainActivity). Exportés en JSON borné +
  journal d'événements borné (200 lignes / 6000 caractères).
- **Actions réelles** : Diagnostic complet, tests par catégorie (playlists,
  likés, albums, artistes, podcasts), réessai sûr, export JSON, copie du
  résumé. L'export porte `includeNames:false` : aucun nom de playlist, aucun
  token, cookie, en-tête ou identifiant personnel — empreintes irréversibles
  uniquement.
- **Jamais de contenu simulé** : si une catégorie ne peut pas être récupérée,
  l'écran dit exactement pourquoi (accès refusé / erreur réseau / réponse tardive
  / jamais transmise au rendu / rejetée par le filtre d'affichage / réellement
  vide) et ne l'affiche jamais comme « liste vide ».

### Détection des 11 classes de panne (tests `tests/diag_screen.test.js`)

`window.__sfDiagClassify(category, scenario)` classe chaque résultat en :
`ok | empty | fetch | different | normalize | render | paint | late | account |
unavailable | lost`. Les 11 scénarios de détection (liste non vide, réellement
vide, réponse refusée, erreur réseau, format inattendu, erreur de normalisation,
rejet au rendu, réponse tardive, changement de compte, catégorie indisponible,
section sans callback) sont testés avec comptage « avant → après » qui localise
OÙ les éléments disparaissent (fetch-0 vs display-0 distincts).

### Engagements Phase A

Aucun correctif de fond n'est appliqué sur des hypothèses : l'instrumentation
capturera d'abord le comportement réel de l'appareil/compte. La Phase B
(correctif démontré + test de non-régression) attend le rapport réel exporté
depuis le téléphone. Le diagnostic n'active rien de dangereux : pas de
contournement d'authentification, pas de requêtes supplémentaires hors son
propre cycle, pas de contenu factice.

## 23. Correctif P0-DIAG — écran diagnostic natif d'entrée (retour utilisateur)

**Symptôme réel (appareil utilisateur)** : l'écran restait bloqué sur
« Démarrage du moteur de diagnostic… » et rien n'était copiable — le moteur JS
ne se chargeait pas et l'interface ne le signalait jamais.

**Correctif (conforme à la demande « directement un message avec la possibilité
de le copier »)** :

- **Message natif immédiat** : `openNativeDiag()` ne dépend PLUS d'aucun
  JavaScript. `paintDiagNative()` peint directement un vrai rapport
  (`buildDiagReport()` : écran courant, id attendu, cache bibliothèque réel,
  compteurs `DiagCounters`, journal borné) avec une action **« Copier le
  message »**. Tout est terminal dès l'ouverture.
- **Copie 100 % native** : `spotify:diag:copy` / `spotify:diag:summary` /
  `spotify:diag:export` passent par `AndBridge.copyToClipboardStatic`
  (ClipboardManager) — aucun moteur, aucun WebView. Retour honnête
  « Message copié » ou « Copie impossible ».
- **Moteur devenu optionnel et borné** : les tests (`run`/`playlists`/`cat:*`/
  `retry`) peignent d'abord l'écran natif avec « réponse garantie sous 35 s »,
  puis injectent le moteur. Deux garde-fous : lecture d'asset par contexte
  explicite (`readAssetUtf8(Context,String)`, sans le risque de NPE de
  `m9.c()`) → erreur terminal si illisible ; et `DiagWatchdog` (35 s,
  Handler/Runnable natif) qui repeint un message terminal si le moteur ne
  renvoie aucun rapport (le canal `diag:` le désarme dès qu'un rapport arrive).
- **E2E réelle** : le workflow émulateur ouvre maintenant Paramètres →
  Diagnostic Melodix, vérifie « Message du diagnostic » + « Copier le message »
  + absence du loader, tape Copier et vérifie le retour « Message copi… ».
- **Intégrité build** : `diag_engine.js` ajouté à la liste des assets vérifiés
  dans les APK (preview + refresh).
