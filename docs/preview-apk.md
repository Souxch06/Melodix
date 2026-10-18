# Créer et publier l'APK Melodix Preview

Cette procédure crée une application d'essai séparée, package `com.melodix.music.preview`, nommée **Melodix Preview**. Elle peut être installée à côté de l'application normale `com.melodix.music` sans la désinstaller. Ce n'est pas une mise à jour de test.7 : l'application et ses données sont séparées.

La clé de test.7 n'étant pas disponible, cette prévisualisation doit avoir sa propre clé. Il faut conserver cette nouvelle clé pour que les prochaines versions Preview puissent mettre à jour cette même application.

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

## 3. Lancer la pré-release

1. Sur GitHub, ouvre le dépôt puis l'onglet **Actions**.
2. Sélectionne **Build Melodix Preview APK**.
3. Dans la liste des branches, sélectionne la branche qui contient les modifications à tester. Le workflow compile cette branche sans qu'il soit nécessaire de la fusionner dans `main`.
4. Laisse le tag par défaut `v1.2.2-test.25-preview`, puis clique **Run workflow**. Ce nouveau tag crée une pré-release distincte de la test.24, conserve l'historique et incrémente le `versionCode` pour mettre à jour la Preview installée.
5. Attends que le run soit terminé avec l'état vert **Success**.

Le workflow crée la pré-release `Melodix Preview v1.2.2 test.25` à partir du commit de la branche sélectionnée et y attache :

- `Melodix-Preview-v1.2.2-test25.apk`
- son fichier `.sha256`

La test.25 corrige le viewport mobile de l'écran Spotify et garde les diagnostics réseau/WebView de la test.24. Si la création de WebView échoue, elle affiche uniquement la classe de l'exception, jamais son message ni sa pile. Elle n'enregistre ni URL, ni jeton, ni donnée de compte Spotify; elle ne prétend pas que la connectivité est réparée.

La pré-release apparaîtra sur GitHub dans **Releases**. Télécharge l'APK depuis cette page et installe-la sur Android. Elle apparaîtra sous le nom **Melodix Preview** et ne remplacera pas l'application normale.

Le workflow adapte dans sa copie temporaire l'empreinte de signature intégrée à l'application pour qu'elle corresponde à la clé Preview, puis augmente le `versionCode` afin que cette nouvelle Preview puisse mettre à jour la version précédente déjà installée. Le projet source et la signature de l'application normale restent inchangés.

## Si le workflow échoue

- S'il indique que les secrets de signature sont absents, vérifie leur nom exact dans **Settings → Secrets and variables → Actions**.
- S'il indique une erreur de keystore ou d'alias, ne crée pas une autre clé pour remplacer celle-ci : corrige la configuration de cette même clé. L'alias attendu est `MELODIX_PREVIEW`.
- Si `keytool` est introuvable, installe un JDK 17 et relance PowerShell.

Conserve le keystore Preview et son mot de passe : les versions Preview suivantes devront être signées avec cette même clé pour pouvoir mettre à jour l'application Preview déjà installée.
