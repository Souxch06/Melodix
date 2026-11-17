# Like Preview — sécurité et vérification

Une action Like est uniquement un ajout, jamais un retrait. Avant le clic, le
contrôle doit être unique et actif, et son action d'ajout et son état
non liké ne doivent pas se contredire. Si un bouton d'ajout annonce un menu,
il peut l'ouvrir ; seul un élément unique explicitement nommé « Titres likés »
et explicitement décoché peut être sélectionné. Une playlist ordinaire, une
case déjà cochée ou un état ambigu ne sont jamais cliqués. Le titre et l'identifiant de piste lus
dans la page doivent correspondre à l'observation transmise par le lecteur ;
une identité absente ou modifiée bloque l'action. La confirmation recontrôle
la même identité et un changement d'état lisible ; une commande sans preuve est
signalée non confirmée et n'est pas répétée automatiquement.

Un appui signale la vérification, un ajout confirmé ou la cause du blocage.
La fermeture du menu est demandée par Échap ; sa prise en compte dépend de la
page et doit être vérifiée sur téléphone.

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
