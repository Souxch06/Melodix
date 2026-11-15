# Lot 1 — livraison du suivi Preview

[Artefact CI](https://github.com/Souxch06/Melodix/actions/runs/43711170178/artifacts/14160606237) · [run réussi](https://github.com/Souxch06/Melodix/actions/runs/43711170178) · [plan de test téléphone](plan-test-telephone-lot1.md)

- APK : `Melodix-Preview-historique-glass.apk` ; package `com.melodix.music.preview` ; versionCode **1022119**.
- Commit source : `9d4930ca69d94acdf10a809684d7d719cecb4a2a` ; base historique : `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`.
- SHA-256 APK : `048629a6e6f7827a37921bb7d883a6f92ed1f363f78e1fddff82e0f6a9dd31b9`.
- SHA-256 ZIP de l'artefact : `06bb2087df4d41bdbdf92205780d311cdd3a53410ae1650c927983e7566c9901` (différent de celui de l'APK).
- Certificat Preview contrôlé en CI : `E3CEB66F4F67CCBD53D92272F5C6422C3B10664AA57A28512BBAFDB89657802F`.
- Les rapports `protected-assets-vs-9016.tsv`, `decoded-files-vs-9016.txt`, `apk-entries-vs-9016.txt` et `apk-entries-vs-9016.json` se trouvent dans le ZIP.

Commande de build utilisée lorsque ce commit était en tête de la branche :

```sh
gh workflow run preview-apk.yml --repo Souxch06/Melodix --ref arena/6b935c3e-melodix -f source_ref=9d4930ca69d94acdf10a809684d7d719cecb4a2a -f release_tag=v1.2.2-test.9017-preview
```

Le workflow exige que `source_ref` égale le commit exécuté. Depuis une tête plus récente, cette commande exacte ne reconstruit pas l'ancien commit ; un nouveau run utilisera la tête courante et produira un nouveau versionCode et une nouvelle empreinte.

## Garde des sept fichiers 9016

La CI télécharge l'artefact 9016 original, vérifie le SHA-256 de son ZIP, puis compare directement les sept entrées des APK signés, octet par octet. Résultat : **identiques**.

| Fichier `assets/` | SHA-256 9016 | SHA-256 candidat |
|---|---|---|
| `spotify_bridge.js` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` |
| `classic_login.js` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` |
| `desktop_spoof.js` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` |
| `google_spoof.js` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` |
| `facebook_consent.js` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` |
| `adblock_hosts.txt` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` |
| `playlist_sort.js` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` |

## Liste exacte des fichiers décodés modifiés depuis la 9016

Comparaison des APK décodés par la CI, aucun ajout ni suppression dans les répertoires comparés :

- `apktool.yml` — métadonnées de version.
- `assets/native_ui_shell.js` — présentation des durées visibles et repli d'artiste limité au lecteur.
- `res/drawable/native_cover_placeholder.xml` — repli des pochettes ; la vraie pochette bleue n'est pas remplacée.
- `res/layout/activity_main.xml` — espacement, défilement et temps restant.
- `res/values/strings.xml` — métadonnées de livraison générées.
- `smali/androidx/activity/b.smali` — raccordement gardé du retour natif.
- `smali/com/melodix/music/MainActivity.smali` — lecteur, temps restant, style et pile de retour ; racine en arrière-plan.
- `smali/com/melodix/music/NativeHomeFeed.smali` — compensation de l'indentation des sections en conteneur déjà margé.
- `smali/com/melodix/music/NativeHomeShelfPreview.smali` — libellés et alignement des sections Home.
- `smali/com/melodix/music/NativeImageLoader.smali` — chargement et repli des images.
- `smali/com/melodix/music/NativeSettingsRowFactory.smali` — libellé de réglage.
- `smali/com/melodix/music/NativeUiRowFactory.smali` — sous-titres totalement vides masqués.
- `smali/com/melodix/music/a.smali` — format des durées du widget.

Les entrées binaires APK modifiées sont `AndroidManifest.xml`, `META-INF/MANIFEST.MF`, `META-INF/MELODIX_.RSA`, `META-INF/MELODIX_.SF`, `assets/native_ui_shell.js`, `classes.dex`, `res/drawable/native_cover_placeholder.xml`, `res/layout/activity_main.xml`, `resources.arsc`. Les entrées de signature et de métadonnées changent à la reconstruction. Aucun CSS modifié.

## Tests et limites

Les contrôles Preview et la comparaison des actifs protégés sont verts en CI. Les nouveaux tests couvrent les sélecteurs artiste dans un DOM factice, apparition tardive et changement de morceau ; les insets sont contrôlés structurellement ; les parcours de retour et la mise en arrière-plan sont simulés. Les huit valeurs de durée sont testées via shell et Smali décodé ; les tests de liste et de défilement restent synthétiques/structurels. Les tests et la mesure de l'app racine, connus rouges, ne sont ni modifiés ni affaiblis. Voir [le diagnostic et ses limites](lot1-suivi-artist-alignement.md).

La limite acceptée reste que les durées absentes des données paginées ne sont pas inventées. Aucun appareil, geste système, rendu, lecture Spotify ou rotation n'a été vérifié par l'assistant ; les captures de l'utilisateur sont la référence 9016, pas des captures du nouveau candidat. L'absence de l'artiste ne peut pas être attribuée avec certitude à une régression du lot ou à un chargement tardif sans trace réelle.
