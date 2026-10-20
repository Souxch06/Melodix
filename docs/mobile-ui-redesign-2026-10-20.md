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

## Correctif du 2026-10-20 (après capture d'écran)

La capture montrait encore l'ancien rendu : titre sur deux lignes collées, petit carré gris à
droite, aucun espacement. Ce n'était **pas** un problème de style mais d'aiguillage Smali.

Dans `MainActivity.renderNativeRows`, le test `settingValue` était inversé :
`if-eqz v1, :native_row_create_standard` envoyait les lignes **sans** `settingValue` (tout le
contenu : playlists, radios, sélections) vers `NativeSettingsRowFactory`. Toutes les rangées
d'accueil étaient donc dessinées par le générateur des réglages — d'où le petit carré gris à
droite, l'absence de vignette et de sous-titre. Corrigé en `if-nez v1`, avec un commentaire
explicite et un test de non-régression.

Deuxième correctif : Spotify fusionne parfois titre et description dans `aria-label`
(« Radio ecstasyAvec SUICIDAL-IDOL, Rebzyyx… »). `native_ui_shell.js` découpe maintenant sur
`Avec`/`With` : titre propre + sous-titre réel. Le titre accepte deux lignes (15 sp) pour rester
lisible sur 384 px.

## Passe du 2026-10-20 (accueil façon Spotify mobile + playlists)

### Accueil en étagères horizontales

`renderNativeRows` délègue maintenant l'accueil à `NativeHomeShelfRenderer` : chaque
`section` du JSON devient un en-tête suivi d'un `HorizontalScrollView` de cartes carrées
(148 dp, rayon 12 dp), titre gras 13,5 sp sur deux lignes, sous-titre 11 sp sur deux lignes.
Les rangées sans intitulé de section partagent la première étagère au lieu d'en créer une
par carte. Les autres écrans (recherche, bibliothèque, détail, réglages) gardent la liste
verticale plate : pochette 44 dp, titre 15 sp, sous-titre 13 sp, sans carte ni bordure.

L'en-tête et le mini-lecteur ont été retaille pour 360-384 dp : shell sans marge latérale,
titre 26 sp, avatar 40 dp, marges de 8 dp autour du mini-lecteur, bouton de recherche
retiré de l'en-tête (il reste dans la barre d'onglets).

### Playlist, recherche et bibliothèque sans bridge

Ces trois écrans appelaient directement `window.fetchMediaItems` / `window.searchMediaItems`,
qui n'existent que dans le bridge de lecture. Comme celui-ci ne démarrait pas sur l'appareil,
le détail s'ouvrait vide. Désormais :

- `__sfOpenCollection(uri)` utilise le bridge seulement si `__sfMelodixBridgeStarted === true`,
  sinon `__sfNativeOpenUri` navigue vers la vraie page Spotify et `updateDetailRows` récolte
  les rangées à chaque changement de route (repli de 6 s si le bridge reste muet).
- `__sfOpenLibrary()` fait la même chose pour la bibliothèque (`/collection/playlists`), et
  `updateLibraryRows` envoie les rangées via `media:playlists`.
- `__sfSubmitSearch(query)` navigue immédiatement vers `/search/<query>` ; la recherche en
  direct reste temporisée à 900 ms pour éviter un rechargement à chaque caractère.
  `updateSearchRows` renvoie ensuite les résultats via `search:<query>`.

## À vérifier sur l'appareil

1. Accueil : étagères horizontales qui défilent, en-têtes de section lisibles, cartes carrées.
2. Ouvrir une playlist depuis l'accueil : la page de détail s'affiche (jamais d'écran vide),
   même si le bridge n'a pas démarré.
3. Onglet Bibliothèque : les playlists apparaissent (bridge ou page de collection réelle).
4. Recherche : la saisie puis validation affiche des résultats.
5. Diagnostic : `bridgeExecMode` / `bridgeBytes` / `bridgeLastError` dans le rapport runtime.
