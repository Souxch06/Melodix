# Projet Android décompilé

- `apk-extracted/` est l'extraction brute de l'APK Melodix test.7 : manifeste, `classes.dex`, ressources, assets, bibliothèques et métadonnées de signature. Elle permet d'inspecter les entrées exactes de cet APK publié.
- `apktool-project/` est le projet Apktool décompilé depuis test.7, modifiable et reconstructible. La nouvelle icône Melodix est intégrée au lanceur, à l'écran de démarrage, aux widgets et aux aperçus des préférences pour la prochaine compilation.
- `branding/melodix-icon-master.png` est l'image maître de cette icône.
- `apktool-framework/1.apk` est le framework Android requis par Apktool pour reconstruire les ressources; il ne fait pas partie de l'APK Melodix.

Le projet Apktool fournit les ressources et le Smali décompilés, pas les sources Kotlin/Java/Gradle originales qui n'étaient pas dans l'archive.

## Publication depuis GitHub

Le workflow `.github/workflows/release-apk.yml` peut réutiliser un APK signé déjà commité ou rebâtir le projet, le signer et l'attacher à une release avec son checksum. Après intégration du workflow dans `main`, une nouvelle compilation nécessite les secrets GitHub Actions `MELODIX_KEYSTORE_B64` et `MELODIX_KEYSTORE_PASSWORD`. Ajoute aussi `MELODIX_KEY_PASSWORD` si le mot de passe de la clé diffère de celui du keystore; sinon le workflow réutilise le même. Le keystore n'est jamais commité dans le dépôt public.
