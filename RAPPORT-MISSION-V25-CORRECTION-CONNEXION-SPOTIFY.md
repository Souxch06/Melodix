# RAPPORT MISSION V25 — Diagnostic et correction de la connexion Spotify (HTTP 403 `GET /v1/me`)

> **Verdict : `CORRECTIONS DU CODE VALIDÉES, CONFIGURATION SPOTIFY À VÉRIFIER`**
>
> Audit complet de la chaîne de connexion (Client ID, OAuth 10 étapes, `/v1/me`, refresh,
> retentatives, modèle de session, rapport de diagnostic) : **un seul défaut réel du code**
> Melodix a été identifié — le rapport de diagnostic affichait le **libellé de source brut**
> (« Client ID : `expo-public-env` ») au lieu de la **valeur effective du build** — corrigé,
> testé et validé. Le HTTP 403 `GET /v1/me` observé sur l'appareil réel a une cause
> **externe la plus probable** (restriction dev-mode de l'application Spotify : compte hors
> « Users and Access » ou Premium du propriétaire) qui **ne peut être tranchée ni validée
> depuis le dépôt** (pas d'accès au Developer Dashboard, ni au statut Premium, ni à
> l'allowlist réelle) et requiert la **validation du propriétaire**. Aucun défaut de code ne
> produit ce 403 : le code ne le fabrique pas, ne le masque pas et ne l'aggrave pas.

---

## 1. État GitHub / branches / version (avant / après)

| Champ                                  | Valeur                                                                                                                                                                        |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| HEAD initial de la branche (début V25) | `9b7b3ea` (après le 7ᵉ rollback de sandbox : `git reset --hard origin/arena/fcdae8c6-melodix`, arbre propre)                                                                  |
| Commit code + bump (correction V25)    | `ea730be`                                                                                                                                                                     |
| SHA final — rapport                    | dernier commit de la branche (`git log -1`) : ce rapport y est inclus                                                                                                         |
| `main`                                 | `fceab85950b069edcb65ed718a8ffd419a1bc785` — **INTACTE** (aucune écriture, aucun merge, aucun force-push)                                                                     |
| PR #6                                  | **OPEN**, `MERGEABLE`, head = `arena/fcdae8c6-melodix` — **non fusionnée** (aucune fusion, aucun merge de `main`)                                                             |
| Version app                            | `4.5.0-test.30` / `versionCode 45030` (`app.config.js`, `package.json`) — bump propre, **pins `EXPECTED_VERSION_*` du workflow synchronisés dans le MÊME commit** (leçon V24) |
| Branches de travail                    | toute la mission sur `arena/fcdae8c6-melodix` (aucune autre branche créée ni poussée)                                                                                         |

---

## 2. Constat d'appareil réel (le signal de la mission)

Rapport diagnostic produit par l'appareil utilisateur (Android API 33) :

- Session Spotify **enregistrée** (access token + refresh token) ;
- Dernière étape **réussie** = **échange du code OAuth** (tokens obtenus) ;
- Échec à l'étape **`profile`** : `GET https://api.spotify.com/v1/me` → **HTTP 403**,
  **3 tentatives**, corps **non-JSON sans message exploitable** ;
- En-têtes de la réponse : `Server: envoy`, `Via: HTTP/2 edgeproxy, 1.1 google` ;
- Redirect : `melodix://callback` ;
- **Diagnostic affichait « Client ID : `expo-public-env` »** ;
- Identité du compte **non vérifiée** ; aucun secret dans le rapport.

Ce 403 **persistant** (3 tentatives identiques, corps vide, edge) est **par construction un
refus d'accès côté serveur Spotify, et non une erreur réseau temporaire** — ce que le code
Melodix traite déjà ainsi (jamais un 403 « succès », jamais « réseau temporaire »,
max 3 tentatives bornées, bouton « Réessayer » = vraie requête). Le travail de la mission
était donc de (a) **trouver la cause la plus probable de ce 403** et (b) **corriger tous les
défauts du code** qui masquent ou aggravent le diagnostic.

---

## 3. Cause du 403 — la plus probable + preuves (séparation stricte des niveaux de preuve)

**Hypothèse principale (la plus probable) : restriction dev-mode de l'application Spotify
EXTERNE à Melodix.** Deux sous-branches, non tranchables depuis le dépôt :

- **H1 — Compte hors « Users and Access » (allowlist dev) :** en dev-mode, une app Spotify
  ne sert que le propriétaire de l'app + les comptes explicitement ajoutés dans
  « Users and Access » du Developer Dashboard. Un compte **non répertorié** reçoit un
  **403 au `GET /v1/me`** dont le corps est **vide / non JSON** et qui est émis par
  l'**edge** (`Server: envoy`, `Via: HTTP/2 edgeproxy, 1.1 google`) — **exactement** la
  signature observée sur l'appareil. (Indice log fort + concordance doc communautaire ;
  **pas une preuve formelle** — l'allowlist réelle n'est pas lisible depuis le dépôt.)
- **H2 — Premium du PROPRIÉTAIRE de l'application :** après la migration dev-mode de
  fév./mars 2026, la doc officielle exige que **le propriétaire de l'app ait Spotify
  Premium** (et limite le dev-mode à 25 users). Un propriétaire sans Premium (ou app
  dépassant la limite) produit des refus d'accès côté Spotify. (Règle officielle confirmée
  par la doc ; **le statut Premium réel du propriétaire n'est pas vérifiable depuis le
  dépôt.**)

**Ce qui est ÉTABLI (preuves du dépôt + du signal appareil) :**

1. L'échange OAuth a **réussi** → le **Client ID et le redirect sont valides et acceptés**
   par Spotify (sinon l'échange eût échoué `invalid_client`/`redirect_uri_mismatch`).
   Le 403 arrive **après** l'auth, sur le **profil** : c'est une **restriction de
   données accès** (qui a le droit d'appeler `/me`), **pas** un défaut de client/redirect.
2. La signature `envoy` + `HTTP/2 edgeproxy` + corps vide est celle d'un **rejet à
   l'edge** de Spotify, **pas** de l'API (l'API renvoie un JSON d'erreur structuré
   `{"error":{"status","message"}}`). Un 403 **avec** message JSON (ex. « User not
   approved for app ») aurait été **consigné tel quel** par le diagnostic — il n'y en a
   pas.
3. **Aucun défaut du code Melodix ne peut produire ce 403** : le Bearer est correct,
   l'endpoint est l'officiel, le token est le vrai (obtenu par l'échange réussi), il n'y a
   pas de valeur de test, pas de boucle refresh sur 403, pas de retry illimité.

**Ce qui est NON VÉRIFIABLE depuis le dépôt (limite honnête) :** le statut Premium du
propriétaire de l'app, la composition réelle de « Users and Access », et donc **le
tranchement H1 vs H2**. Seule la **validation par le propriétaire** (Developer Dashboard)
peut le faire.

---

## 4. Diagnostic « Client ID : `expo-public-env` » — la vraie nature du libellé

**`expo-public-env` est un LIBELLÉ DE SOURCE, pas une valeur.** C'est le nom interne de
la **source** d'où le Client ID du build est lu, défini dans
`services/spotify/authConfig.ts`. La lecture est à **source unique**
(`getClientIdInfo()`) :

1. `process.env.EXPO_PUBLIC_SPOTIFY_CLIENT_ID` (inliné par Metro au build) → libellé
   **`expo-public-env`** ;
2. `Constants.expoConfig.extra.spotifyClientId` (asset natif généré depuis `app.config.js`)
   → libellé **`expo-config-extra`** ;
3. sinon → **`none`**.

**Fait clé : `getSpotifyClientId()` (flux OAuth) et `getClientIdInfo()` (diagnostic)
lisent la MÊME source** — la **valeur utilisée par l'OAuth est, par construction, la même
que celle intégrée dans l'APK**. Une divergence OAuth↔diagnostic est **impossible**. Le
vrai Client ID (identifiant **public**, jamais un secret) est
`7c5af4cd57e646c49a6266222c2ed9d6`, **committé** dans `app.config.js`
(`DEFAULT_SPOTIFY_CLIENT_ID`, override `SPOTIFY_CLIENT_ID`), validé 32-hex en CI et
**inliné par Metro** dans le bundle ; la CI a confirmé par grep que la valeur est bien
présente dans le bundle de l'APK (« inliné dans le bundle : OUI »).

**Défaut réel du code (V25-1) : le rapport de diagnostic affichait le libellé de source
brut** (« Client ID : `expo-public-env` ») **comme si c'était la valeur** — ce qui
empêche le propriétaire de savoir **quelle app Spotify l'APK installé utilise** (impossible
de recouper avec le bon dashboard). Corrigé en §5.

---

## 5. Audit OAuth — 10 étapes (pas de réécriture : le flux est correct)

| #   | Étape                      | Constat                                                                                                                                                                                                                                                         | Défaut ? |
| --- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| 1   | URL `authorize`            | `accounts.spotify.com/authorize`, client public **sans secret**, `response_type=code`                                                                                                                                                                           | non      |
| 2   | Scopes                     | 4 scopes en **lecture**, inchangés (aucun scope écrit demandé)                                                                                                                                                                                                  | non      |
| 3   | PKCE `code_verifier`       | généré par `expo-auth-session` (S256), **jamais logué** (booléen de présence seulement)                                                                                                                                                                         | non      |
| 4   | PKCE `code_challenge`      | S256 garanti par le SDK, **jamais clos** ; challenge = hash du verifier                                                                                                                                                                                         | non      |
| 5   | Redirect authorize         | **source unique** env→extra→`melodix://callback` ; **même valeur** authorize ET échange (invariant testé)                                                                                                                                                       | non      |
| 6   | Callback + `state`         | vérification `state` du callback (anti-CSRF) ; `state` invalide → callback écarté                                                                                                                                                                               | non      |
| 7   | Échange code               | corps exact RFC 6749 (`grant_type`, `code`, `redirect_uri`, `client_id`, `code_verifier`) ; **single-flight** par code (un code = un échange) ; transaction PKCE **persistée SecureStore** (mono-utilisation, TTL 10 min, liée au state) pour le **cold start** | non      |
| 8   | Échange **refus** ≠ succès | `invalid_grant`/`invalid_client`/5xx **classés**, jamais traités comme succès ; `save-failed` (SecureStore indispo) classé séparément                                                                                                                           | non      |
| 9   | Stockage tokens            | SecureStore (chiffré, Android Keystore) ; tokens **jamais logués ni exposés**                                                                                                                                                                                   | non      |
| 10  | `GET /v1/me` + validation  | seule une réponse **200 + profil au vrai id** promeut `'spotify'` ; toute autre issue → état explicite (voir §6)                                                                                                                                                | non      |

**Conclusion : le flux OAuth est sain — aucune modification apportée** (respect de
« ne pas réécrire sans défaut démontré »).

---

## 6. Audit `GET /v1/me` + refresh + retentatives (pas de réécriture : correct)

- **Token attendu** : celui de la session, rafraîchi si expiré (RAE — une seule requête de
  refresh partagée par les concurrents).
- **Bearer correct** : `Authorization: Bearer <access_token>` construit dans
  `apiClient.ts`, **jamais logué**.
- **Pas de valeur de test** : le token est le vrai (obtenu par l'échange réussi), pas de
  jeton de démo.
- **Endpoint officiel** : `https://api.spotify.com/v1/me` (aucun endpoint privé, aucun
  contournement).
- **Corps vide / non JSON ≠ crash** : la **forme** du corps est classée
  (`empty` / `json` / `non-json`) ; un corps non JSON ne lève pas d'exception, il est
  consigné et le statut **préserver**.
- **401 → renouvellement** : un 401 invalide d'abord l'access token, **une seule**
  tentative de refresh, **une seule** retry ; refresh **refusé** (définitif) → session
  morte, credentials purgés, reconnexion demandée ; refresh **transitoire** (réseau/5xx/429)
  → session **conservée**, erreur retryable.
- **403 → refus, JAMAIS de boucle refresh** : un 403 ne déclenche **aucun** refresh ;
  seul un 403 « edge » **sans message** est retenté de façon **bornée** (2 retentatives
  max, backoff 1,5 s puis 3 s → **3 tentatives au total**, exactement le signal appareil) ;
  un 403 **avec** message JSON (cause API définitive) n'est **pas** retenté. Le 403 est
  exposé **tel quel** (statut, forme de corps, en-têtes non sensibles, URL finale,
  tentatives) — **jamais** « succès », **jamais** « erreur réseau temporaire ».
- **429 → limites** : attend `Retry-After` (borné 30 s) puis retry (2 max) ; persistant →
  `rate-limited`, session conservée.
- **5xx ≠ refus** : classé `http` (panne serveur), **distinct** d'un 403 (refus) ; pas de
  boucle.
- **Réseau ≠ HTTP** : injoignable/timeout (10 s) → `network`, **distinct** de tout statut
  HTTP ; session conservée.

**Conclusion : le traitement `/v1/me` + refresh + retentatives est conforme à toutes les
consignes (403 ≠ réseau, 403 ≠ boucle, 401 = refresh, 429 = limites, 5xx ≠ refus, réseau ≠
HTTP, pas de faux succès) — aucune modification apportée.**

---

## 7. Modèle de session — états explicites (déjà conforme)

`context/spotifyIdentity.ts` + `context/UserDataContext.tsx` :

- **`'loading'`** : décision en cours (lecture stockage **ou** profil pas encore vérifié) —
  aucun écran n'affiche l'identité locale comme compte connecté ;
- **`'local'`** : aucun compte connecté ;
- **`'spotify'`** : session **et** profil **VÉRIFIÉ** (id Spotify réel) — **seul** état où
  l'identité est exploitable ;
- **`'spotify-unverified'`** : session **stockée** mais profil **indisponible** — état
  explicite (ni « connecté » avec identité locale, ni « local ») ;
- **`'spotify-verifying'`** : (ré-)vérification **en cours** (bouton « Réessayer ») — 2ᵉ
  clic ignoré (aucune double requête).

Invariants : **jamais « connecté » avant validation** ; **session partielle gérée proprement**
(conserver les infos diagnostic, pas d'effacement arbitraire, pas de boucle) ; **jamais de
profil simulé** ; `LOCAL_USER_ID` **n'est jamais** un id Spotify. **Aucune modification
apportée** (déjà conforme).

---

## 8. Correction apportée au code (V25-1) — le rapport affiche le Client ID RÉEL

**Le seul défaut réel du code Melodix identifié par l'audit.** Fichier
`services/spotify/diagnosticReport.ts` + `services/spotify/authConfig.ts` +
`components/Diagnostics/SpotifyDiagnosticActions.tsx` :

- **Avant** : ligne du rapport `Configuration Spotify : présente — Client ID :
expo-public-env — redirect : melodix://callback` → le **libellé de source** était
  présenté **comme s'il était la valeur** → le propriétaire ne pouvait **pas** savoir
  quelle app Spotify l'APK utilise (pas de recoupement possible avec le bon dashboard).
- **Après** : le rapport affiche le **Client ID réel du build**
  (`Client ID : 7c5af4cd57e646c49a6266222c2ed9d6 (source : EXPO_PUBLIC inliné au build)`),
  **seulement si sa forme est valide** (exactement 32 chiffres hexadécimaux —
  `isSpotifyClientIdShape`). Une valeur de **format inhabituel** (libellé collé, token
  collé par erreur dans la variable de build, valeur tronquée) est **signalée**
  (« présent mais format inhabituel (non affiché — vérifier la configuration du build) »)
  **SANS jamais renvoyer la valeur brute** — **anti-fuite** : si un **token** avait été
  collé dans `SPOTIFY_CLIENT_ID`, le rapport ne le réplique **pas**. Le Client ID est un
  identifiant **public** (jamais un secret) : son affichage **n'est pas** une fuite ; c'est
  la donnée qui permet le **recoupement avec le dashboard Spotify**.
- Libellés de source **traduits** (fr/en) et **lisibles** (plus de clé brute).
- **Zéro** modification du flux OAuth / des tokens / du refresh / des scopes / du
  redirect : la correction est **ciblée sur l'affichage du rapport** (le défaut démontré).

---

## 9. Fichiers modifiés (commit code `ea730be`, 11 fichiers, +228 / −10)

| Fichier                                                                   | Rôle                                                                                                                                          |
| ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `services/spotify/authConfig.ts`                                          | + `isSpotifyClientIdShape` (forme 32-hex du Client ID)                                                                                        |
| `services/spotify/diagnosticReport.ts`                                    | entrée `config.clientId` + affichage du Client ID réel (forme valide seulement) + libellés source fr/en + note « format inhabituel »          |
| `components/Diagnostics/SpotifyDiagnosticActions.tsx`                     | passe `clientId` (valeur du build) à l'input du rapport                                                                                       |
| `services/index.ts`                                                       | export barrel de `isSpotifyClientIdShape`                                                                                                     |
| `services/spotify/__tests__/authConfig.unit.test.ts`                      | tests de la forme (32 hex minusc./majusc., rejets : libellé, 31/33, tirets, espaces, `access_token=`, `Bearer …`, `ghp_…`)                    |
| `services/spotify/__tests__/diagnosticReport.unit.test.ts`                | 6 tests V25 (Client ID réel affiché + source lisible fr/en, source extra, absent, format inhabituel sans fuite, valeur sensible non renvoyée) |
| `components/Diagnostics/__tests__/SpotifyDiagnosticActions.unit.test.tsx` | test que l'input du builder porte `clientId` + `clientIdSource` (recoupement dashboard)                                                       |
| `package.json` / `package-lock.json`                                      | version `4.5.0-test.30`                                                                                                                       |
| `app.config.js`                                                           | `version 4.5.0-test.30` + `versionCode 45030`                                                                                                 |
| `.github/workflows/android-apk.yml`                                       | pins `EXPECTED_VERSION_CODE 45030` / `EXPECTED_VERSION_NAME 4.5.0-test.30` (**même commit** que le bump)                                      |

**Aucun flux OAuth, aucun scope, aucun redirect, aucune logique de token modifiée.**

---

## 10. Tests — les 15 scénarios obligatoires (tous couverts, aucun test supprimé)

| #   | Scénario                               | Couvert par                                                                                                           | Résultat       |
| --- | -------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------- |
| 1   | Échange OK → `/me` OK                  | `apiClient` (GET authentifié) + `UserDataContext` (restauration réussie)                                              | ✅             |
| 2   | Échange OK → `/me` 403                 | `apiClient` (403 reste 403) + `UserDataContext` (cas 9)                                                               | ✅             |
| 3   | 403 vide / non JSON                    | `apiClient` (formes `empty`/`non-json`) + `UserDataContext` (cas 10, 12)                                              | ✅             |
| 4   | 401 + refresh contrôlé                 | `apiClient` (401→refresh+retry) + `UserDataContext` (cas 3)                                                           | ✅             |
| 5   | 429                                    | `apiClient` (429 Retry-After) + `UserDataContext` (cas 4)                                                             | ✅             |
| 6   | 5xx                                    | `apiClient` (5xx → `http` avec statut, distinct d'un 403)                                                             | ✅             |
| 7   | Réseau sans HTTP                       | `apiClient` (injoignable → `network`) + `UserDataContext` (cas 5)                                                     | ✅             |
| 8   | Client ID absent                       | `authConfig` (aucun ID → non configuré) + rapport (`configMissing`)                                                   | ✅             |
| 9   | **Client ID placeholder / invalide**   | **V25-1** : `authConfig` (`isSpotifyClientIdShape`) + rapport (format inhabituel **sans fuite**)                      | ✅ **nouveau** |
| 10  | Redirect incohérent                    | `authConfig` (source unique) + `useSpotifyAuth` (invariant authorize==échange, cold start `tx.redirectUri`)           | ✅             |
| 11  | Session partielle (profil non vérifié) | `UserDataContext` (`spotify-unverified`, session conservée)                                                           | ✅             |
| 12  | Pas de faux « connecté »               | `UserDataContext` (matrice id invalides → jamais `spotify`)                                                           | ✅             |
| 13  | Pas de secret exporté                  | rapport (17 tests secrets `<redacted>`) + `UserDataContext` (cas 8)                                                   | ✅             |
| 14  | Réouverture avec session partielle     | `UserDataContext` (restauration : session trouvée, profil non vérifié → `spotify-unverified`, session **non** purgée) | ✅             |
| 15  | Nouvelle tentative après correction    | `UserDataContext` (réessayer → vraie requête `/me` → succès)                                                          | ✅             |

**Résultats exacts (re-validés après le bump, sur le commit final) :**

- **Jest** : **2140 passed / 14 skipped / 0 failed** (158 suites) — 9 tests **nouveaux**
  (2 forme + 6 rapport + 1 input builder) ; **aucun test supprimé, aucune assertion de
  sécurité réduite** ;
- **`tsc --noEmit`** : **0 erreur** ;
- **ESLint** : **0** ;
- **Prettier** : **conforme** (`npm run prettier:check` sur `**/*.{ts,tsx,json,md}`).

> **Honnêteté** : ces résultats sont **verts en local + CI**. Le **comportement réel sur
> téléphone (vrai login Spotify) reste NON TESTÉ** — pas de téléphone dans le sandbox,
> aucune simulation de connexion (voir §13).

---

## 11. CI + APK

- **Workflow** : **« APK Android »** (`.github/workflows/android-apk.yml`).
- **Run de validation** : **`37994878862`** (push du commit code `ea730be`) →
  **`success`** (`completed`) — **toutes les étapes green** :
  « Valider la config Spotify du build (déterministe) », « Vérifier TypeScript, ESLint et
  Prettier », « Tests JavaScript / React Native » (Jest), « Tests Kotlin du module média
  (Robolectric) », « Compiler l'APK », « Aligner 16 Kio et signer l'APK de test »,
  **« Vérifier intégrité, installabilité et signature de l'APK »**,
  **« Installer et lancer réellement l'APK sur Android 14 »** (smoke émulateur),
  « Diagnostic OAuth Spotify (TEMPORAIRE — build de test) », « Publier l'APK comme
  artefact ».
- **Preuves de build (log CI du run)** : `package: name='com.souxch06.melodix'
versionCode='45030' versionName='4.5.0-test.30'` ; signature **V3.0**
  (certificat SHA-256 `fac61745…b9c` — même certificat que les builds précédents) ;
  `Redirect URI = melodix://callback (canonique — Dashboard Spotify du client, les deux
canaux cohérents) · Client ID = présent (32 hex, valeur non affichée) · PKCE sans
secret` ; `scheme melodix présent dans l'APK (melodix://callback déclenchable)`.
- **APK de test** : artefact **`Melodix-v4.5.0-test.30-ea730be.apk`** — **47 051 114
  octets** (~47 Mo), attaché au run `37994878862`.
- **Release** : **skipped** (`publish_test_apk` désactivé) — artefact du run uniquement,
  même convention que V24.

---

## 12. Actions requises côté propriétaire (Developer Dashboard Spotify) — à faire à la main

> Ces actions **ne peuvent pas** être exécutées depuis le dépôt (pas d'accès au dashboard,
> au statut Premium ni à l'allowlist). Elles **ne créent pas de nouvelle application** —
> elles utilisent **l'app existante** (Client ID `7c5af4cd…`, redirect `melodix://callback`).

1. **P0 — « Users and Access » :** vérifier que le **compte qui teste** (celui de
   l'appareil Android API 33) est **répertorié** dans « Users and Access » de l'app
   `7c5af4cd57e646c49a6266222c2ed9d6`. Si ce n'est pas le cas, **l'ajouter** (dev-mode :
   seules les 25 premières personnes + le propriétaire sont servies).
2. **P0 — Premium du PROPRIÉTAIRE :** confirmer que le **propriétaire de l'application**
   Spotify dispose bien de **Spotify Premium** (exigence de la doc post-migration 2026).
3. **P1 — Recouper le Client ID :** ouvrir le **nouveau rapport de diagnostic** (APK
   `test.30`) et vérifier que le **Client ID affiché** correspond bien à l'app du bon
   dashboard (c'est l'objet de la correction V25-1).
4. **P1 — « Réessayer » :** après les P0, lancer **Réessayer** dans l'app → un **200**
   `GET /v1/me` est attendu → identité **vérifiée** (`'spotify'`), rapport purgé.
5. **P2 — Transmettre le rapport** (bouton Partager) au besoin — il ne contient **aucun**
   secret (tokens / refresh / code / cookie / header sensible).

**Limites honnêtes (ce que ce rapport ne peut PAS affirmer) :**

- **Test physique NON EFFECTUÉ** (pas de téléphone dans le sandbox) — le 403 réel et sa
  résolution « Réessayer → 200 » doivent être **confirmés sur l'appareil**.
- **Pas d'accès** au Developer Dashboard, au statut Premium du propriétaire ni à
  l'allowlist réelle → **le tranchement H1 vs H2 et la validation finale relèvent du
  propriétaire** (ce rapport ne **prétend pas** vérifier ces éléments).
- **Aucun secret** dans ce rapport ni dans le rapport d'appareil (tokens / refresh / code
  OAuth / verifier / cookie / en-tête `Authorization` **exclus**) ; URLs et paramètres
  nettoyés ; taille bornée ; **jamais transmis automatiquement** à un serveur externe.
- **Aucune contournement** de restriction Spotify (pas d'endpoint privé, pas d'interception,
  pas de bypass DRM/cookie).

---

## 13. Sources officielles consultées (règles confirmées — URL + date de consultation)

Consultées le **2026-10-09** :

- **Spotify Web API — « February 2026 migration guide »** :
  `https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide`
  → checklist **« Ensure the app owner has Spotify Premium »** ; **limite dev-mode 25 users**
  (augmentionnée) ; **grandfathering** des apps existantes ; `/search` limit abaissé ; champ
  `User.product` **retiré** de `/me` ; endpoints retirés.
- **Spotify Web API — changelog fév. 2026** :
  `https://developer.spotify.com/documentation/web-api/references/changes/february-2026`.
- **Spotify Web API — changelog mars 2026** :
  `https://developer.spotify.com/documentation/web-api/references/changes/march-2026`.
- **Spotify Community (mars 2025)** : 403 **corps vide** `envoy`/`edgeproxy` résolu par
  **ajout du compte dans « Users and Access »** ; WPS ≠ client natif (contexte dev-mode).
- **MDN — en-tête `Via`** : sémantique `HTTP/2 edgeproxy, 1.1 google` (passage par un
  edge/intermédiaire, cohérent avec un rejet à l'edge).

**Séparation des niveaux de preuve (règle VS indice VS hypothèse VS vérifiable
propriétaire) :**

- **Règles officielles confirmées** : Premium du propriétaire exigé (post-2026), limite
  25 users dev-mode, allowlist « Users and Access », retrait `User.product` de `/me`.
- **Indices log (appareil)** : 403 **persistant**, corps **non-JSON/vide**,
  `Server: envoy`, `Via: HTTP/2 edgeproxy, 1.1 google`, échange **réussi** puis `/me` refusé.
- **Hypothèses (H1/H2)** : compte hors allowlist **ou** Premium propriétaire — **non
  tranchables** depuis le dépôt.
- **Vérifiable par le propriétaire uniquement** : statut Premium réel, composition de
  « Users and Access », résolution par « Réessayer » sur appareil.

---

## Verdict

> **`CORRECTIONS DU CODE VALIDÉES, CONFIGURATION SPOTIFY À VÉRIFIER`**

- Le **code Melodix** (flux OAuth, `/v1/me`, refresh, retentatives, modèle de session,
  rapport de diagnostic) a été **audité en intégralité** : **un seul défaut réel** (le
  rapport affichait le libellé de source au lieu du Client ID réel) a été **corrigé, testé
  (15 scénarios, 9 tests nouveaux, 2140 passed) et validé** (tsc/ESLint/Prettier + CI).
- Le **HTTP 403 `GET /v1/me`** a une **cause externe la plus probable** (restriction
  dev-mode : compte hors « Users and Access » **ou** Premium du propriétaire) qui
  **n'est pas un défaut du code** et **ne peut être tranchée ni validée depuis le dépôt**.
- Il reste à **vérifier et corriger la configuration Spotify** côté **propriétaire**
  (§12) puis à **confirmer sur l'appareil réel** un « Réessayer » → **200** (test physique
  **NON EFFECTUÉ** dans le sandbox).
- **`main` intouché**, **PR #6 non fusionnée**, **aucun secret exposé**, **aucun
  contournement** de restriction Spotify.
