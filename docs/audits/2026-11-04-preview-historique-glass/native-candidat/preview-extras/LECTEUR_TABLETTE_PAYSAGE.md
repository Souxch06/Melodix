# Lecteur sur tablette / fenêtre étroite — candidat

## Constat et limite
La capture montre une fenêtre centrale étroite alors que le lecteur est en deux colonnes : les commandes et les tuiles sont comprimées et la valeur sous « Volume » est coupée. Le diagnostic de la page cachée décrit des contrôles, pas la taille ni l'orientation réelle de la fenêtre ; il ne permet pas à lui seul d'identifier si la bande centrale vient du mode fenêtre, d'un réglage de portrait forcé, ou d'une compatibilité tablette Android. L'application conserve l'orientation et le mode fenêtre choisis ; elle ne peut pas dessiner hors des limites que le système lui donne.

## Correctif
Dans les variantes paysage, le conteneur prend une décision à partir de la **largeur réellement mesurée** du panneau : sous 600 dp disponibles, pochette puis contenu sont empilés et la pochette reste carrée ; au-delà, les deux colonnes sont conservées. Le calcul est réévalué au redimensionnement et reste sans effet sur les variantes portrait. La tuile Volume tient sur deux lignes ; le pourcentage reste dans le panneau et son libellé d'accessibilité. Aucun accès WebView, commande, modification de lecture, d'écouteur seek ni des sept actifs protégés.

## Vérification
Les tests de géométrie JVM simulent 320, 400, 550 et 800 dp ainsi que les transitions de largeur, la stabilité et la taille carrée ; les tests XML vérifient les quatre variantes. Ces tests ne prouvent ni le rendu Android sur une tablette, ni la taille de la fenêtre système, ni Spotify. Vérifier sur l'appareil après publication : fenêtre centrale, plein écran si disponible, paysage/portrait, redimensionnement, grands caractères, pochette, boutons et tuiles sans texte coupé ; vérifier aussi que le seek garde le comportement d'origine.

La sonde fournie indique notamment l'absence du sélecteur shuffle connu, un bouton `add-button` ambigu et une répétition `aria-checked=true` ; elle ne confirme pas l'état « répétition du titre » et ne justifie aucun clic ou retrait de Like à l'aveugle. Aucun de ces points ne prouve la résolution des fonctions de lecture.
