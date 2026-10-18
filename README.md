# Melodix

<p align="center"><img src="android/branding/melodix-icon-master.png" alt="Icône Melodix — onde musicale en forme de M" width="176"></p>

Application Android personnalisée à partir d'un APK. Le dépôt contient l'archive originale, son extraction et le projet Apktool décompilé qui sert aux modifications.

## Version de test conservée

La release Preview conservée est la **V1**, reconstruite à partir du code de la test.18 (`v1.2.2-test.18-preview`, commit `81ef774fcb2208d4c4e999943411040aa1bfa33f`). Son tag est `v1.2.2-test.1-preview`. Les anciennes releases de test et leurs tags ont été retirés; l'historique des commits du dépôt reste intact.

La V1 est une application d'essai séparée, d'identifiant `com.melodix.music.preview`. Elle s'installe à côté de l'application normale `com.melodix.music`, avec des données séparées. Son `versionCode` Android reste supérieur à celui de l'ancienne Preview test.27 afin de permettre une mise à jour sans désinstaller la Preview déjà installée. Cette version reprend volontairement le comportement V18; les protections ajoutées dans les versions ultérieures n'y sont pas incluses.

Les versions publiées se trouvent dans [GitHub Releases](https://github.com/Souxch06/Melodix/releases). Sur Android, ouvre la release V1, télécharge l'APK puis touche le fichier téléchargé pour l'installer.

## Arborescence

- `source/SpotiDuck-v1.2.2-3d2c473.zip` : archive originale, **inchangée**.
- `source/SpotiDuck-v1.2.2-3d2c473/` : contenu extrait de cette archive.
- À la racine (`AndroidManifest.xml`, `apktool.yml`, `assets/`, `smali/`, `res/`, `lib/`, `kotlin/`, `META-INF/`, `original/`, `unknown/`) : projet Apktool décompilé et modifiable, remis à la base V18.
- `android/apk-extracted/` : extraction brute historique de l'APK d'origine.
- `android/branding/melodix-icon-master.png` : image maître de la nouvelle icône.
- `android/apktool-framework/1.apk` : framework requis par Apktool pour reconstruire les ressources.

Les APK archivés des anciennes versions ont été retirés du répertoire `releases/apk/`. Le projet Apktool est **décompilé** depuis un APK; ce n'est pas le projet Kotlin/Java/Gradle original, qui n'était pas fourni dans l'archive.

## Releases depuis GitHub

Les workflows de publication sont disponibles dans l'onglet **Actions**.

- `Build APK and attach to GitHub Release` sert aux versions normales du package `com.melodix.music`; elle nécessite la clé de signature de l'application normale.
- `Build Melodix Preview APK` construit l'application d'essai séparée `com.melodix.music.preview`, signée avec la clé Preview.

Pour reconstruire la V1, ajoute les secrets Actions `MELODIX_PREVIEW_KEYSTORE_B64` et `MELODIX_PREVIEW_KEYSTORE_PASSWORD` (et `MELODIX_PREVIEW_KEY_PASSWORD` uniquement si le mot de passe de la clé est différent), puis lance **Actions → Build Melodix Preview APK → Run workflow** sur la branche de travail. Le tag par défaut est `v1.2.2-test.1-preview`; le commit source par défaut est le commit V18 `81ef774fcb2208d4c4e999943411040aa1bfa33f`. Le workflow ajuste le `versionCode` Android pour permettre la mise à jour de la Preview précédente.

Le guide détaillé est dans [`docs/preview-apk.md`](docs/preview-apk.md). **Ne mets jamais un fichier de signature ni ses mots de passe dans le dépôt.**
