# Mission v8 — Spotify Web : chemin réel, robuste et testable automatiquement

**Date** : 2026-10-07
**Base obligatoire** : HEAD PR #6 `916819d` (correction v7.1 du `0/33`).
Ni re-fait du correctif v7.1, ni retour à `b1d1281` ; les commits
`ea1c3b5`, `468e67d`, `916819d` sont conservés et restent ancêtres.
**Objectif** : poursuivre la transformation de Melodix en véritable lecteur
Spotify Web ; rendre le chemin Spotify Web **réel, robuste et testable
automatiquement**, sans mock faisant croire que la lecture fonctionne.

---

## 1. Audit du pipeline (consigne §1)

Architecture **existante** (non remplacée, conformément à la consigne) :

`Melodix UI` → `PlayerController` (`melodixPlayer`, source unique de vérité)
→ `SpotifyWebBackend` → `SpotifyWebRuntime` → `WebView` → `Spotify Web Player`
et retour `Spotify Web` → `Bridge` → `PlayerController` → `MediaSession` →
`Notification / écran verrouillé`.

Composants inspectés : `services/player.ts` (2537 L),
`SpotifyWebBackend`, `spotifyWebRuntime`, `spotifyWebBridge`,
`spotifyWebTrackTransport`, `SpotifyWebHostView`, `context/PlayerContext.tsx`,
module Android `melodix-media`.

- **Commandes** : play, pause, resume (play sur piste pausée), next,
  previous, seek, stop, setVolume, toggleShuffle, cycleRepeat/setRepeat.
- **États** : idle, loading, buffering, playing, paused, ended, error
  (+ unavailable, resolving).
- **Événements** : track loaded, playback started (`playing` publié),
  paused, ended, position changed, duration changed, error, WebView
  destroyed (`error renderer_destroyed`), recréation,
  bridge disconnected/reconnected (readiness + grace bornée).

**Constat** : le chemin Spotify Web était déjà implémenté correctement
(Missions v6/v7). Aucune réécriture d'architecture inutile ; le travail v8
consiste à **verrouiller explicitement les invariants** par des tests et à
vérifier l'absence de gap.

## 2. Invariants vérifiés (consigne §2 — règle absolue)

- `playing` n'est provoqué **que** par un état publié
  (`onSpotifyWebPublished`, `services/player.ts` L815–846) — jamais par la
  commande `play()`.
- Un verdict non confirmé = **vraie erreur Spotify Web** structurée (code
  remonté) ; **aucune** cascade Audius/YouTube, aucun secours silencieux.
- `buffering` : la page publie `buffering` → transport (aplati en `loading`)
  → statut moteur `buffering`.
- `seek` : la position n'est **jamais inventée** ; c'est l'état publié qui
  décide.
- `SpotifyWebPublishedState.status` = 6 valeurs
  (`idle|loading|paused|playing|ended|error`) ; invariant `playing` publié
  seulement si la page l'a publié.

## 3. Modifications (consigne §16)

**Fichiers modifiés** :

- `services/__tests__/playerSpotifyWebV8.unit.test.ts` (**nouveau**, 16
  tests) — invariants v8 au niveau moteur.
- Version `45012` / `4.5.0-test.12` : `app.config.js`, `package.json`,
  `__mocks__/expo-constants.ts`, `.github/workflows/android-apk.yml`
  (`EXPECTED_VERSION_CODE`/`NAME`), tests `SettingsScreen` /
  `SettingsSubScreens`.

**Architecture touchée** : **aucun code de production modifié** — les
invariants exigés étaient déjà correctement implémentés (vérifiés par les
tests). Aucune feature ajoutée ni retirée, aucun mock de lecture, aucun
fallback fictif, aucune donnée hardcodée.

**Bugs corrigés** : aucun bug nouveau identifié sur le chemin audité ; le
correctif v7.1 du `0/33` reste en place et le test des **33 titres**
continue de passer.

## 4. Tests automatiques (consigne §12 + §13)

**Nouveaux — 16 tests** (`playerSpotifyWebV8.unit.test.ts`, double de port,
aucun mock de lecture) :

- **§2** : `loading`→`buffering` ; `paused`→`paused` ; `pause()` **ne**
  passe pas à `paused` tant que la page ne publie pas ; `ended` sur file
  épuisée (1 piste, repeat off) → `ended` (pas `playing` figé).
- **§7** : seek vers 0 ; seek au-delà de la durée → clampé ; seek `NaN`
  ignoré ; seek pendant pause ; la position ne suit que la confirmation.
- **§8** : previous avec position > 3 s → restart (`seek 0`, même piste) ;
  position < 3 s → piste précédente ; repeat `one` (relit la même piste),
  `all` (boucle au début), `off` (fin de file → `ended`).
- **§5** : chaque tentative Spotify confirmée via le port (jamais de Sound
  expo-av, jamais `resolveMatch`) ; piste sans identifiant jamais tentée.

**Résultats des gates** :

| Gate                                                | Résultat                                                                   |
| --------------------------------------------------- | -------------------------------------------------------------------------- |
| Jest                                                | **1921 passed / 0 failed / 14 skipped** (v7.1 : 1905, +16)                 |
| TypeScript (`tsc --noEmit`)                         | clean                                                                      |
| ESLint (`expo lint`)                                | clean                                                                      |
| Prettier (`prettier --check **/*.{ts,tsx,json,md}`) | clean                                                                      |
| Android build                                       | `45012` — CI `37612482819` **success**                                     |
| APK smoke (émulateur Android 14)                    | package, scheme `melodix`, route `comspotifytestsdk://callback`, Media3 OK |

Le test de régression **33 titres** (v7.1) passe toujours.

## 5. CI

- Workflow `android-apk.yml`, run **`37612482819`** (head `84b40b6`) :
  **success**.
- Étapes : TypeScript/ESLint/Prettier, Jest, tests Kotlin/Robolectric,
  compilation APK, alignement 16 Kio + signature **V3**, vérification aapt
  (`versionCode 45012` / `versionName 4.5.0-test.12`, 4 ABIs, minSdk 23 /
  target 34, certificat `fac61745…033b9c`), smoke Android 14.
- Commit du code : `84b40b6` (tests) + commit de version ; commit rapport
  ci-après.

## 6. Git

- **Ancien HEAD** : `916819d` (v7.1).
- **Nouveau HEAD** : `84b40b6` (code) → commit du rapport (HEAD final).
- **Aucun changement hors mission** : uniquement tests v8 + version +
  rapport. Les commits v7.1 restent ancêtres.

## 7. APK

| Champ                     | Valeur                                                             |
| ------------------------- | ------------------------------------------------------------------ |
| Fichier (artefact CI)     | `Melodix-v4.5.0-test.12-84b40b6.apk`                               |
| versionCode / versionName | `45012` / `4.5.0-test.12`                                          |
| Taille (APK)              | 89 Mo                                                              |
| Signature                 | V3 (cert SHA-256 `fac61745…033b9c`)                                |
| **SHA-256 APK**           | `bb062f0a5152ca3227e9205a778a8523fea603364cbac78c880783092e461a6b` |

## 8. Validation physique (distinction explicite, consigne §16)

- **Fonctionnel dans le code** : le chemin Spotify Web (commandes / états /
  événements / seek / next / previous / queue / repeat) est implémenté et
  cohérent ; `PlayerController` = source unique de vérité.
- **Testé automatiquement** : les 16 tests v8 + les 1905 existants
  (bridge, transport, backend, Player, UI) verrouillent les invariants au
  niveau unitaire.
- **Testé sur émulateur** : l'APK `45012` est installée et lancée sur
  émulateur Android 14 (package / scheme / route callback / Media3) — smoke
  CI.
- **Testé sur appareil physique** : **non** effectué dans cette mission
  (aucun test Spotify physiquement possible actuellement).
- **Non testé / non validé physiquement** : la lecture Spotify réelle
  (audio audible), l'audio en arrière-plan, la notification MediaSession /
  écran verrouillé réelle, le casque/Bluetooth, le cycle de vie WebView en
  arrière-plan sur appareil réel.

> **Je ne prétends pas avoir validé la lecture Spotify sur téléphone.** Aucun
> test physique Spotify n'a été réalisé dans cette mission ; la preuve de
> lecture reste exclusivement la confirmation réelle publiée par le Spotify
> Web Player (état `playing`), jamais un ratio ni un mock.
