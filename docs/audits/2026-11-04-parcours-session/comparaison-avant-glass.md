# Playlists : comparaison avant/après Glass

## Périmètre et question

L'utilisateur rapporte que les playlists s'affichaient avant le redesign Glass et demande de repartir de cette version tout en conservant le design Glass. Ce souvenir de fonctionnement est pris en compte ; la version exacte et les conditions de la dernière réussite ne sont pas documentées. Un précédent rapport indique aussi qu'une ancienne application verte, non identifiée précisément, ne chargeait plus les playlists au moment où elle a été retestée (`session-preview-test122.md`). Ce dernier constat ne contredit pas une réussite antérieure.

Trois sources sur la même histoire Git :

- **Pré-Glass** `7cd79bd7b95a0d7f8317b795bc450d40d1c30f17` : parent immédiat du premier commit de refonte `db01eba5`. C'est une référence chronologique sûre, pas une version prouvée comme dernière réussite Spotify sur téléphone.
- **Glass 1.3.1** `990f11a6eaa5a51120d6a9c8f9bc048753c74c48`.
- **Actuel** `9b6cdc8fba00770ed5a182eb97a120edd4044e90` (APK observé issu de `81b30f4d08bed61da92d864f2a78b55a0d4ac247` ; les seules différences jusqu'à `9b6cdc8f` sont documentaires).

## Ce qui est démontré

1. La trace réelle actuelle montre un 400 JSON sur le point principal de jeton, puis un 403 HTML sur le repli, aucun jeton utilisable et aucun appel bibliothèque observé. La garde qui suit empêche le chargement des données ; ce n'est donc pas seulement une carte Glass invisible. `code=400 message=auth` est une catégorie et ne restitue pas la raison exacte. Le cookie repéré ne prouve pas qu'il a été envoyé ou accepté.
2. Comparaison octet pour octet des deux instructions `oriFetch` complètes (URL, paramètres, méthode, credentials et en-têtes) : elles sont identiques entre les trois sources. SHA-256 du texte source de la requête principale : `6df5629a51ca5262d8e52982235911e48fc5f0d4717dc01a00e8e42da9433dbe` ; du repli : `dc963ded498c38a6e8b498afd2bdfd5f2a42f7ed120ef4eac29cf511b60abe4a`.
3. Les fonctions **complètes** `fetchWebPlayerToken` et `fetchAllLibrary` sont identiques avant Glass et en Glass 1.3.1 (SHA-256 respectifs `4ce261003f9189860dd7c7950f30ec36777e0a39e316b68d57192839543e1342` et `0731ab00c86699e2c2646036c8e87fcb4350e023b42bea4603d426fd5d3d8e27`). Le commit Glass `1a6c8067` change bien le bridge pour la navigation et la présentation, mais pas ces fonctions de jeton/bibliothèque. Cela ne démontre pas que tous les autres éléments de contexte étaient identiques.
4. Test isolé en VM : exécution des trois fonctions `fetchWebPlayerToken` réelles avec réponses **synthétiques** 400/403. Dans les trois cas : deux appels, aucun jeton et résultat `ko-http403`. Ce test ne préjuge pas des réponses réelles à l'ancien APK aujourd'hui.
5. Depuis Glass, `0c3ed32c` arrête explicitement la requête bibliothèque si aucun jeton n'a été obtenu ; avant, la bibliothèque pouvait être appelée sans en-tête Bearer. `392f785a` rejette un jeton expiré ou dont l'expiration ne peut être vérifiée au lieu d'inventer une heure. Ces différences concernent la gestion **après** réponse, pas l'identité des deux requêtes de jeton. Les rétablir ne prouverait pas un accès à la bibliothèque ; les enlever exposerait à des demandes sans jeton ou à l'utilisation de jetons dont la validité n'est pas établie.

## Inconnu et conclusion

Le code HTTP ne prouve ni une cause liée au design, ni la cause exacte du refus, ni que Spotify répondrait de la même façon aujourd'hui à une autre version dans une autre session. Les appels jeton identiques réduisent la plausibilité qu'un simple port du thème Glass sur `7cd79bd7` résolve les refus actuels ; ce n'est pas une preuve que toutes les autres régressions sont exclues. Aucun test réel sur le téléphone n'a été fait avec le pré-Glass pendant cette analyse.

Un remplacement intégral par ce commit supprimerait également des corrections ultérieures de session/persistance et des protections sans établir qu'il est la dernière version fonctionnelle. Aucun retour intégral, changement de connexion, de persistance ou de getter, ni publication n'a été effectué. Pour préparer une comparaison ciblée sans perte de données, demander l'identifiant ou le fichier APK exact dont l'utilisateur se souvient ; s'il est inconnu, utiliser `7cd79bd7` comme candidat chronologique, en signalant cette limite et les différences de signature/versionCode et de magasin de cookies avant toute installation. Ne pas désinstaller ni effacer les données.
