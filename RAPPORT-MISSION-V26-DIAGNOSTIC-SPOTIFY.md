# RAPPORT MISSION V26 — Diagnostic Spotify autonome et validation complète

> **Synthèse** : audit complet du dépôt distant, de la PR #6, de la chaîne de connexion
> Spotify (Client ID → OAuth PKCE → échange → session → `/v1/me` → interprétation) et de la
> couverture de tests. **Aucun défaut de code applicatif n'a été trouvé** (audit V25
> re-confirmé au HEAD réel) ; **2 scénarios de simulation manquaient** à la suite de tests
> (500/503 explicites, timeout) — **ajoutés** (3 tests), toutes les portes locales et la CI
> sont vertes sur le HEAD final. Le **HTTP 403 `GET /v1/me`** observé sur téléphone a une
> **cause externe la plus probable** (restriction dev-mode Spotify : compte non autorisé ou
> Premium du propriétaire) que le **code ne peut ni corriger ni vérifier** depuis le dépôt —
> **aucun test physique n'a été réalisé** (pas de téléphone, pas de compte Spotify).

---

## 1. HEAD initial / HEAD final

| Champ                            | Valeur                                                                                                                                                                                             |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| HEAD initial (référence mission) | `178edb0739fc3dfd0717c3392993f9d821012154` (fin V25)                                                                                                                                               |
| Commit V26 (tests)               | `d49cae9`                                                                                                                                                                                          |
| HEAD final — rapport             | `c10a9488a0a824b3983e9c015243df095ce2c68b` (ce rapport ; vérifié sur le distant en V26.1)                                                                                                          |
| `main`                           | `fceab85950b069edcb65ed718a8ffd419a1bc785` — **INTACTE** (aucune écriture, aucun merge)                                                                                                            |
| PR #6                            | **OPEN**, **MERGEABLE**, head = `arena/fcdae8c6-melodix`, base = `main` — **non fusionnée**                                                                                                        |
| Taille de la PR                  | **150 commits / 324 fichiers (+56 242 / −3 310)** vs `main` — **métadonnées GitHub de la PR** (API `pulls/6`, relues le 2026-10-10 ; le décompte GitHub inclut l'historique complet de la branche) |
| Version app                      | `4.5.0-test.30` / `versionCode 45030` — **inchangée** (aucun code applicatif modifié en V26)                                                                                                       |

**Note sandbox** : au démarrage de la mission, le workspace local avait été réinitialisé par
le sandbox vers un commit antérieur (8ᵉ occurrence) ; l'inspection du worktree a montré
**aucun commit local non poussé** (0 ahead du distant) — réalignement
`git reset --hard origin/arena/fcdae8c6-melodix` sur `178edb0` (le seul fichier hors dépôt
précédemment non commité, `REVIEW-PR6-GUIDE.md`, a été sauvegardé avant l'opération).

---

## 2. Fichiers modifiés et raisons

**Un seul fichier** (règle « si un changement n'est pas nécessaire, ne le fais pas ») :

| Fichier                                                   | Raison                                                                                                                                                                                                                                                                                                                                                                                           |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `services/spotify/__tests__/apiClient.unit.test.ts` (+47) | **3 tests de régression manquants** parmi les 17 scénarios de simulation de la mission : `5xx (500)` et `5xx (503)` → `kind http` avec le statut exact + session **conservée** (panne serveur ≠ refus 403 ≠ mort de session — seul 502 était explicitement testé) ; `timeout` → fetch qui pend est aborté à la borne de 10 s et classé `network` (distinct d'un statut HTTP), session conservée. |

**Aucun fichier de code applicatif n'a été modifié** : le flux OAuth (authorize/PKCE S256/
state/échange), le stockage de session (SecureStore), le renouvellement de token (RAE
classifié), `GET /v1/me` (Bearer officiel, formes de corps, retentatives bornées) et le
rapport de diagnostic ont été **audités au HEAD réel et jugés conformes** — « ne pas
réécrire sans défaut démontré » (V25 a corrigé le seul défaut réel : l'affichage du Client
ID dans le rapport).

---

## 3. Causes confirmées / hypothèses non confirmées

### 3.1 Confirmé (preuves du dépôt + du signal appareil, HEAD `d49cae9`)

1. **Le code Melodix ne fabrique pas le 403.** L'échange OAuth a **réussi** sur le
   téléphone (tokens obtenus, session + refresh enregistrés) → le Client ID et le
   redirect `melodix://callback` sont **valides et acceptés** par Spotify. Le 403 arrive
   **après** l'authentification, sur `GET /v1/me` : c'est une **restriction d'accès aux
   données du compte**, pas un défaut de client/redirect/scope du code.
2. **Le 403 observé est un refus NIVEAU EDGE de Spotify** : corps non JSON/vide +
   `Server: envoy` + `Via: HTTP/2 edgeproxy, 1.1 google` — l'API Spotify renvoie au
   contraire un JSON d'erreur structuré `{"error":{"status","message"}}`. Un 403 avec
   message JSON (ex. « User not approved for app ») aurait été consigné tel quel par le
   diagnostic — il n'y en a pas.
3. **Aucun secret client** dans l'app mobile (client public PKCE, testé : «
   `redeemAuthorizationCode` transmet PKCE SANS client_secret ») ; **aucun ancien token
   réutilisé par erreur** (un 401 invalide d'abord l'access token avant refresh unique) ;
   **Bearer exact** `Authorization: Bearer <token>` (testé) ; **scopes/redirect/Client ID
   cohérents** (source unique `getClientIdInfo()` vérifiée au HEAD : authorize
   `useSpotifyAuth.ts:184`, échange `session.ts:620`, refresh `session.ts:423`, diagnostic
   `SpotifyDiagnosticActions.tsx:129` — même fonction, même priorité env→extra→défaut).
4. **Aucune implémentation concurrente, aucun Client ID codé en dur** hors `app.config.js`
   (l'unique autre chaîne 32-hex+ du dépôt est un hash de requête persistante backend,
   documenté et surchargeable par env) ; **aucun redirect obsolète** dans le code ;
   **aucun message d'erreur trompeur** restant (V24 : 403 jamais « erreur réseau
   temporaire » ; V25 : Client ID réel affiché, jamais le libellé de source).
5. **403 HTML/non JSON** : ni boucle de connexion, ni faux succès, ni refresh inutile —
   seul le 403 « edge sans message » est retenté **2× au maximum** (backoff 1,5 s + 3 s →
   **3 tentatives**, exactement le signal appareil) ; 401/403/429/5xx/réseau/timeout sont
   **distingués** (tests §4) ; corps/en-têtes analysés **sans crash** (forme `empty`/`json`/
   `non-json` classée) ; tentatives **bornées** ; `Retry-After` **respecté** (testé).

### 3.2 Hypothèses non confirmées (cause du 403 — externes à Melodix)

- **H1 — Compte non autorisé dans « Users and Access » (allowlist dev) :** en dev-mode,
  une app ne sert le propriétaire + les comptes répertoriés (limite 5 users/app pour les
  apps neuves, **grandfathering** des apps existantes — doc officielle §3.3). Un compte non
  répertorié reçoit un 403 au `/v1/me` **émis par l'edge, corps vide/non JSON** —
  signature **concordante** avec le signal appareil (indice log fort + doc communautaire,
  **pas une preuve formelle** : l'allowlist réelle n'est pas lisible depuis le dépôt).
- **H2 — Premium du PROPRIÉTAIRE de l'application :** règle officielle confirmée (§3.3) —
  « les apps en Development Mode exigent que le propriétaire ait un abonnement Premium
  actif ; **si l'abonnement expire, l'app cesse de fonctionner** ». Le statut Premium réel
  du propriétaire **n'est pas vérifiable depuis le dépôt**.

**Tranchement H1 vs H2 = impossible depuis le dépôt** (pas d'accès au Developer
Dashboard). Le **code ne peut pas corriger** cette restriction : rien à modifier dans
Melodix n'y changerait quoi que ce soit ; une action **propriétaire** est requise (§10).

---

## 4. Résultats des tests (nombres exacts)

**Suite Jest complète** (HEAD `d49cae9`, `npx jest --runInBand`) :

|                             | Valeur                                                                    |
| --------------------------- | ------------------------------------------------------------------------- |
| Tests **réussis**           | **2143**                                                                  |
| Tests **échoués**           | **0**                                                                     |
| Tests **ignorés** (skipped) | **14**                                                                    |
| Suites passées / total      | **158 / 172** (14 suites skipped)                                         |
| **Nouveaux en V26**         | **3** (500, 503, timeout) — aucun test supprimé, aucune assertion réduite |

**Les 17 scénarios de simulation de la mission — couverture** (réponses HTTP contrôlées,
aucun vrai compte contacté, aucune simulation présentée comme test réel de l'API) :

| #   | Scénario                                             | Couvert par                                                                                                                                                   |
| --- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | OAuth réussi puis `/v1/me` 200                       | `useSpotifyAuth` (succès complet) + `UserDataContext` (restauration)                                                                                          |
| 2   | Code OAuth invalide                                  | `session` (400 `invalid_grant`/`invalid_client` classés, jamais succès) + `useSpotifyAuth` (échange refusé)                                                   |
| 3   | Redirect URI incorrect                               | `useSpotifyAuth` (divergence authorize/échange → mismatch, **aucun** échange) + `session` (refus redirect)                                                    |
| 4   | Client ID manquant / invalide                        | `authConfig` (non configuré ; forme 32-hex) + rapport (absence / format inhabituel sans fuite) + `useSpotifyAuth` (not-configured, promptAsync jamais appelé) |
| 5   | Token expiré + renouvellement réussi                 | `session` (refresh auto, nouveau token persisté) + `apiClient` (401→refresh+retry)                                                                            |
| 6   | Renouvellement refusé                                | `session` (refresh refusé → `unauthenticated`, credentials purgés) + `apiClient`                                                                              |
| 7   | `/v1/me` 401                                         | `apiClient` (401 → refresh contrôlé ; 2ᵉ 401 après refresh réussi → retryable, session conservée)                                                             |
| 8   | `/v1/me` 403 corps JSON                              | `apiClient` (statut + message Spotify conservés, jamais le token)                                                                                             |
| 9   | `/v1/me` 403 page HTML                               | `apiClient` (forme `non-json` + Content-Type HTML + métadonnées sûres)                                                                                        |
| 10  | `/v1/me` 403 sans corps                              | `apiClient` (forme `empty`, 3 appels max, 403 exposé tel quel)                                                                                                |
| 11  | 429 avec `Retry-After`                               | `apiClient` (attente `Retry-After` respectée ; persistant → `rate-limited`)                                                                                   |
| 12  | 500 et 503                                           | **V26** (statut exact conservé, `http`, session conservée) + 502 préexistant                                                                                  |
| 13  | Timeout / absence réseau                             | **V26 timeout** (abort 10 s → `network`) + `apiClient` (panne réseau → `network`)                                                                             |
| 14  | Token absent / session partielle                     | `apiClient` (aucune session → `unauthenticated` **sans appel réseau**) + `UserDataContext` (session partielle → `spotify-unverified`, session **non** purgée) |
| 15  | Vérification d'identité échouée après échange réussi | `useSpotifyAuth` (token reçu puis `/me` 403/réseau → classé, jamais faux succès)                                                                              |
| 16  | Absence de boucle de connexion                       | `useSpotifyAuth` (1 seul échange par code, double-flux ignoré) + `UserDataContext` (403 → jamais de refresh, réessai = vraie requête unique)                  |
| 17  | Pas de fuite de tokens/secrets                       | `session` (logs sans code/verifier/token) + rapport (17 tests secrets `<redacted>`, valeurs SALES injectées) + `devLog` (motif secret)                        |

---

## 5. TypeScript / ESLint / Prettier / tests Android

| Contrôle                                                        | Résultat (HEAD `d49cae9`)                                                |
| --------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `npx tsc --noEmit`                                              | **0 erreur**                                                             |
| ESLint (`npm run lint` / `npx eslint . --ext .ts,.tsx`)         | **0**                                                                    |
| Prettier (`npm run prettier:check` sur `**/*.{ts,tsx,json,md}`) | **conforme**                                                             |
| Tests Kotlin / Robolectric                                      | **success** en CI (étape « Tests Kotlin du module média (Robolectric) ») |

---

## 6. Workflow (CI)

- **Workflow** : **« APK Android »** — `.github/workflows/android-apk.yml`.
- **Deux runs SUCCESS distincts à distinguer** (même version `4.5.0-test.30`) :
  - **Run `38039240422`** — head **`d49cae9`** (commit V26 tests) →
    `https://github.com/Souxch06/Melodix/actions/runs/38039240422` — **`success`** ;
    artefact `Melodix-v4.5.0-test.30-d49cae9.apk` (47 051 116 o).
  - **Run `38040043658`** — head **`c10a948`** (**HEAD final**, commit rapport V26) →
    `https://github.com/Souxch06/Melodix/actions/runs/38040043658` — **`success`** ;
    artefact `Melodix-v4.5.0-test.30-c10a948.apk` (47 051 116 o).
- **Statut / conclusion des deux runs** : **`success`** (`completed`) — **aucune étape non
  verte** (toutes `success`/`skipped`) : config Spotify du build (déterministe),
  tsc/ESLint/Prettier, Jest, Robolectric, build Gradle, alignement 16 Kio + signature,
  intégrité/installabilité, smoke émulateur Android 14, diagnostic OAuth (build de test),
  publication de l'artefact.
- **Runs antérieurs verts (mêmes versions)** : `37994878862` (code V25 `ea730be`) et
  `37996663601` (HEAD V25 `178edb0`) — tous `success`.

---

## 7. APK

| Artefact                             | Version / versionCode | Taille           | Disponibilité                                              |
| ------------------------------------ | --------------------- | ---------------- | ---------------------------------------------------------- |
| `Melodix-v4.5.0-test.30-c10a948.apk` | 4.5.0-test.30 / 45030 | **47 051 116 o** | artefact du run `38040043658` (**HEAD final `c10a948`**)   |
| `Melodix-v4.5.0-test.30-d49cae9.apk` | 4.5.0-test.30 / 45030 | **47 051 116 o** | artefact du run `38039240422` (commit V26 tests `d49cae9`) |
| `Melodix-v4.5.0-test.30-178edb0.apk` | 4.5.0-test.30 / 45030 | 47 051 117 o     | artefact du run `37996663601` (HEAD V25)                   |
| `Melodix-v4.5.0-test.30-ea730be.apk` | 4.5.0-test.30 / 45030 | 47 051 114 o     | artefact du run `37994878862` (code V25)                   |

- **Vérification version/versionCode** : les pins du workflow (`EXPECTED_VERSION_CODE
45030` / `EXPECTED_VERSION_NAME 4.5.0-test.30`) sont **synchronisés** avec
  `app.config.js`/`package.json` (inchangés en V26 — aucun code applicatif modifié) ;
  l'étape CI « Vérifier intégrité, installabilité et signature de l'APK » vérifie ces
  valeurs sur le binaire réel.
- **Signature** : V3.0, alignement 16 Kio (étapes CI) — même certificat que les builds
  précédents (SHA-256 `fac61745…b9c`).
- **Release GitHub** : **skipped** (`publish_test_apk` désactivé) — artefact du run
  uniquement.

---

## 8. Testé en simulation / en CI / sur appareil réel

- **Simulation (unit tests, réponses HTTP contrôlées)** : les 17 scénarios du §4 —
  **2143 tests**. C'est une **simulation** : aucun vrai compte Spotify n'est contacté,
  aucun identifiant personnel n'est utilisé, et une simulation n'est présentée nulle part
  comme un test réel de l'API.
- **CI (GitHub Actions, émulateur Android 14)** : chaîne complète — Jest, tsc/ESLint/
  Prettier, Robolectric, build Gradle, signature, intégrité, **installation et lancement
  réels de l'APK sur l'émulateur**, diagnostic OAuth A/B du build de test (la fixture
  `EXPO_PUBLIC_SPOTIFY_OAUTH_SMOKE=1` est **inactive** hors build de test : jamais de
  faux login).
- **Appareil réel** : **AUCUN test physique n'a été réalisé** — pas de téléphone ni de
  compte Spotify dans cet environnement. Le comportement réel du login (vrai compte,
  vrai dashboard) **reste à valider par le propriétaire** (§9–10).

---

## 9. Ce qui reste impossible à confirmer sans accès propriétaire

| Élément                                                                            | Pourquoi impossible depuis le dépôt     |
| ---------------------------------------------------------------------------------- | --------------------------------------- |
| Tranchement **H1 vs H2** (Users and Access vs Premium propriétaire)                | accès au **Developer Dashboard** requis |
| Statut **Premium du propriétaire** de l'app                                        | compte Spotify du propriétaire requis   |
| Composition réelle de **« Users and Access »** (le compte testant y figure-t-il ?) | dashboard requis                        |
| Résolution finale : « Réessayer » → **200** sur `/v1/me`                           | appareil réel + compte autorisé requis  |

Le code **ne peut pas corriger** une de ces restrictions : c'est une configuration
**externe** (compte/application Spotify), pas un défaut de Melodix. **Aucune tentative de
contournement** n'a été faite ni proposée (pas d'endpoint privé, pas d'interception, pas
de cookies, pas de bypass) ; **aucun compte/identifiant de tierce personne** n'est utilisé.

---

## 10. Actions restantes (limitées à ce qui est réellement nécessaire)

> Aucune action n'est requise dans le **dépôt** : l'audit n'a trouvé aucun défaut de code
> résidant. Les actions ci-dessous relèvent du **propriétaire** de l'application Spotify
> (Client ID `7c5af4cd57e646c49a6266222c2ed9d6`, redirect `melodix://callback` — **l'app
> existante**, aucune nouvelle application à créer) et de la validation sur téléphone.

1. **P0 — Developer Dashboard → « Users and Access » :** vérifier que le **compte qui
   teste** est répertorié pour l'app `7c5af4cd…` ; sinon l'ajouter (limite dev : apps
   existantes grandfatherées, apps neuves 5 users/app).
2. **P0 — Premium du PROPRIÉTAIRE :** confirmer un abonnement Premium **actif**
   (règle officielle : sans Premium du propriétaire, une app dev-mode **cesse de
   fonctionner**).
3. **P1 — Recouper le Client ID :** le rapport de diagnostic (APK `4.5.0-test.30`+)
   affiche désormais le Client ID réel du build — le vérifier contre le bon dashboard.
4. **P1 — Sur téléphone : « Réessayer »** après les P0 → un **200** `GET /v1/me` est
   attendu (identité vérifiée, rapport purgé). C'est le **seul** test restant, et il
   n'est possible que sur un appareil avec un compte autorisé.

**Source officielle consultée le 2026-10-10** : Spotify Web API — « February 2026 Web API
Dev Mode Changes — Migration Guide »,
`https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide`
— Premium requis du propriétaire (« if the owner's Premium subscription lapses, the app
will stop working ») ; limites apps neuves (Client IDs par développeur : 25 depuis le
changelog juil. 2026 ; 5 users/app) et **grandfathering** des apps existantes ; timeline
(migration des apps existantes le 9 mars 2026) ; champs `country`/`email`/
`explicit_content`/`followers`/`product` **retirés** de `GET /me` (l'endpoint reste
disponible) ; `/search` limit max 10. Compléments (changelogs) :
`https://developer.spotify.com/documentation/web-api/references/changes/february-2026`,
`.../references/changes/march-2026`, `.../references/changes/july-2026`.

---

## État final

- **`main` intouché** (`fceab859`), **PR #6 OPEN/MERGEABLE, non fusionnée**.
- Corrections nécessaires poussées sur la branche de la PR (tests V26) ; rapport commité ;
  build Android + artefact vérifiés par la CI du HEAD final.
- **Aucun secret exposé**, **aucun contournement**, **aucun test supprimé**.
