# Tests de la grille rapide et de l’état d’accueil

## Vérifications supplémentaires

Le modèle exécute les instructions Smali pertinentes de `renderQuickGrid` et `createQuickTile`, en plus du rendu principal et de la gate d’accueil, avec des objets Android simulés. Les tests contrôlent des grilles de 1, 2, 3, 6, 7 et 32 playlists, leur ordre, titres, URI et demandes d’image, l’exclusion des entrées invalides et la limite de six tuiles. Des réponses HTTP 401 et 403 simulées vérifient le retrait des anciennes playlists API.

Un test synthétique a également reproduit un défaut : après l’envoi d’un état Home, un rafraîchissement ne changeant pas cet état effaçait l’indicateur d’envoi, et un rappel `onNativeUiReady` tardif pouvait ne pas être émis. Le shell conserve maintenant cet indicateur lorsque l’état reste inchangé. Des tests sur la source et les assets compilés couvrent ce rappel tardif et l’arrivée différée d’une réponse de bibliothèque après plusieurs rafraîchissements. Cela ne démontre pas que ce défaut est la cause du problème sur téléphone.

**677/677 tests Node et 4/4 tests Python passent.** APK reconstruit et aligné, signature v2/v3 vérifiée pour API 24–36, certificat cohérent avec la garde intégrée ; intégrité ZIP et trois assets compilés comparés. SHA-256 de `1.2.2-glass-playlists-test-etat.apk` : `3b2e23690b8f36f948a0c1554fdbffe2da63a0c72824cd9575fe60c270912034`. Empreinte SHA-256 du certificat de test : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Le patch complet a été appliqué sur la base `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, et ses 72 fichiers ont été comparés au candidat. SHA-256 : `00bd5f588e550c985e9afe441f35e5c30b45e5c30b45e173228118a0dbbfb4ce`.

## Limites

Les vues, l’exécution Android et les réponses Spotify sont simulées : ce n’est ni une exécution ART ni un test sur appareil, ni une preuve de visibilité réelle, d’un rendu de pixels ou d’une réponse authentifiée Spotify. Aucun appareil, émulateur, adb ou KVM n’est disponible dans cet environnement. L’origine exacte de l’accueil vide reste donc inconnue.
