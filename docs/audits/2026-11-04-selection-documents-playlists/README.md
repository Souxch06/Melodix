# Sélection de la vue de collection et isolation des documents

## Reproductions synthétiques

Le sélecteur de racine ne gardait que le premier `#main-view` trouvé. Dans une page de collection simulée, si la racine du document principal est vide et si une iframe Spotify accessible, connectée et sur la même route contient la playlist chargée, celle-ci est ignorée. Les tests échouent avec les sources et assets précédents, puis passent avec les nouveaux.

Deux tests négatifs distincts ont aussi montré qu’une vue de collection sans signaux propres de connexion pouvait être lue si un autre document Spotify fournissait les signaux de connexion : à la fois dans le sens document principal vers iframe et dans le sens inverse. Il s’agit d’un défaut reproduit en simulation, pas d’une preuve qu’une donnée a été divulguée sur le téléphone.

## Correction

Sur une route de bibliothèque, comparer les racines candidates de documents Spotify HTTPS accessibles uniquement si le document source dispose lui-même des contrôles profil et lecteur, ne présente pas d’action de connexion et correspond à la route courante (normalisation des préfixes de langue et de la barre finale). La recherche de secours reste bornée au document retenu. Elle ne traverse pas d’iframe tierce ou de page de connexion et ne transforme pas les signaux UI en preuve API. L’effacement après perte des signaux est testé pour l’accueil projeté et pour le message de bibliothèque lorsque l’autre document reste connecté. Une preuve API ne permet pas non plus de lire une iframe non confirmée. Si ces contrôles manquent pendant le chargement, aucune carte issue de ce document n’est envoyée : ce choix est volontairement conservateur.

Tests de non-régression : routes différentes, iframe tierce ou de connexion, racine de secours, plusieurs racines identiques, assets compilés, perte des signaux. Les données sont toutes fictives et aucune authentification n’est contournée. Le candidat inclut les correctifs précédents d’URI de playlist et le diagnostic détaillé copiable.

## Vérifications et limites

653/653 tests Node et 4/4 Python ; APK assemblé, aligné, ZIP vérifié et trois assets comparés, signatures v2/v3 vérifiées API 24–36 et garde de certificat conforme. Shell embarqué : 108635 octets, sous la limite historique de 108867. Certificat : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. SHA-256 de l’APK : `1593afcf36cb7f63f7a555d05caedc4a7d03bf40601ec40bf9f9333bdbea0a83`. Le patch complet s’applique sur la base `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; ses 68 fichiers sont identiques au candidat. SHA-256 du patch : `9da438da297a98376ccc010f2fe13d9ab6e46a2d6e11df3da51d70aa501f2bf1`.

Sans appareil ou émulateur, ni réponse Spotify réelle authentifiée, aucun affichage effectif n’est attesté. La structure réelle du DOM et la cause de l’accueil vide restent inconnues. Ces changements ne lèvent pas un 429 et ne chargent pas les lignes virtualisées absentes du DOM.
