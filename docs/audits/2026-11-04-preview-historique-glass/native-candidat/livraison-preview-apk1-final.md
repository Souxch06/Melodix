# APK 1 — diagnostic processus et ouverture playlist (non testée sur téléphone)

- [Archive CI 43719039472](https://github.com/Souxch06/Melodix/actions/runs/43719039472/artifacts/14163523141), nom de l'archive `Melodix-Preview-lot1`, fichier `Melodix-Preview-historique-glass.apk` ; package `com.melodix.music.preview`, versionCode **1022122**, versionName `1.2.2-d0f206b-glass`.
- Source `d60089c91432c73490a291427a95d696e081c262` ; SHA-256 de l'APK signée `0f769af3d83bc3b243fcc9221262701c5e67ce81157826b1f1f83039dc738af6` ; SHA-256 de l'archive ZIP GitHub `b40bb20f4533d9ec8d3a0b54324b2d71a1fc69c7a1f0e6fec8ff1a17559c92ec`.
- Signature Preview et comparaison effective avec 9016 signée : [CI verte](https://github.com/Souxch06/Melodix/actions/runs/43719039472), garde bloquante avant upload. Les anciennes archives sont conservées : [APK 1 code 1022121](livraison-preview-apk1-suivi.md), [APK 1 code 1022120](livraison-preview-apk1.md), [suivi code 1022119](livraison-preview-lot1-suivi.md) et [référence 9016](https://github.com/Souxch06/Melodix/actions/runs/43701210947/artifacts/14156257401).

## Garde signée — SHA-256 des sept fichiers, côte à côte

| Fichier | 9016 signée | APK 1 code 1022122 signée | Résultat |
|---|---|---|---|
| `spotify_bridge.js` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | `cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` | identique |
| `classic_login.js` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | `f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7` | identique |
| `desktop_spoof.js` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | `f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110` | identique |
| `google_spoof.js` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | `c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372` | identique |
| `facebook_consent.js` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | `8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019` | identique |
| `adblock_hosts.txt` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c` | identique |
| `playlist_sort.js` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | `3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7` | identique |

## Diff exact contre 9016 et justification

La CI relève les mêmes **17 fichiers décodés** que l'APK 1 précédente, avec les mêmes catégories de justification : [liste exacte des 17 chemins et raisons](livraison-preview-apk1-suivi.md#diff-décodé-exact-contre-9016-et-raisons). En plus des changements déjà décrits, le contrôleur utilise l'API publique Android 12+ de début de processus pour le diagnostic. `apktool.yml` porte le nouveau code version. Le rapport détaillé et le diff des entrées de l'APK sont dans l'archive. Aucun CSS modifié et aucune modification des sept fichiers protégés.

## Fonctionnement, tests et limites

- L'horloge monotone et les barres mini/full, l'optimisme lecture/pause et les mesures déjà décrites sont conservés. L'absence de progression fiable fige la dernière position quand le titre est certainement le même ; sinon elle devient inconnue. Pas de limite lot A sur les boutons du lecteur. Aucun lot A intégré.
- Nouveau champ copiable « processus → prochaine frame accueil avec données » sur Android 12 ou plus, via `Process.getStartElapsedRealtime()` ; sur Android 11 ou moins, `—` sans appel à cette API. C'est une approximation **depuis la création du processus**, pas depuis l'appui sur le lanceur ni jusqu'à la présentation effective de l'écran ; après arrêt forcé elle sert de repère pour un démarrage à froid. Les champs activité → frame et appui playlist → frame sont conservés ; une playlist vide, un autre format d'URI, une rotation ou une ligne inexploitable peuvent donner `—`. Aucune donnée sensible dans le diagnostic.
- Contrôleur Java réel sur stubs JVM : horloge, pause, seek simulé, deux minutes simulées, invalidité même/différent titre, timeout et message, mesures et confidentialité ; vérification explicite des branches Android ≥12 et ≤11 sur stubs. Cinq tests structurels sur entrée et APK redécodée, 13 tests Node ciblés, build/décodage et sept actifs locaux. La CI a exécuté les tests prévus, signé et comparé les deux APK signées.
- Ces tests ne prouvent pas les comportements Spotify, l'audio, le rendu et la latence sur téléphone. Le temps « interface confirmée » est pris après mutation des vues, pas après présentation effective. Les mesures de cinq ouvertures de playlist et de cinq démarrages à froid restent à faire sur téléphone ; ne pas optimiser avant ces mesures.

[Plan téléphone](plan-test-telephone-apk1-final.md). Un essai Android hors ligne est suivi séparément, sans remplacer l'essai téléphone.
