# Retour Preview 1022215 : pont et Like

Le diagnostic utilisateur indique `waiting-bridge:unknown` pour la playlist courante et `non envoyé : identité` pour le Like. Il ne démontre ni une erreur de chargement du script, ni le temps réseau, ni la latence de cette playlist. Les durées Home reçues concernent des préparations de frame ; le cache lecteur n'est pas un cache de playlists.

Le shell avait un défaut reproductible : après un événement d'échec de ressource, ses quatre tentatives conservaient la balise de script déjà en échec. La correction Preview remplace uniquement une balise dont l'événement `error` a été observé, et seulement avant l'entrée du pont. Une balise en attente ou un pont entré/démarré ne sont pas remplacés. Les tentatives restent bornées. Un ancien événement ne peut pas marquer la nouvelle balise. Pas de changement du script pont protégé.

Les tests JSDOM exécutent les scripts extraits de l'APK construit, avec minuterie et réseau simulés, et couvrent l'échec, le retry, le pont réel et une playlist fictive. Ils ne démontrent pas que ce défaut a eu lieu sur le téléphone, ne mesurent pas un gain réel et ne prouvent pas le fonctionnement Spotify réel. Le lancement initial dépend toujours de Spotify et du réseau.

Le Like reste non résolu : aucune identité de piste fiable ni commande Like du lecteur n'a été observée dans le diagnostic ; les autres contrôles et liens de la page ne prouvent pas la piste active. Ne pas choisir une piste par titre/artiste ni cliquer un bouton extérieur ambigu. Aucun cache persistant Home inter-comptes n'est ajouté sans identité de compte fiable. La garde d'initialisation des requêtes réseau ordinaires est conservée : une fonction exportée ne prouve pas qu'un bootstrap interrompu soit sûr.
