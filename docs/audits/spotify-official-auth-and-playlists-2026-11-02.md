# Authentification Spotify officielle et playlists — 2026-11-02

## Conclusion

Le dépôt ne contient pas d’autorisation Spotify Web API par OAuth/PKCE. Melodix ouvre la page officielle du lecteur Spotify dans une WebView, puis tente de lire la bibliothèque du lecteur via son endpoint interne `libraryV3`. Aucun Client ID Spotify ni URI de retour OAuth allowlistée n’est configuré. Un 401 observé dans ce flux ne permet donc pas d’identifier rétroactivement si la session WebView manque, a expiré ou a été refusée.

L’API officielle adaptée existe toujours pour les nouvelles applications en Development Mode : `GET https://api.spotify.com/v1/me/playlists`, avec le scope `playlist-read-private`. Son activation dans Melodix reste bloquée par les paramètres absents du tableau de bord Spotify et par l’absence d’une couche OAuth/stockage sécurisé native dans le projet décodé. Aucune valeur de configuration n’a été inventée.

## Chaîne effectivement présente dans le dépôt

1. `MainActivity.openSpotifyLogin()` charge `https://accounts.spotify.com/...` dans la WebView existante. Le manifeste ne déclare pas de callback OAuth Spotify; les filtres `spotify://` et `open.spotify.com` servent aux liens Spotify.
2. `AndBridge.loginDetected()` ne reçoit pas de jeton. Il met à `true` le booléen `LoggedIn` dans les préférences Android ordinaires. Ce marqueur décrit un état de navigation/login du lecteur; il ne prouve pas l’autorisation Web API ni l’accès aux playlists.
3. `AndBridge.nativeFetch()` est désactivé. Aucun jeton d’accès ou de renouvellement n’est lu, transmis, rafraîchi ou stocké par le bridge étudié.
4. `scripts/spotify_bridge.source.js::fetchAllLibrary()` envoie un POST credentialed au endpoint interne `api-partner.spotify.com/pathfinder/v2/query` avec l’opération `libraryV3`; il ne construit pas de Bearer OAuth et n’appelle pas `/v1/me/playlists`. Les cookies ne sont ni extraits, ni journalisés, ni transmis au code natif.
5. Le Home natif ne doit pas interpréter le marqueur `LoggedIn`, l’écran du lecteur ou un booléen d’Android comme preuve de bibliothèque. Le garde-fou actuel n’accepte que la preuve de bibliothèque qu’il connaît; une intégration officielle devra remplacer cette preuve par une réponse `/me/playlists` valide, pas la simuler.

Le binaire du dépôt est une application décodée/apktool : smali et ressources, sans projet Java/Kotlin/Gradle de l’application ni gestionnaire OAuth/Keystore repéré. Ce n’est pas une raison pour mettre PKCE ou les jetons dans les assets JavaScript : cela exposerait les secrets de session au WebView et rendrait le stockage non sécurisé.

## Documentation Spotify applicable

- Le [flux Authorization Code avec PKCE](https://developer.spotify.com/documentation/web-api/tutorials/code-pkce-flow) est le flux indiqué pour une application mobile qui ne peut pas garder de secret client. Il exige un Client ID, `code_challenge_method=S256`, un `code_verifier`, une URI de retour enregistrée et strictement identique à celle de l’échange, ainsi qu’une validation du `state` recommandé par Spotify.
- Les [règles Spotify sur les redirect URIs](https://developer.spotify.com/documentation/web-api/concepts/redirect_uri) exigent une correspondance exacte; HTTPS est requis hors loopback IP explicite (`127.0.0.1` ou `[::1]`, pas `localhost`). Les schémas personnalisés restent supportés, et Spotify recommande les Android App Links lorsqu’ils sont disponibles. Il faut donc reprendre l’URI réellement enregistrée, jamais en déduire une depuis le package.
- L’endpoint officiel [Get Current User’s Playlists](https://developer.spotify.com/documentation/web-api/reference/get-a-list-of-current-users-playlists) renvoie les playlists possédées ou suivies par l’utilisateur courant. Il exige `playlist-read-private`, accepte au plus 50 éléments par page et fournit `next`/`total` pour la pagination. `playlist-read-collaborative` est distinct et n’est nécessaire que si l’application doit inclure les playlists collaboratives.
- Le [changelog des endpoints de février 2026](https://developer.spotify.com/documentation/web-api/references/changes/february-2026#endpoints-still-available) conserve explicitement `GET /me/playlists` parmi les endpoints disponibles en Development Mode. Les changements d’accès ne constituent donc pas, à eux seuls, un blocage de cet endpoint.
- Le [mode de quota Spotify](https://developer.spotify.com/documentation/web-api/concepts/quota-modes) impose au propriétaire d’une app en Development Mode un compte Premium et limite l’usage à cinq utilisateurs autorisés, gérés dans l’allowlist. Un utilisateur peut voir le lecteur et même s’y connecter tout en obtenant un 403 de l’API s’il n’est pas autorisé pour l’app. Depuis le [changelog de juillet 2026](https://developer.spotify.com/documentation/web-api/references/changes/july-2026), la limite de Client IDs est montée à 25 par développeur et les quotas Dev Mode sont partagés au niveau du compte développeur.
- Les [règles de renouvellement](https://developer.spotify.com/documentation/web-api/tutorials/refreshing-tokens) indiquent un access token d’une heure et un refresh token à durée limitée (six mois selon la documentation actuelle). Une réponse de refresh peut omettre un nouveau refresh token : l’ancien doit alors être conservé. `invalid_grant` oblige à effacer le refresh token et à relancer l’autorisation.
- Spotify recommande de [respecter `Retry-After` et de faire un backoff exponentiel sur 429](https://developer.spotify.com/documentation/web-api/tutorials/building-with-ai). Les réponses de quota 2026 peuvent aussi identifier `QUOTA_EXCEEDED` dans le corps; ce texte n’est pas nécessaire pour décider du délai et ne doit pas être envoyé aux diagnostics.

## Corrections sûres appliquées dans cette branche

- Un HTTP 403 sur la requête de bibliothèque invalide maintenant la preuve de bibliothèque et efface les données privées antérieures ou partielles, comme le 401. Cela n’efface ni ne modifie le marqueur séparé du login du lecteur.
- Le Home présente un 403 comme un refus d’accès à la bibliothèque, sans l’étiqueter comme une déconnexion ni proposer le login du lecteur comme résolution des permissions API. Seul un retry explicite est proposé; les playlists restent cachées jusqu’à une nouvelle réponse valide.
- Pour un 429, le bridge lit `Retry-After` sans enregistrer sa valeur, applique un backoff exponentiel borné à 24 heures, et empêche un retry manuel de partir avant l’échéance. Le Home affiche le délai restant lorsque le statut est confirmé. Aucun contenu de réponse ou jeton n’est ajouté aux diagnostics.
- Le Home natif, le lecteur, les routes et le rendu sans bibliothèque ne sont pas remplacés. Aucun contenu de playlist fictif n’est ajouté.

## Blocage restant pour OAuth/PKCE officiel

Le tableau de bord Spotify n’est pas accessible dans cette mission et le dépôt ne contient ni Client ID ni URI de retour enregistrée. Sans ces valeurs exactes, il serait dangereux d’ajouter un callback ou une URL d’autorisation devinée : l’URI doit correspondre à l’allowlist Spotify et au manifeste Android. Il manque également une implémentation native testable pour la génération PKCE, le contrôle du `state` et du callback, l’échange/renouvellement, et le stockage chiffré lié à Android Keystore.

Pour débloquer la suite, le propriétaire de l’application devra configurer dans Spotify Developer Dashboard un Client ID et une URI de retour exacte, confirmer `playlist-read-private` (et éventuellement l’allowlist Dev Mode). Seuls le Client ID public et l’URI de retour sont nécessaires au paramétrage côté dépôt; **aucun mot de passe, cookie, access token, refresh token ou secret ne doit être partagé**. L’intégration qui suivra devra être native, employer un navigateur externe pour l’autorisation et un stockage chiffré; elle devra tester les cas PKCE/callback/état, refresh, 401/403, pagination, erreurs réseau et absence de fuite avant d’activer `/me/playlists` dans Home.

Un build/AVD sans vrai compte ne pourra valider que l’assemblage et les états sans session. La récupération de playlists privées avec un compte Spotify réel sur téléphone restera une validation distincte tant que cette configuration et cette session ne sont pas disponibles.
