# APK 1 Preview — barre et commandes, à valider sur téléphone

## Identité

- [CI signée — run 43716976584](https://github.com/Souxch06/Melodix/actions/runs/43716976584), conclusion success.
- [Télécharger l'archive de l'APK 1](https://github.com/Souxch06/Melodix/actions/runs/43716976584/artifacts/14162699076) : nom de l'archive `Melodix-Preview-lot1`, fichier `Melodix-Preview-historique-glass.apk`.
- Package : `com.melodix.music.preview` ; versionCode **1022120** ; versionName `1.2.2-d0f206b-glass`.
- Commit source de l'APK : `bf090e06d1dc2560acc2623de83712c3025185e5` ; base historique `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`.
- SHA-256 APK : `5c11793e9439764c8ee462a668605baa0ead957e89e7f6e4c6c812cc2c174f27`.
- SHA-256 ZIP de l'archive, fourni par GitHub : `92432bafe20ebe2bb1b7b4ed577ecbc3dd9f99483c96793e80f9b057b2c73db8`.
- Signature Preview vérifiée en CI, empreinte certificat `E3CEB66F4F67CCBD53D92272F5C6422C3B10664AA57A28512BBAFDB89657802F`.

La CI a téléchargé l'APK 9016 signée depuis son archive originale épinglée, l'a comparée octet par octet à l'APK candidate **signée**, puis a exécuté l'étape bloquante exigeant le résultat et les sept lignes avant upload. Les deux étapes sont vertes. Le contrôle local de projet n'est pas utilisé comme substitut.

## Sept fichiers protégés — SHA-256 côte à côte

| Fichier | APK 9016 signée | APK 1 signée | Identique |
|---|---|---|---|
| `spotify_bridge.js` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | oui |
| `classic_login.js` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | oui |
| `desktop_spoof.js` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | oui |
| `google_spoof.js` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | oui |
| `facebook_consent.js` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | oui |
| `adblock_hosts.txt` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | oui |
| `playlist_sort.js` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | oui |

La table et les rapports de différence sont aussi dans l'archive CI. Si la référence manque, si la comparaison est ignorée ou si une valeur diffère, le nouveau garde échoue avant l'upload. Les chemins 9018 et 9019 refusent aussi de construire si leur patch requis est absent.

## Diff exact des fichiers décodés contre 9016

Résultat du rapport de la CI, 17 entrées. Il inclut les changements du lot 1 et du suivi déjà livrés ; il n'indique pas que tous ces fichiers sont nouveaux dans l'APK 1.

- `apktool.yml` — métadonnées de construction/version Preview.
- `assets/native_ui_shell.js` — présentation déjà livrée, échantillons de position et branchement des commandes/diagnostics Preview.
- `res/drawable/native_cover_placeholder.xml` — présentation de remplacement déjà livrée.
- `res/layout/activity_main.xml` — interface Glass, lecteur et restant déjà livrés.
- `res/values/strings.xml` — identité/version Preview et ressources historiques de livraison.
- `smali/androidx/activity/b.smali` — raccord retour Android déjà livré.
- `smali/com/melodix/music/MainActivity.smali` — changements antérieurs, horloge native, boutons optimistes et points de mesure.
- `smali/com/melodix/music/NativeHomeFeed.smali` — rendu/espacements du lot 1.
- `smali/com/melodix/music/NativeHomeShelfPreview.smali` — espacements du suivi lot 1.
- `smali/com/melodix/music/NativeImageLoader.smali` — rendu et taille des pochettes du lot 1.
- `smali/com/melodix/music/NativeSettingsRowFactory.smali` — libellé précédent et accès discret au diagnostic.
- `smali/com/melodix/music/NativeUiRowFactory.smali` — présentation des lignes et sous-titres du lot 1.
- `smali/com/melodix/music/PreviewPlayerController.smali` — nouveau contrôleur d'horloge, boutons et diagnostic.
- `smali/com/melodix/music/PreviewPlayerController$1.smali` — temporisation de réconciliation du contrôleur.
- `smali/com/melodix/music/PreviewPlayerController$2.smali` — accès au diagnostic par appui long.
- `smali/com/melodix/music/PreviewPlayerController$3.smali` — copie du rapport local.
- `smali/com/melodix/music/a.smali` — format de temps du widget, déjà livré.

Aucun CSS n'a été modifié pour l'APK 1. Le rapport CI inclut également le diff des entrées de l'APK, notamment manifeste, signature, dex et ressources compilées.

## Fonctionnement et limites

La barre native utilise l'horloge monotone Android et synchronise mini/lecteur à partir du même état observé ; elle borne la position, gèle en pause ou en absence de progression fiable et cesse d'extrapoler après un échantillon périmé. Les petits écarts sont corrigés progressivement, les grands écarts se recalent. Les icônes lecture/pause se mettent à jour de façon optimiste puis sont réconciliées ; aucune limite du lot A ne s'applique à ces boutons, à suivant/précédent ou à la barre.

Pour ouvrir le diagnostic : **Réglages > À propos**, appui long sur « Melodix • Client Spotify Natif », puis « Copier ». Il rapporte seulement des durées et intervalles en mémoire. La réception du signal de commande par le pont n'est pas un accusé Spotify ; le diagnostic ne mesure pas le premier son.

Les tests ajoutés couvrent le contrôleur Java sur stubs JVM avec horloge simulée (dont deux minutes et pause), le shell DOM simulé, la garde et les cas de référence absente ou des sept fichiers modifiés. Tests locaux de non-régression : 55/55 et 77/77, plus tests Python ciblés. La CI est verte, y compris build/décodage/signature et garde finale. Les échecs connus de la suite racine historique restent hors périmètre et ne sont pas présentés comme corrigés.

**Non prouvé :** exécution ART et rendu sur téléphone, fréquence réelle, latence < 100 ms, comportement avec Spotify, buffering, premier son, commandes et retour/rotation réels. Ce candidat n'est donc pas déclaré conforme avant essais. [Plan téléphone et échecs attendus](plan-test-telephone-apk1.md). Le lot A n'est pas inclus.
