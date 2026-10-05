# RAPPORT FINAL — MISSION 5

**Correction des problèmes restants + validation réelle**

**Date** : 2026-10-05 · **Branche** : `arena/01a106dd-melodix` · **Dépôt** : `Souxch06/Melodix`

---

## 1. GIT

| Élément                 | Valeur                                                   |
| ----------------------- | -------------------------------------------------------- |
| Branch                  | `arena/01a106dd-melodix`                                 |
| Base commit             | `8629bd19a437b65d43ebcf4eb572c04ec9cfa289` ✅ (conforme) |
| Final commit            | **`cacacc0147ddb6fbd6d45e55787d4b9f1adb0112`**           |
| Working tree            | **propre**, synchronisé avec `origin`                    |
| **Main modified**       | **NO** — `main` = `fceab85`, intact                      |
| Commits (cette mission) | **3**                                                    |
| Fichiers modifiés       | **19** (`+2857` / `−19`)                                 |

### Les 3 commits

| SHA       | Objet                                                                            |
| --------- | -------------------------------------------------------------------------------- |
| `3e27003` | `feat(audio)` — diagnostic de résolution typé + fin des fuites de métadonnées    |
| `2f7665b` | `test(audio,ui)` — matrice de résolution, cache, shuffle × repeat, clavier, a11y |
| `cacacc0` | `test(audio)` — vérifie qu'aucune métadonnée privée ne fuite dans les journaux   |

---

## 2. AUDIO

### Cause trouvée

Le correctif `explicit` de la Mission 4 était réel mais **partiel**. L'audit du pipeline complet a révélé **deux autres causes**, toutes deux hors matching :

#### Cause A — fuites de métadonnées d'écoute dans les journaux (CORRIGÉE)

Trois sites exposaient ce qu'écoute l'utilisateur :

1. `services/audio/youtubeAudioProvider.ts` — `devYouTubeLog('spotify-input', …)` journalisait **en clair** le titre, les artistes, l'album, la durée et l'ISRC ; `devYouTubeLog('search-error', { query: text })` journalisait la formulation, qui **contient** titre + artistes.
2. `services/player.ts` — `console.error(\`Failed to play "${track.title}" (${track.id}):\`)` citait le titre **et** l'identifiant Spotify.

Le matcher Audius s'imposait déjà la contrainte (`titleLength`, `artistCount`, `hasAlbum`, `hasIsrc`). Les trois sites YouTube et le site player sont désormais dénaturés de la même façon : **seule la forme de l'échec sort**.

#### Cause B — aucun moyen de savoir POURQUOI un morceau n'était pas résolu (CORRIGÉE)

Le moteur calculait déjà une décision par candidat (`SongCandidateDecision`) mais **personne ne la remontait**. Un échec était indistinguable d'un autre : impossible de distinguer « le catalogue ne l'a pas » de « le bon enregistrement existe mais a été refusé par une porte stricte », ni « panne réseau » de « absence prouvée ».

### Corrections

**`services/audio/resolutionDiagnostics.ts`** (nouveau) — codes de panne typés :

`MATCHED` · `NO_CANDIDATE` · `NO_ISRC_MATCH` · `TITLE_MISMATCH` · `ARTIST_MISMATCH` · `DURATION_MISMATCH` · `CONTENT_RATING_MISMATCH` · `VERSION_MISMATCH` · `PROVIDER_ERROR` · `PROVIDER_TIMEOUT` · `NO_PROVIDER_RESULT` · `PLAYER_LOAD_ERROR`

- **Non invasif** : les deux providers captent la décision via le callback `onCandidateDecision` **déjà fourni** par le moteur. **Zéro requête réseau supplémentaire, zéro modification de l'algorithme.**
- **Confidentialité structurelle** : `isSanitizedDiagnostic()` valide une liste blanche de champs. Un seuil de longueur serait contournable (« Blinding Lights » fait 16 caractères) ; la liste blanche, non.
- **Borné** (50 entrées), en mémoire, aucun accès disque ou réseau : inerte en production.
- **Jamais affiché à l'utilisateur** — exploitable par les tests et le debug seulement.
- Le player distingue `PLAYER_LOAD_ERROR` (source **résolue** mais lecture en échec) d'un échec de résolution : `resolu ≠ charge ≠ lu`.

### Audius

- Ordre de cascade inchangé : **Audius prioritaire**, YouTube seulement après un échec fiable.
- Une panne de recherche est propagée (`throw new Error('Audius search incomplete')`), jamais transformée en « aucun résultat » → **aucun négatif durable sur une panne**.
- `AUDIUS_SEARCH_LIMIT = 24` inchangé.

### YouTube fallback

- Même seuil (`ACCEPT_SCORE = 55`), même moteur de score, même requête complète.
- Jamais appelé si Audius trouve (vérifié par test).
- Une panne du fallback est propagée, pas avalée.
- Flux Audius mort → YouTube pour **le même** morceau, sans skip (test existant, vérifié).

### Matching

**Aucun seuil modifié.** Vérifié par diff :

```
git diff 8629bd1 HEAD -- services/audio/audiusTrackMatcher.ts   → VIDE
```

`ACCEPT_MATCH_SCORE = 55`, `MIN_FUZZY_TITLE_SIMILARITY = 0.84`, `HARD_VARIANT_RX`, `MATCH_CACHE_VERSION = 6` — **tous intacts**.

Les fichiers modifiés dans `services/audio/` sont uniquement les **providers** (câblage du diagnostic + dénaturation des logs) et le **resolver** (enregistrement du diagnostic). La matrice de 34 tests prouve que les portes strictes tiennent toujours :

| Catégorie                                         | Résultat                                           |
| ------------------------------------------------- | -------------------------------------------------- |
| `feat.` / `ft.` / `featuring`                     | ✅ tolérés, mènent au bon morceau                  |
| featuring seul                                    | ❌ ne suffit JAMAIS à identifier un enregistrement |
| `Remastered` / `(Remastered)` / `Remastered 2011` | ✅ tolérés (bruit d'édition)                       |
| remaster trop différent en durée                  | ❌ refusé                                          |
| explicit ↔ explicit, clean ↔ clean              | ✅ retenus                                         |
| explicit → clean, clean → explicit                | ❌ **refusés** (`CONTENT_RATING_MISMATCH`)         |
| classification inconnue (`null`)                  | ✅ neutre, jamais rejetée par supposition          |
| `Remix` / `(Remix)` / `- X Remix`                 | ❌ **refusés** (`VERSION_MISMATCH`)                |
| remix demandé des deux côtés                      | ✅ retenu                                          |
| `Live` / `Acoustic` / `Instrumental` / `Karaoke`  | ❌ **refusés**                                     |
| live demandé des deux côtés                       | ✅ retenu                                          |
| ISRC exact                                        | ✅ contourne les portes (signal prioritaire)       |
| ISRC absent du catalogue                          | ✅ la recherche textuelle prend le relais          |

### Cache

- Négatif : **24 h**. Positif : **30 jours**. Inchangé.
- Un échec temporaire (réseau / timeout / provider en panne) n'écrit **rien** → le morceau reste réessayable. Vérifié par 13 tests de propriétés.
- Une résolution **lente** démarrée avant ne réécrit pas une décision plus récente (horodatage de **début**, pas de fin).
- Deux persistances concurrentes conservent leurs deux clés.
- La clé de déduplication en mémoire porte **tous** les signaux qui changent la décision stricte : ID, provider, titre, artistes, album, durée, **ISRC**, **explicit**. La clé persistante est l'ID Spotify (métadonnées immuables pour un ID donné).

### Remaining unavailable cases

Voir §8 — **je ne prétends pas que le problème est résolu**. Aucun test physique n'a été possible.

---

## 3. RECHERCHE

| Aspect                        | Statut                                                                                                      |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------- |
| **Debounce**                  | ✅ `SEARCH_DELAY_MS = 400`, vérifié nominal et non nul                                                      |
| **Stale response protection** | ✅ garde `isCancelled` présente ; un résultat d'une requête périmée ne peut pas écraser une requête récente |
| **History**                   | ✅ recherches récentes persistées (12 max), suppression individuelle, effacement total                      |
| **Categories**                | ✅ chips de découverte par genres                                                                           |
| **Keyboard**                  | ✅ correctif **structurel**, vérifié par garde-fou                                                          |

### Le correctif clavier, en détail

| Élément                  | Vérification                                                                                                                      |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `WindowSoftInputMode`    | `softwareKeyboardLayoutMode: 'resize'` (= `adjustResize`) — le **système** redimensionne la fenêtre                               |
| `KeyboardAvoidingView`   | présent, `behavior='padding'` sur iOS uniquement, `undefined` sur Android (le système s'en charge)                                |
| Safe Area                | aucun hack de marge ; la géométrie vient du système                                                                               |
| Bottom Tabs + MiniPlayer | masqués **par l'état** (`keyboardVisible ? null`), jamais par de la géométrie                                                     |
| Écran de recherche       | `flex: 1`, **jamais** de hauteur calculée (`height - BOTTOM_NAVIGATION_HEIGHT - HEADER_HEIGHT` supprimé)                          |
| **Hacks interdits**      | ✅ **aucun** `marginBottom: 3xx`, `paddingBottom: 3xx`, `height: 3xx`, `top: 3xx`, `translateY: xx` dans tout le chemin recherche |

Le mini-lecteur disparaît **avec** la barre d'onglets (même bloc conditionnel) : pas de barre de lecture posée sur le clavier, et la lecture en cours **continue** (le moteur audio est indépendant de l'affichage).

**Régression vérifiée** : le couple `onChangeText={setQuery}` / `onClear={handleClearField}` est bien séparé — c'était le bug auto-infligé de la Mission 4 (le clear câblé sur `onChangeText` effaçait le champ à chaque caractère).

---

## 4. PLAYER

| Aspect           | Statut                                                                                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Shuffle**      | ✅ Fisher-Yates, courant épinglé en tête, permutation complète sans doublon. **17 tests ajoutés** : file vide, file de 1, file de 2, bascules ON/OFF répétées, réactivation conservant le courant |
| **Repeat**       | ✅ OFF / `all` / `one`. Fin **naturelle** (`didJustFinish`) distinguée du saut **manuel** (`next()`) : `one` ne gouverne que la fin naturelle                                                     |
| **Queue**        | ✅ `addToQueue` (fin) / `playNext` (après le courant) / `removeFromQueue` (recalcul d'index) / `moveInQueue` / `playAtIndex` / `clearQueue`                                                       |
| **History**      | ✅ entrée uniquement après lecture confirmée (`isPlaying === true`) ; `playAsync()` seul ne suffit pas                                                                                            |
| **MediaSession** | ✅ **aucune modification** de `services/player.ts` côté MediaSession                                                                                                                              |
| **Background**   | ✅ aucune simulation ; la lecture continue quand la navigation est masquée par le clavier                                                                                                         |

### Les 6 combinaisons shuffle × repeat — toutes testées

| Combinaison   | Comportement vérifié                                                   |
| ------------- | ---------------------------------------------------------------------- |
| OFF + OFF     | fin du dernier → `ended`                                               |
| ON + OFF      | parcours complet, **chaque morceau exactement une fois**               |
| OFF + FILE    | fin du dernier → retour au premier                                     |
| ON + FILE     | boucle sans rejouer le morceau qui vient de finir                      |
| OFF + MORCEAU | fin naturelle → le même morceau                                        |
| ON + MORCEAU  | fin naturelle → le même morceau ; un `next()` manuel avance quand même |

**Aucune modification du player** pour faire passer les tests. Deux de mes attentes étaient fausses et ont été corrigées **dans le test**, après avoir vérifié que le comportement du moteur était le bon et déjà verrouillé ailleurs :

- un `next()` manuel en fin de file avec repeat OFF appelle `stop()` → `idle` (comportement délibéré, testé dans `player.unit.test.ts:535`) ;
- une fin **naturelle** produit `ended`.

---

## 5. TESTS

| Contrôle                         | Résultat                                                                                          |
| -------------------------------- | ------------------------------------------------------------------------------------------------- |
| **Jest (front)**                 | **109 suites passées, 15 ignorées, 124 au total** — **1291 tests passés, 15 ignorés, 1306 total** |
| **Backend** (`npm test`)         | **45 passés / 0 échoué** — identique au commit de base                                            |
| **Backend typecheck**            | exit 0                                                                                            |
| **TypeScript** (`tsc --noEmit`)  | **exit 0**                                                                                        |
| **ESLint** (`npm run lint`)      | **exit 0**                                                                                        |
| **Prettier** (`prettier:check`)  | **exit 0**                                                                                        |
| **`git diff --check`**           | **exit 0**                                                                                        |
| Tests supprimés / désactivés     | **AUCUN** (vérifié par `git diff --diff-filter=D` et recherche de `.skip`/`.only`)                |
| Tests désactivés (ESLint/TS off) | **AUCUN**                                                                                         |

### Tests ajoutés (86)

| Fichier                                                            | Tests |
| ------------------------------------------------------------------ | ----- |
| `services/audio/__tests__/resolutionDiagnostics.unit.test.ts`      | 15    |
| `services/audio/__tests__/resolutionMatrix.unit.test.ts`           | 34    |
| `services/audio/__tests__/resolutionDiagnosticsChain.unit.test.ts` | 14    |
| `services/audio/__tests__/logPrivacy.unit.test.ts`                 | 4     |
| `services/__tests__/matchCacheProperties.unit.test.ts`             | 13    |
| `services/__tests__/shuffleRepeatCombinations.unit.test.ts`        | 17    |
| `services/__tests__/playerLogPrivacy.unit.test.ts`                 | 2     |
| `app/__tests__/keyboardSearchLayout.unit.test.tsx`                 | 10    |
| `components/__tests__/accessibilityControls.unit.test.ts`          | 20    |

### Validation par mutation

Les tests de confidentialité ont été ** volontairement cassés** (fuite réintroduite) pour prouver qu'ils échouent, puis restaurés :

- Fuite YouTube réintroduite → `logPrivacy` **échoue** (2 tests rouges) ✅
- Fuite player réintroduite → `playerLogPrivacy` **échoue** ✅
- Fuite dans le diagnostic → **`tsc` refuse en amont** (`TS2353`) — la confidentialité est enforce au compile-time _et_ au runtime

Une première version de `logPrivacy` était **inefficace** : elle n'incluait pas le provider YouTube dans la cascade, donc son chemin de journalisation n'était jamais exercé. Le test de mutation l'a révélé ; le fichier a été corrigé.

---

## 6. ANDROID

| Élément                            | Valeur                                                           |
| ---------------------------------- | ---------------------------------------------------------------- |
| Workflow                           | `android-apk.yml` (ID `368437882`)                               |
| Dispatch                           | **BLOQUÉ — HTTP 403** « Resource not accessible by integration » |
| Commit built                       | —                                                                |
| APK                                | —                                                                |
| SHA-256                            | —                                                                |
| Installation / Launch / Smoke test | **non réalisés**                                                 |

```
APK build blocked by GitHub token permissions.
Manual workflow dispatch required.
```

Le jeton n'a pas la portée `workflow`. **Aucun contournement tenté.** Le dispatch est à faire par vous sur `cacacc0`.

Version / versionCode / applicationId / scheme : **inchangés** (`4.5.0-test.1` / `45001` / `com.souxch06.melodix` / `melodix://callback`).

---

## 7. ACCESSIBILITÉ

Parité `accessibilityLabel` / `accessibilityRole` vérifiée sur tous les contrôles nommés par le brief (Search, play, retry, chips, favoris, queue, shuffle, repeat, fermeture player). **Deux vrais manques corrigés** :

1. Le bouton **« Réessayer »** de `ErrorCard` n'avait **aucun** label accessible.
2. Dans `Preview/Track`, **la ligne et le bouton favori** n'en avaient aucun non plus. La ligne annonce désormais « titre — artiste », le favori « Ajouter/Retirer des favoris — titre ». Clés `trackSaveTrack` / `trackRemoveSaved` ajoutées en fr et en en.

Cibles tactiles portées à **44 dp** sur les actions de la file d'attente.

---

## 8. PROBLÈMES RESTANTS (honnêteté exigée)

### TRACK AVAILABILITY REMAINING ISSUE

**Je ne prétends PAS que le problème général des morceaux indisponibles est résolu.** Aucun test physique n'a été possible (pas de `java` / `gradle` / `adb`, et le bac à sable n'atteint que `api.github.com` et `registry.npmjs.org`). Les seules preuves dont je dispose sont des tests unitaires sur des catalogues **simulés**.

Pour chaque morceau réellement indisponible sur votre Galaxy S24, le rapport structuré à fournir est :

```
Track:
Spotify ID:
ISRC:
Artist:
Title:
Album:
Explicit:
Provider attempted:
Audius result:
YouTube result:
Reason:
```

Les codes `Reason` possibles sont désormais **produits automatiquement** par le diagnostic (`NO_ISRC_MATCH`, `ARTIST_MISMATCH`, `VERSION_MISMATCH`, `CONTENT_RATING_MISMATCH`, `DURATION_MISMATCH`, `PROVIDER_ERROR`, …). Il suffit de les lire dans le tampon après une lecture échouée.

### Limitations connues et documentées

1. **ISRC divergent ≠ rejet.** Si Spotify et Audius donnent deux ISRC différents, le matcher **ne rejette pas** : l'ISRC exact contourne les portes, mais une divergence n'accorde pas ce contournement. C'est une décision de conception (les métadonnées ISRC d'Audius sont rares et parfois erronées ; rejeter ferait disparaître de vrais enregistrements). Le comportement est **verrouillé par test** pour ne pas changer par accident. Risque résiduel : deux enregistrements distincts de même titre/artiste/durée mais d'ISRC différent peuvent être confondus.

2. **Aucune validation sur catalogue réel.** La matrice teste le **comportement du moteur**, pas la disponibilité réelle d'un titre donné sur Audius/YouTube.

3. **`PROVIDER_TIMEOUT` est défini mais pas encore produit.** Aucun timeout explicite n'existe dans la couche provider ; un timeout se manifeste aujourd'hui comme `PROVIDER_ERROR`. Le code est prêt, son producteur ne l'est pas.

4. **Spotify Web** : prototype isolé, jamais appelé par le lecteur de production. **Non modifié** pendant cette mission.

5. **Test physique** : non effectué. Aucune affirmation de lecture réelle n'est faite.

---

## 9. CONDITION DE FIN

| #   | Exigence                                         | Statut                                       |
| --- | ------------------------------------------------ | -------------------------------------------- |
| 1   | aucune régression introduite                     | ✅ tous les gates au vert, 0 test cassé      |
| 2   | le problème `explicit` reste corrigé             | ✅ tests de la Mission 4 intacts et verts    |
| 3   | le pipeline Audius → YouTube est vérifié         | ✅ 14 tests de cascade + 34 de matrice       |
| 4   | caches et erreurs temporaires vérifiés           | ✅ 13 tests de propriétés                    |
| 5   | shuffle/repeat/queue correctement testés         | ✅ 17 tests ajoutés, 6 combinaisons          |
| 6   | le bug clavier est corrigé proprement            | ✅ structurel, 0 hack géométrique            |
| 7   | la recherche ne produit pas de résultats périmés | ✅ garde d'annulation + debounce verrouillés |
| 8   | les tests passent                                | ✅ 1291 passés / 15 ignorés, backend 45/0    |
| 9   | aucun hack Spotify interdit                      | ✅ 0 secret, 0 bypass, 0 injection DOM       |
| 10  | les limites restantes sont documentées           | ✅ §8                                        |

**Priorité respectée** : LECTURE RÉELLE > STABILITÉ > CORRECTION DES BUGS > TESTS > UI. Aucune nouvelle fonctionnalité ajoutée.
