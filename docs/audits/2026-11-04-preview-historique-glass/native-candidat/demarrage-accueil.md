# Candidat 9011 : démarrage de l'accueil

## Retour observé

Sur la 9010, l'utilisateur confirme que la bibliothèque affiche désormais ses playlists, mais précise que les deux rangées de l'accueil attendent au lancement de l'application. Ses captures montrent la bibliothèque et l'accueil remplis après chargement ; elles ne mesurent ni la durée d'attente ni la phase qui la provoque.

## Changement ciblé

- Quand le bridge natif est prêt sur l'accueil et qu'un jeton Bearer est déjà disponible, la récupération Spotify de la bibliothèque démarre immédiatement, sans attendre une nouvelle mutation du DOM ni un retry du shell. Elle utilise le même mécanisme progressif partagé et la même garde de génération/jeton que la 9010. Sans jeton, aucun appel précoce n'est envoyé : l'interception du jeton conserve son fonctionnement antérieur. Aucun snapshot personnel n'est stocké sur disque.
- La découverte d'un hash GraphQL « titres likés », ou d'un hash bibliothèque identique à celui déjà utilisé, ne relance plus inutilement la récupération en cours. Un nouveau hash bibliothèque réel la relance toujours, avec rejet d'une ancienne réponse tardive.
- La rangée publique n'est **pas** préchargée par une nouvelle API : elle dépend toujours des données et du DOM réellement fournis par Spotify, et du moment d'injection du shell après chargement WebView. Cette modification seule ne garantit donc pas son accélération. En l'absence de mesures sur appareil, la cause du délai reste à confirmer.
- Le comportement bibliothèque et la protection temporaire contre les trous de l'accueil restent ceux de la 9010. Pas de données inventées, ni de garantie de séparation complète des caches historiques.

## Vérification

Tests sur scripts et Smali redécodés depuis l'APK locale non signée : 56/56 tests ciblés (dont 10 nouveaux sur démarrage, absence/changement de jeton, hashes et erreurs), 3/3 bootstrap et 40/40 tests natifs/session ciblés ; test de transformation 2/2 ; compilation, redécodage, intégrité ZIP et ressources OK. Requêtes et réponses simulées, aucun Android ou Spotify réel, pas de mesure du temps de chargement sur téléphone. L'APK locale non signée ne doit pas être distribuée.
