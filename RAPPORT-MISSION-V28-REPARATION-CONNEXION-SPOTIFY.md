# RAPPORT MISSION V28 — Réparation définitive de la connexion Spotify

Dépôt `Souxch06/Melodix`, 10/10/2026. Branche de mission :
`arena/9dadfbee-melodix` (la session Arena est fixée à cette branche ; elle
part de `7b3fd9d`, HEAD vérifié de la mission V27, et préserve tous les
commits antérieurs). PR de référence : **#8** (base = branche de travail
`arena/fcdae8c6-melodix`, JAMAIS `main`, **non fusionnée**).

## 0. État réel du dépôt vérifié AVANT toute modification

- Local == remote : `arena/9dadfbee-melodix` = `7b3fd9d` (worktree propre) ;
  dernier commit fiable du diagnostic V27 : `3efb8b3` (code) + `7b3fd9d`
  (rapport final V27) — le rapport V27 décrit bien le HEAD réellement audité.
- `arena/fcdae8c6-melodix` = `e30461a` ; `main` =
  `fceab85950b069edcb65ed718a8ffd419a1bc785` (intactes, vérifiées par
  `git ls-remote`).
- PRs : #8 ouverte (open/merged=false, mergeable clean) ; #6 ouverte
  (jamais fusionnée) ; #7 fusionnée le 10/10 14:27Z ; #1–#5 fermées/sans
  effet. CI sur `7b3fd9d` : run `38073742790` **success** (seul run du head
  courant ; `54102a6` a été remplacé par GitHub avant la fin — comportement
  de concurrence normal, pas un échec).
- Aucune modification plus récente que le rapport V27 n'existait.

## 1. Cause racine — démontrée / probable / inconnue

**Démontré par le code et les symptômes :**

1. Le flux OAuth lui-même fonctionne : autorisation, `state`, PKCE S256,
   callback chaud ET froid (transaction persistée mono-utilisation), échange
   du code (200 + tokens), stockage SecureStore, et le 403 ne déclenche ni
   refresh ni reconnexion forcée (comportement correct). Un 403 sur
   `/v1/me` intervient APRÈS un échange réussi : la porte d'authentification
   a laissé passer, c'est l'**autorisation d'appeler la Web API** qui est
   refusée.
2. Les « trois 403 » sont le comportement anti-flake voulu du client
   (1 appel + 2 retentatives bornées pour un 403 edge SANS message JSON —
   `attempts=3` = refus **déterministe**, pas une boucle).
3. L'app ne demande aucun endpoint retiré à la charge de l'échec : `/me`,
   `/me/playlists`, `/me/tracks` (GET), `/playlists/{id}/items`, `/search`
   (pagination 10 conforme au contrat 2026), `/albums/{id}`, `/artists/{id}`
   sont tous dans la surface conservée de la doc officielle.

**Cause racine probable (documents officiels Spotify consultés ce jour,
non réfutable par du code) :**

- Le guide de migration officiel « February 2026 Web API Dev Mode Changes »
  (developer.spotify.com, consulté le 10/10/2026) énonce sans ambiguïté :
  « **All Development Mode apps require the app owner to have an active
  Spotify Premium subscription. If the owner's Premium subscription lapses,
  the app will stop working.** » — et la checklist officielle commence par
  « Account: Ensure the app owner has Spotify Premium ».
- L'annonce officielle du 06/02/2026 (« Update on Developer Access and
  Platform Security ») confirme la mise en application : dès le 11/02/2026
  pour les nouvelles apps, et la mise à jour « March 9 » du même billet
  stipule explicitement que « **The Spotify Premium requirement, the
  authorized user cap and one Client ID per developer limit will take effect
  as planned for existing Development Mode integrations** » — les seules
  choses REPORTÉES pour les apps existantes sont les changements d'accès aux
  endpoints, PAS l'exigence Premium.
- Contexte connu de la mission : le propriétaire de l'app
  (`7c5af4cd57e646c49a6266222c2ed9d6`, Client ID public, identique au défaut
  committé `DEFAULT_SPOTIFY_CLIENT_ID` de `app.config.js` — vérifié) **ne
  dispose pas de Spotify Premium**. Cette condition manquée, exigée par
  l'API elle-même, produit exactement le symptôme : login réussi, tout appel
  Web API 403 sans message utile.

**Second garde-fou de compte du même mode** : chaque app dev-mode est
limitée à **5 utilisateurs autorisés** ; l'utilisateur du téléphone doit
figurer dans « Users and Access » du dashboard. La doc officielle ne précise
pas le code HTTP renvoyé aux non-autorisés ; des sources de terrain
(itechguides 18/08/2026, vorplabs 20/07/2026) documentent un **403 sur les
appels API malgré un login OAuth réussi** pour un compte non ajouté. Les
deux conditions (Premium du propriétaire, allowlist) doivent être tenues —
la première est manquante à ce jour, elle suffit à expliquer le blocage.

**Inconnues assumées** : nous n'avons PAS accès au Developer Dashboard et
ne l'avons pas consulté ; l'état réel de l'abonnement du propriétaire et la
liste des utilisateurs autorisés ne peuvent être confirmés que par lui
(checklist §5). Aucun secret n'a été demandé et aucun ne doit être partagé
pour cette vérification.

**Conclusion cause** : ce n'est PAS un bug de Melodix — c'est une
**condition de compte Spotify non remplie** (Premium du propriétaire,
exigence en vigueur pour TOUTES les apps dev-mode depuis le 09/03/2026).
Aucun correctif code ne peut la supprimer ; la contourner violerait les
règles Spotify (refusé par la mission).

## 2. Problèmes de code trouvés et corrections exactes

L'audit de bout en bout (URL d'autorisation et `state` générés par
`expo-auth-session`, PKCE S256 persisté mono-utilisation, single-flight par
code, échange avec `redirect_uri` invariant, stockage SecureStore bit-par-bit
(test jeton long), `isExpired` + refresh RAE classifié définitif/transitoire,
`/me` via `spotifyApiGet`, `applySpotifyUser` + `accountGenerationRef` anti
états croisés, cold start, démarrage `resolveStartupSession`, déconnexion
frontière de lecture) a trouvé **un défaut réel**, corrigé dans ce commit :

| Fichier                       | Correction                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `services/spotify/session.ts` | **Garde anti-course au refresh** : `doRefreshClassified` écrivait son résultat dans le coffre SANS vérifier que la session lue au départ était toujours présente. Un refresh lent déclenché sur une session expirée, finissant APRÈS une reconnexion (échange PKCE), écrasait la session fraîche avec le résultat du token périmé — le « vieux token réutilisé après nouvelle connexion » que la mission demandait de traquer. Nouveau `saveRefreshedSession(expected, next)` : compare `accessToken`/`refreshToken` actuels avec ceux lus au départ ; si une session plus récente a été écrite entre-temps, l'écriture du refresh est SAUTÉE (journal `token.refresh.stale-write-skipped`) et le caller reçoit quand même son token (aucun crash, aucune régression des 158 suites). |

Rien d'autre n'a été « corrigé » faute de défaut démontré : le cycle de vie
OAuth, les flux chaud/froid, la classification 401/403/429/non-JSON,
l'hygiène des logs (whitelist stricte `ALLOWED_DETAIL_KEYS`, motifs
sensibles `<redacted>`) et le diagnostic 403 déjà demandé par V27
(endpoint, statut, Content-Type, forme/corps expurgé, `x-request-id`
conservé, en-têtes allowlistés, `attempts`, version du build et SOURCE du
Client ID dans le rapport copiable `diagnosticReport.ts` — inventorié : tout
est présent, aucun faux-positif à corriger, aucune retentative automatique
supplémentée).

## 3. Conditions externes Spotify restantes (propriétaire)

Actions minimales, dans l'ordre, **sans créer de nouvelle app ni changer le
Client ID** :

1. **Souscrire Premium avec le compte PROPRIÉTAIRE du dashboard** (le compte
   developer.spotify.com qui possède l'app `7c5af4cd…`). Preuve non sensible
   du résultat : après résouscription, l'app Melodix affiche le profil
   Spotify (identity vérifiée) SANS aucune modification de l'APK — c'est le
   seul test qui vaille ; ou, côté dashboard, plus aucune erreur de
   facturation sur le compte.
2. **« Users and Access »** (Settings de l'app) : s'assurer que le compte
   Spotify utilisé sur le téléphone figure dans la liste (≤ 5 en dev-mode).
   Preuve non sensible : le callback `/v1/me` du smoke interne de l'app
   passe de 403 à 200 (l'écran « Compte Spotify » montre l'avatar/nom, et le
   rapport de diagnostic affiche « identité vérifiée »).
3. Vérifier au passage (10 secondes) : Redirect URIs contient exactement
   `melodix://callback` ; l'app est bien en **Development Mode** (sinon la
   règle des 5 utilisateurs ne s'applique pas de la même façon).
4. Ne PAS partager de token, de secret ni de mot de passe pour ces contrôles —
   ils ne sont utiles à personne et ne doivent jamais quitter l'appareil.

Poursuivre la mission après l'action du propriétaire : dans Melodix →
Paramètres/diagnostic, bouton « Copier le rapport » (ou « Partager ») et me
transmettre ce texte — il contient déjà version/build, étape, statut HTTP,
formes de corps, tentatives et source de configuration, **sans aucun secret**.
Pas de logcat complet, pas de capture d'écran du dashboard avec des valeurs
privées.

## 4. Fichiers modifiés et commits

- Commit **`d17dcd3`** `fix(spotify)`: `services/spotify/session.ts`
  (garde + documentation de la course) et
  `services/spotify/__tests__/session.unit.test.ts` (2 tests : course
  stale-refresh n'écrase jamais la session récente ; après un échange, le
  token servi est le FRAIS — donc `/v1/me` part bien avec lui).
- Commit documentaire (le présent rapport) :
  `RAPPORT-MISSION-V28-REPARATION-CONNEXION-SPOTIFY.md`.
- Aucun autre fichier : produit, UI, scopes, redirect, secrets, workflows et
  harnais inchangés ; `main` et `arena/fcdae8c6-melodix` non touchées.

## 5. Résultats réels des tests et de la CI

- **Jest complet local : 2148 passés / 14 ignorés / 0 échoué** (158 suites ;
  +2 vs base V27 `7b3fd9d` = 2146/14/0). Aucun test supprimé, aucune
  assertion assouplie ; les suites Spotify existantes (41 session, 54 hook
  login, 34 client API, 22 contexte, 16 config) passent telles quelles avec
  la garde.
- `tsc --noEmit` : 0 erreur ; `eslint` fichiers touchés : 0 erreur ;
  `prettier --check` : OK.
- **CI GitHub (workflow complet APK Android, déclenchée par le push — pas de
  relance manuelle)** : run `38077666142` sur le head `77b2e63` (contenant
  le fix `d17dcd3`) — **completed / success**, détails et artefact au §6. Le
  run du head documentaire final est consigné en commentaire de la PR #8.
  Note d'état : le workflow porte `concurrency.cancel-in-progress: true`,
  donc le run du commit `d17dcd3` seul a été supplanté à l'arrivée du commit
  documentaire — le run complet sur `77b2e63` couvre exactement le même code
  (le commit documentaire ne touche aucun fichier de code).

## 6. Workflow et APK

- Workflow : « APK Android » — `.github/workflows/android-apk.yml`.
- Run V28 sur le head documentaire `77b2e63` :
  **https://github.com/Souxch06/Melodix/actions/runs/38077666142** —
  `completed / success` ; étapes 21 (smoke émulateur + contrat de
  garde-fous) et 22 (diagnostic OAuth) SUCCESS, 0 étape en échec.
- Artefact APK signé (build de test, clé de debug, cert `fac617…` vérifié
  par le smoke, versionName 4.5.0-test.30, build 45030) :
  `Melodix-v4.5.0-test.30-77b2e63.apk` (47 051 894 octets) —
  https://github.com/Souxch06/Melodix/actions/runs/38077666142/artifacts/11678673557
  (téléchargement via session GitHub ; jamais via lien dérobé). Le head
  documentaire final produit son propre run/artefact équivalent, listé en
  commentaire de la PR #8.
- Client ID effectif de cet APK : le défaut committé `7c5af4cd…` (variable
  de dépôt absente — `::notice` de la CI ; la workflow REFUSERAIT de
  produire un APK au Client ID mal formé ou absent).

## 7. Validation réelle sur téléphone

**Non effectuée — et impossible depuis cette mission.** Aucun appareil
Android physique n'est accessible depuis le bac à sable ; l'émulateur CI ne
peut PAS démontrer une connexion Spotify réelle (pas de compte, pas
d'interaction, et surtout : l'app est actuellement coupée des API par la
condition §1, ce qu'aucun APK ne peut lever). Les 7 premières étapes de la
validation demandée (APK, lien, écran d'autorisation, callback, échange,
`/me` autorisé, identité) sont vérifiées jusqu'à la limite de ce qui l'est
ici : **le smoke Android prouve l'échange et le câblage** (`[SpotifyAuth]
token_exchange:success`, deep links A/B ordonnés, aucune régression) ;
**l'étape « /me renvoie une réponse autorisée » échouera tant que la
condition Premium du propriétaire ne sera pas remplie** — c'est précisément
le résultat du §1, pas un défaut restant de l'app. La validation complète
§7.3–§7.8 revient au propriétaire, dans cet ordre : installer l'APK du run
vert → souscrire Premium/allowlist (points §5.1–§5.2) → « Réessayer » →
l'écran d'identité doit afficher le profil réel.

## 8. État de `main` et des PR

- `main` = `fceab85950b069edcb65ed718a8ffd419a1bc785`, intacte (non touchée).
- `arena/fcdae8c6-melodix` = `e30461a`, intacte.
- PR **#8** : ouverte, head = head V28 poussé, base = branche de travail,
  **non fusionnée** (la mission ne fusionne rien sans autorisation) ; corps
  et commentaire mis à jour avec le bilan V28.
- PR #6 : toujours ouverte, jamais fusionnée.

## 9. Conclusion

> **CODE CORRIGÉ, VALIDATION BLOQUÉE PAR UNE CONDITION SPOTIFY EXTERNE**

La course stale-refresh du cycle de vie session est corrigée et prouvée par
tests ; tout le reste du flux, audité de bout en bout, est conforme et déjà
instrumenté (diagnostic 403 lisible, aucune boucle inutile, aucune fuite).
La cause du 403 n'est PAS dans le code : c'est l'exigence officielle
« Premium actif pour le propriétaire de l'app » en Development Mode (en
vigueur pour toutes les apps depuis le 09/03/2026), que le contexte de la
mission déclare non remplie. Aucun code ne peut légitimement lever cette
restriction ; la mission refuse de la contourner. Dès que le propriétaire
aura souscrit Premium et vérifié l'allowlist, le même APK doit donner une
identité vérifiée sans autre changement — sinon, le rapport de diagnostic
copiable depuis l'app fournira les preuves pour rouvrir l'enquête.

**Distinguer : « les mocks prouvent le comportement du code dans les
scénarios simulés ; ils ne prouvent pas que Spotify autorise réellement le
compte »** — aucune affirmation de ce rapport ne prétend le contraire, et la
connexion n'est PAS déclarée réparée : elle est déclarée **bloquée par une
condition de compte externe**, avec la voie de résolution exacte au §5.

### Sources consultées (10/10/2026)

- Guide de migration officiel : developer.spotify.com/documentation/web-api/
  tutorials/february-2026-migration-guide (Premium du propriétaire, 5 users,
  1→25 Client IDs, endpoints retirés/conservés, search ≤ 10/page, GET /me
  conservé comme remplaçant de GET /users/{id}).
- Annonce officielle : developer.spotify.com/blog/2026-02-06-update-on-
  developer-access-and-platform-security (dates d'application ; mise à jour
  « March 9 » : Premium + allowlist + 1 CID appliqués aux apps existantes,
  changements d'endpoints reportés).
- Changelog février/mars/juillet 2026 référencé par la doc (limites).
- Sources terrain cohérentes (non officielles) pour le comportement 403 des
  comptes non autorisés : itechguides.com (18/08/2026), vorplabs.com
  (20/07/2026).
