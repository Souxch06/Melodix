# Correctif du renvoi vers GitHub au démarrage

## Cause

L'APK `1.2.2-glass-playlists-natives-test.apk`, livré au commit `491b51cdced8bbf6569db06d96704cba80dab4b5`, avait été signé avec le certificat de test SHA-256 `725327D287615B9C22AB8F050B7D586E8B50C34E277081AC0CBBA62994EB8EED`, mais sa ressource compilée `expected_signature_sha256` conservait l'empreinte de la base `2E1EE9B4345B3CA3F395BFBE3BE613DBDA13B4DF7E0152688E7D745DAB311F9D`. La méthode `MainActivity.u()` appelle le contrôle de signature et ouvre GitHub puis ferme l'activité si celui-ci échoue. Le mauvais paramètre est une erreur de préparation de cet APK, malgré la signature v2/v3 valide et les tests précédents.

## Correctif

La ressource de signature est maintenant l'empreinte du certificat réel, au format hexadécimal séparé par des deux-points utilisé par l'application. Le contrôle de signature n'est pas supprimé. Le paquet, la version et le certificat restent identiques à l'APK précédent pour permettre la mise à jour sans désinstallation. Les contenus décompressés des deux APK ne diffèrent que par `resources.arsc` ; notamment, `classes.dex` et le shell JS sont identiques.

Un nouveau vérificateur post-signature, `scripts/verify_apk_signer_guard.py` (inclus dans le patch), vérifie la signature de l'APK effectivement construit, décode ses ressources et compare chaque éventuelle variante de la valeur de contrôle au certificat réel. Il rejette les valeurs absentes, mal formées ou non concordantes. Testé négativement sur l'APK défectueux : il échoue comme attendu ; testé sur le précédent APK d'écrans et sur le nouvel APK : il réussit. Quatre tests unitaires couvrent notamment un certificat différent, une chaîne mal formée et une variante locale incohérente.

## Résultats

- **580/580 tests Node**, **4/4 tests Python** ; contrôle de l'APK construit positif ; signatures v2/v3 vérifiées pour API Android 24–36.
- APK `1.2.2-glass-playlists-certificat-corrige-test.apk` : SHA-256 `d3d5c94ae4f06d53e824c3775fcf9c4637b8f4c06ac8258d9535aa99d50bc78b`, certificat `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`, `com.melodix.music`, version 1.2.2 / code 27.
- Pas de téléphone ni d'émulateur disponible : ni le démarrage réel ni l'affichage des playlists n'ont été confirmés sur appareil.
- `correctif-complet-sur-base-44902.patch` contient le candidat complet et ce correctif, par rapport à `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`. Son application sur une extraction propre a été vérifiée ; SHA-256 `91afed646538dd5f05001bc58b828618b5facdebc4b797a2e19a2c19feb77016`. Il remplace, pour une reproduction, le patch de la livraison précédente qui contenait la mauvaise empreinte.

Le collecteur reste limité aux éléments chargés par Spotify dans son interface, avec un maximum de 500 cartes pour la bibliothèque ; Spotify peut virtualiser les listes. Le risque préexistant d'exposition des interfaces JavaScript aux frames de la WebView reste distinct de ce correctif.
