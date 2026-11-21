# Suite de la Preview 1022218 — préchargement et transition

## Limites connues avant test téléphone

- Like : aucun correctif démontré dans cette version. Le diagnostic précédent ne donnait aucune identité fiable de la piste en lecture. Le bouton reste bloqué dans ce cas pour éviter d'ajouter un autre titre. Un diagnostic pris sur le téléphone reste nécessaire pour trouver une source fiable.
- Playlists : préchargement expérimental et opportuniste des premières pages de six playlists d'accueil au maximum, en série, après disponibilité de la session et du pont. Il ne charge ni toute la bibliothèque ni toutes les pages au démarrage. Un aperçu daté de moins de deux minutes peut être affiché pendant l'actualisation normale ; si celle-ci échoue, il est clairement signalé et propose de réessayer. Les autres playlists gardent le chemin normal. Aucun gain n'a été mesuré sur un appareil ou avec Spotify réel.
- Transition : dans le snapshot logiciel, les images arrondies reconnues sont masquées pendant le dessin de l'arbre puis redessinées avec un clip arrondi. Cela cible notamment les pochettes de l'accueil dont les `clipToOutline` ne sont pas respectés par le canvas logiciel. Ce redessin final ne reproduit pas nécessairement l'ordre de superposition ou les clips arrondis des parents : vérifier aussi les badges et les vues partiellement masquées. Pas de validation visuelle sur appareil.

## Vérification locale

Chaîne sur une copie historique fraîche : tests Node et Python, reconstruction non signée puis décodage ; vérification des sept actifs protégés, réussie. Une assertion de fixture de reprise du pont a été rendue indépendante des autres temporisations de 2,5 s, puis la suite de vérification décodée a été relancée avec succès. Tests complémentaires sur le shell décodé : préchargement, ordre aperçu/actualisation, limite de six, changement de session, annulation, erreurs, péremption et attente du pont. Tests JVM du snapshot avec restauration de l'alpha et exceptions. Ces simulations ne remplacent ni un Android WebView ni une session Spotify.

## Essais conseillés

1. Démarrer connecté, patienter sur l'accueil, ouvrir plusieurs playlists, puis comparer une playlist affichée tôt et une playlist non préchargée. Vérifier l'aperçu, l'actualisation et les titres après modification d'une playlist.
2. Fermer plusieurs fois le lecteur plein écran sur l'accueil, observer les coins et vérifier que badges, textes et pochettes ne passent pas au-dessus d'autres éléments.
3. Réessayer Like puis relever le diagnostic si l'identité est toujours absente ; ne pas communiquer de jeton ni de données de compte.
