# Mission V20 — Débloquer et valider le VRAI lecteur Spotify Web de Melodix

**Date** : 9 octobre 2026 · **Base** : HEAD `02b4832` (V19 final,
`4.5.0-test.24/45024`) · **RÉSULTAT** : livré — la chaîne de lecture réelle
(UI → PlayerController → SpotifyWebBackend → SpotifyWebHostView →
SpotifyWebRuntime → WebView → Spotify Web Player → retour d'état) a été
auditée fichier par fichier ; **7 défauts concrets démontrés** dans le
parcours post-load (D8a–D8d, D3, D2) ont été corrigés, chacun avec son
test de régression ciblé ; **aucun mock de lecture, aucun état inventé** ;
rien n'a été fait sur le 403 (hors périmètre V20, instruction mission) ;
version **`4.5.0-test.25/45025`** ; **CI finale SUCCESS (run
`37892926828`)** avec APK `45025` produite, vérifiée et lancée sur
émulateur Android 14 (smoke) — **lecture audio réelle NON testée ici
(pas de téléphone), procédure en §4**.

---

## 1. Résultat par catégorie (résumé)

### 1.1 FONCTIONNEL (modifications de code utiles dès maintenant)

- **Chaîne de lecture auditée en intégral** : `player.ts`,
  `spotifyWebTrackTransport.ts`, `SpotifyWebBackend.ts`,
  `SpotifyWebHostView.tsx`, `spotifyWebRuntime.ts`, `spotifyWebBridge.ts`,
  `spotifyWebPlaybackIntegration.ts`, `spotifyWebHost.ts`,
  `spotifyWebPlaybackPlan.ts`, `spotifyWebMediaSessionProbe.ts`. Montage
  WebView + cycle de vie, init runtime + handshake, page cible, surface
  d'exécution, envoi ET acquittement des commandes, remontée d'états, sync
  métadonnées/progression, erreurs, recréation — inspectés point par point
  (§2).
- **F1/D8 — attente bornée du handshake après navigation** (transport) :
  après un `load` qui NAVIGUE le document, les commandes de pont n'ont plus
  jamais à être délivrées au document qui meurt. L'attente (12 s max,
  poll 100 ms, scheduler injectable) s'interrompt si le runtime condamne
  le document ; à l'expiration, la commande part quand même et reçoit le
  refus **honnête** `bridge-unavailable` — jamais d'état inventé. Coût zéro
  quand la charge n'a pas navigué (pont déjà prêt → immédiat).
- **F2/D3 — `load` idempotent** (vue hôte) : si le document courant est
  déjà la page piste demandée (comparaison du chemin de piste, insensible
  à la casse, query ignorée), plus de re-navigation — elle détruisait le
  document VIVANT (y compris une lecture déjà démarrée dans la page par le
  geste utilisateur) et relançait charge réseau + handshake complet.
- **F3/D2 — adoption tardive** (moteur) : si la fenêtre de confirmation
  d'une tentative s'est fermée sans confirmation et que l'utilisateur
  démarre ensuite la lecture DANS la page, le moteur adopte l'état réel
  `playing` publié par la page (identité de piste EXACTE exigée) —
  c'est un `playing` PUBLIÉ (preuve d'état du lecteur), jamais une
  commande. Émission identique à une confirmation (resolved + playing +
  purge du bandeau + progression + trace + persistance), sans double
  émission si la fenêtre confirmait sur la même publication.
- **F5/D8b — clôture SYNCHRONE de session lors d'une navigation** (vue
  hôte) : l'événement natif `onLoadStart` arrive quelques millisecondes
  après `loadUrl` (pont natif → JS) ; l'adaptateur clôt maintenant la
  session du document précédent immédiatement, pour qu'aucune commande
  envoyée dans l'intervalle ne parte au document mourant (perdue ou
  refusée `stale`). L'appel natif qui suit reste idempotent.
- **F6/D8c — `load` hors validation session/séquence** (backend) : le
  `load` est le SEUL commandement qui change LÉGITIMEMENT la session de
  document (il navigue pendant son exécution) ; la validation stricte le
  transformait en faux refus, ce qui empêchait l'armement
  d'`awaitingConfirmation` et donc toute confirmation de la page. Les
  AUTRES commandes gardent la validation stricte (protection préservée).
- **F7/D8d — listener de commandes AVANT le `ready`** (probe) : le
  handshake ne se termine que lorsque le récepteur est capable de
  RECEVOIR ; une commande partie entre le `ready` et l'écoute aurait été
  perdue (timeout `expired` côté app) alors que la page était prête à
  répondre.
- **Aucune modification** de l'authentification (OAuth PKCE, Client ID,
  redirect, scopes, SecureStore), du retry borné 403, ni des codes
  transitoires v7 (`SPOTIFY_WEB_TRANSIENT_LOSS_CODES` inchangé).
- **Version** : `4.5.0-test.24/45024` → **`4.5.0-test.25/45025`**
  (corrections fonctionnelles réelles du moteur de lecture).

### 1.2 TESTÉ AUTOMATIQUEMENT

- **Jest (exécution réelle, HEAD `d273e12`) : 2069 passés / 14 ignorés /
  0 échec / 2083 total** (153 suites passées / 14 suites ignorées / 167)
  — **12 tests nouveaux de cette mission** : 3 dans
  `spotifyWebTransportPostLoadBridge.unit.test.ts` (F1 : navigué /
  jamais-ready / idempotent), 5 dans
  `SpotifyWebHostView.unit.test.tsx` (F2/F5 : idempotence, navigation
  réelle, clôture synchrone, fallback sans `getURL`, ID mal formé), 4 dans
  `playerSpotifyWeb.unit.test.ts` (F3 : adoption, garde d'identité,
  `ended` → avance de file, anti-double-émission). Baseline V19 :
  **2057 passés / 14 ignorés / 0 échec / 2071 total** — 0 régression.
- **TypeScript** : `npx tsc --noEmit` → 0 erreur.
- **ESLint** (les 8 fichiers modifiés) : 0 finding.
- **Prettier** (les 8 fichiers modifiés) : conforme.
- **Android/Robolectric + Gradle + APK + signature + 16 KiB + smoke** :
  exécutés par la CI — dans la run `37891473419` (commit `d273e12`),
  **toutes ces steps ont PASSE** ; la run a échoué uniquement sur
  l'expectation de versionCode pinnée dans le workflow (non synchronisée
  au bump) — corrigé, run finale en §7.

### 1.3 TESTÉ PHYSIQUEMENT (réel seul)

- **NON EFFECTUÉ** : cet environnement ne dispose d'aucun téléphone —
  aucune lecture audio réelle de Spotify Web Player (compte réel +
  Widevine) n'a pu y être vérifiée. **Rien n'a été inventé ni simulé.**
  Le lecteur réel ne peut être confirmé que sur appareil (critère de
  réussite de la mission, §4).

### 1.4 NON TESTÉ / BLOQUÉ

- **Lecture audio réelle sur téléphone** : la seule preuve qui compte.
  L'APK `45025` est produite par la CI (lien §7) ; la procédure est
  trivialle : ouvrir une piste Spotify → la vue s'ouvre → **taper sur
  Lecture DANS la page** → le son + l'état `En lecture` de l'app doivent
  apparaître ensemble.
- **Connexion (403)** : NON ré-enquêté (instruction mission V20) — le
  diagnostic V19 reste valable (cause la plus probable : application en
  mode Développement, compte absent de « Users and Access » du Developer
  Dashboard). Le diagnostic sécurisé + retry borné + bouton « Réessayer »
  sont inchangés et intacts.
- **Arrière-plan / écran verrouillé / Bluetooth** : les classes
  MediaSession natives existent, mais **rien n'est déclaré fonctionnel**
  — aucun test physique possible ici.

---

## 2. Défauts démontrés et corrections (audit de la chaîne)

### 2.1 D8 — la course post-load (défaut central)

**Symptôme démontré par les tests** : après `playTrack`, le transport
envoyait `seek`/`play` **immédiatement** — alors que `load` venait de
naviguer : l'événement natif `onLoadStart` (qui clôture la session du
document précédent) n'était pas encore arrivé. Les commandes partaient
donc soit au document qui meurt (perdues → timeout de commande 5 s),
soit à une session déjà condamnée (refus `bridge-unavailable`/`stale`) —
et la page ne répondait **jamais** honnêtement. Le test de régression
(F1, cas « navigué ») reproduit exactement cette race : sans la
correction, la commande part avant le handshake du nouveau document.

**Corrections (quatre couches, chacune nécessaire)** :

| Id  | Fichier                          | Correction                                                                                                                                                                                                                                                |
| --- | -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| F1  | `spotifyWebTrackTransport.ts`    | `waitForBridgeReadyAfterLoad()` : attente bornée (12 s / poll 100 ms) du `bridgeReady` du document vivant avant les commandes ; scheduler injectable ; interruption immédiate si état `error` ; à l'expiration, envoi quand même → refus honnête.         |
| F5  | `SpotifyWebHostView.tsx`         | Après `loadUrl`, l'adaptateur appelle `runtime.onLoadStart()` **synchrone** : la session du document mourant est clôturée immédiatement, sans attendre l'événement natif (quelques ms plus tard).                                                         |
| F6  | `SpotifyWebBackend.ts`           | `load` passe en direct (pas de `runLatestCommand`) : c'est le seul commandement qui change légitimement la session pendant son exécution ; la vérité est le booléen de l'adaptateur. Les autres commandes gardent la validation stricte session/séquence. |
| F7  | `spotifyWebMediaSessionProbe.ts` | Le listener `message` est enregistré **avant** le post `ready` : le handshake ne se termine que quand le récepteur peut recevoir.                                                                                                                         |

**Invariants préservés** : attente jamais infinie (12 s) ; aucune
commande émise par l'attente elle-même (elle décide seulement QUAND
les commandes planifiées peuvent l'être) ; refus honnêtes
(`bridge-unavailable`) jamais transformés en état positif ; la session ne
rouvre que sur le `ready` versionné du NOUVEAU document.

### 2.2 D3 — re-navigation intempestive

**Défaut démontré** : chaque `playTrack`/`playQueue` invoquait
`loadUrl` inconditionnellement — détruisant un document vivant (y compris
une lecture déjà démarrée dans la page) et relançant charge réseau +
handshake, là où la page était déjà prête à recevoir les commandes.

**Correction (F2)** : `load` compare l'URL courante (API native
`getURL`, hors DOM) au chemin de piste demandé
(`/track/<22 caractères alphanumériques>`, insensible à la casse, query/
fragment ignorés) : même piste → `true` sans naviguer ; autre page →
navigation réelle ; `getURL` indisponible/illisible → comportement
d'origine (naviguer). Tests : idempotence (pas de `loadUrl`, pas de
clôture de session), navigation réelle, fallback, ID mal formé refusé.

### 2.3 D2 — adoption tardive de la lecture réelle

**Défaut démontré** : si l'utilisateur était lent à appuyer sur Lecture
dans la page (fenêtre de confirmation fermée, verdict d'échec émis), la
lecture qui suivait — réellement démarrée dans la page, publiée avec
l'identité exacte de la piste — n'était **jamais** reconnue par le moteur
(`spotifyWebActive` nul → tout état publié ignoré).

**Correction (F3)** : `onSpotifyWebPublished` adopte un `playing` publié
quand : (1) la piste courante est une piste Spotify ; (2) l'identité
publiée est EXACTE (garde anti-faux-positif — une autre piste n'est
jamais adoptée) ; (3) le statut est `playing` (idle/paused/loading ne
lèvent jamais un verdict). L'émission est l'équivalent exact d'une
confirmation (resolved + playing + purge de la notice + progression +
trace `playback-confirmed` + diag `late=true` + persistance), et la
branche `confirmed` dé-duplique si l'adoption a déjà consumé la même
publication (une seule ligne miroir par session). La protection
anti-fausse-confirmation n'est **pas** supprimée : l'adoption exige la
même preuve qu'une confirmation (état publié par le lecteur), seulement
décalée dans le temps.

### 2.4 Limitation réelle documentée (inchangée, verrou v7)

Toutes les commandes de pont (`play`, `pause`, `next`, `previous`,
`seek`) refusées par la page sous `no-authorized-execution-surface`
correspondent à la politique réelle de Spotify : la lecture ne démarre
que par un **geste utilisateur DANS la page**. Ce refus n'est PAS
contourné (pas de clic synthétique, pas d'interception, pas d'endpoint
privé). Conséquence visible par l'utilisateur : **taper sur Lecture
dans la page est obligatoire** — c'est la seule voie d'exécution
légitime. Après un verdict d'échec, ce même tap suffit désormais (F3) :
plus besoin de relancer la lecture depuis l'app. Quand l'utilisateur ne
tape pas, le verdict d'échec est honnête et la file avance — comportement
conçu et verrouillé en v7 (`SPOTIFY_WEB_TRANSIENT_LOSS_CODES` inchangé).

---

## 3. Flux de lecture réel après corrections

1. L'utilisateur choisit une piste Spotify → l'app ouvre la vue hôte et
   charge (ou retrouve, F2) la page publique de la piste.
2. Le transport attend le handshake du document vivant (F1) et envoie
   alors les commandes planifiées ; elles sont **correlées** (session +
   séquence + identité de piste) — les protections anti-
   confirmation-obsolète (commits `1d81dd6`, `c15562b`, `2540266`) sont
   intactes, y compris pour toutes les commandes autres que `load`.
3. L'utilisateur **tape Lecture DANS la page** : la page joue et publie
   l'état réel `playing` (identité exacte).
   - Fenêtre de confirmation ouverte → confirmation normale ;
   - Fenêtre fermée (échec antérieur) → **adoption tardive** (F3).
4. L'app passe en `En lecture` **exactement** quand l'état publié le
   justifie (trace miroir `playback-confirmed` unique) ; métadonnées et
   progression suivent l'état publié.
5. Fin de piste dans la page → `ended` → avance automatique de la file
   (protection v7 conservée, testée par le test F3 n°3).
6. Toute perte de source (démontage, erreur du document) publie un
   dernier état honnête — jamais de « playing » persistant sans preuve.

---

## 4. Procédure de validation physique (téléphone, compte réel)

1. Installer l'APK `45025` (lien §7) — version affichée
   `4.5.0-test.25`, versionCode `45025`, package
   `com.souxch06.melodix`.
2. Se connecter à Spotify (si le 403 persiste : le diagnostic V19
   s'applique — vérifier « Users and Access » du Developer Dashboard).
3. Choisir n'importe quelle piste Spotify → la vue Spotify s'ouvre.
4. **Taper sur Lecture DANS la page Spotify** (obligatoire, §2.4).
5. Attendre : le son doit démarrer ET l'app doit passer en « En lecture »
   **ensemble** — c'est le couple qui prouve la lecture réelle.
6. Vérifier : métadonnées (titre/artiste/artwork), progression qui
   suit, boutons app (pause/suivant/précédent/barre), fin de piste →
   piste suivante.
7. Vérifier l'honnêteté négative : ne PAS taper Lecture dans la page →
   l'app doit rester en état d'attente/erreur honnête (jamais de
   « En lecture » sans son).

**Aucune de ces étapes n'a été exécutée ici (pas de téléphone) — voir
§1.3/§1.4.**

---

## 5. Protections préservées (vérification explicite)

- **`1d81dd6`** (confirmation réelle avant `playing`) : intact — l'unique
  source d'un `playing` moteur reste un état `playing` PUBLIÉ par la page
  (confirmation de fenêtre OU adoption tardive, même preuve).
- **`c15562b`** (anti-fausse-confirmation, états obsolètes) : intact —
  correlation session/séquence/identité de piste conservée sur toutes les
  commandes ; F6 ne retire la validation que sur `load` (commande qui
  navigue), documentée en commentaire.
- **`2540266`** (sécurisation du parcours de lecture) : intact —
  destruction WebView à l'invalidation, dernier état publié honnête au
  démontage, refus honnêtes non convertis, aucun token/secret logué.
- **v7** : codes transitoires inchangés ; avance de file sur verdict
  d'échec inchangée ; aucun mock ; aucun fallback Audius/YouTube
  réintroduit dans le parcours Spotify.
- **V17–V19** : retry borné 403, diagnostic sécurisé, traces logcat
  miroir, cycle de vie hôte — inchangés (recouverts par les 2057 tests
  de baseline restés verts).

---

## 6. Fichiers modifiés et pourquoi

| Fichier                                                                             | Changement                                                                                                                                                                                                   |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `services/playbackBackend/spotifyWebTrackTransport.ts`                              | **F1** : `waitForBridgeReadyAfterLoad()` (attente bornée du handshake post-navigation, scheduler injectable), constantes `SPOTIFY_WEB_POST_LOAD_BRIDGE_WAIT_MS`/`_POLL_MS`, invocation après `load` navigué. |
| `components/Player/SpotifyWebHostView.tsx`                                          | **F2** : `load` idempotent via `getURL()` (comparaison du chemin de piste) ; **F5** : `runtime.onLoadStart()` synchrone après `loadUrl`.                                                                     |
| `services/player.ts`                                                                | **F3** : adoption tardive dans `onSpotifyWebPublished` (identité exacte, statut `playing`, émission identique à une confirmation, diag `late=true`) + dé-duplication dans `trySpotifyWeb`.                   |
| `services/playbackBackend/SpotifyWebBackend.ts`                                     | **F6** : `load` direct (hors `runLatestCommand`), booléen de l'adaptateur = vérité, try/catch → `false`.                                                                                                     |
| `services/playbackBackend/spotifyWebMediaSessionProbe.ts`                           | **F7** : listener `message` enregistré avant le post `ready`.                                                                                                                                                |
| `services/playbackBackend/__tests__/spotifyWebTransportPostLoadBridge.unit.test.ts` | **NOUVEAU** — 3 tests F1 (navigué / jamais-ready / idempotent) avec backend + transport RÉELS et scheduler manuelle.                                                                                         |
| `components/Player/__tests__/SpotifyWebHostView.unit.test.tsx`                      | +5 tests F2/F5 (idempotence, navigation, clôture synchrone, fallback, ID mal formé) + doubles élargis (instance WebView, adaptateur, runtime).                                                               |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`                                  | +4 tests F3 (adoption, garde d'identité, `ended` → avance, anti-double-émission).                                                                                                                            |
| `package.json`, `app.config.js`                                                     | Bump `4.5.0-test.25` / versionCode `45025`.                                                                                                                                                                  |

**Commits** (branche `arena/fcdae8c6-melodix`) :

- `35b3293` — F1/F2/F5/F6/F7 + tests de régression (D8/D3)
- `137f85a` — F3 adoption tardive + tests (D2)
- `d273e12` — bump version `4.5.0-test.25/45025`
- `34aed7c` — rapport + pin workflow synchronisé (voir §7)
- (dernier commit) — version définitive du présent rapport (chiffres CI)

**HEAD de code final** : `d273e121e57edd78b18ce49569adeff5342bdeb0`
(toutes les corrections + bump) ; **HEAD final de branche** : le commit
qui contient la version définitive du présent rapport — HEAD local =
HEAD remote vérifié après le dernier push. **PR #6** : ouverte,
mergeable (base `main`, non fusionnée — aucune action sur `main`).

---

## 7. CI (honnête, runs identifiées)

- **Run `37891473419`** (commit `d273e12` — code final) : **FAILURE** à
  la step « Vérifier intégrité, installabilité et signature de l'APK » :
  `ERREUR APK: versionCode '45025' != '45024'` — le workflow pinnait
  `EXPECTED_VERSION_CODE`/`EXPECTED_VERSION_NAME` à la version V19
  (`45024`) ; le bump de cette mission n'avait **pas** synchronisé ce pin
  (mauvaise application de la convention, documentée). **Toutes les
  autres steps de la run ont PASSE** (Jest, tsc, ESLint, Prettier,
  Robolectric, Gradle + build APK) — l'échec est l'expectation de
  version, pas le code.
- **Correction** : pin du workflow mis à jour
  (`EXPECTED_VERSION_CODE: '45025'`, `EXPECTED_VERSION_NAME:
4.5.0-test.25`) dans le commit `34aed7c` (rapport + pin).
- **RUN PRODUCTRICE / FINALE : `37892926828` (commit `34aed7c`) —
  SUCCESS** — toutes les steps passées : TypeScript/ESLint/Prettier,
  Jest, Robolectric, Gradle + compilation APK, alignement 16 KiB +
  signature, **vérification intégrité/instalabilité/signature**
  (`com.souxch06.melodix`, versionCode **`45025`**, versionName
  **`4.5.0-test.25`**, 4 ABI), **installation ET lancement réel de
  l'APK sur émulateur Android 14** (smoke) et publication de
  l'artifact. (La step Release est désactivée dans le workflow —
  l'APK est un artifact de run, comme en V19.)
- **Lien APK** : `Melodix-v4.5.0-test.25-34aed7c.apk` (44,8 MiB) —
  artifact de la run `37892926828` :
  <https://github.com/Souxch06/Melodix/actions/runs/37892926828>
  (onglet « Artifacts »).
- **Run `37894416740`** (commit `3b0202c` — rapport définitif, code
  strictement identique à `34aed7c` : le diff entre les deux commits est
  **un seul fichier .md**) : FAILURE limitée à la step « Installer et
  lancer réellement l'APK sur Android 14 » — section **prototype de
  diagnostic isolé** du smoke (« aucun résultat explicite du handshake
  Spotify Web (ready/timeout) » : l'écran n'a pas affiché « Bridge:
  prêt/timeout » dans la fenêtre de polling 5×5 s sur le runner lent).
  Annotations vérifiées : la section **hôte de production du smoke a
  TOUTE PASSÉ** (host-mounted confirmé, handshake avec code honnête,
  aucun faux `playback-confirmed`) — c'est le seul code de cette
  mission ; l'échec est la classe de flake émulateur/runner-lent déjà
  documentée en V17 (run `37810103366`), pas une régression.
- La run du dernier commit de la branche re-valide le code ; elle est
  identifiée dans les checks de la PR #6.
- Runs V19 toujours valides sur leurs commits respectifs : `37837109994`
  et `37839363320` (APK `45024`).

---

## 8. Limites restantes (honnêtes)

1. **Lecture audio réelle NON vérifiée ici** — pas de téléphone ; seul un
   test physique (§4) peut confirmer le critère de réussite.
2. **403** : non ré-enquêté (hors périmètre V20) ; si la connexion échoue
   toujours sur l'APK installée, le diagnostic V19 (Users and Access du
   Dashboard, mode Développement) reste l'action manuelle à effectuer.
3. **Arrière-plan / verrouillé / Bluetooth** : non testé physiquement —
   rien n'est déclaré fonctionnel.
4. **Émulateur ≠ preuve audio** : la smoke CI (émulateur, sans compte
   Spotify et sans Widevine) ne peut produire aucune lecture réelle — elle
   valide le build, pas le son.
5. **Politique Spotify** : le tap Lecture DANS la page reste obligatoire
   (§2.4) — limitation réelle du produit Spotify, non contournable et non
   contournée.
