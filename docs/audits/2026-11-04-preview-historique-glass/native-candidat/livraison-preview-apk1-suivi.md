# APK 1 — suivi diagnostic et valeur fiable (non testée sur téléphone)

- [APK 1 suivie, archive CI](https://github.com/Souxch06/Melodix/actions/runs/43717824064/artifacts/14163083011), archive `Melodix-Preview-lot1`, fichier `Melodix-Preview-historique-glass.apk` ; package `com.melodix.music.preview`, versionCode **1022121**, versionName `1.2.2-d0f206b-glass`.
- Source `a3beb4408bc41ca5df047eda06d723b19e78f0af` ; SHA-256 APK signée `7a8c75562f532a209a8d33e9f91917d977db91454468c6c926bd870385a31473` ; SHA-256 ZIP GitHub `2c78be1b974d268d324caa54e9ac32cf1e4ccfc89511b93c0b789e5ac35c8a9b`.
- [CI 43717824064](https://github.com/Souxch06/Melodix/actions/runs/43717824064) verte : signature Preview, comparaison des deux APK signées et garde obligatoire avant upload. Les noms identiques sont dans des runs/archives distincts et n'écrasent pas l'ancienne APK.
- APK 1 précédente, code 1022120 : [archive conservée](https://github.com/Souxch06/Melodix/actions/runs/43716976584/artifacts/14162699076), SHA `5c11793e9439764c8ee462a668605baa0ead957e89e7f6e4c6c812cc2c174f27` ; [livraison et plan](livraison-preview-apk1.md). Référence 9016 : [archive](https://github.com/Souxch06/Melodix/actions/runs/43701210947/artifacts/14156257401).

## Garde signée — SHA-256 des sept fichiers, côte à côte

| Fichier | 9016 signée | APK 1 suivie signée | Résultat |
|---|---|---|---|
| `spotify_bridge.js` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | identique |
| `classic_login.js` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | identique |
| `desktop_spoof.js` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | identique |
| `google_spoof.js` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | identique |
| `facebook_consent.js` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | identique |
| `adblock_hosts.txt` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | identique |
| `playlist_sort.js` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | identique |

## Diff décodé exact contre 9016 et raisons

La liste CI contient exactement ces 17 fichiers : `apktool.yml` (version) ; `assets/native_ui_shell.js` (échantillons/commandes) ; `res/drawable/native_cover_placeholder.xml`, `res/layout/activity_main.xml`, `res/values/strings.xml` (interface et identité préexistantes du lot 1) ; `smali/androidx/activity/b.smali` (retour) ; `smali/com/melodix/music/MainActivity.smali` (navigation, lecteur, diagnostics) ; `NativeHomeFeed.smali`, `NativeHomeShelfPreview.smali`, `NativeImageLoader.smali`, `NativeSettingsRowFactory.smali`, `NativeUiRowFactory.smali` (présentation et accès diagnostic) ; `PreviewPlayerController.smali` et ses trois classes internes `$1`, `$2`, `$3` (contrôleur et diagnostic) ; `a.smali` (temps widget). Les huit noms sans préfixe sont sous `smali/com/melodix/music/`. Aucun CSS modifié. Le rapport complet et le diff des entrées compilées sont dans l'archive CI.

## Changements depuis 1022120 et preuves

- Un échantillon de position invalide fige la dernière valeur fiable **si le même titre est identifié avec certitude** ; si le titre est inconnu ou différent, on affiche l'état inconnu plutôt que d'attribuer l'ancienne position à un autre titre.
- Une commande lecture/pause non confirmée est réconciliée après huit secondes avec un message discret, sans nouvelle commande ni limite lot A. Cela ne prouve pas un échec de Spotify.
- Diagnostic copiable : délai de création de l'activité à la prochaine préparation de frame d'accueil avec données ; délai appui playlist à la prochaine préparation de frame contenant au moins un titre. Pas d'identifiant dans le rapport, aucune requête ajoutée. Playlist vide, URI autre que `spotify:playlist:…`, fermeture/rotation ou absence de ligne exploitable peuvent donner `—`. Ce n'est **ni le temps total de démarrage à froid depuis le lanceur**, ni la présentation effective de la frame ou le premier son. Il faut donc des mesures externes complémentaires.
- Tests du contrôleur Java sur stubs Android avec horloge fictive : maintien/gel de position, changement inconnu, expiration et message, mesures avec contexte correspondant ou non, confidentialité et deux minutes simulées. Cinq tests structurels sur entrée puis APK redécodée, 13 tests Node ciblés, compilation/décodage local et contrôle 7/7 local. La CI répète ses contrôles, puis compare les deux APK signées. Aucune simulation ne vaut test ART/Spotify/téléphone.

[Plan téléphone spécifique](plan-test-telephone-apk1-suivi.md). Lot A non inclus.

## Essai Android additionnel hors ligne

[Run 43718636412](https://github.com/Souxch06/Melodix/actions/runs/43718636412) : téléchargement de **l'APK signée exacte** ci-dessus et contrôle SHA, émulateur Android 15 x86_64 neuf sans compte, absence de réseau par défaut vérifiée avant installation/lancement, activité reprise puis encore reprise après rotation paysage et portrait. Cela exerce un chemin de démarrage ART et les changements d'orientation, pas Spotify, le rendu des listes, le son, les commandes, le retour, la latence ou un téléphone. Les quatre tests du script avec faux `adb` vérifient notamment que l'installation ne démarre pas si le réseau par défaut subsiste ou si le SHA est faux.

Un [premier run 43718370594](https://github.com/Souxch06/Melodix/actions/runs/43718370594) avait échoué dans l'étape d'émulateur, sans cause déterminable depuis les annotations ; ses logs complets n'étaient pas accessibles dans cet environnement. Le second run ajoute des annotations de phase et a réussi avec la même APK. Ne pas assimiler ce succès à une preuve de fiabilité générale.

Les timestamps « interface optimiste/confirmée » sont pris après la mutation synchrone de l'interface native, non après présentation effective à l'écran ; un seuil de latence visible doit être mesuré séparément.
