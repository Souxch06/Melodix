# Tests du parcours des appuis sur l’accueil

Un modèle interprète maintenant les instructions Smali de `NativeRowClickListener.onClick` et les relie au modèle existant des branches de `MainActivity.openNativeRow`. Les tests utilisent aussi le modèle des vues du rendu Home et les assets JavaScript compilés ; l’Activity et les appels Android restent simulés.

Vérifications supplémentaires :
- une carte et une tuile rapide de playlist propagent leur titre et URI au listener, puis au routage : écran détail, sauvegarde de l’écran Home et appel `__sfOpenCollection` avec la bonne URI ; dans le DOM simulé, la réponse vide du bridge provoque la demande de navigation Spotify attendue ;
- les boutons de connexion, de réglages et d’ouverture Spotify aboutissent aux méthodes natives respectives simulées ;
- le bouton « Réessayer » du panneau de secours aboutit au JavaScript compilé et déclenche une requête de bibliothèque simulée ; un délai 429 actif et une route de connexion empêchent cette requête ;
- une réponse tardive pour la première de deux playlists sélectionnées ne provoque pas de navigation après la seconde sélection.

**691/691 tests Node et 4/4 tests Python passent.** Les seuls changements depuis `d96e255d` concernent les tests : aucun nouveau correctif de production ni nouvel APK. L’APK publié en `5a9115b06627fcdd0383fab1cea62cbdcb0068c4` conserve le SHA-256 `3b2e23690b8f36f948a0c1554fdbffe2da63a0c72824cd9575fe60c270912034`.

Le patch complet, incluant les corrections précédentes et ces tests, a été appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; ses 75 fichiers ont été comparés au candidat. SHA-256 : `926a0bad8d10379032f24e6c628bb2c8f9d4f759da39519ce561037afdb11e2a`.

## Limites

Le modèle simule notamment la construction du listener, les appels Activity et le passage des appels natifs vers JavaScript : aucun événement tactile réel, aucune boucle Android, aucun chargement WebView réel ni réponse Spotify authentifiée ne sont exécutés. Les temporisateurs sont simulés, et le cas de navigation testé est celui de la réponse de bridge vide, pas celui de l’expiration réelle du délai de secours. Sans appareil ni émulateur, ces résultats ne prouvent pas que les appuis, l’affichage ou les playlists fonctionneront sur le téléphone. La cause réelle de l’accueil vide demeure inconnue.
