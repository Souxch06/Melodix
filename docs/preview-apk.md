# Créer et publier l'APK Melodix Preview

La Preview est une application d'essai séparée, identifiant `com.melodix.music.preview`, nommée **Melodix Preview**. Elle s'installe à côté de l'application normale `com.melodix.music` sans la désinstaller et garde ses propres données. La release actuelle est la **test.4** (`v1.2.2-test.4-preview`, release `id=422316210`), construite depuis le commit `719f9ec5775182d8e3abf58e93b375f513fe6ebf` — c'est la seule release de test conservée depuis le nettoyage du 2026-10-24. Elle garde le dock mobile et le mini-lecteur visibles même lorsque le lecteur Spotify est déplié, et couvre les écrans portrait jusqu'à 820 px CSS. Les anciennes releases de test (`test.1`, `test.2`, `test.3`) ont été supprimées le 2026-10-24 avec leurs tags ; leurs APK restaient téléchargeables depuis leurs pages de release historiques avant suppression.

La Preview doit être signée avec sa propre clé. Conserve cette clé pour les prochaines versions afin qu'elles puissent mettre à jour la même application.

## 1. Créer la clé Preview sur Windows

Il faut un JDK contenant `keytool`. Si PowerShell dit que `keytool` est introuvable, installe un JDK 17 puis rouvre PowerShell.

Ouvre PowerShell et exécute cette commande :

```powershell
keytool -genkeypair -v -keystore "$env:USERPROFILE\Documents\melodix-preview.jks" -alias MELODIX_PREVIEW -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Melodix Preview, OU=Testing, O=Melodix, C=FR"
```

Choisis un mot de passe long pour le keystore et conserve-le dans un gestionnaire de mots de passe. Lorsque `keytool` demande le mot de passe de la clé `MELODIX_PREVIEW`, appuie sur Entrée pour réutiliser celui du keystore. La saisie des mots de passe ne s'affiche pas dans PowerShell.

Le fichier créé est :

```text
%USERPROFILE%\Documents\melodix-preview.jks
```

Garde ce fichier et son mot de passe dans un endroit sûr. Ne les envoie pas dans le chat et ne les ajoute pas au dépôt Git.

## 2. Ajouter les secrets GitHub

Dans le dépôt GitHub : **Settings → Secrets and variables → Actions → New repository secret**. Crée ces secrets du dépôt (pas des Variables) :

1. `MELODIX_PREVIEW_KEYSTORE_B64`
2. `MELODIX_PREVIEW_KEYSTORE_PASSWORD`
3. `MELODIX_PREVIEW_KEY_PASSWORD` seulement si tu as choisi un mot de passe de clé différent; sinon, omets-le.

Pour préparer la valeur de `MELODIX_PREVIEW_KEYSTORE_B64`, exécute dans PowerShell :

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("$env:USERPROFILE\Documents\melodix-preview.jks")) | Set-Clipboard
```

Cette commande copie le texte encodé dans le presse-papiers sans l'afficher. Colle-le directement dans le champ **Value** du secret `MELODIX_PREVIEW_KEYSTORE_B64`. Pour le secret du mot de passe, saisis le mot de passe du keystore. N'envoie aucune de ces valeurs dans le chat.

## 3. Publier une version Preview

Pour reproduire la release mobile test.3 :

1. Sur GitHub, ouvre le dépôt puis l'onglet **Actions**.
2. Sélectionne **Build Melodix Preview APK** et clique **Run workflow** sur la branche de travail.
3. Saisis le tag `v1.2.2-test.4-preview` et le commit source `719f9ec5775182d8e3abf58e93b375f513fe6ebf`, puis lance le workflow avec `publish_release: true` si — et seulement si — tu autorises explicitement une publication.
4. Attends que le run soit terminé avec l'état vert **Success**.

Le workflow publie `Melodix Preview v1.2.2 test.4` et y attache `Melodix-Preview-v1.2.2-test4.apk` ainsi que son fichier `.sha256`. Avec la même clé Preview, elle met à jour l'application Preview déjà installée. Elle ne remplace pas l'application normale et ne nécessite pas sa désinstallation.

Après installation, vérifie que tu as lancé **Melodix Preview** et que **Paramètres → GUI Mode** est réglé sur **CSS+JS Mobile**. C'est ce mode qui active les styles et la navigation mobile.

Pour reconstruire l'ancienne base V18, choisis le tag `v1.2.2-test.1-preview` et le commit source `81ef774fcb2208d4c4e999943411040aa1bfa33f`.

Pour une version suivante, choisis un nouveau tag test et le commit source voulu; garde la même clé Preview. Le workflow augmente le `versionCode` au-dessus de l'ancienne Preview test.27. Il adapte uniquement sa copie temporaire du projet à la signature Preview et au `versionCode`; le projet source et la signature de l'application normale restent inchangés.

## Si le workflow échoue

- S'il indique que les secrets de signature sont absents, vérifie leur nom exact dans **Settings → Secrets and variables → Actions**.
- S'il indique une erreur de keystore ou d'alias, ne crée pas une autre clé pour remplacer celle-ci : corrige la configuration de cette même clé. L'alias attendu est `MELODIX_PREVIEW`.
- Si `keytool` est introuvable, installe un JDK 17 et relance PowerShell.

Conserve le keystore Preview et son mot de passe : les versions Preview suivantes devront être signées avec cette même clé pour pouvoir mettre à jour l'application Preview déjà installée.
