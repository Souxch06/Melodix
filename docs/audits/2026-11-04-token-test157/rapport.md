# ÉTAT / LIVRAISON — diagnostic test157 et correctif partiel expérimental

Aucune APK livrée, aucune release, aucun push ni merge. Le retour utilisateur montre un échec réel du jeton, non encore résolu. Le correctif local empêche uniquement la requête sans jeton et la fausse conclusion d'expiration ; il ne débloque pas les playlists. Suite complète rouge : ne pas promouvoir ce correctif. Aucune reconnexion supplémentaire demandée.

## Origine et preuves

* Branche `arena/6b935c3e-melodix`, HEAD PR distant `aa8b20785a7d72da4c81625f338129302d911374` ; copie isolée persistante `/home/user/melodix-correctif-connexion`, parent de ce travail local `9e55740c161e26a7afe82c53342f2ea9fe1f0593` (correctif bandeau non validé). Checkout partagé à `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, WIP non touchés.
* Journal fourni par l'utilisateur : Preview `1.2.2-377eb0a`, `1021503`. Trois tentatives consignées : chacune token API 400, repli 403, puis bibliothèque 401. Le flux repasse sur `player` et `AndBridge` est attaché. `home-data ... received` prouve réception d'un payload Home, pas présence de playlists. `dom-connected` est un indice DOM, pas une preuve d'accès privé. Pas de valeurs directes pour `__sfMelodixBridgeStarted`, `__sfMelodixBridgeBootstrapReady`, `#sf-melodix-home`, nombre de lignes affichées ou rendu effectif.
* Le corps des réponses d'erreur n'a pas été capturé : **indisponible**, même expurgé. L'origine et les paramètres ci-dessous sont établis par lecture du code de la version construite, pas par capture réseau indépendante. Cookies ou jetons ne sont ni affichés ni collectés ici. Les refus 400/403 ne permettent pas d'identifier expiration, limitation de compte, paramètre erroné ou politique d'accès.

## Chemin et requêtes dans test157

`MainActivity` appelle `NativeSessionGate.pageFinished`, qui, après retour sur `open.spotify.com` et démarrage du lecteur, lance `NativeSessionRecovery.verify`. Le relanceur appelle `__sfRequestSessionVerification` et `checkMediaLib`; des mises à jour du shell peuvent également le déclencher. `runMediaLibraryCheck` appelle `fetchAllLibrary`, qui attend `fetchWebPlayerToken` puis réalise la requête `libraryV3`. Les observations de vérification vont à `AndBridge.onSessionVerification` puis `NativeSessionGate.result`. Les lignes sont transmises par `native_ui_shell` à `AndBridge.onNativeUiData`, ensuite `MainActivity.postNativeUiData`; `applyNativeUiData` applique la garde de session avant tout rendu.

| Étape | Construction dans le code | Résultat journal | Limite |
|---|---|---|---|
| Token lecteur | Depuis la WebView du lecteur : `GET https://open.spotify.com/api/token`, `credentials=include`, `Accept: application/json`, `app-platform: WebPlayer`, `spotify-app-version: 1.2.40.0`, sans corps ni paramètre. Attend JSON `accessToken` et éventuellement expiration. | 400 | Corps non enregistré ; cause inconnue. |
| Repli token lecteur | Même contexte et en-têtes : `GET https://open.spotify.com/get_access_token?reason=transport&productType=web_player`, cookies inclus ; attend `accessToken`. | 403 | Corps non enregistré ; cause inconnue. |
| Bibliothèque actuelle | WebView : `POST https://api-partner.spotify.com/pathfinder/v2/query`, CORS, credentials inclus ; JSON `libraryV3`, pagination limit=50/offset et hash persisté ; `Content-Type: application/json;charset=UTF-8`, mêmes en-têtes de plateforme, `Authorization: Bearer …` uniquement si jeton présent. | 401 | Ici le code continue après un jeton nul et n'ajoute donc pas de bearer. Ce 401 n'est pas une confirmation indépendante d'expiration. |

Il s'agit d'un mécanisme interne au lecteur utilisé par l'application actuelle, distinct du jeton OAuth de la Web API officielle. Les documentations consultées ne le documentent pas comme contrat tiers pour cette bibliothèque. Cela ne démontre pas la cause précise des refus ni l'inexistence de toute documentation privée.

## Correction expérimentale locale

* `fetchAllLibrary` interrompt la tentative si le jeton est absent, avant toute requête bibliothèque ; n'invente aucun statut HTTP, efface les données privées précédentes et ne laisse pas une tentative périmée effacer une session plus récente.
* La garde conserve le blocage des données privées, mais classe un jeton manquant séparément des vrais 401/403 bibliothèque et ne le présente plus comme preuve d'expiration. L'interface native affiche une explication sans attribuer la cause au compte. Aucun cookie n'est supprimé, aucun endpoint ou en-tête Spotify modifié.
* Diagnostic `token-missing` limité par une grammaire fermée à phase=request/http=0 ; codes token disponibles sans valeur secrète. La trace ne rend pas le corps d'erreur observable.
* Correctif bandeau de la mission précédente présent dans le parent local, toujours non vérifié sur appareil.

## Résultats et blocages

* Tests ciblés : `node --test tests/token_missing_regression.test.js tests/session_attempt_diagnostic.test.js` : 14/14, aucun skip. Tests simulés : refus token, zéro requête bibliothèque, statut non expiré, vraie requête simulée avec bearer et parsing d'une playlist factice, réponses 401/403 distinctes, tentative périmée. Ne prouvent pas Spotify.
* Suite complète : **1 188 réussis / 34 échecs / 1 222**, aucun skip. Les 26 échecs de `p0_library_fetch` utilisent des fixtures qui ne fournissent aucun jeton tout en attendant des requêtes bibliothèque ; d'autres tests attendent l'ancienne classification expirée ou l'identité exacte des fonctions. Certains vérifient aussi pagination, concurrence et 401 ultérieur : ces propriétés ne sont pas couvertes suffisamment par les nouveaux tests, il faut les reprendre sérieusement. Aucun test existant n'a été désactivé ou modifié. Liste exacte ci-dessous.
* Contrôle statique des registres Smali pour `NativeSessionGate` et `NativeSessionSurface` : 0 avertissement. `AndBridge` signale le même avertissement préexistant `injectBundledAsset` avant/après, non attribué au correctif.
* Pas d'adb, émulateur ni session Spotify autorisée ici. Compilation APK, installation, démarrage, interaction clavier, bridge Android réel, playlists réelles et rendu physique **non testés**. Le test d'acceptation Android existant vise le titre de l'ancien bandeau et n'est pas exécuté ; aucun critère d'acceptation n'a été affaibli.
* Aucun lien APK ni SHA fourni : pas de correction démontrée du jeton, suite rouge et acceptation non exécutée. Le binaire test157 reste inchangé.

## Voie officielle à étudier, pas implémentée

Spotify documente pour une application mobile le code d'autorisation OAuth avec PKCE, un **client ID d'application enregistrée** et un redirect URI autorisé ; pas de secret embarqué ni de champ Client ID utilisateur. Un consentement distinct à l'application Melodix peut être nécessaire ; la session WebView actuelle ne prouve pas ce consentement. `GET /v1/me/playlists` permet la liste paginée (jusqu'à 50 par page), avec les permissions `playlist-read-private` et `playlist-read-collaborative` selon les données demandées. Adapter les réponses Web API séparément du format interne `libraryV3`, transmettre au modèle de l'interface sans journaliser le contenu, et garder l'intégration de lecture distincte ; le jeton OAuth Web API n'est pas automatiquement le jeton du lecteur interne.

Dépendances : application Spotify Developer propre au projet (client ID public configuré au build, redirect exact et statut/quota confirmés), autorisation de l'utilisateur, stockage protégé des jetons et politique de renouvellement. En développement Spotify documente notamment une limite d'utilisateurs autorisés et une exigence Premium pour le propriétaire de l'application ; les restrictions 2026 limitent aussi l'accès aux éléments de playlists non possédées/non collaboratives. Ce sont des limites du parcours officiel proposé, pas le diagnostic de l'actuel 403.

Sources officielles :
- https://developer.spotify.com/documentation/web-api/tutorials/code-pkce-flow
- https://developer.spotify.com/documentation/web-api/reference/get-a-list-of-current-users-playlists
- https://developer.spotify.com/documentation/web-api/concepts/scopes
- https://developer.spotify.com/documentation/web-api/concepts/quota-modes
- https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide
- https://developer.spotify.com/documentation/android

## Tests échoués non modifiés

not ok 539 - checkMediaLib transforms a valid library response and sends cookies without inventing a token
not ok 540 - loading clears an earlier raw count before the response settles
not ok 541 - concurrent and forced checks share one in-flight libraryV3 request
not ok 542 - the library paginates multiple playlist pages and deduplicates entries
not ok 543 - an absent session represented by HTTP 401 remains an unknown-cause refusal, not a fabricated login diagnosis
not ok 544 - HTTP refusals and server responses retain their status-specific errors and proof semantics
not ok 545 - library request diagnostics distinguish actual attempts from repeated snapshots using safe source and counts
not ok 546 - a 401 invalidates earlier proof and clears private rows from memory
not ok 547 - a later-page 401 clears partial private rows and revokes the earlier page proof
not ok 548 - a 403 invalidates private library proof and clears stale rows without asserting player logout
not ok 549 - a later-page 403 discards partial private rows and invalidates the earlier page proof
not ok 550 - a 429 honours a bounded Retry-After delay without logging the header or response body
not ok 551 - network failure, invalid JSON and HTML response are distinguished
not ok 552 - login navigation aborts an in-flight request and rejects its late private response
not ok 553 - unknown DOM may verify with Spotify but a profile alone never proves private access
not ok 554 - a confirmed player UI permits one libraryV3 check and records a separate proof epoch
not ok 555 - a valid empty library is distinct from a failed request and proves only the API response
not ok 556 - unexpected JSON shape and GraphQL errors are not reported as an empty library
not ok 557 - a successful API response with unsupported items is a transform error, not a false empty library
not ok 558 - a transient network error preserves an earlier verified proof without asserting new auth
not ok 559 - partial real data remains available when a later page fails
not ok 561 - a stalled request times out, aborts where supported, and does not create false proof
not ok 562 - a stalled response body also uses the bounded request deadline
not ok 563 - concurrent checkMediaLib calls do not double-fetch
not ok 565 - session diagnostics record actual token endpoint codes without credential values
not ok 567 - manual session retry runs a new API, fallback and library request after a complete refusal
not ok 974 - snapshot and telemetry do not modify requests, proof or export sensitive data
not ok 989 - case 3: one complete refusal with same cookie offers explicit reconnect, never auto redirect
not ok 998 - destructive reconnect is disabled during official login, even after repeated refusal evidence
not ok 1006 - a stale/duplicate attempt cannot count twice; retries accumulate without pretending SSO is fresh
not ok 1007 - missing/changed cookie and network break the repeated-refusal proof, fresh refusal explains account denial
not ok 1008 - actual gate plus actual evidence: first refusal, slow retry deadline, second distinct refusal
not ok 1010 - incomplete or unknown diagnostic rows can never add a session refusal
not ok 1057 - generation guards, reconnect, Spotify request functions and proof publication unchanged from 127

## RÉSUMÉ VÉRIFIABLE

La première défaillance observable est l'obtention du jeton lecteur (400 puis 403), cause non déterminée. Le 401 suivant est lié à une requête de l'ancienne version sans bearer. Correctif partiel local et tests ciblés uniquement ; pas de validation Android ni Spotify, pas de nouvelle APK, pas de release.
