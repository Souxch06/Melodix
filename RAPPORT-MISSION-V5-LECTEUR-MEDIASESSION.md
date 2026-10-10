# RAPPORT MISSION V5 — LECTEUR RÉEL MELODIX + ANDROID MEDIASession

**Date** : 6 octobre 2026 — **Branche** : `arena/fcdae8c6-melodix` — **PR** : #6

---

## 1. Synthèse honnête

La mission demandait de « finaliser le lecteur réel » : audit point par point des
critères §1–§16, complétion des tests obligatoires §17, gates §18, build APK,
rapport en 5 volets.

**Constat d'audit** : l'architecture exigée par la mission **existe déjà et est
intègre** — construite et verrouillée lors des phases précédentes (Phase 1, 2,
5A, 5C, 5D, I-1, I-5, M-1, M-7) :

- `PlayerController` (`services/player.ts`, 2397 L) : 9 états (`idle / loading /
resolving / buffering / playing / paused / ended / error / unavailable`),
  `playing` publié **uniquement** après confirmation runtime réelle
  (`markPlaybackStarted` + `isPlaying` vrai, jamais `play() → playing`),
  progression = `positionMillis` réels expo-av (aucun timer), tokens de race
  (`playToken`, tag `soundTrackId` sur chaque callback), transport sérialisé
  avec intentions (`transportIntent` / `transportQueue`).
- Cascade **Audius → YouTube** uniquement après échec réel exploitable
  (match rejeté / flux mort / charge échouée / lecture échouée) — **jamais de
  fallback si Audius joue vraiment**.
- File d'attente cohérente (ajout/dédup/suppression/déplacement/play-next),
  `next`/`previous` (restart 3 s), repeat `off/all/one`, shuffle = permutation
  fixée pour la session, morceau courant épinglé.
- Historique : `recordPlay` **uniquement** sur lecture confirmée.
- Persistance `playbackSession.v1` : file fenêtrée (200), écriture immédiate
  (pause/changement de piste/réglages) + ponctuelle (AppState background),
  purge sur stop explicite, restauration SANS prétendre jouer (boot = dormance,
  carte « Reprendre »).
- `MediaSession` Android (`services/mediaBridge.ts`, 377 L) : commandes
  système (play/pause/next/previous/seek/stop) → **mêmes méthodes publiques**
  du PlayerController ; projection exacte (8 champs, zéro clé sensible, dédup
  1 s) ; anti-autoplay (aucun appel natif avant un `playing` réel) ;
  `audio_becoming_noisy` → pause ; fermeture sur stop ; handoff Spotify Web
  (session Media3 close, port Chromium prend le relais).
- Mini-player + full player : `usePlayer()` = relais du **singleton moteur**
  (PlayerContext) — un seul état de lecture pour toute l'UI.

**Aucune réimplémentation.** Le travail réel de cette mission : identification
des **3 seuls trous de tests** de la liste §17, ajout de 5 tests ciblés,
bump de version pour un APK physiquement distinguable, gates, CI, rapport.

**Aucun mock ne fait croire que la lecture fonctionne** : les mocks restent à
la frontière native (expo-av, AsyncStorage, SecureStore, AppState) — même
dans les tests, l'état `playing` n'est publié que sur le statut confirmé par
le mock du runtime, jamais sur la résolution d'une promesse.

---

## 2. Audit des critères §1–§16

| §   | Critère                                                                             | Implémentation                                               | Tests existants                                                                                                        |
| --- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| 1   | PlayerController source de vérité, 9 états                                          | `services/player.ts`                                         | `player.unit.test.ts` (131 it) dont « engine's 9 states »                                                              |
| 2   | Races (double play, play→pause, changement pendant résolution, événements périmés)  | tokens `playToken`/`soundTrackId`                            | « Phase 1 — critical race » (10 it) + « Phase 5D » (7 it)                                                              |
| 3   | next/previous, repeat off/all/one, shuffle déterministe sans répétition immédiate   | `advanceAuto`/`advanceManual`/`buildShuffledOrder`           | « Phase 2 — advanced queue » (24 it) + **2 nouveaux (ordre stable de session, shuffle off)**                           |
| 4   | Queue cohérente (échec piste, échec fallback, sortie/retour app, arrière-plan)      | §1 + persistance AppState                                    | 24 it file + « Phase 1/5D » + **2 nouveaux (background/foreground)**                                                   |
| 5   | Fallback Audius→YouTube uniquement après échec réel ; jamais si Audius joue         | `trackResolver.ts`                                           | « cascade Audius → YouTube » (7 it), dont « Audius OK → YouTube JAMAIS recherché »                                     |
| 6   | Source réellement jouée tracée (provider/sourceId/titre/artiste/durée/état)         | `state.resolved` + `status`                                  | « le morceau est lu, la source est tracée » + borne NaN/infini                                                         |
| 7   | Mini + full player = MÊME état                                                      | `usePlayer()` (PlayerContext)                                | `PlayerContext.unit.test.tsx` (12 it : relais, 1 souscription, actions directes) + `MiniPlayer` (19 it) + `FullPlayer` |
| 8   | Persistance queue/piste/position/shuffle/repeat ; restauration sans prétendre jouer | `playbackSession.ts` v1                                      | 6 it persistance/restore + **3 nouveaux (restauration = 1 lecteur, background, ordre shuffle)**                        |
| 9   | Historique seulement si lecture confirmée                                           | `markPlaybackStarted` → `recordPlay`                         | « recordPlay uniquement sur isPlaying confirmé »                                                                       |
| 10  | MediaSession : 2 sens, aucun 2e moteur, notification = piste réelle                 | `mediaBridge.ts`                                             | `mediaBridge.unit.test.ts` (36 it) dont « §5 complet : play→pause→play→next→previous→seek→stop »                       |
| 11  | Background (10 étapes)                                                              | `staysActiveInBackground` + audioMode + persistance AppState | « audio mode ONCE per change » + **2 nouveaux (AppState)** + smoke CI                                                  |
| 12  | Casque/Bluetooth (câblage vérifiable)                                               | `audio_becoming_noisy` → pause                               | 4 it noisy + 1 it teardown — **événement physique non testé (voir §8)**                                                |
| 13  | Spotify Web : ne PAS faire                                                          | non touché (livré v3, double gate CLOSED)                    | `playerSpotifyWeb.unit.test.ts` (19 it) intacts                                                                        |
| 14  | Tests obligatoires §17                                                              | —                                                            | **complétés** : 5 nouveaux tests (fichier ci-dessous)                                                                  |
| 15  | Gates §18                                                                           | —                                                            | **§6 de ce rapport**                                                                                                   |
| 16  | Git §19                                                                             | —                                                            | **§4 de ce rapport**                                                                                                   |

---

## 3. Travaux effectués cette mission

**1 commit de code** — `de4b9f5` `test(player): fiabilité de session mission v5 + bump 4.5.0-test.8`
(7 fichiers, +264/−8) :

1. **`services/__tests__/playerSessionReliability.unit.test.ts`** (nouveau, 256 L,
   5 tests) — les 3 chemins de la liste §17 qui n'avaient pas de test dédié :

   - **§4 arrière-plan pendant lecture** : transition AppState `background` →
     session persistée (file, index, position 45 s, shuffle, repeat) sans
     attendre le tick 8 s.
   - **§4 retour au premier plan** : transition `active` → aucun
     rechargement, **un seul** `Sound` (jamais de 2e `createAsync`), lecture
     continue à la même position.
   - **§10 restauration sans double lecteur** : session sauvegardée en
     arrière-plan → moteur remis à zéro (nouveau processus) → `restoreSession`
     → **exactement un** lecteur créé, `playing` confirmé par le runtime,
     position 12 s restaurée.
   - **§4 shuffle déterministe** : permutation complète, morceau courant en
     tête, **jamais de répétition immédiate**, même permutation à chaque
     `next()` (ordre stable pendant la session — jamais de re-tirage).
   - **§4 shuffle off** : ordre remis à `null`, file originale intacte, index
     conservé.

2. **Bump 4.5.0-test.8 / versionCode 45008** (8 références sur 6 fichiers :
   `package.json`, `app.config.js` ×2, `__mocks__/expo-constants.ts`,
   `.github/workflows/android-apk.yml` ×2,
   `screens/__tests__/SettingsScreen.unit.test.tsx`,
   `screens/__tests__/SettingsSubScreens.unit.test.tsx`) — l'APK est
   physiquement distinguable de l'APK v4 (4.5.0-test.7) pour le test sur
   appareil.

---

## 4. Git

- **Branche** : `arena/fcdae8c6-melodix` (aucune autre branche touchée)
- **Ancien HEAD** : `ab6fa3b` (docs v4) — **Nouveau HEAD** : le commit de
  rapport final sur `de4b9f5` (code)
- **Commits** :
  1. `de4b9f5` — code : 5 nouveaux tests + bump 4.5.0-test.8 (7 fichiers)
  2. `6efea53` — `docs: rapport final mission v5` (ce fichier)
  3. `0dca655` — `chore: formatting prettier rapport mission v5`
  4. `af55095` — `fix(ci)`: retry des installations dans le smoke (la run
     37532126463 a échoué sur une mémoire transitoire du runner GitHub —
     voir §6) — **aucun commit vide**
- **Push** : `git push origin arena/fcdae8c6-melodix` réussi ; **PR #6**
  mise à jour
- **HEAD final ≠ `ab6fa3b`** ✓ (du code a réellement été modifié : 5 nouveaux
  tests + version + durcissement CI)

---

## 5. Gates locales (chiffres exacts)

| Gate                                                    | Résultat                                                | Détail                                                                                       |
| ------------------------------------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| **Jest** (`npx jest --runInBand`)                       | ✅ **1856 passed / 0 failed / 14 skipped** (1870 total) | 145/145 suites passées (14 skipped). Baseline `ab6fa3b` : 1851 → **+5** (les nouveaux tests) |
| **TypeScript** (`tsc --noEmit`)                         | ✅ **0 erreur**                                         | —                                                                                            |
| **ESLint** (`expo lint`)                                | ✅ **0 erreur / 0 warning**                             | —                                                                                            |
| **Prettier** (`prettier --check **/*.{ts,tsx,json,md}`) | ✅ **OK** — tous les fichiers conformes                 | —                                                                                            |
| Build Android local                                     | ⚠️ **impossible**                                       | environnement sans Java/SDK/adb (ci-dessous, §9) — fait en CI                                |
| Installation/lancement local                            | ⚠️ **impossible**                                       | idem — fait en CI (émulateur)                                                                |

---

## 6. CI

### Run `37529857217` (code `de4b9f5`) : **SUCCESS (16 min 57)**

- Job **« Construire l'APK »** : success
- **Smoke sur émulateur Android 14 x86_64** : « installation + prototype
  WebView + cycle arrière-plan/retour + service foreground + MediaSession +
  notification + deep-link OAuth (A et B) réussis sur Android 14 x86_64
  (pid=6479) »
  - cycle arrière-plan/retour ✓
  - service foreground (lecteur en arrière-plan) ✓
  - session MediaSession + notification ✓
  - deep-links OAuth A/B : **wiring** (transaction PKCE retrouvée en
    SecureStore, séquence ordonnée en logcat) — PAS un login Spotify réel
    (aucun compte utilisable dans GitHub Actions — déclaré tel quel dans la
    CI)

### Run `37532126463` (docs `0dca655`) : \*\*failure — infrastructure, pas

code\*\*

- Le build APK a réussi ; l'échec est survenu au push d'installation sur
  l'émulateur : `error: fork failed: Out of memory Performing Push Install`
  — mémoire transitoire du runner GitHub Actions (le même code avait passé
  intégralement la run précédente).
- **Correctif** : retry (3 essais, 10 s d'écart) des deux `adb install` dans
  `scripts/smoke-test-android-apk.sh` (commit `af55095`) — aucune
  vérification modifiée : un échec après 3 essais reste un échec de l'APK,
  pas du runner.

### Run `37534108220` (HEAD final `af55095`) : **SUCCESS (14 min 20)**

- Job **« Construire l'APK »** : success
- Smoke Android 14 x86_64 : « installation + prototype WebView + cycle
  arrière-plan/retour + service foreground + MediaSession + notification +
  deep-link OAuth (A et B) réussis sur Android 14 x86_64 (pid=6502) »
- L'APK produite est **bit-identique** à celle de la run `37529857217`
  (même SHA-256 ci-dessous) : le commit `af55095` ne touche que le script
  smoke et le rapport.

---

## 7. APK

| Champ        | Valeur                                                                                                                                                   |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Nom          | `Melodix-v4.5.0-test.8-af55095.apk` (artefact de la run `37534108220` ; version équivalente `…-de4b9f5.apk` sur la run `37529857217`, bit-identique)     |
| Version      | **4.5.0-test.8** / versionCode **45008**                                                                                                                 |
| Taille       | **47 001 364 octets** (≈ 47 Mo ; 89 Mo non compressé)                                                                                                    |
| **SHA-256**  | `d96f16289fd7425975cd60b59487c723a5735ad853280cbd9ab71efb47440ff0`                                                                                       |
| Package      | `com.souxch06.melodix` (signature V3, certificat `fac61745…b9c` identique aux versions précédentes)                                                      |
| ABIs         | `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`                                                                                                              |
| SDK          | minSdk 23 / targetSdk 34 / compileSdk 34                                                                                                                 |
| Installation | **vérifiée en CI** (émulateur Android 14) — pas de téléphone dans cet environnement : à installer manuellement depuis l'artefact de la run `37529857217` |
| Lancement    | **vérifié en CI** (cold + warm, pid=6479)                                                                                                                |
| Nature       | build de test (`publish_test_apk` désactivé — pas de release AAB)                                                                                        |

---

## 8. SÉPARATION STRICTE DES NIVEAUX DE PREUVE

### A. FONCTIONNEL (implémenté, câblé, code lisible)

- 9 états du PlayerController ; `playing` **uniquement** sur confirmation
  runtime (`isPlaying` vrai) — jamais `play() → playing`, jamais de timer de
  progression
- Races contrôlées : double play, play→pause immédiat, changement pendant
  résolution, événements périmés rejetés (`playToken` + `soundTrackId`)
- `next`/`previous` (restart après 3 s), repeat `off/all/one`, shuffle
  déterministe par session sans répétition immédiate
- File : ajout/dédup/suppression/déplacement/play-next/clear, cohérente sur
  échec de piste et échec de fallback
- Fallback Audius→YouTube **uniquement** après échec réel exploitable ;
  jamais si Audius joue vraiment
- Historique écrit uniquement sur lecture confirmée
- Persistance v1 : file fenêtrée 200, écritures immédiates + AppState
  background, purge sur stop, restauration sans autoplay
- MediaSession : commandes système → mêmes méthodes moteur ; projection
  exacte de la piste réelle (titre/artistes/album/pochette/durée/position),
  zéro clé sensible, dédup 1 s, anti-autoplay, fermeture sur stop,
  `becoming_noisy` → pause
- Mini + full player alimentés par le même singleton moteur (un seul état)

### B. TESTÉ AUTOMATIQUEMENT (Jest 1856/0 — logique, pas appareil)

- **PlayerController** : play/pause/seek/loading/buffering/playing/paused/
  ended/error/unavailable + races (≈131 it dont 9 états explicitement
  couverts, 17 it de races, 8 it buffering/createAsync en vol)
- **Queue** : next/previous/repeats/shuffle/file vide/suppression/reorder/
  play next (24 it) + 2 nouveaux (ordre stable, shuffle off)
- **Resolver** : Audius OK (YouTube jamais cherché), Audius fail→YouTube,
  stream mort→YouTube, les deux en panne→skip propre, throw→YouTube, cache
  négatif seulement prouvé, aucun faux fallback en lecture (12 it)
- **Persistence** : save/restore/file/courant/shuffle/repeat + **5 nouveaux**
  (background/foreground, restauration = 1 lecteur, ordre shuffle stable)
- **MediaSession** : 6 handlers, liaison PlayerController, dédup,
  anti-autoplay, noisy, teardown, zéro boucle, Android 13 permission,
  handoff Spotify Web (36 it)
- **UI** : PlayerContext (relais, 1 souscription, actions directes, 12 it),
  MiniPlayer (19 it), FullPlayer, DragSlider, QueueActionMenu,
  ResumeSessionCard

### C. TESTÉ SUR ÉMULATEUR (CI smoke, Android 14 x86_64)

- Installation de l'APK 45008, cold/warm start
- **Cycle arrière-plan/retour** de l'app
- **Service foreground** démarré (lecteur en arrière-plan)
- **Session MediaSession active + notification** affichée
- Deep-links OAuth (wiring)
- ⚠️ **Limite** : la smoke vérifie le **câblage** (processus vivant, service
  et notification présents) — elle n'analyse **pas** le flux audio (aucun
  « son audible » prouvé en CI).

### D. TESTÉ PHYSIQUEMENT

- (hérité v3, confirmé par l'utilisateur) : **login Spotify réel +
  lecteur Spotify Web** sur téléphone physique.
- **Cette mission : rien.** Aucun téléphone n'est disponible dans cet
  environnement. Le chemin audio réel **Audius/YouTube n'a PAS été confirmé
  sur appareil physique dans cette mission.**

### E. NON TESTÉ

- **Audio réel sur appareil physique** (débit/qualité des streams
  Audius/YouTube, latence de résolution) → à valider par l'utilisateur avec
  l'APK 4.5.0-test.8
- **Arrachement casque** (`audio_becoming_noisy`) sur appareil — le
  câblage est testé automatiquement, l'événement physique non
- **Bluetooth** (connexion/déconnexion/route audio) — géré nativement par
  Android, non testé (pas de périphérique ici)
- **Concurrence Audio Focus réelle** (autre app) — le chemin de
  synchronisation (statut pause expo-av → état `paused`) est testé
  automatiquement ; l'événement physique non
- **Login Spotify réel en CI** (pas de compte) — wiring seul
- **DRM/Widevine** — hors scope (l'app ne lit aucun contenu DRM)
- Émulateur ≠ preuve complète (pas de jack, pas de Bluetooth, codecs
  software sur x86_64)

---

## 9. LIMITES

1. **Pas d'environnement Android local** : ni Java, ni SDK, ni adb, ni KVM
   dans cet environnement → aucun build ni émulateur local ; tous les
   résultats Android proviennent de la CI GitHub (émulateur x86_64
   Android 14).
2. **La smoke CI ne mesure pas le son** : « MediaSession OK / service
   foreground OK » = processus + service + notification, pas de preuve
   d'audio audible. C'est la raison pour laquelle l'APK doit être installé
   sur un vrai téléphone pour la validation finale.
3. **x86_64 ≠ ARM** : codecs, Bluetooth, jack casque absents de l'émulateur
   CI.
4. **Spotify Web** : hors scope de cette mission (livré et validé
   physiquement en v3 ; double gate conservé, CLOSED par défaut) — aucun
   endpoint privé, aucun cookie, aucune interception.
5. **Borne catalogue 500** (mission v4) : inchangée, documentée.
6. Les tests Jest/CI verts **ne prouvent pas** la lecture audio physique —
   c'est la règle « jamais un test mocké → test physique » appliquée.

---

## 10. Protocole de validation physique (à l'utilisateur)

Avec l'APK `Melodix-v4.5.0-test.8-de4b9f5.apk` :

1. Installer (cocher « installer les apps inconnues »), lancer.
2. Chercher un titre → lancer la lecture (le moteur essaie Audius, puis
   YouTube si échec).
3. Vérifier : mini-player (titre/artiste/progression **réelle**), full player
   (même état), notification (piste réelle + contrôles), écran verrouillé.
4. Pause/lecture/next/previous **depuis la notification** — l'app et la
   notification doivent rester cohérentes.
5. Verrouiller l'écran → la lecture doit continuer ; déverrouiller → état
   identique.
6. Passer en arrière-plan → revenir → file + position intactes.
7. Tuer l'app (swipe) → relancer → carte « Reprendre » avec la bonne piste et
   position → tap → **un seul** lecteur, lecture depuis la position.
8. Arracher le casque (si branché) → pause immédiate.
9. Stop explicite → notification fermée, aucune carte « Reprendre ».

Tout écart constaté → le corriger en suivant mission, avec la même règle :
jamais « appel réussi → lecture réussie ».
