# Melodix — Tentative d'exécution réelle du P0 display-ownership (2026-11-04)

Objet de la mission : préparer, **exécuter si les permissions et l'infrastructure le
permettent**, puis analyser le workflow réel `p0-display-ownership.yml`.

> **Résultat : le workflow n'a pas pu être exécuté. Il n'existe pas côté GitHub.**
> Aucune mesure Android n'a été produite. Le verdict du P0 est **révisé à la
> baisse** : `OUVERT — PRÉPARATION NON DÉPLOYÉE`.

Chaque affirmation ci-dessous est rattachée à une commande exécutée et à sa sortie
observée. Les catégories employées sont explicites : **FAIT OBSERVÉ**,
**TEST RÉUSSI**, **TEST ÉCHOUÉ**, **TEST NON EXÉCUTÉ**, **HYPOTHÈSE**,
**LIMITATION D'INFRASTRUCTURE**.

---

## 1. SHA source utilisé

**Aucun `source_ref` n'a été utilisé : aucun dispatch n'a eu lieu.**

| Réf | Valeur | Où |
|---|---|---|
| HEAD local | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` | clone shallow, 1 commit, *grafted* |
| `main` = `origin/main` | `81ef774fcb2208d4c4e999943411040aa1bfa33f` | branche par défaut |
| **Tip distant de la branche de session** | **`a6b02705cedfb098d9d63ccc43a21319f5c9cf6d`** | `git ls-remote --heads origin` |

### 1.1 FAIT OBSERVÉ — réconciliation importante

La référence `a6b0270`, rapportée comme « absente » lors de la mission précédente,
**existe bien sur le dépôt distant**. Elle était seulement absente du **clone local
superficiel**. Preuve :

```
$ git ls-remote --heads origin
a6b02705cedfb098d9d63ccc43a21319f5c9cf6d  refs/heads/arena/6b935c3e-melodix
44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d  refs/heads/arena/7142700d-melodix
81ef774fcb2208d4c4e999943411040aa1bfa33f  refs/heads/main

$ gh api repos/Souxch06/Melodix/commits/a6b0270…
sha=a6b02705cedfb098d9d63ccc43a21319f5c9cf6d
date=2026-11-04T09:32:43Z
message=Add fail-closed phone/tablet display-ownership comparator for the P0
```

La branche distante est donc **en avance** sur le clone local : le clone a été fait
depuis le commit de la branche parente, pas depuis le tip de la branche de session.
Cela corrige le document de baseline, qui concluait à une absence globale.

### 1.2 FAIT OBSERVÉ — aucun commit ne représente la préparation auditée

Contenu de `a6b0270` côté distant :

- `.github/workflows/` : `preview-apk.yml`, `preview-launch-trace.yml`,
  `release-apk.yml`, `test-preview-emulator.yml`, `validate-android-assembly.yml`
  → **pas de `p0-display-ownership.yml`** ;
- `scripts/` : `aggregate_p0_display_ownership.py` (comparateur v1) et
  `aggregate_p0_verify_replay.py` → **aucun des 5 scripts `p0_display_*.sh`**.

Le HEAD local `44902d9` ne contient ni le workflow, ni les scripts, ni le harness
modifié. **Aucun commit accessible ne porte la préparation complète.** Conformément
à la consigne, aucun commit n'a été créé pour cette mission.

---

## 2. Branche et état Git initial

**FAIT OBSERVÉ.** Branche `arena/6b935c3e-melodix` (statut `active`).
Arbre : **7 fichiers suivis modifiés** (`git diff --stat` : **+649 / −28**),
**17 fichiers non suivis**. Reflog : `clone` → `checkout` uniquement.

Intégrité vérifiée avant toute action, puis revérifiée après :

| Fichier | SHA-256 observé | Attendu (audit) | Conforme |
|---|---|---|---|
| `.github/workflows/p0-display-ownership.yml` | `1999e596…547287f4` | `1999e596…547287f4` | **oui** |
| `tests/android/HomeRenderInstrumentation.java` | `b9ef4a6f…3f394a886` | `b9ef4a6f…3f394a886` | **oui** |

Les trois livrables antérieurs sont présents et non vides : baseline (238 lignes),
rapport d'ingénierie (535 lignes), runbook (236 lignes).

**Aucune réinitialisation, aucune suppression, aucun remplacement par une version
de `main`.** Aucun commit, push, merge, release, publication, ni changement de
permissions/secrets/configuration.

---

## 3. Identifiant du workflow et du run

**Aucun identifiant de run : le workflow n'est pas exécutable.**

### 3.1 FAIT OBSERVÉ — le workflow n'est pas enregistré

```
$ gh api repos/Souxch06/Melodix/actions/workflows --jq '.total_count'
7
```

Les 7 workflows enregistrés sont : `launch-smoke-emulator.yml`, `preview-apk.yml`,
`preview-launch-trace.yml`, `release-apk.yml`, `release-asset-refresh.yml`,
`test-preview-emulator.yml`, `validate-android-assembly.yml`.
**`p0-display-ownership.yml` n'y figure pas.** `gh workflow list --all` confirme.

### 3.2 FAIT OBSERVÉ — erreur exacte

```
$ gh api repos/Souxch06/Melodix/actions/workflows/p0-display-ownership.yml
{"message":"Not Found","status":"404"}
gh: Not Found (HTTP 404)

$ gh api "repos/Souxch06/Melodix/contents/.github/workflows/p0-display-ownership.yml?ref=main"
{"message":"Not Found","status":"404"}
```

Le fichier n'existe **à aucun ref distant** : absent de `main`, absent de
`a6b0270`, absent de la liste des workflows. Il n'existe que comme **fichier local
non suivi** (`?? .github/workflows/p0-display-ownership.yml`).

### 3.3 Conclusion — blocage structurel

GitHub Actions ne peut déclencher que des workflows présents dans le dépôt.
Déployer celui-ci exigerait un **commit et un push**, tous deux **explicitement
interdits** par la mission. **Aucun contournement n'a été tenté** : pas de dispatch
sur un workflow homonyme, pas de réutilisation d'un autre workflow, pas d'édition
du YAML, pas de création de commit.

Paramètres du workflow **local** (non déployé), relevés pour la reprise :

| Élément | Valeur |
|---|---|
| `name` | `P0 display ownership phone/tablet comparison` |
| Déclencheur | `workflow_dispatch` **seul** |
| `enabled` | booléen, requis, **défaut `false`** |
| `source_ref` | chaîne, requise, **sans défaut** ; SHA-1 complet 40 hex minuscules |
| Permissions | `actions: read`, `contents: read` |

Dépendances (graphe réel du fichier local) :

```
compile-display-harness (20 min) ─┐
build-display-apk (uses: preview-apk.yml) ─┴→ prepare-display-comparison (25 min)
                                              └→ capture-display-profile (45 min, matrice phone/tablet)
                                                  └→ aggregate-display-comparison (10 min)
```

`build-display-apk` n'a pas de `timeout-minutes` : c'est un job `uses:` (workflow
réutilisable), où ce champ n'est pas applicable. Ce n'est pas une anomalie.

---

## 4. Environnement du runner

**LIMITATION D'INFRASTRUCTURE — non vérifiable, et non supposée.**

```
$ gh api repos/Souxch06/Melodix/actions/runners
{"message":"Resource not accessible by integration","status":"403"}

$ gh api repos/Souxch06/Melodix/actions/permissions
{"message":"Resource not accessible by integration","status":"403"}
```

Le jeton d'intégration ne peut ni lire les permissions Actions, ni lister les
runners auto-hébergés. **La présence d'un runner compatible KVM n'est donc pas
établie.** Le droit de dispatch lui-même ne peut pas être confirmé.

Nuance à ne pas confondre : `gh api repos/…` renvoie
`permissions={admin:true, maintain:true, push:true, …}` pour **l'utilisateur**
`Souxch06`. Ce sont les droits du compte sur le dépôt, **pas** ceux du jeton
d'intégration, qui reçoit `403` sur les endpoints Actions. Aucune permission n'a
été supposée accordée.

### 4.1 FAIT OBSERVÉ — infrastructure locale incapable d'exécuter la campagne

`javac`, `java`, `adb`, `emulator`, `avdmanager`, `sdkmanager`, `aapt`, `apksigner`,
`zipalign`, `d8`, `shellcheck` : **tous absents du PATH**.
`/dev/kvm` : **absent**. `ANDROID_HOME` et `ANDROID_SDK_ROOT` : non définis.
Aucun SDK Android installé.

Une exécution locale de secours est donc impossible, indépendamment du blocage de
déploiement.

---

## 5. Résultats de chaque job

**TEST NON EXÉCUTÉ — les 5 jobs n'ont jamais démarré.**

| Job | État |
|---|---|
| `compile-display-harness` | **non démarré** |
| `build-display-apk` | **non démarré** |
| `prepare-display-comparison` | **non démarré** |
| `capture-display-profile` (phone) | **non démarré** |
| `capture-display-profile` (tablet) | **non démarré** |
| `aggregate-display-comparison` | **non démarré** |

Aucun n'est « ignoré » au sens CI (`skipped`) : ils n'ont pas été instanciés, faute
de workflow. Aucun run n'a été relancé, aucun YAML n'a été édité.

### 5.1 FAIT OBSERVÉ — aucun run P0 dans l'historique

Les 15 derniers runs du dépôt appartiennent à `Capture preview launch trace on
emulator` (tous `completed/skipped`) et `Smoke test Preview APK on Android 16
emulator` (`completed/failure`). Aucun run de comparaison display-ownership.

---

## 6. Preuve de compilation Java et de DEX

**Aucune preuve d'exécution CI.** Une étape déclarée dans le YAML n'est pas une
preuve ; le job `compile-display-harness` n'a jamais démarré.

État réel de la compilation, hors CI, tel qu'établi à la mission précédente et
**non requalifié ici** :

- **TEST RÉUSSI (JVM, hors CI)** : compilation du harness par **ECJ 3.8.2** contre
  un `android.jar` API 36 authentique → 77 fichiers `.class`, 0 erreur ;
  89/89 clés de sonde et les 6 signatures exigées par le job CI présentes.
- **LIMITATION** : ECJ n'est pas `javac` ; niveau de langage 7 sur une copie `/tmp`
  rendue Java-7-compatible par 8 `final` sémantiquement neutres. **Ce n'est pas la
  compilation Android complète de la CI.**
- **TEST NON EXÉCUTÉ** : `javac --release 8`, `javap`, **D8/DEX**. Aucun DEX n'a
  jamais été produit, ni localement ni en CI.

---

## 7. Preuve de construction et de vérification de l'APK

**TEST NON EXÉCUTÉ** pour toute la chaîne CI : construction, signature,
vérification du certificat, package, versions, SHA-256, installation sur les AVD.
Aucun APK de comparaison n'a été construit.

### 7.1 FAIT OBSERVÉ — seule vérification de provenance réellement effectuée

La provenance des trois assets générés a été **vérifiée localement**, par calcul
SHA-256 réel et comparaison à l'en-tête de dérivation :

| Asset | Source nommée | Digest en-tête = digest calculé |
|---|---|---|
| `assets/spotify_bridge.js` | `scripts/spotify_bridge.source.js` | **oui** — `e966178e76dccbd12113f944f30656b32192f03b777ff818811f38bbd9f53c36` |
| `assets/native_ui_shell.js` | `scripts/native_ui_shell.source.js` | **oui** — `a86ecbe9502c4b7e220342af139117209a48ea3aa5f4bf9bbaf6bb7d73f404e2` |
| `assets/melodix_home.js` | `scripts/melodix_home.source.js` | **oui** — `e6e421c0ac0eab0f6cedd5173441e4486cdca07e6a975dca4bc2b28fa471bf54` |

Les trois en-têtes sont conformes au format du contrat de build
(`terser=5.51.2; no-compress,no-mangle`), les trois sources sont présentes dans
HEAD, et **aucun asset n'est modifié localement**. Les mêmes assets sont présents à
`a6b0270` (tailles 119166, 101837, 45596 octets).

**Portée exacte de cette preuve** : elle établit que le contrôle de provenance des
assets *réussirait sur ce checkout*. Elle **ne prouve pas** que `verify_apk.sh` a
été exécuté, ni qu'un APK embarque ces assets — aucun APK n'existe.

---

## 8. Résultat du profil téléphone

**TEST NON EXÉCUTÉ.** Aucun AVD téléphone démarré, aucune instrumentation lancée,
**aucun sidecar** `display-ownership-phone.json` produit.

---

## 9. Résultat du profil tablette

**TEST NON EXÉCUTÉ.** Aucun AVD tablette démarré, aucune instrumentation lancée,
**aucun sidecar** `display-ownership-tablet.json` produit.

---

## 10. Cohérence des deux sidecars

**Non applicable : zéro sidecar existe.**

FAIT OBSERVÉ — recherche exhaustive dans les artefacts du dépôt :

```
$ gh api "repos/…/actions/artifacts?per_page=100" --jq '.total_count'
720
$ … select(.name|test("ownership|sidecar|combined|display")) | length
0
```

**Aucun** artefact de comparaison display-ownership n'existe, sur 720 artefacts.
Les artefacts présents sont notamment des `Melodix-Authenticated-Home-<sha>`, sans
rapport avec les sidecars attendus. Aucune intégrité, version de schéma, profil,
`source_ref`, SHA-256 APK, certificat, échéance ou champ de checkpoint ne peut donc
être audité. **Aucune mesure manquante n'a été inventée.**

Les audits demandés aux points 7 (200 ms) et 8 (quatre échéances suivantes) sont
par conséquent **NON EXÉCUTÉS** : ils portent sur des données qui n'existent pas.
La sémantique attendue reste celle implémentée et testée unitairement (splash
transitoire ≠ panne ; prise de contrôle Spotify Web = `observed` ; `undetermined`
jamais converti en `not_observed`), mais **aucune observation réelle ne la
confirme**.

---

## 11. Résultat de l'agrégateur

**TEST RÉUSSI — sur la condition réelle « sidecars absents », pas sur des mesures.**

L'agrégateur **officiel, non modifié**, a été exécuté dans l'état exact de cette
mission : aucun sidecar disponible.

```
$ python3 scripts/aggregate_p0_display_ownership.py \
    --source-ref 44902d9… --run-id 0 --apk-sha256 000…0 \
    --phone-report <inexistant> --tablet-report <inexistant> --output <…>
code de sortie = 1
stderr = redacted_display_ownership_report=failed; reason=redacted profile report is unreadable
artefact produit = ABSENT
```

Avec un seul sidecar présent et l'autre manquant :

```
code de sortie ≠ 0
stderr = … reason=redacted profile report does not match the exact sidecar schema
artefact produit = ABSENT
```

**Verdict exact : échec fail-closed, aucune sortie produite.** L'agrégateur n'a été
modifié en aucune façon. Ce test démontre le comportement sur entrée manquante ;
**il ne constitue pas une agrégation de résultats Android** et ne dit rien du
comportement d'affichage.

---

## 12. Confidentialité

**FAIT OBSERVÉ — aucune fuite, et pour cause : aucune donnée runtime n'a été
récupérée.** Aucun sidecar, aucun log Android brut, aucun logcat, aucune capture
d'écran, aucune hiérarchie UI n'a été lu ou conservé pendant cette mission.

Les seules sorties manipulées sont : métadonnées git, métadonnées d'API GitHub
(identifiants de workflows/runs, noms d'artefacts), empreintes SHA-256 d'assets, et
messages d'erreur catégorisés de l'agrégateur. Aucun token, cookie, identifiant de
session, URL privée, chemin utilisateur ou titre musical n'a été introduit dans ce
rapport. Les valeurs de jetons n'ont jamais été affichées (`gh auth status` les
masque). Aucun log complet n'est copié ici.

---

## 13. Limites et incidents

1. **LIMITATION D'INFRASTRUCTURE — blocage principal** : le workflow et les 5
   scripts P0 n'existent que comme fichiers locaux non suivis. Ils ne sont pas
   déployés. Le dispatch est structurellement impossible sans commit+push,
   interdits.
2. **LIMITATION D'INFRASTRUCTURE** : `403 Resource not accessible by integration`
   sur `actions/permissions` et `actions/runners`. Compatibilité KVM et droit de
   dispatch **non établis**.
3. **LIMITATION D'INFRASTRUCTURE** : aucun outil Android, aucun `/dev/kvm`
   localement. Pas d'exécution de secours possible.
4. **Incident de reconciliation (corrigé)** : `a6b0270` avait été déclaré absent ;
   il est absent du clone *shallow* mais **présent sur le distant**. La baseline et
   le rapport d'ingénierie sont corrigés en conséquence.
5. **LIMITATION** : le clone local est superficiel (1 commit) et en retard sur le
   tip distant de sa propre branche. Toute comparaison future doit commencer par
   une réconciliation explicite, jamais par un `reset`.
6. **HYPOTHÈSE non vérifiée** : que le job réussisse une fois déployé. Rien dans
   cette mission ne l'établit. La compilation CI, la génération DEX, la signature
   et l'installation sur AVD n'ont jamais été observées.

---

## 14. Verdict P0

# `OUVERT — PRÉPARATION NON DÉPLOYÉE`

**Ce verdict révise celui de la mission précédente** (`OUVERT — JOB PRET MAIS NON
EXECUTE`). La préparation n'est **pas** complète : le job n'est pas déployé, donc
il n'est pas prêt à être exécuté. Les conditions de résolution sont évaluées
une par une :

| Condition requise | État |
|---|---|
| Deux profils réellement exécutés | **non** — aucun run |
| Sidecars complets et comparables | **non** — 0 sidecar |
| Cinq checkpoints exploitables | **non** — aucune mesure |
| Aucune prise de contrôle Spotify Web observée | **non établi** — rien d'observé |
| Dock réellement visible et non recouvert | **non établi** — logique testée sur JVM seulement |
| Agrégateur validant les deux profils | **non** — échec fail-closed sur entrées absentes |
| Aucune anomalie de provenance ou confidentialité | provenance des assets **vérifiée localement** ; aucune fuite ; mais chaîne APK non exécutée |

**Sept conditions sur sept ne sont pas satisfaites ou pas établies.** Un succès
technique du harness, 579 tests unitaires verts et une compilation JVM partielle ne
résolvent pas un problème d'affichage sur appareil.

---

## 15. Action prioritaire unique pour la reprise

**Déployer la préparation** : committer et pousser, sur la branche de session
uniquement, le workflow `p0-display-ownership.yml`, les 5 scripts `p0_display_*.sh`,
l'agrégateur v2, le harness modifié et les suites de tests — puis vérifier que
GitHub enregistre le workflow.

Cette action requiert une **autorisation explicite de commit/push**, absente à ce
jour. Elle est le préalable obligatoire à tout dispatch : tant qu'elle n'est pas
faite, aucune exécution réelle n'est possible, quel que soit l'état du runner.

Ensuite seulement : dispatch avec `enabled=true` et un `source_ref` désignant le
commit déployé, sur un runner KVM dont la disponibilité reste à établir.
