# RAPPORT MISSION V6 — EXACTITUDE DES VERSIONS + CATALOGUE SPOTIFY

**Date** : 7 octobre 2026 — **Branche** : `arena/fcdae8c6-melodix` — **PR** : #6
**Départ** : `727785d` (fin v5) — **Priorité absolue** :
**« Mieux vaut afficher indisponible que jouer une mauvaise version. »**

---

## 1. Ce qui a été corrigé (et pourquoi c'est le vrai problème)

### Problème 2 — « une mauvaise version (remix) à la place de l'original »

L'audit du moteur (`audiusTrackMatcher.ts`) a montré que l'architecture
demandée par la mission existait déjà (normalisation, ISRC, durée,
artistes, classification de variantes, score minimal, rejet de variantes,
porte variante **avant** le score final). Mais un **trou réel** a été
identifié et corrigé :

**Le trou** : la classification ne reconnaissait que 19 classes. Les
marqueurs `Cover`, `Tribute`, `Acapella`, `Piano (Version)`,
`Re-recording`, `Edit` (simple) **n'étaient pas des classes** — or
`canonicalizeFromTitle` **efface les parenthèses** pour comparer les
titres : `« Song (Piano Version) »` devenait `« song »`, passait la porte
variante (aucune détection), obtenait titre exact + artiste + durée, et
**remplaçait l'original**. C'est précisément le mécanisme du « remix
observé physiquement » pour ces variantes.

**Corrections matching** (fichier par fichier) :

- `services/audio/types.ts` : enum `TrackVariantClass` 19 → **25 classes**
  (+ `cover`, `tribute`, `acapella`, `piano`, `rerecording`, `edit`) —
  toutes **dures** (enregistrement différent).
- `services/audio/audiusTrackMatcher.ts` :
  - 6 marqueurs ajoutés à `VARIANT_MARKERS` (+ forme `radio_edit`
    prioritaire sur `edit` pour « Radio Edit ») ; `VARIANT_CLASS_PRIORITY`
    réordonné ; `HARD_VARIANT_CLASSES` en dérive automatiquement ;
  - **porte durée recalibrée et documentée** (ancienne : `> 60 s ET > 30 %`
    — trop large) : **REJET si écart > 45 s absolues OU ≥ 25 % relatifs**.
    Conséquences verrouillées : 3:42 / 4:55 (+33 %) → **rejet** même titre
    - artiste + album exacts ; 3:42 / 5:18 → rejet ; 3:42 / 3:41 →
      accepté ; 5:00 / 5:25 (outro différent, 8 %) → admissible ;
  - **motif de rejet ISRC explicite** : `isrc-conflict` (avant, dilué dans
    `below-threshold`) — le conflit ISRC reste une **pénalité -25 avec
    échappatoire quasi-parfaite seule** (jamais un score fuzzy seul) ;
  - canonisation alignée : « Song - Cover/Tribute/Piano/Re-recording »
    (forme dash) traitées comme leurs équivalents parenthésés.
- `services/audio/resolutionDiagnostics.ts` : code `ISRC_MISMATCH` ajouté
  (liste fermée), mapping `isrc-conflict → ISRC_MISMATCH`, position de
  dominance après `VERSION_MISMATCH`, 6 nouvelles classes dans la liste
  fermée de dénaturation.
- **Non modifié** (volontaire) : OAuth, SecureStore, redirect URI, Spotify
  WebView/Backend/Bridge, MediaSession, notification, lockscreen,
  Bluetooth, background, queue, shuffle/repeat, seek, PlayerController,
  providers Audius/YouTube (seulement le moteur partagé qu'ils utilisent),
  règle ISRC v4 (identique = 100 ; conflit = base − 25, stricte ≥ 56.5).

### Problème 1 — « le catalogue n'affiche pas suffisamment de pistes »

**Audit** : aucune couche UI ne tronquait les résultats (`Search.tsx`
rend l'intégralité de `results.tracks` ; vérifié Recherche/Accueil/
Bibliothèque). La seule limitation était la **borne API : 500 pistes,
servies séquentiellement**.

**Correction** (`api/spotify/search.ts`) :

- pagination tracks en **vagues parallèles (4 requêtes)** ;
- borne dure 10 → **40 pages = 2000 pistes** (40 % de la capacité brute
  de l'API `offset+limit ≤ 5000`) ;
- **latence inchangée** : 40 pages en 10 vagues parallèles ≈ l'ancien
  10 pages séquentielles (4× la couverture au même temps) ;
- règles conservées et re-verrouillées : page 1 toujours servie (sa faute
  est propagée — jamais d'erreur réseau transformée en « aucun
  résultat »), arrêt **après** la vague contenant la première page
  épuisée (toute vague déjà servie est conservée), page secondaire en
  échec ne bloque pas la recherche (arrêt prudent), dédup **stricte par
  ID Spotify**, ordre de pertinence conservé, autres types en page
  unique, cascade Spotify → backend → Audius inchangée (aucun faux
  catalogue Audius/YouTube mélangé aux résultats Spotify).

---

## 2. Git

- **Branche** : `arena/fcdae8c6-melodix` (aucune autre branche)
- **Départ** : `727785d` — **Code** : `518ea02` — **HEAD final** : ce
  commit de rapport sur `518ea02`
- **Commits** :
  1. `518ea02` — `feat(matching+catalogue): exactitude des versions +
catalogue 2000 pistes (v6)` (15 fichiers, +895/−130)
  2. ce commit de rapport — **aucun commit vide**
- **Fichiers réellement modifiés** (code) :
  - `api/spotify/search.ts` — pagination parallèle, borne 40
  - `api/search/searchCatalog.ts` — commentaire de borne
  - `services/audio/types.ts` — 6 classes de variante
  - `services/audio/audiusTrackMatcher.ts` — marqueurs, priorité, porte
    durée, motif `isrc-conflict`, canonisation
  - `services/audio/resolutionDiagnostics.ts` — `ISRC_MISMATCH`, listes
    fermées
  - **Tests** : `wrongVersionGuards.v6.unit.test.ts` (nouveau, 34 tests),
    `search.unit.test.ts` (pagination en vagues),
    `audiusTrackMatcher.unit.test.ts` (portes durée v6),
    `exactVersionMatching.unit.test.ts` (matrice 23 classes + variantes
    dures)
  - **Bump 4.5.0-test.9/45009** (8 références : package.json,
    app.config.js ×2, mock expo-constants, android-apk.yml ×2, 2 tests
    Settings)
- **Push** : réussi — PR #6 mise à jour — **HEAD final ≠ `727785d`** ✓

---

## 3. Gates (chiffres exacts)

| Gate                                                    | Résultat                                                                               |
| ------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| **Jest** (`npx jest --runInBand`)                       | ✅ **1916 passed / 0 failed / 14 skipped** (1930 total) — baseline v5 : 1856 → **+60** |
| **TypeScript** (`tsc --noEmit`)                         | ✅ 0 erreur                                                                            |
| **ESLint** (`expo lint`)                                | ✅ 0 erreur / 0 warning                                                                |
| **Prettier** (`prettier --check **/*.{ts,tsx,json,md}`) | ✅ OK                                                                                  |

⚠️ **Note d'honnêteté (flake préexistant)** : le test
`FullPlayer › drag milieu → 50 %` (non modifié par cette mission, zone
« ne pas toucher ») a échoué **1 fois sur 6 runs** de la suite complète
sous `--runInBand` (dépendance timing de geste de drag), et est repassé
vert aux 3 relances suivantes. Il n'est **pas** lié aux changements v6
(zone UI/seek non modifiée).

---

## 4. CI — run `37575593802` (code `518ea02`) : **SUCCESS (16 min 54)**

- Job « Construire l'APK » : success
- `npm test -- --runInBand` dans la CI : **vert** (jest.log archivé)
- **Smoke Android 14 x86_64** : « installation + prototype WebView +
  cycle arrière-plan/retour + service foreground + MediaSession +
  notification + deep-link OAuth (A et B) réussis (pid=6171) »

---

## 5. APK

| Champ                  | Valeur                                                                                                                             |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Nom                    | `Melodix-v4.5.0-test.9-518ea02.apk`                                                                                                |
| Version                | **4.5.0-test.9** / versionCode **45009**                                                                                           |
| Taille                 | **47 001 601 octets** (≈ 47 Mo ; 89 Mo non compressé)                                                                              |
| **SHA-256**            | `037c8f1b048912ad4451282f33b504fa260edcb932f1c2dca1ce1d589107eb8d`                                                                 |
| Package                | `com.souxch06.melodix` (signature V3, certificat `fac61745…b9c` inchangé)                                                          |
| ABIs                   | `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`                                                                                        |
| SDK                    | minSdk 23 / targetSdk 34 / compileSdk 34                                                                                           |
| HEAD construit         | **`518ea02`** — vérifié : le suffixe du nom de l'APK porte le commit exact poussé, et la version 45009 n'existe que dans cet arbre |
| Installation/lancement | vérifiés en CI (émulateur Android 14) — à installer manuellement sur votre téléphone depuis l'artefact                             |

---

## 6. SÉPARATION STRICTE DES NIVEAUX DE PREUVE

### A. FONCTIONNEL (implémenté, câblé)

- Catalogue Spotify : 2000 pistes max, vagues parallèles (4), borne
  documentée, tolérance d'échec de page secondaire, dédup stricte,
  ordre de pertinence, cascade intègre
- Matching : 25 classes de variante dont 21 dures ; porte variante
  **avant** le score final ; porte durée > 45 s ou ≥ 25 % ; ISRC
  identique = 100 / conflit = −25 (échappatoire quasi-parfaite seule) ;
  featuring ; artiste principal ; content rating clean/explicit
- Diagnostics : motif `isrc-conflict` → `ISRC_MISMATCH` explicite,
  listes fermées étendues, zéro donnée d'écoute

### B. TESTÉ AUTOMATIQUEMENT (Jest 1916/0)

- **Original/variante** (12 variantes verrouillées individuellement +
  cas imposé « Song (Remix) », « Song », « Song (Live) » → seul « Song »)
  — motif de rejet `variant-mismatch` vérifié (porte, pas seuil)
- **ISRC** : identique accepté prioritairement ; différent + ambigu →
  rejet ; motif `isrc-conflict` ; diagnostic `ISRC_MISMATCH` dénaté
- **Durée** : 3:42/4:55 rejet, 3:42/5:18 rejet, 3:42/3:41 accepté,
  5:00/5:25 accepté, 10:00/10:40 accepté, 70 s/300 s rejet, 50 s/100 s
  rejet (24 tests de durée)
- **Featuring** : feat/ft/featuring équivalents ; mauvais artiste → rejet
- **Album+durée** : ambigu → rejet ; bien identifié → accepté
- **Chaîne** : Audius faux→YouTube correct servi ; Audius correct→
  YouTube jamais consulté ; les deux faux → `no-match` ; aucun candidat
  fiable → jamais de faux match
- **NON-RÉGRESSION CRITIQUE** : remix « plus lisse » au fuzzy plus haut
  ne bat JAMAIS l'original ; joli candidat sans ISRC ne bat JAMAIS l'ISRC
  identique ; deux lives, seul l'ISRC exact gagne
- **Catalogue** : 10 tests de pagination vagues (parallélisme, arrêt
  post-vague épuisée, borne 40, 2000 pistes max, dédup, échec secondaire,
  page 1 propagée, types page unique)

### C. TESTÉ SUR ÉMULATEUR (CI, Android 14 x86_64)

- Installation de l'APK 45009, cold/warm start, cycle arrière-plan/retour,
  service foreground, session MediaSession + notification, deep-links
  OAuth (wiring — pas un login réel, aucun compte en CI)
- ⚠️ La smoke ne mesure **pas** le son ni la qualité du matching :
  elle prouve le câblage, pas « la bonne version est jouée ».

### D. TESTÉ PHYSIQUEMENT

- **Cette mission : rien** — aucun téléphone dans cet environnement.
- (Héritage, confirmé par vous : login Spotify réel, lecteur Spotify Web.)

### E. NON TESTÉ

- **La correction du matching sur appareil** (le remix/mauvaise version
  observée doit disparaître en conditions réelles — c'est à VOTRE
  validation physique)
- **La profondeur du catalogue 2000 sur appareil** (latence réelle des
  vagues parallèles sur réseau mobile, rate limiting Spotify réel)
- Lecture audio réelle Audius/YouTube (mission suivante : suppression)
- Casque/Bluetooth/Audio Focus physiques (inchangés, toujours non testés
  physiquement)

---

## 7. LIMITES

1. Pas d'environnement Android local (ni Java, ni SDK, ni adb) → build,
   smoke et installation uniquement en CI (émulateur x86_64 Android 14).
2. La smoke CI ne vérifie pas le signal audio ni la décision de matching
   en conditions réelles : les garanties v6 sont **automatiques**
   (Jest), pas **physiques**.
3. Le flake `FullPlayer drag → 50 %` (préexistant, 1/6 runs) peut faire
   échouer un `--runInBand` sous charge — documenté §3.
4. Les providers Audius/YouTube sont **conservés** cette mission (règle
   identique du matching pour les fallbacks) : leur suppression est la
   **prochaine mission** (« Spotify Web Player ONLY »), après votre
   validation physique de cette mission.
5. Spotify officiel uniquement pour le catalogue : aucun endpoint privé,
   aucun scraping, aucun cookie/token extrait du Web Player, aucun
   contournement DRM, aucun résultat inventé.

---

## 8. Protocole de validation physique (à l'utilisateur)

Avec l'APK `Melodix-v4.5.0-test.9-518ea02.apk` :

1. Rechercher un titre populaire → compter les résultats « Morceaux » :
   le catalogue doit être nettement plus profond (jusqu'à 2000 pour les
   requêtes très populaires ; les requêtes courtes s'arrêtent dès que
   Spotify épuise ses résultats).
2. Jouer un morceau demandé comme **original** : vérifier que le morceau
   joué est bien l'original (titre affiché, pas de « Remix/Live/Cover/
   Piano ») — la plainte physique doit disparaître.
3. Jouer un morceau demandé **en variante explicite** (« Song (Remix) »
   dans Spotify) : la variante est recherchée (pas l'original).
4. Un morceau sans candidate fiable doit afficher « indisponible » et la
   file avancer — **jamais un faux morceau**.
5. Vérifier que Spotify Web Player, MediaSession, file/queue, seek,
   shuffle/repeat, arrière-plan fonctionnent comme en v5 (rien ne doit
   avoir bougé).
