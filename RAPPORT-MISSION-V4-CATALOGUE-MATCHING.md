# RAPPORT FINAL — MISSION V4 : CATALOGUE + MATCHING « BONNE VERSION »

**Date** : 2026-10-06 · **Branche** : `arena/fcdae8c6-melodix` · **Dépôt** : `Souxch06/Melodix`

**Point de départ** : `94205f6` (v3 — connexion Spotify fonctionnelle, confirmée physiquement : login ✅ lecture ✅ pause/reprise ✅ seek ✅ préc/suiv ✅ arrière-plan ✅).
**Code HEAD** : `60a91d0` (1 commit sur `94205f6`, poussé).

**Scope respecté** : UNIQUEMENT la chaîne _Spotify Search → sélection exacte → résolution audio → bonne version jouée_. AUCUNE modification de l'authentification Spotify (useSpotifyAuth, PKCE, SecureStore, redirect URI, MediaSession, bridge Spotify Web, PlayerController intacts).

---

## 1. Git

| Élément           | Valeur                                                    |
| ----------------- | --------------------------------------------------------- |
| Code HEAD         | `60a91d02a07240f417f1b2043aab96cbcd1a8a89`                |
| Base              | `94205f6` (v3)                                            |
| Fichiers modifiés | 18 (+1187 / −109) — liste exacte §6                       |
| CI                | run `37518165452` **SUCCESS** (pull_request, 12 min 24 s) |

## 2. Ce qui a été fait

### 2.1 Catalogue plus complet (borné)

`api/spotify/search.ts`, `api/search/searchCatalog.ts` :

- Pagination tracks : **20 × 5 pages (100 max) → 50 × 10 pages (500 max, 10 requêtes max)**.
- **50** = borne OFFICIELLE de `/v1/search` (le maximum que l'API accepte par page).
- 500 pistes = 10 % de la capacité brute de l'API (`offset + limit ≤ 5000`) — borne dure raisonnable, **pas de pagination infinie**.
- Inchangé et verrouillé par tests : arrêt adaptatif (page incomplète = Spotify a épuisé les résultats → arrêt immédiat), **une page secondaire en échec ne bloque JAMAIS la recherche** (les pages déjà servies sont conservées), dédoublonnage par track ID Spotify, ordre de pertinence Spotify conservé, autres types (artistes/albums/playlists) en page unique (navigation), `SEARCH_LIMIT` 20 → 50.
- Stratégie 100 % API Web Spotify officielle — aucun scraping, endpoint privé, cookie ou contournement.

### 2.2 Matching « bonne version » (PRIORITÉ)

`services/audio/audiusTrackMatcher.ts` (moteur partagé par Audius ET YouTube — même seuil, mêmes portes) :

- **Classification DÉTERMINISTE des variantes** : 19 classes fermées (`original, remix, live, acoustic, instrumental, radio_edit, extended, club, vip, sped_up, slowed, reverb, karaoke, demo, mashup, bootleg, alternate, remastered, unknown`) — `classifyVariantTitle` + `variantClassesOfTitle`. Même titre → même classe, toujours.
- **Nouvelles variantes dures** ajoutées : Club Mix/Version/Edit, VIP, Reverb, Demo, Mashup, Bootleg, Alternate Version (nightcore mappe sur `sped_up`). Un simple score textuel ne peut JAMAIS faire gagner une variante contre l'original (porte `variant-mismatch` AVANT scoring, symétrique).
- **Ordre ISRC** : ISRC identique = 100 (toujours gagnant ; tout ce qui n'a pas l'ISRC exact est borné à 99) ; **ISRC différent = −25 points** (le candidat ne survit que si correspondance stricte : titre exact + artiste ≥ 0,82 + durée ≤ 8 s) ; **ISRC différent + marqueur de variante → rejet** ; aucun candidat suffisant → `no-match`.
- **Normalisation typographique uniquement** : `Song` ≠ `Song (Remix)` reste une distinction sémantique (la canonicalisation retire le suffixe du titre comparé, mais la porte variante rejette le candidat sur le titre BRUT).
- **Durée = signal fort** (inchangé, verrouillé) : ≤ 3 s non pénalisé ; écart > 60 s ET > 30 % → rejet dur ; 03:40 / 08:20 → rejet.
- **Variante demandée = variante cherchée** : source « Song (Remix) » → le remix est accepté ET l'original rejeté à la place (symétrie testée).
- **Remastered / « Version 2024 » restent souples** : classés mais jamais rejettés à eux seuls (même enregistrement / édition ambiguë) — limite assumée, §7.

### 2.3 Diagnostic source « pourquoi ce morceau a été choisi »

`services/audio/trackResolver.ts`, `services/audio/resolutionDiagnostics.ts`, `audiusAudioProvider.ts`, `youtubeAudioProvider.ts`, `types.ts` :

- Nouvel enregistrement **`MATCHED`** (codes courts, listes fermées) : `provider` (`audius`/`youtube` — le backend Spotify Web joue la piste demandée directement, sans étape de matching), `match = isrc | exact-title | title-artist-duration | fuzzy`, `variant` (classe de la version jouée), `confidence` (0..100), nb requêtes.
- Trace chaîne (`buildResolutionChainTrace`) : le fournisseur qui a matché expose désormais `matchKind` + `variant` + compteur de requêtes.
- **Garde-fou structurel étendu** : `isSanitizedDiagnostic` / `isSanitizedChainTrace` valident les nouveaux champs contre des listes blanches — un titre, un artiste ou un ISRC collé dans le diagnostic ferait échouer le test. JAMAIS loggué : access/refresh token, cookie, URL privée, identifiant de piste, titre/artiste/album/ISRC (les diagnostics ne contiennent que des booléens, compteurs et codes courts).

## 3. Tests

**Jest complet : 1851 passés / 0 échec (14 skipped)** — baseline v3 : 1797 → **+54 nouveaux tests**.

- `services/audio/__tests__/exactVersionMatching.unit.test.ts` (nouveau, 52 tests) — la matrice déterministe IMPOSÉE, verrouillée test par test :

| #   | Cas                                                      | Résultat verrouillé                                                                                             |
| --- | -------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| 1   | `Song` / `Song`                                          | ACCEPT                                                                                                          |
| 2   | `Song` / `Song (Remix)` (Audius)                         | REJECT                                                                                                          |
| 3   | `Song` / `Song (Live)` (YouTube)                         | REJECT                                                                                                          |
| 4   | `Song` / `Song (Acoustic)`                               | REJECT                                                                                                          |
| 5   | ISRC=X / ISRC=X                                          | ACCEPT                                                                                                          |
| 6   | ISRC=X / ISRC=Y                                          | REJECT (sauf correspondance stricte, cas 6c) ; + variante → rejet ; ordre identique > aucun > différent (6d/6e) |
| 7   | 03:40 / 08:20                                            | REJECT (petit écart ≤ 3 s : ACCEPT, 7b)                                                                         |
| 8   | Audius sert une variante → YouTube sert l'original exact | YouTube accepté (`yt-exact`, `exact-title`, `original`)                                                         |
| 9   | Aucun candidat fiable des deux côtés                     | `no-match` (jamais approximatif)                                                                                |

- - les 17 classes de classification, symétrie variante demandée, remastered souple, `matchKind` (4 moyens), diagnostic positif + trace (codes courts vérifiés par le garde-fou structurel).
- `api/spotify/__tests__/search.unit.test.ts` : borne 500 / 10 pages / offset 450, limite 50 officielle, arrêt adaptatif, échec secondaire non bloquant (tests existants conservés et adaptés aux nouvelles bornes).
- `resolutionChainTrace`, `audiusAudioProvider` : diagnostic positif verrouillé.

## 4. Gates

| Gate                                          | Résultat                                                                                  |
| --------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Jest (full)                                   | **1851 / 0** (14 skipped)                                                                 |
| TypeScript (`tsc --noEmit`)                   | **OK**                                                                                    |
| ESLint                                        | **0 erreur, 0 warning**                                                                   |
| Prettier (`**/*.{ts,tsx,json,md}` — scope CI) | **clean**                                                                                 |
| Android / Robolectric / build APK             | **non exécutable en sandbox** (pas de Java/SDK/adb/KVM) → couvert par CI                  |
| CI run `37518165452`                          | **SUCCESS** — inclut prebuild, manifest, bundle, intégrité/signature APK, smoke cold/warm |

## 5. APK

| Champ                     | Valeur                                                                                      |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| Artefact                  | `Melodix-v4.5.0-test.7-60a91d0.apk`                                                         |
| Taille                    | 47 001 941 octets (≈ 44,8 Mo)                                                               |
| **SHA-256**               | `b93e036a927930a2cfcd9e9b94fb775129618e96d51a6af1feb161c9b2b91bce`                          |
| versionName / versionCode | **4.5.0-test.7 / 45007**                                                                    |
| Package                   | `com.souxch06.melodix`, minSdk 23, targetSdk 34, ABIs : arm64-v8a, armeabi-v7a, x86, x86_64 |
| Vérification              | CI (intégrité, installabilité, signature V3, `versionCode=45007` confirmé dans le manifest) |

## 6. Fichiers modifiés (liste exacte, 18)

| Fichier                                                      | Nature                                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `api/spotify/search.ts`                                      | borne 50×10 = 500 pistes                                                 |
| `api/spotify/__tests__/search.unit.test.ts`                  | tests bornes                                                             |
| `api/search/searchCatalog.ts`                                | `SEARCH_LIMIT` 50                                                        |
| `services/audio/audiusTrackMatcher.ts`                       | classification déterministe, ISRC, matchKind                             |
| `services/audio/types.ts`                                    | `TrackVariantClass`, `SongMatchKind`, `resolveMatch` étendu (facultatif) |
| `services/audio/trackResolver.ts`                            | diagnostic `MATCHED`, propagation                                        |
| `services/audio/resolutionDiagnostics.ts`                    | enregistrement positif + garde-fou étendu                                |
| `services/audio/audiusAudioProvider.ts`                      | transmission codes courts                                                |
| `services/audio/youtubeAudioProvider.ts`                     | transmission codes courts                                                |
| `services/audio/__tests__/exactVersionMatching.unit.test.ts` | **nouveau** — matrice imposée (52 tests)                                 |
| `services/audio/__tests__/resolutionChainTrace.unit.test.ts` | diagnostic positif trace                                                 |
| `services/audio/__tests__/audiusAudioProvider.unit.test.ts`  | forme du retour                                                          |
| `package.json`                                               | 4.5.0-test.7                                                             |
| `app.config.js`                                              | 4.5.0-test.7 / 45007                                                     |
| `__mocks__/expo-constants.ts`                                | 4.5.0-test.7                                                             |
| `.github/workflows/android-apk.yml`                          | EXPECTED_VERSION 45007 / 4.5.0-test.7                                    |
| `screens/__tests__/SettingsScreen.unit.test.tsx`             | assertion version                                                        |
| `screens/__tests__/SettingsSubScreens.unit.test.tsx`         | assertion version                                                        |

## 7. Test physique (8 catégories) — **NON TESTÉ PHYSIQUEMENT**

Aucun téléphone n'est disponible dans cet environnement de travail (pas d'adb, pas d'émulateur utilisable) : **les 8 catégories n'ont PAS été testées physiquement**. Le CI (run `37518165452`) a validé le build, la signature et le smoke wiring (warm/cold), mais **un build vert et des tests verts ne prouvent pas l'expérience de lecture** (règle : `playing` seulement de confirmation runtime réelle). À faire sur téléphone :

| #   | Catégorie                                                   | À vérifier sur le terrain                                                                                  |
| --- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| 1   | Populaire (original)                                        | demandé = entendu, provider = Audius ou YouTube                                                            |
| 2   | Peu connu                                                   | trouvé dans le catalogue 500 ; sinon `indisponible` (jamais faux morceau)                                  |
| 3   | Accents (ex. « Éclair, J'ai Envie de Toi »)                 | matching insensible aux accents                                                                            |
| 4   | Featuring (ex. « Señorita — Shawn Mendes, Camila Cabello ») | artiste principal reconnu                                                                                  |
| 5   | Remix très populaire                                        | **l'original n'est JAMAIS joué à la place du remix demandé** (et inversement)                              |
| 6   | Version live                                                | un upload studio ne remplace pas la demande live (et inversement)                                          |
| 7   | Version acoustic                                            | idem                                                                                                       |
| 8   | Plusieurs éditions / remasters                              | remaster accepté comme même enregistrement ; édition différente = indisponible plutôt que mauvaise version |

Par morceau à consigner : titre+version Spotify demandés, provider réel (Audius/YouTube), titre+version joués, résultat. Les exemples déterministes de §3 (unitaires, moteur réel, réseau mocké) montrent le comportement attendu du moteur, **pas** une lecture physique.

## 8. Limites restantes du catalogue (honnêteté)

- **Le catalogue n'est PAS « tous les morceaux Spotify »** : il est le plus complet possible dans les bornes de l'API officielle (500 pistes par recherche, 10 requêtes), mais : (a) Spotify lui-même peut ne pas indexer certaines versions (live, démos, bootlegs), (b) au-delà de 500 résultats classés par pertinence, les pistes plus lointaines ne sont pas servies, (c) un morceau absent de Audius ET de YouTube reste **indisponible** — c'est volontaire : **95 corrects + 5 indisponibles > 100 dont 15 mauvaises versions**.
- **Remastered** est traité comme le même enregistrement (c'est le cas dans >99 % des releases) ; une « remaster » qui serait réellement un enregistrement différent ne serait pas distinguée (signal non fiable dans les titres).
- **« Version 2024/2025 »** sans marqueur connu → classe `unknown` (souple) : une ré-enregistrement publié ainsi serait accepté sur titre+artiste+durée si tout le reste s'accorde.
- L'ISRC n'est publié par Audius que pour une minorité de pistes ; l'échappatoire « correspondance stricte » tolère un ISRC divergent quand titre+artiste+durée sont quasi parfaits (ISRC de distributeur parfois erronés) — c'est le seul cas où un ISRC différent est accepté.
- Spotify Web (backend de lecture direct, double gate fermé par défaut) joue la piste demandée sans étape de matching — le diagnostic « match » ne s'applique qu'aux fallbacks Audius/YouTube, seuls endroits où une mauvaise version serait possible.
- Le test physique §7 reste à faire : jusqu'à validation terrain, le comportement réel sur 8 catégories est **NON VALIDÉ RÉELLEMENT** (le moteur est verrouillé en unitaire, l'expérience complète ne l'est pas).

## 9. Non-regression

- Chaîne inchangée : Spotify Web (intact) → Audius → YouTube → indisponible ; aucun seuil baissé ; aucun `no-match` transformé en match approximatif.
- Aucune des protections des missions précédentes n'a été retirée (portes titre/artiste/durée/variantes/content-rating, diagnostic non sensible, double gate Spotify Web, protections 1d81dd6/c15562b/2540266/efff66c/21ee2a2).
- Les 1797 tests de la baseline v3 passent tous, inchangés ou adaptés de façon documentée (bornes catalogue 50/10, diagnostic positif, version).
