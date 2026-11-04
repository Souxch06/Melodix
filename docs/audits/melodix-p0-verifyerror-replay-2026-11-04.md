# P0 — replay historique du VerifyError Android 16 (APK `ec6ef63`)

**Date :** 2026-11-04

**Branche :** `arena/6b935c3e-melodix` (reprise du dernier commit `44902d9`
« [skip ci] Add historical P0 VerifyError replay » de `arena/7142700d-melodix`,
PR #7 maintenue ouverte).

**Objet :** le commit `44902d9` avait ajouté le job isolé `p0-verify-replay`
mais ne l'avait jamais exécuté (`[skip ci]`). Cette reprise le déclenche pour
la première fois, corrige ce qui l'empêchait d'aboutir, et **reproduit le
VerifyError historique** sur l'APK exact du run `41653545783`.

## Ce qui est prouvé — et à quel niveau

| Niveau | État |
| --- | --- |
| Code | correctifs écrits et relus dans le dépôt |
| Test | suite Node **544/544** verte après changements |
| Compilation | aucun nouvel APK construit pendant le replay (APK historique réutilisé) |
| Exécution | **émulateur Android 16** : le VerifyError est reproduit sur les deux lancements |

Aucun test Spotify authentifié n'a été effectué (`authenticated_spotify_test=not_performed`).
Aucun compte, cookie, jeton ni contenu privé n'a été fourni. L'émulateur est
le seul environnement d'exécution ; aucun téléphone physique n'a été testé ici.

## Résultat du replay — run `41796437131`

APK historique vérifié avant lancement : source `ec6ef63f9d6638a70bb8e7877d7b798598c250a2`,
`versionCode=1021015`, `versionName=1.2.2-ec6ef63`, debuggable,
SHA-256 `ce756a4beead4d0bb3128b339034d70fafab620ac89a189e5042d484f8348375`
(byte-identique à l'artefat du run `41653545783`). Installation `adb_install_exit=0`.

Les deux phases isolées capturent le **même** finding :

| Phase | VerifyError | Classe | Méthode | Registre | Type réel | Type attendu |
| --- | --- | --- | --- | --- | --- | --- |
| `initial` | oui | `com.melodix.music.MainActivity` | `markNativeSettingsPayloadApplied` | `v3` | `Reference: java.lang.String` | `Reference: java.lang.StringBuilder` |
| `post_permission_force_stop_relaunch` | oui | `com.melodix.music.MainActivity` | `markNativeSettingsPayloadApplied` | `v3` | `Reference: java.lang.String` | `Reference: java.lang.StringBuilder` |

Signature `(Ljava/lang/String;)V`. Offset ART non capturé (`art_offset=none`).
Chaque phase : `adb_logcat_exit=0`, `sanitizer_exit=0`, buffer `main+crash`.
Le chemin historique complet a été rejoué : octroi de `BLUETOOTH_CONNECT`
uniquement, `force-stop`, second lancement (`start_status=0` aux deux).

Le run est marqué en échec **volontairement** par l'étape « Mark a reproduced
VerifyError as a P0 finding » : c'est le comportement attendu quand le
VerifyError est reproduit. Le rapport combiné rédigé
(`Melodix-P0-VerifyError-Replay-Redacted-41796437131`, rétention 1 jour) est
téléversé ; il n'a pas pu être rapatrié ici (le stockage d'artefats Azure est
hors de la politique réseau de cet environnement), mais les annotations CI
assainies portent les champs ci-dessus.

## Interprétation

- Le VerifyError est un **mismatch de type de registre** : `v3` contient une
  `String` là que le vérificateur attend un `StringBuilder`. Il se produit dès
  le lancement initial, **indépendamment** de l'octroi de permission Bluetooth
  (les deux phases le reproduisent). La permission n'est donc pas la cause.
- Ceci **confirme le diagnostic historique** consigné dans
  `melodix-phone-tablet-display-ownership-2026-11-02.md` (le VerifyError
  `MainActivity` observé sur l'AVD). Le replay fournit désormais une
  reproduction reproductible à la demande sur l'APK exact, pas seulement une
  observation ponctuelle.
- **Le source courant contient déjà le correctif.** Dans
  `smali/com/melodix/music/MainActivity.smali`, `markNativeSettingsPayloadApplied`
  utilise `v2` pour le `StringBuilder` et garde `v3` pour les constantes
  `String` ; le build courant (`829fccd`, run `41693996448`) avait
  `verify_error_detected=false`. Le replay rejoue l'APK **historique fautif**,
  il ne réintroduit aucun défaut dans le source courant.

## Correctifs apportés au job de replay pour le faire aboutir

Chacun est un défaut réel du job `p0-verify-replay`/du sanitizer, révélé par
des diagnostics ciblés, et couvert par un test de régression :

1. **`31010cf` — format de l'empreinte du signataire.** Le job grepait
   `resources.arsc` avec le digest `apksigner` en hex minuscule sans
   deux-points, alors que `expected_signature_sha256` y est embarqué en
   majuscules séparées par `:` (format de `preview-apk.yml`). Le contrôle
   échouait avant tout lancement. Reformatage au format embarqué + assertion.
2. **`b317c3f` — diagnostics par phase.** Statuts distincts pour `adb install`,
   chaque capture, l'octroi de permission et chaque `start_status`, sans
   conserver de logcat brut.
3. **`eacfef8` — sanitizer fail-closed.** En cas d'exception de parsing, le
   sanitizer rapporte seulement la classe d'exception et émet un rapport
   détection-seule `unparsed-verify-error` au lieu de crasher. Les codes de
   sortie d'`adb logcat` et du sanitizer sont attribués séparément.
4. **`75a092f` — tolérance aux erreurs de lecture logcat.** Retry bref puis
   traitement de la sortie capturée ; une sortie vide avec code non nul est
   seule signalée comme buffer illisible.
5. **`8f5e4a2` — repli buffer `main` + stderr adb.** Si la lecture combinée
   `main+crash` reste vide, repli sur `main` (AndroidRuntime y journalise aussi
   le FATAL EXCEPTION) ; tête du stderr adb bornée et assainie pour diagnostic.
6. **`f4410c7` — cause racine : format logcat invalide.** `-v message` n'est
   **pas** un format logcat valide ; Android 16 le rejette
   (`logcat: Invalid -v message.`) et retourne exit 1 avec zéro octet, donc
   toutes les captures AndroidRuntime lisaient silencieusement à vide. Les
   trois lectures (job principal + replay combiné/main-seul) passent à
   `-v brief`, le format que le sanitizer parse. Assertion interdisant
   `-v message`.

## Limites

- La reproduction est sur **émulateur Android 16** uniquement, pas sur téléphone.
- Le replay ne teste **aucune session Spotify réelle** ; il ne valide ni
  l'affichage de l'interface, ni le P0 « UI absente » téléphone/tablette, qui
  restent des sujets distincts suivis dans leurs notes respectives.
- Le rapport combiné n'a pas été rapatrié localement (stockage d'artefats
  bloqué) ; les champs cités proviennent des annotations CI assainies du run.
