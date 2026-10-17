# Melodix

Melodix est une personnalisation d'une application Android fournie sous forme d'APK. Le dépôt conserve l'archive SpotiDuck d'origine intacte, les fichiers extraits, les APK de test et un projet décompilé éditable.

## Télécharger et installer

Les versions se trouvent dans [GitHub Releases](https://github.com/Souxch06/Melodix/releases). Depuis un téléphone Android, ouvre la pré-release, télécharge l'APK puis touche le fichier téléchargé pour lancer l'installation. Les versions de test récentes sont signées avec la même clé pour permettre une mise à jour sans désinstallation.

## Fichiers du dépôt

- `SpotiDuck-v1.2.2-3d2c473.zip` : archive d'origine, conservée sans modification.
- `SpotiDuck-v1.2.2-3d2c473/` : contenu décompressé de l'archive d'origine.
- `Melodix-v1.2.2-3d2c473/` : contenu de l'APK Melodix courant, extrait à plat.
- `android/apktool-project/` : projet Apktool complet de la version de test courante, avec ressources, assets et Smali.
- `Melodix-v1.2.2-test*.apk` : APK de test déjà construits.

Le dossier Apktool est **décompilé** depuis l'APK ; ce n'est pas le projet Android Kotlin/Gradle original, qui n'était pas fourni dans l'archive.

## Releases sans commandes locales

Le workflow GitHub Actions `.github/workflows/release-apk.yml` permet de construire ou d'attacher un APK depuis l'interface GitHub. Il sera actif sur `main` après intégration de ce changement.

- Pour rattacher l'APK déjà construit de test.7 à sa release, ouvre **Actions → Build APK and attach to GitHub Release → Run workflow**, indique `v1.2.2-test.7` et laisse `rebuild` désactivé. Cette opération réutilise l'APK signé déjà commité.
- Pour une nouvelle version, configure d'abord les secrets GitHub Actions `MELODIX_KEYSTORE_B64` et `MELODIX_KEYSTORE_PASSWORD` dans **Settings → Secrets and variables → Actions** (ajoute aussi `MELODIX_KEY_PASSWORD` si le mot de passe de la clé diffère de celui du keystore), puis crée et publie une release depuis **Releases** ciblant la branche principale, avec un tag tel que `v1.2.2-test.8`. L'action construit l'APK signé et ajoute aussi son fichier SHA-256.

La clé privée n'est volontairement **pas** dans le dépôt public. Sans ces secrets, l'action peut rattacher un APK déjà présent, mais ne peut pas fabriquer une mise à jour signée avec la même identité.
