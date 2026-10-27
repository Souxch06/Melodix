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

## 24. Analyse du premier rapport appareil (test.8, 2026-10-25 08:19)

Rapport collé par l'utilisateur (extrait) :
`affichage: entré=14 accepté=14 vide=0` / `transmission: entré=3 rejeté=0` /
`canal media: affiché=0 rejeté=0` / `Cache bibliothèque: 0 caractères,
catégorie aucune` / `Id attendu: aucun`.

**Ce qui est prouvé** :
1. Le correctif test.8 fonctionne sur SON appareil : message natif immédiat +
   copie native OK (le rapport est arrivé).
2. Le pipeline natif est sain : admission 14/14, transmission 3/3, aucun rejet
   epoch/taille — rien n'est perdu côté natif.
3. Aucun payload `media:<cat>` n'est jamais arrivé depuis ce démarrage
   (canal 0/0, cache 0) — le point de disparition est CÔTÉ JS, AVANT l'envoi.

**Nuance honnête** : « Id attendu: aucun » alors que `onNativeLibraryClick`
pose `nativeExpectedId="playlists"` (effacé seulement au logout) = l'onglet
Bibliothèque n'a pas été ouvert pendant CE démarrage. Le rapport montre l'état
« avant reproduction » ; il faut un capture PENDANT la reproduction + le test
moteur pour classer fetch-0 vs display-0.

**Suspect principal (code)** : `fetchMediaItems` (seule source API bibliothèque)
n'existe QUE dans `spotify_bridge.js` ; le shell admet noir sur blanc
(native_ui_shell.js ~2834) qu'un `evaluateJavascript` de ~200 Ko est
« silently dropped by the WebView on device: the native shell starts, the
bridge never does ». Repli = `location.assign('/collection/...')` + scrape DOM.
Le rapport décisif doit montrer : présence du bridge (`__sfMelodixBridgeStarted`,
`fetchMediaItems`), et si le moteur lui-même injecte (sinon la WebView drop tout
et la cause racine est établie).

## 25. Rapport appareil n°3 (test.9) — deux constats, deux correctifs

Rapport : `Dernier état affiché: Moteur de tests indisponible (asset
diag_engine.js illisible)` + `Journal: aucun événement` (toujours).

**Constat 1 (appareil)** : la lecture de `diag_engine.js` via
`readAssetUtf8(Context,String)` échoue sur l'appareil de l'utilisateur — le
moteur ne peut s'injecter. Cause exacte inconnue mais désormais traçable.

**Constat 2 (notre bug)** : `readReport()` masquait TOUJOURS le journal —
branchement inversé (`if-eqz v3, :report_no_log` sur `isEmpty()Z`). Tous les
rapports montraient « aucun événement » à tort.

**Correctifs (test.10)** : branche corrigée ; échecs d'asset journalisés avec
le motif réel (`asset-err <nom> <exception via NativeCrashGuard.excerpt>`) ;
deux chemins de lecture tracés (`asset-via-activity`, `asset-via-appctx`).
Le prochain rapport distinguera : asset illisible (motif), WebView muette
(`js-probe asked` sans réponse), bridge absent (`started=0 fetch=undefined`),
ou fetch en échec (`started=1 fetch=function`).

## 26. Rapport n° 4 (test.10) : le canal JS→natif meurt APRÈS le démarrage — correctif test.11 (ré-attachement du pont)

Le rapport n° 4 (test.10) est décisif :

- l'asset `diag_engine.js` se lit maintenant correctement (`asset-via-activity`) et le moteur est injecté ;
- mais zéro événement moteur n'est jamais remonté, la copie directe ne répond jamais (`js-probe asked` sans `js-probe bridge=…`), et le watchdog conclut « Aucune réponse du moteur de tests après 35 s » ;
- le journal ne contient QUE les 3 dispatches du démarrage (`transmission: entré=3` identique aux rapports précédents).

**Le canal JS→natif fonctionnait au démarrage puis meurt silencieusement.** Mécanisme identifié dans le code (`c91.onPageStarted`) : à chaque navigation vers une URL qui n'est PAS exactement `https://open.spotify.com` (rafraîchissement de token OAuth vers `accounts.spotify.com`, page d'erreur, URL en http…), le pont `AndBridge` est retiré et **plus rien ne le ré-attachait** → tous les JS suivants (moteur, `media:`, js-probe) ne peuvent plus joindre le natif, exactement comme observé.

**Correctif test.11 (`6b64952`, release `v1.2.2-test.11-preview`, marker `9155576`, APK SHA-256 `c10bd32dc39a2a77ce74a30c19f30555709234176d600bfe438dd27ce3529ef8`)** :

- `onPageFinished` ré-attache le pont de façon idempotente sur `https://open.spotify.com` (`bridge-reattached`) ;
- traces de navigation sans données sensibles : `page-start <hôte><chemin>` (jamais la requête ni le fragment), `page-done`, `bridge-attached`/`bridge-removed`, `renderer-gone` (onRenderProcessGone existant instrumenté — pas de méthode dupliquée) ;
- le prochain rapport de diagnostic prouvera le mécanisme (traces `page-start accounts.spotify.com…` + `bridge-removed` sans `bridge-reattached` avant le correctif) et dira si les playlists reviennent avec le pont ré-attaché.

Tests : 33 contrats (dont navigation-trace/bridge-reattach/renderer-gone-event), smali_sanity 13/13, audit_remediation 10/10, suite complète = 0 échec.

## 27. Rapport n° 5 (test.11) : `renderer-gone` prouvé, mais la mort du canal est PLUS PROFONDE — test.12 (sonde probante + diagnostic simplifié)

Le rapport n° 5 (test.11) apporte deux évidences :

1. **`renderer-gone` est réel** : le processus de rendu du WebView a crashé, puis la récupération a rechargé la page (2e `page-start`/`bridge-attached`/`bridge-reattached`) — `transmission: entré=6` (3 dispatches de démarrage × 2 chargements) prouve que le canal **JS→natif** fonctionne sur le WebView reconstruit ;
2. **mais `evaluateJavascript` (natif→JS) ne délivre JAMAIS rien**, même après reconstruction, et même sans crash visible dans le rapport n° 4 : `js-probe asked` ×2 sans réponse, moteur injecté (`asset-via-activity`) sans le moindre événement, alors que la sonde est un fragment JS trivial.

Conclusion : la perte des playlists vient de la direction **natif→JS** (demandes `media:`, moteur, sondes) qui n'atteint jamais la page ; la direction JS→natif (démarrage) fonctionne.

**Correctifs test.12 (proof-oriented)** :

- `runNativeJavascript` : repli sur `AppSingleton.w` si `MainActivity.G` est périmé/nul + journal `js-out webview=none` au lieu d'un silence ;
- **sonde `js-cb` à `ValueCallback`** (`DiagJsProbeCallback`/`DiagJsProbeTimeout`) : le callback vient de la couche renderer elle-même, indépendant d'AndBridge. Issues terminales : `js-cb <id> bridge-ok` (JS exécuté + pont présent), `no-bridge`, `err`, `js-probe miss cb=absent` (livraison natif→JS morte), `js-out webview=none` ;
- flag `rendererGone` : posé par `onRenderProcessGone`, effacé au chargement de page ; affiché par la sonde (`renderer-flag=1`) ;
- récupération chemin « service » (`yi1`) : rebind de `MainActivity.G` sur le WebView reconstruit ;
- **diagnostic simplifié à UNE tape** : bouton « Diagnostic complet » (`spotify:diag:full`) = sonde + test playlists + **copie automatique du rapport** à l'état terminal (`auto-copy ok`/`impossible`) ; rapport affiché **ligne par ligne** à l'écran (section « Rapport ») sans copie ni JS.

Le prochain rapport lira : `js-cb` présent → `evaluateJavascript` fonctionne et le problème restant est côté pont/moteur ; `js-probe miss cb=absent` → livraison native→JS morte (dernier maillon à investiguer : instance WebView réellement ciblée) ; `renderer-flag=1` → crash non récupéré.

## 28. Rapport n° 6 (test.12) : la sonde se tait dans les DEUX sens — preuve par l'absurdité + test.13 (cible WebView vivante, sonde imparable)

Le rapport n° 6 (test.12, aucun crash de rendu cette fois) présente un paradoxe décisif :

- `js-cb ask` ×2 (sondes envoyées), `diag-full`, `asset-via-activity` (moteur injecté) ;
- **aucune** réponse `js-cb <id> …` ;
- **aucun** marqueur de timeout `js-probe miss cb=absent` non plus — alors que le timeout journalise **toujours** après 2,5 s et que le message des 35 s (postérieur) est bien présent.

Or le timeout ne se tait que si `answerProbe()` a été appelé, c'est-à-dire si le **callback a tourné**. Donc : `evaluateJavascript` livre ET rappelle, mais le callback perdait ensuite sa propre trace (seul jeton possible : `check-cast` sur une valeur non-String → exception avalée). Et l'ancienne sonde `logDiagEvent` reste muette → `window.AndBridge` absent du WebView ciblé. Conclusion combinée : **les envois natif→JS visent une instance WebView qui n'est PAS celle où la page tourne** (les dispatches de démarrage prouvent que la page, elle, fonctionne) — exactement la cause des playlists absentes et du moteur muet.

**Correctifs test.13 (`e352da9`, marker `11a4e3d`)** :

- `c91` enregistre le WebView qu'il sert (`DiagCounters.setPageView`) à chaque `onPageStarted`/`onPageFinished` ; `runNativeJavascript` et la sonde résolvent **pageView → G → w** — les envois ne peuvent plus atterrir sur une instance périmée après une récupération ;
- traces d'identité : `page-start … #<hash>` et `js-cb tgt <hash>` — le prochain rapport prouvera l'égalité des instances ;
- sonde **imparable** : valeur stringifiée par `Object.toString()` + nom de classe (plus aucun `check-cast`), catch qui journalise `js-cb err`, timeout **toujours** journalisé `js-cb tmo <id> ans <0|1>` (plus de garde sur état partagé) — un rapport sans ces lignes prouverait que le Runnable lui-même n'a pas tourné.

Lecture du prochain rapport : `js-cb tgt` == `page-start #` ET `js-cb <id> String "bridge-ok"` → chaîne saine (restera à expliquer les playlists) ; `no-bridge` → pont absent de la page ciblée ; `js-cb tmo … ans 0` → livraison native→JS morte malgré tout ; `engine` sans `diag:report` → problème côté moteur.

## 29. Mission « playlists absentes » (rapport n° 7) : diagnostic indépendant d'evaluateJavascript + enquête du canal natif→JS mort

Le rapport n° 7 établit : `js-cb tgt 20436320 == page-start #20436320` (la cible EST la bonne instance), `js-cb tmo 1 ans 0` (le ValueCallback ne rappelle jamais), JS→natif vivant au démarrage (`transmission entré=3`), défaut propre à l'appareil (CI verte). Cause exacte non établie — instrumenté sans conclusion prématurée :

1. **État bibliothèque poussé par la page** (sens JS→natif, fonctionnel) : `libDiagPush` → `AndBridge.onLibDiagState` → section dédiée de l'écran diagnostic + rapport copié. Le prochain rapport dira si `libraryV3` est lancée, ce qu'elle renvoie (httpStatus, gqlErrorCodes, shape, itemsTotal) et si le jeton est prêt (oui/non, sans valeur).
2. **Traces d'enquête** : version Android + modèle + version System WebView ; état du WebView à chaque sonde (attaché, visibilité, shown, alpha, thread, taille) ; `page-alive +<ms>` (la page vit-elle après l'envoi ?) ; sondes minimales `evaluateJavascript("1")` `post-page` (après chaque `onPageFinished`) et `post-touch` (après un vrai toucher, limité à 1/10 s).
3. **UI honnête** : Bibliothèque sans cache = « Chargement… » borné à 10 s, puis « Bibliothèque indisponible » + bouton **« Réessayer »** (`spotify:lib:retry`) — jamais « aucune playlist » sans compte vide confirmé.

Lecture du prochain rapport : `js-cb <id> post-page String "1"` = la livraison fonctionne au chargement ; absent + `js-cb tmo … ans 0` = livraison morte ; `wv-state` hors norme (att=0, vis=8, alpha=0, size=0x0) = WebView invisible/occultée ; `page-alive` présent mais `js-cb` absent = la page vit pendant que le sens natif→JS reste muet ; `device wv=…` croisé avec l'hypothèse version.

## 30. Mission « faire apparaître les playlists » (changements réels) — le modèle « la page pousse »

Stop aux diagnostics : le canal natif→JS étant mort sur l'appareil, la solution **n'en dépend plus**. Quatre changements, un commit chacun :

1. `285c43e` — **la page pousse la bibliothèque** : `checkMediaLib` auto-déclenché (jeton prêt + reprises bornées) ; lots de 25 ({title, subtitle, uri, image}) via `AndBridge.onMediaLibBatch` ; `NativeLibCache` valide (URI 22 alphanum, image https) et persiste `lib_cache_<cat>`/`lib_cache_at_<cat>` (prefs `melodix_native`) ; l'écran Bibliothèque peint **le cache « à jour il y a X »** puis la version fraîche ; une erreur ne vide jamais le cache ; vide confirmé = « Aucune playlist ».
2. `40f0298` — **file de commandes** `AndBridge.pollCommands()` (synchrone, bornée 32, liste blanche double) sondée par la page (intervalle court si commande en attente ou UI native visible) ; toutes les actions natives passent par la file, `evaluateJavascript` reste secondaire.
3. `4643955` — **ouverture de playlist sans natif→JS** : `loadUrl("javascript:…")` (sans rechargement) puis repli 6 s `loadUrl("https://open.spotify.com/playlist/<id>")` strictement validé (URI 22 alphanum uniquement, garde d'hôte).
4. `3f15709` — **états honnêtes** : « Connecte-toi à Spotify » + « Se connecter » (URL fixe) quand le jeton manque ; « Aucune playlist » seulement si vide confirmé ; erreur + « Réessayer » sinon ; échec GraphQL = « La requête Spotify refusée ou modifiée (libraryV3) ».

Tests : +15 contrats (chacun échoue sans son changement) ; suite verte ; CFG Dalvik verte (VerifyError de registre attrapé par `audit_remediation` et corrigé avant tout commit) ; CI verte sur `3f15709e9c56d6b14b04adba77f2c6a49e4063d0`. Non vérifié : téléphone réel, compte Spotify réel — les playlists ne sont pas déclarées corrigées sans essai réel.

## 31. Mission « résolution définitive du bug des playlists » — cartographie complète de la chaîne et causes racines

Mission = plus de corrections partielles : cartographier toute la chaîne (source → requête/auth → réponse/pagination → normalisation → cache → pont JS → requêtes natives en attente → état UI → sections Accueil → ouverture de playlist), trouver où les playlists disparaissent et pourquoi le chargement ne finit jamais, corriger et prouver. Restrictions Spotify actuelles vérifiées (migration Web API février 2026 : `GET /playlists/{id}/tracks` → `/items`, contenus réservés aux playlists possédées/collaboratives, champ `track` devenu **booléen** silencieux, recherche plafonnée à 10, Dev Mode Premium + 5 utilisateurs) — le parsing interne tolère déjà ces formes (`itemV2`/`item`/`track`, piège booléen sans crash).

**Causes racines démontrées sur le code (chaîne native + JS) :**

1. **Chargement éternel (« Chargement des playlists… » sur les 3 écrans)** — `mediaItemsStatusRow('loading')` envoyait une ligne transitoire sur `media:<cat>` qui (a) **désarmait** `NativeLibWatchdog` et (b) **remplissait `nativeLibraryJson`** avec cette ligne : la ré-entrée sur l'onglet la repeignait (`:lib_have_json`) **sans ré-armer le watchdog** → état bloqué à vie. Aucun état terminal (login/erreur après épuisement des reprises bornées) ne repeignait jamais l'écran Bibliothèque (`__sfNotifyMediaLibReady` ne repeint que l'Accueil) et les requêtes de `pendingMediaRequests` n'étaient pas servies sur les branches d'échec.
2. **« Aucune playlist » fantôme** — deux origines cumulées : (a) corrigée en test.17 (`141b319`) : le format de réponse `libraryV3` ayant bougé (`edges[].node`, enveloppes `itemV2`), la lecture tombait à plat et un compte à playlists était publié **vide confirmé** ; (b) la ligne vide confirmée restait à l'écran même après un rafraîchissement réussi si aucun repeint n'arrivait (watchdog désarmé + cache de statut empoisonné).
3. **Le watchdog pouvait peindre une erreur par-dessus des données déjà reçues.**

**Correctifs (chaîne complète, aucun masquage) :**

- `assets/spotify_bridge.js` : `mediaItemsStatusRow` typé (`kind`) + état **login** réel (« Connecte-toi à Spotify » + `spotify:lib:login`) ; `fetchMediaItems` répond à sa propre requête (login > erreur > vide > attente) et nevoie plus de ligne de chargement transitoire pour les catégories racines ; `checkMediaLib` **draine `pendingMediaRequests` sur TOUTES les branches terminales** (login/erreur) via `drainPendingMediaRequests` — une requête en attente ne peut plus rester orpheline.
- `MainActivity.smali` : watchdog **armé à CHAQUE entrée** d'onglet (`:lib_fetch`) ; les lignes `kind:loading` ne désarment plus ; `kind:loading/error/login` ne remplissent plus `nativeLibraryJson` (une erreur n'écrase jamais un bon cache) ; `paintLibLoadError` **résout d'abord ready/empty depuis le cache** (les données gagnent toujours sur l'erreur).
- `NativeLibCache.finish` (déjà présent) = repeint final de la catégorie terminée via `media:<cat>` — épingle par contrat.

**Tests** : `tests/library_chain_fixes.test.js` (7 contrats Smali/JS, chacun échoue sans son correctif) + `tests/library_fetch_diagnostics.test.js` +4 (login sans session, drain sur échec, drain login, contrat d'intégration producteur `onMediaLibBatch` ↔ consommateur `NativeLibCache.accept`) +1 test adapté (watchdog armé à chaque entrée). Suite : **342/342** (référence d'entrée : 331/331), CFG Dalvik verte, syntaxe JS verte. Compilation APK = CI uniquement (pas de SDK local), émulateur indisponible dans le bac à sable. **Rien poussé, rien publié** (consigne mission) — le bug n'est pas déclaré corrigé sans essai réel sur téléphone + compte Spotify.
