# Créer et publier l'APK Melodix Preview

La Preview est une application d'essai séparée, identifiant `com.melodix.music.preview`, nommée **Melodix Preview**. Elle s'installe à côté de l'application normale `com.melodix.music` sans la désinstaller et garde ses propres données. La release actuelle, **V1**, reprend le code de test.18 (commit `81ef774fcb2208d4c4e999943411040aa1bfa33f`).

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

## 3. Publier la V1 basée sur V18

1. Sur GitHub, ouvre le dépôt puis l'onglet **Actions**.
2. Sélectionne **Build Melodix Preview APK** et clique **Run workflow** sur la branche de travail.
3. Laisse le tag par défaut `v1.2.2-test.1-preview`.
4. Laisse le commit source par défaut `81ef774fcb2208d4c4e999943411040aa1bfa33f` pour reconstruire exactement la base V18, puis clique **Run workflow**.
5. Attends que le run soit terminé avec l'état vert **Success**.

Le workflow crée la release `Melodix Preview v1.2.2 test.1` sur le commit V18 et y attache :

- `Melodix-Preview-v1.2.2-test1.apk`
- son fichier `.sha256`

Le nom de version repart à test.1, mais le `versionCode` Android est volontairement supérieur à celui de l'ancienne test.27. La Preview V1 peut ainsi mettre à jour la Preview déjà installée, sans toucher à l'application normale.

La V1 reprend volontairement le comportement du projet V18; les protections ajoutées dans les versions ultérieures ne sont pas incluses. L'affichage peut conserver les dimensions de cette ancienne version. La Preview reste une application séparée avec des données distinctes.

La release apparaît sur GitHub dans **Releases**. Télécharge l'APK et installe-la sur Android. Elle apparaît sous le nom **Melodix Preview** et ne remplace pas l'application normale.

Le workflow adapte uniquement sa copie temporaire du projet à la signature Preview et au `versionCode`. Le projet source et la signature de l'application normale restent inchangés. Pour créer une version suivante, choisis un nouveau tag test et un commit source adapté; garde la même clé et laisse le `versionCode` augmenter.

## Si le workflow échoue

- S'il indique que les secrets de signature sont absents, vérifie leur nom exact dans **Settings → Secrets and variables → Actions**.
- S'il indique une erreur de keystore ou d'alias, ne crée pas une autre clé pour remplacer celle-ci : corrige la configuration de cette même clé. L'alias attendu est `MELODIX_PREVIEW`.
- Si `keytool` est introuvable, installe un JDK 17 et relance PowerShell.

Conserve le keystore Preview et son mot de passe : les versions Preview suivantes devront être signées avec cette même clé pour pouvoir mettre à jour l'application Preview déjà installée.
