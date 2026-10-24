# PR #6 — V97 : correctifs réseau et artwork natif

- **Date :** 18 octobre 2026
- **Branche :** `arena/dbf2d44f-melodix`
- **Commit de départ :** `f3e7a174e157ebb9ee52b026c3cb4ea295aec583`
- **État à la rédaction de l’audit :** correctifs locaux seulement; aucun build ou release V21 n’avait encore été effectué.
- **Contexte :** le Preview test.20 existe, mais il ne contient pas les changements décrits ici.

## Correctifs

### Faux écran « Network Error » pour une réponse HTTP

`WebViewClient.onReceivedHttpError` était interprété comme une coupure réseau dès qu’une réponse principale avait un statut HTTP supérieur ou égal à 400. Une réponse 401, 403, 404 ou 5xx est une réponse du serveur, pas une absence de connectivité; le traitement précédent pouvait cacher la page d’erreur officielle de Spotify derrière l’écran natif « Network Error ».

Le callback HTTP délègue désormais la réponse à WebView sans modifier l’état hors-ligne. Le callback `onReceivedError` moderne conserve le garde `isForMainFrame` pour les vraies erreurs de transport. Le callback déprécié, qui ne fournit pas d’indicateur de frame et pouvait classer une panne de sous-ressource comme une panne de la page, ne modifie plus l’état; les métadonnées Apktool de l’APK décodé indiquent `minSdkVersion: 24`, donc le callback moderne est disponible sur la plage prise en charge. Les erreurs de certificat TLS continuent d’échouer de manière stricte.

Ce chemin explique un faux positif possible, mais faute de Logcat ou de test sur l’appareil il n’est pas confirmé que le message vu sur le test.20 provenait d’un statut HTTP plutôt que d’une vraie erreur de transport.

### URI d’artwork fournie au bridge natif

`AndBridge.recMediaStatus` transmettait auparavant le champ JSON `cover` à Picasso sans validation du schéma ou de l’hôte. Il est maintenant accepté seulement s’il est inférieur ou égal à 2 048 caractères, utilise HTTPS, ne contient pas d’identifiants utilisateur, n’a pas de port personnalisé (ou le port 443), et son hôte normalisé sans tenir compte de la casse est `scdn.co` ou `spotifycdn.com` (ou un de leurs sous-domaines). Toute autre valeur devient vide avant la transformation de taille et le chargement d’image. Les suffixes reprennent les domaines CDN déjà présents dans l’ancienne allowlist du projet; l’hôte réellement renvoyé par Spotify n’a pas été observé sur appareil. Si Spotify utilise un autre CDN, l’artwork natif sera omis jusqu’à vérification, tandis que l’artwork affiché par la page Web reste inchangé.

Ce contrôle réduit le risque d’abus réseau via ce champ; il ne remplace pas l’isolation de frames du bridge et ne valide pas les redirections effectuées par les CDN autorisés.

## Validation et limites

- `node --test tests/*.test.js` : **19/19 réussis**.
- `node --check` pour les JavaScript d’assets et tests : réussi.
- Contrôle structurel Smali et résolutions de labels : réussi; ce n’est pas un assemblage Dalvik.
- `git diff --check` : réussi.
- Aucun outil Android local (`java`, Apktool, Smali, Gradle/SDK) n’est disponible; aucun APK n’a été assemblé.
- Aucun appareil, WebView, compte Spotify ou lecture réelle n’a été testé. Les erreurs de transport véritables continueront à afficher « Network Error »; si le message persiste dans un futur test, il faudra relever le code/URL de l’erreur WebView sur l’appareil.
- Le test.20 publié n’a pas été modifié. À la rédaction de cet audit, les correctifs étaient encore locaux; leur commit/push sur `arena/dbf2d44f-melodix` et la préparation de l’APK V21 restaient à faire.
