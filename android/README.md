# Projet Android décompilé

`apk-extracted/` est l'extraction brute du contenu de l'APK Melodix test.7 : manifeste, `classes.dex`, ressources, assets, bibliothèques et métadonnées de signature. Elle permet d'inspecter chaque entrée du paquet original.

`apktool-project/` est le projet Apktool décompilé depuis le même APK, avec les ressources Android, les assets Web et les sources Smali. Il permet de modifier/reconstruire l'application, mais ne remplace pas les sources Kotlin/Gradle originales, qui ne figuraient pas dans l'archive d'origine.

`apktool-framework/1.apk` est le framework Android requis par Apktool pour reconstruire les ressources de cette application. Il ne fait pas partie de l'APK Melodix.

## Publication depuis GitHub

Le workflow `.github/workflows/release-apk.yml` peut soit réutiliser un APK signé déjà commité, soit rebâtir le projet puis l'attacher à une release avec son checksum. Pour créer une nouvelle version mise à jour, ajoutez dans **Settings → Secrets and variables → Actions** les secrets `MELODIX_KEYSTORE_B64` (keystore encodé en Base64) et `MELODIX_KEYSTORE_PASSWORD`. Ajoutez aussi `MELODIX_KEY_PASSWORD` si le mot de passe de la clé diffère de celui du keystore; sinon le workflow réutilise le même mot de passe. Le keystore n'est jamais commité dans ce dépôt public.
