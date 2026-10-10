# RAPPORT-MISSION-6

**Branche :** `arena/01a106dd-melodix` · **Base :** `cacacc0` (fin Mission 5)
**Commit de mission :** `76ff1c1` (poussé) · **`main` intacte** (`fceab85`)

---

## 1. Git

| Élément             | Valeur                                                                        |
| ------------------- | ----------------------------------------------------------------------------- |
| Branche de travail  | `arena/01a106dd-melodix`                                                      |
| Commit de mission 6 | `76ff1c1`                                                                     |
| Fichiers modifiés   | 12 (2 modules sources modifiés, 2 modules ajoutés, 5 suites ajoutées, 2 docs) |
| Volume              | +2089 / −0                                                                    |
| `main`              | intacte, aucun commit dessus                                                  |
| Working tree        | propre après commit                                                           |

```
76ff1c1 Mission 6 : compléter le socle Spotify Web (diagnostics, classement
        d'échecs, contrat)
cacacc0 test(audio): verifie qu'aucune metadonnee privee ne fuite dans les
        journaux   ← base de mission
```

**Gates (tous exit 0) :**

| Gate                     | Résultat                                         |
| ------------------------ | ------------------------------------------------ |
| `tsc --noEmit`           | exit 0                                           |
| `npm run lint`           | exit 0                                           |
| `npm run prettier:check` | exit 0 (après `prettier --write` sur 5 fichiers) |
| `git diff --check`       | exit 0                                           |
| Jest (global)            | **114 suites / 1349 passés / 15 ignorés**        |
| Jest (`playbackBackend`) | **9 suites / 137 passés**                        |

Avant mission : 109 suites / 1291 passés. **Ajout net : 5 suites, 58 tests.**
Aucun test supprimé, aucun `.skip` ou `.only` ajouté, aucun garde-fou assoupli.

---

## 2. Architecture — avant / après

### Avant (audit Phase 1)

Le prototype Spotify Web était **beaucoup plus mature que prévu**. Environ
3 700 lignes existaient déjà dans `services/playbackBackend/` et étaient
presque intégralement réutilisables :

| Module                           | Lignes | Ce qu'il apportait déjà                                                                                                                                 |
| -------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `spotifyWebBridge.ts`            | 408    | protocole v2 versionné (v1 gelé), validation stricte des clés, corrélation par `requestId`, expiration, plafond 32 Ko, distinction ignoré / rejeté      |
| `spotifyWebRuntime.ts`           | 508    | cycle de vie complet : phases `idle/loading/awaiting-bridge/ready/recovering/failed`, causes de perte, portée de reconnexion, backoff exponentiel borné |
| `SpotifyWebBackend.ts`           | 378    | invalidation par session, `playing` **uniquement** depuis un état publié                                                                                |
| `spotifyWebMediaSessionProbe.ts` | 171    | probe standards-only (aucune surface interdite)                                                                                                         |
| `spotifyWebFeature.ts`           | 109    | **double verrou** : flag local + validation physique textuelle                                                                                          |
| `spotifyWebState.ts`             | 118    | projection `buffering`→`loading`, `ended`→`idle`                                                                                                        |
| `AudiusYouTubeBackend.ts`        | 89     | adaptateur sur le moteur existant                                                                                                                       |

Le double verrou était déjà là, testé, et mécaniquement verrouillé par un test
qui interdit à `PlayerContext.tsx`, `player.ts`, `mediaBridge.ts` et
`playbackSession.ts` de référencer le module Spotify Web, et qui épingle
`ORDER = ['audius','youtube']` dans `services/audio/index.ts`.

### Ce qui manquait réellement — trois trous

1. **Aucun classement d'échec.** Rien ne distinguait un échec Spotify Web
   d'une absence de morceau. C'était le risque le plus concret de toute
   l'intégration (détaillé §4).
2. **Aucun diagnostic structuré.** Aucun des neuf événements du cycle
   n'existait, donc aucune preuve horodatée n'était envisageable.
3. **Contrat incomplet.** `PlaybackBackend` n'avait ni `load`,
   `togglePlayPause`, ni `setVolume`.

### Après

```
services/playbackBackend/
├── types.ts                     ← contrat +3 méthodes (load, togglePlayPause, setVolume)
├── backendFailure.ts            ← NOUVEAU : 9 catégories, garde du cache négatif
├── spotifyWebDiagnostics.ts     ← NOUVEAU : 9 événements horodatés + preuve de lecture
├── SpotifyWebBackend.ts         ← +3 méthodes, +2 verrous de session (correctif)
├── AudiusYouTubeBackend.ts      ← +3 méthodes (load : limitation documentée)
├── spotifyWebBridge.ts          ← inchangé (protocole v2 gelé)
├── spotifyWebRuntime.ts         ← inchangé
├── spotifyWebFeature.ts         ← inchangé (double verrou intact)
└── __tests__/                   ← 5 nouvelles suites, 58 tests
```

**Rien n'a été recâblé dans le moteur de production.** `services/audio/index.ts`
garde `ORDER = ['audius','youtube']`, `PlayerContext` ne connaît pas Spotify
Web, et le garde-fou anti-câblage de `spotifyWebFeature.unit.test.ts` n'a pas
été touché.

---

## 3. Spotify Web

### 3.1 Classement des échecs — `backendFailure.ts`

Le brief exigeait : « un échec Spotify Web doit être distingué de track
unavailable, network error, timeout, player load error. Ne jamais mettre
automatiquement un morceau en cache négatif uniquement parce que Spotify Web
a échoué temporairement. »

Neuf catégories, **une seule règle énoncée une seule fois** :

| Catégorie            | Négatif durable | Retentable |
| -------------------- | --------------- | ---------- |
| `track-unavailable`  | **oui**         | non        |
| `network-error`      | non             | oui        |
| `timeout`            | non             | oui        |
| `player-load-error`  | non             | oui        |
| `bridge-unavailable` | non             | oui        |
| `renderer-destroyed` | non             | oui        |
| `command-refused`    | non             | oui        |
| `not-authorized`     | non             | oui        |
| `unknown`            | non             | oui        |

`retryable` est le complément **exact** du droit au négatif. Ce n'est pas une
coïncidence de confort : c'est le choix qui empêche un futur code d'incident
d'être oublié dans une seconde liste. Une seule liste, donc un seul endroit à
maintenir.

Une cause inconnue, absente, ou à préfixe trompeur
(`no-match-then-network-error`, qui contient `no-match` en préfixe) est
toujours un incident. **Le doute profite au morceau.**

### 3.2 Diagnostics structurés — `spotifyWebDiagnostics.ts`

Les neuf événements du brief, horodatés, avec l'écart mesuré à l'événement
précédent :

`SPOTIFY_WEB_LOAD` · `_READY` · `_PLAY_REQUEST` · `_PLAY_ACCEPTED` ·
`_PLAYING` · `_PAUSED` · `_BUFFERING` · `_ENDED` · `_ERROR`

**La distinction `PLAY_ACCEPTED → PLAYING` est le cœur de la preuve.** Un
acquittement dit seulement que la page a **reçu** l'ordre. Il ne dit pas
qu'un son est sorti. `derivePlaybackProof` ne conclut `proven: true` que sur
un `PLAYING` publié par la page, et expose la latence demande →
confirmation — la donnée qui manquait pour remplir honnêtement la ligne
« audio réellement audible » du tableau de résultats.

Confidentialité par construction, sur le modèle de `isSanitizedDiagnostic`
(Mission 5) : six champs en liste blanche, causes bornées à onze valeurs,
TypeScript refusant tout champ hors du type. La **propriété de fermeture**
est testée : l'univers des chaînes possibles est fini et énumérable (9 codes

- 11 causes), donc aucune chaîne libre ne peut apparaître.

Le tampon est borné (64 entrées), en mémoire, sans aucune I/O. Il est donc
inerte en production et entièrement pilotable par les tests.

### 3.3 Contrat complété

`load(track)`, `togglePlayPause()` et `setVolume(ratio)` ajoutés aux deux
backends.

Le backend Spotify Web honore la séparation « charger sans lancer » : un
`load` qui renvoie `true` signifie seulement que l'adaptateur a accepté la
demande. **Aucun état n'est déduit** — y compris `loading`. Passer à
`loading` serait déjà une invention : la page pourrait avoir refusé le
chargement après avoir accepté la commande. Tant que la page ne publie rien,
`getState()` reste sur son dernier état publié.

Le protocole de pont v2 reste **gelé à six commandes**. `load` et
`setVolume` vivent sur l'adaptateur runtime, seule couche qui sache faire
charger un morceau à la page. Un runtime qui ne les implémente pas renvoie
`false` — aucune capacité n'est inventée.

### 3.4 Défaut de robustesse trouvé et corrigé

En écrivant les tests de récupération, un défaut réel est apparu : **`ready`
était le seul message qui rouvrait le pont inconditionnellement.**

Le scénario est concret. Une WebView dont le renderer meurt juste après le
handshake laisse `ready` puis `state` dans sa file de messages. Rejoués tels
quels, le `ready` rouvrait la porte et le `state` mutait l'état — violant
exactement l'interdit du brief : « aucun événement d'un renderer détruit ne
doit modifier l'état ».

Deux verrous ajoutés, avec la distinction essentielle déjà celle du runtime :

| Cause de perte       | `ready` tardif | Pourquoi                                                                    |
| -------------------- | -------------- | --------------------------------------------------------------------------- |
| `renderer_destroyed` | **ignoré**     | document mort, le message ne peut venir que de lui                          |
| `bridge_timeout`     | accepté        | page peut-être seulement lente ; la rattraper vaut mieux qu'un rechargement |

Cette distinction n'est pas un compromis : elle est **déjà celle du runtime**,
qui s'appuie explicitement sur le fait qu'un `ready` tardif après
`bridge_timeout` peut supplanter une reconnexion planifiée. Un verrou global
aurait cassé ce comportement — deux tests existants l'ont immédiatement
signalé, ce qui a permis d'affiner la règle au lieu de l'imposer.

`destroy()` est par ailleurs irréversible : même un `ready` valide est refusé.

---

## 4. Android

**Aucun build Android n'a été produit et aucune preuve sur appareil réel
n'existe.** Les contraintes du bac à sable sont inchangées : pas de `java`,
pas de `gradle`, pas de `adb`, aucun réseau vers Spotify. Le workflow
`android-apk.yml` (ID `368437882`) renvoie toujours HTTP 403 — le jeton
d'intégration n'a pas la permission `workflow`. **La permission n'a pas été
contournée** : l'APK doit être dispatché manuellement par l'utilisateur.

Ce que le sandbox a pu établir, et uniquement cela :

| Élément                          | Statut                                    |
| -------------------------------- | ----------------------------------------- |
| `MediaSessionPayload` projection | code présent, testé, **non câblé**        |
| Module natif `melodix-media`     | présent, **non exercé**                   |
| Notification / arrière-plan      | **non testé**                             |
| Bluetooth / casque               | **non testé**                             |
| Widevine / EME                   | **non testé** (bloqué sur l'émulateur CI) |
| Lecture Spotify réelle           | **non testé**                             |

### Limitation d'architecture documentée

`PlaybackBackendStatus` reste **gelé aux cinq valeurs d'origine**. Le pont
distingue bien `buffering` et `ended`, mais `mapSpotifyWebBridgePayload` les
projette sur `loading` et `idle` — parce que `MediaSessionPayload`, côté
Android, n'a **aucun champ** pour les porter : il ne connaît qu'un booléen
`isPlaying`.

Ajouter ces deux états aurait créé des valeurs qu'aucune couche avale ne sait
interpréter, et qui feraient mentir la MediaSession. La distinction existe là
où elle est utile (charge utile du pont, pour le diagnostic) et est
explicitement résolue là où elle serait trompeuse. C'est une limitation
assumée, conformément à la règle « ne pas inventer de workaround ».

---

## 5. Preuve de lecture

### `REAL PLAYBACK: NOT VERIFIED`

**Aucune lecture Spotify Web réelle n'a été démontrée.** Pas sur appareil
physique, pas sur émulateur, pas dans ce bac à sable.

**Spotify Web infrastructure : OK**
**Spotify Web playback réel : NON DÉMONTRÉ**

Ce qui est prouvé, et prouvé par des tests exécutés :

| Fait prouvé                                                                          | Comment                                 |
| ------------------------------------------------------------------------------------ | --------------------------------------- |
| Le protocole de pont valide, versionne et corrèle correctement                       | 79 tests existants + 15 nouveaux        |
| `playing` ne peut venir que d'un état **publié** par la page                         | tests de contrat et de projection       |
| Un `load` accepté ne fait pas passer en lecture                                      | `backendContract`                       |
| Un `ready` d'un renderer détruit ne peut pas rouvrir le pont                         | `spotifyWebRecovery` (correctif + test) |
| Une séquence rejouée d'un renderer mort ne peut pas muter l'état                     | `spotifyWebRecovery`                    |
| Un incident Spotify Web ne peut pas créer d'entrée de cache négative                 | `backendFailure` (9 tests)              |
| Aucun titre, artiste, album, ISRC, jeton ou cookie ne peut entrer dans un diagnostic | `spotifyWebDiagnostics` (16 tests)      |
| La MediaSession ne peut annoncer la lecture que sur l'état `playing`                 | `mediaProjection` (7 tests)             |

Ce qui n'est **pas** prouvé, et ne peut pas l'être ici :

| Fait non prouvé                            | Pourquoi        |
| ------------------------------------------ | --------------- |
| La page Spotify Web charge dans la WebView | appareil requis |
| L'authentification Spotify aboutit         | appareil requis |
| Du son sort réellement                     | appareil requis |
| `PLAY_ACCEPTED` puis `PLAYING` arrivent    | appareil requis |
| La lecture survit 30 s en arrière-plan     | appareil requis |
| La notification contrôle la lecture        | appareil requis |
| Bluetooth / casque fonctionnent            | appareil requis |
| Widevine est disponible                    | appareil requis |

### Validation par mutation

Cinq régressions ont été délibérément réintroduites puis restaurées, pour
prouver que les tests attrapent réellement les pannes qu'ils prétendent
couvrir :

| #   | Mutation                                                    | Attrapée ?                |
| --- | ----------------------------------------------------------- | ------------------------- |
| 1   | Verrou de session retiré (un `ready` tardif rouvre le pont) | **oui** — 2 tests rouges  |
| 2   | `network-error` ajouté aux catégories à négatif durable     | **oui** — 5 tests rouges  |
| 3   | Champ `title` ouvert dans la liste blanche du diagnostic    | **oui** — 1 test rouge    |
| 4   | MediaSession faisant mentir `buffering` / `ended`           | **oui** — 2 tests rouges  |
| 5   | Garde de capacité `load` retiré                             | **non** — voir ci-dessous |

**La mutation 5 n'a pas été attrapée, et c'est signalé plutôt que masqué.**
Retirer `if (!this.runtime?.load) return false;` laisse le comportement
observable identique, parce que `runLatestCommand` possède déjà un filet
`try/catch` qui renvoie `false`. Le garde est donc **redondant**, pas
porteur. Un test artificiel aurait pu être écrit pour le rendre « couvert » ;
il n'aurait rien vérifié de réel. La redondance est défensive et documentée.

Sauvegardes restaurées depuis `/tmp`, vérifiées : `grep -rn "MUTATION" services/`
ne renvoie rien, et la suite complète repasse au vert.

---

## 6. Tests

### Nouvelles suites (5, 58 tests)

| Suite                   | Tests | Ce qu'elle verrouille                                                                                                 |
| ----------------------- | ----- | --------------------------------------------------------------------------------------------------------------------- |
| `backendFailure`        | 9     | classement des 9 catégories, exclusivité du négatif, préfixes trompeurs, insensibilité casse/underscore               |
| `spotifyWebDiagnostics` | 16    | les 9 événements, bornage du tampon, `derivePlaybackProof`, confidentialité par liste blanche, propriété de fermeture |
| `backendContract`       | 11    | `load`/`setVolume`/`togglePlayPause` sur les deux backends, bornes de volume, capacité absente, contrat complet       |
| `mediaProjection`       | 7     | un seul état annonce la lecture, charge utile hostile, bornage de position, album `null`                              |
| `spotifyWebRecovery`    | 15    | double ready, ready tardif (les deux causes), session obsolète, unmount, commande après perte, diagnostic borné       |

### Scénarios du brief Phase 11 — couverture

| Scénario demandé        | Couvert par                                           |
| ----------------------- | ----------------------------------------------------- |
| Renderer détruit        | `spotifyWebRecovery`, `spotifyWebBridgeV2` (existant) |
| WebView rechargée       | `spotifyWebRuntime` (existant)                        |
| Session obsolète        | `spotifyWebRecovery` (nouveau)                        |
| Commande tardive        | `spotifyWebBridgeV2` (existant)                       |
| Perte réseau            | `spotifyWebRuntime` (existant)                        |
| Délai d'attente dépassé | `spotifyWebBridgeV2`, `spotifyWebRuntime` (existants) |
| **Double ready**        | **`spotifyWebRecovery` (nouveau)**                    |
| **Ready tardif**        | **`spotifyWebRecovery` (nouveau)**                    |
| **Unmount**             | **`spotifyWebRecovery` (nouveau)**                    |

Les trois scénarios en gras n'existaient pas avant cette mission.

### Garde-fous préservés

| Garde-fou                                            | État                    |
| ---------------------------------------------------- | ----------------------- |
| Test anti-câblage `spotifyWebFeature`                | **intact**, non modifié |
| `ORDER = ['audius','youtube']` dans `audio/index.ts` | **intact**, non modifié |
| Protocole de pont v2 (6 commandes)                   | **intact**, non étendu  |
| Enum `PlaybackBackendStatus` (5 valeurs)             | **intact**, non étendu  |
| Interdits (cookie, token, DOM, dispatchEvent, etc.)  | respectés               |

Aucun test supprimé, aucun `.skip` / `.only` ajouté, ESLint et TypeScript
toujours activés.

---

## 7. Limitations

### 7.1 `load()` impossible sur le backend Audius/YouTube

Le moteur historique (`services/player.ts`) fusionne résolution et lecture
dans `playQueue`, sans primitive « charger sans lancer ». Le backend
Audius/YouTube ne peut donc **pas** honorer la sémantique de `load()` ; il
délègue à `playTrack`, ce qui produit du son.

C'est exactement la confusion `resolved ≠ loaded ≠ playing` que le backend
Spotify Web sait distinguer. La limitation est documentée dans le code, pas
masquée par un workaround. Un appelant qui a besoin d'un pré-chargement
silencieux doit utiliser le backend Spotify Web.

### 7.2 Le pont Spotify Web n'est pas câblé dans le moteur

La décision est prise et assumée : **le moteur de production reste sur
`audius → youtube`.** Trois raisons, toutes bloquantes :

1. Le garde-fou anti-câblage l'interdit mécaniquement. L'affaiblir pour
   obtenir du vert est exactement ce que la mission interdit.
2. La règle 1 du plan d'intégration l'interdit pour de bonnes raisons :
   activer supposerait de trancher qui alimente `positionMillis`, la file
   d'attente et l'audio d'arrière-plan — trois hypothèses qu'un test physique
   seul peut départager.
3. La lecture réelle n'est pas démontrée. Activer ferait prendre un risque
   réel aux utilisateurs pour un gain non prouvé.

**Ce que cela veut dire concrètement :** l'infrastructure est complète et
testée, mais son activation reste une décision d'architecture qui exige une
preuve sur appareil réel. Le travail livré rend cette activation possible —
il ne la présume pas.

### 7.3 `buffering` / `ended` non représentables dans `MediaSessionPayload`

Voir §4. Le module natif Android n'a qu'un booléen `isPlaying`. Les deux
états sont distingués au niveau du pont puis résolus en `loading` / `idle`.

### 7.4 Mutation 5 non attrapée

Voir §5. Le garde de capacité `load` est redondant avec le filet de
`runLatestCommand`. Comportement observable identique dans les deux cas.

### 7.5 Aucune preuve de lecture Spotify réelle

Voir §5. Ni bac à sable, ni CI, ni appareil. C'est la limitation principale
de cette mission, et elle est structurelle : elle ne peut pas être levée ici.

---

## 8. Conclusion

### PROUVÉ

| #   | Fait                                                                                                                                                        |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Un échec Spotify Web est **distingué** de `track-unavailable`, `network-error`, `timeout` et `player-load-error` — 9 catégories, tests à l'appui            |
| 2   | Un échec Spotify Web **ne peut pas** créer d'entrée de cache négative, sauf absence prouvée                                                                 |
| 3   | Les neuf événements du cycle existent, sont horodatés, et séparent acquittement et confirmation runtime                                                     |
| 4   | Aucun titre, artiste, album, ISRC, jeton ou cookie ne peut entrer dans un diagnostic — liste blanche + propriété de fermeture                               |
| 5   | `resolved ≠ loaded ≠ playing` est tenu jusqu'au bout : un `load` accepté ne déduit aucun état                                                               |
| 6   | La MediaSession n'annonce la lecture que sur un état `playing` publié par la page, jamais sur un clic UI                                                    |
| 7   | Aucun événement d'un renderer détruit ne peut muter l'état — **défaut réel trouvé et corrigé**, avec la distinction `renderer_destroyed` / `bridge_timeout` |
| 8   | Le contrat `PlaybackBackend` est complet : `load`, `togglePlayPause`, `setVolume` implémentés sur les deux backends                                         |
| 9   | Le double verrou de feature flag est intact et non affaibli ; le moteur de production reste sur `audius → youtube`                                          |
| 10  | Tous les gates sont verts : `tsc`, `eslint`, `prettier`, 114 suites / 1349 tests                                                                            |

### NON PROUVÉ

| #   | Fait                                                                                            |
| --- | ----------------------------------------------------------------------------------------------- |
| 1   | **La lecture Spotify Web réelle fonctionne** — `REAL PLAYBACK: NOT VERIFIED`                    |
| 2   | La page Spotify Web charge dans la WebView                                                      |
| 3   | L'authentification Spotify aboutit                                                              |
| 4   | `SPOTIFY_WEB_PLAYING` est effectivement publié par la page                                      |
| 5   | La lecture survit 30 s en arrière-plan, écran verrouillé                                        |
| 6   | La notification Android contrôle la lecture Spotify Web                                         |
| 7   | Bluetooth / casque fonctionnent avec le backend Spotify Web                                     |
| 8   | Widevine / EME sont disponibles sur un appareil réel                                            |
| 9   | La bascule de repli Spotify Web → Audius/YouTube se comporte correctement en conditions réelles |

### Ce qui reste à tester physiquement

La procédure et le tableau à remplir sont dans
`docs/SPOTIFY-WEB-PHYSICAL-TEST.md`, section « Champs ajoutés en Mission 6 ».
Les neuf événements étant désormais horodatés séparément, les lignes
`SPOTIFY_WEB_LOAD` / `_READY` / `_PLAY_REQUEST` / `_PLAY_ACCEPTED` /
`_PLAYING`, la latence demande → `PLAYING`, et les causes d'erreur sont
**mesurables** au lieu d'être des impressions.

Rappel de méthode, inscrit dans le document : `PLAY_ACCEPTED: oui` seul ne
vaut **pas** « lecture fonctionnelle ». Seul `PLAYING` compte. Si les deux
premiers arrivent et que `PLAYING` manque, la conclusion est « commande
acceptée, lecture non démontrée ».

**L'APK doit être dispatché manuellement** : le workflow `android-apk.yml`
renvoie HTTP 403 au jeton d'intégration, et la permission n'a pas été
contournée.

---

### Position finale

Le pont et le runtime sont parfaitement prêts. L'infrastructure est complète,
testée, et un défaut de robustesse réel a été trouvé et corrigé au passage. La
bascule est maintenant une question de preuve, plus une question de code.

**La lecture Spotify réelle n'a pas pu être démontrée dans cet environnement,
et ce rapport ne prétend pas le contraire.**
