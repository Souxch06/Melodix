# RAPPORT FINAL — MISSION DE NUIT (Mission 4)

**Date** : 2026-10-05 · **Branche** : `arena/01a106dd-melodix` · **Dépôt** : `Souxch06/Melodix`

---

## 1. GIT

| Élément                           | Valeur                                                       |
| --------------------------------- | ------------------------------------------------------------ |
| Branche de travail                | `arena/01a106dd-melodix`                                     |
| Commit final (HEAD)               | **`6cb0abf`**                                                |
| Commit parent                     | `bbe25cd`                                                    |
| Nombre de commits (cette mission) | **7**                                                        |
| Fichiers modifiés (cette mission) | **59** (`+4739` / `−514`)                                    |
| Arbre de travail                  | **propre**, synchronisé avec `origin/arena/01a106dd-melodix` |
| `main`                            | `fceab85` — **intact, jamais touché, aucune fusion**         |
| Push                              | uniquement vers `arena/01a106dd-melodix`, sans force-push    |

### Les 7 commits

| SHA       | Objet                                                                                |
| --------- | ------------------------------------------------------------------------------------ |
| `118d1da` | `fix(audio)` — propage la classification `explicit` + source unique des scopes OAuth |
| `125ea77` | `fix(ui)` — le clavier ne fait plus monter la barre de navigation sur les résultats  |
| `898c4dd` | `feat(search)` — écran de recherche refondu + design system centralisé               |
| `b004c2b` | `test(player)` — verrouille shuffle / repeat / file (23 tests)                       |
| `4439ee2` | `design(theme)` — centralise le fond et les surfaces de l'application                |
| `bbe25cd` | `design(ui)` — applique le design system aux écrans restants                         |
| `6cb0abf` | `fix(ui)` — états loading/empty manquants et accessibilité des listes                |

---

## 2. UI / UX

### Design system centralisé — `config/theme.ts`

Nouvelle source unique, **sans casser l'existant** (`COLORS`, `Sizes`, `Shapes` restent la référence des écrans déjà en place ; `theme` **étend**, il ne remplace pas) :

- `PALETTE` — bleu nuit (`night900`→`night500`), violet (`violet700`→`violet300`), accent vert Melodix inchangé, `textPrimary/textSecondary/textTertiary/textInverse`, `hairline/hairlineStrong`, `veil/veilStrong`, `press`
- `SPACING` (échelle de 4), `RADIUS` (ordonné + `pill`), `TYPOGRAPHY` (display→caption), `SECTION_LABEL`, `ELEVATION` (flat→floating), `MOTION`, `TOUCH_TARGET` (≥ 44 dp), `LAYOUT`, `APP_BACKGROUND_COLOR`
- `theme` agrège toutes les familles

### Écrans modifiés

| Écran / composant                          | Changement                                                                                                                                                                                                   |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Recherche** (nouveau)                    | Barre moderne (icône, retour, effacer), focus automatique, debounce 400 ms, résultats groupés Top/Morceaux/Artistes/Albums/Playlists, recherches récentes (individuel + tout effacer), découverte par genres |
| **Accueil**                                | fond `APP_BACKGROUND_COLOR`, carte `ResumeSessionCard` au design system, sections réelles (salutation, playlists, récemment écouté, pour toi, top albums/artistes)                                           |
| **Album / Playlist / Artiste** (`Preview`) | fond nuit, `TYPOGRAPHY` pour titres/infos/copyrights, `RADIUS` jaquette, `ELEVATION.floating`, **état vide explicite ajouté**                                                                                |
| **Bibliothèque**                           | fond nuit, carte Favoris en `night600` + élévation, erreur réseau en `PALETTE.danger`                                                                                                                        |
| **Player** (mini + plein écran)            | `night600`/`night900`, hairlines, `RADIUS`, `ELEVATION.floating`, bouton lecture en pilule, badge provider violet, barre de progression `night500`                                                           |
| **File d'attente** (`QueueRow`)            | lignes 40 dp, titre actif en accent (le style existait mais n'était **jamais appliqué**), actions à 44 dp, `RADIUS`/`SPACING`                                                                                |
| **Header / BottomTabBar**                  | fond + `ELEVATION.raised` ; voile translucide + hairline supérieure                                                                                                                                          |
| **Historique**                             | fond, hairlines, `RADIUS`, `TYPOGRAPHY`, cibles tactiles 44 dp                                                                                                                                               |
| **Réglages**                               | fond, en-tête, bouton retour 44 dp au design system                                                                                                                                                          |
| **Cartes partagées** (`Card`)              | `night600` + hairline — toutes les sections de l'accueil en héritent                                                                                                                                         |
| **ErrorCard**                              | carte d'erreur unifiée (night600, `RADIUS.xl`, élévation, bouton _Réessayer_ en accent)                                                                                                                      |
| **Récemment écouté**                       | chips de reprise en pilule `night600` + hairline                                                                                                                                                             |
| **Carrousels** (`Slider`)                  | titres et espacements du design system                                                                                                                                                                       |

**Aucun second lecteur n'a été créé.** Le FullPlayer/MiniPlayer existants ont été habillés, pas dupliqués.

---

## 3. RECHERCHE

- **Nouveau design** : barre avec icône loupe, bouton retour, bouton effacer ; focus automatique piloté par la route (`/(tabs)/search?focus=1` depuis la loupe de l'accueil ; ouverture directe de l'onglet = navigation normale, genres browsables)
- **Debounce 400 ms** + garde `isCancelled` : un résultat d'une requête périmée ne peut jamais écraser une requête plus récente (le `"daft"` tardif n'écrase pas `"daft punk"`)
- **Historique** : recherches récentes persistées (`AsyncStorage`, 12 max), suppression individuelle, effacement total
- **Résultats groupés** : _Top résultat_ / _Morceaux_ (pochette, titre, artiste, album, badge explicit, menu « … ») / _Artistes_ (avatar + nom) / _Albums_ (pochette, titre, artiste + année) / _Playlists_ (pochette, nom, propriétaire si disponible)
- **États** : chargement, erreur + relancer, aucun résultat, avis de dégradation
- **8 scénarios nommés** couverts par `components/Search/__tests__/searchExperience.unit.test.tsx` (25 tests)

---

## 4. DISPONIBILITÉ AUDIO

### Cause racine trouvée et corrigée (`118d1da`)

`explicit` était présent sur `TrackModel`, sur `PlayerTrack` et propagé jusqu'à `AudioSourceQuery`, **mais `LibraryItemModel` n'avait pas de champ `explicit`** et `api/spotify/search.ts::trackToLibraryItem` le perdait. Conséquence : pour tout résultat de recherche, `source.explicit` valait `null`, donc le garde-fou `content-rating-mismatch` du matcher **ne pouvait jamais se déclencher** — une version _clean_ pouvait être acceptée pour un morceau _explicit_ côté Spotify.

**Correctif** : `explicit?: boolean | null` sur `LibraryItemModel`, propagé par `trackToLibraryItem` **et** aux deux sites de construction du `PlayerTrack` dans `components/Search/Search.tsx` (le `playQueue` et le menu `QueueActionMenu` du appui long).

`null` = inconnu = traité **neutre** par le matcher : jamais rejeté par supposition.

### Second défaut corrigé (`118d1da`)

`config/constants.ts` portait un **second `SPOTIFY_SCOPES` divergent (9 portées)**, ré-exporté par `config/index.ts`, sans aucun importateur — une source de vérité morte qui contredisait la vraie définition (`services/spotify/authConfig.ts`, 4 portées). Doublon et ré-export supprimés, remplacés par un commentaire.

### Ce qui a été audité et vérifié SANS modification

Le moteur de matching est resté **strictement intact** (0 fichier modifié) :

- Tolérances déjà en place : `feat.` / `ft.` / `featuring` / `with` / `w/` / `&` (titres **et** artistes), `remastered`, `- topic`, articles, accents, casse, ponctuation typographique
- Variantes **dures** (remix / live / instrumental / karaoke / acoustic / sped up / slowed / nightcore) : rejetées quand la source ne les demande pas — **testé et verrouillé**
- `- radio edit` : traité comme variante dure. **Décision documentée** : une _radio edit_ est un master différent (durée différente), et la suite de tests existante verrouille ce comportement (`rejette radio edit / extended / sped up / slowed quand la source est studio`). La tolérance demandée par le brief est respectée quand **les deux côtés** demandent la radio edit. Modifier cela aurait exigé de supprimer un test existant — interdit.
- ISRC exact = signal prioritaire ; durée pour départager deux candidats ; `MIN_FUZZY_TITLE_SIMILARITY = 0.84`, `ACCEPT_MATCH_SCORE = 55` — **seuils inchangés**
- Cascade : Audius (prioritaire) → YouTube (même seuil, même requête complète) → erreur réelle et compréhensible. YouTube n'est **jamais** appelé si Audius trouve.
- Cache négatif **uniquement** sur `no-match` prouvé : une panne réseau, un timeout ou une preuve incomplète produisent `error`, jamais `no-match` (donc jamais de bannissement durable d'un morceau disponible)
- Aucune normalisation agressive : remix/live/acoustic/instrumental ne redeviennent jamais la version studio

### Tests

248 tests dans 12 suites dédiées à l'audio, dont : ISRC exact, ISRC non indexé, résolution sur titre+artiste+durée seuls, écart de durée refusé, Audius muet → YouTube, Audius + YouTube muets → erreur propre, Audius jette → YouTube tenté, timeouts des deux côtés → `error` sans cache négatif, jamais le mauvais morceau malgré un titre identique, classification explicit/clean des deux sens.

---

## 5. FONCTIONNALITÉS

### IMPLÉMENTÉ

1. **Propagation `explicit`** — modèle, mapping Spotify, `PlayerTrack`, snapshot d'historique (`118d1da`)
2. **Source unique des scopes OAuth** + test de couverture des endpoints (`scopeCoverage.unit.test.ts`, 209 lignes) : interdit les portées d'écriture, impose une table fermée endpoint→scope, vérifie qu'il n'existe qu'un seul `SPOTIFY_SCOPES` dans le dépôt (`118d1da`)
3. **Correctif clavier** — `softwareKeyboardLayoutMode: 'resize'` + onglets et mini-player masqués pendant la saisie (`125ea77`)
4. **Hook `useKeyboardVisible`** — iOS `keyboardWill*`+`keyboardDid*`, Android `keyboardDid*`, désabonnement complet au démontage (`125ea77`)
5. **Recherche refondue** — debounce, annulation des requêtes périmées, historique, catégories, auto-focus, résultats groupés (`898c4dd`)
6. **Design system centralisé** `config/theme.ts` + application à toutes les surfaces (`4439ee2`, `bbe25cd`, `6cb0abf`)
7. **États manquants** — chargement de `PlaylistScreen` (il n'en avait **aucun**), état vide de `Preview` (`ListEmptyComponent`), clés `previewNoTracksTitle/Body` fr+en (`6cb0abf`)
8. **Accessibilité** — `accessibilityLabel` manquants sur les boutons _Lire_, _Réessayer_ et les chips de découverte ; cibles tactiles portées à 44 dp (`6cb0abf`)

### AMÉLIORÉ

1. **Shuffle / repeat / file** — 23 tests dédiés (`b004c2b`) : le morceau courant est épinglé en tête, permutation complète sans doublon, `next()` ne rejoue jamais le courant, traversée complète sans reprise ; repeat `off`/`all`/`one` sur fin naturelle ; `addToQueue` (fin) vs `playNext` (après le courant) ; suppression avec recalcul d'index ; métadonnées (album, durée, ISRC, explicit) préservées ; morceau indisponible ignoré sans bloquer la playlist
2. **Erreur non bloquante** — les artistes d'un album ne font plus disparaître l'écran en cas de panne secondaire
3. **Historique** — honnête : une entrée n'apparaît qu'après une lecture réellement confirmée (`isPlaying === true`), pas sur simple `playAsync()`

### BLOQUÉ

1. **Build APK** — `gh workflow run android-apk.yml` renvoie **HTTP 403 « Resource not accessible by integration »** : le jeton n'a pas la portée `workflow`. Aucun contournement tenté (conforme à la consigne). **Le dispatch doit être fait par vous dans l'interface GitHub.**
2. **Téléchargement des artefacts CI** — `results-receiver.actions.githubusercontent.com`, le stockage de blobs et `release-assets.githubusercontent.com` sont injoignables depuis ce bac à sable : aucun APK ne peut être téléchargé ni vérifié en SHA-256 localement.
3. **Test physique** — aucun `java` / `gradle` / `adb` dans le bac à sable. **Aucun test physique n'est revendiqué.**

### NON IMPLÉMENTÉ

- **Spotify Web** : reste un prototype isolé (`/settings/spotify-web-player`), **jamais** utilisé par le lecteur de production (vérifié : 0 référence dans `services/player.ts` et `services/audio/`). Non activé, non testé — conformément à la consigne.
- **Réordonnancement par glisser-déposer** de la file : `moveInQueue` existe et est testé, mais l'UI expose des boutons monter/descendre (pas de drag). Aucune régression, périmètre volontairement laissé tel quel.
- **Aucune écriture sur Spotify** : `SPOTIFY_SCOPES` ne contient délibérément aucune portée d'écriture. Les favoris de `FavoritesScreen` sont locaux et le disent explicitement.

---

## 6. TESTS / QUALITÉ

| Contrôle                                       | Résultat                                                                                             |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| **Jest (front)**                               | **100 suites passées, 15 ignorées, 115 au total** — **1162 tests passés, 15 ignorés, 1177 au total** |
| **Backend** (`npm test`, `node --test`)        | **45 passés / 0 échoué** — _identique sur `fceab85`, donc aucune régression_                         |
| **Backend typecheck**                          | exit 0                                                                                               |
| **TypeScript** (`tsc --noEmit`)                | **exit 0**                                                                                           |
| **ESLint** (`npm run lint`)                    | **exit 0**                                                                                           |
| **Prettier** (`prettier:check`)                | **exit 0** — « All matched files use Prettier code style! »                                          |
| **`git diff --check`**                         | **exit 0**                                                                                           |
| **Secrets**                                    | aucun `client_secret`, aucun Client ID en dur, aucun token                                           |
| **Bypass / DRM / injection DOM / spoofing UA** | aucun                                                                                                |

> **Note** — les nombres du backend ont d'abord été mal lus : lancer `npx jest` dans `server/` utilise le mauvais runner (le backend utilise `node --test` sur `dist-test`). La bonne commande donne 45/0 **à l'identique sur le commit de base**, vérifié dans un worktree détaché de `fceab85`.

### Tests ajoutés cette mission

| Fichier                                                      | Tests                       |
| ------------------------------------------------------------ | --------------------------- |
| `services/audio/__tests__/explicitPropagation.unit.test.ts`  | 9                           |
| `services/spotify/__tests__/scopeCoverage.unit.test.ts`      | garde-fou source            |
| `components/Search/__tests__/searchExperience.unit.test.tsx` | 25 (les 8 scénarios nommés) |
| `components/Search/__tests__/useRecentSearches.unit.test.ts` | 19                          |
| `hooks/__tests__/useKeyboardVisible.unit.test.tsx`           | 6                           |
| `app/(tabs)/__tests__/layoutKeyboard.unit.test.tsx`          | 6                           |
| `services/__tests__/shuffleRepeat.unit.test.ts`              | 23                          |
| `config/__tests__/theme.unit.test.ts`                        | 13                          |
| `screens/__tests__/screenStates.unit.test.ts`                | 22                          |

---

## 7. ANDROID

| Élément                                   | Valeur                                                                            |
| ----------------------------------------- | --------------------------------------------------------------------------------- |
| Workflow                                  | `android-apk.yml` (ID `368437882`)                                                |
| Dispatch                                  | **BLOQUÉ — HTTP 403** (jeton sans portée `workflow`)                              |
| Version / versionCode                     | `4.5.0-test.1` / `45001` — **inchangés**                                          |
| applicationId                             | `com.souxch06.melodix` — inchangé                                                 |
| Scheme natif / deep link                  | `melodix://callback` — inchangé, callback de test `comspotifytestsdk://` préservé |
| Derniers runs réussis (avant mes commits) | `37227637829`, `37223626471`, `37204472818` — tous `success`                      |
| APK de ce commit                          | **non produit** — à dispatcher par vous                                           |
| SHA-256                                   | **non calculable** (artefacts injoignables)                                       |
| Installation / lancement / smoke test     | **non réalisés** — aucun appareil, aucun outil Android                            |

**Action requise de votre côté** : dispatcher `android-apk.yml` sur `arena/01a106dd-melodix` (commit `6cb0abf`). Si vous configurez un redirect URI autre que `melodix://callback`, passez-le par l'input `spotify_redirect_uri`.

---

## 8. CONFIRMATIONS DE NON-RÉGRESSION

| Domaine                   | Statut | Preuve                                                                                                                                                                                                                                           |
| ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **OAuth Spotify**         | ✅     | Authorization Code + PKCE intact ; `SPOTIFY_SCOPES` = 4 portées en lecture seule, désormais **unique** dans le dépôt ; `scopeCoverage` (86 tests `services/spotify`) verrouille la couverture endpoint→scope et interdit toute portée d'écriture |
| **Catalogue Spotify**     | ✅     | `explicit` désormais propagé depuis `album.ts`, `playlist.ts`, `artist.ts`, `savedTracks.ts` et `search.ts` ; 248 tests audio verts                                                                                                              |
| **Recherche**             | ✅     | Refondue et testée (25 tests) ; debounce + annulation des requêtes périmées vérifiés                                                                                                                                                             |
| **Player**                | ✅     | Aucun second player créé ; les 9 statuts (`idle`→`unavailable`) intacts ; `playing` n'est jamais rapporté sans source réelle ; 23 tests shuffle/repeat/file                                                                                      |
| **Audius**                | ✅     | Moteur de matching **0 fichier modifié** ; prioritaire sur YouTube ; pannes jamais transformées en `no-match`                                                                                                                                    |
| **Fallback YouTube**      | ✅     | Même requête complète, même seuil ; jamais appelé si Audius trouve ; erreur réelle si les deux échouent                                                                                                                                          |
| **File d'attente**        | ✅     | `addToQueue` (fin) / `playNext` (après le courant) / `removeFromQueue` (recalcul d'index) / `moveInQueue` / `playAtIndex` / `clearQueue` — tous testés                                                                                           |
| **Shuffle**               | ✅     | Fisher-Yates avec le morceau courant épinglé en tête : jamais de reprise immédiate, permutation complète sans doublon                                                                                                                            |
| **Repeat**                | ✅     | `off` / `all` / `one` distinguent fin naturelle et saut manuel                                                                                                                                                                                   |
| **Historique**            | ✅     | Entrée uniquement après lecture confirmée (`isPlaying === true`) ; `playAsync()` seul ne suffit pas                                                                                                                                              |
| **MediaSession**          | ✅     | Aucune modification de `services/player.ts` cette mission (seuls des composants UI et des tests)                                                                                                                                                 |
| **Audio d'arrière-plan**  | ✅     | Aucune simulation ajoutée ; aucune revendication de test physique                                                                                                                                                                                |
| **Prototype Spotify Web** | ✅     | Reste désactivé en production, isolé, jamais appelé par le lecteur                                                                                                                                                                               |

---

## 9. CE QU'IL RESTE À FAIRE (vous)

1. **Dispatcher le build APK** sur `6cb0abf` (jeton sans portée `workflow` de mon côté) et vérifier installation / lancement / smoke test sur le Samsung Galaxy S24.
2. Si un problème d'indisponibilité persiste sur un morceau précis, fournir le titre + artiste : le diagnostic pourra être affiné sans toucher aux seuils.
