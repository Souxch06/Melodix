# Fiabilisation de la bibliothèque et isolation des documents Spotify

## Résultats

Deux scénarios supplémentaires ont été reproduits avec les véritables scripts et un DOM simulé :

1. Le collecteur du tiroir pouvait emprunter les indices de connexion (profil et lecteur) d'un document Spotify pour exposer des listes issues d'un autre document, y compris une iframe de connexion. Chaque tiroir doit maintenant appartenir au même document HTTPS Spotify que ses propres indices de profil et lecteur, sans route ou action de connexion. Si ces indices disparaissent, la projection du tiroir est effacée. Ce sont des observations UI, pas une preuve de bibliothèque API. L'interface `addJavascriptInterface` préexistante reste exposée aux frames ; cette modification ne corrige pas cette limitation.
2. Si la page `/collection/playlists` était déjà chargée et contenait davantage de listes que le tiroir, reselectionner l'onglet Bibliothèque ou Playlists remplaçait la page par le sous-ensemble du tiroir. La page de collection déjà présente est maintenant reprojetée en priorité. Aucune garantie qu'elle contienne toutes les playlists : Spotify peut virtualiser ses listes.

La réparation de l'écran noir n'est pas démontrée. La capture réelle antérieure `110111000` ne permet pas d'identifier la cause ; les relances manuelles ne l'ont pas résolu. Le présent candidat ne modifie pas le mécanisme de chargement pour masquer cette incertitude et ne supprime ni cookies ni stockage. Aucune preuve de fonctionnement Spotify sur Android ou de lecture complète sur téléphone.

## Tests

- 616/616 tests Node et 4/4 tests Python. Scénarios réels de pont/runtime/shell sur DOM simulé : documents séparés et iframe login, retrait d'un profil, priorité collection, changement de catégorie, reprise de projection, routes et navigation. Les tests ne remplacent ni Spotify réel ni ART/Android.
- APK construit avec apktool, ZIP et assets comparés ; signatures v2/v3 vérifiées API 24–36 ; garde de signature compilée égale au certificat stable. `com.melodix.music`, 1.2.2 code 27. SHA-256 `2c92ce6cdfec37c515ab10c15d1ba62a42f9bae8edeea990554f13462ff7a37e` ; certificat `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.
- Le patch complet `correctif-complet-sur-base-44902.patch`, SHA-256 `4ba396b6412d65b0d3f54b344bd05292ec1a5d7072337ccc2e91a742858b3d57`, s'applique sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; les fichiers concernés ont été comparés. Aucune clé incluse.
