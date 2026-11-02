# Observer passif du Home Spotify authentifié (Windows)

Ce mode permet d'observer **le WebView principal déjà ouvert** dans Melodix Preview après une connexion Spotify effectuée par la personne qui utilise l'appareil. Il ne se connecte pas à la place de l'utilisateur, ne clique pas, ne navigue pas, ne modifie ni cookies ni stockage, et ne charge aucune fixture. La Preview est un build de test débogable; le runner est un APK Android séparé, signé avec le même certificat.

La CI construit et exécute le runner sur un émulateur propre **sans session Spotify** pour vérifier le démarrage, les diagnostics et le timeout. Ce passage CI n'est pas une preuve d'authentification ou de Home Spotify réel.

## 1. Télécharger et vérifier le bundle exact

Dans **Actions**, ouvre le run du workflow **Test current Preview APK on Android emulator** pour le commit souhaité, puis télécharge l'artefact `Melodix-Authenticated-Home-<SHA complet>`. Il contient :

- l'APK **Preview débogable** exact utilisé par ce run;
- `Melodix-Preview-AuthenticatedHome-Runner-….apk`, runner `com.melodix.music.preview.test`;
- `observer-command.txt`;
- `manifest.json`, avec commit source, packages, versions, SHA-256 des deux APK et empreinte du certificat de signature.

Extrais tous les fichiers dans un même dossier. Dans PowerShell, depuis ce dossier, vérifie que les empreintes correspondent au manifeste :

```powershell
$manifest = Get-Content .\manifest.json -Raw | ConvertFrom-Json
$previewApk = Join-Path $PWD $manifest.preview_apk.file
$runnerApk = Join-Path $PWD $manifest.runner_apk.file
$previewHash = (Get-FileHash $previewApk -Algorithm SHA256).Hash.ToLowerInvariant()
$runnerHash = (Get-FileHash $runnerApk -Algorithm SHA256).Hash.ToLowerInvariant()
if ($previewHash -ne $manifest.preview_apk.sha256) { throw 'SHA-256 Preview incorrecte : ne pas installer cet APK.' }
if ($runnerHash -ne $manifest.runner_apk.sha256) { throw 'SHA-256 runner incorrecte : ne pas installer cet APK.' }
if ($manifest.preview_apk.package -ne 'com.melodix.music.preview') { throw 'Le premier APK n’est pas la Preview attendue.' }
if ($manifest.runner_apk.package -ne 'com.melodix.music.preview.test') { throw 'Le second APK n’est pas le runner attendu.' }
if ($manifest.preview_apk.signer_certificate_sha256 -ne $manifest.runner_apk.signer_certificate_sha256) { throw 'Les APK ne partagent pas le même certificat.' }
$manifest | Select-Object source_commit, preview_apk, runner_apk
```

Compare `source_commit` au SHA affiché sur le run Actions. N'utilise que les deux fichiers nommés par `preview_apk.file` et `runner_apk.file` dans ce manifeste; ne confonds pas la Preview avec le runner.

## 2. Préparer Android Platform Tools sans effacer la session

1. Installe **Android SDK Platform-Tools** sur Windows et assure-toi que `adb` fonctionne dans PowerShell.
2. Sur le téléphone, active les options développeur et le débogage USB, puis autorise cet ordinateur. Connecte un seul appareil. S'il y en a plusieurs, ajoute `-s SERIAL` à chacune des commandes `adb` ci-dessous; la commande exacte fournie plus bas suppose un seul appareil sélectionné.
3. Vérifie l'appareil :

   ```powershell
   adb devices
   ```

4. Installe la Preview débogable exacte en mode remplacement, ce qui conserve les données de l'application :

   ```powershell
   adb install -r "$previewApk"
   ```

   **N'exécute pas** `adb uninstall`, `adb shell pm clear`, « Effacer les données » ou une réinitialisation de l'application. Ne te déconnecte pas de Spotify.

   Si Android refuse cette mise à jour parce qu'une Preview de version supérieure est déjà installée — notamment une version supérieure non débogable — **arrête ici**. N'essaie pas de désinstaller ni de rétrograder cette installation : cela pourrait détruire la session. Utilise plutôt un émulateur Android dédié et installe-y les APK de ce bundle.

## 3. Se connecter manuellement et atteindre le vrai Home

1. Ouvre **Melodix Preview** (pas l'application Spotify native) :

   ```powershell
   adb shell monkey -p com.melodix.music.preview -c android.intent.category.LAUNCHER 1
   ```

2. Sur l'écran Android, laisse la personne se connecter elle-même à Spotify avec le parcours normal. Ne saisis aucun identifiant dans un script et n'automatise pas les boutons.
3. Attends que le vrai Home Spotify soit visiblement chargé dans Melodix. Vérifie l'écran et le profil de compte si nécessaire. Le simple fait d'être sur l'écran de connexion, une fixture, un état vide ou un drapeau interne ne compte pas comme preuve d'un Home authentifié.

## 4. Installer et lancer l'observateur

Une fois le Home réel affiché, installe le runner distinct, lui aussi en mode remplacement :

```powershell
adb install -r "$runnerApk"
```

Lance ensuite la commande exacte (également fournie dans `observer-command.txt`) :

```powershell
adb shell am instrument -w -r -e mode authenticated-home -e timeout_ms 900000 com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation
```

L'observation est limitée à 15 minutes. Elle ramène au premier plan la tâche existante de Melodix, puis échantillonne passivement le WebView principal et les callbacks Android. Elle ne remet pas la tâche à zéro et n'effectue aucune navigation. Si tu veux tester les transitions, réalise-les manuellement dans l'application pendant l'observation (Home → Recherche → Home, Home → Bibliothèque → Home, bouton Retour, puis arrière-plan/reprise). Aucun parcours ne doit être automatisé.

## 5. Lire le résultat sans exposer de données privées

Le runner retourne un résumé borné des catégories de route, de la visibilité et du propriétaire visuel du WebView, des transitions d'interface, des callbacks natifs et du cycle de vie Android. Il n'exporte ni indicateur/source de preuve de session, ni contrôle de profil, ni URL (même normalisée), ni nom/identifiant/compteur de contenu privé. La présence d'au moins une vraie playlist est représentée uniquement par `real_library_playlist_observed=true/false`; aucune donnée de playlist n'est copiée.

Un diagnostic de bibliothèque, s'il existe, est limité à `library_fetch_http_status`, `library_fetch_mime` (type de réponse), `library_fetch_phase`, `library_fetch_duration_ms` et `library_fetch_error`, plus les catégories génériques d'état/erreur de l'interface. Les erreurs `http-401` et `http-403` ne sont conservées que si la phase vaut `response` et que le statut correspondant est présent; sinon elles sont assainies. Aucun corps, en-tête, cookie, jeton, URL ou identifiant n'est copié ou exporté dans le rapport. Le manifeste et les APK ne contiennent pas de données de compte.

Une exécution sur un compte réel ne compte comme observation du Home que si le résultat indique `authenticated_home_test_performed=true`, `real_library_playlist_observed=true` et `home_route=true`. `overall=blocked_no_home_content_observed` ou `authenticated_home_test_performed=false` signifie qu'aucune vraie playlist n'a été observée; ne le présente pas comme une exécution réelle réussie. La CI utilise un émulateur sans données de compte et doit se terminer normalement avec `authenticated_home_test_performed=false`.

À la fin, laisse Melodix installé et ne vide pas ses données : la session reste dans les données de la Preview. L'observateur ne doit ni demander le mot de passe ni faire apparaître un cookie ou un jeton dans sa sortie.
