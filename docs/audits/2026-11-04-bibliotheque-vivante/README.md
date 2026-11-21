# Bibliothèque native : synchronisation du tiroir Spotify

## Défaut reproduit

Dans le candidat précédent, même si l'accueil recevait correctement les playlists réelles du tiroir Spotify et si l'interface de lecteur était reconnue comme connectée, l'action « Bibliothèque » ne réutilisait que les données de l'API privée. Sans preuve API, elle déclenchait une navigation et pouvait laisser le contenu natif vide. Trois tests avec le vrai runtime, le vrai pont et le vrai shell ont d'abord échoué pour l'ouverture, la mise à jour et le retour à l'accueil.

## Correction

Lorsque la preuve API n'existe pas mais que le lecteur est observé comme connecté et que le tiroir contient des playlists, l'appui sur Bibliothèque ou la sélection de l'onglet Playlists transmet directement ces lignes au canal natif `media:playlists`. Elles sont exclusivement issues du DOM du document Spotify autorisé ; elles ne rendent pas positive la preuve API. Les changements du tiroir sont retransmis, un état de connexion non confirmé efface les lignes, et un retour à l'accueil ou un changement de catégorie annule la projection. Les scénarios existants de navigation et d'attente asynchrone restent couverts.

La correction conserve les réparations documentées dans `2026-11-04-analyse-collecte-session` ; elle n'établit toujours pas la cause de l'écran noir ni que Spotify est réellement connecté sur cet appareil. Un DOM vide ne peut pas fournir de playlists. Une bibliothèque virtuelle ne garantit pas que toutes les listes sont chargées. La lecture sur téléphone et l'absence de régressions Android restent à valider. L'interface JavaScript Android reste accessible aux frames, limitation préexistante.

## Vérifications

- 611/611 tests Node et 4/4 tests Python. Les tests intégrés exécutent le runtime, le pont et le shell réels dans un DOM simulé ; ils couvrent insertion/retrait, perte et retour des signaux, retour à l'accueil, changement de catégorie, doublons, iframe tierce, ordonnancement, ainsi qu'un modèle de la porte native. Ce modèle ne remplace pas ART ou un téléphone.
- APK compilé avec apktool, ZIP et assets comparés ; signatures v2/v3 vérifiées API 24–36 ; garde de signature compilée égale au certificat. Aucune suppression de session, de cookies ou de stockage.
- `com.melodix.music`, version 1.2.2 code 27. APK SHA-256 `e092be261274b78474fca390afbb7dfa0370cc85af3bf6aeba9f3046af157747`, certificat inchangé `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Le patch complet `correctif-complet-sur-base-44902.patch`, SHA-256 `f4ee7464ec9e7219ed5d30a211c8ba5442adb76aea9948cab7ae127c2af4b0b5`, s'applique sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`. Les fichiers modifiés ont été vérifiés ; aucune clé n'est incluse.
