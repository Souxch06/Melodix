# Candidat 9008 — pagination progressive et bibliothèque

## Retour terrain

La Preview 9007 n'a pas amélioré le temps perçu sur le téléphone et la bibliothèque y apparaît vide. Ce correctif ne considère pas les simulations antérieures comme une preuve du rendu réel. La cause exacte de l'écran vide et le format actuel renvoyé par le service sur le compte ne sont pas connus.

## Modification

- `libraryV3` publie la première page réussie sans attendre toutes les pages suivantes ; l'accueil est notifié à chaque page, la bibliothèque en attente reçoit les pages disponibles. Pas de fausses playlists ni de cache persistant supplémentaire. Les pages suivantes restent séquentielles et la première réponse dépend toujours de l'authentification et du réseau.
- Une récupération partagée évite les fetchs concurrents non forcés. Les résultats d'une requête devenue obsolète (token/génération) ne sont pas publiés. Le code garde les données partielles lorsqu'une page suivante échoue et ne remplace pas par des résultats vides sur erreur HTTP ou réponse GraphQL sans liste.
- Si disponibles, les vrais éléments du panneau bibliothèque de Spotify sont présentés immédiatement au clic de catégorie ; le filtrage est appliqué avant la limite de 32 et le scrape reste strictement borné au panneau. Une réponse du bridge est prioritaire sur le scrape de la page de collection. Si le panneau et la récupération réseau sont indisponibles, la bibliothèque peut toujours être vide ; pas de garantie de structure DOM Spotify.
- Aucun changement du formatage, du lecteur ou des branches de clic natives historiques.

## Vérification

- Test d'entrées du patch 2/2, fichiers épinglés par SHA. Tests candidat sur APK recompilée et redécodée 23/23, dont réponse première page pendant que la seconde est bloquée, mises à jour supplémentaires, partage de requête, changement de token, 401, 429, erreur GraphQL, panneau réel fictif et filtre avant limite. Aucune communication Spotify réelle ; DOM et réponses synthétiques.
- Ressources validées, APK non signée locale reconstruite puis redécodée ; suites ciblées 40/40 et 3/3 + 1/1 + 3/3.
- Pas d'appareil Android ni mesure du temps sur téléphone. Les clics et la lecture restent non validés et les gardes de clic natives historiquement inversées ne sont pas réparées. Des caches natifs et autres défauts historiques subsistent lors d'un changement de compte ; pas de garantie de séparation totale des comptes. Les problèmes de sécurité historiques restent documentés dans les précédents rapports.

## Preview signée 9008

- [Build réussi](https://github.com/Souxch06/Melodix/actions/runs/43682900791), source `aa2682659d98643384f0970028f81573628f32a5`, run 615, versionCode calculé `1022102`.
- [ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43682900791/artifacts/14149251921), expire le 29 novembre 2026 à 05:53 UTC ; SHA-256 ZIP API GitHub `cc3099d1235d82106528c2630cf90c97c406ec4da4d142d5cd83e7654cdfeb02`.
- Package séparé `com.melodix.music.preview`, signature Preview épinglée, aucune release publique. Un build réussi ne valide pas l'usage réel sur Android.
