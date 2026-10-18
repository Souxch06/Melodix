# Melodix

<p align="center"><img src="android/branding/melodix-icon-master.png" alt="Icône Melodix — onde musicale en forme de M" width="176"></p>

Application Android personnalisée à partir d'un APK. Le dépôt est organisé pour parcourir l'archive d'origine, l'extraction brute des APK et le projet décompilé qui sert aux modifications.

## Installer une version

Les versions publiées se trouvent dans [GitHub Releases](https://github.com/Souxch06/Melodix/releases). Sur Android, ouvre une release, télécharge l'APK puis touche le fichier téléchargé pour l'installer. Les tests.5 à .7 gardent la même signature pour permettre les mises à jour sans désinstallation.

## Arborescence

- `source/SpotiDuck-v1.2.2-3d2c473.zip` : archive originale, **inchangée**.
- `source/SpotiDuck-v1.2.2-3d2c473/` : contenu extrait de cette archive.
- À la racine (`AndroidManifest.xml`, `apktool.yml`, `assets/`, `smali/`, `res/`, `lib/`, `kotlin/`, `META-INF/`, `original/`, `unknown/`) : projet Apktool décompilé complet et modifiable. Les ressources, assets et sources Smali sont directement visibles à la racine, dans l'organisation de Melodix version 1.
- `android/apk-extracted/` : extraction brute de l'APK test.7, avec `classes.dex`, `resources.arsc`, les ressources, assets et bibliothèques.
- `android/branding/melodix-icon-master.png` : image maître de la nouvelle icône de l'application.
- `android/apktool-framework/1.apk` : framework requis par Apktool pour reconstruire les ressources.
- `releases/apk/` : APK signés des tests.3 à .7 et leurs fichiers SHA-256. Les tests.3 et .4 sont conservés comme historique; ils sont remplacés par les tests plus récents.

La page GitHub Releases ne conserve que la test.7; les pages et tags test.1 à test.6 ont été retirés. Leurs APK pertinents restent dans `releases/apk/` pour l'historique. Les APK publiés et l'extraction brute sont des instantanés des tests précédents : la nouvelle icône est intégrée au projet Apktool pour la prochaine compilation. Le projet Apktool est **décompilé** depuis un APK; ce n'est pas le projet Kotlin/Java/Gradle original, qui n'était pas fourni dans l'archive.

## Releases depuis GitHub

Les workflows de publication sont disponibles dans l'onglet **Actions**.

- `Build APK and attach to GitHub Release` sert aux versions normales du package `com.melodix.music`. Une mise à jour doit être signée avec la même clé que les APK test.5 à test.7; sans cette clé, Android ne l'acceptera pas comme mise à jour.
- `Build Melodix Preview APK` construit une application d'essai séparée, avec l'identifiant `com.melodix.music.preview`. Elle s'installe à côté de l'application normale, sans la désinstaller, mais possède des données séparées et ne la remplace pas. Elle utilise une nouvelle clé de prévisualisation.

Pour la prévisualisation, ajoute les secrets Actions `MELODIX_PREVIEW_KEYSTORE_B64` et `MELODIX_PREVIEW_KEYSTORE_PASSWORD` (et `MELODIX_PREVIEW_KEY_PASSWORD` uniquement si le mot de passe de la clé est différent). Puis lance **Actions → Build Melodix Preview APK → Run workflow** sur la branche qui contient les changements à tester (sans fusionner dans `main`); le tag par défaut est maintenant `v1.2.2-test.10-preview`, avec un versionCode supérieur à la test.9 et installable comme mise à jour de la Preview. Le workflow crée la pré-release GitHub et y ajoute l'APK et son checksum.

Le guide détaillé de création de la clé et de publication est dans [`docs/preview-apk.md`](docs/preview-apk.md). **Ne mets jamais un fichier de signature ni ses mots de passe dans le dépôt.**
