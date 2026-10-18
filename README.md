# Melodix

<p align="center"><img src="android/branding/melodix-icon-master.png" alt="Icône Melodix — onde musicale en forme de M" width="176"></p>

Application Android personnalisée à partir d'un APK. Le dépôt contient l'archive originale, son extraction et le projet Apktool décompilé qui sert aux modifications.

## Versions Preview de test

La dernière release est la **Preview test.2** : [`v1.2.2-test.2-preview`](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.2-preview), construite depuis le commit `750834e20eca6f240a84ef164ce492f989e29458`. Elle applique le dock mobile Accueil / Recherche / Bibliothèque, le mini-lecteur compact et la fermeture de la bibliothèque à la page Spotify réelle. Les titres et pochettes restent ceux du compte Spotify; aucun contenu fictif des maquettes n'est embarqué. L'APK s'appelle `Melodix-Preview-v1.2.2-test2.apk` et son fichier SHA-256 est joint à la release.

La Preview est une application d'essai séparée, d'identifiant `com.melodix.music.preview`, avec des données séparées. Elle s'installe à côté de l'application normale `com.melodix.music`, sans désinstaller celle-ci. Son `versionCode` Android (`1020230`) permet aussi de mettre à jour la Preview test.1 avec la même clé de signature. La release V1, tag [`v1.2.2-test.1-preview`](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.1-preview), reste disponible comme build exact du commit V18 `81ef774fcb2208d4c4e999943411040aa1bfa33f`.

La compilation et la vérification de signature/package ont réussi pour la test.2; aucun appareil ni émulateur n'a été testé pour cette version. Sur Android, ouvre la release test.2, télécharge l'APK puis touche le fichier téléchargé pour l'installer.

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
