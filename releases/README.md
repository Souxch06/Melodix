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

## Dernières previews publiées (branche `arena/6b935c3e-melodix`, PR #8)
| Preview | versionCode | sha256 | Empreinte certificat |
|---|---|---|---|
| v1.2.2-test.53-preview (MEL-BUG-030) | 1053 | `ef76d0a4a82579f4a1a131eb93ec12eefdbccda8dc123a518cdcc2a98c137fa6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.54-preview (MEL-BUG-031) | 1054 | `d03d24473465615b7ca0a5a44e75ef7862b7615e5fcd2f39dc265b168051e5f6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.55-preview (MEL-BUG-032) | 1055 | `75e8200e567e91843010750a6ab1b65c34aa1f3648389271c42781955e135901` | `DB:63:77:…:59:A2` |
| v1.2.2-test.56-preview (MEL-BUG-033) | 1056 | `a091e1747fdd0a25e3f88a27056fa9c0b8d495e2236831533bbbb03eb4729da7` | `DB:63:77:…:59:A2` |
| v1.2.2-test.57-preview (MEL-BUG-031 complément) | 1057 | `1328aff5e93f85825f4aa5c8f887689edde9e45dd69b2ceb67bfd067b3992ac6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.58-preview (MEL-BUG-033 complément) | 1058 | `4986bf09298d55c499b521b9cde7cf6d9d4be07da1d8e889291374043f9e6514` | `DB:63:77:…:59:A2` |

La plus récente est **test.58** (`Melodix-Test-v1.2.2-test58.apk` + `.sha256`). Previews test.53→55 partagent
l'empreinte `DB:63:77:15:AA:DE:11:58:EF:AD:BF:16:4F:CD:E3:10:A5:8E:1F:AF:1B:E2:D5:A1:E5:2F:AE:DE:70:C8:59:A2`
(même session Arena → mise à jour directe). Les previews test.47→52 avaient l'empreinte `F9:A6:…:24:18`,
test.46 `C2:A9:…:EB:67` (sessions Arena antérieures → désinstaller d'abord, voir MEL-BUG-023 ci-dessus).

- APK : `Melodix-Test-v1.2.2-test46.apk` (branche `arena/6b935c3e-melodix`)
- sha256 : `Melodix-Test-v1.2.2-test46.apk.sha256`
- Signé avec la clé de test persistante PKCS12 (alias `melodix-test`), empreinte SHA-256 du certificat :
  `C2:A9:1D:F7:D7:FD:3B:C5:83:2C:FC:B6:98:8B:1A:E4:AD:09:16:01:6C:D9:66:7D:75:DD:D3:E0:6A:9F:EB:67`
- v1 (JAR) + v2 + v3 ; stabilité vérifiée (2 signatures → même certificat) ; `resources.arsc` stocké et aligné 4 o ;
  package `com.melodix.music`, versionCode `1046`, versionName `1.2.2`.
- La clé privée n'est PAS dans ce dépôt (copie locale gitignorée sous `.local-keys/`, jamais commitée).
- Migration : les pre-releases ≤ test.45 étaient signées par des clés jetables → les DÉSINSTALLER avant
  d'installer celle-ci.
