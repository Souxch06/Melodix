# Livraison Preview Lot 1

La limite de durées absentes des listes paginées a été explicitement acceptée. Ne pas remplacer une valeur manquante par `0:00`.

## APK

- [Artefact CI Melodix-Preview-lot1](https://github.com/Souxch06/Melodix/actions/runs/43709155182/artifacts/14160045761) — [run réussi](https://github.com/Souxch06/Melodix/actions/runs/43709155182).
- Fichier dans le ZIP : `Melodix-Preview-historique-glass.apk` ; package `com.melodix.music.preview` ; versionCode **1022118**.
- Commit source : `82b984436db11a84b3f3b5334f1191931681b4ba` ; base historique : `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`.
- SHA-256 de l'APK : `17b87723627f0381491eb31091c1bbff9ec1af916c56be41b78e374bb1dd6aff`.
- SHA-256 du ZIP d'artefact : `0ed7217f302935cd9825e99147736011bbbedf7071038ef5dd0c2475e68fee35`. Ne pas le confondre avec le SHA-256 de l'APK.
- Empreinte du certificat Preview vérifié en CI : `E3CEB66F4F67CCBD53D92272F5C6422C3B10664AA57A28512BBAFDB89657802F`.
- Le ZIP contient aussi les rapports `protected-assets-vs-9016.tsv`, `decoded-files-vs-9016.txt`, `apk-entries-vs-9016.txt` et `apk-entries-vs-9016.json`.

La construction a été déclenchée depuis le commit source ci-dessus, alors qu'il était en tête de la branche :

```sh
gh workflow run preview-apk.yml --repo Souxch06/Melodix --ref arena/6b935c3e-melodix -f source_ref=82b984436db11a84b3f3b5334f1191931681b4ba -f release_tag=v1.2.2-test.9017-preview
```

Le workflow exige que `source_ref` égale le commit exécuté : après de nouveaux commits, cette commande précise ne reconstruit pas l'ancien commit depuis la branche actuelle. Une nouvelle exécution depuis la tête courante doit utiliser son SHA et produira un nouvel APK/versionCode.

## Fichiers protégés — SHA-256 côte à côte

La CI a téléchargé le ZIP original 9016, validé son SHA-256, puis comparé directement les octets des sept entrées dans les deux APK signés. Chaque ligne est identique :

| Fichier | Preview 9016 | Candidat |
|---|---|---|
| `spotify_bridge.js` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` |
| `classic_login.js` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` |
| `desktop_spoof.js` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` |
| `google_spoof.js` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` |
| `facebook_consent.js` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` |
| `adblock_hosts.txt` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` |
| `playlist_sort.js` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` |

Tous les chemins sont sous `assets/`.

## Fichiers décodés modifiés par rapport à l'APK 9016 signé

Liste exacte produite par la comparaison CI des deux APK décodés ; aucun ajout ni suppression dans les répertoires comparés :

- `apktool.yml` — métadonnées de version de la reconstruction.
- `assets/native_ui_shell.js` — présentation des durées visibles, sans toucher au bridge.
- `res/drawable/native_cover_placeholder.xml` — repli graphique des pochettes.
- `res/layout/activity_main.xml` — marges, défilement et affichage du temps restant.
- `res/values/strings.xml` — métadonnées de livraison générées.
- `smali/androidx/activity/b.smali` — raccord gardé du retour Android.
- `smali/com/melodix/music/MainActivity.smali` — format du lecteur, temps restant, retour et style.
- `smali/com/melodix/music/NativeHomeShelfPreview.smali` — titres de sections Home.
- `smali/com/melodix/music/NativeImageLoader.smali` — chargement/repli des images.
- `smali/com/melodix/music/NativeSettingsRowFactory.smali` — libellé de réglage.
- `smali/com/melodix/music/NativeUiRowFactory.smali` — masquage d'un sous-titre entièrement vide.
- `smali/com/melodix/music/a.smali` — formateur du widget (millisecondes).

La comparaison des entrées binaires de l'APK liste séparément : `AndroidManifest.xml`, `META-INF/MANIFEST.MF`, `META-INF/MELODIX_.RSA`, `META-INF/MELODIX_.SF`, `assets/native_ui_shell.js`, `classes.dex`, `res/drawable/native_cover_placeholder.xml`, `res/layout/activity_main.xml`, `resources.arsc`. Les entrées de signature et métadonnées changent à la reconstruction ; aucun CSS n'a été modifié.

## Limites et tests

Le chemin paginé des playlists ne transmet pas de durée ; celles-ci peuvent être absentes même pour des titres visibles. Lorsque la durée manque, aucun `0:00` n'est inventé et aucune colonne de durée n'est réservée ; un sous-titre complètement vide est `GONE`. Les tests structurels et JSDOM le vérifient, mais ne prouvent pas l'alignement visuel réel, les polices ou les dimensions sur téléphone.

La CI Preview a réussi, notamment le build, la signature, la garde des sept fichiers et les tests ciblés. Les huit cas de durée demandés passent dans des simulations ; tests de playlist, routes imbriquées et vues factices ne sont ni ART, ni une session Spotify réelle. Les tests et la mesure racine, références connues rouges, sont inchangés. Il n'y a pas de nouvelle capture réelle du candidat et aucun test téléphone de l'assistant. Utiliser le [plan de test téléphone](plan-test-telephone-lot1.md), notamment pour le dernier élément, le retour Android, la lecture et la rotation.
