# Rendu natif des playlists : conditions inversées

## Faits reproduits

`NativeImageLoader` appelait `String.isEmpty()` puis effaçait l’image quand le résultat était zéro, ce qui inclut toute URL HTTPS non vide. Ce chargeur est aussi utilisé par les cartes de l’accueil. Dans `NativeUiRowFactory`, d’autres branches inversées remplaçaient un titre non vide par « Untitled », ignoraient une image non vide et n’installaient pas le gestionnaire de clic sur une URI non vide. Des tests précédents vérifiaient textuellement ces mauvaises branches en leur prêtant le sens inverse ; ils ont été corrigés.

Un petit interpréteur de branches exécute les instructions Smali concernées avec leurs vraies règles booléennes : avant correction, 5/5 scénarios initiaux échouaient ; après correction, 10/10 scénarios passent, incluant les chaînes nulles/vides, les URL HTTP/HTTPS, les titres, URI, images, sous-titres, sections, l’en-tête et les gardes des onglets. Il s’agit d’un modèle de fragments, **pas d’une exécution sous ART** ni d’une vérification de pixels.

Les tests de bout en bout du pont JS vers le message natif simulé montrent aussi qu’une playlist ordinaire nommée « Liked Songs » recevait à tort l’image de la collection spéciale. L’image par défaut est désormais attribuée uniquement à l’URI `spotify:collection:tracks`, et la playlist conserve sa propre URI et son image réelle éventuelle. Les tests couvrent sources et assets compilés.

## Portée

Le correctif remet dans le bon sens les gardes de titre, d’image et de clic des lignes natives, l’appel au chargeur d’images, les sections et la sélection visuelle des filtres. Le contrôle HTTPS du chargeur est maintenu. Les contrôles d’origine et de session du candidat précédent ne sont pas relâchés. Ces correctifs portent sur le rendu et les interactions lorsque des données atteignent déjà l’interface : ils ne démontrent pas pourquoi les données réelles de l’utilisateur manquent éventuellement, ne lèvent pas les réponses 429 et ne chargent pas une liste virtualisée entière. Le diagnostic copiable et les corrections précédentes sont conservés.

## Vérifications

665/665 tests Node, 4/4 Python. APK assemblé, aligné, vérifié ZIP et assets, signatures v2/v3 API 24–36 et garde de certificat correspondante. Shell : 108620 octets, sous la limite historique de 108867. Certificat `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. SHA-256 APK `35e5d6cb4b63f8c3f6412808f0b70b83e21db4e4c210a80c4632b50db25ad2fe`.

Le patch complet a été appliqué à la base `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` et ses 71 fichiers comparés au candidat ; SHA-256 `11589193d247321e598b9d763c20b9de40edca3c49b5517d7ffec613c33458cf`. Aucun appareil, émulateur ou réponse Spotify authentifiée n’étant disponible, le comportement Android réel et la cause exacte de l’accueil vide restent inconnus.
