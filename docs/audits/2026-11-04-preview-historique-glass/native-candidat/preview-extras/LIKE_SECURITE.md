# Like Preview — sécurité et vérification

Une action Like est uniquement un ajout, jamais un retrait. Avant le clic, le
contrôle doit être unique, actif, hors menu, et son action d'ajout et son état
non liké ne doivent pas se contredire. Le titre et l'identifiant de piste lus
dans la page doivent correspondre à l'observation transmise par le lecteur ;
une identité absente ou modifiée bloque l'action. La confirmation recontrôle
la même identité et un changement d'état lisible ; une commande sans preuve est
signalée non confirmée et n'est pas répétée automatiquement.

Si le bouton est caché mais que la barre fournit une identité unique, un appui
peut essayer d'ouvrir la vue « en cours de lecture », puis d'y chercher un
contrôle explicite. Si la page ne fournit pas cette identité, le contrôle ou
son état, l'action reste indisponible. Une identité issue de la page n'est pas
une preuve que les métadonnées natives sont parfaitement à jour ; les tests
réels restent nécessaires. Le diagnostic copiable ne contient ni titre, ni
artiste, ni identifiant de piste, ni données de session.

## Vérification sur téléphone (non exécutée ici)

- Titre non liké : appuyer une fois et vérifier dans Spotify l'ajout effectif.
- Titre déjà liké : appuyer et vérifier qu'il n'est jamais retiré.
- Avec commande masquée : vérifier l'ouverture/fermeture de la vue cachée et
  l'absence de choix automatique dans un menu de playlists.
- Changer rapidement de piste, y compris deux titres homonymes : aucune
  confirmation ne doit être attribuée à l'autre piste.
- Si le contrôle ou l'identité manque, relever le motif et copier la sonde sans
  données personnelles ; ne pas interpréter « envoyé » comme « confirmé ».
