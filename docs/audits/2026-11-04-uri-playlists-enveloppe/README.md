# URI des playlists portée par l’enveloppe libraryV3

## Observation et reproduction

Le parseur cherchait l’URI uniquement dans `item.data`, alors que deux descriptions publiques distinctes du format `libraryV3` placent l’URI dans `item._uri` : [types Pathfinder de hearted.music](https://github.com/fabiogaliano/hearted.music/blob/224bad7803d68dadfd1889cc87f071979d5bb77f/extensions/src/shared/spotify-client/contracts/pathfinder/libraryV3.types.ts) et [parseur BitChord](https://github.com/kushagrasinghx/BitChord/blob/acf219a7e4a7f52f026d4336d5c7ac5cf7bfafcc/web/extension/lib/spotify.ts). Ce sont des exemples externes, pas une garantie du format actuel ni une preuve que Spotify a servi ce format sur l’appareil.

Une réponse synthétique HTTP 200, sans erreur GraphQL, contenant une playlist nommée et une URI seulement sur `item._uri` fait passer l’ancien parseur à `transform-error` et n’arrive pas à l’accueil. La même réponse passe après correction, du vrai pont JS jusqu’au message Home reçu par le pont natif simulé. Le test est exécuté avec les sources puis avec les assets compilés. Si d’autres éléments sont reconnus, l’ancienne version pouvait ignorer la playlist sans nécessairement signaler `transform-error`.

## Correction et limites

L’URI interne reste prioritaire ; si elle manque, l’URI de l’enveloppe est utilisée. Les entrées sans URI ou nom sont ignorées au lieu d’afficher un nom inventé. Une playlist réelle nommée « Liked Songs » conserve son URI : seule l’URI `spotify:collection:tracks` identifie la collection spéciale. Les contrôles de session, d’origine et les refus HTTP 401/403 ne sont pas élargis ; aucun Client ID, jeton, playlist ou identifiant n’est inventé. Cela ne répare ni la limitation 429, ni une requête refusée, ni une collection virtualisée incomplète. Les diagnostics copiables et les corrections du candidat précédent sont conservés.

## Vérification

Tests : 641/641 Node et 4/4 Python ; 54 tests ciblés sur l’acquisition et l’intégration. APK assemblé, aligné, signatures v2/v3 vérifiées API 24–36, garde de certificat vérifiée et trois assets embarqués comparés aux fichiers du candidat. Certificat : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. SHA-256 de l’APK : `e34432bca677fa019f229e8d3c90b754ae3de9e616db9bd50870fe003ec45a12`. Patch complet appliqué sur la base `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 68 fichiers comparés au candidat ; SHA-256 : `2d0fc5a3b418f7874c036de402ab3a1859b0c6229c500e38c7b1fd88c0507693`.

Il n’y a eu ni réponse Spotify authentifiée réelle, ni exécution ART, ni appareil ou émulateur Android dans cet environnement. La cause exacte de l’accueil vide sur le téléphone reste donc inconnue ; la correction couvre une incompatibilité plausible et reproduite, pas une résolution démontrée sur l’appareil.
