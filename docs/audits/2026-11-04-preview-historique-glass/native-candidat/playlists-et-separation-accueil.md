# Playlist paginée et séparation de l'accueil Glass

## Constat et objectif

La lecture historique de playlist ne demandait que 80 éléments (`fetchPlaylist`, offset zéro). Le secours DOM de la 9014 limitait aussi arbitrairement le nombre de lignes visibles à 100, et le DOM Spotify peut lui-même être virtualisé. Le nombre affiché sur le téléphone dépend du chemin réellement emprunté, non connu ici.

## Candidat

- Les playlists natives demandent successivement les pages Spotify, en avançant par le nombre **brut** d'éléments reçus et en conservant l'ordre ainsi que les répétitions légitimes. La première page s'affiche rapidement, les suivantes sont regroupées pour limiter les reconstructions de vues ; un indicateur de chargement les accompagne.
- En présence d'un total, même une page courte ne termine pas le chargement avant ce total. Sans total, la pagination continue jusqu'à une page vide. Une limite de sécurité de 125 pages, les métadonnées d'offset, les identifiants de ligne et les pages identiques sans total protègent contre des boucles ou des données répétées. En cas de réponse refusée, interrompue ou d'élément non reconnu, le résultat reste partiel, l'utilisateur en est informé et ce résultat n'est pas mis en cache comme complet. Certaines répétitions parfaitement identiques sans métadonnées peuvent être traitées comme une pagination défaillante : la notice évite de les faire passer pour un résultat complet.
- Le cache de playlist n'est réutilisé pour le parcours natif qu'après complétion et pour le même jeton. Un changement d'écran ou de compte pendant le chargement invalide les réponses tardives. L'état de progression/erreur est ajouté uniquement à l'interface native, pas aux morceaux Spotify ni aux réponses MediaBrowser.
- Le fallback DOM n'applique plus la limite de 100 lignes, mais indique explicitement qu'il peut être incomplet : il ne peut pas charger les éléments que Spotify ne rend pas dans le DOM. Les Titres likés et appels MediaBrowser non natifs restent sur leur ancien chargement ; ils ne bénéficient pas de cette pagination.
- Les rangées de détail deviennent plus légères et espacées, avec un retour visuel tactile discret. Sur l'accueil, des repères Glass « Votre bibliothèque » et « À découvrir sur Spotify » séparent les éléments de la bibliothèque et ceux récupérés du contenu d'accueil Spotify, sans inventer de playlist ni renommer les étagères existantes. Les données d'accueil Spotify ne sont pas toutes nécessairement des recommandations personnalisées.

## Limites et tests

Vérification statique des gardes Smali et ressources, compilation/redécodage APK, tests JS avec pages fictives : pagination, première page progressive, total inconnu, pages courtes, échec, cache, changement de compte/écran, répétitions légitimes, replay d'offset et séparation des sources. Pas de téléphone, Spotify réel ni ART disponibles : pas de garantie que Spotify accepte ces requêtes sur le compte de l'utilisateur. Le rendu natif crée encore des vues pour chaque titre et peut être coûteux sur de très longues playlists ; la performance et le rendu doivent être validés sur appareil.

## Livraison 9015

- [Workflow signé réussi](https://github.com/Souxch06/Melodix/actions/runs/43699181801), source `aece622567f082ea82b5e7be4a7282a7b6dec382`.
- [ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43699181801/artifacts/14155438011), SHA-256 indiqué par GitHub `664e9f1aab80e228bfab69a862d7b66054a2e424a6fb97fe95f61535be6f62b7`, expiration 2026-11-29 09:26 UTC. Package `com.melodix.music.preview`, versionCode 1022109 calculé pour le run 622. Signature par la clé Preview épinglée ; aucune release publique.
- En local : 133 tests JS ciblés, tests de patch et contrôles statiques de l'APK redécodée réussis. Ces vérifications ne remplacent pas un test réel sur téléphone.
