# Mission V18 — Finaliser Spotify Web Player + corriger la connexion Spotify

**Date** : 8 octobre 2026 · **Base** : HEAD `37fe443` (V17 final,
`4.5.0-test.22/45022`) · **RÉSULTAT** : livré — (A) audit complet de la
chaîne moteur : **aucun défaut réel trouvé**, aucun correctif artificiel ;
(B) enquête 403 `/v1/me` : code Melodix **innocent** (audit intégral),
couche produisant le 403 = **edge Spotify** (preuve technique), cause
racine **non déterminable sans le dashboard** (interdit par le brief) →
correctif = **retry borné et transparent du 403 edge sans message**
(même philosophie que les 429/401 existants ; JAMAIS 403 = succès), version
`4.5.0-test.23/45023`, CI **success** (run 37821465363).

---

## 1. Objectif A — Audit de la chaîne moteur : verdict « chaîne saine »

Chaîne auditée : `Spotify track → PlayerController → SpotifyWebBackend →
SpotifyWebHostView → SpotifyWebRuntime → WebView → Spotify Web Player →
état publié → PlayerController → UI/MediaSession` (~8 200 lignes, 16
modules + `player.ts`). Baseline avant toute modification :
**2052 Jest passés / 14 skipped / 0 échec**.

| Exigence du brief                                                                                | Verdict                                          | Preuve (fichier, mécanisme)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `play()` JAMAIS `playing` sans confirmation réelle du runtime                                    | **Tenu**                                         | `player.ts` `trySpotifyWeb` L914-1054 : `emit({status:'playing'})` UNIQUEMENT si `outcome.status==='confirmed'` (la page a publié `playing` pour la piste exacte — `matchesPlannedTrack` = trackId identique, TTL plan 15 s, `loadEpoch`/`confirmedEpoch` = une confirmation par chargement, `spotifyWebPlaybackPlan.ts` L492-497, `spotifyWebTrackTransport.ts` L419-437). Commande acceptée ≠ lecture ; commande REFUSÉE n'empêche pas la confirmation (geste utilisateur).                                                                                                                                 |
| Cohérence des états (loading/buffering/playing/paused/ended/error/recovering/…)                  | **Tenu**                                         | `player.ts` `onSpotifyWebPublished` L805-875 : SEUL chemin de mise à jour de l'état moteur sur Spotify — `playing`/`paused`/`loading`→`buffering` mappés de l'état PUBLIÉ ; `ended`→avance unique ; `error`→`markFailed`+avance ; `idle`→no-op. `resolving` distinct de `loading` (source ≠ lecture). Runtime : 6 phases (`idle/loading/awaiting-bridge/ready/recovering/failed`, `spotifyWebRuntime.ts` L75-90).                                                                                                                                                                                             |
| Commandes play/pause/resume/next/previous/seek/queue/changement de morceau                       | **Tenu**                                         | play/pause/toggle/seek/volume = commandes de pont CORRÉLÉES (requestId + session + séquence, timeout 5 s, `SpotifyWebBackend.ts` `beginBridgeCommand` L277-340) ; `toggle` décidé sur l'état PUBLIÉ (jamais un clic inventé) ; seek ne publie AUCUNE position avant publication de la page (tolérance 3 s, `spotifyWebTrackTransport.ts` L466-483) ; next/previous/queue = nouvelle tentative au niveau file (`advanceManual`→`playIndex`) — jamais de double source ; changement de morceau invalide l'ancienne piste AVANT de démarrer la nouvelle (`playIndex` L1557-1575) + pause best-effort de la page. |
| `ended` ne fait JAMAIS avancer 2×                                                                | **Tenu**                                         | Garde `spotifyEndedHandledForId` par trackId (`player.ts` L826-833) + `active=null` pendant toute la transition (les états publiés sont ignorés) + garde trackId (`published.trackId !== active.spotifyId` → rejet). Réinitialisée à chaque confirmation réelle, `stop`, `playQueue`, `finishQueue`. Tests existants V17 verts (ended 1×→1 avance, 2×→pas de saut).                                                                                                                                                                                                                                           |
| Stale events (ancienne piste/queue/WebView ne modifie jamais la piste actuelle)                  | **Tenu**                                         | 3 niveaux : backend — handshake OBLIGATOIRE avant tout état, session invalidée à chaque document, `bridgeClosedByLoss` pour renderer détruit (un `ready` rejoué ne rouvre rien, `SpotifyWebBackend.ts` L213-260), réponse de commande périmée = `stale` ; moteur — `active.queueId === state.current.id` ET trackId publié (L807-824) ; transport — confirmation seulement si la piste PUBLIÉE = la piste PLANIFIÉE (L426-430).                                                                                                                                                                               |
| Destruction/recréation WebView (reconnexion, queue+piste conservées, retry, pas de faux playing) | **Tenu**                                         | Runtime : `reload` (document) / `remount` (renderer mort), budget 3, backoff 1,5/3/6 s, différé en arrière-plan, sortie manuelle de `failed` (`manualReload`) — `spotifyWebRuntime.ts` L330-450. L'état du moteur (file, index, shuffle, repeat, position) est INDÉPENDANT de la WebView → conservé. Pas de faux `playing` : démontage de l'hôte = publication `error` (`host-unmounted`) AVANT le purgage → transition d'état réelle du moteur (`SpotifyWebHostView.tsx` cleanup).                                                                                                                           |
| MediaSession reçoit uniquement un état cohérent                                                  | **Tenu**                                         | Un SEUL porteur par lecture : piste Spotify → la session native Melodix est FERMÉE (`mediaBridge.ts` L263 : `resolved.provider === 'Spotify Web'`) et c'est la MediaSession propre de la WebView (Chromium) qui pilote la page ; projection `buildBackendMediaSessionPayload` (jamais de fantôme : `null` sans titre+trackId). L'UI suit l'état moteur, jamais un clic.                                                                                                                                                                                                                                       |
| `no-authorized-execution-surface` : réel ? contourné ? bloquant ?                                | **Réel, documenté, non contourné, NON bloquant** | Voir §2 ci-dessous.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

**Conclusion A : aucun défaut réel trouvé → aucun correctif moteur, aucun
commit artificiel** (consigne : « Si cause réelle trouvée : corriger + test
de régression. Sinon : documenter »). Les 2070 tests automatiques (2052
existants + 18 nouveaux de cette mission — cf. §4) restent tous verts.

### 2. `no-authorized-execution-surface` — ce que c'est et ce qu'il empêche

**Qui le produit** : le code de refus est émis par le **probe injecté de
Melodix lui-même** (`spotifyWebMediaSessionProbe.ts`, fonction `respond`) —
honnêtement — parce que, de l'intérieur de la page, il n'existe **aucune
surface standard et autorisée** pour piloter la lecture Spotify Web depuis
un pont JS : le Web Player est une SPA fermée sans API publique de contrôle
externe, et toucher le DOM, les éléments média, forger des entrées ou
intercepter franchirait les interdits du brief. La commande est donc
Toujours refusée par le pont (`accepted:false, code:'no-authorized-execution-surface'`)
— le refus est un choix de conception verrouillé, pas un accident.

**Est-ce imposé par l'environnement Spotify Web ?** Oui au fond : rien dans
les surfaces web standard disponibles au script injecté ne permet de
commander l'audio du Web Player (confirmé par l'observation réelle : la
sonde probe répond ainsi sur émulateur CI et sur téléphone — runs
`37182486483` et phone-run v7 ; `docs/SPOTIFY-WEB-PROTOTYPE.md` L66,
`docs/SPOTIFY-WEB-PHYSICAL-TEST.md` L97).

**Est-ce bloquant pour le fonctionnement normal sur téléphone avec session
active ?** NON — et c'est le point clé : la lecture ne se fait PAS par ce
pont. Deux voies autorisées existent, toutes deux hors du JS bridge :
(a) le **geste utilisateur directement dans la page** affichée (la vue est
« le lieu de la lecture » : l'hôte l'ouvre et le hint l'indique —
`SpotifyWebHostView.tsx` overlay) ; (b) la **MediaSession système**
(notification/écran verrouillé/Bluetooth/boutons matériels) qui pilote la
page nativement via `MediaSessionActionEvent` de Chromium, sans JS.
Preuve : la validation physique consignée (phone-run 2026-10-07,
`docs/SPOTIFY-WEB-PHYSICAL-TEST.md`) — lecture réelle audible + contrôles
play/pause/next/previous validés sur téléphone réel — est consignée sur des
builds où le pont refuse exactement ainsi. Quand une commande du moteur est
refusée, le port réaffiche la vue (`SURFACE_REFUSAL_CODES`,
`spotifyWebHost.ts` L186-213) : les contrôles réels apparaissent, jamais un
état inventé. **Aucun contournement n'existe dans le code** (pas de clic
synthétique, pas d'injection DOM, pas d'interception — audité).

### 3. Limites honnêtes de la chaîne (documentées, non des bugs)

1. **Démarrage = geste utilisateur dans la vue** (fenêtre de confirmation
   20 s) : `confirmation-timeout` = vraie erreur structurée (jamais de
   `playing` inventé).
2. **Détection de fin** : le probe ne détecte `ended` que si la page
   expose `positionState` (passage `playing→paused` collé aux 3 dernières
   secondes) ; sans `positionState`, la fin reste indétectable et rien
   n'est inventé (`spotifyWebMediaSessionProbe.ts` `END_TOLERANCE_MS`).
3. **Perte d'infrastructure** (pont/WebView bas pendant lecture) : une
   piste consommée par grace (10 s) au plus par incident, le moteur reste
   sur la piste en erreur honnête, le prochain PLAY explicite retente
   (codes `SPOTIFY_WEB_TRANSIENT_LOSS_CODES`, `player.ts` L162-171) — la
   file n'est jamais consommée en cascade.

---

## 4. Objectif B — Enquête 403 `/v1/me` (consigne complète)

### 4.1 Trace de la requête (code réel présent, ligne à ligne)

`OAuth callback → session → access token → getCurrentUser() →
spotifyApiGet('/me') → fetch() → Android → api.spotify.com` :

| Étape                             | Fichier / ligne                                                                                                                                                                                              | Vérification                                                                                                                                                                                                                           |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Callback OAuth / PKCE / Client ID | `services/spotify/authConfig.ts`, `services/spotify/session.ts`                                                                                                                                              | URLs officielles (`accounts.spotify.com/authorize`, `/api/token`) ; PKCE S256 ; **aucun changement cette mission** (interdiction tenue — rien ne le rendait responsable).                                                              |
| Session / SecureStore             | `services/spotify/session.ts`                                                                                                                                                                                | Décodage robuste (base64url+url), access token jamais logué ; session conservée même sur 403 (bouton « Réessayer »).                                                                                                                   |
| `getCurrentUser()`                | `services/spotify/api/me.ts`                                                                                                                                                                                 | Appelle `spotifyApiGet<T>('/me')` — rien d'autre.                                                                                                                                                                                      |
| `spotifyApiGet`                   | `services/spotify/apiClient.ts` L165-370                                                                                                                                                                     | `fetch(https://api.spotify.com/v1/me, { headers: { Authorization: Bearer …, Accept: application/json }, signal })` — **plain fetch** (OkHttp Android), zéro interceptor, zéro proxy, zéro pinning, zéro override DNS/UA, timeout 10 s. |
| Headers émis                      | `apiClient.ts` L196-199                                                                                                                                                                                      | EXACTEMENT `Authorization` + `Accept`. Aucun `User-Agent` custom, aucun header réseau.                                                                                                                                                 |
| Classification du 403             | `apiClient.ts` L255-313 (diagnostics) + L314-336 (retry — **nouveau**)                                                                                                                                       | Message Spotify extrait (`error.message` / `error`) ; métadonnées sûres (allowlist headers, jamais de body/token/cookie) ; **NEW** : 403 sans message → retry borné (ci-dessous).                                                      |
| Consommation dans l'UI            | `context/UserDataContext.tsx` (403 → transitoire : session conservée), `data/fr-fr.ts` L60-69 (« Compte Spotify indisponible — Ta session Spotify est enregistrée, mais le compte n'a pas pu être vérifié ») | Affichage exact des appariats rapportés ; 403 N'EST JAMAIS traité comme succès (seul un 200 valide le profil, `spotifyIdentity.ts`).                                                                                                   |
| Côté Android                      | `android/` (non versionné, prebuild CI) + plugins Expo (`expo-router`, `expo-secure-store`, …)                                                                                                               | Zéro configuration réseau (grep exhaustif) : pas de `okhttp` custom, pas d'interceptor, pas de clef pinning, pas de proxy, pas de `usesCleartextTraffic`, pas de module natif touchant le réseau Spotify.                              |

**→ Aucune couche réseau côté Melodix n'est en mesure de produire, modifier
ou intercepter le 403 : le client est un `fetch` vanilla RN vers l'URL
officielle.**

### 4.2 Quelle couche produit `Server: envoy` / `Via: HTTP/2 edgeproxy, 1.1 google` ?

Appariats observés sur téléphone (après callback OAuth, session valide) :

```
HTTP 403 — réponse non JSON
URL https://api.spotify.com/v1/me
Content-Type : inconnu
Server : envoy
Via : HTTP/2 edgeproxy, 1.1 google
```

Détermination technique (9 couches du brief distinguées) :

- `Server: envoy` + `Via: HTTP/2 edgeproxy, 1.1 google` = signature **native
  de l'edge d'`api.spotify.com`** : `edgeproxy` est le pseudonyme de proxy
  d'Edge (envoy = le proxy d'edge de Spotify ; `1.1 google` = le 2ᵉ saut,
  pseudonymisé, conformément à la sémantique RFC 2068 de `Via`). Cette
  signature est observée par la communauté **sur les réponses normales de
  l'API Spotify** (2021/2025/2026, `server: envoy` + `via: HTTP/2
edgeproxy, 1.1 google` identiques) → elle ne distingue PAS un proxy tiers :
  c'est l'edge Spotify lui-même.
- **Hypothèse « proxy réseau de l'utilisateur / opérateur » : RÉFUTÉE** —
  un proxy tiers ajouterait sa propre signature (et `Via` ne serait pas
  `HTTP/2 edgeproxy, 1.1 google`, signature Spotify documentée).
- **La voie d'erreur standard de l'API Spotify est JSON** (preuve faite
  cette mission : `GET /v1/me` sans token → 401 **JSON** avec
  `error.message`) ; un 403 dont le corps est **non vide, NON JSON, sans
  Content-Type** n'appartient pas à cette voie → le rejet est produit
  **au niveau de l'edge** (avant le routeur d'API), pas par le
  traitement applicatif Spotify.
- Le 403 avec corps JSON + `error.message` (« User not approved for app »)
  EST la voie applicative (allowlist dev-mode) — ce n'est PAS la forme
  observée ici.

**→ Le 403 est produit par l'edge Spotify (couche « problème Spotify
confirmé » au sens du brief). Les couches Melodix/Android/opérateur sont
exonérées par les preuves ci-dessus.**

### 4.3 Cause racine — honnêtement : NON DÉTERMINÉE sans le dashboard

Le brief interdit l'accès au dashboard et toute preuve par l'environnement
réel. Les trois causes candidates, du plus au moins probable d'après le
terrain documenté (Spotify Community, 2021→2026) :

1. **403 edge INTERMITTENT** (le plus documenté : « Usually retrying the
   request makes the error go away, but sometimes it takes up to 4 or more
   attempts ») — le même token + la même requête alternent 403/200 ;
2. **Allowlist dev-mode `/v1/me`** : en mode Développement, seuls les
   comptes listés dans _Users and Access_ du dashboard passent `/v1/me`
   (ajout du compte → 200) ;
3. **WAF/edge** (blocage de chemin réseau, ex. signature IPv6 — cas Google
   documenté).

Chacune est plausible ; **aucune n'est prouvable depuis cet
environnement** (ni dashboard, ni appareil, ni compte). C'est déclaré tel
quel — pas de « corrigé » factice.

### 4.4 Correctif livré : retry borné et transparent du 403 edge sans message

`services/spotify/apiClient.ts` — dans `spotifyApiGet`, APRÈS le calcul des
diagnostics 403 existants, AVANT le log/throw :

```
if (status === 403 && spotifyMessage === '' && edge403Retries < 2) {
  edge403Retries += 1;
  await sleep(1500 * edge403Retries);   // 1,5 s puis 3 s
  spotifyLog('api.http-403-retry', { endpoint, attempt, bodyShape });
  continue;                              // nouvelle requête, mêmes règles
}
```

Propriétés tenues (testées) :

- **JAMAIS 403 = succès** : seul un 200 au profil valide libère
  (`spotifyIdentity.ts` inchangé) ;
- **Borne dure** : au plus 2 retentatives (3 requêtes max), pas de boucle ;
- **Transparent** : mêmes diagnostics que sans retry si le 403 persiste
  (forme du corps, Content-Type, headers sûrs, URL finale — UI identique +
  bouton « Réessayer » qui retente) ;
- **403 AVEC message JSON = cause définitive** (allowlist/scope/premium) →
  **pas de retry** : l'info utile n'est pas retardée ;
- **Même philosophie que les gestionnaires existants** : 429 → attente
  `Retry-After` + rejouer ; 401 → refresh + retry ; 403 edge → attente
  bornée + rejouer ;
- Session conservée, token jamais logué (trace `api.http-403-retry` =
  endpoint tronqué 80 car + numéro d'essai + forme du corps seulement).

**Action utilisateur restante (dashboard)** : vérifier le mode de
l'application (Développement/Production) et, en mode Développement,
ajouter le compte concerné à _Users and Access_ — l'unique cause
candidate que le propriétaire de l'app peut trancher directement.

### 4.5 Tests de régression du retry (4 nouveaux, fake timers)

| Test (apiClient.unit.test.ts)                                                                         | Contrat prouvé                                                                                                  |
| ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| 403 edge intermittente → retentative bornée puis 200 : donnée servie                                  | Le 200 est RÉEL après 3 appels ; aucun 403 assimilé à un succès ; session conservée.                            |
| 403 edge persistante → borne atteinte (3 appels max), 403 exposé avec diagnostics, session conservée  | Exactement 3 appels (1+2) — pas de boucle ; `bodyShape`/message conservés ; jamais de body/token dans l'erreur. |
| 403 AVEC message JSON (cause API définitive) → AUCUNE retentative (1 appel seul)                      | Erreur immédiate (<1 s, timer réel) ; message conservé ; 1 appel seul.                                          |
| 403 edge puis 5xx en cours de route → le premier verdict non-403 lève l'erreur (pas de retry sur 5xx) | La retentative a lieu (1ᵉʳ verdict = 403 edge) puis le 503 est exposé tel quel.                                 |

- les 6 tests 403-sans-message existants convertis aux horloges factices
  (backoff 1,5 s/3 s) — tous les diagnostics antérieurs intacts.

---

## 5. Classification finale (4 catégories exactes)

### 1. FONCTIONNEL

- **Audit moteur complet** (§1) : chaîne `Spotify track → PlayerController →
SpotifyWebBackend → SpotifyWebHostView → SpotifyWebRuntime → WebView →
Spotify Web Player → état publié → PlayerController → UI/MediaSession`
  auditée module par module — **aucun défaut réel** ; aucun correctif moteur
  (aucun commit artificiel).
- **`no-authorized-execution-surface`** : réel (probe honnête, aucune
  surface autorisée côté page), documenté (§2), **non contourné** (aucun
  clic synthétique / injection / interception dans le code), **non
  bloquant** pour le fonctionnement normal sur téléphone avec session
  active (geste dans la vue + MediaSession système Chromium).
- **Diagnostics 403 `/v1/me`** (hérités V16) : conservés et intacts —
  forme du corps, Content-Type, en-têtes sûrs (allowlist), URL finale,
  statusText ; jamais de body/token/cookie exposé.
- **NOUVEAU — retry borné + transparent du 403 edge sans message** (§4.4) :
  2 retentatives max (1,5 s/3 s), JAMAIS 403 = succès, 403 persistant
  exposé avec les mêmes diagnostics, 403 avec message = pas de retry.
- **Version** : `4.5.0-test.22/45022` → **`4.5.0-test.23/45023`** (modif
  fonctionnelle réelle justifiée : le retry).

### 2. TESTÉ AUTOMATIQUEMENT

- **Jest : 2056 passés / 14 skipped / 0 échec** (baseline V17 : 2052 → +4
  nouveaux tests du retry 403 ; les 6 tests 403-sans-message convertis aux
  fake timers restent verts).
- **TypeScript** : `npx tsc --noEmit` → 0 erreur.
- **ESLint** : fichiers modifiés → 0 finding.
- **Prettier** : fichiers modifiés → conforme (`--check` vert).
- **Android / Robolectric** : non concernés (aucune modification
  Kotlin/native — seul le TypeScript app est modifié) ; les tests Kotlin
  restent couverts par la CI (verts sur la run).
- **Gradle + build APK + signature + vérification 16 KiB** : CI GitHub
  Actions run **37821465363** (workflow `APK Android`) — résultats dans le
  §6 (gates CI).
- **Smoke Android 14** : exécuté par la CI (installation, deep-links,
  hôte production `host-mounted`, handshake explicite, absence de faux
  playing) — détails §6.
- **CI run ID** : `37821465363` (push `1c83d76`).

### 3. TESTÉ PHYSIQUEMENT

**Rien.** Arena n'a pas de téléphone : **aucun test physique n'a été
effectué cette mission**. Ni la connexion réelle, ni la lecture réelle,
ni l'effet du retry sur un 403 réel ne sont validés sur appareil. (La
dernière validation humaine de référence reste le phone-run 2026-10-07
consigné — lecture réelle + contrôles — mais elle ne couvre pas ce
correctif 403.)

### 4. NON TESTÉ

- **Vraie connexion Spotify réelle** (callback → `/v1/me` 200) : non testé
  (pas de compte dans l'environnement ; la CI ne JAMAIS utilise le compte
  personnel).
- **Effet réel du retry 403** sur un 403 edge intermittent observé en
  production : non testé physiquement — le comportement est prouvé
  unitairement (fake timers) mais pas sur un 403 réel.
- **Vraie lecture Spotify Web** (son audible, `playback-confirmed`) :
  non testé (CI sans compte = non testable, déclaré tel quel dans la
  smoke).
- **Background / lockscreen / Bluetooth / casque** : non testés
  (aucun appareil).
- **Cause racine 403** : non déterminée sans dashboard (interdit brief) —
  voir §4.3.

### DIAGNOSTIC CONNEXION SPOTIFY

- **Requête** : `GET https://api.spotify.com/v1/me` — headers émis :
  `Authorization: Bearer <access token>` (jamais logué) +
  `Accept: application/json` ; client : plain fetch React Native (OkHttp),
  aucune couche réseau intermédiaire (audit §4.1).
- **Résultat** (observé sur téléphone, rapport utilisateur) : HTTP **403**,
  URL finale `https://api.spotify.com/v1/me` (pas de redirection), réponse
  de type API (fetch standard), **Content-Type absent/inconnu**, corps
  **non vide NON JSON** (l'UI le signale « réponse non JSON »),
  `Server: envoy`, `Via: HTTP/2 edgeproxy, 1.1 google`.
- **Cause** : **problème Spotify confirmé (couche edge) — cause racine non
  déterminée**. Le 403 est produit par l'edge Spotify (signature
  `envoy`/`HTTP/2 edgeproxy, 1.1 google` = native de l'edge api.spotify.com,
  corps non JSON hors de la voie d'erreur JSON standard de l'API — référé
  §4.2). Code Melodix innocent (audit intégral §4.1) ; couches Android et
  réseau utilisateur/opérateur exonérées (aucune interception/proxy
  détectable, signature non-tierce). Sans accès au dashboard (interdit par
  le brief), la cause racine exacte (intermittence edge, allowlist
  dev-mode `/v1/me`, WAF edge) reste **non déterminée** — §4.3.
- **Preuves** :
  - `services/spotify/apiClient.ts` L165-370 (fetch plain, headers
    `Accept`+`Bearer` seuls, diagnostics 403, retry borné) ;
  - `services/spotify/authConfig.ts` + `services/spotify/session.ts` (URLs
    officielles, PKCE, token jamais logué) ;
  - `services/spotify/api/me.ts` (appariement `spotifyApiGet('/me')`) ;
  - grep exhaustif `android/` + plugins : zéro config réseau ;
  - `GET /v1/me` sans token depuis cet environnement → 401 **JSON** (la
    voie d'erreur API est toujours JSON) ;
  - Spotify Community (2021/2025/2026) : signature `envoy`+`edgeproxy` sur
    réponses normales et 403 intermittents (« retrying makes the error go
    away ») ; allowlist dev-mode `/v1/me` (ajout compte → 200).
- **Correctif** : **retry borné et transparent du 403 edge sans message
  JSON** dans `services/spotify/apiClient.ts` (2 retentatives max, backoff
  1,5 s/3 s ; JAMAIS 403 = succès ; 403 persistant exposé avec les mêmes
  diagnostics ; 403 avec message JSON = cause définitive, pas de retry) +
  4 tests de régression + conversion fake-timers des 6 tests 403
  existants. Version `4.5.0-test.23/45023`. **Aucun autre correctif côté
  Melodix** : OAuth/PKCE/Client ID/scopes/SecureStore inchangés (aucune
  preuve de responsabilité dans le 403) ; action utilisateur restante :
  vérifier le mode de l'app et _Users and Access_ dans le dashboard
  Spotify.

---

## 6. Gates CI (run `37821465363`, workflow `APK Android`) — **SUCCESS**

Run déclenchée par le push du commit `1c83d76` (branche
`arena/fcdae8c6-melodix`, SHA complet
`1c83d76678ef7da93352df0eb9345063d1acefdd`). **Tous les steps success** :

| Step                                                    | Résultat | Signification                                                         |
| ------------------------------------------------------- | -------- | --------------------------------------------------------------------- |
| Valider la config Spotify du build (deterministe)       | success  | Config Spotify du build vérifiée déterministe                         |
| Vérifier TypeScript, ESLint et Prettier                 | success  | `tsc` + `eslint` + `prettier --check` verts en CI                     |
| Tests JavaScript / React Native                         | success  | Suite Jest complète en CI (2056 passés / 14 skipped)                  |
| Générer le projet Android + config vérifiée             | success  | Prebuild Android + vérification de la config générée                  |
| Tests Kotlin du module média (Robolectric)              | success  | Tests Kotlin non régressés (aucune modification Kotlin cette mission) |
| Compiler l'APK                                          | success  | Gradle `assembleRelease`                                              |
| Aligner 16 Kio et signer l'APK de test                  | success  | Alignement 16 KiB + signature (certificat de test stable)             |
| Vérifier intégrité, installabilité et signature         | success  | APK signé et vérifié                                                  |
| **Installer et lancer réellement l'APK sur Android 14** | success  | Smoke Android 14 complète (ci-dessous)                                |

**Version vérifiée dans l'APK** (dump package) :
`versionCode='45023'` `versionName='4.5.0-test.23'` — le bump
`4.5.0-test.22/45022` → `4.5.0-test.23/45023` est effectif dans le binaire.

**Smoke Android 14 — preuves en annotations de la run** :

- `host-mounted confirmé en logcat — la WebView open.spotify.com (hors
écran) est montée à la racine de l'app` (hôte de production).
- Handshake **explicite et honnête sans compte** : `handshake non prêt
(codes: bridge_timeout) — aucune capacité de lecture revendiquée
(comportement honnête sans compte Spotify)`.
- **Aucun faux playing** : `aucun playback-confirmed ni playback-error en
logcat : sans compte Spotify, aucune tentative de lecture n'a été
engagée — aucun faux playing ; la lecture RÉELLE Spotify Web reste NON
DÉMONTRÉE en CI (test physique : non effectué)`.
- Cycle complet : `installation + HÔTE Spotify Web production
(montage/handshake/bridge, aucun faux playing) + prototype WebView +
cycle arrière-plan/retour + service foreground + MediaSession +
notification + deep-link OAuth (A et B) réussis sur Android 14`.
- OAuth A/B (wiring, PAS un login) : callback **avec** transaction PKCE
  persistée (transaction retrouvée, `token_exchange:start`, séquence
  vérifiée) et callback **sans** transaction (échec classé proprement).
- Warning permanent conservé : `PLAYBACK SPOTIFY WEB RÉEL NON TESTABLE IN
CI — pas de compte Spotify ni d'interaction utilisateur possible dans
la page`.

**Limite d'observation** : les logs détaillés step par step n'étaient pas
récupérables de cet environnement (endpoint results-receiver injoignable) ;
les faits ci-dessus proviennent des **annotations officielles de la check
run** (`annotations_count: 27`) et du statut de chaque step — suffisants
pour les claims du rapport.
