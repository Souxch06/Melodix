# Runbook — validation P0 « propriété de l'affichage » (téléphone / tablette)

Procédure de reprise pour exécuter **une seule** campagne de mesure et l'analyser.

> **Le P0 est `OUVERT — PRÉPARATION NON DÉPLOYÉE`.** Ce runbook ne décrit pas une
> validation déjà faite. Il décrit comment l'obtenir. Aucun résultat runtime
> n'existe à ce jour, et rien dans ce dépôt ne doit être lu comme une preuve que
> le téléphone ou la tablette se comportent correctement.

> **PRÉALABLE BLOQUANT, établi le 2026-11-04 : le workflow n'est pas déployé.**
> `.github/workflows/p0-display-ownership.yml` et les 5 scripts `p0_display_*.sh`
> n'existent que comme **fichiers locaux non suivis**. Le workflow n'est pas
> enregistré côté GitHub (`404` ; absent de `main` et du tip distant `a6b0270`).
> **Aucun dispatch n'est possible en l'état.** Les sections 3 et suivantes ne
> deviennent applicables qu'après le déploiement décrit en §0.
> Preuves : `docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md`.

---

## 0. Déployer la préparation (obligatoire, avant tout dispatch)

GitHub Actions ne déclenche que des workflows **présents dans le dépôt**. Il faut
donc d'abord, avec une **autorisation explicite de commit/push** :

0. **AVANT tout commit — réconcilier la branche locale.** Établi le 2026-11-04 :
   le clone de session est superficiel, `HEAD = 44902d9`, **sans upstream**, alors
   que `origin/arena/6b935c3e-melodix = a6b0270`. `44902d9` est un **ancêtre** de
   `a6b0270` : l'écart est un **retard de 10 commits**, pas une divergence.
   Committer en l'état produirait un historique non fast-forward.
   Avancer la branche locale jusqu'à `a6b0270` par **avance rapide** (ou recloner
   la branche entièrement). Ne jamais `reset --hard`, jamais `clean`.

   Conséquence vérifiée : **9 des 25 fichiers locaux marqués `M`/`??` sont déjà
   octet pour octet dans `a6b0270`**. Ils redeviennent propres d'eux-mêmes après
   l'avance rapide et **ne doivent pas être inclus dans le commit**. Il ne reste
   alors que **16 fichiers** à intégrer. Matrice complète, empreintes SHA-256 et
   commande `git add` chemin par chemin :
   `docs/audits/melodix-p0-precommit-reconciliation-2026-11-04.md` (§7, §8, §19).

1. committer sur la branche de session uniquement : le workflow
   `p0-display-ownership.yml`, les 5 scripts `p0_display_*.sh`,
   `scripts/aggregate_p0_display_ownership.py` (v2), le harness
   `tests/android/HomeRenderInstrumentation.java` modifié, et les suites
   `tests/p0_display_ownership_*.test.js` + `tests/p0_display_dock_visibility.test.js` ;
2. pousser cette branche ;
3. vérifier l'enregistrement :

   ```bash
   gh api repos/<owner>/<repo>/actions/workflows \
     --jq '.workflows[] | select(.path|test("p0-display-ownership")) | "\(.id) \(.state)"'
   ```

   Si la liste ne contient pas le workflow, **ne pas tenter de dispatch** :
   diagnostiquer d'abord.

4. confirmer que le commit déployé contient bien les **8 fichiers requis** par les
   jobs. Preuve de reproductibilité déjà établie : `a6b0270` + les 16 fichiers de
   la liste A, dans un checkout propre → **580/580 tests pass, 0 skip**. Sans ces
   fichiers, **6 à 7 des 8 manquent** et le workflow ne peut pas tourner.

Le `source_ref` du dispatch devra désigner **le commit ainsi déployé**, pas un
commit antérieur qui ne contient pas la préparation.

---

## 1. Prérequis

| Prérequis | Exigence |
|---|---|
| Runner | Linux **x86_64** avec **`/dev/kvm`** accessible |
| JDK | **17** (`javac`, `javap` disponibles) |
| SDK Android | plateforme **android-36**, build-tools **35.0.0**, `emulator`, `platform-tools` |
| Image système | `system-images;android-36;google_apis;x86_64` |
| Outils | `d8`, `apksigner`, `aapt`, `zipalign`, `adb`, `python3`, `zip` |
| Dépôt | le commit exact à tester, checkout complet (pas shallow) |

Un environnement sans KVM **ne peut pas** exécuter cette campagne : le script de
boot refuse explicitement (`KVM is unavailable on this runner`). Ne pas tenter de
contourner ce refus.

Vérification rapide avant lancement :

```bash
test -e /dev/kvm && echo "KVM ok"
javac -version && java -version
test -f "$ANDROID_HOME/platforms/android-36/android.jar" && echo "API 36 ok"
test -x "$ANDROID_HOME/build-tools/35.0.0/apksigner" && echo "build-tools ok"
```

---

## 2. Secrets

Le job de capture **n'utilise aucun secret**. Le job de build réutilise
`preview-apk.yml` avec `secrets: inherit` ; les secrets nécessaires sont ceux du
build de l'APK de prévisualisation, **déjà configurés dans le dépôt**.

Aucune valeur de secret ne doit être copiée dans un fichier, un ticket, un journal
ou une conversation. Ce runbook n'en contient aucune et n'en demande aucune.
**Aucun compte Spotify réel n'est utilisé** : la campagne est non authentifiée
(`session_state: unauthenticated`, `authenticated_spotify_test: not_performed`).

---

## 3. Lancement autorisé

Le workflow est **strictement opt-in** et ne se déclenche que manuellement.

- Workflow : `.github/workflows/p0-display-ownership.yml`
- Déclencheur : `workflow_dispatch` uniquement
- Paramètres :

| Paramètre | Type | Requis | Défaut |
|---|---|---|---|
| `enabled` | booléen | oui | **`false`** |
| `source_ref` | chaîne | oui | **aucun** |

`source_ref` doit être le **SHA-1 complet en minuscules (40 caractères)** du commit
à tester. Il n'a pas de défaut : ne jamais le remplacer par une branche, et ne
jamais introduire de branche par défaut implicite.

**Le lancement doit être explicitement autorisé par le responsable du dépôt.**
Tant que cette autorisation n'est pas donnée, laisser `enabled=false`. Aucune
campagne n'a été déclenchée pendant la préparation.

Permissions du workflow : `contents: read`, `actions: read`. Il ne publie rien
(ni preview, ni release, ni APK distant) et n'écrit rien dans le dépôt.

---

## 4. Déroulé et points de contrôle

### 4.1 Compilation du harness (bloquant, en amont)

Job `compile-display-harness`, 20 min.

```
javac --release 8 -Xlint:all -classpath $ANDROID_HOME/platforms/android-36/android.jar …
javap -p … com.melodix.test.HomeRenderInstrumentation
d8 …
```

Le job vérifie la présence des **6 signatures** compilées, pas seulement le code de
sortie de `javac`. Si le harness ne compile pas, **tout s'arrête ici** : aucune
capture n'est tentée. C'est le comportement voulu.

`-Xlint:all` sans `-Werror` : android-36 déprécie légitimement certaines API de
métrologie utilisées en lecture seule.

### 4.2 Vérification de l'APK

Job `prepare-display-comparison`, 25 min. `SOURCE_ROOT` doit pointer le checkout
exact. Le vérificateur exige :

- nom d'artefact conforme, `source_ref` 40 hex minuscules, versionName
  `1.2.2-<7 premiers caractères du SHA>` ;
- `sha256sum -c` du fichier `.sha256` publié ;
- `apksigner verify` **réussi**, empreinte du certificat extraite et **présente dans
  les ressources embarquées** ;
- package `com.melodix.music.preview`, versionCode attendu, `debuggable=true` ;
- manifeste d'assets couvrant **exactement** le checkout (ni manque, ni doublon, ni
  extra), chemins non traversants, tailles et digestes bien formés ;
- chaque asset embarqué **octet pour octet** égal au fichier du checkout ;
- les 3 assets générés liés à leur source lisible (`source` + `source_sha256`) avec
  un en-tête de dérivation véridique.

Sortie : `provenance.json` (`schema_version: 2`). Il n'est écrit qu'après **tous**
les contrôles. Un échec ne laisse **aucun** sidecar.

### 4.3 Captures phone et tablette

Job `capture-display-profile`, matrice `[phone, tablet]`, `fail-fast: false`,
45 min par profil, **sans secrets**.

Budgets internes : boot **900 s**, capture **1500 s** — tous deux sous le timeout de
job, ce qui laisse la marge pour l'installation, l'instrumentation et le nettoyage.

Les deux profils utilisent **le même APK** (même `apk_sha256`) et **le runner
compilé à l'étape 4.1**. Chaque capture produit un sidecar strict à 5 échéances
**launch-relative** : 200 ms, 1 s, 3 s, 8 s, 20 s depuis le lancement réel. La
chronologie n'est **jamais** recalée après disparition du splash.

### 4.4 Agrégation

Job `aggregate-display-comparison`, 10 min. N'accepte que **deux** sidecars
`schema_version: 2`, de profils distincts, partageant APK, SHA-256, commit,
provenance, version et certificat. Un scan de confidentialité est appliqué.
L'agrégat porte `p0_resolution_claimed: false` dans tous les cas.

---

## 5. Interprétation des résultats

### 5.1 Les trois états, à ne jamais confondre

| Valeur | Signification | Conséquence |
|---|---|---|
| `observed` | appropriation du centre **positivement observée** | critère battu |
| `not_observed` | **mesure positive fiable** de l'absence d'appropriation | acceptable |
| `undetermined` | aucune mesure attribuable | **échec** |

`not_observed` **n'est pas** une absence de données. Un seul `undetermined`, à
n'importe quelle échéance, fait échouer l'agrégation. Aucun succès n'est déduit
d'un manque de mesure.

### 5.2 Ce qui est attendu à 200 ms

À 200 ms on n'exige **pas** le natif complet. Une transition normale (splash ou
shell natif au centre) donne `not_observed` et **ne bat pas** le critère. Une
appropriation n'est déclarée que sur observation positive : centre possédé par la
WebView **et** contenu classé `spotify_web`. L'absence de WebView ne suffit jamais
à conclure.

### 5.3 Ce qui est exigé aux 4 échéances suivantes

À 1 s, 3 s, 8 s et 20 s : racine native visible, géométrie conforme, **dock
réellement visible** et aucune appropriation. L'appropriation est interdite aux
**cinq** échéances.

Le contrôle du dock est désormais **discriminant** : il vérifie que le dock tient
dans la fenêtre et qu'aucune surface dessinée au-dessus du shell natif
(`hScrollView`/WebView, `splashOverlay`) ne couvre son centre. Il ne repose plus sur
l'appartenance au parent, qui était vraie par construction.

### 5.4 Critères de succès et d'échec

**Succès de la campagne de mesure** (pas du P0) : les deux sidecars existent, sont
valides, déterministes sur les 5 échéances, et l'agrégat est produit.

**Échec** : sidecar manquant, `undetermined`, profils non distincts, APK/certificat/
version divergents, échéance manquante/dupliquée/désordonnée/hors tolérance, champ
inattendu, canari de confidentialité, boot ou instrumentation en échec.

**Le P0 ne peut être déclaré résolu** qu'après analyse humaine des **deux résultats
runtime réels issus du même APK**. L'agrégateur ne le déclare jamais lui-même.

---

## 6. Diagnostics et artefacts

| Artefact | Contenu |
|---|---|
| `melodix-display-tooling-<run_id>` | outillage et provenance |
| `melodix-display-ownership-<profile>-<run_id>` | sidecar strict du profil |
| `melodix-display-boot-diagnostic-<profile>-<run_id>` | catégories de panne + compteurs |
| `melodix-display-ownership-combined-<run_id>` | agrégat des deux profils |

Le diagnostic de boot ne contient **que** des catégories (`kvm_permission`,
`acceleration`, `gpu`, `disk_space`, `avd_config`, `skin`, `snapshot`,
`system_image`, `port_in_use`, `fatal`) et des compteurs, avec
`raw_log_retained: false`. Aucune sortie brute d'émulateur, aucun journal applicatif,
aucune donnée de compte. Les sidecars sont à allowlist stricte : tout champ
inattendu est refusé, et les erreurs nomment des catégories, jamais des valeurs.

Si un artefact contient un fichier inattendu, le traiter comme un défaut de
confidentialité, pas comme un détail de forme.

---

## 7. Nettoyage

L'arrêt est ciblé et sûr :

1. `adb -s <serial enregistré> emu kill` — uniquement le serial de ce run ;
2. avant tout signal, vérification que `/proc/<pid>/cmdline` contient bien
   `-avd <nom enregistré>` ;
3. `SIGKILL` en dernier recours, avec la **même** revérification.

Un PID réutilisé n'est jamais confondu avec notre émulateur. **Un émulateur voisin
n'est jamais tué.** En cas d'annulation du job, exécuter
`scripts/p0_display_stop_avd.sh <STATE_DIR>` : il refuse d'agir si l'identité ne
correspond pas.

Ne pas lancer de nettoyage global (`pkill emulator`, `killall`, suppression de
répertoires partagés).

---

## 8. Limites connues à garder en tête

- La compilation vérifiée localement pendant la préparation utilisait **ECJ 3.8.2**
  en niveau de langage 7 sur une copie `/tmp`, **pas** `javac --release 8`. Le job CI
  refait la compilation correctement ; ne pas considérer la préparation comme une
  validation de la compilation CI.
- Aucun DEX, APK signé ou exécution n'a été produit localement.
- `getGlobalVisibleRect` ignore l'occlusion entre frères : le contrôle du dock
  teste explicitement les surfaces superposées connues, ce n'est pas un hit-test
  général.
- Un `undetermined` n'est jamais rattrapé par une relance silencieuse : il doit être
  expliqué, puis la campagne relancée explicitement.
