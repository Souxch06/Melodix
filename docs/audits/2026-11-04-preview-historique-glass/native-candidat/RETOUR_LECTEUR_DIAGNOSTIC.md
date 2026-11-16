# Retour lecteur : filtre d'observation et limites

Le filtre du contrôleur n'accepte une observation de position que si son âge
depuis la lecture JS existante est inférieur à 3 s, son identité est complète,
et son écart à l'estimation native est inférieur à 5 s ; les changements de
morceau et les déplacements manuels enregistrés font exception au seuil
d'écart. La date est ajoutée au paquet déjà transmis, sans lecture de position,
requête, accès à un jeton ou persistance supplémentaire.

**Limite importante :** cette date est l'instant de l'observation dans la
WebView, pas un horodatage de mise à jour Spotify. La valeur peut déjà être
périmée à ce moment-là. En particulier, après mort du processus ou changement
de titre, aucune estimation antérieure n'existe pour détecter une ancienne
valeur cohérente avec les bornes. L'utilisateur a explicitement choisi cette
heuristique plutôt qu'une absence d'affichage permanente ou une source
supplémentaire. L'horloge civile peut aussi changer ; un âge négatif ou
supérieur au seuil est rejeté.

L'état de position vit uniquement en mémoire et est conservé entre activités
du même processus. Après mort de processus la barre est vide et les textes
valent `-:--` avant une première observation acceptée. L'extrapolation utilise
l'horloge monotone Android uniquement en état lecture, bornée à la durée. En
pause ou état inconnu elle est figée ; la correction en pause reste différée.
Le diagnostic conserve 20 événements anonymes et jusqu'à dix relevés après
retour ; les secondes reportées sont des dates effectives, pas la garantie
d'une exécution de timer exactement à chaque seconde sous Android suspendu.

Les simulations JVM exécutent le contrôleur avec stubs et horloge contrôlée :
mesures récentes/périmées, écart rejeté, absence 5 s / 60 s / 10 min, pause,
nouveau titre, zéro, fin, rotation/recréation, mort de processus simulée et
seek juste avant sortie. Elles ne testent ni Spotify, ni son réel, ni cycle
Android réel, ni rendu physique, ni l'âge effectif de la valeur Spotify.
Le seek et ses écouteurs n'ont pas été modifiés ; leurs méthodes smali sont
identiques à 1022153 hors numéros de ligne, et les quatre SeekBars identiques.
Like, aléatoire et en-tête sont inchangés. Leur rendu et la continuité audio
restent à vérifier sur téléphone.
