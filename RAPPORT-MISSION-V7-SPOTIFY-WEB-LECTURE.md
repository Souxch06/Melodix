# RAPPORT FINAL — MISSION V7 : SPOTIFY WEB PLAYER UNIQUE POUR LES PISTES SPOTIFY

**Date** : 2026-10-07 · **Branche** : `arena/fcdae8c6-melodix` · **Dépôt** : `Souxch06/Melodix` · **PR** : #6

**Point de départ** : `f821485` (v6 final livré).
**Code HEAD** : `a145e13` (1 commit sur `f821485`, poussé).
**CI** : run `37584612704` — **success** (job « Construire l'APK »).
**Version** : `4.5.0-test.10` / `45010`.

---

## Problème physique corrigé

Playlist Spotify de 32 titres → l'UI affichait **« 2/32 disponibles »**.
Cause racine : la disponibilité mesurait la **présence sur Audius/YouTube**
(matching), pas la capacité réelle du lecteur. Or les 32 titres sont
réellement lisibles sur Spotify. Le compteur utilisait
`usePlaylistResolutions.ts` → `resolveWithProviders()` (cascade
Audius → YouTube) et `trackResolver.ts` → Audius → YouTube → none.

**Objectif atteint** : pour une piste dont l'identifiant est un identifiant
Spotify, le **Spotify Web Player est la seule source audio**. Audius/YouTube
ne déterminent plus la disponibilité d'une playlist et ne servent plus de
secours pour ces pistes.

---

## Architecture finale

```
Spotify metadata/API
        │
        ▼
PlayerController (services/player.ts)
        │  piste provider null (identifiant Spotify)
        ▼
SpotifyWebBackend → SpotifyWebRuntime → WebView Spotify Web Player
        │  (mécanisme WebView/bridge EXISTANT, protocole v2, 6 commandes)
        ▼
Retour : Web Player → pont (spotifyWebHost) → PlayerController → MediaSession
```

- **Confirmation réelle** : la lecture n'est émise `playing` **que** sur un
  état `playing` **publié par la page** via le pont. `play()` n'est jamais
  une preuve. Jamais de faux événement `playing`.
- **Erreur réelle** : tout verdict autre que confirmé est une **vraie erreur
  Spotify Web** avec code remonté dans la notice :
  `spotify-web-port-missing`, `no-spotify-track-id`, `spotify-web-disabled`,
  `spotify-web-engine-not-ready`, ou le code du verdict (`failed` →
  `outcome.code`, `refused` → `refusal.code`). **Jamais** convertie en
  « unavailable » inventé ; **jamais** de relais Audius/YouTube. La file
  continue proprement.
- **Piste native** (`audius:` / `youtube:`) : lecture directe par SON
  provider (inchangé) ; pause best-effort de la page Spotify avant de créer
  le Sound (pas de double lecture).
- **Activation production** : la double porte (flag local + validation
  physique consignée avec preuve documentée) est levée à la **racine de
  l'app** (`app/_layout.tsx`), jamais dans le moteur.
  `services/playbackBackend/spotifyWebActivationBootstrap.ts` est idempotent
  et ne touche ni cookie, ni token, ni WebView. La preuve cite la validation
  téléphone + la smoke CI (run `37577095621`, build `45009`).
- **Disponibilité playlist** (`hooks/usePlaylistResolutions.ts`, réécrit) :
  **aucune recherche réseau**. Moteur actif → chaque piste `eligible`
  (preuve réelle à la lecture, **jamais** un « 32/32 » artificiel) ; moteur
  inactif → `none`. L'écran (`screens/PlaylistScreen.tsx`) affiche alors la
  **source** (« lu par Spotify Web ») et non un ratio.
- **Cache matching** (`MATCH_CACHE_VERSION 6`) : **inerte pour les pistes
  Spotify** — le moteur ne le consulte plus pour ces pistes. Une vieille
  entrée `provider: none` ne peut plus bloquer une piste Spotify Web.

---

## Ce qui utilise encore Audius/YouTube

- **Lecture des pistes NATIVES** (`audius:` / `youtube:`) : chaque piste est
  lue directement par SON provider (comportement inchangé, hors périmètre
  « piste Spotify »).
- **Logique de matching + protections v4/v5/v6** : elle reste **testée**
  (mauvaise version, remix, live, acoustic, cover, piano, acapella,
  re-recording, ISRC différent, durée incompatible) — mais elle ne sert plus
  au **chemin de lecture Spotify**. C'est du code de matching (resolver/
  providers) conservé, pas un secours pour les pistes Spotify.

## Ce qui utilise Spotify Web

- **Toute piste dont l'identifiant est un identifiant Spotify** : lecture,
  disponibilité, pause/reprise, next/previous, seek, ended, erreur —
  **uniquement** via le Spotify Web Player.
- **MediaSession** : quand la lecture est « Spotify Web », la WebView
  (Chromium) porte la MediaSession système ; la nôtre ne la concurrencent
  pas (fermeture de la session native, vérifiée par test + smoke).

---

## Fichiers modifiés (35)

**Moteur / activation**
- `services/player.ts` — `trySpotifyWeb`, vraie erreur (code), avance sans
  cascade, `__testSetSpotifyWebReadyGraceMs`.
- `services/playbackBackend/spotifyWebActivationBootstrap.ts` — **nouveau**,
  levée de la porte en production (idempotent, preuve documentée).
- `services/playbackBackend/spotifyWebHost.ts` — `getReadiness()`.
- `services/playbackBackend/index.ts` — exports.
- `app/_layout.tsx` — appel `ensureProductionSpotifyWebActivation()` + hôte
  `SpotifyWebHostView`.

**Disponibilité / UI**
- `hooks/usePlaylistResolutions.ts` — **réécrit** (eligible/none, zéro
  réseau, réactif).
- `screens/PlaylistScreen.tsx` — `'spotify-web' | 'none'`, info source.
- `components/Preview/Preview.tsx`, `components/Preview/Track/Track.tsx` —
  union + `'spotify-web'`.
- `components/Player/MiniPlayer.tsx`, `components/Player/FullPlayer.tsx` —
  passe `notice.code`.
- `components/Player/SpotifyWebHostView.tsx` — hint overlay v7.
- `data/fr-fr.ts`, `data/en-gb.ts` — `playerTrackPlayFailed(title, code?)`,
  `playlistSpotifyWebInfo(total)`, `trackUnavailableNotice` v7.
- `app/settings/spotify-web-player.tsx`, `context/PlayerContext.tsx`,
  `context/PreferencesContext.tsx`, `services/preferences.ts` — réglage
  `spotifyWebPlayback` défaut `true`, docs.

**Tests**
- `services/__tests__/playerSpotifyWebPlaylist32.unit.test.ts` — **nouveau**
  (7 tests bout-en-bout 32 titres).
- `services/__tests__/playerSpotifyWeb.unit.test.ts` — réécrit (vraies
  erreurs, grace bornée, hôte prêt pendant grace).
- `hooks/__tests__/usePlaylistResolutions.unit.test.tsx` — réécrit (6 tests).
- Adaptés au modèle v7 (pistes natives pour la mécanique expo-av) :
  `player.unit.test.ts`, `mediaBridge.unit.test.ts`, `shuffleRepeat.unit.
  test.ts`, `shuffleRepeatCombinations.unit.test.ts`,
  `playerSessionReliability.unit.test.ts`, `playerLogPrivacy.unit.test.ts`.
- **Supprimé** `fullChainResolution.unit.test.ts` (chaîne Spotify→Audius→
  YouTube de **lecture**, comportement retiré ; sa couverture « chaîne
  complète » est celle du Spotify Web).

**Version / CI** (8 refs)
- `package.json`, `app.config.js` (×2), `__mocks__/expo-constants.ts`,
  `.github/workflows/android-apk.yml` (×2), `screens/__tests__/
  SettingsScreen.unit.test.tsx`, `screens/__tests__/
  SettingsSubScreens.unit.test.tsx`.

**Docs**
- `docs/SPOTIFY-WEB-PHYSICAL-TEST.md` — section « Validation consignée —
  Mission v7 ».

---

## Gates (toutes vertes)

| Gate | Résultat |
|---|---|
| `npx tsc --noEmit` | ✓ 0 erreur |
| `npm run lint` (expo lint) | ✓ |
| `npm run prettier:check` | ✓ |
| `npm test -- --runInBand` (Jest) | ✓ **1901 passés / 0 échec / 14 skips** |
| `npx expo prebuild` + build APK (CI) | ✓ |
| APK smoke (CI) | ✓ |

**CI** : [run 37584612704](https://github.com/Souxch06/Melodix/actions/runs/37584612704)
— **success**. APK `versionCode=45010`, `versionName=4.5.0-test.10`, 89 Mo,
signé V3.

---

## Tests (détail)

- **32 titres bout-en-bout** (nouveau,
  `playerSpotifyWebPlaylist32.unit.test.ts`) : 32 métadonnées chargées,
  **aucune** dépendance Audius/YouTube, sélection, identité → runtime
  (trackId nu), **32 confirmations `playing`** (une par piste, publiée par
  la « page »), pause, reprise, next, previous, seek, ended, **erreur réelle**
  sur la piste 1 (code remonté, file continue), **ancienne entrée cache
  `provider: none` non bloquante**, moteur désactivé → vraie erreur
  immédiate sans cascade.
- **PlayerController / port** (`playerSpotifyWeb.unit.test.ts`, 12 tests) :
  confirmation réelle → playing sans Sound expo-av ; not-ready immédiat /
  grace bornée ; avance auto → tentative ; ended → Spotify Web ; erreur
  publiée → Spotify Web ; erreur réelle → vraie erreur (jamais de cascade) ;
  sans port → `spotify-web-port-missing` ; hôte prêt pendant la grace.
- **Hook** (`usePlaylistResolutions.unit.test.tsx`, 6 tests) : moteur actif
  → 32 éligibles ; réglage off → none ; porte fermée → none ; bascule live ;
  liste vide ; refresh stable.
- **Média / mécanique** : `mediaBridge.unit.test.ts` (45), `player.unit.
  test.ts` (106), `shuffleRepeat*`, `playerSessionReliability`,
  `playerLogPrivacy` — tous adaptés au modèle v7 et verts.

---

## Test physique — 32 titres

- **Non effectué en sandbox** (impossible : nécessite un téléphone réel avec
  compte Spotify connecté et la playlist de 32 titres).
- **À faire sur téléphone avec ce build** (`4.5.0-test.10` / `45010`) :
  charger une vraie playlist Spotify de 32 titres, vérifier les 32
  métadonnées, la lecture des 32 titres par le Spotify Web Player (32
  confirmations `playing`), pause/reprise/next/previous/seek, et qu'aucune
  piste non réellement lisible n'invente un « unavailable » (vraie erreur
  Spotify Web affichée).
- **Nombre de titres réellement testés en sandbox : 0** (les 32 sont couverts
  par le test unitaire bout-en-bout, pas par une lecture physique réelle).

> Conformément au cahier : **on ne prétend pas que les 32 titres fonctionnent
> sans l'avoir testé physiquement.** La preuve physique des 32 titres reste à
> consigner sur téléphone avec ce build.

---

## Protections conservées (v4/v5/v6)

Mauvaise version / remix / live / acoustic / cover / piano / acapella /
re-recording / ISRC différent / durée incompatible : **conservées** dans la
logique de matching (resolver/providers) et **toujours testées**. Elles
restent utiles même si Audius/YouTube sortent du chemin de lecture Spotify.
« Indisponible » (vraie erreur) reste préférable à une mauvaise version.

## Non-faits / limites

- Pas de suppression du code de matching Audius/YouTube (toujours utilisé
  par la lecture native + protections). La suppression progressive se fera
  après vérification de toutes les références (mission suivante si demandé).
- Test physique 32 titres : à faire sur téléphone (voir ci-dessus).
