# Pre-release de test Melodix — canal de publication Arena

## ⚠️ « Package en conflit » à la mise à jour (MEL-BUG-023)
Android refuse la mise à jour si la signature change. **Désinstalle d'abord** l'ancienne version :
- via PC : `adb uninstall com.melodix.music` puis installe la nouvelle APK ;
- ou sur le téléphone : Réglages → Applications → Melodix → Désinstaller.
⚠️ La désinstallation efface les données de l'app (dont la session Spotify : reconnexion nécessaire).
Les previews d'une même session partagent la même empreinte (mise à jour directe OK) ; une nouvelle
session Arena peut régénérer la clé (le bac à sable efface le keystore local) → l'empreinte change et
est toujours documentée dans les notes de la release.

Le bac à sable Arena ne peut pas écrire de secret GitHub Actions (HTTP 403, permission « Secrets »
absente du token d'app) ni uploader d'assets de release (uploads.github.com hors allowlist).
La pre-release est donc publiée via l'API GitHub (autorisée) et l'APK est servi depuis ce dépôt.

- APK : `Melodix-Test-v1.2.2-test46.apk` (branche `arena/6b935c3e-melodix`)
- sha256 : `Melodix-Test-v1.2.2-test46.apk.sha256`
- Signé avec la clé de test persistante PKCS12 (alias `melodix-test`), empreinte SHA-256 du certificat :
  `C2:A9:1D:F7:D7:FD:3B:C5:83:2C:FC:B6:98:8B:1A:E4:AD:09:16:01:6C:D9:66:7D:75:DD:D3:E0:6A:9F:EB:67`
- v1 (JAR) + v2 + v3 ; stabilité vérifiée (2 signatures → même certificat) ; `resources.arsc` stocké et aligné 4 o ;
  package `com.melodix.music`, versionCode `1046`, versionName `1.2.2`.
- La clé privée n'est PAS dans ce dépôt (copie locale gitignorée sous `.local-keys/`, jamais commitée).
- Migration : les pre-releases ≤ test.45 étaient signées par des clés jetables → les DÉSINSTALLER avant
  d'installer celle-ci.
