# Mission V17 — Lecture réelle Spotify Web : audit de la chaîne + observabilité CI

**Date** : 8 octobre 2026 · **Base** : HEAD `3cb6cbf` (V16 final) · **RÉSULTAT** :
livré — audit complet de la chaîne (aucun bug fonctionnel trouvé),
breadcrumbs logcat `[MelodixSpotifyWeb]`, section smoke CI de l'HÔTE DE
PRODUCTION (gap §13), 7 tests automatiques nouveaux, version
`4.5.0-test.22` / `45022`, CI **success** (run 37807489704) avec smoke
Android 14 de l'hôte production : `host-mounted` confirmé, handshake
explicite (`bridge_timeout` sans compte — honnête), **aucun faux playing**.

Mission : faire fonctionner la chaîne réelle
`Spotify track → PlayerController → SpotifyWebBackend → SpotifyWebHost/WebView →
Spotify Web Player → état publié → UI → MediaSession`, la rendre déterministe et
testable **sans aucun mock qui ferait croire à une lecture réelle**, et — comme
l'utilisateur ne peut pas tester physiquement — documenter exactement où la
chaîne s'arrête.

---

## 1. Audit de la chaîne (consigne §1) — verdict : chaîne complète et honnête

Chaque maillon a été lu et vérifié contre les tests (baseline
**2045 passés / 14 skipped / 0 échec** avant toute modification).

| Maillon                                                                                                     | État               | Preuve                                                                                                                                                                                                                                                                                                                                                                                            |
| ----------------------------------------------------------------------------------------------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PlayerController.playIndex` → branche Spotify (`services/player.ts`)                                       | **Fonctionnel**    | `trySpotifyWeb` : aucun `playing` avant confirmation réelle ; verdict non confirmé → code explicite ; perte transitoire ≠ échec piste (V9)                                                                                                                                                                                                                                                        |
| `port.attempt` → `attemptSpotifyWebPlayback` (`playbackBackend/*`)                                          | **Fonctionnel**    | readiness → `transport.loadTrack` (navigation `open.spotify.com/track/<id>`) → commande play **refusée** (`no-authorized-execution-surface`) → `awaitingConfirmation`                                                                                                                                                                                                                             |
| Fenêtre de confirmation                                                                                     | **Fonctionnel**    | 20 s moteur / poll 250 ms ; `confirmed` **uniquement si la page publie `playing`** ; plan = trackId EXACT, TTL 15 s, tolérance durée `max(5 s, 2 %)`                                                                                                                                                                                                                                              |
| Publication `playing` → état moteur                                                                         | **Fonctionnel**    | `emit({ status: 'playing', resolved: { provider: 'Spotify Web', … } })` ; Media3 **fermée** (délégation à la MediaSession Chromium)                                                                                                                                                                                                                                                               |
| Commandes Play / Pause / Resume / Next / Previous / Seek / Queue                                            | **Fonctionnelles** | chaque commande = `sendCommand` vers la page ; seul l'état publié fait avancer le moteur ; Next = 1 seule avance (anti-double `ended`) ; Previous = comportement existant ; Seek = commande + position publiée (source unique) ; Queue next/previous/index vérifiés                                                                                                                               |
| Bridge (handshake, validation, queueId/trackId, stale, destruction, reconnexion, reload, changement rapide) | **Fonctionnel**    | runtime reconnexion budget 3 + backoff + `manualReload` ; un événement d'une ancienne piste ne modifie JAMAIS la piste actuelle ; destruction/recréation temporaire ≠ avance de file ni « failed » définitif                                                                                                                                                                                      |
| **Porte d'activation en production**                                                                        | **OUVERTE**        | `app/_layout.tsx` → `ensureProductionSpotifyWebActivation()` : enregistre la preuve de validation physique (phone-run 2026-10-07 + smoke CI run 37577095621 + `docs/SPOTIFY-WEB-PHYSICAL-TEST.md`) puis `setSpotifyWebPlaybackEnabled(true)` ; préférence `spotifyWebPlayback` = `true` par défaut ; idempotent ; seul point de levée (le lecteur n'importe pas le module feature → guard intact) |
| `failedKeys`                                                                                                | **Sain**           | purgé à `playQueue` + `restoreSession`, retiré au playback réel — pas de bannissement permanent                                                                                                                                                                                                                                                                                                   |
| MediaSession / Mini / Full / Context                                                                        | **Conformes**      | `mediaBridge.ts` : piste Spotify → Media3 fermée, projection via MediaSession Chromium ; l'UI reflète l'état moteur, jamais « lecture en cours » avant confirmation                                                                                                                                                                                                                               |

**Aucun mock de lecture dans la production** : aucun timer de progression
simulé, aucun faux `playing`, `play()` accepté ne produit jamais un `playing`
(c'est la publication réelle de la page qui le déclenche).

### Points d'arrêt exacts de la chaîne (documentés, non des bugs)

1. **Démarrage de lecture = geste utilisateur DANS la WebView.** La commande
   play émise par l'app est **toujours refusée** par la page
   (`no-authorized-execution-surface`) : c'est un choix de conception imposé
   par la mission (DOM/clics synthétiques/DOM-interaction interdits). La page
   s'autorise à jouer uniquement sur interaction utilisateur dans la page
   (bouton lecture de Spotify Web).
2. **Fenêtre de confirmation 20 s** : si la page ne publie pas `playing` dans
   la fenêtre → échec borné `confirmation-timeout` (code remonté, jamais de
   `playing`).
3. **Premier login** (`accounts.spotify.com`) : le flux de connexion excède la
   fenêtre → échec `confirmation-timeout` (comportement attendu et documenté).
4. **CI sans compte Spotify** : aucune tentative de lecture réelle n'est
   possible → la CI valide l'hôte (montage/handshake/bridge) et l'**absence de
   faux playing** (ci-dessous), pas une lecture.
5. **Pas de téléphone** : aucun test physique possible — see §4.

---

## 2. Travail livré (consignes §12, §13, §14)

### 2.1 Breadcrumbs logcat de la chaîne — tag contrôlé `[MelodixSpotifyWeb]`

`services/spotify/devLog.ts` : nouvelle fonction `spotifyWebTrace(step, detail?)`
(même garde sensible que les traces OAuth : token/secret/Bearer masqués,
detail borné). L'APK `assembleRelease` n'est pas debuggable (pas de `run-as`)
et `appendDiagLog` n'écrit que le fichier applicatif : le logcat est la SEULE
observabilité CI de l'hôte — les lignes existent déjà (`[SpotifyAuth]` dans le
smoke), la convention est respectée.

| Ligne                                                                  | Émise par                                                       | Signification                                                                                                                                                                                                                                        |
| ---------------------------------------------------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `host-mounted`                                                         | `SpotifyWebHostView` (effet build)                              | L'hôte de **production** est monté (WebView hors écran chargée)                                                                                                                                                                                      |
| `host-unmounted`                                                       | `SpotifyWebHostView` (cleanup)                                  | L'hôte est démonté                                                                                                                                                                                                                                   |
| `<code de diagnostic>` (19 codes de l'enum `SpotifyWebDiagnosticCode`) | `SpotifyWebHostView` (callback `report`)                        | Miroir logcat de l'événement runtime (`webview_loading`, `webview_loaded`, `bridge_ready`, `bridge_timeout`, `network_error`, `http_error`, `web_player_inaccessible`, `navigation_blocked`, `renderer_destroyed`, `webview_reconnect_exhausted`, …) |
| `bridge-state`                                                         | `SpotifyWebHostView` (onMessage)                                | **Un** état publié par la page a été **accepté** par le backend — preuve du pipeline page → app (1 ligne par document, re-ouverte à `onLoadStart`)                                                                                                   |
| `playback-confirmed`                                                   | `services/player.ts` (confirmation réelle)                      | **La seule ligne qui accompagne un `playing` moteur** : la page a réellement publié `playing` pour cette piste                                                                                                                                       |
| `playback-error code=<code>`                                           | `services/player.ts` (verdict non confirmé + perte transitoire) | Verdict réel non confirmé, code contrôlé remonté tel quel                                                                                                                                                                                            |

### 2.2 Smoke CI : section « Hôte Spotify Web de PRODUCTION » (§13)

`scripts/smoke-test-android-apk.sh` — après le 1ᵉʳ lancement (avant le
prototype), 4 vérifications sur le logcat (snapshot conservé dans un fichier
malgré les `logcat -c` des scénarios OAuth) :

1. **`host-mounted` REQUIS** — absent après ~45 s + 15 s de sondes →
   **FAIL** (l'hôte de production ne se monte pas).
2. **Résultat du handshake EXPLICITE** : `bridge_ready` → notice ;
   `bridge_timeout|network_error|http_error|web_player_inaccessible|navigation_blocked|renderer_destroyed|webview_reconnect_exhausted`
   → warning non bloquant (comportement honnête sans compte) ; aucun code
   après 30 s → **FAIL** (stall non géré).
3. **`bridge-state`** : présent → notice (pipeline page → app prouvé) ;
   absent → warning (attendu sans compte).
4. **Aucun `playback-confirmed`** avant toute interaction — présent →
   **FAIL « FAUX PLAYING »**.

Et **en fin de run** (toute la durée, snapshot + logcat courant) :

- `playback-confirmed` présent → **FAIL « FAUX PLAYING »** (sans compte
  Spotify, un `playback-confirmed` prouverait un `playing` non publié par la
  page).
- Absent → notice explicite : « aucun faux playing ; la lecture RÉELLE
  Spotify Web reste NON DÉMONTRÉE en CI (test physique : non effectué) ».
- `::warning` permanent en sortie de run : **PLAYBACK SPOTIFY WEB RÉEL NON
  TESTABLE IN CI** (pas de compte, pas d'interaction possible dans la page) —
  consigne §13 : l'indiquer clairement, pas de faux test positif.
- Lignes ajoutées au `GITHUB_STEP_SUMMARY` (hôte production + lecture réelle
  non testable).

Le prototype existant (`melodix://settings/spotify-web-diagnostic`) reste
couvert séparément : c'est un écran settings **distinct** de l'hôte de
production (celui-ci est monté à la racine, hors écran).

### 2.3 Tests automatiques nouveaux (7)

| Suite                                                          | Tests | Contrat prouvé                                                                                                                                                                                                                           |
| -------------------------------------------------------------- | ----- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `components/Player/__tests__/SpotifyWebHostView.unit.test.tsx` | 5     | `host-mounted`/`host-unmounted` (cycle de vie observable) ; inactif → aucune trace ; chaque code diagnostic du runtime est miroir ; `bridge-state` 1×/document (re-ouvert après `onLoadStart`) ; message ignoré → pas de preuve inventée |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`             | 2     | confirmation réelle → exactement **une** ligne `playback-confirmed` (+ `playing` moteur) ; verdict non confirmé → `playback-error code=confirmation-timeout`, **jamais** `playback-confirmed`, jamais `playing`                          |

Les tests existent déjà et restent verts (§12 mappé) : play→pas de playing
immédiat→publish→playing, pause, resume, ended (1 seul → 1 avance ; 2 → pas de
double saut), stale event, destruction WebView (pas d'avance), retry (même
piste), seek (commande + position publiée), queue next/previous/index,
MediaSession projection (playing/paused/metadata/position/duration).

### 2.4 Version

Code production modifié (`SpotifyWebHostView.tsx`, `player.ts`,
`devLog.ts`) → bump effectif : **`4.5.0-test.21/45021` → `4.5.0-test.22/45022`**
(`app.config.js`, `package.json`, `__mocks__/expo-constants.ts`, 2 tests
settings, workflow `EXPECTED_VERSION_CODE/NAME`).

---

## 3. Gates exécutées

| Gate                                         | Résultat                                                                                                                                                              |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `npx tsc --noEmit`                           | OK (0 erreur)                                                                                                                                                         |
| `npx eslint` (fichiers modifiés)             | OK (0 finding)                                                                                                                                                        |
| `npx prettier --check` (fichiers modifiés)   | OK                                                                                                                                                                    |
| `npx jest` (suite complète)                  | **2052 passés / 14 skipped / 0 échec** (baseline 2045 + 7 nouveaux)                                                                                                   |
| `sh -n scripts/smoke-test-android-apk.sh`    | OK (POSIX)                                                                                                                                                            |
| CI GitHub Actions (build + smoke Android 14) | **SUCCESS** — run `37807489704` (17m48s) ; step « Installer et lancer réellement l'APK sur Android 14 » success ; APK `versionCode=45022` `versionName=4.5.0-test.22` |

---

## 4. Classification finale (consigne §14)

### ✅ FONCTIONNEL (conçu, audité, couvert par tests unitaires)

- Chaîne complète `playIndex → trySpotifyWeb → attempt → loadTrack →
awaitingConfirmation → confirmed → playing` : **`playing` moteur uniquement
  après publication réelle `playing` par la page** (trackId exact, tolérance
  durée).
- Commandes Play, Pause, Resume, Next (1 seule avance), Previous, Seek
  (commande envoyée au backend, position publiée source unique), Queue
  (next/previous/index).
- Bridge : handshake, validation, queueId/trackId, stale events (une ancienne
  piste ne modifie jamais la piste actuelle), destruction/recréation WebView
  (pas d'avance de file, pas de « failed » définitif, reconnexion budget 3 +
  backoff + `manualReload`), reconnexion/reload/changement rapide.
- États honnêtes : échec = code explicite remonté ; perte transitoire ≠
  échec piste (V9) ; `failedKeys` sans bannissement permanent.
- PlayerController = source de vérité native ; pistes Spotify = Spotify Web
  uniquement (aucun fallback Audius/YouTube d'une piste Spotify).
- MediaSession : projection via MediaSession Chromium (Media3 fermée pour une
  piste Spotify) ; UI reflète l'état moteur.
- **Porte d'activation production OUVERTE** (bootstrap idempotent avec preuve
  documentée ; préférence défaut `true`).

### 🤖 TESTÉ AUTOMATIQUEMENT

- **2052 tests Jest passés** dont les 7 nouveaux du §2.3 et la couverture §12
  ci-dessus (V8/V9/Playlist32/mediaBridgeV9/playbackBackend).
- Smoke CI (émulateur Android 14, APK release) : installation, versionCode,
  deep-links OAuth warm/cold A/B, prototype Spotify Web (handshake, Widevine,
  probe commande, bg/retour), MelodixMediaService FGS + notification +
  MediaSession — **plus** la nouvelle section hôte production (montage
  requis, handshake explicite, bridge-state, **aucun faux playing**).

### 📱 TESTÉ PHYSIQUEMENT

**NON APPLICABLE — non effectué.** Aucun téléphone disponible et l'utilisateur
ne peut pas tester physiquement. **Aucune prétention au background playback
physique** (écran verrouillé/casque/Bluetooth) n'est faite au-delà de la
projection MediaSession validée en CI.

### ⚠️ NON TESTÉ (limites externes, explicitement documentées)

- **Lecture réelle Spotify Web en CI** : pas de compte Spotify ni d'interaction
  utilisateur possible dans la page WebView → la CI ne valide PAS une lecture
  (smoke le déclare explicitement : « PLAYBACK SPOTIFY WEB RÉEL NON TESTABLE
  IN CI »). Le contrat de confirmation (publication `playing` par la page)
  reste validé par les tests unitaires du moteur et de l'hôte.
- **Lecture réelle avec compte Premium** : dernière validation humaine =
  phone-run 2026-10-07 (preuve référencée dans le bootstrap) ; non re-testable
  ici.
- **Premier login dans la WebView** : dépasse la fenêtre de confirmation de
  20 s → échec `confirmation-timeout` (comportement documenté, §1.4-3).
- **Résilience réseau réelle** (coupures longues, roaming) : couverte par
  design (reconnexion bornée) et tests, non re-testée physiquement.

---

## 5. Comment lire la sortie du smoke (V17)

```
::notice  title=Hôte Spotify Web (production)::host-mounted confirmé en logcat …
::notice  title=Handshake hôte production::bridge_ready …
::notice|warning title=Handshake hôte production::handshake non prêt (codes: …)
::notice|warning title=Bridge hôte production::bridge-state …
::notice  title=Fake playing (run complet)::aucun playback-confirmed …
::warning title=Lecture Spotify Web (CI)::PLAYBACK SPOTIFY WEB RÉEL NON TESTABLE IN CI …
```

- `host-mounted` absent → **la CI échoue** (hôte de production mort).
- Handshake sans résultat explicite → **la CI échoue** (stall non géré).
- `playback-confirmed` présent → **la CI échoue** (faux playing).
- Tout le reste sans compte Spotify est attendu et honnêtement signalé.

**Résultat observé (run `37807489704`, Android 14, sans compte Spotify)** :

```
✓ host-mounted confirmé en logcat — la WebView open.spotify.com (hors écran) est montée à la racine de l'app
⚠ handshake non prêt (codes: bridge_timeout) — aucune capacité de lecture revendiquée (comportement honnête sans compte Spotify)
✓ aucun playback-confirmed sur tout le run (aucun faux playing)
```

L'hôte de production monte bien, le runtime conclut le handshake par un
`bridge_timeout` honnête (normal sans compte : la page ne complète pas la
poignée de main du player), et aucun `playing` inventé n'apparaît. C'est
exactement le comportement que la mission demandait d'observer — **sans
prétendre à une lecture réelle**.

## 6. Fichiers modifiés (13)

| Fichier                                                                                                                                                                                                          | Changement                                                                                                        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `services/spotify/devLog.ts`                                                                                                                                                                                     | `spotifyWebTrace` (+ garde sensible)                                                                              |
| `services/index.ts`                                                                                                                                                                                              | export `spotifyWebTrace`                                                                                          |
| `components/Player/SpotifyWebHostView.tsx`                                                                                                                                                                       | traces `host-mounted`/`host-unmounted`, miroir codes runtime, `bridge-state` 1×/document                          |
| `services/player.ts`                                                                                                                                                                                             | `playback-confirmed` (confirmation réelle) / `playback-error code=…` (verdicts non confirmés + perte transitoire) |
| `components/Player/__tests__/SpotifyWebHostView.unit.test.tsx`                                                                                                                                                   | 5 tests traces hôte (doubles étendus : options runtime, résultat bridge, props WebView)                           |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`                                                                                                                                                               | 2 tests traces moteur (confirmed unique / error sans confirmed)                                                   |
| `scripts/smoke-test-android-apk.sh`                                                                                                                                                                              | section hôte production + vérification finale faux playing + step summary                                         |
| `app.config.js` · `package.json` · `__mocks__/expo-constants.ts` · `screens/__tests__/SettingsScreen.unit.test.tsx` · `screens/__tests__/SettingsSubScreens.unit.test.tsx` · `.github/workflows/android-apk.yml` | bump `4.5.0-test.22` / `45022`                                                                                    |

**Règles respectées** : aucun mock de lecture, aucun faux `playing`, aucun
timer simulé, aucun fallback Spotify→Audius/YouTube, aucun cookie/token
Spotify Web lu, aucun endpoint privé, aucun contournement DRM/EME,
`play()` accepté ≠ lecture, auth/OAuth intouché, protections V7–V16
conservées, aucune prétention physique sans appareil.
