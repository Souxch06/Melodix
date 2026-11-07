# Melodix — Intégration propre sur `a6b0270` : proposition soumise à autorisation

Date : 2026-11-04. **Aucun commit. Aucun push. Aucun merge. Aucun dispatch.**
Aucune écriture Git distante. Aucune modification du code de production.

> Verdict P0 : **`OUVERT — PRÉPARATION NON DÉPLOYÉE`**.
> Ce document est une **proposition**, pas une intégration réalisée.

---

## 0. Résumé décisionnel

| Question | Réponse |
|---|---|
| Base d'intégration | **`a6b02705cedfb098d9d63ccc43a21319f5c9cf6d`** |
| Fichiers à intégrer | **18** (3 modifiés + 15 nouveaux, ce rapport inclus) |
| Fichiers exclus car déjà présents | **9** |
| Diff sur fichiers suivis | **3 fichiers, +937 / −16** |
| Nouveaux fichiers | 15 fichiers, ~275 Ko |
| Tests frais dans le worktree | **580 / 580 pass, 0 fail, 0 skipped** |
| Production modifiée | **0 fichier** |
| Workspace initial | **intact** (HEAD `44902d9`, 26 entrées, +649/−28) |
| Prêt pour décision humaine | **oui** |

---

## 1. SHA de base exact

```
a6b02705cedfb098d9d63ccc43a21319f5c9cf6d
```

Vérifié à trois reprises : `git ls-remote --heads origin`, `git rev-parse HEAD`
dans le worktree, `git worktree list`.

| Référence | SHA |
|---|---|
| `origin/arena/6b935c3e-melodix` (distant) | `a6b02705cedfb098d9d63ccc43a21319f5c9cf6d` |
| `origin/arena/7142700d-melodix` (distant) | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` |
| `origin/arena/dbf2d44f-melodix` (distant) | `5d38b1fdd9c08df9033f674e57e26b09b7b6f261` |
| `origin/main` (distant) | `81ef774fcb2208d4c4e999943411040aa1bfa33f` |
| Workspace initial, HEAD | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` |
| **Worktree réconcilié, HEAD** | **`a6b02705cedfb098d9d63ccc43a21319f5c9cf6d`** (détaché) |

`git merge-base --is-ancestor 44902d9 a6b0270` → **vrai**. L'écart est un retard de
10 commits, pas une divergence d'historique.

---

## 2. Phase 1 — sauvegarde et préservation (effectuée en premier)

Emplacement hors dépôt : **`/home/user/melodix-preservation-2026-11-04/`** (1,3 Mo).

| Contenu | Détail |
|---|---|
| `tracked.diff` | diff suivi complet, 51 393 octets, 848 lignes |
| `tracked-modified/` | les **7** fichiers suivis modifiés, version workspace |
| `untracked/` | les **19** fichiers non suivis, arborescence préservée |
| `candidates.txt` / `candidates-sha256.txt` | les **26** candidats et leurs SHA-256 |
| `git-state-initial.txt` | HEAD, refs, reflog, distants |
| `status-initial.txt` | `git status --short` initial |
| `BACKUP-SHA256.txt` | **34 empreintes** de la sauvegarde |
| `proposed-tracked.diff` | diff final proposé depuis `a6b0270`, 66 569 octets |

Intégrité vérifiée immédiatement : `sha256sum -c BACKUP-SHA256.txt --quiet` → **OK**.
**Aucun fichier n'a été perdu, écrasé ni supprimé.**

---

## 3. Phase 2 — méthode d'alignement retenue

**Worktree Git séparé, HEAD détaché.** Aucune opération destructive.

```bash
git worktree add --detach /home/user/melodix-a6b0270 \
  a6b02705cedfb098d9d63ccc43a21319f5c9cf6d
```

Pourquoi cette méthode plutôt qu'un déplacement du workspace :

- le workspace initial n'est **pas touché** : ni `reset`, ni `checkout`, ni `merge` ;
- **aucune branche n'est créée** (`--detach`) — la contrainte de branche de session
  est respectée ;
- les objets Git sont partagés, aucun historique réécrit ;
- réversible par `git worktree remove`, sans effet sur le dépôt.

Vérifications après création :

| Contrôle | Résultat |
|---|---|
| HEAD du worktree | `a6b0270…` — **base exacte** |
| HEAD détaché | oui (`git symbolic-ref HEAD` échoue) |
| Arbre du worktree avant réapplication | **0 entrée** `git status` — propre |
| HEAD du workspace initial | `44902d9…` **inchangé** |
| Branche du workspace initial | `arena/6b935c3e-melodix` **inchangée** |
| Status du workspace initial | **26 entrées**, +649/−28 **inchangé** |
| Branches existantes | `arena/6b935c3e-melodix`, `main` — **aucune ajoutée** |

---

## 4. Phase 3 — classification des 26 candidats

Comparaison par **SHA-256** du contenu local et du blob `a6b0270:<chemin>`.

| Catégorie | Nombre |
|---|---|
| Déjà présent à l'identique | **9** |
| Nouveau fichier nécessaire | **14** (+ ce rapport = 15) |
| Fichier suivi nécessitant une modification | **3** |
| Fichier redondant | **0** |
| Fichier divergent | **0** |
| Fichier d'origine incertaine | **0** |

Contrôle de cohérence : pour les 9 fichiers déjà présents, le worktree était
**octet pour octet identique** à `a6b0270` avant réapplication — aucune divergence
worktree/base n'a été trouvée.

### 4.1 Sens des 3 modifications — progression, pas régression

| Fichier | Ajouts | Suppressions | Preuve du sens |
|---|---|---|---|
| `scripts/aggregate_p0_display_ownership.py` | 99 | 8 | `schema_version != 1` → `!= SCHEMA_VERSION` (**2**) ; l'ancienne fonction de verdict v1 est remplacée par une version qui expose les échéances indéterminées |
| `tests/p0_display_ownership_aggregate.test.js` | 363 | 2 | fixtures `schema_version: 2` ; le cas v1 est **conservé** comme cas de rejet |
| `tests/android/HomeRenderInstrumentation.java` | 435 | 6 | suppression de `rootBounds.contains(dockBounds)` (tautologie) au profit de `nativeDockActuallyVisible` |

**Non-régression du classifieur de surface** : les 9 catégories présentes dans la
base (`desktop-sidebar`, `fullscreen-player`, `melodix-home`, `mobile-navigation`,
`network`, `now-playing-bar`, `spotify-global-navigation`, `spotify-main`,
`unavailable`) sont **toutes conservées**. Aucune perdue, aucune ajoutée.

**Tautologie du dock** : `rootBounds.contains(dockBounds)` n'apparaît plus qu'**une
fois, dans un commentaire** qui explique pourquoi elle a été retirée. Les **deux**
sites de code (L2908 et L6388) appellent `nativeDockActuallyVisible`. Occurrences
hors commentaire : **0**.

### 4.2 Redondance documentaire — mesurée

Recouvrement deux à deux des 6 documents (lignes significatives > 40 caractères) :
**aucune paire au-delà de 15 %**. Les documents ne sont pas redondants.

### 4.3 Réapplication contrôlée

**17 fichiers réappliqués, 9 exclus**, avec SHA-256 **avant / après** pour chacun.
Les 3 fichiers suivis sont passés de l'empreinte de la base à l'empreinte locale ;
les 14 nouveaux sont passés de `ABSENT` à l'empreinte locale ; les 9 exclus sont
restés **rigoureusement inchangés**.

Vérification finale : pour les 26 candidats, `SHA(worktree) == SHA(source)` → **vrai**.
Aucune copie aveugle : chaque fichier a été classé avant d'être copié.

---

## 5. Phase 4 — périmètre et inventaire exact

`git status --short` dans le worktree, après réapplication des 17 fichiers :
**3 `M` + 14 `??` = 17 entrées** (18 avec ce rapport).

### 5.1 Fichiers modifiés (3)

```
 M scripts/aggregate_p0_display_ownership.py
 M tests/android/HomeRenderInstrumentation.java
 M tests/p0_display_ownership_aggregate.test.js
```

Diffstat : **3 fichiers, +937 / −16**

```
 scripts/aggregate_p0_display_ownership.py    | 114 ++++++-
 tests/android/HomeRenderInstrumentation.java | 459 ++++++++++++++++++++++++++-
 tests/p0_display_ownership_aggregate.test.js | 380 +++++++++++++++++++++-
```

### 5.2 Classement par périmètre

| Périmètre | Nombre |
|---|---|
| CI / workflow P0 | 1 |
| Outillage (`scripts/`) | 6 |
| Tests / harness (`tests/`) | 4 |
| Documentation (`docs/`) | 6 (+ ce rapport = 7) |
| **Hors périmètre** | **0** |

Extensions touchées : `.py` 1, `.java` 1, `.js` 3, `.yml` 1, `.sh` 5, `.md` 7.

### 5.3 Absence de modification de production — contrôles négatifs

Recherche sur tous les chemins du diff : **aucun** résultat pour
`.smali`, `AndroidManifest`, `.gradle`, `res/`, `assets/`, `smali/`, `source/`,
`android/`, `original/`, `unknown/`.

Le seul fichier `.java` est `tests/android/HomeRenderInstrumentation.java`, qui est
l'**instrumentation de test**. Aucun Smali, aucun OAuth/login/session, aucune
playlist, aucune lecture, aucun MediaSession, aucun WebView ni bridge de
production n'est touché.

`git diff --check` → **propre** (aucun blanc fautif, aucun marqueur de conflit).

### 5.4 Modes de fichiers

Les 5 scripts sont `755` sur disque ; `core.fileMode=true` dans le dépôt et le
worktree, donc Git enregistrerait `100755`. **Le workflow les invoque via
`bash "$GITHUB_WORKSPACE/tooling/scripts/…"`** : le bit exécutable n'est donc pas
une condition de fonctionnement. Les 5 scripts refusent proprement sans argument
(`exit 1` + message `usage`), vérifié par exécution réelle.

---

## 6. Phase 5 — validation fraîche dans le worktree

Aucun résultat antérieur n'est réutilisé. Tout ce qui suit a été exécuté dans
`/home/user/melodix-a6b0270`, base `a6b0270` + fichiers réappliqués.

### 6.1 Dépendances vérifiables

```
npm ci --no-audit --no-fund   →  added 39 packages
```

| Contrôle | Valeur |
|---|---|
| `package-lock.json` SHA-256 | `0851fb83a49da5436cada8fe290c5e5d78f436f6091b0dba21c558e3fc094c27` |
| Lockfile modifié par `npm ci` | **non** (empreinte identique après) |
| `jsdom` installé | **26.1.0** = version du lockfile |
| Intégrité lockfile | `sha512-Cvc9WUhxSMEo4McES3P7oK3QaXldCfNWp7pl2NNeiIFlCoLr3kfq9kb1fxftiwk1FLV7CvpvDfonxtzUDeSOPg==` |
| `npm ls --depth=0` | `jsdom@26.1.0`, aucune dépendance manquante |

### 6.2 Résultats

| Vérification | Résultat |
|---|---|
| **Suite complète `npm test`** | **580 tests, 580 pass, 0 fail, 0 skipped, 0 todo** |
| `tests/p0_display_ownership_workflow.test.js` | **22 pass** (provenance APK, cycle AVD, zombie, imposteur, watchdog, confidentialité) |
| `tests/p0_display_ownership_aggregate.test.js` | **13 pass** (agrégat, schéma v1 rejeté, canaris 4 profondeurs) |
| `tests/p0_display_dock_visibility.test.js` | **1 pass — réellement exécuté sur JVM**, pas skippé |
| Directives `# SKIP` dans la suite complète | **0** |
| `bash -n` (5 scripts) | **OK** |
| `py_compile` (2 scripts Python) | **OK** |
| PyYAML | **6 workflows, 104 steps**, tous parsés |
| `javalang` (parse du harness) | **OK**, 6696 lignes, 1 type |
| `git diff --check` | **propre** |
| Résidus dans le worktree | **aucun** (pas de `__pycache__`, pas de `.class`) |

Le test du dock apparaît explicitement dans la suite complète :
`ok 139 - the native dock visibility rule is executed and rejects a WebView drawn over the dock`.

### 6.3 Compilation Java — réelle mais limitée

| Élément | État |
|---|---|
| Compilateur | **ECJ 3.8.2** (`ecj.jar`, SHA-256 `78510251c3583ee6faeea2f267332a39d5a874631a160d857dde26e169eb0a08`) — **pas `javac`** |
| Bibliothèque | `android-36.jar`, SHA-256 `d9eb9da824d9e247a352f570f01e1169e725b2954bca9e283a71786c59b59f9a` |
| JRE | Temurin **17.0.9+9** via jdk4py (runtime seul, sans compilateur) |
| Niveau | `-source 1.7 -target 1.7` (ECJ 3.8.2 plafonne à Java 7) |
| Source compilée | **copie `/tmp/wt-compile`**, jamais le dépôt |
| Adaptation | **17 `final`** ajoutés, tous sur des **locales ou des paramètres**, aucun sur un champ |
| Neutralité sémantique | **prouvée par le compilateur** : `final` n'est accepté que sur des variables effectivement finales ; toute réassignation aurait fait échouer la compilation |
| Résultat | **77 `.class`, 0 erreur**, major **51**, classe principale **235 218 octets** |
| Reproductibilité | deux répertoires de sortie **neufs** → SHA-256 agrégé identique **`78eb64e2f5d89eab295a5364fd38716ec722ef22e38688be555ce4b3cdea835c`** |
| `dockUnoccluded` dans le bytecode | **présent** |
| `nativeDockActuallyVisible` dans le bytecode | **présent** |
| Dépôt et worktree | empreinte du harness **`b9ef4a6f…3f394a886`**, identique à la source — **aucune adaptation dans le dépôt** |
| `.class` dans le dépôt ou le worktree | **aucun** |

**Anomalie investiguée, non rapportée à tort** : une première comparaison a donné
« non reproductible ». Cause : le répertoire de sortie avait été écrit par-dessus
une compilation échouée ; **3 classes** conservaient un contenu périmé. Sur deux
répertoires neufs, les 77 classes sont identiques octet pour octet. Le signal
initial était un artefact de méthode.

**Non comparable au chiffre de la mission précédente** : l'adaptation `/tmp` de
cette mission comporte 17 `final` au lieu de 8, et la convention de hachage inclut
le chemin relatif. L'empreinte `2fb7af5e…` antérieure n'est donc pas attendue ici.
Ce qui est démontré est la **déterminisme du compilateur sur une source donnée**.

### 6.4 Re-validation sur l'état final à 18 fichiers

La suite a été relancée **après** ajout de ce rapport, sur l'état exact qui serait
committé : worktree `a6b0270`, **18 entrées** (`3 M` + `15 ??`), diff
**+937 / −16**. Résultat : **580 tests, 580 pass, 0 fail, 0 skipped, 0 todo**,
`git diff --check` propre, **aucun résidu** (`__pycache__`, `.class`,
`node_modules` non suivi).

Le workspace initial a été revérifié **après** toutes les opérations, contre la
sauvegarde de Phase 1 :

| Contrôle | Résultat |
|---|---|
| `sha256sum -c candidates-sha256.txt` | **26/26 identiques** |
| Diff suivi vs `tracked.diff` | **identique octet pour octet** (`cmp`) |
| `git status --short` vs `status-initial.txt` | **identique** (`cmp`) |
| HEAD / branche | `44902d9` / `arena/6b935c3e-melodix` inchangés |
| Reflog HEAD | `clone` → `checkout` uniquement |

Ce rapport a été retiré du workspace initial et placé dans le worktree, précisément
pour que le workspace initial reste à son état de Phase 1 **prouvable**. Une copie
est conservée dans `/home/user/melodix-preservation-2026-11-04/report-copy/`.

### 6.5 Tests NON exécutés — limites explicites

| Non exécuté | Raison |
|---|---|
| `javac --release 8 -Xlint:all` | `javac` **absent** (jdk4py est un runtime jlink sans `jdk.compiler`) |
| `javap -p` (vérification des signatures) | `javap` **absent** |
| `d8` (dexification) | **absent** |
| Construction / signature d'APK | `apksigner`, `zipalign`, `aapt` **absents** |
| Démarrage AVD, `adb`, `emulator` | **absents**, et **`/dev/kvm` absent** |
| Capture téléphone réelle | impossible sans émulateur |
| Capture tablette réelle | impossible sans émulateur |
| Agrégation de sidecars réels | **aucun sidecar runtime n'existe** |
| Workflow GitHub Actions | **non enregistré**, donc non déclenchable |

Aucune de ces limites n'est présentée comme un succès. Les tests AVD exécutés sont
**comportementaux avec faux exécutables et vrais processus contrôlés**, pas des
exécutions Android.

---

## 7. Preuves de reproductibilité

### 7.1 Tous les fichiers du workflow existent dans l'arbre post-commit

Arbre post-commit simulé = arbre `a6b0270` ∪ les fichiers réappliqués.

| Chemin référencé par le workflow | Nature | Présent |
|---|---|---|
| `scripts/p0_display_verify_apk.sh` | fichier dépôt | **oui** |
| `scripts/p0_display_build_harness.sh` | fichier dépôt | **oui** |
| `scripts/p0_display_boot_avd.sh` | fichier dépôt | **oui** |
| `scripts/p0_display_run_profile.sh` | fichier dépôt | **oui** |
| `scripts/p0_display_stop_avd.sh` | fichier dépôt | **oui** |
| `scripts/aggregate_p0_display_ownership.py` | fichier dépôt | **oui** |
| `provenance.json` | **généré au runtime** dans `RUNNER_TEMP` | sans objet |

**Fichiers dépôt manquants : aucun.** Avant intégration, **6 des 6** scripts
manquaient dans `a6b0270` : c'était la cause exacte de la non-exécutabilité.

### 7.2 Artefacts cohérents

Uploads (avec `matrix.profile` résolu) : `melodix-display-tooling-RUNID`,
`…-ownership-phone-RUNID`, `…-ownership-tablet-RUNID`,
`…-boot-diagnostic-phone-RUNID`, `…-boot-diagnostic-tablet-RUNID`,
`…-ownership-combined-RUNID`.

Downloads : `…-tooling-RUNID`, `…-ownership-phone-RUNID`,
`…-ownership-tablet-RUNID`, plus l'APK via
`${{ needs.build-display-apk.outputs.apk_name }}`.

**Downloads orphelins : aucun.** L'agrégateur reçoit **exactement les deux**
sidecars, puis le workflow vérifie que `p0_resolution_claimed` vaut `false` et
échoue sinon.

### 7.3 Contrat du job appelé

`preview-apk.yml` déclare les sorties `apk_name`, `version_code`, `source_ref` ;
le P0 consomme `apk_name` et `version_code` → **aucune sortie manquante**.
Les 5 inputs passés (`release_tag`, `source_ref`, `build_only`,
`target_debuggable`, `apk_suffix`) sont **tous déclarés** par le job appelé.

### 7.4 Variables d'environnement fournies

`SOURCE_ROOT` aux **deux** appels du vérificateur (lignes 178 et 321) ;
`P0_DISPLAY_AVD_STATE_DIR` (ligne 363) ; `ANDROID_HOME` (6 occurrences).
**Aucun chemin absolu Arena** (`/home/…`, `jdk4py`, `.melodix-toolchain`) dans les
6 scripts.

### 7.5 Délais

`BOOT_BUDGET_SECONDS=900` et `CAPTURE_BUDGET_SECONDS=1500`, **tous deux mesurés
depuis le même instant de départ** : budget global **25 min**, à comparer à la
limite du job de capture de **45 min**. Les délais ne s'additionnent pas.

---

## 8. Phase 6 — audit du workflow

| Exigence | Résultat observé |
|---|---|
| Déclenchement | **`workflow_dispatch` seul** |
| `enabled` | requis, **défaut `false`**, type boolean |
| `source_ref` | requis, **sans défaut** |
| Garde opt-in | présente sur **les 5 jobs** : `github.event_name == 'workflow_dispatch' && inputs.enabled == true` |
| Permissions | `actions: read`, `contents: read` **par job** — aucune écriture |
| Publication / push | **0 occurrence** de `git commit`, `git push`, `git tag`, `gh release`, `npm publish`, `contents: write`, `publish_preview: true` |
| Dépendances | `prepare` ← `build-apk` + `compile-harness` ; `capture` ← `build-apk` + `prepare` ; `aggregate` ← `prepare` + `capture` |
| Compilation bloquante | job dédié `compile-display-harness` en amont, `javac --release 8 -Xlint:all` + `javap` + `d8 --min-api 24`, avec contrôle de non-vacuité des sorties |
| Matrice | `phone`, `tablet`, **`fail-fast: false`** (les deux profils vont au bout) |
| Timeouts | 20 / 25 / 45 / 10 min |
| Agrégation | seulement après les **deux** sidecars téléchargés |

**Le workflow n'a pas été déclenché.** Aucune écriture distante.

---

## 9. État GitHub (lecture seule)

```
gh api repos/Souxch06/Melodix/actions/workflows                     → total_count = 7
gh api …/actions/workflows/p0-display-ownership.yml                 → 404
gh api …/contents/.github/workflows/p0-display-ownership.yml?ref=arena/6b935c3e-melodix → 404
```

Les 7 workflows enregistrés sont `launch-smoke-emulator`, `preview-apk`,
`preview-launch-trace`, `release-apk`, `release-asset-refresh`,
`test-preview-emulator`, `validate-android-assembly`. **Le workflow P0 n'y est
pas.**

Observation annexe, hors périmètre et **non corrigée** : `launch-smoke-emulator.yml`
et `release-asset-refresh.yml` sont enregistrés côté GitHub mais leur fichier
n'existe ni dans `a6b0270` ni dans `main` (5 fichiers de workflow dans `a6b0270`,
2 dans `main`). Ce sont des enregistrements hérités d'autres branches. Signalé,
pas touché.

**Conséquence** : aucun dispatch n'est possible tant que le workflow n'est pas
committé et poussé. Les permissions et runners restent non vérifiables
(`403 Resource not accessible by integration` sur `actions/permissions` et
`actions/runners` lors des missions précédentes) : **la disponibilité d'un runner
KVM et le droit de dispatch ne sont pas établis**.

---

## 10. État du P0

# `OUVERT — PRÉPARATION NON DÉPLOYÉE`

| Condition de résolution | État |
|---|---|
| Workflow intégré à Git | **non** — proposition seulement |
| Workflow enregistré sur GitHub | **non** — 404 |
| Workflow réellement exécuté | **non** — aucun run |
| Capture téléphone réelle | **non** |
| Capture tablette réelle | **non** |
| Deux sidecars comparables issus du même APK | **non** |
| Cinq échéances exploitables | **non** — aucune mesure |
| Dock visible et non recouvert sur appareil | **non établi** — règle prouvée sur JVM uniquement |
| Agrégateur validant les deux profils | **non applicable** — pas d'entrées réelles |

Le P0 **restera ouvert après le commit et le push**, jusqu'à l'obtention et
l'analyse de deux captures Android réelles issues du même APK.

---

## 11. Listes de fichiers

### 11.1 Nouveaux fichiers (15)

| Chemin | SHA-256 |
|---|---|
| `.github/workflows/p0-display-ownership.yml` | `1999e5969c25cba0f69edcb9233dd6accfb28453d3a8488b4caf7fbe547287f4` |
| `scripts/p0_display_verify_apk.sh` | `9ff141cce0f3c85b1a30ca1d4d892ef899b81c63743f8257ec1c9650d20b3ff5` |
| `scripts/p0_display_build_harness.sh` | `d39516c48d35c56a5d82b3f0deedaf1ef03e91afb274727b6a02e204cce9a33b` |
| `scripts/p0_display_boot_avd.sh` | `057eac954eac3e898c1806262c1c589fdd471ff1e7023b8ce58310e1a5a2df6e` |
| `scripts/p0_display_run_profile.sh` | `7f6c4b4ed0f101579969b76215b4417de71ac964b981b57a6383610d0a22f39a` |
| `scripts/p0_display_stop_avd.sh` | `7f86ebc64188d047ab168267aac2d17cda3f43870b8dba91cecad1b4cd0e62c3` |
| `tests/p0_display_ownership_workflow.test.js` | `d961790066fe885c1e9f45cb88b4f8dfc804d37ca7f5a22e5f25ba955126f028` |
| `tests/p0_display_dock_visibility.test.js` | `c72d5d3b36bbb9bf325cb947c4671fbfc8b47ab1dfd57490d6ae19b8e42997b8` |
| `docs/audits/melodix-autonomous-session-baseline-2026-11-04.md` | `ace2e30676ffb66fea9776beaba30f753f80e394f099bed9f6dceec3846e62f7` |
| `docs/audits/melodix-autonomous-engineering-report-2026-11-04.md` | `3d2fcb13c8ad85a23d49887ae976f69dfe79d7b8e9915aef20622467be820643` |
| `docs/audits/melodix-p0-display-ownership-job-2026-11-04.md` | `80606d9a8a5a468e037d28b0949b3941090f95cf662927aeebeb7463e9ab6e5a` |
| `docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md` | `0adc857bf3c66a25cb13824603c63829d125d5a01bca7d2349a1fc6cf41bf82f` |
| `docs/audits/melodix-p0-display-ownership-runbook-2026-11-04.md` | `5e508c2f065be90e5aa98d0bcc69560108ff08b4c9ba0405953d7f1f138344a0` |
| `docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md` | `987a0471ac3726e0e7798cabde5df4251fc1cd8fbfc3a0974f3964ffd680838d` |
| `docs/audits/melodix-a6b0270-integration-proposal-2026-11-04.md` | ce document — empreinte à recalculer après lecture |

### 11.2 Fichiers modifiés (3)

| Chemin | SHA-256 avant (base) | SHA-256 après |
|---|---|---|
| `scripts/aggregate_p0_display_ownership.py` | `9e03c7ea1776…` | `999ed84577d4cb85c63533b86f3debe80f1f8515f3130126c6c92a42d2cfc35b` |
| `tests/android/HomeRenderInstrumentation.java` | `77f2a5b7cd3c…` | `b9ef4a6fec83a4187b3c91fa9e29e204d36bc6d3b6a93591b3b23b23f394a886` |
| `tests/p0_display_ownership_aggregate.test.js` | `e9a8d0f3782e…` | `707847d4a2fbe4cc8aed05efa1d74b570ca9dafcabc1da60c1886e2cda5a6305` |

### 11.3 Fichiers déjà présents et exclus (9)

Contenu **identique octet pour octet** à `a6b0270`. Les inclure produirait un
commit trompeur.

```
.github/workflows/test-preview-emulator.yml
.gitignore
docs/RAPPORT_A_H.md
scripts/sanitize_verify_diagnostic.py
tests/p0_verify_diagnostic.test.js
tests/preview_workflow.test.js
docs/audits/melodix-audit-complet-2026-11-04.md
docs/audits/melodix-p0-display-ownership-comparator-2026-11-04.md
docs/audits/melodix-p0-verifyerror-replay-2026-11-04.md
```

Dans le workspace initial ils apparaissent comme `M`/`??` **uniquement** parce que
ce clone est en retard de 10 commits. Dans le worktree basé sur `a6b0270`, ils sont
**propres** — ce qui confirme la classification.

---

## 12. Phase 7 — commandes proposées, NON EXÉCUTÉES

À exécuter dans le worktree `/home/user/melodix-a6b0270` **après** y avoir rattaché
la branche de session, ou dans un clone complet de
`origin/arena/6b935c3e-melodix`. Le worktree est en HEAD détaché : un humain doit
décider comment porter le commit sur `arena/6b935c3e-melodix`.

### 12.1 `git add` — chemin par chemin

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
  docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md \
  docs/audits/melodix-a6b0270-integration-proposal-2026-11-04.md
```

**18 chemins.** Aucun des 9 fichiers exclus n'y figure.

### 12.2 Message de commit proposé

```
Deploy the opt-in P0 display-ownership measurement tooling

Make the phone/tablet display-ownership comparison reproducible from a clean
checkout. The workflow and its five shell helpers existed only as untracked
local files, so no clean clone could run them and GitHub had no registered
workflow to dispatch: six of the six scripts the workflow invokes were missing
from this tree.

- add the manual, opt-in p0-display-ownership workflow (enabled defaults to
  false, source_ref required, read-only permissions per job, no publication);
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

### 12.3 Commande de commit proposée

```bash
git commit -F <fichier-contenant-le-message-ci-dessus>
```

ou, de façon équivalente, `git commit` avec l'éditeur. **Non exécutée.**

### 12.4 Contrôles à passer avant validation humaine

`npm test` → **580/580, 0 skip** ; `bash -n` sur les 5 scripts ; `py_compile` ;
PyYAML sur les 6 workflows ; `git diff --check`. En CI uniquement :
`javac --release 8` + `javap` + `d8` du job `compile-display-harness`.

---

## 13. Phase 8 — distinctions d'état demandées

| Notion | État exact |
|---|---|
| **État historique** | HEAD `44902d9`, clone superficiel, en retard de 10 commits sur la branche distante |
| **État du workspace initial** | `/home/user/Melodix`, HEAD `44902d9`, branche `arena/6b935c3e-melodix`, **26 entrées** (7 `M` + 19 `??`), +649/−28 — **intact, non déplacé** |
| **État du workspace réconcilié** | `/home/user/melodix-a6b0270`, HEAD **détaché** `a6b0270`, **18 entrées** (3 `M` + 15 `??`), +937/−16, `node_modules` installé par `npm ci` |
| **Base Git** | `a6b02705cedfb098d9d63ccc43a21319f5c9cf6d` |
| **Modifications réappliquées** | 18 fichiers, classés et vérifiés par SHA-256 avant/après |
| **Fichiers exclus** | 9, déjà identiques à la base |
| **Tests exécutés** | suite npm 580/580 ; 22 workflow ; 13 agrégateur ; 1 dock **exécuté sur JVM** ; `bash -n` ×5 ; `py_compile` ×2 ; PyYAML 6 workflows ; `javalang` ; `git diff --check` ; compilation ECJ 77 classes |
| **Tests non exécutés** | `javac`, `javap`, `d8`, APK, signature, AVD/`adb`/`emulator`, captures téléphone et tablette, agrégation réelle, workflow CI |
| **Limites Android** | aucun JDK compilant, aucun SDK, aucun build-tools, **`/dev/kvm` absent** ; compilation ECJ en Java 7 sur copie `/tmp` uniquement |
| **État GitHub** | 7 workflows enregistrés, **P0 absent (404)** ; aucun run ; permissions/runners non vérifiables (403) ; **aucune écriture distante** |
| **État du P0** | **`OUVERT — PRÉPARATION NON DÉPLOYÉE`** |

---

## 14. Actions soumises à autorisation humaine

1. Décider comment porter le commit sur `arena/6b935c3e-melodix` depuis le worktree
   détaché (ou repartir d'un clone complet de la branche distante).
2. **Autoriser le `git add`** des 18 chemins du §12.1.
3. **Autoriser le commit** (§12.2, §12.3).
4. **Autoriser le push** sur `arena/6b935c3e-melodix` uniquement.
5. Vérifier l'enregistrement du workflow par GitHub après push.
6. Établir la disponibilité d'un runner **KVM** et le droit de dispatch.
7. Autoriser le dispatch avec `enabled=true` et le `source_ref` du commit déployé.
8. Analyser les deux sidecars réels et statuer sur le P0.

**Aucune de ces actions n'a été effectuée.** Le dépôt attend une autorisation
explicite.

---

## 15. Nettoyage du worktree (optionnel, après décision)

```bash
git -C /home/user/Melodix worktree remove /home/user/melodix-a6b0270
```

La sauvegarde `/home/user/melodix-preservation-2026-11-04/` doit être conservée
jusqu'à validation humaine. Elle n'est pas dans le dépôt et n'est pas destinée à
être committée.
