# Tests des états d’accueil natifs

L’interpréteur de test des instructions Smali est étendu au chemin sans cartes, à `renderHomeStatus`, `addHomeStatusActions` et `createHomeStatusAction`. Il simule les vues Android et certains services (création de texte/icône/fond, dimensions, journaux, Activity et chargeur d’images) : il n’exécute ni ART, ni layout, ni réseau d’images, ni les écouteurs de clic. Toute instruction rencontrée non prise en charge échoue au lieu d’être ignorée.

Cas supplémentaires :
- listes vides, invalides ou statut sans titre aboutissent au panneau de secours avec une action « Réessayer » ;
- les actions reconnues sont présentées avec leur libellé et URI attendus, les actions secondaires identiques ne sont pas dupliquées, les URI inconnues ne deviennent pas des boutons ; une session non prouvée sans action propose « Ouvrir Spotify » ;
- la succession cartes privées → statut → nouvelles cartes → état vide remplace bien l’arbre de vues simulé, sans conserver les anciennes cartes dans cet arbre ;
- les réponses API simulées 401, 403 et 429 passent par les assets compilés, la gate d’accueil et le rendu du statut ; une réponse authentifiée vide est distinguée d’une erreur ;
- après navigation simulée vers la connexion, une réponse privée tardive est annulée/rejetée et ne réapparaît pas dans le payload d’accueil.

**685/685 tests Node et 4/4 tests Python passent.** Les seules différences avec le candidat publié en `5a9115b06627fcdd0383fab1cea62cbdcb0068c4` sont les deux fichiers de test ; aucun nouveau correctif de production ni nouvel APK n’a été produit. Son APK conserve le SHA-256 `3b2e23690b8f36f948a0c1554fdbffe2da63a0c72824cd9575fe60c270912034`.

Le patch complet, incluant les corrections précédentes et ces tests, a été appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; les 72 fichiers modifiés ont été comparés au candidat. SHA-256 : `22753164bb7e52e69b24a87c1e91b4db7a50d7ae252390dfe82ac9150610bda0`.

## Limites

Il s’agit de tests synthétiques : aucun appareil, émulateur Android, adb ou KVM n’est disponible. Les objets, événements, mise en page et réponses HTTP ne sont pas ceux du téléphone ou du compte utilisateur. Ces résultats ne prouvent ni l’affichage effectif ni que les boutons fonctionnent sur Android ; la cause réelle de l’accueil vide demeure inconnue.
