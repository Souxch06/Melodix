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

## Passe du 2026-10-20 (boutons morts, conditions inversées et lecteur réel)

Cette passe répare les commandes qui ne répondaient pas, puis affine le rendu mobile.

### Pourquoi « rien ne marchait »

Plusieurs tests Smali étaient inversés sur `String.isEmpty()` : la rangée affichait
« Untitled » à la place du titre, la pochette n'était jamais chargée (`NativeImageLoader`
effaçait l'image quand l'URL était valide), le listener de clic n'était jamais attaché, les
en-têtes de section ne s'affichaient pas, le champ de recherche ignorait le texte saisi et
`openNativeRow` sortait immédiatement pour toute URI non vide. Chaque test a été remis dans
le bon sens et verrouillé par un test de non-régression.

Autres corrections de la même famille :

- `openNativeRow` distingue maintenant trois cas : réglages (`spotify:settings:`),
  collections (playlist, album, artiste, podcast, `/collection`) et lecture simple (titre,
  épisode) qui repart vers `__sfNativeOpenUri`.
- `NativeUiRowFactory` : le contenu (sans `settingValue`) va bien vers la fabrique de
  couverture, et les réglages vers la fabrique de pastilles.
- `setNativeScreen` : la flèche retour apparaît sur détail, lecteur **et** paramètres ; la
  barre d'onglets et la carte du mini-lecteur disparaissent sur le lecteur plein écran.
- `NativeUiUpdateRunnable` ne rappelle plus `onNativeLibraryClick` à chaque route
  « library » : ce rappel renvoyait vers `/collection/playlists` à chaque chargement et
  provoquait une boucle de rechargement de la WebView.
- Les chips de bibliothèque utilisent `__sfOpenLibraryCategory` (jamais `fetchMediaItems`),
  restent sur la bonne catégorie (`media:albums`, `media:artists`…) et s'affichent en vert
  quand elles sont sélectionnées.
- La touche retour système (`onBackPressed`) quitte d'abord l'écran natif courant au lieu
  de fermer l'application.

### Lecteur réellement piloté

`spotify_bridge.js` était le seul à publier l'état du lecteur. Quand il ne démarre pas,
l'interface restait sur « Aucune lecture en cours ». `native_ui_shell.js` lit désormais la
barre *now playing* de Spotify (titre, artiste, pochette, position, durée, état) et pousse
un payload `player` chaque seconde, uniquement quand une piste existe. Le mini-lecteur
apparaît à ce moment-là, avec sa ligne de progression.

Le verrou de pause (45 s, 5 ré-applications, seuil 1200 ms et intervalle 1500 ms) vit
maintenant dans le shell toujours chargé, avec `__sfTogglePlayback` et `__sfSkip`. Un saut
libère le verrou ; une reprise automatique de Spotify est immédiatement re-mise en pause.

### Détails d'interface

- Boutons lecture/pause : icônes vectorielles Spotify sur cercle blanc (48 dp mini,
  72 dp plein écran) au lieu des caractères « ▶ » / « Ⅱ ».
- Mini-lecteur : carte arrondie 12 dp, marges 8 dp, ligne de progression 3 dp, masquée
  tant qu'aucune piste n'est chargée.
- Lecteur plein écran : fond dégradé vert sombre, pochette 272 dp (rayon 8 dp), titre 24 sp.
- Onglets : pastille verte supprimée, icône verte + libellé blanc sur l'onglet actif.
- Écrans vides : « Chargement de votre accueil… », « Chargement de la playlist… »,
  « Chargement de votre bibliothèque… » et le message de recherche.

## Passe du 2026-10-20 (retours au toucher, grille d'accueil, transitions)

Cette passe ne touche ni au pont de lecture ni aux conditions `if-eqz` / `if-nez`
réparées juste avant : elle ne fait qu'ajouter du rendu.

- **Grille « Récents » sur l'accueil.** `NativeHomeShelfRenderer.renderQuickGrid`
  affiche jusqu'à six tuiles (pochette 56 dp + titre deux lignes, fond `#ff2a2a2a`,
  rayon 6 dp) sur deux colonnes, avec les mêmes gouttières de 16 dp que les
  étagères, avant le premier titre de section. Une grille demande au moins deux
  éléments et n'apparaît pas quand le payload est vide. Chaque tuile est
  cliquable via `NativeRowClickListener` (pochette, titre et URI).
- **Retours au toucher.** Trois drawables *ripple* (`native_row_ripple` 8 dp,
  `native_card_ripple` 12 dp, `native_tab_ripple` 16 dp, `native_quick_tile`
  6 dp, `native_mini_row_ripple` 12 dp) sont posés sur les lignes de liste
  (`NativeUiRowFactory.create`), les cartes d'étagère, la mini-carte, les
  tuiles de la grille et les onglets. Le fond des onglets n'est plus teinté en
  transparent : l'ancien `setBackgroundTintList(0)` supprimait aussi le ripple.
- **Transition d'écran.** `setNativeScreen` compare la destination à
  `nativeCurrentScreen` avant de l'écraser et pose `nativeFadeNextScreen` ;
  `fadeNativeScreen` relance alors une alpha 0,875 → 1 en 180 ms sur la racine
  `0x7f09022f`. Le flux « lecteur » qui republie son état chaque seconde ne
  déclenche donc aucune animation. Le fond du shell étant opaque, un départ
  plus bas laisserait apparaître la WebView ; une animation annulée ne peut
  pas non plus laisser l'écran vide.
- **En-tête.** Le caractère « ⚙ » est remplacé par un vecteur `native_nav_settings`
  (20 dp), aligné dans le bouton rond de 40 dp.
- **Vérifié, déjà correct :** `updateNativePlayer` affecte bien `v2` (titre) à
  `0x7f090236`/`0x7f09023b` et `v3` (artiste) à `0x7f090237`/`0x7f09023c` ;
  la barre d'état et la barre de navigation restent `@color/spotify_black` avec
  icônes claires.

### Limite de validation

Aucun de ces changements n'a été vu sur un appareil : l'APK n'est pas
téléchargeable dans l'atelier, la compilation et la vérification syntaxique
Smali passent uniquement par la CI. Les contrôles statiques
(`tests/smali_sanity.test.js`, `tests/native_ui.test.js`) couvrent les bornes de
registres, les identifiants et la présence des appels.

## Passe du 2026-10-20 (onglet Rechercher et détails de liste)

- **Onglet Rechercher : grille « Parcourir tout ».** Le panneau de recherche
  affichait un champ puis un texte d'aide. Il affiche maintenant huit tuiles
  colorées sur deux colonnes (Pop, Hip-hop, Rock, Latino, Détente, Sport,
  Podcasts, Nouveautés), dans un `ScrollView` dédié (`nativeGenreScroll`,
  `0x7f09024f`) inséré entre le champ et les chips de bibliothèque.
  `onNativeGenreClick` lit le `tag` de la tuile, appelle `performNativeLiveSearch`
  (donc `window.searchMediaItems`, qui existe aussi sans bridge via le repli du
  shell) et recopie le terme dans l'en-tête. La grille reste affichée tant que
  les résultats ne sont pas arrivés : une recherche qui échoue ne laisse pas un
  écran vide derrière elle.
- **Visibilité des panneaux.** `setNativeScreen` masque toujours la grille ;
  `renderNativeRows` la masque et réaffiche la liste défilante dès qu'il y a des
  lignes ; `onNativeSearchClick` fait l'inverse pour l'onglet vierge. Le flux
  « onglet → grille → résultats → liste » est donc déterministe.
- **Pochettes des lignes : 48 dp, rayon 4 dp** et un pictogramme de note neutre
  (`native_cover_placeholder`, `0x7f080141`) au lieu du logo de l'application,
  qui apparaissait sur chaque ligne sans pochette.
- **Barre de défilement masquée** sur la liste native (`scrollbars="none"`),
  comme dans l'application Spotify.
- Nouveau test `tests/native_ui.test.js` : la grille est entre le champ et les
  chips, elle porte huit tuiles, `onNativeGenreClick` appelle bien
  `performNativeLiveSearch`, et la visibilité des deux panneaux est pilotée par
  `setNativeScreen`, `renderNativeRows` et `onNativeSearchClick`.
