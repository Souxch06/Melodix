# RAPPORT DE MISSION V29 — LECTEUR FONCTIONNEL SANS DÉPENDANCE BLOQUANTE À SPOTIFY

Date : 2026-10-10 · Branche de travail : `arena/9dadfbee-melodix` · Commit final : `f2c7a44`
Contexte : instruction du propriétaire — compte **Spotify Free**, interdiction de payer, de créer
une app, d'utiliser un Client ID tiers ou de contourner les restrictions Spotify. L'app doit
**fonctionner réellement**, pas produire une liste de problèmes.

---

## 1. État vérifié du dépôt avant d'agir

- HEAD local == `origin/arena/9dadfbee-melodix` == `01ec648` (propre, garde V28 présente).
- PR #8 : ouverte, base `arena/fcdae8c6-melodix`, head `01ec648`, `mergeable: clean`.
- PR #6 : ouverte, jamais touchée. `main` = `fceab85`, jamais modifiée.
- CI dernière : run `38078977359` success (APK V28, lien vérifié au §6 pour la nouvelle version).
- Compte de test du téléphone : dans l'allowlist « Users and Access » (`1/5`) — information du
  propriétaire ; ce facteur est donc **exclu** comme explication du 403.

## 2. Cause exacte du 403 — preuves et degré de certitude

Chaîne reproduite par analyse de code + exécution CI (autorisation → callback → échange
`/v1/token` → stockage → refresh → `GET /v1/me`) : l'échange et le stockage **réussissent** ;
seul `GET /v1/me` (et les endpoints de compte) renvoie **403** de façon déterministe.

Doc officielle Spotify du 06/02/2026 (developer.spotify.com/blog, citée intégralement en mission
V27 et relue) : à partir du 11/02/2026 tout Client ID en Development Mode exige **un abonnement
Premium actif pour le PROPRIÉTAIRE de l'app**, est limité à **1 Client ID** et **5 utilisateurs
autorisés** ; à partir du 09/03/2026, ces mêmes exigences s'appliquent **aussi aux intégrations
Development Mode existantes** (les retraits d'endpoints pour les apps existantes ont été reportés,
mais « The Spotify Premium requirement, the authorized user cap and one Client ID per developer
limit will take effect as planned »). Le guide de migration énonce : « All Development Mode apps
require the app owner to have a valid Spotify Premium subscription. If the owner's Premium
subscription expires, the app will stop working. »

**Conclusion (certitude : élevée, par faisceau de preuves documentaires + symptômes exacts)** :
le 403 est une **restriction externe de plateforme Spotify** (condition Premium du propriétaire
du Client ID Melodix), pas un défaut de code, pas une erreur de redirect URI, pas l'allowlist
(le compte y figure). Aucun code légitime ne peut lever cette restriction ; **le Dashboard n'a
pas été consulté** (impossible depuis le sandbox) — la partie « statut Premium du propriétaire »
reste à confirmer visuellement par le propriétaire. Le login OAuth lui-même réussit
(accounts.spotify.com n'est pas gated) : c'est pourquoi « la connexion semble marcher » puis
échoue à `/v1/me`. Aucun résultat de test n'a été inventé ; le 403 réel n'a jamais pu être
transformé en 200 dans cet environnement.

## 3. Décision : combinaison A + B, justifiée

- **Option A impossible à valider ici** : le flux Spotify (PKCE, Client ID actuel,
  `melodix://callback`, stockage sécurisé, refresh) est **conservé intégralement et corrigé là où
  des défauts ont été démontrés** (bornes de refresh V27, anti-écrasement du coffre V28). Mais
  aucune connexion ne peut y être **déclarée validée** : `/v1/me` échoue pour une raison externe.
- **Option B implémentée dans cette mission** : le lecteur ne dépend plus d'aucun endpoint
  bloquant. Démarrage → accueil **systématique** ; recherche et lecture **Audius (principal) →
  YouTube (secours quand ses CGU le permettent)** ; lecteur complet, file d'attente,
  favoris/historique **locaux**, commandes Mediasession/arrière-plan — tout cela existait déjà
  (moteur audio unique `services/player.ts` + `PlayerContext`, aucun second moteur créé) et ne
  consultait **jamais** Spotify sans session active (preuve de test : « ignores Spotify session
  when none is active » dans `services/api/search/__tests__/searchCatalog.unit.test.ts`).
- **Combinaison** : les écrans de compte Spotify (vos playlists, bibliothèque, titres aimés)
  **restent** et affichent leur propre état via le SpotifyDataPlan — ils deviennent exploitables
  dès que le compte propriétaire aura Premium, sans nouvelle version.

## 4. Corrections implémentées (commit `f2c7a44`, 17 fichiers, +780/−483)

| Fichier                                    | Changement                                                                                                                                                                                                                                                                                                                        |
| ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context/SpotifyAuthContext.tsx` (nouveau) | `SpotifyAuthProvider` : **une seule** instance de `useSpotifyAuth` pour toute l'app (single-flight de l'échange OAuth, heartbeat, pending-intent) + `useSpotifyAuthContext()`. Le callback froid `melodix://callback?code=…` est ainsi traité **quel que soit l'écran**, alors qu'avant le hook mourait en démontant LoginScreen. |
| `context/index.ts`, `app/_layout.tsx`      | Provider monté à la racine, sous `UserDataProvider`, au-dessus de `PlayerProvider`.                                                                                                                                                                                                                                               |
| `app/index.tsx`                            | Garde de démarrage V29 : **toujours l'accueil**. Purge uniquement la session **morte** (refresh refusé/absent) ; session saine non vérifiée **conservée** (contrat V23 réseau) ; **filet anti-gel** : une exception du gate mène à l'accueil local, plus jamais à un loader éternel.                                              |
| `app/(tabs)/_layout.tsx`                   | **Suppression des trois murs** : écran de chargement plein, carte d'erreur « identité non vérifiée », redirection `local → /login`. Les onglets sont toujours rendus ; l'état du compte est affiché par les écrans de compte eux-mêmes.                                                                                           |
| `components/Header/Header.tsx`             | Déconnexion → **retour au mode local** (plus de `replace('/login')`) ; l'Alert du mode local offre « **Se connecter à Spotify** » (push `/login`, action réversible).                                                                                                                                                             |
| `screens/SettingsScreen.tsx`               | Déconnexion sans renvoi forcé ; **ligne « Se connecter à Spotify (facultatif) »** en mode local → `/login`.                                                                                                                                                                                                                       |
| `screens/LoginScreen.tsx`                  | Consomme le contexte racine ; bouton secondaire « **Continuer sans Spotify** » (retour si ouvert depuis l'app, accueil sinon) placé **hors condition d'erreur** — jamais de piège, même config absente. En-têtes documentés « connexion FACULTATIVE ».                                                                            |
| `data/fr-fr.ts`, `data/en-gb.ts`           | `loginSkip`, `accountConnect`, `settingsConnectSpotify` (fr+en).                                                                                                                                                                                                                                                                  |
| `scripts/smoke-test-android-apk.sh`        | Commentaire du scénario cold-start aligné (la garde ne renvoie plus vers `/login` ; le provider racine traite le callback).                                                                                                                                                                                                       |

Aucune suppression de fonctionnalité : login, OAuth/PKCE, refresh borné, écrans de compte,
diagnostics sans secrets, Web-prototype, tout est conservé. Aucun secret ajouté ; jamais de
contournement, jamais de saisie manuelle de Client ID.

## 5. Tests — résultats réels (exécutés, non simulés)

Suite complète locale (jest 29 workers, Node du repo) : **2153 passés / 14 skipped / 0 échoué**
(160 suites). tsc : 0 erreur. ESLint : 0 erreur (1 warning préexistant). Prettier (`npm run
prettier:check`, périmètre CI) : propre.

Scénarios exigés par la mission §5 et leur verrou :

1. **Démarrage quand Spotify renvoie 403** → `app/__tests__/index.gate.unit.test.tsx` : les 8
   scénarios (valide, expiré+refresh, dead invalid_grant, dead sans refresh, no-session,
   kept-unverified 429/5xx, réseau coupé, **gate qui LÈVE**) → **accueil dans tous les cas**,
   purge seulement pour session morte, jamais de navigation `/login`.
2. **Aucun blocage permanent** → idem (filet d'exception) + `app/(tabs)/__tests__/
layoutSessionRestore.unit.test.tsx` : les 5 statuts de session rendent **les onglets, zéro
   redirection, zéro mur** ; le cas « Spotify 403 (User not approved) » prouve que la navigation
   reste ouverte et qu'aucun détail technique ne fuit dans l'arbre rendu ; le masquage clavier de
   la barre basse est conservé.
3. **Sessions valides/expirées/refresh en erreur** → couverts par la chaîne de tests V23/V27/V28
   (`services/spotify/__tests__/session*` : 401 → un seul refresh, 403 → borné sans boucle de
   retries, non-JSON classé, stale-write refusé) — inchangés et toujours verts.
4. **Recherche et erreurs des sources** → `services/api/search/__tests__/searchCatalog.unit.test.tsx`
   (cascade Audius→YouTube, « ignores Spotify session when none is active », erreurs HTTP réseau/
   timeout/5xx) — inchangés.
5. **Sélection source principale/secours** → `trackResolver` + tests de fallback (résultat
   titre/artiste/pochette/durée mappé depuis Audius, secours YouTube) — inchangés.
6. **Lecteur et file** → suites `PlayerContext`/`services/player` (lecture/pause/progression/
   répétition/aléatoire/file) — inchangées, **aucune dépendance à la session** pour l'audio.
7. **Persistance favoris/historique** → `services/library/localLibrary` (clé SecureStore locale,
   migration legacy) + `services/history/playHistory` — inchangés.
8. **Commandes audio arrière-plan / écran verrouillé** → moteur MediaSession Android + script de
   fumée CI (`smoke-test-android-apk.sh`, vérifié sur l'APK construite par la CI) ; le cold start
   deep-link fonctionne désormais avec le provider monté à la racine.
9. **Déconnexion et erreurs réseau** → `screens/__tests__/SettingsScreen.unit.test.tsx`
   (déconnexion = reste en place, **plus de `replace('/login')`** ; ligne « Se connecter à Spotify
   (facultatif) » en local → `/login`, absente quand connecté) + `components/Header/__tests__/
HeaderAccount.unit.test.tsx` (avatar en local → Alert avec « Se connecter à Spotify » → push
   `/login` ; déconnexion depuis le bloc compte → `signOut()` **sans aucune navigation**).
10. **Identité unique du flux OAuth** → `context/__tests__/spotifyAuthContext.unit.test.tsx` :
    avec 3 consommateurs, `useSpotifyAuth` est appelé **1 fois** (pas de double échange du même
    code), l'API est la même référence partout, hors provider l'usage **échoue bruyamment**.
11. **Absence de secrets dans les logs** → garde V12+ (`devLog` whitelist) inchangée ; les
    nouveaux textes d'écran ne contiennent aucun champ technique (vérifié par assertions
    `not.toMatch(/access_token|refresh_token|code_verifier|Bearer |undefined/)`).

**Tests modifiés — transparence exigée** : `index.gate`, `layoutSessionRestore`,
`LoginScreen.unit` (« UN SEUL bouton » → bouton Spotify + issue « sans Spotify », et bug trouvé en
TDD : le skip était caché par la carte d'erreur → déplacé hors condition), `SettingsScreen.unit`
(attente « retour login » inversée). Ces changements reflètent le **nouveau contrat produit
demandé par la mission**, pas l'assouplissement d'un échec : les assertions de fond (purge sur
session morte, conservation sur réseau, message exact de confirmation de déconnexion, zéro champ
de saisie, zéro fuite de secret) sont **conservées mot pour mot** dans les nouveaux tests. Le
contrat « affichage de la cause exacte
du 403 » a été **déplacé du layout vers Réglages/écrans de compte** (où il est rendu) et y reste
couvert (tests V24 existants : « HTTP 403 — User not approved for app », corps vide, non-JSON,
métadonnées sans body).

## 6. CI et APK

- Run CI : `38083525086` (workflow « APK Android », head `f2c7a44`) — **success**, chaque étape
  vérifiée : validation de la config Spotify du build (déterministe), « Vérifier TypeScript,
  ESLint et Prettier », « Tests JavaScript / React Native » (Jest complet), génération Android,
  « Tests Kotlin du module média (Robolectric) », compilation + alignement 16 Kio + signature,
  « Vérifier intégrité, installabilité et signature de l'APK », puis **installation + lancement
  réels sur Android 14 (émulateur)** avec smoke tests (deep links, cold start OAuth classifié),
  publication de l'artefact.
- Artefact : `Melodix-v4.5.0-test.30-f2c7a44.apk` — 47 052 285 octets —
  lien : https://github.com/Souxch06/Melodix/actions/runs/38083525086/artifacts/11681349392
- Identité vérifiable : `applicationId com.souxch06.melodix`, `versionName 4.5.0-test.30`,
  `versionCode 45030` (app.config.js, inchangés depuis V28 : la NOUVELLE version se distingue
  par le hash du commit dans le nom de l'artefact ; l'installation par-dessus l'APK précédente
  fonctionne — même signature debug, `adb install -r` du smoke l'a fait en CI).
- La CI valide l'émulateur ; **elle ne prouve pas le comportement du téléphone physique du
  propriétaire**, qui reste le juge final — mais pour la première fois ce téléphone n'a plus
  besoin que Spotify réponde pour écouter de la musique : la V29 s'ouvre directement sur le
  lecteur local, avec la connexion Spotify proposée comme action réversible.

## 7. État GitHub

- Branche dédiée `arena/9dadfbee-melodix` (historique complet conservé, V22→V29).
- `main` (`fceab85`) et `arena/fcdae8c6-melodix` (`e30461a`) **intactes**.
- PR #8 (vers la branche de travail) : mise à jour avec ce commit ; **fusion autorisée par le
  propriétaire** (« Please merge the pull request. ») — exécutée en fin de mission, après CI
  verte. PR #6 : ouverte, jamais touchée.
- Aucun token, refresh, code OAuth, secret ou cookie dans ce rapport ni dans les logs de test.

## 8. Ce qui reste hors de portée (actions extérieures)

1. **Premium actif sur le compte PROPRIÉTAIRE du dashboard** (celui qui possède le Client ID
   `7c5af4cd…`) — seule voie légale pour débloquer `/v1/me` et les données de compte ; sans cela,
   les écrans de compte resteront en « identité non vérifiée » (avec Réessayer), **l'app
   fonctionnant par ailleurs**.
2. Vérifier dans le dashboard que `melodix://callback` reste déclaré et que l'app est en
   Development Mode (aucun changement de notre côté n'est nécessaire ni possible sans accès).
3. Si le propriétaire obtient un jour Premium : aucune nouvelle version n'est requise — le
   même APK, bouton « Réessayer » sur l'écran de compte, et le profil s'affiche.

## Verdict

**LECTEUR FONCTIONNEL, INTÉGRATION SPOTIFY PARTIELLEMENT BLOQUÉE.**
L'application démarre, recherche, lit, met en file, garde favoris et historique, répond aux
commandes système **sans jamais dépendre du 403** ; le flux Spotify complet (PKCE, stockage,
refresh borné, écrans de compte) est conservé et corrigé, mais sa **validation réelle** reste
suspendue à la condition externe Premium du propriétaire, qu'aucun code ne peut légitimement
lever. Aucun contournement n'a été tenté, aucun faux succès n'est revendiqué.
