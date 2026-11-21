# Créer et publier l'APK Melodix Preview

La Preview est une application d'essai séparée, identifiant `com.melodix.music.preview`, nommée **Melodix Preview**. Elle s'installe à côté de l'application normale `com.melodix.music` sans la désinstaller et garde ses propres données.

La dernière release est **[v1.2.2-test.89-preview](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.89-preview)**, construite depuis le commit `5953424ed100a2232d3d8fba80c6a508c085e16d`. APK : [Melodix-Preview-v1.2.2-test89.apk](https://github.com/Souxch06/Melodix/releases/download/v1.2.2-test.89-preview/Melodix-Preview-v1.2.2-test89.apk). Son SHA-256 est `10ba68c341efa0e52c5c5bd53535d5f1b79fa07fddcb65637d88fdb2dab4ff8c`. Elle retire le clic automatique sur le CTA Spotify, susceptible d'ouvrir l'application Spotify native. **Le test sur l'appareil reste à faire** : la CI verte ne valide pas l'affichage réel.

Les versions plus anciennes sont supprimées après publication pour ne garder que la dernière release. Les tags et commits historiques restent disponibles. La Preview doit être signée avec sa propre clé; conserve cette même clé afin que les prochaines versions puissent mettre à jour l'application.

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

## 3. Publier ou installer une version Preview

La release à installer est toujours celle indiquée en haut de ce document. Pour `test.89`, le fichier est `Melodix-Preview-v1.2.2-test89.apk`; avec la même clé Preview, il met à jour l'application `com.melodix.music.preview` sans désinstaller l'application normale.

Un commit dont le message commence par `[preview-release] v1.2.2-test.N-preview ...`, poussé sur la branche Preview, déclenche automatiquement **Build Melodix Preview APK**. Le workflow assemble et signe l'APK, crée la release et joint le `.sha256`. Il calcule lui-même un `versionCode` croissant. Une publication plus récente doit utiliser un nouveau numéro de test.

Pour lancer manuellement le workflow :

1. Sur GitHub, ouvre l'onglet **Actions** et choisis **Build Melodix Preview APK**.
2. Clique **Run workflow** sur la branche de travail.
3. Indique un tag unique (par exemple `v1.2.2-test.90-preview`) et le SHA complet de 40 caractères du commit à construire.
4. Attends l'état vert **Success**, puis vérifie les noms et l'empreinte SHA-256 des deux artefacts de la release.
5. Une fois la nouvelle release vérifiée, supprime l'ancienne release pour n'en conserver qu'une seule. Ne supprime pas les tags Git si leur retrait n'est pas explicitement demandé.

Après installation, vérifie dans les infos de l'application que tu as lancé **Melodix Preview** (pas Spotify) et que **Paramètres → GUI Mode** est réglé sur **CSS+JS Mobile**. La capture d'écran ou l'essai sur appareil reste nécessaire pour valider le comportement : une compilation CI verte ne prouve pas que l'interface s'affiche.

## Si le workflow échoue

- S'il indique que les secrets de signature sont absents, vérifie leur nom exact dans **Settings → Secrets and variables → Actions**.
- S'il indique une erreur de keystore ou d'alias, ne crée pas une autre clé pour remplacer celle-ci : corrige la configuration de cette même clé. L'alias attendu est `MELODIX_PREVIEW`.
- Si `keytool` est introuvable, installe un JDK 17 et relance PowerShell.

Conserve le keystore Preview et son mot de passe : les versions Preview suivantes devront être signées avec cette même clé pour pouvoir mettre à jour l'application Preview déjà installée.
