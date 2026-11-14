# Restauration du lecteur : travail partiel, non livrable

## Périmètre et état

Ceci n'est **pas une restauration fonctionnelle des playlists**, ni une validation sur téléphone. Le changement coupe l'acquisition et la réutilisation du jeton privé du Web Player par Melodix, interdites par la mission, et corrige un faux succès sur l'ouverture d'un titre. Il n'établit pas une nouvelle autorisation officielle. La suite complète n'est pas verte et la fixture Android de navigation n'a pas encore été adaptée ni exécutée pour ce changement. Pas d'APK Preview.

## Comparaison historique

Dans `5d38b1fdd9c08df9033f674e57e26b09b7b6f261`, `assets/spotify_bridge.js` intercepte `window.fetch` du lecteur, en extrait notamment un bearer et le stocke en local. `playFromUri` forme une commande privée avec ce bearer et un identifiant d'appareil ; `searchAndPlay`, `fetchMediaItems` et `fetchAllLibrary` utilisent également des requêtes internes. Il ne faut pas copier ces chemins : les deux premiers éléments contredisent explicitement la demande et des endpoints internes ne sont pas une intégration officielle garantie. Ce commit n'est pas prouvé comme le dernier parcours complet fonctionnel sur appareil.

Le commit `45b0de9997186fa77a8585d86bb5414514d9a6c4` supprime l'interception, les proxys natifs, la commande privée, la recherche et plusieurs accès détaillés ; `playFromUri` devient inerte. `85d7293e` rétablit une requête bibliothèque avec cookies seuls. Ensuite `d7d253f0` ajoute la récupération directe d'un jeton interne et sa transmission à `libraryV3` ; `cc29cac3` ajoute un repli. `35de93c7`, `7543b274`, `0c3ed32c` et `392f785a` ajoutent ou resserrent respectivement la preuve bibliothèque, la gate et les conditions de jeton. La branche a déjà retiré la condition de présence du bearer dans `d6e7c5ff`, tout en exigeant une réponse bibliothèque valide.

Avant ce correctif partiel, le shell appelait `playFromUri` pour un titre et retournait toujours `true`, alors que cette fonction était vide : aucun titre n'était ouvert par ce chemin. Désormais elle retourne `false` et ne lève pas le verrou de pause ; le shell tente alors une navigation via le chargeur natif existant vers la page officielle du titre. Cette navigation n'est **pas** une preuve de lecture, ni un remplacement complet de la commande historique, ni une preuve que l'interface Glass peut afficher la page.

## Diff

- `scripts/spotify_bridge.source.js`, `assets/spotify_bridge.js` : suppression de l'obtention, du décodage, du cache et de l'ajout du bearer privé ; diagnostic token à `none`, aucun HTTP de jeton inventé. L'appel bibliothèque conservé utilise les cookies de la WebView et doit toujours réussir pour valider la preuve. L'accusé de démarrage d'une relance est émis après invocation du transport bibliothèque. Le faux succès `playFromUri` devient `false` sans modifier l'intention de pause.
- `scripts/native_ui_shell.source.js`, `assets/native_ui_shell.js` : repli vers la navigation du lecteur lorsque la commande de titre ne confirme pas explicitement son succès. La limite de taille de l'asset reste respectée.
- `tests/native_ui.test.js`, `tests/playback_pause.test.js`, `tests/mel_bug_036_webplayer_bearer.test.js` : assertions adaptées à l'absence de commande et à l'interdiction de bearer privé, sans supprimer ou ignorer ces tests.
- `tests/no_private_player_token_flow.test.js` : tests supplémentaires de non-récupération et non-transmission de bearer, refus et accusé de transport, et repli du bridge réel vers le shell réel. Ces tests sont synthétiques.

La suppression des anciennes requêtes de jeton est une **régression fonctionnelle possible** pour les comptes où elles marchaient ; elle est requise par la nouvelle contrainte. Elle ne rétablit pas l'accès aux playlists du téléphone : sur le précédent build l'appel sans bearer a reçu 401. Les anciens diagnostics token ne sont plus émis par ce chemin, et une preuve de bibliothèque privée n'est pas obtenue à partir d'un DOM ou d'un cookie seul.

Tests locaux ciblés : 90 réussis, aucun échec ni test ignoré, et les cinq assertions MEL-BUG-036 adaptées réussissent séparément. Suite complète après adaptation : **1 280 réussis, 38 échecs, 0 ignoré sur 1 318 résultats**. Le fichier `token_refusal_debug.test.js` échoue pendant son chargement avant l'enregistrement de ses tests ; le total ne signifie donc pas que tous ses cas individuels ont été exécutés. Plusieurs échecs attendent l'ancienne récupération du bearer ; d'autres vérifient des contrats de concurrence, de diagnostics ou d'historique et doivent être revus individuellement, pas déclarés automatiquement obsolètes.

La [CI UI 43278812670](https://github.com/Souxch06/Melodix/actions/runs/43278812670), sur le commit de code `dc323a959b5754edd088096950e6104ce8daadf9`, confirme les mêmes 1 280 réussites, 38 échecs et 0 ignoré. Le job séparé de construction de l'APK **QA** a également échoué car la clé persistante de test n'est pas configurée ; les parcours Android dépendants n'ont pas été exécutés. Cette CI UI n'est pas la CI Android complète demandée. La CI construisant un APK Preview et l'instrumentation Android du changement n'ont pas été lancées : le préalable local est rouge et produire un Preview serait prématuré.

## Intégration officielle et vérification réelle

L'[Android SDK App Remote](https://developer.spotify.com/documentation/android/tutorials/getting-started) permet le contrôle et l'état du lecteur Spotify installé sur l'appareil après autorisation. Il demande une application enregistrée, son Client ID, une URI de redirection, le nom de package et l'empreinte de signature ; cela commande l'application Spotify et ne restitue pas automatiquement un lecteur embarqué identique à l'ancien.

Pour les playlists, l'[API officielle](https://developer.spotify.com/documentation/web-api/references/changes/february-2026) conserve `/me/playlists`, avec [autorisation et scopes appropriés](https://developer.spotify.com/documentation/web-api/concepts/scopes) et OAuth PKCE pour une application mobile. En [mode développement](https://developer.spotify.com/documentation/web-api/concepts/quota-modes), le propriétaire de l'application doit avoir Premium et les utilisateurs doivent figurer dans l'allowlist ; un utilisateur Free peut être distinct du propriétaire. Le dépôt ne fournit ni Client ID ni URI de redirection enregistrée, et aucun flux OAuth natif complet n'a été validé ici. Aucun identifiant, scope ou réponse n'a été inventé. Les [conditions Spotify](https://developer.spotify.com/terms) encadrent notamment les accès non autorisés et la collecte automatisée : le retour brut à la capture réseau ou au scraping ne démontre pas leur conformité.

Le seul résultat réel disponible pour l'environnement Android est le test utilisateur antérieur : endpoints de jeton 400 puis 403, et requête `libraryV3` sans bearer 401. Il ne montre pas si le lecteur lui-même effectue encore ses requêtes ni leur disponibilité après ce changement. Aucun compte, appareil connecté ni réseau Spotify réel n'est accessible dans cet atelier pour tester ces points. Les tests VM ne prouvent pas le pont Android, Glass, la lecture, ni l'API Spotify.

## Reste à faire avant livraison

1. Adapter sans supprimer/ignorer les autres tests qui imposent le chemin privé, en conservant les vérifications d'erreur, concurrence, génération et confidentialité ; traiter aussi les comparaisons historiques épinglées sans affaiblir leur portée.
2. Adapter la fixture `tests/android/BridgeNavigationInstrumentation.java` au transport sans jeton et exécuter les tests Android réels sur émulateur, y compris la chaîne du bridge à l'affichage Glass. Aucune exécution Android du présent changement n'est revendiquée.
3. Obtenir une configuration d'application Spotify autorisée (Client ID public et URI de redirection enregistrée, sans mot de passe ni token) et l'accès approprié ; intégrer et vérifier le parcours officiel de bout en bout, puis tester un compte réel avec consentement.
4. Exécuter la CI complète et ne livrer un APK Preview qu'après son succès. Le build précédent ne démontre pas le succès de ce changement.
