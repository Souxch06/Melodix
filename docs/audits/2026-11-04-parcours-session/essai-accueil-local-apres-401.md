# Essai d’accueil indépendant après diagnostic 401 sur appareil

La capture utilisateur montre le shell limité réellement monté : l’absence du renderer Home Web dans le diagnostic ne signifie pas que l’accueil natif est absent. La tentative libraryV3 observée reçoit 401 ; aucun accès aux playlists n’est démontré. Le dépôt ne contient pas de configuration ni d’implémentation d’autorisation Spotify Web API officielle. La présente modification ne restaure donc pas Spotify.

## Modifications partielles

- `fde1a31e` habille la carte d’état et ses actions avec les ressources Glass existantes ; l’accès reste conditionné à la preuve et aucun contenu privé ou playlist fictive n’est affiché.
- La Preview expérimentale ajoute les entrées explicites « Ma musique » (activité locale existante) et « Mode démo » sur l’accueil. La démo reste isolée et identifiée comme telle. Le build normal n’intègre pas ces entrées expérimentales.
- `80653a94` corrige une erreur de méthode Android introduite lors de la première tentative ; le premier candidat `fde1a31e` ne doit pas être installé.
- Les commits de test ultérieurs n’affaiblissent pas les contrôles : le focus global est lu avec `dumpsys window` et des catégories bornées sont produites à des fins de diagnostic hors ligne. Le test Java existant vérifie aussi les nouvelles entrées, sans supprimer ses assertions initiales.

## Résultats

- 47 tests locaux ciblés réussis ; assemblage Android `43310894118` réussi ; [instrumentation Android synthétique](https://github.com/Souxch06/Melodix/actions/runs/43310900398) réussie sur téléphone et tablette. Pas de compte Spotify réel dans ces essais.
- Sur le [candidat exact Android 16](https://github.com/Souxch06/Melodix/actions/runs/43317556915), la signature et le code de version ont été vérifiés ; sur les deux profils, le lancement, l’état accessible et l’ouverture de « Ma musique » puis le retour à l’accueil ont été observés. La navigation suivante vers Bibliothèque échoue cependant : après l’appui, le titre et le root natifs ne sont plus présents dans l’arbre accessible, malgré le focus rapporté sur MainActivity ; aucune classe d’exception AndroidRuntime n’a été identifiée dans ce contrôle. Il faut encore en déterminer la cause : ni défaut réel ni artefact d’instrumentation ne peuvent être exclus. Les scénarios suivants n’ont donc pas été validés sur ce candidat.
- [CI complète](https://github.com/Souxch06/Melodix/actions/runs/43314394567) : 1 328 tests, 1 297 réussis, 31 échecs et aucun ignoré ; un échec supplémentaire concerne l’analyse de largeur des invocations, mais le même test passe isolément en local. La cause de cet écart reste inconnue. Le build QA séparé exige le secret de signature persistant absent.

**Décision :** ne pas fournir ce nouvel APK comme correctif utilisable tant que la navigation du candidat exact reste en échec. Ne pas affirmer que le 401, la connexion réelle ou les playlists sont réparés. Le prochain travail est de diagnostiquer la disparition de l’interface après cet appui, puis de traiter l’autorisation Spotify avec une intégration officiellement configurée et vérifiée, sans demander ni journaliser de secrets utilisateur.
