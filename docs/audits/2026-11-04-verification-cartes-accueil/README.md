# Vérification du parcours des cartes de playlists sur l’accueil

## Ce qui a été vérifié

Le test relie les assets JS effectivement embarqués (état, pont Spotify et shell) à un interpréteur des instructions Smali de la branche `home` de `MainActivity.applyNativeUiData` puis de `NativeHomeShelfRenderer.render`. Les éléments de bibliothèque et la réponse API sont des fixtures synthétiques de test : aucun compte ni playlist d’utilisateur n’a été utilisé.

Cas contrôlés :
- deux liens de playlists dans le tiroir d’un document Spotify simulé et connecté produisent deux cartes rattachées avec les titres, URI, écouteurs de clic et le titre de section attendus ;
- une playlist provenant d’une réponse `libraryV3` valide atteint, via les assets compilés, la branche d’accueil et une carte possédant son titre, son URI et une demande d’image conforme ;
- le même message est accepté sur la route `home`, refusé sur `library`, et initialise `home` si aucune route native n’est définie ;
- l’ordre et les sections sont conservés dans un lot mixte, et les lignes sans titre ou URI Spotify ne créent pas de carte.

Les tests précédents contrôlent séparément les branches du chargeur d’images, la sécurité de session, les images compilées et les corrections d’URI et de choix de document. **669/669 tests Node et 4/4 Python passent.** Le test Smali exécute les branches et opérations pertinentes avec des objets Android simulés, arrête les cas sans carte avant le panneau d’erreur et simule le composant de grille rapide ; toute instruction rencontrée non prise en charge fait échouer le test. Il ne reproduit ni la vérification ART, ni la boucle principale Android, ni les mesures de layout, ni le réseau des images, ni la visibilité effective ou les pixels. Il ne faut pas interpréter ce résultat comme un test sur téléphone.

## Résultat et limites

Les sources et assets de production sont inchangés depuis l’APK de rendu `8796544280dfc9f347d6826624f47a2692364e2a` : SHA-256 `35e5d6cb4b63f8c3f6412808f0b70b83e21db4e4c210a80c4632b50db25ad2fe`. Aucun nouveau correctif applicatif n’a été affirmé sur la base de ces seuls tests.

Le sandbox ne dispose ni d’appareil Android, ni de `adb`, ni d’émulateur Android ou de `/dev/kvm`. Aucun rendu réel ni aucune réponse Spotify authentifiée n’ont été observés. Il est donc impossible de garantir que les playlists de l’utilisateur s’afficheront lors de son essai : l’accès à Spotify, l’état de connexion, une éventuelle réponse 429 et le contenu réel du DOM restent inconnus. Le diagnostic détaillé copiable est conservé pour distinguer acquisition, transmission, rendu et visibilité lors d’une future vérification.

Patch complet avec les nouveaux tests appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 72 fichiers comparés au candidat ; SHA-256 `11081366fb8981629fe4dc3b4521a0dad3c7b1f28c9fa6d6b4828f03982765a8`.
