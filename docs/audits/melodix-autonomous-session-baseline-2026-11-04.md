# Melodix — Baseline de session autonome (2026-11-04)

Document d'établissement de l'état initial. Aucune affirmation de ce fichier n'est
déduite d'un souvenir de session : chaque point est appuyé par une commande exécutée
dans le dépôt au début de la mission autonome.

---

## 1. Identité du dépôt et de la branche

| Élément | Valeur vérifiée | Commande |
|---|---|---|
| Branche courante | `arena/6b935c3e-melodix` | `git branch --show-current` |
| HEAD (SHA de départ) | `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` | `git rev-parse HEAD` |
| `main` local | `81ef774fcb2208d4c4e999943411040aa1bfa33f` | `git rev-parse main` |
| `origin/main` | `81ef774fcb2208d4c4e999943411040aa1bfa33f` | `git rev-parse origin/main` |
| Remote | `https://github.com/Souxch06/Melodix.git` (fetch/push) | `git remote -v` |
| Fichiers suivis | **6150** | `git ls-files \| wc -l` |
| Profondeur d'historique | **1 commit** (`git rev-list --count HEAD`) | clone *shallow* |
| `.git/shallow` | **2 entrées** | `cat .git/shallow` |

HEAD est marqué **grafted** : le clone est superficiel, l'historique antérieur n'est
pas présent localement.

### Preuve de re-clone (et non de continuation)

```
44902d9 HEAD@{2026-11-04 13:50:16 +0000}: checkout: moving from main to arena/6b935c3e-melodix
81ef774 HEAD@{2026-11-04 13:50:14 +0000}: clone: from https://github.com/Souxch06/Melodix.git
```

Le reflog ne contient **que** `clone` puis `checkout`. Il n'existe aucune entrée de
commit, merge, rebase ou reset. Conclusion factuelle : **l'environnement a été
re-cloné**, la session ne repart pas d'un espace de travail git continuity.

---

## 2. Commits antérieurs rapportés : absence vérifiée

La référence de mission `a6b0270` et neuf autres SHA rapportés par des comptes rendus
antérieurs ont été testés individuellement (`git cat-file -t <sha>`). **Tous**
répondent `fatal: Not a valid object name` :

| SHA rapporté | Présence dans les objets locaux |
|---|---|
| `a6b0270` | absent |
| `31010cf` | absent |
| `b317c3f` | absent |
| `eacfef8` | absent |
| `75a092f` | absent |
| `8f5e4a2` | absent |
| `f4410c7` | absent |
| `156c55a` | absent |
| `f045da3` | absent |
| `8a253f3` | absent |

**Conséquence de méthode :** aucun contenu n'a été « retrouvé » à partir de ces SHA.
Il est impossible de prouver localement ce que ces commits contenaient. Aucune
restauration n'a été présentée comme une récupération d'historique.

### 2.1 Correctif du 2026-11-04 (mission d'exécution réelle)

**Cette absence est locale, pas distante.** La vérification ultérieure par
`git ls-remote --heads origin` et `gh api repos/…/commits/a6b0270…` a établi que
**`a6b0270` existe bien sur le dépôt distant** :

```
a6b02705cedfb098d9d63ccc43a21319f5c9cf6d  refs/heads/arena/6b935c3e-melodix
date=2026-11-04T09:32:43Z
message=Add fail-closed phone/tablet display-ownership comparator for the P0
```

Le clone superficiel ne contenait simplement pas cet objet, et il a été créé depuis
le commit de la branche **parente** (`44902d9`), pas depuis le tip de la branche de
session. La branche distante est donc **en avance** sur le clone local.

La conclusion « re-clone » reste exacte. La conclusion « ces commits sont
invérifiables » doit être lue comme « invérifiables **dans ce clone** ». Le contenu
de `a6b0270` a depuis été inspecté en lecture seule : il porte le comparateur v1,
**mais ni le workflow `p0-display-ownership.yml`, ni les 5 scripts `p0_display_*.sh`**.
Voir `docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md`.

### 2.2 Réconciliation effectuée le 2026-11-04 (mission pré-commit)

Les objets manquants ont été **récupérés sans déplacer aucune branche** :

```
git fetch --depth=60 origin \
  refs/heads/arena/6b935c3e-melodix:refs/reconcile/arena-6b935c3e
```

Résultat vérifié : **60 commits accessibles**, les **10 SHA** du tableau §2 sont
désormais tous lisibles (`git cat-file -t` → `commit`), `HEAD` et `main`
**inchangés**, dépôt toujours superficiel, **aucune écriture distante**.

`git merge-base --is-ancestor 44902d9 a6b0270` → **vrai** : la branche locale est
en **retard de 10 commits**, ce n'est pas une divergence d'historique.

Conséquence majeure sur la lecture du §3 ci-dessous : **9 des 25 fichiers** locaux
marqués `M`/`??` sont **déjà octet pour octet dans `a6b0270`**. Leur statut vient du
retard du clone, pas d'un travail non commité. Seuls **16 fichiers** restent à
intégrer. Le compte de non suivis est passé de 13 à **18** entre-temps (documents
produits par les missions suivantes).

Matrice complète, empreintes, listes A/B et proposition de commit non exécutée :
`docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md`.

**Préalable humain bloquant** : avancer la branche locale jusqu'à `a6b0270` par
avance rapide **avant** tout commit, sinon l'historique serait non fast-forward.

---

## 3. État réel de l'arbre de travail au départ

`git status --short` — **7 fichiers modifiés, 13 non suivis**, arbre par ailleurs propre.

### 3.1 Fichiers suivis modifiés (M)

```
 M .github/workflows/test-preview-emulator.yml
 M .gitignore
 M docs/RAPPORT_A_H.md
 M scripts/sanitize_verify_diagnostic.py
 M tests/android/HomeRenderInstrumentation.java
 M tests/p0_verify_diagnostic.test.js
 M tests/preview_workflow.test.js
```

`git diff --stat` : **7 fichiers, +572 / −27**.

### 3.2 Fichiers non suivis (??) — inventaire exhaustif

```
?? .github/workflows/p0-display-ownership.yml
?? docs/audits/melodix-audit-complet-2026-11-04.md
?? docs/audits/melodix-p0-display-ownership-comparator-2026-11-04.md
?? docs/audits/melodix-p0-display-ownership-job-2026-11-04.md
?? docs/audits/melodix-p0-verifyerror-replay-2026-11-04.md
?? scripts/aggregate_p0_display_ownership.py
?? scripts/p0_display_boot_avd.sh
?? scripts/p0_display_build_harness.sh
?? scripts/p0_display_run_profile.sh
?? scripts/p0_display_stop_avd.sh
?? scripts/p0_display_verify_apk.sh
?? tests/p0_display_ownership_aggregate.test.js
?? tests/p0_display_ownership_workflow.test.js
```

### 3.3 Réconciliation : ce qui est établi et ce qui ne l'est pas

**Établi.** Le contenu fonctionnel des travaux antérieurs est **présent dans l'arbre
de travail** sous forme de modifications et de fichiers non suivis. Il a été inspecté
fichier par fichier, et il est cohérent : agrégateur v2, cinq scripts shell P0,
workflow `p0-display-ownership.yml` à cinq jobs, harness Java enrichi, deux suites de
tests dédiées. Les empreintes SHA-256 (§4) fixent cet état de façon vérifiable.

**Non établi.** La correspondance exacte entre cet arbre et les dix commits absents.
Le contenu est cohérent et complet du point de vue de l'exécution des tests, mais
**rien ne prouve qu'il soit octet pour octet identique** à ce que ces commits
portaient. Aucune reconstruction n'a été tentée : elle aurait été ambiguë.

**Décision.** L'arbre de travail existant est retenu comme **base de travail**, sans
être présenté comme un historique récupéré. Aucun commit, aucun push, aucun dispatch
n'a été effectué pour « rattraper » l'écart.

---

## 4. Empreintes SHA-256 de référence (état de départ)

Périmètre du job P0 et fichiers de référence. Ces empreintes permettent de détecter
toute dérive ultérieure.

| Fichier | SHA-256 |
|---|---|
| `.github/workflows/p0-display-ownership.yml` | `1999e5969c25cba0f69edcb9233dd6accfb28453d3a8488b4caf7fbe547287f4` |
| `.github/workflows/preview-apk.yml` | `1b9057044930147f5714c99f2d7ee41a6a4f8cbe0b18bc5d381315faea30cacb` |
| `.github/workflows/test-preview-emulator.yml` | `cb82caf40e9e00df5ecfef502583b9aa9f1812b0e2e0ce5b43e5478da0e7dc73` |
| `scripts/p0_display_verify_apk.sh` | `9ff141cce0f3c85b1a30ca1d4d892ef899b81c63743f8257ec1c9650d20b3ff5` |
| `scripts/p0_display_build_harness.sh` | `d39516c48d35c56a5d82b3f0deedaf1ef03e91afb274727b6a02e204cce9a33b` |
| `scripts/p0_display_boot_avd.sh` | `73b7cf11a935d3340205efde27eda566abf995c3693c7df91e2097a3c81fba97` |
| `scripts/p0_display_run_profile.sh` | `7f6c4b4ed0f101579969b76215b4417de71ac964b981b57a6383610d0a22f39a` |
| `scripts/p0_display_stop_avd.sh` | `7f86ebc64188d047ab168267aac2d17cda3f43870b8dba91cecad1b4cd0e62c3` |
| `scripts/aggregate_p0_display_ownership.py` | `999ed84577d4cb85c63533b86f3debe80f1f8515f3130126c6c92a42d2cfc35b` |
| `scripts/sanitize_verify_diagnostic.py` | `860bdc15c5cde003dc02af4da0ae20503276d0c7f2256eee5b58a798408d4456` |
| `tests/android/HomeRenderInstrumentation.java` | `5b11781b95e38c4387ee701bca4905275e9696cd211aa1bf7547af1ae8c9e1b6` |
| `tests/android/AndroidManifest.xml` | `3f4803912d7a258d27a799c7897f53935a7b5aea88b32dcdd2ac4655552f255f` |
| `tests/p0_display_ownership_workflow.test.js` | `0b154b0dccdf285424e339ff1c8c12cb1d47be5475c23ad6c4b888d90b297b50` |
| `tests/p0_display_ownership_aggregate.test.js` | `bc758d12bc1780271899db295da8ea0d74da2cdce55f8fd22946c59d2ad25900` |
| `tests/p0_verify_diagnostic.test.js` | `a200e296cd835b696a93035aa4632f6dc9498cff7f03318da850539e351a23a1` |
| `tests/preview_workflow.test.js` | `7e2a23469ef0aa46909271bdb3a2fca8b815dd8f915d9589b477c2bd39e805d9` |

Le harness Java mesure **6620 lignes / 417 701 octets**.

---

## 5. Environnement d'exécution : inventaire honnête

### 5.1 Présent

| Outil | Version |
|---|---|
| Node.js | 22.22.3 |
| npm | 10.9.8 |
| Python | 3.11.2 |
| git | 2.39.5 |
| `zip` / `unzip` | présents |
| PyYAML | 6.0.3 (réinstallé) |
| `javalang` | réinstallé (analyse syntaxique seule) |
| `jsdom` | via `npm ci` (exit 0) |
| Plateforme | Debian 12, x86_64 |

### 5.2 Absent — bloque la validation Android réelle

`javac`, `jar`, `javap`, `adb`, `emulator`, `avdmanager`, `sdkmanager`, `aapt`,
`aapt2`, `apksigner`, `zipalign`, `d8`, `shellcheck`, `yamllint`.
`/dev/kvm` **absent**. `ANDROID_HOME`, `ANDROID_SDK_ROOT`, `JAVA_HOME` non définis.

**Conséquence directe :** aucun émulateur ne peut être démarré, aucune instrumentation
exécutée, aucun APK signé produit localement. Le P0 téléphone/tablette **ne peut pas
être clos dans cet environnement**, quelle que soit la qualité de la préparation.

### 5.3 Impasses documentées (à ne pas retenter)

- **Assets de release GitHub** (`github.com/.../releases/download/...`) : redirection
  hors liste d'autorisation → `URLError TLS/SSL EOF`. Seul `api.github.com`
  (`git/blobs`, base64) permet de récupérer des binaires.
- **`jdk4py` (PyPI) n'est pas un JDK compilant** : vérifié sur 17.0.9.2 (installé) et
  25.0.2.1 (wheel inspecté). `java --list-modules` ne contient pas `jdk.compiler` ;
  `java -m jdk.compiler/com.sun.tools.javac.Main` → `FindException`. Pas de `javac`,
  pas de `javap`. Inutile de réinstaller une autre version.
- **Jars ECJ trouvés sur GitHub = pointeurs LFS ou symlinks** : contrôles systématiques
  de la taille réelle du blob et du magic `PK\x03\x04` avant usage (13 o, 32 o, 38 o,
  40 o, 132 o, 369 o rejetés).
- **`android.jar` issus d'AOSP** (ex. `Reginer/aosp-android-jar`) exposent les API
  cachées → compilation non fidèle au SDK, écartés.

---

## 6. Outillage de compilation acquis pendant la mission

Stocké **hors dépôt**, dans `/home/user/.melodix-toolchain/` (jamais ajouté à Git).

| Fichier | Taille | SHA-256 |
|---|---|---|
| `android-36.jar` | 27 768 026 o | `d9eb9da824d9e247a352f570f01e1169e725b2954bca9e283a71786c59b59f9a` |
| `ecj.jar` | 1 513 931 o | `78510251c3583ee6faeea2f267332a39d5a874631a160d857dde26e169eb0a08` |

**`android-36.jar` — fidélité au SDK vérifiée** : 14 996 entrées ; présence de
`android/app/Activity`, `android/app/Instrumentation`, `android/view/Insets`,
`android/view/WindowInsets`, `org/json/JSONObject` **et** de `java.*` (1258 entrées,
libcore) ; **absence** de `android/app/ActivityThread`, `com/android/internal/R`,
`android/app/IActivityManager` (API cachées) ; corps de méthodes `Stub!` ; bytecode
major 52. Source : `Sable/android-platforms`, blob
`e560471790469782b41614eac5f290f5388d0d79`, via `api.github.com`.

**`ecj.jar` — Eclipse Compiler for Java 3.8.2** (`Bundle-Version:
3.8.2.v20120814-155456`), 395 classes. Source : `alanvoss/neo4j_openshift_v2`, blob
`b1de2d777d24d108cdb58192fafe299683213cc8`. **Ce n'est pas `javac`.** Niveau de
langage maximal : **Java 7**.

Le résultat de la compilation réelle, ses commandes exactes et ses limites sont
consignés dans le rapport d'ingénierie de la mission. Rappel de la distinction
obligatoire : **compiler n'est pas exécuter**. Aucune exécution Android n'a eu lieu.

---

## 7. Opérations git : aucune écriture

Aucun commit, aucun push, aucune modification de `main`, aucune fusion, aucun
déclenchement de workflow, aucune publication. Les seules commandes git exécutées
sont des lectures (`status`, `rev-parse`, `log`, `reflog`, `diff`, `ls-files`,
`cat-file`, `remote -v`). Les jetons disponibles n'ont été utilisés qu'en lecture.

---

## 8. Incertitudes assumées à l'ouverture de la mission

1. **Historique perdu.** Les dix SHA rapportés sont invérifiables localement. La
   continuité fonctionnelle repose sur l'inspection de l'arbre, pas sur git.
2. **Écart arbre ↔ commits inconnu.** Le contenu présent est cohérent mais son
   identité exacte avec les commits absents n'est pas prouvable.
3. **Aucune exécution Android possible.** SDK, JDK complet, KVM absents. Toute
   conclusion runtime reste hors de portée dans cet environnement.
4. **Le P0 reste ouvert.** Ni le comportement téléphone ni le comportement tablette
   n'ont été observés sur un appareil réel ou émulé pendant cette session.
5. **Non-persistance de `/tmp` et des paquets installés.** Les dépendances (`npm ci`,
   PyYAML, `javalang`) doivent être réinstallées après réinitialisation ; un échec
   `Cannot find module 'jsdom'` est un symptôme d'environnement, **pas** une régression.
