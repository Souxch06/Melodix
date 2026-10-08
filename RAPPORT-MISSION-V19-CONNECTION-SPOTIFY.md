# Mission V19 — Résoudre la connexion Spotify + fiabiliser le rapport V18

**Date** : 8 octobre 2026 · **Base** : HEAD `05e6e76` (V18 final,
`4.5.0-test.23/45023`) · **RÉSULTAT** : livré — (1) traçage intégral du
parcours token : **aucune faute côté code** (7 points de contrôle vérifiés
un à un) ; (2) retry V18 audité : **correct et borné** ; (3) cause racine
du 403 : **NON DÉTERMINÉE de cet environnement** — fait établis vs
hypothèses séparés, cause la plus probable = **restriction d'accès en mode
Développement du Developer Dashboard (Users and Access)** → étapes manuelles
exactes fournies ; (4) une seule modification fonctionnelle, utile au
dépannage : le diagnostic 403 expose désormais **le nombre de tentatives**
(l'UI affiche « Tentatives : 3 — 403 persistant ») — version
`4.5.0-test.24/45024` ; (5) chiffres de tests V18 **réconciliés et corrigés**
(erreur du rapport V18 : « 18 nouveaux » → 4 nouveaux ; 2070 = total
passés+ignorés, pas des passés) ; CI **success** (run 37836789648).

---

## 1. Résultat par catégorie (résumé)

### 1.1 FONCTIONNEL

- **Parcours token audité, sain** (§2) — aucun correctif de parcours
  (aucun défaut démontré).
- **Retry V18 confirmé correct** (§3) — aucun changement du retry lui-même.
- **NOUVEAU — diagnostic 403 enrichi** : le champ `attempts` (nombre total
  de requêtes émises : 1 initiale + retentatives du 403 edge sans message,
  au plus 3) est porté par les diagnostics HTTP sûrs et exposé par l'UI
  sous la forme **« Tentatives : 3 — 403 persistant »** quand le retry
  borné n'a pas abouti. C'est la donnée manquante pour trancher
  _instabilité edge passagère_ (la retentative aurait réussi — pas
  d'erreur exposée) vs _refus déterministe_ (configuration compte/application
  du Developer Dashboard — à vérifier manuellement, §5).
- **Chaîne Spotify Web Player (audit V18) INTACTE** : aucune modification de
  cette mission ne touche `player.ts`, `playbackBackend/*`,
  `SpotifyWebHostView`, `mediaBridge` (git status : 3 fichiers de
  connexion + 2 tests + 3 fichiers de version). La suite Jest complète
  (2057 passés) recouvre les suites moteur (playerSpotifyWeb V8/V9/Playlist32,
  spotifyWebHost, SpotifyWebHostView, mediaBridge V9, playbackIntegration…)
  — toutes vertes : confirmation réelle de lecture, états, commandes/queue,
  cycle de vie WebView, MediaSession, protections stale/double-`ended`
  non cassées.
- **Version** : `4.5.0-test.23/45023` → **`4.5.0-test.24/45024`** (modif
  fonctionnelle réelle : exposition du 403 persistant).

### 1.2 TESTÉ AUTOMATIQUEMENT

- **Jest (exécution réelle, HEAD `04fa17c`) : 2057 passés / 14 ignorés /
  0 échec / 2071 total** — dont 1 nouveau test de cette mission (ligne
  « Tentatives » du descripteur) + 4 assertions de régression renforcées
  (`attempts` = 3 sur 403-edge persistant, `attempts` = 1 sur 403 avec
  message). Baseline vérifiée en début de mission (HEAD `05e6e76`) :
  **2056 / 14 / 2070** — cf. §6 (réconciliation).
- **TypeScript** : `npx tsc --noEmit` → 0 erreur.
- **ESLint** (fichiers modifiés) : 0 finding.
- **Prettier** (fichiers modifiés) : conforme.
- **Android/Robolectric + Gradle + APK + signature + 16 KiB + smoke** :
  exécutés par la CI — **run `37836789648` SUCCESS** (tous steps success ;
  APK `versionCode='45024'` `versionName='4.5.0-test.24'` ; hôte production
  `host-mounted` ; handshake honnête sans compte ; **aucun faux playing** ;
  OAuth A/B wiring ; cycle bg/retour). Détail §7.
- **APK de test** : artefact GitHub Actions de la run `37836789648`
  (workflow `APK Android`) — `Melodix-v4.5.0-test.24-*.apk`, à installer
  sur le téléphone pour le test physique du §5.

### 1.3 TESTÉ PHYSIQUEMENT

**Rien.** Aucun téléphone dans Arena : **aucun test physique n'a été
effectué** (ni connexion réelle, ni lecture réelle, ni effet du diagnostic
nouveau sur un 403 réel). **La connexion réelle n'est PAS déclarée réparée** —
le correctif potentiel (configuration du dashboard) est à exécuter par le
propriétaire de l'application, steps au §5.

### 1.4 NON TESTÉ

- **Vraie connexion Spotify** (200 sur `/v1/me` avec le compte réel) : non
  testé ici — étapes manuelles §5 + résultat attendu §5.4.
- **Vraie lecture Spotify Web** (son audible, `playback-confirmed`) : non
  testé (CI sans compte = non testable, déclaré tel quel dans la smoke).
- **Background / lockscreen / Bluetooth / casque** : non testés.
- **Cause racine 403** : non déterminée sans accès au Developer Dashboard
  (interdit — je ne prétends PAS l'avoir consulté) ni sans accès réseau
  réel (sandbox sans egress arbitraire).

---

## 2. Traçage du parcours token (consigne §1) — verdict : code sain

Parcours vérifié dans le code actuel, point par point :

| Contrôle demandé                                              | Fichier / mécanisme                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Verdict  |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Le token utilisé est bien celui de la session OAuth courante  | `useSpotifyAuth.ts` `completeLogin` : échange (`redeemAuthorizationCode`) → `saveSession` (JSON → SecureStore) → `getCurrentUser()` → `spotifyApiGet('/me')` qui fait `loadSession()` (re-lecture) + refresh si expiré. Le token de `/v1/me` est celui qui vient d'être émis et sauvé — aucun autre canal de token n'existe.                                                                                                                                                                                | **Tenu** |
| Le refresh ne remplace pas le token par une valeur incorrecte | `session.ts` `doRefreshClassified` : POST `/api/token` (`grant_type=refresh_token`, `client_id`) → `sessionFromTokenResponse(payload, ancienRefreshToken)` : `access_token` de la RÉPONSE (fallback TTL 3600 s si `expires_in` absent), `refresh_token` conservé s'absent → `saveSession`. Réponse 200 sans `access_token` = transitoire, session conservée (pas de token fantôme). RAE (un seul refresh par concurrence).                                                                                  | **Tenu** |
| La session sauvegardée puis relue est cohérente               | `saveSession`/`loadSession` : `JSON.stringify`/`JSON.parse` du même objet (`accessToken`, `refreshToken`, `expiresAtMs`, `scope`) — round-trip fidèle, pas d'encodage binaire/URL qui pourrait corrompre le token. Validation à la relecture (`accessToken` non vide + `expiresAtMs` number).                                                                                                                                                                                                               | **Tenu** |
| Bon Client ID / bon environnement OAuth                       | `authConfig.ts` : Client ID inliné au build (`EXPO_PUBLIC_SPOTIFY_CLIENT_ID` ou `extra.spotifyClientId` — CI : « Client ID présent (32 hex) », source workflow déterministe) ; endpoints OFFICIELS : `accounts.spotify.com/authorize`, `accounts.spotify.com/api/token`, `api.spotify.com/v1`. L'échange a RÉUSSI (session enregistrée) ⇒ Client ID + redirect URI + PKCE sont cohérents avec le dashboard (un écart aurait produit `invalid_client`/`invalid_grant` à l'échange, pas un 403 sur `/v1/me`). | **Tenu** |
| URL finale = API officielle                                   | `apiClient.ts` `doFetch` : `https://api.spotify.com/v1/me` (base `SPOTIFY_API_BASE_URL`), plain fetch RN (OkHttp), headers `Accept: application/json` + `Authorization: Bearer` seuls — zéro proxy/interceptor/pinning/DNS/UA override (audit V18 + re-vérification).                                                                                                                                                                                                                                       | **Tenu** |
| Réponses/erreurs classifiées correctement                     | `apiClient.ts` : 200 → JSON ; 401 → 1 refresh (RAE) + 1 retry, classification définitif/transitoire ; 429 → attente `Retry-After` + rejouer (×2) ; 403 → erreur `http` + diagnostics sûrs (message Spotify si présent, forme du corps, Content-Type, headers allowlist, URL finale, **attempts** — nouveaux) ; réseau/timeout (10 s) → `network`. 403 JAMAIS succès.                                                                                                                                        | **Tenu** |
| Vérification d'identité jamais contournée                     | `spotifyIdentity.ts` + `UserDataContext.tsx` : état `spotify` (compte vérifié) uniquement si `/v1/me` 200 ET `id` Spotify réel (jamais `LOCAL_USER_ID`) ; 403 → `spotify-unverified` + diagnostic + session conservée + « Réessayer » = vraie re-vérification (`spotify-verifying`, anti double-clic) ; refresh refusé → `signOut` (jamais de boucle).                                                                                                                                                      | **Tenu** |

**Conclusion : aucune faute du parcours ne peut produire le 403 observé.**
Un token corrompu/expiré/erroné produirait un **401 JSON** (la voie
d'erreur applicative Spotify — vérifiée : `GET /v1/me` sans token → 401
JSON `error.message`), pas un 403 non JSON.

---

## 3. Audit du retry V18 (consigne §2) — verdict : correct et borné

`services/spotify/apiClient.ts` — re-lecture complète de la branche 403 :

| Exigence                                         | Preuve                                                                                                                                                                                   |
| ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 403 sans message JSON retenté au max 2×          | `if (status===403 && spotifyMessage==='' && edge403Retries < MAX_EDGE_403_RETRIES /*2*/)` — compteur incrémenté avant chaque `continue` : au plus 3 requêtes.                            |
| Délais bornés                                    | `sleep(1500 × n)` → 1,5 s puis 3 s (4,5 s max au total).                                                                                                                                 |
| 403 AVEC message explicite non retardé           | La condition exige `spotifyMessage === ''` : un 403 avec message (ex. « User not approved for app ») est levé **immédiatement**, 1 requête seule (test dédié, timer réel <1 s).          |
| 403 jamais considéré succès                      | Seul le `return (await response.json())` sur `response.ok` (2xx) produit des données ; un 403 (même après retries) lève `SpotifyApiError('http', 403, …)`.                               |
| Aucun retry ne crée de boucle                    | Chaque `continue` du `for(;;)` incrémente un compteur borné (`edge403Retries`≤2, `retries429`≤2, `retried401`≤1) → la boucle se termine forcément par `return` ou `throw`.               |
| Erreurs réseau/timeouts correctement classifiées | `doFetch` : `AbortController` 10 s + rejet fetch → `SpotifyApiError('network')` (inchangé par le retry).                                                                                 |
| Session non détruite inutilement                 | Le chemin 403 n'appelle ni `clearSessionAccessOnly` ni `clearSession` : session conservée (confirmé par les tests ; « Réessayer » disponible).                                           |
| « Réessayer » = nouvelle vérification réelle     | `UserDataContext.reloadUserData` → `verifySpotifyIdentity` → `getCurrentUser()` → `spotifyApiGet('/me')` FRAIS (re-lecture de session + refresh si expiré + nouvel éventuel retry edge). |

**Si le retry n'apporte rien au problème observé, est-ce documenté ? OUI**
— et c'est précisément le point : si le 403 est **déterministe** (le cas
rapporté : « toujours »), les 2 retentatives échoueront aussi, l'erreur
exposée est identique à la V18 (+ désormais « Tentatives : 3 »), et le
retry ne « répare » rien — il ne fait que couvrir le cas intermittent
documenté. C'est pour cela que cette mission ajoute la donnée
(`attempts`) qui permet à l'utilisateur de VOIR que le 403 est persistant
et d'orienter le diagnostic vers le dashboard (§5), au lieu de multiplier
les tentatives pour masquer un problème d'autorisation (interdit tenu).

---

## 4. Correction des chiffres de tests V18 (consigne §5)

**Erreur du rapport V18 (corrigée dans ce commit)** : la ligne
« Les 2070 tests automatiques (2052 existants + **18 nouveaux** de cette
mission) restent tous verts » est doublement fausse :

| Grandeur               | Rapport V18 (erroné)     | **Valeur réelle (vérifiée par exécution)**                                              |
| ---------------------- | ------------------------ | --------------------------------------------------------------------------------------- |
| Nouveaux tests V18     | 18                       | **4** (retry 403 : intermittente→200, persistante→borne, avec-message→1 appel, 403→5xx) |
| Tests passés après V18 | 2070                     | **2056 passés** (+ 14 ignorés = **2070 au TOTAL**)                                      |
| Baseline avant V18     | 2052 passés / 14 ignorés | 2052 passés / 14 ignorés (inchangé, correct)                                            |

**Origine de l'erreur** : confusion entre _total_ Jest (2070 = passés +
ignorés) et _passés_ ; le « 18 » provenait de `2070 − 2052`, qui compte
les 4 nouveaux tests **ET** les 14 ignorés. Les §5.2 et §6 du rapport V18
(2056 / 14) étaient corrects ; seule la ligne §1 l'était moins.

**Vérification indépendante de cette mission** (exécution réelle, non
recopiée) :

- HEAD `05e6e76` (fin V18) : **2056 passés / 14 ignorés / 2070 total / 0
  échec** — recoupe exactement le §5.2 du rapport V18.
- HEAD `04fa17c` (fin V19) : **2057 passés / 14 ignorés / 2071 total / 0
  échec** (+1 test du §1.1).

---

## 5. Diagnostic de connexion Spotify (section obligatoire)

### 5.1 Faits observés (jamais interprétés)

1. Sur téléphone, après callback OAuth : **échange PKCE réussi** (session
   enregistrée — l'UI dit « Ta session Spotify est enregistrée ») ;
   `GET https://api.spotify.com/v1/me` → **HTTP 403**, corps **non JSON**,
   Content-Type **inconnu/absent**, headers `Server: envoy`,
   `Via: HTTP/2 edgeproxy, 1.1 google` ; l'UI « Compte Spotify
   indisponible — le compte n'a pas pu être vérifié » ; **toujours**
   (reproduible).
2. `GET /v1/me` **sans token** (testé de cet environnement) → **401 JSON**
   (`error.message`) : la voie d'erreur applicative standard de l'API
   Spotify est JSON.
3. Le code Melodix est un `fetch` vanilla RN vers l'URL officielle, headers
   `Accept`+`Bearer` seuls, zéro couche réseau intermédiaire (§2).

### 5.2 Fait vs hypothèse (distinction exigée)

- **FAIT** : la réponse porte `Server: envoy` +
  `Via: HTTP/2 edgeproxy, 1.1 google`.
- **FAIT** (par communauté, 2021→2026) : cette signature exacte apparaît
  sur les réponses **normales** de `api.spotify.com` — c'est la signature
  de l'infrastructure d'edge de Spotify (pseudonymes de proxy conformes à
  la sémantique RFC 2068 de `Via`), et non celle d'un proxy générique
  tiers.
- **FAIT** (par communauté, 2021→2026) : en **mode Développement**, une
  application Spotify n'est utilisable que par les comptes listés dans
  _Users and Access_ du dashboard ; un compte hors liste obtient un **403
  sur `/v1/me`** (forme JSON « User not approved for app » OU forme edge
  non JSON/creuse selon les rapports) ; **l'ajout du compte au
  _Users and Access_ fait passer `/v1/me` à 200**.
- **HYPOTHÈSE** (forte, non prouvable d'ici) : le 403 observé est produit
  par l'edge Spotify (pas par un intermédiaire réseau utilisateur) —
  cohérent avec les faits 1-3, mais les headers seuls ne le **prouvent**
  pas (une signature d'edge est une indication, pas une preuve d'origine
  du refus).
- **HYPOTHÈSE** (sous-hypothèse, la plus actionnable) : l'application est
  en **mode Développement** et le compte utilisé sur le téléphone n'est
  pas (ou n'est plus) dans _Users and Access_. Le caractère
  **déterministe** du 403 (persistant à travers 3 requêtes espacées de
  1,5-3 s, reproductible) affaiblit l'hypothèse « instabilité edge
  passagère » et renforce celle-ci.
- **HYPOTHÈSE** (mineure) : blocage de chemin réseau (WAF edge sur
  l'IPv6 de la box/opérateur, cas Google documenté) — testable en
  changeant de réseau (§5.3, étape 6).

### 5.3 Cause : **NON DÉTERMINÉE** de cet environnement

Aucune des causes n'est **prouvable** sans (a) accès au Developer
Dashboard (que je n'ai pas — **je ne prétends pas l'avoir consulté**) ni
(b) accès au réseau du téléphone. Le code Melodix est **exonéré** (§2 :
aucune couche Melodix/Android ne peut produire ce 403 ; un token erroné
donnerait un 401 JSON). **Cause la plus probable : restriction d'accès de
l'application en mode Développement (Users and Access)** — à trancher par
les étapes manuelles ci-dessous, qui sont rapides et sans risque.

### 5.4 Action manuelle nécessaire (précise, propriétaire de l'app)

1. Ouvrir **developer.spotify.com/dashboard** → sélectionner
   l'application Melodix (Client ID
   `7c5af4cd57e646c49a6266222c2ed9d6`).
2. **Vérifier le MODE de l'application** :
   - Si **Développement** (défaut) : l'app n'est utilisable QUE par les
     comptes listés dans **Users and Access** — et `/v1/me` est
     précisément l'endpoint gated. → **Ajouter LE compte Spotify utilisé
     sur le téléphone** (celui du login) dans _Users and Access_.
     (Variante : passer l'app en **Production** — pas de liste
     d'utilisateurs ; la redirect URI `melodix://callback` reste
     valable.)
   - Si déjà **Production** : sauter à l'étape 6.
3. Vérifier que la **redirect URI** `melodix://callback` est bien listée
   (l'échange réussit déjà, donc elle l'est — contrôle visuel de
   cohérence, aucune autre entrée en doublon).
4. Vérifier que le produit **Web API** est activé pour l'app (exigé par
   `/v1/me` et les playlists).
5. **Attendre quelques minutes** (propagation du dashboard), puis sur le
   téléphone (build **4.5.0-test.24 / 45024** de la run CI
   `37836789648`) : **se déconnecter puis se reconnecter** (nouvel
   échange, token frais) et observer.
6. **Si 403 persistant malgré le dashboard corrigé** : tester sur
   **DEUX réseaux différents** (Wi-Fi vs données mobiles). 403 sur les
   deux → cause configuration compte/app (re-vérifier que le compte
   ajouté est EXACTEMENT celui du login — même e-mail/identité) ; 403 sur
   un seul réseau → le chemin réseau (box/opérateur/IPv6) est impliqué —
   revenir avec ce résultat.

### 5.5 Résultat attendu lors du prochain test physique

- **Dashboard corrigé (step 2)** → login → `/v1/me` **200** → profil
  affiché, état `spotify`, connexion terminée. (C'est le cas attendu : la
  cause la plus probable est traitée.)
- **Dashboard non corrigé** → l'écran d'erreur du build 45024 affiche
  désormais en plus de l'existant :
  `Tentatives : 3 — 403 persistant` — la preuve visible que le 403 est
  DÉTERMINISTE (les 2 retentatives bornées ont échoué) et oriente
  directement vers l'étape 2 du §5.4. Les logs de diagnostic
  application contiennent en parallèle les 2 lignes `api.http-403-retry`
  (attempts 1 et 2).
- **Aucun changement d'autre comportement attendu** : la chaîne lecture
  (audit V18) est intacte ; la lecture réelle reste non testée ici
  (§1.3/§1.4).

### 5.6 Preuves exactes (fichiers/lignes)

- `services/spotify/apiClient.ts` : `doFetch` (fetch plain, headers
  `Accept`+`Bearer`, URL `SPOTIFY_API_BASE_URL + '/me'`) ; branche `!response.ok`
  (diagnostics 403 + **`attempts: 1 + edge403Retries`** — nouveau) ;
  branche retry (`MAX_EDGE_403_RETRIES=2`, `EDGE_403_RETRY_BASE_MS=1500`,
  `spotifyLog('api.http-403-retry')`).
- `services/spotify/session.ts` : `redeemAuthorizationCode` (échange PKCE
  standard, `client_id` du build), `sessionFromTokenResponse` (token de la
  réponse, fallback TTL), `doRefreshClassified` + `ensureRefresh` (RAE),
  `saveSession`/`loadSession` (round-trip JSON fidèle).
- `services/spotify/useSpotifyAuth.ts` : `completeLogin` (échange →
  `saveSession` → `getCurrentUser`), `startLogin` (transaction PKCE
  persistée AVANT l'ouverture), cold start (verifier persisté, mono-usage),
  single-flight par code.
- `services/spotify/authConfig.ts` : Client ID inliné (2 sources de build),
  `melodix://callback`, scopes lecture (4), endpoints officiels.
- `context/UserDataContext.tsx` : `verifySpotifyIdentity` (200+id réel →
  `spotify` ; 403 → `spotify-unverified` + diagnostic ; unauthenticated →
  `signOut`), `reloadUserData` (Réessayer = vraie re-vérification).
- `context/spotifyIdentity.ts` : états de session, `describeSpotifyVerificationFailure`
  (meta 403 : URL/Content-Type/headers allowlist + **ligne « Tentatives »** —
  nouveau).
- Test réel `GET /v1/me` sans token → 401 JSON (ceci, 8 oct. 2026).
- Community Spotify (2021/2025/2026) : 403 `/v1/me` dev-mode hors allowlist
  (ajout compte → 200) ; signature `envoy`/`edgeproxy` sur réponses
  normales ; 403 intermittents résolus par retry.

### 5.7 Fichiers modifiés (et tests)

| Fichier                                                              | Changement                                                                                 |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `services/spotify/apiClient.ts`                                      | `SpotifyApiHttpDiagnostics.attempts` (403 : nombre total de requêtes)                      |
| `context/spotifyIdentity.ts`                                         | `meta.attempts` + ligne UI « Tentatives : N — 403 persistant » (si ≥2)                     |
| `context/UserDataContext.tsx`                                        | `attempts` passé dans le diagnostic classifié                                              |
| `services/spotify/__tests__/apiClient.unit.test.ts`                  | 4 assertions renforcées (`attempts` 3/3/3 sur 403-edge persistant, 1 sur 403 avec message) |
| `context/__tests__/spotifyIdentity.unit.test.ts`                     | 1 nouveau test (ligne « Tentatives » : présente si ≥2, absente si 1 ou undefined)          |
| `package.json`, `app.config.js`, `.github/workflows/android-apk.yml` | version `4.5.0-test.24/45024`                                                              |
| `RAPPORT-MISSION-V18-SPOTIFY-FINALISATION.md`                        | correction des chiffres de tests (§4)                                                      |

**Résultat des tests** : Jest 2057/14/0 (2071 total), tsc/ESLint/Prettier
0 erreur, CI `37836789648` SUCCESS (APK 45024, smoke Android 14, aucun
faux playing).

**Aucun correctif « de connexion » inventé** : pas de changement
OAuth/PKCE/Client ID/redirect/scopes/SecureStore/moteur ; pas de retry
supplémentaire pour masquer l'autorisation ; pas de suppression du
contrôle `/v1/me`.

---

## 6. Réconciliation des chiffres (détail d'auditorat)

- Sortie Jest réelle (HEAD `05e6e76`, avant toute modif V19) :
  `Test Suites: 14 skipped, 152 passed, 152 of 166 total` /
  `Tests: 14 skipped, 2056 passed, 2070 total` — **recoupe le §5.2 du
  rapport V18** (2056 passés / 14 ignorés).
- La ligne §1 du rapport V18 (« 2070 tests… + 18 nouveaux ») mélangeait
  _total_ (2070) et _nouveaux_ (4) : **corrigée** (commit `04fa17c`).
- Sortie Jest réelle (HEAD `04fa17c`, fin V19) :
  `Tests: 14 skipped, 2057 passed, 2071 total` / `0 failed`.
- Chiffres définitifs de la mission : **2057 réussis, 0 échoués, 14
  ignorés** (2071 total).

---

## 7. Gates CI (run `37836789648`, workflow `APK Android`) — **SUCCESS**

Déclenchée par le push du commit `04fa17c` (SHA complet
`04fa17c…` — voir bas de rapport). Tous les steps success : TypeScript/
ESLint/Prettier, Jest complet en CI, Robolectric Kotlin, Gradle +
compilation APK, **alignement 16 KiB + signature**, intégrité/signature de
l'APK, **installation et lancement réel sur Android 14** (smoke) :
`host-mounted` confirmé (hôte de production), handshake honnête sans
compte (`bridge_timeout`), **aucun `playback-confirmed`** (aucun faux
playing — lecture réelle NON démontrée en CI, déclarée tel quel), OAuth A/B
wiring (callback avec transaction PKCE persistée / sans), cycle
arrière-plan/retour, service foreground + MediaSession + notification.
APK vérifiée : `versionCode='45024'` `versionName='4.5.0-test.24'`.

---

## 8. Identifiants finaux

- **HEAD** : **`04fa17cbe1785e6e36469ea0c7e02190e38079a6`**.
- **Branche** : `arena/fcdae8c6-melodix` (poussée).
- **Worktree** : propre (0 fichier modifié après commit).
- **Commits créés cette mission** : `04fa17c` (V19 : diagnostic 403
  persistant + correction chiffres V18 + bump 45024).
- **Runs CI** : `37836789648` (code, SUCCESS).
- **Base** : `05e6e76579d2dd96baaf5868fbc137909acfb00f` (V18 final).
