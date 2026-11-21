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

## Retour 1022203 : faux Like possible

La capture montre « Déjà dans vos titres likés », mais ne montre pas la liste Spotify : elle ne suffit pas à confirmer ou infirmer l'état réel du titre. Un contre-exemple DOM a cependant révélé deux défauts : un contrôle générique « Ajouter à la playlist » avec `aria-checked=true` pouvait être présenté comme un Like, et un bouton générique coché `false` pouvait être cliqué sans preuve de sa destination. De plus, un lien d'album et un titre ne distinguent pas forcément deux pistes homonymes.

Ces cas ne constituent plus une preuve de Like ni une cible d'ajout. L'identité exige désormais un lien de piste ou un lien album avec `highlight` explicite ; l'état devient inconnu si l'identité manque ou ne correspond pas au titre natif, et un état Like ancien n'est plus réutilisé sur le seul titre. Les champs ARIA contradictoires et les contrôles désactivés restent bloqués. Un menu explicitement annoncé par un bouton d'ajout générique peut être inspecté même si le bouton est coché pour une autre playlist : seul l'élément unique « Titres likés » explicitement décoché est actionné, et l'identité et l'état sont vérifiés. On ne clique jamais une playlist ordinaire ni un titre déjà aimé.

La correction est prouvée par des fixtures et tests JVM, pas sur Spotify réel : elle supprime les faux positifs et ouvre une voie plus sûre quand le menu approprié existe, mais la disponibilité du bouton, du menu et de l'identité dans la page du téléphone reste inconnue.

## Retour « Titre non identifié » après c41ee42b

La sonde reconnaît également les URI `spotify:track:` et `spotify:episode:` explicites portées par un élément de titre marqué du lecteur courant (`data-uri`, `data-track-uri`, `data-spotify-uri`). Les valeurs incohérentes, mal formées, hors lecteur ou contradictoires restent bloquées ; le titre ou l'album seul n'est jamais une identité. Une même identité doit encore être présente au moment de l'action et lors de sa vérification, avec état et commande explicites. Le diagnostic ne rapporte que le nombre de marqueurs valides, jamais l'URI ni le titre. Les tests DOM valident ces scénarios artificiels ; rien ne prouve que la page réelle expose un tel marqueur ni que le Like fonctionne sur appareil.

## Suite : formats d'identité et ambiguïtés

Une URI `spotify:track:` ou `spotify:episode:` complète dans le `href` d'un lien du lecteur est désormais reconnue. Un lien d'album sans identifiant peut aussi être associé à une URI explicite placée sur son conteneur de titre marqué, uniquement dans la barre de lecture ; les identités et titres doivent tous concorder. Le lien d'album seul ne suffit toujours pas.

Les `highlight` d'album répétés (même encodés ou avec casse différente), les liens de piste malformés et les valeurs contradictoires sont refusés, même si un attribut contient une URI utilisable. La vérification a lieu avant le clic et après la commande. La sonde indique seulement des comptes bornés (`href_uri`, `href_hl_ambiguous`) : pas d'URI, titre, artiste ou données de session. Aucun nouveau clic positionnel ni appel réseau n'a été ajouté.

Tests DOM de ces formats et contre-exemples, simulation JVM, Smali et chaîne locale de l'APK non signée réussis. Ces formats sont des hypothèses testées sur fixtures : leur présence et le fonctionnement du Like dans Spotify réel restent inconnus. Le retour du téléphone et le diagnostic sont nécessaires pour identifier la cause si le blocage persiste.
