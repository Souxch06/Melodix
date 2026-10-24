# Melodix

<p align="center"><img src="android/branding/melodix-icon-master.png" alt="Icône Melodix — onde musicale en forme de M" width="176"></p>

Application Android personnalisée à partir d'un APK. Le dépôt contient l'archive originale, son extraction et le projet Apktool décompilé qui sert aux modifications.

## Versions Preview de test

La dernière release est la **Preview test.3** : [`v1.2.2-test.3-preview`](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.3-preview), construite depuis le commit `576d9fade2d71c75b795a6bdb67300388a26fe2e`. Elle applique le dock mobile Accueil / Recherche / Bibliothèque et le mini-lecteur même lorsque le lecteur Spotify est déplié; le seuil portrait couvre maintenant jusqu'à 820 px CSS. Les titres et pochettes restent ceux du compte Spotify; aucun contenu fictif des maquettes n'est embarqué. L'APK s'appelle `Melodix-Preview-v1.2.2-test3.apk` et son fichier SHA-256 est joint à la release.

La Preview est une application d'essai séparée, d'identifiant `com.melodix.music.preview`, avec des données séparées. Elle s'installe à côté de l'application normale `com.melodix.music`, sans désinstaller celle-ci. Son `versionCode` Android (`1020231`) permet aussi de mettre à jour la Preview test.2 avec la même clé de signature. Les releases précédentes restent disponibles : test.2 [`v1.2.2-test.2-preview`](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.2-preview) et V1 [`v1.2.2-test.1-preview`](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.1-preview), build exact du commit V18 `81ef774fcb2208d4c4e999943411040aa1bfa33f`.

La compilation et la vérification de signature/package ont réussi pour la test.3; aucun appareil ni émulateur n'a été testé pour cette version. Sur Android, ouvre la release test.3, télécharge l'APK puis touche le fichier téléchargé pour l'installer.

## Arborescence

- `source/SpotiDuck-v1.2.2-3d2c473.zip` : archive originale, **inchangée**.
- `source/SpotiDuck-v1.2.2-3d2c473/` : contenu extrait de cette archive.
- À la racine (`AndroidManifest.xml`, `apktool.yml`, `assets/`, `smali/`, `res/`, `lib/`, `kotlin/`, `META-INF/`, `original/`, `unknown/`) : projet Apktool décompilé et modifiable, remis à la base V18.
- `android/apk-extracted/` : extraction brute historique de l'APK d'origine.
- `android/branding/melodix-icon-master.png` : image maître de la nouvelle icône.
- `android/apktool-framework/1.apk` : framework requis par Apktool pour reconstruire les ressources.

Les APK archivés des anciennes versions ont été retirés du répertoire `releases/apk/`. Le projet Apktool est **décompilé** depuis un APK; ce n'est pas le projet Kotlin/Java/Gradle original, qui n'était pas fourni dans l'archive.

## Intégration continue, artefacts de développement et Releases GitHub

Les workflows d'automatisation sont disponibles dans l'onglet **Actions** (protocole complet dans [`AGENTS.md`](AGENTS.md) et [`CHANGELOG.md`](CHANGELOG.md)) :

- **À chaque `push` sur une branche de développement** (toutes branches hors `main`, tags ignorés pour éviter toute boucle) :
  1. `verify` (`.github/workflows/test-preview-emulator.yml`, `contents: read`) valide d'abord les `189` tests Node/Dalvik, la signature APK et l'émulateur Android 15 (`API 35 x86_64`).
  2. Si et seulement si tous les contrôles réussissent, `Build Melodix Preview APK` alloue un tag de pré-version unique (`v1.2.2-test.2-preview`, `v1.2.2-test.3-preview`, …) et publie automatiquement sur [GitHub Releases](https://github.com/Souxch06/Melodix/releases) l'APK signé (`com.melodix.music.preview`), son `.sha256` et son `build-manifest.json` (`prerelease: true`, `overwrite_files: false`), sans jamais écraser les versions précédentes ni publier de version stable officielle.
- **Versions stables/officielles** :
  - `Build APK and attach to GitHub Release` reste strictement manuel / déclenché uniquement sur publication explicite d'une release de l'application principale `com.melodix.music`.

Pour configurer la signature Preview, ajoute les secrets Actions `MELODIX_PREVIEW_KEYSTORE_B64` et `MELODIX_PREVIEW_KEYSTORE_PASSWORD` (et `MELODIX_PREVIEW_KEY_PASSWORD` uniquement si le mot de passe de la clé est différent). Le guide détaillé est dans [`docs/preview-apk.md`](docs/preview-apk.md). **Ne mets jamais un fichier de signature ni ses mots de passe dans le dépôt.**
