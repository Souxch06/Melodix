# Rapport Mission V22 — Fiabilisation finale du lecteur Spotify Web

**Date** : 2026-10-09 · **Dépôt** : `Souxch06/Melodix` · **Branche** :
`arena/fcdae8c6-melodix` · **PR** : #6 (ouverte, non fusionnée)

**NIVEAU DE PREUVE GLOBAL (rappel impératif de la mission)** : rien dans ce
rapport ne prétend à une validation physique. Aucun téléphone, aucun compte
Spotify, aucune écoute réelle dans ce contexte. Tout ce qui n'est pas « testé
automatiquement » ou « testé sur émulateur CI » est déclaré **NON TESTÉ**
(§11, §12). Un double publiant `playing` ne prouve pas la lecture réelle ; la
playlist 32 titres reste une simulation de scénario moteur.

---

## 1. HEAD initial / final exacts

- **HEAD de départ V22** (= HEAD final V21) :
  `c93564246730b2268bc9ed704394218fc3c2cc96` —
  « V21 — rapport mission (audit lecteur Spotify Web…) », version
  `4.5.0-test.26` / `versionCode 45026`.
- **Reprise** : le sandbox démarrait sur `efff66c` (état local périmé,
  divergent du remote) → réalignement `git reset --hard
origin/arena/fcdae8c6-melodix` sur `c935642` avant toute action (arbre
  propre vérifié).
- **Commit A (code V22)** :
  `228b37b06f2657283afa3cbcdc704ff58b70994f` —
  « V22 — fiabilisation lecteur Spotify Web : D1 … D3 … » (§3, §4, §5).
  8 fichiers, +272/−23.
- **HEAD final de branche** : le commit contenant la version définitive du
  présent rapport — HEAD local = HEAD remote vérifié après le dernier push.
- **Version livrée** : `4.5.0-test.27` / `versionCode 45027` — bump
  synchronisé dans `package.json`, `app.config.js` ET les pins du workflow
  (`EXPECTED_VERSION_CODE`/`EXPECTED_VERSION_NAME`) **dans le même commit A**
  (règle V20 : aucun décalage version/pins).

## 2. Branche + état PR

- Branche de travail : `arena/fcdae8c6-melodix` (session Arena).
- **PR #6** : `OPEN`, `MERGEABLE`, head `228b37b` après le push du commit A,
  puis head = commit final (ce rapport) après le dernier push.
- **`main`** : `fceab85950b069edcb65ed718a8ffd419a1bc785` — **intouché**
  (aucun commit, tag, push, ni merge ; §13).

## 3. Fichiers modifiés + raisons (commit A — 8 fichiers)

| Fichier                                                        | Raison                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `components/Player/SpotifyWebHostView.tsx`                     | **D1** : le bouton « Fermer » de l'overlay n'écrivait que l'état React local ; il passe désormais par le bus de visibilité partagé (`requestSpotifyWebHostVisible(false)`). **D1b** (même famille) : le démontage de l'hôte remet le drapeau bus à faux (idempotent) — plus d'overlay orphelin au remontage.                                                                                                                                |
| `components/Player/__tests__/SpotifyWebHostView.unit.test.tsx` | **+2 tests de régression D1** (fermeture → bus remis à faux ; ré-ouverture du moteur après une fermeture). Le mock `@services` reçoit `requestSpotifyWebHostVisible`/`isSpotifyWebHostVisible` avec la sémantique idempotente **exacte** du bus de production (c'est elle qui rend la régression détectable) ; le getter `overlayVisible` des fakes était figé (snapshot), remplacé par un getter live.                                     |
| `services/player.ts`                                           | **D3** : dans `onSpotifyWebPublished`, les états `playing` et `ended` exigent désormais l'identité **exacte** de la piste active (`published.trackId !== active.spotifyId` → ignoré). Un `playing`/`ended` publié sans identité (document hors page piste) n'est plus projeté. Les états document (`paused`/`loading`/`idle`/`error` — dont `host-unmounted`, identité nulle par construction) restent acceptés sans identité.              |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`             | **+2 tests de régression D3** (`playing` sans identité jamais projeté sur la piste active + non-sur-réservé avec identité ; `ended` sans identité n'avance pas la file, avec identité si).                                                                                                                                                                                                                                                  |
| `services/playbackBackend/spotifyWebPlaybackIntegration.ts`    | **Commentaire périmé corrigé** (zéro changement de code) : l'en-tête « POURQUOI CE MODULE N'EST PAS ENCORE IMPORTÉ PAR LE LECTEUR » (ère Mission 6-7) décrivait un garde-fou qui n'existe plus en cette forme ; il est remplacé par le câblage actuel V17→V22 (port `SpotifyWebHostSourcePort` = seule surface ; garde-fou maintenu : les 4 fichiers de lecture ne référencent jamais `spotifyWebFeature`/`SpotifyWebBackend` directement). |
| `package.json`, `app.config.js`                                | Bump `4.5.0-test.27` / `versionCode 45027`.                                                                                                                                                                                                                                                                                                                                                                                                 |
| `.github/workflows/android-apk.yml`                            | Pins `EXPECTED_VERSION_CODE: '45027'` / `EXPECTED_VERSION_NAME: 4.5.0-test.27` — **même commit** que le bump.                                                                                                                                                                                                                                                                                                                               |

**Aucun autre fichier modifié.** En particulier : `services/spotify/*`
(auth/OAuth) **intouché** — aucun défaut démontré dans la chaîne (§10) ;
aucun test existant supprimé ni modifié (les 2 suites complétées le sont par
ajout d'un `describe` autonome).

## 4. Défauts réellement trouvés (audit §3 bout en bout)

Périmètre audité intégralement (lecture complète, état disque vérifié contre
le HEAD) : `services/player.ts` (2701 L),
`services/playbackBackend/{SpotifyWebBackend, spotifyWebRuntime,
spotifyWebTrackTransport, spotifyWebHost, spotifyWebPlaybackIntegration,
spotifyWebPlaybackPlan, spotifyWebBridge, spotifyWebState,
spotifyWebMediaSessionProbe, playbackBackendSelection, mediaProjection,
index}`, `context/PlayerContext.tsx`,
`components/Player/{SpotifyWebHostView, MiniPlayer, FullPlayer}.tsx`,
`services/mediaBridge.ts`, `services/playbackSession.ts`, `app/_layout.tsx`,
`app/settings/spotify-web-player.tsx`, `services/spotify/{authConfig,
useSpotifyAuth, apiClient}.ts`.

Parcours complet tracé : sélection → `resolving` → tentative Spotify Web
(fenêtre de confirmation 20 s, identité exacte) → `playing` publié →
pause/reprise/seek via port → fin (`ended` publié, dédupliqué par
`spotifyEndedHandledForId`) → `advanceAuto` → piste suivante ; + panne
transitoire (`SPOTIFY_WEB_TRANSIENT_LOSS_CODES` : la piste est conservée, le
prochain PLAY explicite retente la MÊME piste), + stop, + `restoreSession`,

- commandes MediaSession (`mediaBridge` → mêmes méthodes publiques que l'UI).

### D1 (important) — fermeture de l'overlay sans le bus de visibilité

**Fait** : le bouton « Fermer » de l'overlay Spotify appelait
`setOverlayVisible(false)` (état React local) au lieu de
`requestSpotifyWebHostVisible(false)` (bus partagé `spotifyWebHost.ts`).
Deux conséquences démontrées par le code :

1. **Contrat « fermeture pendant une tentative = abandon explicite » rompu** :
   le port (`attemptWithCloseCancel`) met en concurrence l'attente de
   confirmation avec le bus de visibilité ; la fermeture UI ne le notifiant
   jamais, la fenêtre courait ses 20 s complètes (`confirmation-timeout` → piste marquée échec +
   avancement de file) au lieu de s'arrêter immédiatement.
2. **Overlay indéfiniment non ré-ouvrable (cas critique)** : le drapeau bus
   restait `true` alors que l'overlay était fermé. La tentative suivante du
   moteur appelant `requestSpotifyWebHostVisible(true)`, l'idempotence du bus
   (« déjà visible ») ne notifiait personne → l'overlay ne se ré-ouvrait
   **jamais** → l'utilisateur ne voyait plus la page Spotify (où se trouvent
   les seuls contrôles réels), ne pouvait plus confirmer, et **chaque**
   tentative Spotify s'éteignait en timeout jusqu'au redémarrage de
   l'application.

### D3 (moyen) — `playing`/`ended` sans identité projetés sur la piste active

**Fait** : la garde d'identité de `onSpotifyWebPublished` acceptait
`trackId: null` pour **tous** les états, alors que le commentaire l'entendait
limité aux « états document (chargement, erreur de pont) ». Or le probe ne
publie d'identité que depuis l'URL du document (`/track/<id>`) : dès que le
document n'est plus la page piste (navigation SPA, accueil, file interne du
Web Player, contexte pub), un `playing` sans identité prouve **rien** sur la
piste que le moteur lit — le projeter est une attribution croisée ; un
`ended` sans identité fait avancer la file sans preuve de fin de **la** piste
courante. Écart par rapport au chemin d'adoption, qui exige déjà l'identité
exacte — le moteur n'était donc pas cohérent avec lui-même.

### Note d'audit (non-modifié) — commentaire périmé

L'en-tête de `spotifyWebPlaybackIntegration.ts` (corrigé, §3) décrivait un
état du monde (module « non importé par le lecteur », validation physique
bloquante) contredit par l'architecture V17→V22 — risque de faire perdre du
temps (ou de « corriger » à tort) à un futur auditeur.

**Éléments audités SANS défaut confirmé** : init/chargement WebView (phases
runtime + grace bornée 10 s + reconnexion bornée 3× + rechargement manuel),
dispo bridge (blockers `host-webview-non-monte`/`pont-non-pret`), sessions
expirées/détruites (perte de source `error`/`host-unmounted` publiée avant
démontage ; budget de reconnexion), commandes trop tôt (epoch de
session + plan TTL 15 s + `latest-command-wins`), changements rapides
(`playToken`/`isStale` sur tous les chemins), `ended` dupliqués (expo-av :
`lastFinishHandledForToken` ; Web : `spotifyEndedHandledForId`), transitions
pause/playing/loading/erreur (états distincts `resolving`/`buffering`/
`playing`/`paused`/`ended`/`error`), destruction/recréation hôte (remount du
renderer, purge bus `null`), non-Spotify (cascade expo-av inchangée,
garde-fou `ORDER = ['audius', 'youtube']` testé), anti-double-lecture
(best-effort `pause` de la page avant création d'un Sound — résidu documenté
§12), protocole bridge (contrat strictement versionné v1/v2, rejection des
champs inconnus, pas de log brut).

## 5. Corrections (toutes justifiées par un défaut reproductible ci-dessus)

- **D1** : fermeture via le bus + reset bus au démontage (2 modifications
  cibées, `SpotifyWebHostView.tsx`). Le souscripteur bus→local préexistant
  reste l'unique pilote de l'état affiché — plus de double source de
  vérité.
- **D3** : garde d'identité renforcée pour `playing`/`ended`
  (`services/player.ts`). `error` volontairement **exclu** du resserrement :
  le démontage de l'hôte publie `error`/`host-unmounted` avec identité nulle
  **par construction** (fix V9) — l'exclure ré-ouvrirait ce trou.
- **Validation de la régression** : chaque test D1/D3 a été exécuté **contre
  le code pré-correction** (revert temporaire) → les 4 tests **échouent**
  sans la correction et **passent** avec (§6).

## 6. Commandes de vérification + résultats réels (code commit A)

Exécutées dans le sandbox sur l'arbre du commit A (`228b37b`), arbre propre :

| Commande                                                                                                                                                        | Résultat réel                                                                                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `npx tsc --noEmit`                                                                                                                                              | **exit 0** (0 erreur)                                                                                |
| `npx eslint services/player.ts services/playbackBackend/ components/Player/SpotifyWebHostView.tsx components/Player/__tests__/SpotifyWebHostView.unit.test.tsx` | **exit 0** (0 problème)                                                                              |
| `npx prettier --check` (8 fichiers modifiés)                                                                                                                    | **All matched files use Prettier code style!**                                                       |
| `npx jest` (suite complète)                                                                                                                                     | **2084 passés / 14 ignorés / 2098 total — 155 suites passées, 14 suites sautées (sur 169)**          |
| Régression D1 contre le code pré-correction                                                                                                                     | `npx jest SpotifyWebHostView.unit.test.tsx -t "V22"` → **2 échecs** (sans fix) → 2 succès (avec fix) |
| Régression D3 contre le code pré-correction                                                                                                                     | `npx jest playerSpotifyWeb.unit.test.ts -t "D3"` → **2 échecs** (sans fix) → 2 succès (avec fix)     |

Baseline V21 : 2080 passés / 14 ignorés / 2094 total (155 suites) →
**+4 tests** (2 D1 + 2 D3), **0 échec, 0 test supprimé, 0 seuil/timeout
modifié**. Les 14 suites sautées sont la baseline constante (tests
nécessitant l'émulateur/native, exécutés en CI Gradle/Robolectric).

## 7. Nombre exact de tests — dernière exécution

- **Locale (suite complète, code commit A `228b37b`)** : **2084 réussis /
  0 échoué / 14 ignorés — 2098 total** (155 suites passées, 14 suites
  sautées), 2026-10-09, sandbox Arena — exécutée sur l'arbre exact du commit
  A (§6).
- **CI (run du commit A — `37936888166`)** : **SUCCESS** ; l'étape « Tests
  JavaScript / React Native » (Jest complet) et « Tests Kotlin du module
  média (Robolectric) » sont **completed success** sur le même commit (statut
  étape par étape vérifié via l'API GitHub — §8). Les logs bruts de la run
  n'étaient **pas téléchargeables depuis ce sandbox** (EOF persistant sur le
  log-receiver GitHub, 6 tentatives) : les chiffres Jest exacts ci-dessus
  proviennent donc de l'exécution locale complète du commit A, et la run CI
  du même commit passe ces mêmes suites — **aucun** chiffre n'est repris
  d'une run antérieure.

## 8. CI finale + statut

- **Run du code (commit A `228b37b`) — run `37936888166`**
  (<https://github.com/Souxch06/Melodix/actions/runs/37936888166>) : workflow
  « APK Android » (TypeScript, ESLint, Prettier, Jest complet, tests backend,
  Kotlin/Robolectric, build Gradle + alignement 16 KiB + signature,
  installation + lancement sur émulateur Android 14, intégrité, artefact).
  **Statut final : `completed` / `success` (GREEN)** — conclusion vérifiée
  via l'API GitHub ; chaque étape du job est `completed success` (ou
  `skipped` pour les 3 étapes de release, volontairement inactives : la
  mission interdit une release définitive).
- **Run du HEAD final (commit rapport)** : re-valide le même code (le commit
  rapport ne contient que ce fichier) ; son ID et son statut sont lisibles
  dans les checks de la PR #6.
- Référence V21 : run `37914503981` (HEAD `c0a9919`) — SUCCESS ; run
  `37916116571` (HEAD `c935642`) — SUCCESS.

## 9. APK de test

- **Nom exact** : `Melodix-v4.5.0-test.27-228b37b.apk` (nomenclature du
  workflow : version + versionCode 45027 + short-SHA du commit A) — **nom
  confirmé** par la réponse de l'artefact de la run (l'étape « Publier l'APK
  comme artefact » est `completed success`).
- **Lien artefact** : artefact de la run `37936888166` —
  <https://github.com/Souxch06/Melodix/actions/runs/37936888166> (onglet
  « Artifacts »).
- **Aucune release définitive publiée** (règle de mission) : les 3 étapes de
  GitHub Release sont `skipped` ; l'APK est un artefact de test uniquement,
  récupérable depuis la CI tant que la run existe.
- **Limite de vérification (honnête)** : le téléchargement de l'artefact et
  des logs bruts de la run **a échoué depuis ce sandbox** (EOF persistant
  sur les endpoints de résultats GitHub/Azure, malgré plusieurs tentatives) —
  la taille exacte de l'APK n'a donc pas pu être mesurée ici ; elle est
  visible sur la page de la run. L'intégrité, l'alignement 16 KiB, la
  signature et l'installabilité ont été vérifiées **dans la CI** (étapes
  dédiées `completed success`) et le lancement réel sur émulateur Android 14
  a réussi (étape « Installer et lancer réellement l'APK sur Android 14 »
  `completed success`).

## 10. Diagnostic 403 — revue non destructive (règle V22 §4)

**Méthode** : re-vérification de la chaîne auth complète dans le code actuel
(zéro changement — aucun défaut démontré), sur la base des diagnostics V14→V21
et des sources externes consignées. **Aucun re-audit token/PKCE/SecureStore**
(aucun nouvel indice depuis V19).

**Faits établis dans le code (vérifiés ce jour)** :

- Flux **Authorization Code + PKCE S256** (expo-auth-session, jamais clos) ;
  **aucun Client Secret** (client public mobile) — `useSpotifyAuth.ts`.
- **Client ID en build-only** : `EXPO_PUBLIC_SPOTIFY_CLIENT_ID` →
  `expo-config extra` → `none` ; **aucun écran de saisie** utilisateur,
  jamais de valeur journalisée (seule sa source/présence) —
  `authConfig.ts`.
- **Redirect unique** `melodix://callback` : la même valeur sert au
  `/authorize` ET à l'échange de token (élimine `redirect_uri_mismatch` /
  `invalid_grant` par construction).
- **Scopes minimaux en lecture** : `user-read-private`,
  `user-library-read`, `playlist-read-private`,
  `playlist-read-collaborative` — un scope absent ne casse pas le login, il
  casse l'endpoint (403 « Insufficient client scope » **JSON**).
- **Traitement 403** (`apiClient.ts`) : jamais un succès ; 403 **avec**
  message JSON = erreur de scope/permission exposée sans retry ; 403
  **sans** message (corps vide / JSON sans `error.message`) = signature «
  edge », retry **borné** (2 tentatives, backoff 1,5 s/3 s) puis exposition ;
  métadonnées 403 collectées **avec allow-list** (URL finale, statusText,
  headers non sensibles, compteur `attempts`) — jamais de token/code/secret.
- Session persistée SecureStore, refresh borné, « Réessayer » ; la
  transaction PKCE survit au kill du processus (verifier restauré depuis
  SecureStore).

**Faits établis sur l'observation (V14→V21, sources externes)** : le 403
observé sur `GET /v1/me` = **corps VIDE non JSON**, `server: envoy` +
`via: HTTP/2 edgeproxy, 1.1 google` — signature d'une réponse **edge Spotify**
(identique sur les réponses normales ; un 403 API classique serait JSON avec
`error.message`). Spotify Community documente : (a) 403 **intermittents** sur
mêmes requêtes+token (« the API is currently unstable ») ; (b) apps en
**dev-mode** → 403 `/v1/me` tant que le compte n'est pas dans « Users and
Access » du dashboard (ajout du compte → 200) ; (c) 403 « User not approved
for app » **JSON** (cas tranché immédiatement — ce n'est PAS la signature
observée ici, le corps observé était non JSON).

**Hypothèses restantes (non tranchables sans accès externe)** :

1. **Restriction compte / dev-mode** : le compte Spotify du mainteneur doit
   figurer dans « Users and Access » de l'application dans le dashboard
   Spotify (dev-mode par défaut, quota d'utilisateurs) — **non vérifiable
   depuis ce sandbox** (ni compte, ni dashboard).
2. **403 edge intermittent Spotify** (instabilité backend / dégradation
   edge) — indépendant de Melodix ; le retry borné du code existe
   précisément pour ça, mais un 403 persistant reste un 403 exposé.

**Ce qui manque EXACTEMENT pour trancher** : (1) un compte Spotify qui
figure dans la whitelist dev-mode de l'app (ou la sortie du dev-mode par le
mainteneur) ; (2) la lecture du dashboard Spotify (onglet « Users and
Access ») par le mainteneur ; (3) si le 403 persiste avec le compte
autorisé : les métadonnées 403 déjà collectées par l'app (URL finale,
headers, `attempts`) — visibles dans le diagnostic de l'écran de connexion —
pour distinguer edge intermittent (retry résout) de refus dur.

**Procédure de diagnostic non destructive (téléphone)** : connecter avec un
compte whitelisted ; si 403 → l'écran de connexion affiche le code 403 et ses
métadonnées autorisées (aucun secret) ; vérifier dans le dashboard que le
compte est bien listé ; re-essayer (retry borné intégré) ; consigner
`attempts` ≥ 2 (persistant) vs 1 (intermittent). **Aucun changement du flux
OAuth, des scopes, du redirect, de SecureStore** n'est justifié à ce jour.

**Distinction par 403 (conclusion)** : avec le corps **non JSON vide**
observé, la cause la plus probable est **edge/restriction (dev-mode ou
instabilité edge)** — PAS « accès-scope non autorisé » (qui renverrait un
JSON), PAS une erreur de config Melodix (redirect/Client ID/PKCE vérifiés
cohérents), PAS une réponse d'un autre service (signature envoy+edgeproxy =
edge Spotify). **Ne jamais équivaler 403 = connexion réussie** (tenue).

## 11. Tableau validé automatique / émulateur / physique

| Élément                                                                                    |           Testé AUTO (Jest/CI)            |                                                          Testé ÉMULATEUR (CI Android 14)                                                           |  Testé PHYSIQUEMENT (téléphone)   |
| ------------------------------------------------------------------------------------------ | :---------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------: |
| Contrat moteur (tentative, confirmation, états publiés, `playToken`, file, shuffle/repeat) |              ✅ (28+2 tests)              |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| **D1** fermeture/ré-ouverture de l'overlay (régression)                                    |           ✅ (2 nouveaux tests)           |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| **D3** identité exigée pour `playing`/`ended` (régression)                                 |           ✅ (2 nouveaux tests)           |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| Protocole bridge v1/v2 (stricte, versionné, corrélé)                                       |                    ✅                     |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| Runtime (handshake, reconnexion bornée 3×, renderer, back/foreground)                      |                    ✅                     |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| Plan/sélection (ordre Spotify→Audius→YouTube, refus, cache négatif)                        |                    ✅                     |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| Playlist 32 titres (scénario moteur — **simulation, PAS écoute réelle**)                   |               ✅ (v7 + V21)               |                                                                         —                                                                          |           ❌ NON TESTÉ            |
| Montages/cycle de vie MediaSession Android, anti-autoplay                                  |            ✅ (Robolectric/JS)            | ✅ (install + lancement + logcat breadcrumb `[MelodixSpotifyWeb]` : host-mounted, handshake, **aucun** `playback-confirmed` sans compte — attendu) |           ❌ NON TESTÉ            |
| Lecture audio réelle Spotify Web (`playing` publié par la page)                            |     ❌ (impossible sans page réelle)      |                                                          ❌ (pas de compte Spotify en CI)                                                          |         ❌ **NON TESTÉ**          |
| Arrière-plan / écran verrouillé / Bluetooth (continuité audio)                             |                    ❌                     |                                                                         ❌                                                                         |         ❌ **NON TESTÉ**          |
| Connexion OAuth réelle (login + `melodix://callback` + échange)                            |          ✅ (contrats, doubles)           |                                                   ✅ (wiring cold-start smoke, **sans** compte)                                                    |         ❌ **NON TESTÉ**          |
| 403 (cause réelle)                                                                         | ❌ (non reproductible sans compte/config) |                                                                         ❌                                                                         | ❌ **NON TESTÉ** — diagnostic §10 |

## 12. Limites restantes + actions pour le test réel téléphone

**Limites (documentées — PAS de contournement fragile tenté)** :

1. **Geste utilisateur requis dans la vue** : le probe n'exécute AUCUNE
   commande (`no-authorized-execution-surface` — aucun surface standard
   autorisée ne permet à un bridge de piloter la lecture Spotify Web ;
   cliquer le DOM / synthétiser des événements serait un contournement
   interdit). Conséquence : chaque piste démarre par un **tap « Lecture »
   dans la page** (la vue s'ouvre automatiquement sur tentative) ; pause/
   seek refusés par la page → la vue se réaffiche (contrôle réel) ;
   prev/next = navigation de file moteur (nouvelle tentative + tap). Le
   `playing` moteur n'existe QUE sur état publié — jamais simulé.
2. **Identité = URL du document** : le probe ne lit que `location.href` +
   MediaSession standards. Une pub jouée **dans** le contexte d'une piste
   (document resté `/track/<id>`) est projetée comme lecture de cette piste
   (indistinguable sans technique interdite). `playing`/`ended` sans
   identité sont désormais ignorés (D3).
3. **Volume** : la page n'expose aucune API de volume ; la commande est un
   no-op honnête côté page (le volume moteur reste l'intention globale pour
   les pistes expo-av).
4. **Arrière-plan/verrouillé** : sur piste Spotify Web, la MediaSession
   système est celle de la **WebView (Chromium)** (l'app stoppe volontairement
   sa session Media3 pour éviter deux notifications concurrentes) ; la
   continuité audio quand l'app passe en arrière-plan (WebView hors écran
   `left:-6000`, pas `display:none`, pour préserver la session) et la
   réception des commandes verrouillé/Bluetooth par la MediaSession Chromium
   **doivent être vérifiées sur téléphone** — Android peut throttler un
   WebView hors écran ; rien ici ne le déclare « fonctionnel ».
5. **`stop()`** : la pause best-effort de la page est refusée (limite 1) →
   l'audio continue jusqu'à arrêt dans la vue ; l'app le signale en
   réouvrant la vue (contrôle réel) — incohérence connue, documentée, sans
   surface d'exécution.
6. **403** : non tranchable sans compte/dashboard (§10).

**Actions de test réel (dans l'ordre)** :

1. Installer l'APK `Melodix-v4.5.0-test.27-228b37b.apk` (artefact run
   `37936888166`) sur un téléphone Android 14+.
2. **Connexion Spotify** : écran Connexion → autorisation dans la WebView
   (`accounts.spotify.com`) → callback `melodix://callback` → profil. Si 403
   → §10 (whitelist dev-mode du dashboard).
3. **Première lecture** : choisir une piste Spotify → la vue s'ouvre →
   tap « Lecture » **dans la page** → le mini-lecteur passe à `playing`
   (état publié) ; vérifier l'absence de tout `playing` sans tap.
4. **Contrôles** : pause/seek dans la vue (état suit la page) ; tap
   pause/seek dans l'UI Melodix → vue réapparue (refus honnête) ; next/prev
   (nouvelle tentative + tap) ; **D1** : fermer la vue puis relancer une
   piste → la vue DOIT se ré-ouvrir (régression) ;
   **D3** : naviguer hors de la page piste dans la vue → l'UI ne doit pas
   afficher `playing` pour la piste active sans retour sur la page.
5. **Enchaînement** : 32 titres (file) — chaque fin de piste relance la vue
   (geste requis, limite 1) ; vérifier l'absence de double lecture et
   d'avancement fantôme.
6. **Cycle de vie** : verrouiller pendant lecture (continuité audio ?
   commandes verrouillées ?), background/foreground, rotation, perte réseau
   (reconnexion bornée, piste conservée), Bluetooth (transfert de contrôles).
7. **Consigner** : remplir `docs/SPOTIFY-WEB-PHYSICAL-TEST.md` puis lever la
   validation physique dans Réglages → Lecture Spotify Web (preuve
   documentée, statut non bloquant) — jamais l'inverse.

## 13. Confirmations de fin de mission

- **`main` non modifié** : `fceab85950b069edcb65ed718a8ffd419a1bc785` avant
  ET après la mission (aucune action sur `main` : pas de commit, tag, push,
  merge, release).
- **PR #6 non fusionnée** : `OPEN`/`MERGEABLE` — seule la branche
  `arena/fcdae8c6-melodix` a reçu des commits (V22 : commit A `228b37b` +
  commit rapport).
- **Aucun test supprimé** pour masquer un échec ; les 4 nouveaux tests sont
  ciblés sur D1/D3 et validés contre le code pré-correction.
- **Aucune validation physique fictive** : tout ce qui n'a pas pu être testé
  sur téléphone/compte réel est déclaré **NON TESTÉ** (§11) ; aucun mock de
  lecture, aucun faux `playing`, les protections anti-faux-confirmation sont
  conservées et renforcées (D3).
- **APK dispo** : artefact CI de la run `37936888166` (§9), sans release
  définitive.
- **Contrôles automatiques verts** : tsc/ESLint/Prettier/Jest complets
  exécutés sur l'arbre exact du commit A (§6) ; run CI du commit A
  `37936888166` SUCCESS avec **toutes** les étapes
  TypeScript/ESLint/Prettier, Jest, Robolectric, Gradle/APK 16 KiB/signature,
  intégrité et émulateur Android 14 à `completed success` (§8 — résultats
  étape par étape vérifiés via l'API GitHub ; logs bruts non téléchargeables
  depuis le sandbox, limite documentée §9) ; la run du HEAD final (ce
  rapport) re-valide le même code — statut lisible dans les checks de la PR
  #6 et vérifié en fin de mission.
