# Melodix — Réconciliation git et audit pré-commit du P0 Display Ownership

Date : 2026-11-04. Branche : `arena/6b935c3e-melodix` (statut **active**).

> **Aucun commit, aucun push, aucun merge, aucun rebase, aucun reset, aucun clean,
> aucun dispatch.** Ce document prépare une intégration ; il ne l'exécute pas.
> Verdict : **`OUVERT — PRÉPARATION NON DÉPLOYÉE`**.

---

## 1. État git initial

Relevé par les 12 commandes demandées, avant toute modification.

| Élément | Valeur observée |
|---|---|
| `git rev-parse --show-toplevel` | `/home/user/Melodix` |
| `git rev-parse HEAD` | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` |
| `git branch --show-current` | `arena/6b935c3e-melodix` |
| `git branch -vv` | `* arena/6b935c3e-melodix 44902d9 [skip ci] Add historical P0 VerifyError replay` — **aucun upstream** |
| `main` | `81ef774fcb2208d4c4e999943411040aa1bfa33f` `[origin/main]` |
| `git rev-parse --is-shallow-repository` | **true** (2 entrées dans `.git/shallow`) |
| `git diff --stat` | **7 fichiers, +649 / −28** |
| Fichiers non suivis | **18** |
| `git reflog --all` | `clone` → `checkout` → `branch: Created from 44902d9…` uniquement |

**Divergence avec l'indication historique** : 18 non suivis et non 17. Le fichier
supplémentaire est `docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md`,
créé par la mission d'exécution précédente. Divergence expliquée, aucune anomalie.

## 2. État git final

**Identique à l'état initial pour tout ce qui est suivi par git.**

| Contrôle | Initial | Final |
|---|---|---|
| HEAD | `44902d9…` | `44902d9…` |
| `main` | `81ef774…` | `81ef774…` |
| Branche courante | `arena/6b935c3e-melodix` | idem |
| `git diff --stat` | 7 fichiers, +649/−28 | **7 fichiers, +649/−28** |
| Non suivis | 18 | **19** (+ ce rapport, seul fichier créé) |
| Entrées `git status` | 25 | **26** |
| Reflog HEAD | clone → checkout | **clone → checkout** (inchangé) |
| Ref de suivi local | absent | `origin/arena/6b935c3e-melodix` → `a6b0270` (créé par le fetch, §5) |

Seuls des **fichiers déjà non suivis** ont été modifiés (contenu de tests et de
documents), plus **un fichier créé** : ce rapport. Aucun fichier suivi n'a été
touché, aucun fichier supprimé, aucun fichier écrasé par une version distante.
Le diff des fichiers suivis est **rigoureusement identique** : 7 fichiers,
+649 / −28, avant et après.

## 3. Branche locale et distante

| Référence | SHA |
|---|---|
| Locale `arena/6b935c3e-melodix` | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` |
| **Distante `origin/arena/6b935c3e-melodix`** | **`a6b02705cedfb098d9d63ccc43a21319f5c9cf6d`** |
| Locale et distante `main` | `81ef774fcb2208d4c4e999943411040aa1bfa33f` |
| Distante `arena/7142700d-melodix` | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` |
| Distante `arena/dbf2d44f-melodix` | `5d38b1fdd9c08df9033f674e57e26b09b7b6f261` |

**La branche locale est en retard de 10 commits sur son homologue distante** et
n'a pas d'upstream configuré. `44902d9` est un **ancêtre** de `a6b0270`
(`git merge-base --is-ancestor` → vrai), donc l'écart est un simple retard, pas une
divergence d'historique.

## 4. SHA de chaque référence pertinente

Les 10 SHA rapportés comme « absents » lors des missions précédentes sont
**désormais tous accessibles** après récupération (§5) :

`a6b0270`, `8a253f3`, `f045da3`, `156c55a`, `f4410c7`, `8f5e4a2`, `75a092f`,
`eacfef8`, `b317c3f`, `31010cf` — tous `git cat-file -t` → `commit`.

Chaîne `44902d9..a6b0270` (10 commits) :

```
a6b0270 Add fail-closed phone/tablet display-ownership comparator for the P0
8a253f3 Add full project audit (2026-11-04)
f045da3 Ignore Python bytecode from local diagnostic script runs
156c55a Document the first successful historical P0 VerifyError replay
f4410c7 Use the valid brief logcat format for AndroidRuntime VerifyError capture
8f5e4a2 Fall back to the main logcat buffer and surface adb stderr in replay
75a092f Tolerate transient adb logcat read errors in the P0 replay capture
eacfef8 Fail closed on unparseable VerifyError and attribute replay capture exits
b317c3f Add phase-level diagnostics to the P0 replay capture step
31010cf Fix P0 replay signer fingerprint format to match embedded resources
```

## 5. Récupération des objets manquants — opération tracée

Une seule commande de récupération, dans un **espace de refs dédié** :

```
git fetch --depth=60 origin \
  refs/heads/arena/6b935c3e-melodix:refs/reconcile/arena-6b935c3e
```

Effets observés et vérifiés :

- création de `refs/reconcile/arena-6b935c3e` → `a6b0270…` ;
- création **automatique** par git du ref de suivi local
  `refs/remotes/origin/arena/6b935c3e-melodix` → `a6b0270…` (ref **local**, effet du
  refspec de fetch configuré) ;
- **60 commits** désormais accessibles depuis cette ref ;
- `HEAD` **inchangé**, `main` **inchangé**, `.git/shallow` toujours 2 entrées ;
- **aucune branche déplacée, aucun historique réécrit, aucune ref distante
  modifiée**. Le dépôt GitHub n'a reçu aucune écriture.

## 6. Réconciliation avec `a6b0270` — matrice complète

Comparaison **octet par octet** (SHA-256) des 25 fichiers du workspace avec
l'arbre de `a6b0270`.

| Catégorie | Nombre | Signification |
|---|---|---|
| **Identique à `a6b0270`** | **9** | déjà intégré à git ; le statut M/?? local vient du retard de 10 commits |
| **Modifié après `a6b0270`** | **3** | évolution v1 → v2 légitime |
| **Nouveau (absent de `a6b0270`)** | **13** | travail non encore intégré |
| Fichier absent / divergence inexpliquée | **0** | aucune |

### 6.1 Identiques à `a6b0270` (9) — déjà intégrés

`.github/workflows/test-preview-emulator.yml`, `.gitignore`, `docs/RAPPORT_A_H.md`,
`scripts/sanitize_verify_diagnostic.py`, `tests/p0_verify_diagnostic.test.js`,
`tests/preview_workflow.test.js`,
`docs/audits/melodix-audit-complet-2026-11-04.md`,
`docs/audits/melodix-p0-display-ownership-comparator-2026-11-04.md`,
`docs/audits/melodix-p0-verifyerror-replay-2026-11-04.md`.

**Ces 9 fichiers ne doivent pas figurer dans le futur commit** : leur contenu est
déjà celui de `a6b0270`. Les y inclure créerait un commit trompeur.

### 6.2 Modifiés après `a6b0270` (3) — évolution légitime démontrée

| Fichier | vs `a6b0270` | Preuve de la direction |
|---|---|---|
| `scripts/aggregate_p0_display_ownership.py` | +106 / −8 | `schema_version` 1 → **2** ; nouvelle fonction `_expected_takeover_state` |
| `tests/p0_display_ownership_aggregate.test.js` | +378 / −2 | fixtures `schema_version: 2`, cas v1 conservé en rejet |
| `tests/android/HomeRenderInstrumentation.java` | +453 / −6 | `schema_version` 2 ; mesure d'occlusion du dock |

Aucune régression : les ajouts dominent largement et le schéma monte de version.

### 6.3 Nouveaux (13)

Workflow P0 ; 5 scripts `p0_display_*.sh` ; 4 documents de mission (baseline,
ingénierie, exécution, job, runbook — soit 5 documents) ; 2 suites de tests
(`..._workflow.test.js`, `..._dock_visibility.test.js`).

> **Aucune affirmation de « restauration »** : rien n'a été restauré depuis
> `a6b0270`. Les 9 fichiers identiques l'étaient **déjà** dans le workspace ; la
> correspondance est constatée, pas produite.

## 7. Inventaire exhaustif — Liste A (16 fichiers intégrables)

| Chemin | Statut | Octets | SHA-256 | Rôle |
|---|---|---|---|---|
| `.github/workflows/p0-display-ownership.yml` | ?? | 22410 | `1999e596…547287f4` | workflow opt-in 5 jobs |
| `scripts/p0_display_verify_apk.sh` | ?? | 13586 | `9ff141cc…d20b3ff5` | provenance APK + assets |
| `scripts/p0_display_build_harness.sh` | ?? | 5295 | `d39516c4…cce9a33b` | harness signé assorti à l APK |
| `scripts/p0_display_boot_avd.sh` | ?? | 8508 | `057eac95…a5a2df6e` | boot AVD borné + diagnostic assaini |
| `scripts/p0_display_run_profile.sh` | ?? | 9341 | `7f6c4b4e…0a22f39a` | capture + watchdog + sidecar |
| `scripts/p0_display_stop_avd.sh` | ?? | 2961 | `7f86ebc6…cd0e62c3` | arrêt ciblé |
| `scripts/aggregate_p0_display_ownership.py` | ?? | 20725 | `999ed845…d2cfc35b` | agrégateur v2 fail-closed |
| `tests/android/HomeRenderInstrumentation.java` | M | 422111 | `b9ef4a6f…f394a886` | harness (6696 lignes) |
| `tests/p0_display_ownership_workflow.test.js` | ?? | 73046 | `d9617900…5126f028` | 22 tests (provenance, AVD, zombie) |
| `tests/p0_display_ownership_aggregate.test.js` | ?? | 30430 | `707847d4…da5a6305` | 13 tests (agrégat, canaris) |
| `tests/p0_display_dock_visibility.test.js` | ?? | 9498 | `c72d5d3b…e42997b8` | 1 test JVM exécuté (21 cas) |
| `docs/audits/melodix-autonomous-session-baseline-2026-11-04.md` | ?? | 12565 | `47c3945f…a95c07ef` | baseline |
| `docs/audits/melodix-autonomous-engineering-report-2026-11-04.md` | ?? | 29904 | `9bde86a1…e4e62370` | rapport d ingénierie |
| `docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md` | ?? | 17629 | `01955eb4…56c4f857` | tentative d exécution |
| `docs/audits/melodix-p0-display-ownership-job-2026-11-04.md` | ?? | 9389 | `80606d9a…e9ab6e5a` | description du job |
| `docs/audits/melodix-p0-display-ownership-runbook-2026-11-04.md` | ?? | 11836 | `a8744c9a…c7d2cc31` | runbook |

Justification d'inclusion : ce sont **exactement** les fichiers nécessaires et
suffisants pour que le workflow soit reproductible depuis un checkout propre —
démontré au §13.

## 8. Liste B — à exclure du commit (9 fichiers)

| Chemin | Raison | Risque si inclus | Action |
|---|---|---|---|
| les 9 fichiers du §6.1 | contenu **déjà identique** à `a6b0270` | commit trompeur, bruit de diff | **ne pas ajouter** ; ils deviennent propres après avance rapide de la branche |

**Aucun fichier n'est à exclure pour cause de risque fonctionnel.** Aucun fichier
n'a été supprimé, aucun n'a été écrasé par une version distante.

## 9. Divergences identifiées et explication

| Divergence | Explication | Statut |
|---|---|---|
| 18 non suivis vs 17 annoncé | + le rapport d'exécution créé entre-temps | expliquée |
| 9 fichiers marqués M/?? alors que déjà commités | clone en retard de 10 commits | expliquée |
| `a6b0270` « absent » aux missions précédentes | absent du clone *shallow*, présent sur le distant | corrigée dans la baseline |
| Branche locale sans upstream | clone créé depuis la branche parente | documentée, à corriger par l'humain |
| 573 tests / 1 échec lors du 1er test de reproductibilité | `git archive` n'inclut pas `.git` ; `css_theme_integrity` appelle `git ls-files` | **artefact de méthode**, corrigé (§13) |
| `all_checkpoints_determinate` décrit comme fonction | c'est un **champ de sortie** (ligne 338), pas une fonction | documentation vérifiée exacte |

**Aucune divergence inexpliquée ne subsiste.**

## 10. Corrections apportées pendant cette mission

1. **Test comportemental du zombie et de l'identité d'arrêt**
   (`tests/p0_display_ownership_workflow.test.js`). Comble un écart réel : le
   script d'arrêt n'avait aucun test pour le zombie, ni pour PID absent/invalide/1,
   ni pour répertoire d'état manquant, ni pour un **imposteur** (processus non
   émulateur citant `-avd <nom>`).
   - Zombie créé par un parent qui ne réape pas : état `/proc` **Z**, `cmdline`
     **vide**, `kill -0` **réussit** → le script refuse d'envoyer un signal et
     l'indique honnêtement.
   - L'imposteur doit rester vivant : c'est ce qui rend le garde `*emulator*`
     discriminant (sans ce cas il pouvait être supprimé sans être vu).
2. Aucun autre changement de code. Aucun changement de production.

## 11. Résultats des tests — tous frais

| Vérification | Résultat |
|---|---|
| Suite npm complète (workspace) | **580 tests, 580 pass, 0 fail, 0 skipped, 0 todo** |
| `p0_display_ownership_workflow.test.js` | **22 pass** |
| `p0_display_ownership_aggregate.test.js` | **13 pass** |
| `p0_display_dock_visibility.test.js` | **1 pass, exécuté réellement sur JVM (21 cas)** |
| `bash -n` (5 scripts) | OK |
| `py_compile` (2 scripts Python) | OK |
| PyYAML | **6 workflows, 54 blocs `run:`** |
| `javalang` | parsing OK, 6696 lignes |
| `git diff --check` | propre |

Aucun ancien résultat n'a été réutilisé comme preuve : la suite a été relancée
après chaque modification, et l'environnement vérifié avant (`jsdom`, PyYAML,
`javalang`, JRE, jars tous présents).

### 11.1 Agrégateur — chaîne fail-closed vérifiée de bout en bout

**43 points de rejet** (`raise ValueError`) dans `aggregate_p0_display_ownership.py`,
couvrant les 17 catégories exigées : schéma exact du sidecar, version de schéma,
profil demandé, provenance (`source_ref`/`run_id`/`apk_sha256`), état authentifié,
état de session, chronologie relative au lancement, `SF_CONFIG.guiMode`, métriques
appareil, orientation, seuil `smallestScreenWidthDp` téléphone/tablette, viewport
WebView, drapeaux de classes du `body`, nombre de checkpoints, transitions
monotones, géométrie, booléens, et scan de confidentialité.

**Cinq échéances strictement relatives au lancement réel** :
`CHECKPOINTS = ("200ms","1s","3s","8s","20s")` avec
`TARGET_MS = {200, 1000, 3000, 8000, 20000}`. La chronologie n'est **pas**
recalée après disparition du splash : le rejet
`"timeline must be launch-relative, not post-stabilization"` l'interdit.

**200 ms** distingue splash / natif / Spotify Web / Melodix Web / login Web /
inconnu via `center_surface_owner` + `splash_transient` +
`web_center_takeover_state`, mesurés dans la hiérarchie native — donc disponibles
avant même qu'un WebView existe.

**Les 4 échéances stabilisées** (`1s`, `3s`, `8s`, `20s`) exigent
`display_owner == "native"` **et** `native_owner_verified is True` **et**
`native_root_visible is True`. La chaîne complète a été relue et confirmée :

```
dockUnoccluded(...)                      # L6571, règle géométrique pure
  ← nativeDockActuallyVisible(...)       # L6605, occlusions hScroll + splash
  ← rootCoversDock                       # L6388
  ← nativeVerified                       # L6430 (8 conditions conjonctives)
  → checkpoint["native_owner_verified"]  # L6442
  → exigé True par l'agrégateur          # L319, sur les 4 échéances
```

Un recouvrement réel du dock par le WebView fait donc échouer les quatre
échéances stabilisées. Le nom de variable `rootCoversDock` est **hérité** et
trompeur (il ne s'agit plus de `contains`) ; il est conservé pour éviter un
changement cosmétique, et documenté ici.

**Jamais inconnu → positif** : `DETERMINATE_TAKEOVER_STATES` n'admet que
`observed` et `not_observed` ; tout état `undetermined` place l'échéance dans
`undetermined_checkpoints` et fait passer `all_checkpoints_determinate` à
`false`. Le mutant R6 (conversion `undetermined` → `not_observed`) est détecté.

## 12. Résultats des mutations — campagne fraîche

**16 mutants, 16 détectés**, tous appliqués à des copies `/tmp`
(`/tmp/recon-mut`), fichiers restaurés après chaque cas.

| Mutant | Contrôle attaqué | Verdict |
|---|---|---|
| R1 | `apksigner verify … \|\| die` → `\|\| true` | DÉTECTÉ |
| R2 | `HEX64.fullmatch(asset_sha256)` affaibli | DÉTECTÉ |
| R3 | comparaison octet à octet avec le checkout supprimée | DÉTECTÉ |
| R4 | scan de confidentialité désactivé (`hits = []`) | DÉTECTÉ |
| R5 | allowlist racine relâchée en sur-ensemble | DÉTECTÉ |
| R6 | `undetermined` converti en `not_observed` | DÉTECTÉ |
| R7 | occlusion du dock ignorée | DÉTECTÉ |
| R8 | ordre de dessin ignoré (Z seul) | DÉTECTÉ |
| R9 | vivacité avant instrumentation supprimée | DÉTECTÉ |
| R10 | watchdog aveugle | DÉTECTÉ |
| R11 | sidecar vide accepté | DÉTECTÉ |
| R12 | contrat de code retour relâché | DÉTECTÉ |
| S1 | garde `*emulator*` du cmdline supprimée | DÉTECTÉ |
| S2 | garde `-avd <nom>` supprimée | DÉTECTÉ |
| S3 | garde `PID > 1` supprimée | DÉTECTÉ |
| S4 | validation du format de PID supprimée | DÉTECTÉ |

**Deux faux écarts ont été investigués au lieu d'être rapportés comme des trous :**

- **R4** paraissait survivre : mon filtre `--test-name-pattern 'privacy canaries'`
  ne sélectionnait pas le second test de confidentialité. Sur la suite complète,
  R4 est **détecté** (1 échec). L'allowlist est la barrière primaire ; c'est le test
  du scan direct qui détecte sa désactivation.
- **S1** survivait réellement à la première version du test : pour un zombie le
  `cmdline` est vide, donc le garde `-avd` suffisait. Le cas de l'**imposteur** a
  été ajouté, et S1 est désormais détecté.

## 13. Reproductibilité — démontrée

### 13.1 Le workflow dépendait de fichiers non suivis

Tous les jobs font `actions/checkout@v7.0.1` avec `ref: ${{ github.sha }}` vers
`tooling/`. Extraction d'un checkout propre (`git archive`, lecture seule) :

| Fichier requis | depuis `HEAD` | depuis `a6b0270` |
|---|---|---|
| `p0-display-ownership.yml` | **MANQUE** | **MANQUE** |
| les 5 scripts `p0_display_*.sh` | **MANQUENT** | **MANQUENT** |
| `aggregate_p0_display_ownership.py` | **MANQUE** | présent (v1) |
| `HomeRenderInstrumentation.java` | présent (v1) | présent (v1) |

**7 des 8 fichiers requis manquent depuis HEAD, 6 depuis `a6b0270`.** Le workflow
n'était donc pas exécutable depuis un clone neuf. C'est la justification factuelle
de la Liste A.

### 13.2 Preuve de suffisance

Checkout propre de `a6b0270` **+ les 16 fichiers de la Liste A**, dans un dépôt git
jetable sous `/tmp/integration-check` :

```
# tests 580
# pass 580
# fail 0
# skipped 0
```

**Résultat identique au workspace.** La Liste A est donc **complète et suffisante**.
Le dépôt Melodix est resté inchangé pendant ce test (HEAD, status et reflog
revérifiés après).

### 13.3 Absence de dépendances propres à Arena

| Contrôle | Résultat |
|---|---|
| Chemins absolus Arena (`/home/…`, `jdk4py`, `.melodix-toolchain`, `/tmp/android-build`) dans les 6 scripts | **aucun** |
| Variables requises | `ANDROID_HOME`, `SOURCE_ROOT`, `P0_DISPLAY_AVD_STATE_DIR` — toutes fournies par le workflow |
| `actions/checkout@v7.0.1` | **existe** (tag vérifié, `3d3c42e5…`) |
| Artefacts upload ↔ download | noms et chemins **concordants** |
| Arguments des scripts | **6/6/4/7/1** — tous conformes aux lignes `usage` |

Seul le **test du dock** cherche un compilateur local ; il utilise `javac` en CI et
se déclare *skippé* explicitement sinon. Ce n'est pas une dépendance du workflow.

## 14. Frontière production / test — vérifiée

Audit par chemin **et** par extension sur l'union des diffs vs `HEAD` et vs
`a6b0270` plus les non suivis : **25 fichiers**.

| Classe | Nombre |
|---|---|
| CI (`.github/`) | 2 |
| Outillage (`scripts/`) | 7 |
| Tests (`tests/`) | 6 |
| Documentation (`docs/`, `.md`) | 9 |
| Config dépôt (`.gitignore`) | 1 |
| **Production** | **0** |

Extensions touchées : `.py` 2, `.js` 5, `.md` 9, `.sh` 5, `.yml` 2, `.java` 1,
sans extension 1.

Contrôles indépendants négatifs : **aucun** `.smali`, **aucun** `AndroidManifest`,
**aucun** `.gradle`, **aucun** `apktool.yml`, **aucun** `res/`, **aucun** `assets/`.
Le seul `.java` est `tests/android/HomeRenderInstrumentation.java` → **test**.
Le layout `res/layout/activity_main.xml` a été **lu** (pour établir la tautologie du
dock), **jamais modifié**.

## 15. Confidentialité — vérifiée

- `_privacy_scan` est **réellement appelé deux fois** : sur chaque sidecar entrant
  (ligne 309) et sur le rapport combiné sortant (ligne 388). Ce n'est pas une
  allowlist seule.
- **15 catégories de canaris × 4 profondeurs = 60 exécutions** : refus, aucun
  artefact, et **aucun canari dans stdout/stderr**.
- Diagnostics AVD : mêmes 15 canaris injectés dans le log **et** dans les
  paramètres recopiés ; aucun ne survit, les vraies catégories de panne restent
  détectées, `raw_log_retained: false`.
- Le mutant **R4** (scan désactivé) est **détecté** : les tests échouent bien si le
  scan est retiré.
- Frontière assumée et testée : le scan reconnaît 13 des 15 catégories ; un chemin
  utilisateur nu et un titre musical sont refusés par l'**allowlist**, pas par le
  scan. Cette répartition est assertée explicitement.
- Aucun token, cookie, session, URL privée, chemin personnel, titre musical ou log
  Android brut n'a été introduit dans les documents de cette mission.

## 16. État du workflow GitHub

**Non enregistré. Non exécutable. Aucun run.**

```
gh api repos/Souxch06/Melodix/actions/workflows --jq .total_count   → 7
gh api …/actions/workflows/p0-display-ownership.yml                 → 404
gh api …/contents/…/p0-display-ownership.yml?ref=main               → 404
```

Les 7 workflows enregistrés sont `launch-smoke-emulator`, `preview-apk`,
`preview-launch-trace`, `release-apk`, `release-asset-refresh`,
`test-preview-emulator`, `validate-android-assembly`. Le workflow P0 n'y est pas, et
le fichier est absent de `main` **et** de `a6b0270`.

Audit du fichier local (favorable, mais **non déployé**) :

| Contrôle | Résultat |
|---|---|
| Déclencheur | `workflow_dispatch` seul |
| `enabled` | requis, **défaut `false`**, garde présente sur **les 5 jobs** |
| `source_ref` | requis, **sans défaut**, 40 hex minuscules |
| Permissions | `actions: read`, `contents: read` par job |
| `git commit` / `git push` / release / publication | **0 occurrence** |
| Dépendances | compilation **en amont et bloquante** ; agrégation après les 2 captures |
| Agrégateur | reçoit exactement les 2 sidecars téléchargés ; `p0_resolution_claimed` doit valoir `false` |

Permissions et runners : `403 Resource not accessible by integration` sur
`actions/permissions` et `actions/runners` → **compatibilité KVM et droit de
dispatch non établis**. Les `admin:true` de l'API sont ceux du compte, pas du jeton.

## 17. Limites de compilation Android

**Compilation réelle effectuée, mais partielle et hors CI.**

| Élément | État |
|---|---|
| Compilateur | **ECJ 3.8.2** (`org.eclipse.jdt.core.compiler.batch`), **pas `javac`** |
| Bibliothèque | `android.jar` **API 36 authentique**, sha256 `d9eb9da8…59b59f9a`, 14996 entrées, corps `Stub!`, sans API cachée |
| Niveau de langage | **1.7** (ECJ 3.8.2 plafonne à Java 7) |
| Source compilée | **copie `/tmp`** avec **8 `final`** ajoutés (6 locales, 2 paramètres), sémantiquement neutres car déjà effectivement finales. **Dépôt intact.** |
| Résultat | **77 `.class`, 0 erreur**, major **51**, classe principale 235218 o, sha256 `2fb7af5e…84c0a0f94` — **reproductible** (même SHA qu'à la mission précédente) |
| `dockUnoccluded` | présent dans le bytecode |
| **Non fait** | `javac --release 8`, `javap`, **D8/DEX**, APK, signature, **aucune exécution Android** |

Environnement local : `javac`, `adb`, `emulator`, `d8`, `apksigner` **absents**,
`/dev/kvm` **absent**, aucun SDK.

**Le contrôle du dock est bien discriminant** : `dockUnoccluded` est extrait
verbatim, compilé et **exécuté sur JVM** (21 cas). Un cas démontre que l'ancienne
formule `rootBounds.contains(dockBounds)` restait **vraie** sous occlusion — la
tautologie n'a pas été réintroduite. Les mutants R7/R8 sont détectés.

## 18. État du P0

# `OUVERT — PRÉPARATION NON DÉPLOYÉE`

| Condition de résolution | État |
|---|---|
| Workflow intégré à git et enregistré sur GitHub | **non** (404) |
| Deux profils réellement exécutés | **non** — aucun run |
| Sidecars complets et comparables | **non** — 0 sidecar (0 artefact « display » sur 720) |
| Cinq échéances exploitables | **non** — aucune mesure |
| Aucune prise de contrôle Spotify Web observée | **non établi** |
| Dock réellement visible et non recouvert | **non établi** — logique prouvée sur JVM seulement |
| Agrégateur validant les deux profils | **non** — fail-closed sur entrées absentes (exit 1, aucun artefact) |

Même après intégration, le P0 restera ouvert jusqu'à obtention et validation des
mesures Android téléphone **et** tablette issues du même APK.

## 19. Proposition de commit — NON EXÉCUTÉE

### 19.1 Préalable obligatoire (action humaine)

La branche locale est en retard de 10 commits sur `origin/arena/6b935c3e-melodix`.
**Committer en l'état produirait un historique divergent.** L'humain doit d'abord
avancer la branche locale jusqu'à `a6b0270` (avance rapide, `44902d9` étant ancêtre),
ou repartir d'un clone complet de la branche. Cette mission ne l'a **pas** fait :
`merge`, `rebase` et `reset --hard` sont interdits.

Après cette avance rapide, les **9 fichiers de la Liste B redeviennent propres**
d'eux-mêmes, et il ne reste que les 16 fichiers de la Liste A.

### 19.2 Commande `git add` proposée (à ne pas exécuter sans autorisation)

```bash
git add \
  .github/workflows/p0-display-ownership.yml \
  scripts/p0_display_verify_apk.sh \
  scripts/p0_display_build_harness.sh \
  scripts/p0_display_boot_avd.sh \
  scripts/p0_display_run_profile.sh \
  scripts/p0_display_stop_avd.sh \
  scripts/aggregate_p0_display_ownership.py \
  tests/android/HomeRenderInstrumentation.java \
  tests/p0_display_ownership_workflow.test.js \
  tests/p0_display_ownership_aggregate.test.js \
  tests/p0_display_dock_visibility.test.js \
  docs/audits/melodix-autonomous-session-baseline-2026-11-04.md \
  docs/audits/melodix-autonomous-engineering-report-2026-11-04.md \
  docs/audits/melodix-p0-display-ownership-job-2026-11-04.md \
  docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md \
  docs/audits/melodix-p0-display-ownership-runbook-2026-11-04.md \
  docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md
```

(17 chemins : les 16 de la Liste A + ce rapport.)

Ce rapport est le **19ᵉ** fichier non suivi ; il n'apparaît pas dans le tableau §7
car son empreinte SHA-256 changerait à chaque correction de ce document —
l'auto-référencer serait une empreinte fausse. Son empreinte doit être recalculée
par l'humain au moment du `git add` :

```bash
sha256sum docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md
```

### 19.3 Message de commit proposé

```
Deploy the opt-in P0 display-ownership measurement tooling

Make the phone/tablet display-ownership comparison reproducible from a clean
checkout. Until now the workflow and its five shell helpers existed only as
untracked local files, so no clean clone could run them and GitHub had no
registered workflow to dispatch.

- add the manual, opt-in p0-display-ownership workflow (enabled defaults to
  false, source_ref required, read-only permissions, no publication);
- add the five AVD/APK helpers: provenance verification, signed harness build,
  bounded boot, instrumented capture with a liveness watchdog, targeted stop;
- upgrade the aggregator to sidecar schema 2 with launch-relative checkpoints,
  a determinate takeover verdict and fail-closed privacy scanning;
- replace the tautological dock check with a real occlusion measurement:
  nativeHomeTab is a descendant of nativeRoot, so getGlobalVisibleRect already
  clipped it to the root and contains() could never fail under a WebView
  takeover;
- add behavioural tests for APK provenance, the AVD lifecycle (including
  zombie and impostor PIDs), privacy canaries, and the dock rule executed on a
  real JVM.

No production behaviour changes: no Smali, login, session, playlist, playback,
MediaSession, production WebView or bridge is touched. The only Java file is
the test instrumentation. The P0 stays open: no Android run has been performed.
```

### 19.4 Tests devant passer avant validation humaine

`npm test` → **580/580, 0 skip** ; `bash -n` sur les 5 scripts ; `py_compile` ;
PyYAML sur les 6 workflows ; `git diff --check`. En CI uniquement :
`javac --release 8` + `javap` + `d8` du job `compile-display-harness`.

## 20. Actions nécessitant une autorisation humaine

1. **Avancer la branche locale** jusqu'à `a6b0270` (avance rapide) — ou recloner
   la branche complètement. Requis avant tout commit.
2. **Autoriser le commit** des 17 chemins du §19.2.
3. **Autoriser le push** sur `arena/6b935c3e-melodix` uniquement.
4. **Vérifier l'enregistrement** du workflow par GitHub après push.
5. **Établir la disponibilité d'un runner KVM** et le droit de dispatch — tous deux
   non vérifiables avec le jeton actuel (`403`).
6. **Autoriser le dispatch** avec `enabled=true` et le `source_ref` du commit déployé.
7. **Analyser les deux sidecars réels** et statuer sur le P0.

Aucune de ces actions n'a été effectuée. Le dépôt local est préservé, cohérent et
prêt pour validation humaine.
