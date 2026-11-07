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

## 🐞 Si après connexion Spotify les playlists « flashent » puis reviennent à la carte d'erreur
Testez **au moins la test.53** (MEL-BUG-030 : 3 retries bornés après un refus 401/403 par session de login,
au lieu d'un seul essai bloqué) et **la test.55** (MEL-BUG-032 : hash persistant rotaté → 400 traité comme
transitoire avec retry borné au lieu d'un blocage permanent). La plus récente (test.60) les contient toutes.

## Dernières previews publiées (branche `arena/6b935c3e-melodix`, PR #8)
| Preview | versionCode | sha256 | Empreinte certificat |
|---|---|---|---|
| v1.2.2-test.53-preview (MEL-BUG-030) | 1053 | `ef76d0a4a82579f4a1a131eb93ec12eefdbccda8dc123a518cdcc2a98c137fa6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.54-preview (MEL-BUG-031) | 1054 | `d03d24473465615b7ca0a5a44e75ef7862b7615e5fcd2f39dc265b168051e5f6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.55-preview (MEL-BUG-032) | 1055 | `75e8200e567e91843010750a6ab1b65c34aa1f3648389271c42781955e135901` | `DB:63:77:…:59:A2` |
| v1.2.2-test.56-preview (MEL-BUG-033) | 1056 | `a091e1747fdd0a25e3f88a27056fa9c0b8d495e2236831533bbbb03eb4729da7` | `DB:63:77:…:59:A2` |
| v1.2.2-test.57-preview (MEL-BUG-031 complément) | 1057 | `1328aff5e93f85825f4aa5c8f887689edde9e45dd69b2ceb67bfd067b3992ac6` | `DB:63:77:…:59:A2` |
| v1.2.2-test.58-preview (MEL-BUG-033 complément) | 1058 | `4986bf09298d55c499b521b9cde7cf6d9d4be07da1d8e889291374043f9e6514` | `DB:63:77:…:59:A2` |
| v1.2.2-test.59-preview (MEL-BUG-032 complément) | 1059 | `9299d91c4a5d8c867c4abc3e04f8497b1ea2415d86165a32e2ee54de29213079` | `DB:63:77:…:59:A2` |
| v1.2.2-test.60-preview (MEL-BUG-034) | 1060 | `868047eb90c8bc3a8ee4b7735720bd18bd7d7ac5ed447fd7dc7b7a00937788eb` | `DB:63:77:…:59:A2` |
| v1.2.2-test.61-preview (MEL-BUG-030/031/032/033/034) | 1061 | `f307a1b3df7eaa6add7e52dddf8c5235c6cc4804982b88124afeb51e305d5ba1` | `B0:B8:D5:…:6C:F5` |
| v1.2.2-test.62-preview (MEL-BUG-035) | 1062 | `8c58d998…` | `B0:B8:D5:…:6C:F5` |
| v1.2.2-test.63-preview (MEL-BUG-036 Bearer) | 1063 | `dc2bef60cf7da96c2b33bccd6b8a8ba21d523157a33639f42b73ce48fcb84f83` | `B0:B8:D5:…:6C:F5` |
| v1.2.2-test.64-preview (MEL-BUG-037/038/039/040) | 1064 | `a7b87f4ebd2ce6d87d9ce743ad41be95841360207e43d26ba2c8ca6c7c183d56` | `8B:93:8C:…:B7:1D:9E` |
| v1.2.2-test.65-preview (MEL-BUG-041) | 1065 | `4820e7b1aaee482c88f0f0b5e2616c4fd9cafda9645905b2f191714aafce9847` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.62-preview (MEL-BUG-035) | 1062 | `8c58d998d20fbca0c76622dda4b50c703a79d04abaf4a7a7cd1e9198a7f5d5f4` | `B0:B8:D5:…:6C:F5` |

La plus récente est **test.65** (`Melodix-Test-v1.2.2-test65.apk` + `.sha256`, tag `v1.2.2-test.65-preview`, MEL-BUG-041).

⚠️ test.65 a l'empreinte `DF:6B:7C:…:0E:11` (nouvelle session Arena) → **`adb uninstall com.melodix.music` avant installation** (MEL-BUG-023). test.61/62 ont l'empreinte `B0:B8:D5:…:6C:F5` (session Arena courante) : **mise à jour directe test.61 → test.62 sans conflit**. Si conflit avec une preview d'une session antérieure (`DB:63:77:…:59:A2` ou `F9:A6:…:24:18` ou `C2:A9:…:EB:67`) → `adb uninstall com.melodix.music` d'abord (MEL-BUG-023 en haut). Previews test.53→55 partagent
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
