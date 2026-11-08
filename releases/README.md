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
| v1.2.2-test.66-preview (MEL-BUG-042) | 1066 | `d0ef93bf5e70dcdf42f600d99a847a9748f01e636018142ab484a4e82e9906f8` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.67-preview (MEL-BUG-043) | 1067 | `dd070a604f474bf7bdb655c276224b6d212a4a7c4584315cdbafd416add2dfb0` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.68-preview (MEL-BUG-044) | 1068 | `67ef3d0f065fe4e4c624b2ebde6ce7f34ffd5268af253c16c3693c145b771389` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.69-preview (MEL-BUG-045) | 1069 | `95221902db171dd2ea963b9726cfc1a75d8a52bb4981fb68a649cc4d5f997049` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.70-preview (MEL-BUG-046) | 1070 | `e0ca69ea5e2888eb05760278e5a252bc5e223048356504a65653bd516188c27e` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.71-preview (MEL-BUG-047) | 1071 | `9c3b1f181cb7c91f04dccce07d7e68df047779fee428d609884ca905da699f86` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.72-preview (MEL-BUG-048/049) | 1072 | `523a036c69334b5e59464f2caa2377eefbedae1f75706fbe38e139162326fead` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.73-preview (MEL-BUG-050) | 1073 | `03ca51ba3f8259b6631d8e44c1977dd01f8819a386146a297023cd03ea97ed28` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.74-preview (MEL-BUG-051) | 1074 | `cf210402be8be8af9e8a253203f188ef719d67e52822a5b56a3389b369968651` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.75-preview (MEL-BUG-052) | 1075 | `8ad4e31e836e7ec75773f76d7bf866689eeb3fa518a9ec692be438a2f4baacb5` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.76-preview (MEL-BUG-053) | 1076 | `968dd4307b6855e3613c77c7d63b657d1acf127ce09131cf2cb68536ba8ce663` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.77-preview (MEL-BUG-054) | 1077 | `50791561bae0df76f9202f7616d02109310185d792191c318e81c9f956cb32e1` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.78-preview (MEL-BUG-055) | 1078 | `b636e359f9b44187b03d2baec96ca9264cdd78405dbb9525129be31b05eaaa20` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.79-preview (MEL-BUG-056) | 1079 | `99315211a4689f25afcae2eeb5f9f6d5cff7a0fa8f3051ddecaf5c3e622d5c52` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.80-preview (MEL-BUG-057) | 1080 | `32904a937f163a5377b2edba78255f1d0b3e21f4f9bccaf2840dd2d492144337` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.81-preview (MEL-BUG-058) | 1081 | `e26ae789b6759874cd31968b5d8b5850382f1276c21f03e18fb875461ff27833` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.82-preview (MEL-BUG-059) | 1082 | `816876c5e0d1a32d22a18b3b48bde48f9fc2f5308e869ee86ae81e3d05f4c763` | `DF:6B:7C:…:0E:11` |
| v1.2.2-test.83-preview (MEL-BUG-060) | 1083 | `ca8bd6eadfa9dbd068d1cf7f7e5ab55444dc834114c24edafedb33cedab947ba` | `DC:67:4C:91:…:A1:35` ⚠️ nouveau cert (reset sandbox) : **désinstaller d’abord** |
| v1.2.2-test.84-preview (MEL-BUG-061) | 1084 | `cb2472588b357fbe17e6fc2a92c076905c3bc32ed8deccff899353bbf239de4` | `DC:67:4C:…:A1:35` (maj directe depuis test.83) |
| v1.2.2-test.85-preview (MEL-BUG-061b) | 1085 | `1b685e6ad04f0badbde2c82a2b7f055b6684d6f5222c3ba7383a83f1539c75fa` | `DC:67:4C:…:A1:35` (maj directe) |
| v1.2.2-test.96-preview (MEL-BUG-062) | 1086 | `1872652eff13a212bd246c413046c1e35cfe39673faae90043cb40ee7c40e701` | `DC:67:4C:…:A1:35` (maj directe) |
| v1.2.2-test.97-preview (MEL-BUG-063) | 1087 | `b3157e3622ee2949cec3ad379abc596603e53f779d70e0baa4c4fe7233be38c9` | `DC:67:4C:…:A1:35` (maj directe) |
| v1.2.2-test.98-preview (MEL-BUG-064+065) | 1088 | `2124c105e8f8be7929a32a042c3c4c9245eb53c78cf0c3be288f72571f78ed55` | `C7:B5:1F:…:D0:95` ⚠️ **nouveau cert (reset sandbox) : désinstaller d’abord** |
| v1.2.2-test.99-preview (MEL-BUG-066) | 1089 | `95694cddc116f2a57bb36bb02d5a66ece7e6834b803e8e6965e85853ec713e4b` | `10:C2:83:…:45:95` ⚠️ **nouveau cert (reset sandbox) : désinstaller d’abord** |
| v1.2.2-test.100-preview (MEL-BUG-067 + fix crash réglages) | 1090 | `72fe8e0307a5f7e740559e0117a06eb70c4955aa5d92c966a4427de25bd94ce9` | `10:C2:83:…:45:95` (maj directe depuis test.99) |
| v1.2.2-test.101-preview (fix VerifyError test.100) | 1091 | `b0c4964017562ca1bbe2e5aaf4b9c112021fdc6571722ed9c0c2be428f7725a5` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.102-preview (MEL-BUG-067 inline, CI Measure VERT) | 1092 | `dc0373f3796681fc4e0381fc14bb2065db60e98a670b4feb55eb22ab2facf66a` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.103-preview (MEL-BUG-068) ⚠️ **NE PAS INSTALLER** (build apktool 2.9.3 KO + crash au lancement) — remplacé par test.104 | 1093 | `f4cb8bcad1ca908e57b75837193695fa78d75f8a3bb71b21be7922ae745c6d89` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.104-preview (MEL-BUG-068 livré proprement, CI VERTE) | 1094 | `12dc30ea438a43ac58bedcaf3f380600eb6e3135f83e4bf60c07990e629bdd48` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.105-preview (MEL-BUG-069 : crash réglages corrigé, login en premier, login en viewport mobile) | 1095 | `1cd54c12a953dace69ac953f0468fa994a7f1fb5d64bcd58d306eec2e3232c39` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.106-preview (MEL-BUG-070 : le chemin payload ne peut plus afficher l'accueil sur une session non prouvée) | 1096 | `637acce7c0f67d6ce73d7ebf7781c68e14e7e948136bbd98d1ccc2ffc0e88ae9` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.107-preview (MEL-BUG-071 : le login est enfin DEMANDÉ sur une page distante au démarrage à chaud) | 1097 | `68fcc93803de38813aca7ed2543a9e210df0d1c977a358b69031ad59477a6a62` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.108-preview (MEL-BUG-072 : le shell natif et la route sont refusés sans preuve de session, refus visible dans le journal) | 1098 | `e185973002fae2523867012fd32537e2ca0d3209617edc97cb92dd111777590d` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.109-preview (MEL-BUG-073 : diagnostic 1600 car. tête+queue, `gates=`/`loginN=`/`root=` et chaque `ensure cold|warm`) | 1099 | `07241485caf5d30d3b07cdd571ea65623dd2e5557e40cb5845588ead3fea12b3` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.110-preview (MEL-BUG-074 : `journal=` redevenait vide — condition de budget inversée `if-gt` qui faisait lever le writer, avalée par le catch) | 1100 | `a5f27f36cfb14c1e17b3c3f24ccb6abd7e323dd811a750d68eedbbd4390d3cd4` | `10:C2:83:…:45:95` (maj directe) |
| v1.2.2-test.62-preview (MEL-BUG-035) | 1062 | `8c58d998d20fbca0c76622dda4b50c703a79d04abaf4a7a7cd1e9198a7f5d5f4` | `B0:B8:D5:…:6C:F5` |

La plus récente est **test.110** (`Melodix-Test-v1.2.2-test110.apk`, tag `v1.2.2-test.110-preview`) — **téléchargement direct** : https://raw.githubusercontent.com/Souxch06/Melodix/v1.2.2-test.110-preview/releases/Melodix-Test-v1.2.2-test110.apk — MEL-BUG-074 : **le journal est revenu**. Le rapport test.109 montrait `loginN=1 root=1` mais `journal=` **vide** : la condition de budget que j avais écrite était `if-gt v2, v0, :diag_store` — en smali « si v2 > 1600 → stocker » — c est-à-dire **inversée**. Au démarrage le journal fait toujours moins de 1600 caractères, il partait donc dans la branche d élision et appelait `substring(512)` sur une chaîne plus courte : `StringIndexOutOfBoundsException`, **avalée par le `.catch` de la méthode**, si bien que `diagNative` restait `null` **pour toujours** et que les 8 points d écriture étaient perdus. Corrigé en `if-le` (v2 <= 1600 → stocker), plus un test qui vérifie le **sens** de la comparaison et pas seulement sa présence. Filet de sécurité ajouté : si le writer échoue encore, il écrit `!diag-err` au lieu de laisser un champ vide — une panne du journal ne peut plus ressembler à un démarrage silencieux. Le format de diagnostic de test.109 est inchangé (`gates=`/`loginN=`/`root=`/`ensure cold|warm`, 1600 car. tête+queue). Inclut MEL-BUG-069 à MEL-BUG-073. Même certificat `10:C2:83:…:45:95` → **maj directe depuis test.99+**.
⚠️ **test.103 (vC 1093) est à NE PAS INSTALLER** : build CI apktool 2.9.3 rejeté (exit 22) puis crash au lancement (VerifyError) — **test.104 le remplace**.


> Depuis test.75/test.76, les tags sont posés sur le commit qui **contient l’APK** : le lien raw épinglé sur le tag sert bien le binaire (vérifié via l’API GitHub).

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
