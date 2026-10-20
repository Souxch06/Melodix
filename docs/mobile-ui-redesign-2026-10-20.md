# Interface mobile native — refonte du 2026-10-20

Cette passe répond à la capture d'écran de l'accueil Preview envoyée par l'utilisateur :
les rangées ressemblaient à un tableau (texte à gauche, petite vignette grise carrée à droite),
les titres de section étaient collés et la barre de lecture était surchargée.

## Ce qui a changé

### Rangées de contenu (`NativeUiRowFactory.create`)

- La **vignette passe à gauche** (56 dp, coins arrondis 8 dp) : c'est la lecture d'une liste
  mobile, plus celle d'un tableau.
- Le **carré gris « ▶ » de fin de ligne est supprimé**. C'était l'élément gris carré visible à
  droite sur la capture ; il ne faisait rien et ressemblait à une pochette cassée.
- Les rangées deviennent de vraies cartes : fond `#ff1a1a1a`, rayon 14 dp, bordure 1 dp
  `#ff262626`, marge basse 8 dp, hauteur minimale 72 dp.
- Titre en gras 15,5 sp sur une ligne, sous-titre 13 sp gris `#ffb3b3b3` juste en dessous
  (marge 2 dp), les deux tronqués proprement.
- Cible tactile de 72 dp de haut, description d'accessibilité conservée
  (`titre, sous-titre`) et clic inchangé (`NativeRowClickListener`).

### Titres de section (`NativeUiRowFactory.createSectionHeader`)

- 20 sp gras, 20 dp d'espace avant, 6 dp après : les sections « Vos playlists »,
  « Sélections Spotify », « Vous pourriez aimer » respirent enfin.

### En-tête de playlist (`createPlaylistBanner`)

- Pochette 220 dp, rayon 16 dp, titre 26 sp, sous-titre 13,5 sp : l'écran de détail ressemble
  à la fiche d'une application mobile.

### Mini-lecteur (`res/layout/activity_main.xml`)

- Pochette 52 dp, barre de 72 dp, marges 8/4 dp.
- **Précédent / suivant retirés du mini-lecteur** : ils saturaient la ligne sur un écran de
  384 dp et écrasaient le titre. Ils restent disponibles dans le lecteur plein écran (54 dp)
  et dans le lecteur système.
- Bouton lecture/pause 50 dp (cible ≥ 48 dp).

### Lecteur plein écran

- Suppression du libellé « EN LECTURE DEPUIS SPOTIFY » qui alourdissait le haut de l'écran.
- Boutons 44 / 54 / 72 / 54 / 44 dp : la rangée tient dans 360 dp de large (l'ancienne
  combinaison 50/58/74/58/50 + marges débordait de 10 dp sur un écran de 384 dp).

### Navigation et contenu

- Barre d'onglets 68 dp, onglets 62 dp, titre d'en-tête 24 sp.
- `nativeContent` : 8 dp en haut, 24 dp en bas pour ne pas coller au mini-lecteur.

## Vérification sur appareil

1. Accueil : chaque ligne commence par la pochette, plus aucun carré gris à droite.
2. Les titres de section sont nettement séparés des cartes.
3. Le mini-lecteur affiche pochette, titre, artiste et un seul bouton lecture/pause ;
   un appui ouvre le lecteur plein écran (précédent/suivant y sont toujours présents).
4. Recherche, bibliothèque et détail de playlist utilisent la même rangée mobile.
