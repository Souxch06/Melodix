# Mission v9 — Spotify Web sur Android : perte de source, récupération, états honnêtes

**Date** : 7 octobre 2026 · **Base** : HEAD `191431e` (v8) · **RÉSULTAT** : livré —
3 correctifs de production, 25 tests automatiques nouveaux, version
`4.5.0-test.13` / `45013`, CI **success** avec smoke sur émulateur Android 14.

La mission demandait de rendre le pipeline Android
(`Spotify Web → SpotifyWebRuntime → Bridge → PlayerController → MediaSession →
Notification → écran verrouillé/casque/Bluetooth`) résistant aux pertes
réelles : destruction/recréation de la WebView, perte/reconnexion du bridge,
foreground↔background, interruption audio, commandes MediaSession — **sans
prétendre à un fonctionnement physique que seul un téléphone réel peut
valider**.

## 1. Audit du pipeline existant (consigne §1)

Tout le chemin dure est **déjà présent et testé** (v6/v7/v8) ; l'audit a
vérifié maillon par maillon :

- **Infrastructure Media3** (Kotlin) : `MelodixMediaService` (foreground
  service, MediaSession, notification), `MelodixMediaController` (reçoit
  `onPlay/onPause/onSeekTo/onFastForward/onRewind/onNext/onPrevious` et les
  relaie au navigateur), `VirtualMediaPlayer` (projet l'état confirmé du
  lecteur vers Media3), `MelodixMediaModule`. **Réutilisés, non remplacés.**
- **Écran verrouillé / Bluetooth / casque** : aucune logique séparée — les
  commandes MediaSession passent par le `MelodixMediaController` puis le
  **même PlayerController** (pas de 2ᵉ lecteur).
- **Interruption audio / noisy** : `onAudioBecomingNoisy` → pause réelle via
  le même controller ; testé (suite Kotlin `Noisy`, Robolectric).
- **Côté JS** : `mediaBridge.ts` (relais événements/commands + mapping
  Media3), `spotifyWebRuntime.ts` (reconnexion budget 3 + backoff, phases
  `loading/ready/recovering/failed`), `SpotifyWebHostView.tsx` (overlay,
  libellés de pont), `player.ts` (PlayerController).
- **Tests existants** : 1921 tests avant mission, dont 16 tests v8
  (invariants) et les suites Kotlin/Robolectric du module média.

**Conclusion de l'audit** : pas de refonte. Trois **gaps réels et localisés**
étaient découverts (ci-dessous) ; tout le reste était déjà conforme.

## 2. Gaps identifiés et correctifs (consignes §8, §9, §2, §12)

### GAP 1 — Une perte d'infrastructure consumait toute la file de lecture

`player.ts` (`playTrack` → échec de tentative Spotify) : **tout** code
d'échec conduisait à `markFailed` + avancement à la piste suivante. Avec une
grace de 10 s, une WebView détruite/pont mort « mangeait » une piste toutes
les 10 s — la file était consommée alors que la musique n'a jamais joué.

**Correctif** : les codes d'échec **transitoires** (infrastructure, pas
piste) sont désormais :

```
no-spotify-web-port            (hôte jamais monté)
spotify-web-host-not-mounted   (pas de hôte WebView)
spotify-web-bridge-not-ready   (pont pas monté après la grace)
spotify-web-bridge-unreachable (message jamais acheminé)
spotify-web-command-unacked    (accusé de réception manquant)
spotify-web-command-timeout    (confirmation absente après timeout)
spotify-web-command-denied     (commande refusée par le pont)
spotify-web-command-not-delivered
```

Pour ces codes : **pas de `markFailed`, pas d'avancement** — le moteur reste
sur la piste avec l'erreur réelle (`spotify-web-engine-not-ready`), le
MediaSession quitte « playing », et un **PLAY explicite** (UI, écran
verrouillé, casque — tous relayés vers `play()`/`resume()`) **retente la MÊME
piste** une fois la source revenue. Les codes « décision/piste » (timeout de
confirmation avec piste, refus de plan, identifiant absent, porte fermée par
décision) conservent le comportement v7 verrouillé (marquage + avancement).

### GAP 2 — Le démontage de l'hôte ne publiait aucun état final

`SpotifyWebHostView` (désactivation du réglage, navigation, démontage React)
se nettoyait en silence : le PlayerController pouvait rester **silencieusement
sur « playing »** alors que la source n'existait plus.

**Correctif** : avant `destroy()`, le cleanup **publie un dernier état**
`{ status: 'error', trackId: null, …, errorCode: 'host-unmounted' }` sur le
bus partagé (`publishSpotifyWebPublishedState`) — le moteur reçoit l'erreur
réelle et sort de « playing ». La source basse est ensuite nettoyée.

### GAP 3 — L'échec définitif de reconnexion était un point mort

Phase `failed` (budget de 3 recharges + backoff épuisé) : l'overlay affichait
« Pont : échec (rechargement manuel requis) »… mais **aucun bouton n'existait**
pour forcer ce rechargement manuel.

**Correctif** : un bouton **« Recharger »** apparaît dans l'overlay quand la
phase est `failed` **ou** `recovering` et appelle
`runtime.manualReload()` (nouveau document, nouveau handshake) — la
récupération manuelle existe enfin.

## 3. Fichiers modifiés

| Fichier                                                                                                                                                                                                     | Changement                                                                                                                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `services/player.ts`                                                                                                                                                                                        | Codes d'échec transitoires : file préservée, erreur réelle publiée, retry sur PLAY explicite                                          |
| `components/Player/SpotifyWebHostView.tsx`                                                                                                                                                                  | Dernier état publié `host-unmounted` au démontage ; bouton « Recharger » (`failed`/`recovering`) → `manualReload()` ; style du bouton |
| `services/__tests__/playerSpotifyWebV9.unit.test.ts`                                                                                                                                                        | **Nouveau** — 9 tests moteur                                                                                                          |
| `services/__tests__/mediaBridgeV9.unit.test.ts`                                                                                                                                                             | **Nouveau** — 10 tests MediaSession/bridge                                                                                            |
| `components/Player/__tests__/SpotifyWebHostView.unit.test.tsx`                                                                                                                                              | **Nouveau** — 6 tests vue hôte                                                                                                        |
| `app.config.js`, `package.json`, `__mocks__/expo-constants.ts`, `.github/workflows/android-apk.yml`, `screens/__tests__/SettingsScreen.unit.test.tsx`, `screens/__tests__/SettingsSubScreens.unit.test.tsx` | Version `4.5.0-test.13` / `45013`                                                                                                     |

**Aucun fichier Kotlin touché** : Media3, MediaSession, notification,
écran verrouillé, casque/Bluetooth étaient déjà conformes (audit §1).
**Aucun test v7/v7.1/v8 supprimé ou modifié.**

## 4. MediaSession et notifications (consignes §2, §7, §10, §11)

- La notification/écran verrouillé affichent **uniquement l'état confirmé**
  du PlayerController ; une piste Spotify est portée par la session Media3
  **seulement après confirmation** (étape 10 des tests ci-dessous verrouille :
  jamais `isPlaying: true` sans lecture réelle confirmée ; fermeture de la
  session si une piste Spotify devient courante alors qu'une lecture native
  tourne).
- **Position** : réelle uniquement, bornée à la durée (test §7 : position
  > durée → bornée), jamais de progression artificielle.
- **Métadonnées** : titre/artistes/album/pochette/durée de la piste courante
  (test dédié) ; sans piste → payload `null`.
- **Commandes système** (play/pause/next/previous/seek) : relayées au moteur
  (`sendCommand`), zéro logique dupliquée dans le bridge.
- **Noisy (débranchement casque)** : pause **uniquement si lecture réelle en
  cours** — native via son objet audio, Spotify via `sendCommand('pause')` ;
  aucune action si rien ne joue (3 cas verrouillés).

## 5. Tests automatiques (consigne §12)

**25 nouveaux tests**, tous verts, en plus des 1921 existants :

| Suite                              | N°  | Couverture                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ---------------------------------- | --- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `playerSpotifyWebV9.unit.test.ts`  | 9   | source basse au démarrage (piste préservée, aucun Sound, aucun faux playing) ; perte pendant lecture (état réel `error` + notification, file intacte) ; port absent ; porte fermée par décision (comportement v7 intact) ; **PLAY après erreur retente la même piste** ; hôte démonté → `host-unmounted` quitte « playing » ; **dernière position connue à la restauration** (projetée avant confirmation, réelle publiée après) |
| `mediaBridgeV9.unit.test.ts`       | 10  | piste Spotify confirmée → aucune prétention `isPlaying: true` sur Media3 (+ fermeture de session native) ; pause réelle → session reflétée ; noisy (3 cas) ; `buildMediaSessionPayload` : `isPlaying` par état (7 états), position bornée, métadonnées, `null` sans piste, commandes relayées au moteur                                                                                                                          |
| `SpotifyWebHostView.unit.test.tsx` | 6   | démontage → **dernier état publié** `error/host-unmounted` ; désactivation du réglage → idem + vue `null` ; phase `failed` → bouton « Recharger » visible + `manualReload()` appelé ; phase `recovering` → bouton proposé (pas de point mort) ; phase `ready` → pas de bouton ; hôte inactif → aucun hôte/WebView                                                                                                                |

**Totaux gates (locaux)** :

| Gate                          | Résultat                                             |
| ----------------------------- | ---------------------------------------------------- |
| Jest (tous)                   | **1946 passed / 0 failed / 14 skipped** (151 suites) |
| TypeScript (`tsc --noEmit`)   | clean                                                |
| ESLint (global)               | clean                                                |
| Prettier (global, dont `.md`) | clean                                                |
| Tests Kotlin/Robolectric (CI) | success                                              |

Aucun faux `playing`, aucun mock simulant une lecture réelle : les doubles
représentent des dépendances externes explicites (port, runtime, pont Media3)
et sont limités aux tests.

## 6. CI

Workflow `android-apk.yml`, run **`37626670720`** (head `8aa382f`) :
**success**. Étapes clés :

| Étape                                                                                                            | Résultat |
| ---------------------------------------------------------------------------------------------------------------- | -------- |
| Valider la config Spotify du build (redirect `comspotifytestsdk://callback`, client ID 32 hex, PKCE sans secret) | success  |
| TypeScript, ESLint, Prettier                                                                                     | success  |
| Tests JavaScript / React Native (Jest)                                                                           | success  |
| Vérifier la configuration Android générée                                                                        | success  |
| Tests Kotlin du module média (Robolectric)                                                                       | success  |
| Compiler l'APK · Aligner 16 Kio et signer (V3)                                                                   | success  |
| Vérifier intégrité, installabilité et signature (aapt : `versionCode 45013` / `versionName 4.5.0-test.13`)       | success  |
| **Installer et lancer réellement l'APK sur Android 14 (smoke)**                                                  | success  |
| Publier l'APK comme artefact                                                                                     | success  |

## 7. Git

- **Ancien HEAD** : `191431e` (v8).
- **Nouveaux commits** :
  - `1b7d0ff` — `feat: mission v9 — perte de source Spotify Web : file préservée, état honnête, récupération manuelle`
  - `7337174` — `test: mission v9 — 25 nouveaux tests (moteur, MediaSession/bridge, vue hôte)`
  - `8aa382f` — `chore: version 4.5.0-test.13 / 45013 (nouveau APK mission v9)`
  - commit du rapport (HEAD final, ci-dessous).
- Branche `arena/fcdae8c6-melodix` poussée ; PR #6 ouverte. Aucun reset,
  rebase ni force-push ; aucun test v7/v7.1/v8 supprimé ; aucun changement
  hors mission.

## 8. APK

| Champ                     | Valeur                                                                                                                                                                            |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Fichier (artefact CI)     | `Melodix-v4.5.0-test.13-8aa382f.apk` (run `37626670720`)                                                                                                                          |
| versionCode / versionName | `45013` / `4.5.0-test.13`                                                                                                                                                         |
| Signature                 | V3, alignement 16 Kio vérifié en CI (étape « Vérifier intégrité… »)                                                                                                               |
| SHA-256 local             | **non calculable dans cette session** : l'endpoint d'artefacts GitHub (blob) est inaccessible depuis le sandbox ; l'APK est téléchargeable depuis l'artefact du run `37626670720` |

## 9. Validation — distinction explicite (consigne §16)

- **Fonctionnel dans le code** : la résilience est implémentée — file de
  lecture préservée lors d'une perte de source (avec retry sur PLAY
  explicite), dernier état publié honnête au démontage de l'hôte
  (`host-unmounted`), bouton de rechargement manuel sur les phases
  `failed`/`recovering` ; MediaSession/notification/écran verrouillé/casque
  restent liés au **seul** PlayerController via Media3 existante.
- **Testé automatiquement** : 25 tests v9 + 1921 existants (dont les 16 v8 et
  les 741 v7) verts — `playing` jamais prétendu sans confirmation réelle,
  pas de faux mock de lecture.
- **Testé sur émulateur** : CI — l'APK `45013` a été **installée et lancée
  réellement sur un émulateur Android 14** (smoke de lancement, étape
  « Installer et lancer réellement l'APK » : success). C'est un smoke de
  lancement, pas un test de lecture Spotify.
- **Testé physiquement** : **rien** — aucun téléphone réel n'a été testé dans
  cette mission.
- **Non testé** : la lecture Spotify réelle en arrière-plan, le cycle
  foreground/background sur appareil, le débranchement casque physique, les
  commandes depuis l'écran verrouillé et le Bluetooth sur matériel réel.

La lecture Spotify réelle en arrière-plan, les commandes écran verrouillé et
Bluetooth sur appareil physique restent non validées tant qu'aucun téléphone
réel n'a été testé.
