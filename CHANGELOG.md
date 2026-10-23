# Changelog — Melodix

Toutes les modifications fonctionnelles, de sécurité et d'infrastructure validées sur le dépôt `Souxch06/Melodix` sont documentées ici avec leurs commits exacts et leur périmètre de vérification.

---

## [Unreleased — Branche `arena/7142700d-melodix` / PR #7]

### Automatisation continue GitHub Actions & Séparation stricte Dev / Releases (2026-10-23)
- **Déclenchement automatique multi-branches sans doublon** (`.github/workflows/preview-apk.yml`, `.github/workflows/test-preview-emulator.yml`) :
  - Passage de `branches: [arena/7142700d-melodix]` à `branches-ignore: [main]` pour couvrir automatiquement toutes les branches de développement et sessions Arena futures sans déclenchement parasite sur `main` ni boucle infinie.
  - Ajout de `concurrency` par workflow et branche (`cancel-in-progress: ${{ github.event_name == 'push' }}`) pour annuler proprement les builds obsolètes lors de pushes rapprochés sans jamais interrompre un `workflow_dispatch` manuel.
- **Moindre privilège et isolation stricte des Releases** (`.github/workflows/preview-apk.yml`, `.github/workflows/release-apk.yml`) :
  - Permissions globales abaissées à `contents: read` sur l'ensemble des workflows.
  - Isolation de la publication de pré-release dans un job distinct `publish-preview-release` verrouillé par `github.event_name == 'workflow_dispatch' && inputs.publish_release == true` (`default: false`) : aucun `push` ni `workflow_dispatch` par défaut ne peut créer ou écraser une GitHub Release.
- **Traçabilité par SHA complet (40 caractères) et rapports téléchargeables** :
  - Génération et archivage dans `Melodix-Preview-<SHA40>` : APK signé, `.sha256`, `build-manifest-<SHA40>.json`, journal `apktool-build-<SHA40>.log` et rapport `node-tests-<SHA40>.tap`.
  - Génération et archivage dans `Melodix-Emulator-Verification-<SHA40>` : dumps UI XML (`01_home.xml`..`14_after_recreate.xml`), `logcat` Phase 1 & Phase 2, `node-tests-<SHA40>.tap` et `verification-summary-<SHA40>.json`.
- **Protocole permanent pour les sessions Arena** :
  - Ajout de `AGENTS.md`, `CHANGELOG.md`, du script exécutable `scripts/verify-and-sync.sh` et des tests de contrat CI dans `tests/preview_workflow.test.js`.

### Audit ciblé final, résilience WebView/MediaBrowser et conformité Fetch (`a9fae2a14a4a054d2775af567717f207a17f1d81` & `0990bc0669e9fbbf9755443ec44673ae56f7b823`)
- **Récupération de crash du moteur de rendu `WebView` (`onRenderProcessGone`)** :
  - En arrière-plan (`smali/c91.smali`, `smali/yi1.smali`, `smali/com/melodix/music/WebService.smali`) : dégel explicite `onResume()` / `resumeTimers()` / `dispatchWindowVisibilityChanged(0)` et reprise automatique contrôlée (`resumePlaybackOnRecovery`).
  - Au premier plan (`smali/com/melodix/music/MainActivity.smali` `A()V`) : préservation de la session connectée (`AppSingleton.B == true && MainActivity.l0 == false`) lors d'un crash renderer ou rechargement WebView, tout en garantissant la purge native sur tout logout explicite (`NativeLogoutRunnable` et `SettingsActivity`).
- **Service média Android (`WebService`)** :
  - Complétion systématique des requêtes pendantes `MediaBrowserServiceCompat$Result` (`sendResult(Collections.emptyList())`) lors du nettoyage `l()` et échappement `JSONObject.quote` dans `onLoadChildren` et `onSearch`.
- **Deep-links `spotify:search:` & objet synthétique `Response`** :
  - Prise en charge sans troncature ni double encodage des espaces, apostrophes `'`, deux-points `:`, accents UTF-8 et `%` (`assets/native_ui_shell.js`, `assets/spotify_bridge.js`, `MainActivity.smali`).
  - Conformité `Response` Fetch (`statusText`, `bodyUsed`, `clone()`, rejet `SyntaxError` sur corps vide `204 No Content`).
- **Vérificateur statique Dalvik CFG + treillis de types (`tests/audit_remediation.test.js` `[D7]`)** :
  - Analyse par point fixe de graphe de flot de contrôle et treillis de registres Dalvik validée sur les `3 804` fichiers `.smali` du dépôt (`0` erreur) ainsi que sur l'APK d'instrumentation E2E.

### Remédiation complète UI native, navigation Android 15, recherche, session et garde SSRF (`60be0e260398228a70c9daebc3a1f1da09778aac` & commits précédents sur [PR #7](https://github.com/Souxch06/Melodix/pull/7))
- Correction du `ClassCastException` de `MainActivity.styleNativeTab`, des gardes booléennes inversées Smali et de l'attachement de `NativeSearchWatcher`.
- Isolation inter-comptes par époque monotone (`nativeSessionEpoch`, `nativeLoggedOut`), navigation retour `OnBackInvokedCallback` Android 15 (`API 35`) et garde réseau anti-SSRF (`NativeFetchGuard.smali`).
- Limites connues non testables en CI : authentification réelle sur `accounts.spotify.com` et lecture audio chiffrée Widevine L1/L3 sur smartphone Android physique.
