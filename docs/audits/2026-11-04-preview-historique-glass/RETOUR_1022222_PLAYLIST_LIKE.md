# Retour de la Preview 1022222 : playlists et Like

L'utilisateur rapporte une amélioration mais souhaite l'ouverture instantanée. La mesure de 171 050 ms n'isole pas le délai d'une ouverture : ses phases sont manquantes ou non séquentielles et la dernière trace de collection indique encore `open`. Les 1 375 ms et 863 ms concernent uniquement les phases qui ont été observées, pas le temps total.

## Préchargement proposé

Le cache reste volatile et lié au bearer ; aucune donnée de playlist n'est sauvegardée sur le disque. Les playlists personnelles vérifiées sont prioritaires, y compris celles que l'accueil ne montre pas ; jusqu'à 24 premières pages (50 éléments chacune) sont demandées en série, avec un intervalle de 750 ms après disponibilité du pont, au lieu de 6 à 2,5 s. Lors d'une ouverture, le chargement spéculatif est interrompu ; il peut reprendre en quittant le détail. Arrêt sur limitation réseau 429 ou trois erreurs successives. Le hash GraphQL suit le pont, y compris son cache local. Un aperçu déjà chargé reste utilisable dix minutes et est marqué en cours d'actualisation ; le chargement normal complet continue.

Cela augmente le trafic et améliore les chances d'un affichage immédiat après préchargement, sans le garantir pour un premier démarrage, une liste non encore préchargée, un échec réseau ou les pages ultérieures. Le contenu affiché temporairement peut dater de dix minutes. Aucun gain réel n'a été mesuré dans un WebView Android connecté.

## Like

Le diagnostic indique bien des métadonnées de lecteur (titre/artiste/durée), mais aucune URI de piste dans les liens ou attributs propres au lecteur, et aucune API lecteur/bibliothèque disponible. La présence d'un bouton coché ou décoché dont le libellé contient « liké » n'établit pas à elle seule à quel élément précis il s'applique ni qu'il peut être utilisé sans ambiguïté. Aucun correctif du Like n'est prétendu : pas d'action sur la base d'un titre seul, d'une ligne de playlist, ou d'un bouton non identifié. Les indices restent insuffisants pour tester cette opération avec assurance sans session réelle. Une nouvelle preuve structurelle du lecteur Spotify est nécessaire.

## Vérifications

Reconstruction locale et décodage réussis, vérification des sept actifs protégés ; tests sur le shell réellement reconstruit avec faux réseau : priorité bibliothèque vérifiée, 24 pages maximum, hash du pont, ordre aperçu/actualisation, invalidation lors du changement de session, annulation/reprise, péremption, limitation 429 et erreurs répétées. Suite combinée de 83 tests validée. Ce ne sont ni des mesures de vitesse ni une validation Spotify réelle.
