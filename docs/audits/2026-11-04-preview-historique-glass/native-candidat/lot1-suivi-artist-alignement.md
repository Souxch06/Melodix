# Lot 1 — suivi après retour téléphone

## Origine de l'artiste manquant

Les captures et le signalement de l'utilisateur sont pris en compte ; la pochette bleue de « gun lean remix - hoodtrap » est bien une vraie pochette et n'a pas été retouchée pour ce motif. La comparaison des projets reconstruits 9016 et 9017 montre que `readNowPlaying` utilise les mêmes sélecteurs pour l'artiste et que `updateNativePlayer` écrit le même champ dans les deux vues artiste. Les changements du lot 1 n'ont pas directement retiré ce champ ni modifié ses sélecteurs. Cela ne prouve pas que l'absence soit un chargement tardif : sans trace du DOM Spotify réel au moment du problème, impossible de trancher entre retard, sélecteur devenu inadapté et autre interaction. Le diagnostic reste ouvert.

Le suivi lit en dernier recours un lien artiste **dans la barre de lecture déjà affichée**, sans requête ni récupération de playlist. Un nom précédemment visible peut être conservé pendant un rafraîchissement DOM seulement si l'URI et le titre du morceau restent identiques ; changement ou absence d'identité efface ce repli. Aucun artiste de la page playlist n'est pris comme repli et rien n'est persisté. Tests synthétiques : arrivée tardive, disparition transitoire, changement de titre/URI, absence de barre et écriture dans les deux vues natives.

## Alignement et retour

Les titres de provenance Home n'appliquent plus un padding horizontal additionnel à leur marge de 16 dp. Les titres de sections dans un conteneur de réglages déjà doté de 16 dp de padding n'ajoutent plus une deuxième marge horizontale. Aucune carte, pochette, source de liste ou requête n'est changée par ces corrections. Les tests vérifient la structure des marges, pas leur rendu en pixels.

Le retour dans un écran racine natif visible envoie la tâche en arrière-plan au lieu de passer au chemin Web hérité. Playlist, lecteur et réglages restent raccordés à la pile native ; le shell masqué laisse le chemin Web hérité inchangé. Les simulations couvrent Accueil → playlist → retour, Bibliothèque → playlist → retour, playlist → lecteur → réglages → retour et préservation d'un mini-lecteur factice. Elles ne prouvent ni le geste système ni l'absence de toute régression sur un appareil.

Les huit valeurs de durée et le temps restant restent couverts par les simulations shell → Smali décodé ; les durées de listes indisponibles restent absentes, limite acceptée. Les contrôles structurels du dernier élément gardent des zones défilantes pondérées au-dessus du mini-lecteur et des onglets. Ni la fin du défilement, ni le paysage, ni les appels Spotify ne sont observés sur téléphone par ces tests. Aucune optimisation de latence n'est entreprise avant mesure.
