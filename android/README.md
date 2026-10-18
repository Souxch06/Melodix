# Projet Android décompilé

Le projet Apktool modifiable est placé directement à la racine du dépôt, comme dans Melodix version 1 : `AndroidManifest.xml`, `apktool.yml`, `assets/`, `smali/`, `res/`, `lib/`, `kotlin/`, `META-INF/`, `original/` et `unknown/`. Les workflows copient uniquement ces entrées dans un dossier temporaire de build; le dépôt et ses autres documents ne sont pas inclus dans l'APK.

- `apk-extracted/` est l'extraction brute de l'APK Melodix test.7 : manifeste, `classes.dex`, ressources, assets, bibliothèques et métadonnées de signature.
- `branding/melodix-icon-master.png` est l'image maître de l'icône Melodix.
- `apktool-framework/1.apk` est le framework Android requis par Apktool pour reconstruire les ressources; il ne fait pas partie de l'APK Melodix.

Le projet Apktool fournit les ressources et le Smali décompilés, pas les sources Kotlin/Java/Gradle originales qui n'étaient pas dans l'archive.

## Publication depuis GitHub

Le workflow `.github/workflows/release-apk.yml` peut réutiliser un APK signé déjà commité ou rebâtir le projet, le signer et l'attacher à une release avec son checksum. Une nouvelle compilation normale nécessite les secrets GitHub Actions `MELODIX_KEYSTORE_B64` et `MELODIX_KEYSTORE_PASSWORD`; ajoute aussi `MELODIX_KEY_PASSWORD` si le mot de passe de la clé diffère. Le workflow Preview utilise ses propres secrets `MELODIX_PREVIEW_KEYSTORE_B64` et `MELODIX_PREVIEW_KEYSTORE_PASSWORD`. Aucun keystore n'est commité dans le dépôt public.
