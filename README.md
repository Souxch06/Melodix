# Melodix

Application Android personnalisée à partir d'un APK. Le dépôt est organisé pour pouvoir parcourir les fichiers d'origine, l'extraction brute de l'APK et le projet décompilé qui sert aux modifications.

## Installer une version

Les versions publiées se trouvent dans [GitHub Releases](https://github.com/Souxch06/Melodix/releases). Sur Android, ouvre une release, télécharge son APK puis touche le fichier téléchargé pour l'installer. Les tests.5 à .7 gardent la même signature pour permettre les mises à jour sans désinstallation.

## Arborescence

- `source/SpotiDuck-v1.2.2-3d2c473.zip` : archive originale, **inchangée**.
- `source/SpotiDuck-v1.2.2-3d2c473/` : contenu extrait de cette archive.
- `android/apk-extracted/` : contenu brut de l'APK Melodix test.7, notamment `classes.dex`, `resources.arsc`, les ressources, les assets et les bibliothèques.
- `android/apktool-project/` : projet décompilé complet utilisé pour modifier et reconstruire l'application, dont les sources Smali lisibles.
- `android/apktool-framework/1.apk` : framework requis par Apktool pour rebâtir les ressources.
- `releases/apk/` : APK signés des tests.3 à .7 et leurs fichiers de somme SHA-256. Les APK test.3 et test.4 sont conservés pour l'historique; ils sont remplacés par les tests plus récents.

Le projet Apktool est **décompilé** depuis un APK. Ce n'est pas le projet Kotlin/Java/Gradle original, qui n'était pas fourni dans l'archive.

## Releases depuis GitHub, sans commandes locales

Le workflow `.github/workflows/release-apk.yml` sera disponible dans l'onglet **Actions** après intégration de la PR dans `main`.

- Pour ajouter l'APK test.7 à sa release déjà publiée, ouvre **Actions → Build APK and attach to GitHub Release → Run workflow**, indique `v1.2.2-test.7` et laisse **rebuild** désactivé. Le workflow reprend l'APK signé dans `releases/apk/` et téléverse aussi son checksum.
- Pour une nouvelle version, configure d'abord les secrets Actions `MELODIX_KEYSTORE_B64` et `MELODIX_KEYSTORE_PASSWORD` (ajoute `MELODIX_KEY_PASSWORD` uniquement si le mot de passe de la clé est différent), puis crée et publie depuis **Releases** un tag tel que `v1.2.2-test.8` ciblant `main`. L'action construit l'APK signé et le joint à la release.

La clé privée n'est jamais conservée dans le dépôt public. Sans ces secrets, l'action peut téléverser un APK déjà construit, mais ne peut pas signer une nouvelle version avec la même identité.
