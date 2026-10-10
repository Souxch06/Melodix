# RAPPORT MISSION V27 — Diagnostic HTTP 403 Spotify et plan de continuité

Mission menée sur `arena/9dadfbee-melodix` (branche dédiée de la session Arena),
dépôt `Souxch06/Melodix`, le 10/10/2026. Contexte : téléphone Android API 36,
Melodix 4.5.0-test.30 (build 45030, commit embarqué `557d8f7`/`46e6650` selon
l'APK installé) — l'échange OAuth PKCE aboutit, la session est enregistrée,
mais `GET https://api.spotify.com/v1/me` renvoie HTTP 403 à trois reprises,
sans corps exploitable.

## 1. Audit du code réel (étape 1) — chemins et preuves

| Sujet                                                 | Fichier                                                                                                                                                                                                                    | Preuve (comportement réel du code)                                                                                                                                                                                                                                                                                                                                                                                                |
| ----------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Échange OAuth + sauvegarde session                    | `services/spotify/session.ts` → `redeemAuthorizationCode` (l. 591+)                                                                                                                                                        | `grant_type=authorization_code` + PKCE (`code_verifier`), AUCUN `client_secret` (client public) ; `saveSession` sur HTTP 200 avec `access_token` ; sinon `TokenExchangeOutcome` classé (`refused`/`network`/`invalid-response`/`save-failed`)                                                                                                                                                                                     |
| Récupération / renouvellement / expiration des tokens | `services/spotify/session.ts` → `isExpired`, `refreshAccessTokenClassified`, `resolveStartupSession`                                                                                                                       | refresh à l'expiration, RAE (un seul refresh partagé pour appels concurrents), classification définitif (`refused`, `no-refresh-token`) vs transitoire (429/5xx/réseau → session CONSERVÉE)                                                                                                                                                                                                                                       |
| Appels API Web                                        | `api/spotify/me.ts` (`/me`), `api/spotify/userPlaylists.ts` (`/me/playlists`), `api/spotify/savedTracks.ts` (`/me/tracks` paginé), `api/spotify/search.ts` (`/search`), `api/spotify/album.ts`, `artist.ts`, `playlist.ts` | tous passent par `spotifyApiGet` (`services/spotify/apiClient.ts`) : base `https://api.spotify.com/v1`, timeout 10 s, `Accept: application/json`                                                                                                                                                                                                                                                                                  |
| Scopes                                                | `services/spotify/authConfig.ts` → `SPOTIFY_SCOPES`                                                                                                                                                                        | `user-read-private`, `user-library-read`, `playlist-read-private`, `playlist-read-collaborative` — pas d'email, aucun scope d'écriture ; `scopeCoverage.unit.test.ts` vérifie la couverture endpoint par endpoint                                                                                                                                                                                                                 |
| Erreurs 401/403/429/non-JSON                          | `services/spotify/apiClient.ts`                                                                                                                                                                                            | 401 → UN refresh + UNE retry puis 'unauthenticated' (définitif) ou erreur retryable (transitoire) ; 429 → attente `Retry-After` (bornée 30 s, 2 retries) ; 403 → AUCUN refresh, 2 retentatives bornées « edge » (1,5 s, 3 s) si et seulement si le corps ne contient PAS de message JSON, diagnostics `bodyShape`/`Content-Type`/en-têtes allowlistés ; non-JSON → statut préservé, forme classée, jamais de corps ni token loggé |
| UI quand Spotify refuse                               | `context/UserDataContext.tsx` → `verifySpotifyIdentity` ; `app/(tabs)/_layout.tsx` ; `context/spotifyIdentity.ts` → `spotifyUnavailableBody` (l. 110)                                                                      | 403 = échec TRANSITOIRE-classé → état `'spotify-unverified'` avec texte dédié « refus d'accès » (jamais « réseau »), session et données locales CONSERVÉES, jamais de profil fictif affiché comme compte Spotify ; `unauthenticated` → `signOut` (purge ciblée)                                                                                                                                                                   |

**Distinction échange OAuth vs API fonctionnelle** : le flux login ne
publie `session:authenticated` qu'APRÈS un `/me` 200 + identité valide
(`useSpotifyAuth.ts`, l. 424-449) ; un `/me` en échec laisse l'écran en
erreur — l'échange réussi n'a jamais été présenté comme une session validée.
Le point faible V26 restant : cet échec 403 tombait dans le cas `unknown` →
message « erreur inattendue » générique (corrigé ici, §3).

**Les « trois » 403 observés ne sont pas un bug** : le client V25 émet
volontairement 1 appel + 2 retentatives bornées pour un 403 SANS message
(refus venant de l'edge/CDN Spotify, documenté comme parfois intermittent).
`attempts >= 2` dans le diagnostic signifie « 403 persistant » — exactement
le cas présent.

## 2. Diagnostic du 403 (étape 2) — règles Spotify en vigueur en octobre 2026

Sources consultées (recherche Web du 10/10/2026) :

- TechCrunch, 06/02/2026 : Spotify restreint le Developer Mode — **Premium
  obligatoire pour le propriétaire de l'app**, testeurs ramenés de 25 à 5,
  endpoints réduits ; objectif affiché : freiner les usages automatisés [1].
- itechguides, 18/08/2026 (synthèse à jour des règles) : « The Spotify
  Development Mode app owner must have an active Premium account » ; un
  testeur peut **réussir le login OAuth sans figurer dans l'allowlist et
  recevoir quand même HTTP 403 sur les appels API** ; le quota dépassé se
  manifeste par 429 `QUOTA_EXCEEDED` (et non 403) ; « Premium does not remove
  the five-user cap » ; le nombre de Client IDs est passé de 1 à 25 par
  compte développeur le 23/07/2026 [2].
- vorplabs, 20/07/2026 : « non-allowlisted users receive 403 errors on API
  requests » ; l'app dev-mode **cesse de fonctionner si le Premium du
  propriétaire expire**, et reprend à la résouscription [3].
- endpoint51, 18/06/2026 : depuis février 2026, un compte gratuit ne peut
  plus enregistrer d'app ; la distinction importante est que **c'est le
  compte PROPRIÉTAIRE du dashboard qui doit être Premium**, pas chaque
  utilisateur [4].

**Cause démontrée** : le blocage vient du REFUS D'ACCÈS de l'API Web (403
persistant à travers les retentatives, sans message JSON), et non d'une
session morte, d'un refresh raté ou d'un réseau instable — prouvé par la
chaîne de code auditée (l'échange a renvoyé 200 + tokens, le 403 ne
déclenche aucun refresh, `attempts=3` = refus déterministe).

**Cause la plus probable (hors de reach technique, non démontrable d'ici)** :
le contexte de la mission indique que **le propriétaire du projet n'a pas
Spotify Premium** ; or les règles 2026 exigent un Premium ACTIF du
propriétaire pour qu'une app en mode développement fonctionne. Cette
restriction explique à elle seule le symptôme exact (login OK, API 403).
Le compte utilisateur absent de « Users and Access » (allowlist de 5) est la
seconde cause classique du même symptôme. **Nous ne prétendons pas avoir
consulté le Developer Dashboard** et n'affirmons pas que c'est la seule
cause : sans accès au dashboard, une anomalie edge/CDN persistante ou un
état de compte particulier restent des possibilités résiduelles.

**Inconnues** : état réel de l'abonnement du propriétaire, présence du
compte dans l'allowlist, correspondance exacte des Redirect URIs et du
Client ID côté dashboard. → checklist manuelle au §6.

## 3. Correction de la gestion d'erreurs (étape 3)

État vérifié : la matrice demandée était **déjà en place et testée** (401 →
UN refresh puis session invalide signalée ; 429 → `Retry-After` respecté ;
403 → aucun refresh, jamais de boucle ; non-JSON → statut + forme conservés
sans données sensibles ; 500/503/timeout : tests historiques conservés et
toujours verts). Une seule lacune réelle, corrigée par cette mission :

| Fichier                              | Changement                                                                                                                                                                                                                                                                      |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `services/spotify/session.ts`        | `LoginErrorOutcome` s'enrichit du kind `'profile-forbidden'` (échange OAuth réussi mais `/v1/me` refusé 403)                                                                                                                                                                    |
| `services/spotify/useSpotifyAuth.ts` | `completeLogin` classe `http·403` → `profile-forbidden` (au lieu de `unknown`) ; **aucun** re-refresh, **aucun** second échange, session stockée conservée ; diagnostic enrichi (statut, code, message sanitisé)                                                                |
| `screens/LoginScreen.tsx`            | Carte dédiée « Spotify a refusé l'accès à cette application » : explique refus de configuration dev-mode (Premium propriétaire + « Users and Access »), jamais « erreur inattendue », jamais de texte réseau mensonger ; « Réessayer » manuel seulement, aucun champ credential |
| `data/fr-fr.ts`, `data/en-gb.ts`     | `loginProfileForbiddenTitle` / `loginProfileForbiddenBody` (FR + EN)                                                                                                                                                                                                            |

Règles conservées : pas de Client ID saisi dans l'UI, aucun secret dans le
code/logs/rapport, pas de contournement, l'échange réussi n'est toujours pas
assimilé à une session validée (le kind dédié le dit à l'utilisateur).

## 4. Préservation de l'utilisation de Melodix (étape 4)

- **Profil/playlists fictifs** : aucun — `spotify-unverified` masque les
  écrans de compte derrière l'ErreurCard dédiée (`app/(tabs)/_layout.tsx`) ;
  `SpotifyDataPlan` interdit structurellement le chargement de données
  compte sans identité vérifiée ; le profil local `'Mélomane'` n'est jamais
  présenté comme le compte connecté.
- **Données Spotify clairement indisponibles** : oui — texte classé « refus
  d'accès » (`spotifyUnavailableBody`, 6 call sites), rapport de diagnostic
  copiable (`SpotifyDiagnosticActions`), et depuis ce commit le même message
  sur l'écran de connexion.
- **Auth + données locales préservées** : oui — le 403 n'efface ni la
  session ni les caches locaux (purge réservée au `unauthenticated`
  définitif).
- **Lecture Spotify Web expérimentale** : toujours désactivée par défaut,
  gardes-fous intacts (non touchés par la mission).
- **Moteur audio Audius → YouTube** : indépendant par construction —
  `api/audius/` et `services/audio/` n'appellent JAMAIS `api.spotify.com`
  (zéro occurrence ; seul l'identifiant Spotify sert au matching) et la
  cascade Audius→YouTube est prouvée par `services/audio/__tests__/trackResolver.unit.test.ts`
  (9 cas : panne, timeout, crash, priorité). **Mais la règle produit
  « CONNEXION SPOTIFY OBLIGATOIRE » bloque l'accès aux écrans** : en
  `spotify-unverified`, le layout n'ouvre PAS les onglets → la recherche
  Audius (écran search) est inaccessible tant que `/me` échoue. Le moteur
  n'est pas cassé par le 403 ; c'est la PORTENTE qui l'est.

**Proposition de continuité (décision produit propriétaire — non implémentée
ici, car elle change le contrat d'usage et ne répare aucun défaut démontré
du code)** — plan « V28 » :

1. En état `'spotify-unverified'` avec session présente : ouvrir les onglets
   Recherche/Home avec le plan `identity-unavailable` DÉJÀ prévu par
   `SpotifyDataPlan` — les écrans de compte (Titres aimés, Playlists,
   Bibliothèque Spotify) restent en état « indisponible + Réessayer », la
   recherche et la lecture Audius→YouTube redeviennent utilisables. Aucun
   contournement d'authentification : la session OAuth existe réellement et
   Spotify n'est pas appelé sans autorisation.
2. Sans session du tout : l'écran de connexion reste la porte d'entrée
   (règle produit « connexion obligatoire ») — pas de mode invité.
3. Bandeau persistant « Données Spotify indisponibles (403) » tant que la
   configuration du dashboard n'est pas corrigée ; dès qu'un `/me` répond
   200, tout le compte se réactive sans re-login (la session est saine).

Cette solution respecte les règles des services (aucun appel refusé répété,
aucune promesse de lecture Spotify fausse) et le code existant (le plan,
l'état et les helpers sont déjà là ; il ne manque que l'assouplissement du
layout — ~10 lignes + tests — à valider par le propriétaire).

## 5. Tests et livraisons (étape 5)

- Cibles de la mission : `useSpotifyAuth` (kind `profile-forbidden`, échange
  non répété, `/me` appelé UNE fois par flux), `LoginScreen` (carte dédiée,
  jamais le générique, aucun champ credential), `searchCatalog` (403 →
  repli backend `degraded` ; 403 + backend en panne → Audius servi — preuve
  que l'échec Spotify ne casse pas la cascade). Les cas 401/403/429/non-JSON
  du client étaient déjà couverts (34 tests dédiés dans
  `apiClient.unit.test.ts`, vérifiés passés).
- Résultats RÉELS : Jest complet local **2146 passés / 14 ignorés / 0
  échoué** (158 suites ; +3 vs base V26.5) ; `tsc --noEmit` sans erreur ;
  `eslint` des 8 fichiers sans erreur ; `prettier --check` OK.
- Workflow Android complet (déclenché par le push, événement
  `pull_request` de la PR #8) : run `38072616374` sur head `114f879` —
  **completed / success** en 14 min 18 s (17:39:19Z → 17:53:37Z) ; étape 21
  « Installer et lancer réellement l'APK sur Android 14 » SUCCESS, étapes
  signature/diagnostic OAuth SUCCESS, **0 annotation `failure`** ; l'APK de
  test est produit et disponible en artefact :
  `Melodix-v4.5.0-test.30-114f879.apk` (47 051 434 octets, non expiré).
  Aucune Release publiée (`publish_test_apk` désactivé hors tag). Le run du
  présent commit documentaire est consigné en commentaire de la PR #8.
- Commits V27 : `3efb8b3` (correctif + tests, 8 fichiers) puis le commit
  documentaire portant le présent rapport. Branche :
  `arena/9dadfbee-melodix` (la session Arena est fixée à cette branche ;
  elle sert de branche de mission dédiée). PR : **#8** mise à jour (base =
  branche de travail `arena/fcdae8c6-melodix`, JAMAIS `main`) ; **aucune PR
  fusionnée** ; PR #6 laissée ouverte.

## 6. À vérifier manuellement (Dashboard Spotify)

Nous n'avons PAS accès au Developer Dashboard ; personne d'autre ne doit
partager de token ni de secret pour ce diagnostic. Contrôle requis, dans
developer.spotify.com → Dashboard → application Melodix (Client ID public
`7c5af4cd…` inliné dans le build de test 45030) :

1. **Abonnement du compte PROPRIÉTAIRE** : Premium actif (règle en vigueur
   depuis le ~9 mars 2026 ; sans lui, l'app en mode développement est
   coupée des API — exactement le symptôme).
2. **« Users and Access »** : ajouter le compte Spotify utilisé sur le
   téléphone à l'allowlist (max 5 utilisateurs en dev-mode). Un login
   réussi SANS être dans cette liste produit précisément un 403 sur
   `/v1/me`.
3. **Redirect URIs** : `melodix://callback` déclaré à l'identique.
4. Après correction : sur le téléphone, « Réessayer » (écran de connexion ou
   écran « Compte Spotify indisponible ») — aucune réinstallation requise,
   la session stockée est saine.

## 7. Limites restantes

- Un run CI et des tests unitaires ne valident PAS une connexion Spotify
  réelle sur téléphone : la cause racine §2 reste à confirmer au dashboard
  (point 6) ; aucun test ne peut forcer l'allowlist/Premium à la place du
  propriétaire.
- Le 403 « persistant » est établi par la borne de retries du client
  (`attempts=3`) ; la nature exacte de la réponse edge (CDN vs API) n'est
  visible que via les en-têtes du rapport de diagnostic de l'app, non
  depuis ce bac à sable.
- La portente « connexion obligatoire » demeure inchangée : tant que le
  `/me` échoue, l'app reste bloquée à l'écran d'identité (comportement
  voulu jusqu'à décision produit sur le plan V28 du §4).
- Téléphone physique toujours non testé par la CI (émulateur ≠ API 36
  réel) ; « Status: ok » d'un deep link en warm = `onNewIntent`, sans
  valeur de preuve produit.

### Références

[1] TechCrunch 06/02/2026 — https://techcrunch.com/2026-02-06/spotify-changes-developer-mode-api-to-require-premium-accounts-limits-test-users/
[2] iTechGuides 18/08/2026 — https://www.itechguides.com/spotify-changes-developer-mode-api-to-require-premium-accounts-and-limit-test-users/
[3] Vorplabs 20/07/2026 — https://vorplabs.com/agent-tools/spotify-cli
[4] Endpoint51 18/06/2026 — https://www.endpoint51.com/blog/spotify-api-2026-changes/
