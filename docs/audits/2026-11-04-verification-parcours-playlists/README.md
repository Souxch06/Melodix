# Vérification du parcours playlists — APK de test

## Portée et corrections

Vérification du candidat `1.2.2-glass-playlists-certificat-corrige-test.apk` après la réparation du certificat intégré. Aucun téléphone ni émulateur Android n'étant disponible, il s'agit de tests automatisés et d'inspection de l'APK, pas d'une validation de la connexion Spotify ou de la lecture sur appareil.

Deux erreurs ont été reproduites dans un DOM jsdom avant correction :

- Un nouvel appui sur une bibliothèque déjà ouverte effaçait la liste native, mais ne la réémettait pas si la WebView se trouvait déjà sur cette page. Le parcours repart désormais des données courantes, sans recharger cette page.
- Les détails d'une playlist ne transmettaient jamais une liste vide après retrait des morceaux précédemment affichés ; l'ancienne liste pouvait donc rester visible. Un état vide est maintenant transmis, y compris si la racine disparaît. La collecte des détails accepte jusqu'à 500 éléments chargés au lieu de 32.

Deux scénarios de course asynchrone ont aussi été reproduits avant correction : une requête de playlist plus ancienne pouvait naviguer après une sélection plus récente, et une navigation en attente pouvait remplacer un retour à l'accueil. Les nouvelles sélections invalident les anciens résultats et temporisateurs. Les tests couvrent également une réponse différée de bibliothèque qui ne doit pas écraser l'accueil.

## Contrôles

- **588/588 tests Node**, dont scénarios DOM simulés, et **4/4 tests Python** du contrôle de signature.
- APK final signé avec le même certificat que la livraison précédente : signature v2/v3 vérifiée pour API 24–36 et contrôle automatique de concordance entre le certificat réel et la ressource compilée `expected_signature_sha256`.
- L'unique contenu décompressé différent du dernier APK à certificat corrigé est `assets/native_ui_shell.js` ; `classes.dex` et `resources.arsc` sont identiques. L'asset dans l'APK correspond à celui généré depuis la source.
- Paquet `com.melodix.music`, version 1.2.2 / code 27 ; APK `1.2.2-glass-playlists-verifie-test.apk`, SHA-256 `c19cec9e84c29e60cad169d32ef80a5909bf49f5f3b32f531109479e4b1756b8`. Certificat SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

## Limites et reproduction

Les listes projetées depuis le DOM Spotify peuvent être incomplètes si Spotify virtualise ou ne charge pas toutes les cartes ; le maximum est de 500 éléments chargés. La connexion, le rendu réel, la complétude de la bibliothèque et la lecture restent à confirmer sur téléphone. Le pont JavaScript Android demeure exposé aux frames de la WebView, limitation préexistante non résolue ici.

`correctif-complet-sur-base-44902.patch` reproduit le candidat depuis `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` (application et comparaison des fichiers clés vérifiées). SHA-256 : `97f52882f96ee94efcfb36383ac99a8dbd7cff0b5d8f1c39d9278ec9450f2703`. Il remplace les patches d'essai précédents pour cette livraison. Aucun keystore ni mot de passe n'est inclus.
