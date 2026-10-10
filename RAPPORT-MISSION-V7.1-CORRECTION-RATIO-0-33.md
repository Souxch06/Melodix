# Mission v7.1 — Correction du ratio « 0/33 disponibles » (playlist Spotify)

**Date** : 2026-10-07
**Départ imposé** : HEAD PR #6 `b1d1281798c13af0c1bb1b0c36d1371c7ba3ea55`
**Objet** : régression physique — une playlist Spotify de 33 titres affichait
`0/33 disponibles` (pire qu'avant v7 : `2/32`).
**Règle absolue rappelée** : `0/33`, `33/33` ou tout ratio n'est JAMAIS une
preuve de lecture ; pour une piste Spotify, le Spotify Web Player est la
seule source audio ; aucun matching Audius/YouTube ne décide sa
disponibilité.

---

## 1. Source exacte du « 0/33 »

**Fichier** : `screens/PlaylistScreen.tsx` — `summaryAvailability`
(membrane `useMemo` vers la prop `summaryAvailability` de `Preview`).

**Code avant correction** :

```ts
return spotifyWebActive
  ? translations.playlistSpotifyWebInfo(total)
  : translations.playlistAvailabilityInfo(0, total); // ← « 0/33 morceaux disponibles »
```

**Chemin d'affichage** (de bout en bout) :

`PlaylistScreen.summaryAvailability` → prop `summaryAvailability` de
`Preview` → prop `availabilityInfo` de `Summary` → `<Text
testID="playlist-availability-stat">`.

`playlistAvailabilityInfo` (la chaîne ratio) n'était utilisée **nulle part
d'autre** que dans cet unique emplacement (hors tests) dans tout le code —
c'était donc la source unique et exclusive du ratio.

## 2. Cause racine

- Dans `hooks/usePlaylistResolutions.ts` :
  `spotifyWebActive = activationActive && spotifyWebPlayback`.
- Dès que ce booléen était `false` (réglage « Lecture Spotify Web » éteint
  OU porte d'activation fermée), l'écran affichait
  `playlistAvailabilityInfo(0, total)` = **« 0/33 morceaux disponibles »**.
- **Défaut de conception** : l'UI confondait « moteur Spotify Web inactif »
  et « 0 morceau disponible sur N ». Or un moteur inactif ne signifie PAS
  « 0 morceau disponible sur le catalogue Spotify » ; et, par la règle
  absolue v7, **aucun matching Audius/YouTube ne décide la disponibilité
  d'une piste Spotify**. Le numérateur `0` était une valeur **codée en dur**,
  pas un comptage — c'est un mensonge affiché, pas une mesure.

## 3. Correction

**`screens/PlaylistScreen.tsx`** (deux états, jamais un ratio) :

```ts
return spotifyWebActive
  ? translations.playlistSpotifyWebInfo(total) // « 33 titres · lecture Spotify Web Player »
  : translations.playlistSpotifyWebDisabledInfo(total); // « 33 titres · Spotify Web Player désactivé »
```

- Moteur **actif** → on affiche la **SOURCE** (Spotify Web Player) — jamais
  un ratio ; la preuve réelle de lisibilité intervient à la LECTURE.
- Moteur **inactif** → on indique clairement **Spotify Web désactivé** —
  jamais `0/33 disponibles`.

**Traductions** (`data/fr-fr.ts`, `data/en-gb.ts`) :

- Ajout de `playlistSpotifyWebDisabledInfo(total)`.
- `playlistAvailabilityInfo` conservée pour la parité de typage des deux
  locales, mais marquée comme non utilisée pour les playlists Spotify.

**Contrat du hook inchangé** : `stats = { total, spotifyWebActive }` — aucun
compteur `available` (l'UI ne peut donc plus en dériver de faux ratio).

## 4. Vérification de l'activation réelle (point 3 de la mission)

| Élément                                   | Rôle                                                                                    | État |
| ----------------------------------------- | --------------------------------------------------------------------------------------- | ---- |
| `ensureProductionSpotifyWebActivation()`  | Lève la double porte à la racine (`app/_layout.tsx`, scope de module, avant tout rendu) | OK   |
| `resolveSpotifyWebPlaybackActivation()`   | `active = enabledFlag && physicalValidation === 'PASSED_ON_DEVICE'`                     | OK   |
| `subscribeSpotifyWebPlaybackActivation()` | Réactivité du hook ET de l'hôte à chaque bascule                                        | OK   |
| `usePreferences().spotifyWebPlayback`     | Réglage utilisateur (défaut `true`)                                                     | OK   |
| `SpotifyWebHostView`                      | Ne monte que si porte + réglage actifs                                                  | OK   |

**Point clé** : la condition de montage de l'hôte
(`activationActive && spotifyWebPlayback === true`) est **strictement
identique** à `spotifyWebActive` du hook. L'état « actif / désactivé »
affiché correspond donc EXACTEMENT à la question « l'hôte WebView est-il
réellement monté ? » — plus de confusion entre « capacité de compter » et
« activation physique ».

## 5. Vérification du chemin playlist → player (points 4 & 5)

Dans `services/player.ts` :

- Piste portant un identifiant Spotify (`source.provider === null`) →
  `trySpotifyWeb(track)` **uniquement** ; jamais `resolveTrack` /
  `resolveWithProviders`, jamais Audius/YouTube.
- Tout verdict non confirmé = **vraie erreur Spotify Web structurée** (code
  remonté tel quel), jamais convertie en « unavailable » Audius/YouTube,
  jamais suivie d'un secours silencieux.
- Piste native (`audius:` / `youtube:`) → lecture directe par SON provider
  (chemins provider-bound préservés, non cassés).

→ Le resolver générique Audius → YouTube (`services/audio/trackResolver.ts`)
reste pour les chemins explicitement provider-bound ; **aucune piste Spotify
du catalogue n'y transite pour sa disponibilité**.

## 6. Tests ajoutés / mis à jour

**`hooks/__tests__/usePlaylistResolutions.unit.test.tsx`** — reproduction
EXACTE à 33 pistes (`Array.from({length:33},(_,i)=>({id:`spotify-${i}`…}))`) :

- moteur actif → `total === 33`, 33 `eligible`, et la stats ne porte QUE
  `{ total, spotifyWebActive }` (aucun compteur `available` qui alimenterait
  un ratio) ;
- réglage ÉTEINT → 33 `none`, `spotifyWebActive: false` ;
- porte fermée → 33 `none` ;
- bascule en direct, liste vide, `refresh()`.

**`screens/__tests__/PlaylistScreen.availability.unit.test.tsx`** (NOUVEAU) —
test de bout en bout sur le VRAI chemin (hook réel + écran réel → prop
`Preview`) :

- moteur ACTIF → la statistique contient « Spotify Web » et ne correspond
  JAMAIS à `/(\d+)\s*\/\s*33/` ni à « disponibles » ;
- moteur INACTIF (réglage éteint) → « …désactivé », jamais `0/33` ;
- moteur INACTIF (porte fermée) → « …désactivé », jamais `0/33` ;
- playlist vide → aucune statistique.

**Preuve que le test capte la régression** : en réintroduisant temporairement
`playlistAvailabilityInfo(0, total)`, les deux tests « INACTIF » échouent
avec `Received string: "0/33 morceaux disponibles"`. Le test n'est donc pas
vacu.

## 7. Résultats des gates (exécutés localement)

| Gate                                                | Résultat                                                               |
| --------------------------------------------------- | ---------------------------------------------------------------------- |
| Jest                                                | **1905 passed / 0 failed** (14 skipped) — v7 était à 1901, +4 nouveaux |
| TypeScript (`tsc --noEmit`)                         | clean                                                                  |
| ESLint (`expo lint`)                                | clean                                                                  |
| Prettier (`prettier --check **/*.{ts,tsx,json,md}`) | clean                                                                  |

## 8. Build Android + APK

- **Version** : `4.5.0-test.11` / versionCode `45011` (bump unique,
  synchronisé dans 5 fichiers : `app.config.js`, `package.json`,
  `__mocks__/expo-constants.ts`, `android-apk.yml`
  (`EXPECTED_VERSION_CODE`/`NAME`), tests des écrans paramètres).
- **CI run** : `37603046202` (branche `arena/fcdae8c6-melodix`, head
  `468e67d`) → **SUCCESS**.
  - Gates CI (TypeScript, ESLint, Prettier, Jest, tests Kotlin/Robolectric)
    verts.
  - Vérification aapt de l'APK : `versionCode='45011'`,
    `versionName='4.5.0-test.11'`, minSdk 23 / target 34, 4 ABIs
    (arm64-v8a, armeabi-v7a, x86, x86_64), **V3.0 Signer** — certificate
    SHA-256 `fac61745dc0903786fb9ede62a962b399f7348f0bb6f899b8332667591033b9c`
    (cohérent avec `EXPECTED_CERT_SHA256`).
  - Smoke sur émulateur Android 14 : package installé, scheme `melodix`
    présent, route `comspotifytestsdk://callback` fonctionnelle, Media3
    OK.
- **APK** : artefact du run `Melodix-v4.5.0-test.11-468e67d.apk`
  (89 Mo décomprimés — même canal de distribution que l'APK 45010).

| Champ                     | Valeur                                                             |
| ------------------------- | ------------------------------------------------------------------ |
| Fichier                   | `Melodix-v4.5.0-test.11-468e67d.apk`                               |
| versionCode / versionName | `45011` / `4.5.0-test.11`                                          |
| Taille (APK)              | 89 Mo                                                              |
| Signature                 | V3 (cert SHA-256 `fac61745…033b9c`)                                |
| **SHA-256 APK**           | `36810832b9c502ff6ab3c85ce074aac8917f1e08b6b0f46b5c54b4fdc5bde559` |

## 9. SHAs

- **Commit de correction** : `ea1c3b5`
  (`fix: playlist Spotify — jamais un ratio « 0/33 disponibles » (v7.1)`)
- **Commit de version** : `468e67d` (HEAD final, poussé sur
  `arena/fcdae8c6-melodix`)
- **APK** : SHA-256
  `36810832b9c502ff6ab3c85ce074aac8917f1e08b6b0f46b5c54b4fdc5bde559`

## 10. À faire (test physique — par l'utilisateur)

Avec l'APK `4.5.0-test.11` : ouvrir une playlist Spotify de 33 titres.
Attendu :

- moteur Spotify Web actif → **« 33 titres · lecture Spotify Web Player »** ;
- moteur inactif → **« 33 titres · Spotify Web Player désactivé »** ;
- **JAMAIS** `0/33 disponibles` (ni `2/33`, ni `33/33`).

Ne PAS déclarer la playlist « fonctionnelle » sur la base d'un affichage :
la preuve de lecture reste la confirmation réelle publiée par la page Spotify
Web (`playing`), et le rapport le dira seulement après un nouveau test
physique.
