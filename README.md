# Melodix

<p align="center"><img src="android/branding/melodix-icon-master.png" alt="Icône Melodix — onde musicale en forme de M" width="176"></p>

Application Android personnalisée à partir d'un APK. Le dépôt est organisé pour parcourir l'archive d'origine, l'extraction brute des APK et le projet décompilé qui sert aux modifications.

## Installer une version

Les versions publiées se trouvent dans [GitHub Releases](https://github.com/Souxch06/Melodix/releases). Sur Android, ouvre une release, télécharge l'APK puis touche le fichier téléchargé pour l'installer. Les tests.5 à .7 gardent la même signature pour permettre les mises à jour sans désinstallation.

## Arborescence

- `source/SpotiDuck-v1.2.2-3d2c473.zip` : archive originale, **inchangée**.
- `source/SpotiDuck-v1.2.2-3d2c473/` : contenu extrait de cette archive.
- `android/apk-extracted/` : extraction brute de l'APK test.7, avec `classes.dex`, `resources.arsc`, les ressources, assets et bibliothèques.
- `android/apktool-project/` : projet décompilé complet et modifiable, avec les sources Smali lisibles. Il inclut maintenant la nouvelle icône Melodix.
- `android/branding/melodix-icon-master.png` : image maître de la nouvelle icône de l'application.
- `android/apktool-framework/1.apk` : framework requis par Apktool pour reconstruire les ressources.
- `releases/apk/` : APK signés des tests.3 à .7 et leurs fichiers SHA-256. Les tests.3 et .4 sont conservés comme historique; ils sont remplacés par les tests plus récents.

La page GitHub Releases ne conserve que la test.7; les pages et tags test.1 à test.6 ont été retirés. Leurs APK pertinents restent dans `releases/apk/` pour l'historique. Les APK publiés et l'extraction brute sont des instantanés des tests précédents : la nouvelle icône est intégrée au projet Apktool pour la prochaine compilation. Le projet Apktool est **décompilé** depuis un APK; ce n'est pas le projet Kotlin/Java/Gradle original, qui n'était pas fourni dans l'archive.

## Releases depuis GitHub, sans commandes locales

Le workflow `.github/workflows/release-apk.yml` sera disponible dans l'onglet **Actions** après intégration de la PR dans `main`.

- Pour ajouter l'APK test.7 déjà publié à sa release, ouvre **Actions → Build APK and attach to GitHub Release → Run workflow**, indique `v1.2.2-test.7` et laisse **rebuild** désactivé. Cela téléverse l'APK existant et son checksum; il n'inclut pas encore la nouvelle icône.
- Pour publier la nouvelle icône dans une APK, configure les secrets Actions `MELODIX_KEYSTORE_B64` et `MELODIX_KEYSTORE_PASSWORD` (ajoute `MELODIX_KEY_PASSWORD` seulement si le mot de passe de la clé est différent), puis crée et publie une release de test, par exemple `v1.2.2-test.8`, ciblant `main`. Le workflow construira et signera l'APK avant de l'attacher.

La clé privée n'est jamais conservée dans le dépôt public. Sans les secrets de signature, le workflow peut téléverser les APK déjà construits, mais ne peut pas créer une mise à jour signée avec la même identité.
