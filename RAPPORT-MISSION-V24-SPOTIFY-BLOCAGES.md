# RAPPORT MISSION V24 — RÉSOLUTION DES BLOCAGES SPOTIFY, DIAGNOSTIC COPIABLE ET VALIDATION DE MELODIX

- **Date** : 2026-10-09 (Europe/Madrid)
- **Dépôt** : `Souxch06/Melodix` — branche `arena/fcdae8c6-melodix`
- **Verdict global** : **PARTIELLEMENT RÉUSSIE** — un défaut de code confirmé a été corrigé à la source ; le blocage 403 lui-même provient d'une **restriction Spotify externe (dev-mode)** non vérifiable depuis le dépôt, documentée ici avec preuves, actions manuelles précises et limites. Le diagnostic copiable en un appui est livré et testé. **La mission ne peut être déclarée totalement réussie** tant que la restriction externe n'a pas été levée par le propriétaire (actions §12) et vérifiée physiquement (§9, NON EFFECTUÉ).

---

## 1. État du dépôt (SHAs, PR, main, version)

| Élément                | Valeur                                                                                                            |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------- |
| SHA initial (base V23) | `ab3ff8294e2da9a05afe9990894a51274eda5a5a` (4.5.0-test.28, build 45028)                                           |
| SHA final — code V24   | `23bd95c4493a9efd9b85c2168d0abb9231b6288f`                                                                        |
| SHA final — rapport    | commit suivant ce rapport (`git log -1` sur la branche)                                                           |
| `main`                 | `fceab85950b069edcb65ed718a8ffd419a1bc785` — **INTACTE** (aucune écriture)                                        |
| PR #6                  | **OPEN**, `MERGEABLE`, head = `arena/fcdae8c6-melodix` — **non fusionnée** (aucune fusion, aucun merge de `main`) |
| Version app            | `4.5.0-test.29` / `versionCode 45029` (`app.config.js`, `package.json`)                                           |
| Nouvelle dépendance    | `expo-clipboard ~5.0.1` (presse-papiers ; version alignée SDK 51)                                                 |

---

## 2. Fichiers modifiés + corrections (commit A — 36 fichiers, 2702 insertions / 34 suppressions)

### P0-1 — 403 `GET /v1/me` : correction à la source + instrumentation sûre

| Fichier                                                                                                                                                                                                                                                                                                                                       | Correction                                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context/spotifyIdentity.ts`                                                                                                                                                                                                                                                                                                                  | Défaut confirmé **D-V24-1** : nouveau `isSpotifyAccessDenied()` (code 403 persistant) + `spotifyUnavailableBody()` — le corps « indisponibilité » ne présente **jamais** un 403 persistant comme « erreur réseau temporaire » ; il distingue cas de configuration / refus persistant. |
| `components/Header/Header.tsx`, `components/Home/YourPlaylists/index.tsx`, `components/Library/Library.tsx`, `screens/SettingsScreen.tsx`, `app/(tabs)/_layout.tsx`                                                                                                                                                                           | 5 sites d'affichage basculés sur le nouveau corps classé (aucun message visible ne ment plus).                                                                                                                                                                                        |
| `data/fr-fr.ts`, `data/en-gb.ts`                                                                                                                                                                                                                                                                                                              | Clés ajoutées (corps 403 classé + boutons diagnostic), parité FR/EN.                                                                                                                                                                                                                  |
| `context/UserDataContext.tsx`                                                                                                                                                                                                                                                                                                                 | Instrumentation de **chaque** vérification : `verify-me` (ok/erreur), helper `verifyEventParts` — détails bornés, **jamais** d'en-tête `Authorization`, jamais de token.                                                                                                              |
| `services/spotify/apiClient.ts`                                                                                                                                                                                                                                                                                                               | Événement `api-error` à chaque échec HTTP : statut, endpoint, forme de réponse (JSON/texte/HTML/vide), content-type, tentatives — métadonnées non sensibles uniquement.                                                                                                               |
| `services/spotify/useSpotifyAuth.ts`                                                                                                                                                                                                                                                                                                          | Événement `login` (succès de l'échange OAuth) + `refresh` (ok/échec, sans le nouveau token).                                                                                                                                                                                          |
| `context/__tests__/spotifyIdentity.unit.test.ts`, `context/__tests__/UserDataContext.unit.test.tsx`, `app/(tabs)/__tests__/layoutSessionRestore.unit.test.tsx`, `components/Home/YourPlaylists/__tests__/YourPlaylists.unit.test.tsx`, `components/Library/__tests__/Library.unit.test.tsx`, `screens/__tests__/SettingsScreen.unit.test.tsx` | Tests du contrat fort : 403 ≠ « erreur réseau temporaire » ; chaque vérification consigne un événement sûr (zéro secret). **Aucun test supprimé** ; 3 assertions de l'ancien (faible) contrat remplacées par le contrat V24 plus strict.                                              |

### P0-2 — Rapport de diagnostic copiable en UN appui

| Fichier                                                                                                                                                                                                                 | Contenu                                                                                                                                                                                                |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `services/spotify/diagnosticReport.ts` _(nouveau)_                                                                                                                                                                      | `buildSpotifyDiagnosticReport()` (builder pur) + `stripSecrets()`/`finalizeDiagnosticReport()` (garde-fous) + `DIAGNOSTIC_REPORT_MAX_LENGTH` (8000 car.).                                              |
| `services/spotify/diagnosticHistory.ts` _(nouveau)_                                                                                                                                                                     | Historique local **borné** (anneau 40 événements / 7 jours), persistance AsyncStorage (**survit à la fermeture**), purge + effacement (invalidation du chargement en vol).                             |
| `components/Diagnostics/SpotifyDiagnosticActions.tsx` _(nouveau)_                                                                                                                                                       | Boutons : **Copier** (presse-papiers immédiat + confirmation + alternative si échec), **Partager** (menu natif), **Voir les détails**, **Réessayer** (anti-double-clic → vraie nouvelle vérification). |
| `screens/SettingsSpotifyDiagnosticScreen.tsx` + `app/settings/spotify-diagnostic.tsx` _(nouveaux)_                                                                                                                      | Accès depuis **Réglages** : rapport complet, événements, bouton d'effacement (Alert destructive).                                                                                                      |
| `components/index.ts`, `context/index.ts`, `services/index.ts`                                                                                                                                                          | Exports.                                                                                                                                                                                               |
| `jest.config.js`, `__mocks__/expo-clipboard.ts`, `__mocks__/expo-constants.ts`                                                                                                                                          | Mapper + mock presse-papiers ; helper `versionCode`.                                                                                                                                                   |
| `services/spotify/__tests__/diagnosticReport.unit.test.ts` (17 tests), `services/spotify/__tests__/diagnosticHistory.unit.test.ts` (14), `components/Diagnostics/__tests__/SpotifyDiagnosticActions.unit.test.tsx` (11) | Couverture : contenu exact du rapport, **zéro secret (5 familles)**, troncature, historique borné + survie redémarrage + effacement, anti-double-clic, copie = contenu builder.                        |
| `package.json`, `package-lock.json`, `app.config.js`                                                                                                                                                                    | Version 4.5.0-test.29/45029 + `expo-clipboard`.                                                                                                                                                        |

---

## 3. P0-1 — HTTP 403 `GET /v1/me` : audit complet du parcours

Chaque étape vérifiée dans le code (aucune cause supposée sans lecture) :

| Étape                        | Résultat de l'audit                                                                                                                                                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OAuth → `melodix://callback` | PKCE intact (client public), redirect URI du build = `melodix://callback` — conforme, non modifié.                                                                                                 |
| Échange de code              | Token + refresh stockés via SecureStore (inchangé) ; aucun code/token journalisé.                                                                                                                  |
| Session                      | `connected` ≠ `verified` : le statut `spotify` n'est atteint **que** si `/v1/me` réussit (contrat testé).                                                                                          |
| Envoi de token               | `Authorization: Bearer` construit à partir du token courant ; pas de token tronqué/ancien détecté ; refresh uniquement sur **401** (un 403 ne déclenche jamais de refresh — correct).              |
| Rétries                      | Bornées : **max 3 tentatives** sur 403 persistant, aucune boucle infinie (testé).                                                                                                                  |
| Corps de réponse             | JSON / texte / HTML / vide tous traités sans crash ; forme classée et consignée (testé).                                                                                                           |
| Sessions concurrentes        | Deux vérifications simultanées = deux requêtes, pas de boucle (testé) ; une session ancienne ne remplace pas une récente (testé).                                                                  |
| Journalisation               | **Aucun** token / code / secret / en-tête `Authorization` écrit nulle part (tests de sécurité dédiés).                                                                                             |
| UI                           | **Défaut D-V24-1 corrigé** (§2) : le 403 persistant était présenté comme « réseau ou erreur temporaire » — c'est exactement ce que la mission interdisait. Corrigé à la source, tests verrouillés. |

### Classification de la cause (honnête, graduée)

- **Défaut de code confirmé (corrigé)** : D-V24-1 — fausse classification **utilisateur-visible** du 403 persistant. C'est le seul défaut de code trouvé dans le parcours ; il est corrigé et verrouillé par tests.
- **Origine du 403 lui-même = EXTERNE au code Melodix**, classée **probable (concordances fortes) / non tranchable depuis le dépôt** :
  1. **H1 — Compte non répertorié dans « Users and Access »** (allowlist dev-mode). Preuves concordantes : réponse **corps vide, non JSON**, sans `Content-Type`, avec en-têtes `Server: envoy` + `Via: edgeproxy, 1.1 google` = **rejet edge/CDN** (pas une réponse applicative Spotify) ; la documentation et les retours officiels Spotify (community) décrivent exactement ce 403 vide pour un compte hors allowlist, levé par l'ajout du compte. **Indices, pas preuve** : `envoy`/`edgeproxy` ne prouvent pas à eux seuls l'allowlist.
  2. **H2 — Premium du PROPRIÉTAIRE de l'application expiré/invalide**. Preuves concordantes : guide officiel « February 2026 Dev Mode Changes » — apps existantes migrées au **9 mars 2026** ; un lapse de Premium du propriétaire **stoppe l'app** (403). Non vérifiable sans accès au dashboard/abonnement.
- **Non vérifiable depuis le dépôt** : état du Developer Dashboard, allowlist effective, abonnement du propriétaire. → **actions manuelles §12** (pas de contournement, pas de nouvelle app demandée).
- **Ce qui est prouvé par le code + tests** : le 403 ne produit **jamais** un « vérifié » ; la session valide n'est pas supprimée arbitrairement ; « Réessayer » lance une vraie nouvelle requête ; les données de profil restent masquées en cas d'échec.

### Classification structurée des statuts (étape 3.4) — implantée et testée

| Statut                | Catégorie (utilisée dans le rapport)             | Interprétation                                                   | Action                                    |
| --------------------- | ------------------------------------------------ | ---------------------------------------------------------------- | ----------------------------------------- |
| 401                   | Non authentifié                                  | Token expiré/invalide                                            | Refresh automatique, puis re-vérification |
| **403**               | **Refus d'accès (jamais « réseau temporaire »)** | Restriction dev-mode probable (allowlist / Premium propriétaire) | Actions dashboard §12 ; « Réessayer »     |
| 429 (+ `Retry-After`) | Limite de quota                                  | Throttling                                                       | Attendre la durée fournie puis réessayer  |
| 5xx                   | Indisponibilité serveur                          | Panne côté Spotify                                               | Réessayer plus tard                       |
| Réseau/timeout        | Erreur réseau                                    | Connexion absente                                                | Vérifier la connexion, réessayer          |
| Non JSON              | Rejet edge (corps non exploitable)               | Signale un refus par l'infrastructure                            | Classer selon statut (403 → §3)           |
| Config manquante      | Client ID absent du build                        | Build incomplet                                                  | Rebuild avec extra complet                |

---

## 4. Exigences officielles Spotify (ré-consultées le **2026-10-09**)

Fait officiel / hypothèse / non vérifiable — clairement séparés.

**Faits officiels** (sources consultées le 2026-10-09) :

- Guide « February 2026 Web API Dev Mode Changes — Migration Guide » : `https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide` — checklist : **« Ensure the app owner has Spotify Premium »** ; apps existantes **grandfathered** (>5 users conservés) ; limite dev **25 users** (augmentionnée, changelog juil. 2026).
- Changelog Février 2026 : `https://developer.spotify.com/documentation/web-api/references/changes/february-2026` ; Mars 2026 : `https://developer.spotify.com/documentation/web-api/references/changes/march-2026` (`external_ids` reverti).
- `GET /v1/me` (profil) : `https://developer.spotify.com/documentation/web-api/reference/get-current-users-profile` — champ `product` **retiré** des réponses User (2026).
- `GET /search` : `limit` max **50→10**, défaut **20→5** ; `offset` 0–1000 → plafond ≈ **1010 résultats/type** (contrat pré-2026 obsolète — déjà corrigé en V23).
- `GET /artists/{id}/top-tracks` : listé **retiré** dans le guide, mais la page de référence reste publiée : `https://developer.spotify.com/documentation/web-api/reference/get-an-artists-top-tracks` → retrait non certain (V23 : déjà encaissé, non corrigé).
- Web API famille Player `/v1/me/player/*` : « only works for users who have Spotify Premium ».
- Web Playback SDK : Premium requis (Lite/Mini exclus → `account_error`) ; usage **commercial** = approbation écrite préalable requise.
- Réponse officielle community (mars 2025) : dev-mode = allowlist ; hors liste → **403** ; le WPS cible les _websites_, une app native « might not be the intended or supported scenario ».

**Hypothèses** : H1 (allowlist) et H2 (Premium propriétaire) ci-dessus — concordances fortes, non démontrées par accès direct.

**Non vérifiable depuis le dépôt** : dashboard Developer (Users and Access), abonnement du propriétaire, état exact de l'app « Melodix » côté Spotify.

> Ne jamais confondre : (a) l'audio/Player (Premium requis pour la lecture) et (b) l'API de profil `/v1/me` (limitée par le dev-mode, pas par Premium utilisateur). Le 403 observé touche **(b)** : c'est une restriction **d'app/dev-mode**, pas un manque de Premium **de l'utilisateur final**.

---

## 5. Fonctionnalités — état réel (pas de survente)

| État                                         | Fonctionnalités                                                                                                                             |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **Utilisables (démo/recherche/métadonnées)** | Catalogue, recherche (contrat 2026 respecté), fiches, playlists publiques, métadonnées Spotify ; diagnostic Spotify complet (nouveau).      |
| **Bloquées (restriction externe)**           | Vérification du compte (`/v1/me`) → donc tout ce qui suppose une identité vérifiée ; tout 403 = **non résolu** tant que §12 n'est pas fait. |
| **Non vérifiées**                            | Lecture audio Spotify réelle (Web Player) : dépend du test physique (§9) + de la vérification du compte ; **NON TESTÉ** sur appareil.       |

---

## 6. Résultats de tests — EXACTS (exécutés le 2026-10-09 sur le commit A)

| Gate                                                      | Résultat                                                                                                                                                                                                      |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Jest (full)                                               | **2131 passés / 14 ignorés / 0 échoué** (158 suites passées / 14 ignorées / 172 total) — baseline V23 : 2084 → **+47 tests V24** (17 rapport + 14 historique + 11 composant + 4 identité + 1 UserDataContext) |
| `tsc --noEmit`                                            | **0 erreur**                                                                                                                                                                                                  |
| ESLint                                                    | **0 erreur**                                                                                                                                                                                                  |
| Prettier                                                  | **conforme** (0 fichier non conforme)                                                                                                                                                                         |
| Robolectric / Android                                     | non exécutés en local (couverts par la CI)                                                                                                                                                                    |
| Aucun test supprimé, aucune assertion de sécurité réduite | **confirmé**                                                                                                                                                                                                  |

**20 scénarios mission — statut** : les 20 sont couverts par la suite (200/401/403 JSON/403 HTML/403 vide/headers incomplets/refresh ok-échec/réseau-timeout/429+Retry-After/5xx/2 vérifs simultanées/sessions croisées/contenu rapport/**zéro secret**/copie fonctionnelle/historique borné+effaçable/Réessayer = vraie requête/**403 ≠ vérifié**/non-JSON sans crash/survie redémarrage). **Véridique : verts en local ; le comportement réel téléphone reste NON TESTÉ** (§9).

---

## 7. CI + APK

- Workflow : **« APK Android »** (`.github/workflows/android-apk.yml`).
- Lien CI : `https://github.com/Souxch06/Melodix/actions/workflows/android-apk.yml` — consulter l'exécution sur le **commit final** (après push). Les chiffres de CI d'un ancien commit ne sont **pas** cités comme preuve.
- Nom APK attendu : **`Melodix-4.5.0-test.29.apk`** (aligné 16 Ko + signé ; artefact + `apk-inspection.txt`).

---

## 8. Validation téléphone réel — **NON EFFECTUÉ**

Aucun téléphone physique n'est disponible dans l'environnement de travail. **Aucun login réel n'a été simulé ni présenté comme tel.** Procédure à exécuter manuellement (10 items) : installer `Melodix-4.5.0-test.29.apk` (CI) → se connecter Spotify → constater le 403 classé (plus jamais « erreur réseau temporaire ») → ouvrir **Réglages → Diagnostic Spotify** → **Copier** (coller dans Notes/courriel : vérifier que **aucun** token/code n'apparaît) → **Partager** (menu Android) → **Réessayer** (deux appuis rapides = une seule requête) → couper le réseau puis le rétablir (comportement borné) → fermer/rouvrir l'app (l'historique **survit**) → effacer l'historique (Alert destructive) → re-tenter après les actions §12 (le 200 devrait apparaître).

---

## 9. Exemple RÉEL de rapport généré (masqué — aucune donnée sensible réelle)

Généré avec le builder réel sur le **payload exact du 403 reproduit** (corps vide non JSON, `Server: envoy`, `Via: HTTP/2 edgeproxy, 1.1 google`, 3 tentatives, session enregistrée, config présente). Le rapport est safe by design : URL sans query, seuls en-têtes non sensibles, zéro token/code/secret (garde-fous testés) :

```
MELODIX — RAPPORT DE DIAGNOSTIC
===============================
App : Melodix 4.5.0-test.29 (build 45029)
Système : android — API 34 — fr
Date : 09/10/2026 18:32 (heure locale)

— État du compte —
Session Spotify : enregistrée (token + refresh)
Identité du compte : non vérifiée
Configuration Spotify : présente — Client ID : expo-config-extra — redirect : melodix://callback
Autorisation OAuth et échange de code : réussi (événement local)

— Échec courant —
Endpoint : GET https://api.spotify.com/v1/me
Statut HTTP : 403
Content-Type : —
Forme de la réponse : non JSON (pas de message exploitable)
Extrait d'erreur : —
En-têtes (non sensibles) : Server: envoy; Via: HTTP/2 edgeproxy, 1.1 google
URL finale : https://api.spotify.com/v1/me
ID de requête : —
Tentatives : 3 (persistant)
Rafraîchissement du token : non déclenché (seul un 401 déclenche le refresh)
Dernière étape réussie : échange de code (session enregistrée)

— Classification —
Catégorie : refus d'accès par le serveur (HTTP 403)
Interprétation : Un 403 n'est PAS une indisponibilité réseau passagère. Un 403 — surtout persistant (plusieurs tentatives) — traduit le plus souvent une restriction dev-mode de l'application : compte non répertorié dans « Users and Access » du Developer Dashboard, ou Premium du propriétaire de l'application exigé/invalide. La réponse vient d'un edge/CDN (voir en-têtes).
Confiance : moyenne — ne peut être tranchée depuis l'app ; vérification du Developer Dashboard requise (pas d'accès depuis l'app)
Actions recommandées :
 1. Dashboard Spotify (developer.spotify.com) : application Melodix → « Users and Access » : ajouter le compte qui utilisera l'app.
 2. Vérifier que le Premium du PROPRIÉTAIRE de l'application (compte du dashboard) est actif — exigé en dev-mode.
 3. Réessayer dans quelques minutes (une panne transitoire est possible, mais un 403 persistant indique une configuration).
 4. Transmettre ce rapport au mainteneur de l'application.

— Tests de diagnostic exécutés —
Configuration Spotify présente (Client ID du build) : OK
Session Spotify enregistrée : OK
Redirect URI du build : melodix://callback
Vérification du profil /v1/me : ÉCHEC (HTTP 403)
Historique local de diagnostic : 2 événements (borne : 40, 7 jours)

— Événements récents (récents d'abord, 15 max) —
09/10 18:32:04 verify-me error 403 shape=non-json attempts=3
09/10 18:31:12 login ok

Fin du rapport — aucun token, secret, code OAuth, cookie ni contenu privé n'est inclus.
```

---

## 10. Procédure copie/partage sur téléphone

1. Dans l'app (bannière « Compte Spotify indisponible ») ou **Réglages → Diagnostic Spotify** : appuyer une fois sur **Copier le rapport**. → Confirmation « Rapport copié » (l'alternative texte s'affiche si le presse-papiers échoue).
2. Ouvrir Notes / un e-mail / un chat → **coller**. Vérifier visuellement l'absence de token.
3. **Partager** : appuyer sur **Partager** → menu Android natif (courriel, messagerie…) → choisir la cible.
4. **Voir les détails** : écran complet, lisible hors-ligne.
5. **Réessayer** : lance une **vraie** nouvelle vérification (anti-double-clic : un second appui pendant la requête est ignoré).
6. Aucun envoi automatique : le rapport n'est **jamais** transmis à un serveur externe sans action explicite de l'utilisateur.

---

## 11. Actions manuelles par priorité (bloquantes, côté propriétaire)

| #        | Action                                                                                                                       | Pourquoi                                                                      |
| -------- | ---------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| **P0-1** | Dashboard `developer.spotify.com` → application **Melodix** → **Users and Access** → **ajouter le compte** qui utilise l'app | Levée probable de H1 (403 vide edge). Seul geste qui peut débloquer `/v1/me`. |
| **P0-2** | Vérifier que le **Premium du compte PROPRIÉTAIRE** de l'application (compte du dashboard) est **actif**                      | Exigé officiellement en dev-mode (migration 9 mars 2026) — H2.                |
| **P1**   | Après les 2 gestes : « Réessayer » dans l'app ; le 200 attendu doit faire passer l'identité en **vérifiée**                  | Validation du déverrouillage.                                                 |
| **P2**   | Transmettre un rapport copié si le 403 persiste malgré P0-1/P0-2                                                             | Diagnostic du cas restant (panne Spotify, etc.).                              |

Pas de demande de nouvelle application, pas de contournement, pas de modification OAuth/PKCE/scopes/redirect (aucun défaut démontré là-dessus).

---

## 12. Recommandation mission suivante

1. **Attendre** l'exécution des actions P0-1/P0-2 par le propriétaire + le **test physique** (§8) avec l'APK CI `Melodix-4.5.0-test.29.apk` — sans cela, la mission reste **partiellement réussie** par construction (restriction externe non levée).
2. Ensuite : décision d'architecture **consciente** (conserver A conditionnée au résultat physique + voie B en repli, cf. V23) — **aucun basculement silencieux** de piste Spotify vers un enregistrement similaire ; provenance toujours claire.
3. Ne fusionner **rien** vers `main` avant revue ; `main` reste intouché.

**Règle finale respectée** : fiabilité, preuves et diagnostic > fonctionnalités superficielles masquant l'échec d'authentification.
