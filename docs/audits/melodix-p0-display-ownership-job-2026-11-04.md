# P0 affichage — job CI opt-in téléphone/tablette

**Date :** 2026-11-04
**Branche :** `arena/6b935c3e-melodix`
**HEAD observé :** `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`
**Statut :** corrigé et validé statiquement/localement ; **aucune exécution Android réelle, aucun dispatch, aucun commit, aucun push**.

> **Note d'environnement.** La mission demandait de repartir de HEAD `a6b0270`.
> Le sandbox a été re-cloné entre les tours (`git reflog` : `clone` puis
> `checkout`), et `a6b0270` n'est plus un objet de ce clone. La branche est
> créée au point de branchement `44902d9` et le contenu de `a6b0270` est
> restauré en modifications non commitées. Aucun contenu n'a été perdu : la
> suite complète est verte. Aucun commit n'ayant été autorisé, cet état de
> HEAD est celui de l'environnement, pas le résultat d'une opération git.

## Objet

Job GitHub Actions **désactivé par défaut**, incapable de publier une Preview,
comparant le **même APK** sur deux profils Android 16 :

- `phone` : `smallestScreenWidthDp < 600` ;
- `tablet` : `smallestScreenWidthDp >= 600`.

Cinq échéances **relatives au lancement réel** : 200 ms, 1 s, 3 s, 8 s, 20 s.
La chronologie n'est **jamais** rebasée après disparition du splash.

## Nouveau critère à 200 ms (schéma v2)

Le schéma v1 exigeait un propriétaire natif vérifié aux cinq points, ce qui
rendait le job quasi certainement rouge dès 200 ms puisque `nativeRoot` démarre
`gone` et que `splashOverlay` est visible. Le v2 sépare deux questions.

Chaque checkpoint porte désormais cinq champs supplémentaires :
`center_surface_owner`, `splash_transient`, `web_center_category`,
`web_center_takeover_state`, `web_center_probe_elapsed_ms`.

1. **Qui possède le centre ?** `center_surface_owner` est déduit de la hiérarchie
   de vues native (`native_shell`, `splash`, `web`, `unknown`), donc mesurable à
   200 ms même sans WebView. C'est une mesure de géométrie runtime, pas un état
   supposé.
2. **Si c'est le WebView, que montre-t-il ?** Une sonde DOM bornée classe le
   centre (`spotify_web`, `melodix_web`, `login_web`, `other_web`, `unavailable`).

Règle de décision, appliquée à l'identique dans le harness et l'agrégateur :

| Centre mesuré | Verdict de prise de possession |
|---|---|
| `native_shell` ou `splash` | `not_observed` — **mesure positive**, pas une absence de données |
| `web` + `spotify_web` | `observed` |
| `web` + `melodix_web`/`login_web` | `not_observed` |
| `web` + `other_web`/`unavailable` | `undetermined` |
| `unknown` | `undetermined` |

- **À 200 ms** : le propriétaire natif vérifié n'est **pas** exigé. Ce qui est
  exigé est une réponse **déterminée** à « Spotify Web a-t-il pris le centre ? ».
  Le splash transitoire est explicitement distingué de l'appropriation WebView.
- **Aux 1 s / 3 s / 8 s / 20 s** : exigences inchangées et complètes —
  `display_owner=native`, `native_owner_verified`, `native_root_visible`,
  visibilité, géométrie et `rootCoversDock`.
- **Aucun succès par absence de données** : `p0_display_ownership_satisfied`
  exige en plus `all_checkpoints_determinate` pour les deux profils. Un seul
  `undetermined`, y compris à 200 ms, fait échouer le critère.
- L'agrégateur **recroise** le verdict avec les surfaces mesurées et rejette tout
  sidecar auto-incohérent (ex. « pas de prise » alors que le DOM dit Spotify).

## Défauts corrigés

### 1. Provenance des assets (`p0_display_verify_apk.sh`)

- `SOURCE_ROOT` est **obligatoire** (`:?`), avec contrôle des répertoires
  `assets/` et `scripts/`.
- Les trois assets générés (`spotify_bridge`, `native_ui_shell`, `melodix_home`)
  sont fixés **par le contrat de build**, jamais par le manifeste : chacun doit
  déclarer `source` et `source_sha256`, et le SHA est revérifié contre le checkout.
- Comparaison **inconditionnelle** octet à octet de chaque asset embarqué avec le
  fichier du checkout.
- En-tête de dérivation vérifié : obligatoire pour les trois générés, et
  contrôlé dès qu'il est présent ailleurs.
- Le manifeste doit couvrir **exactement** les assets du checkout : entrées
  manquantes, dupliquées, supplémentaires, chemins traversants refusés.
- Provenance : `assets_source_root_verified`, `assets_verified_count`,
  `generated_assets_source_verified_count` (schéma de provenance v2).

### 2. Trou M7 fermé

Test comportemental réel : l'APK est reconstruit avec un asset injecté, le
manifeste reste **auto-cohérent** (digest et taille recalculés sur les octets
embarqués, liaison source toujours valide). Le vérificateur doit refuser.
La suppression de la comparaison packaged/checkout fait échouer ce test.

### 3. Cycle de vie AVD

- PID, nom d'AVD, série adb et deadlines persistés dans `STATE_DIR`.
- Vivacité vérifiée **avant**, **pendant** (watchdog qui signale le client adb
  dès la mort de l'émulateur) et **après** l'instrumentation.
- Deadlines globales explicites : boot 900 s, capture 1500 s, sous le timeout
  job de 45 min ; le budget d'instrumentation est plafonné par le temps restant.
- Diagnostic de démarrage **assaini** conservé sur échec : catégories, marqueurs
  et compteurs uniquement, jamais de ligne brute (`raw_log_retained=false`).
- Arrêt **ciblé** (`p0_display_stop_avd.sh`) : série adb enregistrée, puis PID
  vérifié via `/proc/<pid>/cmdline` contenant `-avd <nom>` avant tout signal.
  Aucun `pkill`/`killall`.
- Limite documentée : en cas d'annulation du runner ou de timeout job, GitHub
  tue l'arbre de processus et les steps `always()` n'ont qu'un court délai ;
  l'arrêt ciblé peut ne pas s'exécuter. La correction repose sur le caractère
  éphémère du runner.

### 4. Compilation Android réelle

Job `compile-display-harness` : JDK 17, SDK android-36 + build-tools 35.0.0,
`javac --release 8 -Xlint:all`, vérification des **signatures compilées** via
`javap -p`, puis `d8 --min-api 24`. `prepare-display-comparison` en dépend.
`javalang` n'est utilisé nulle part dans la CI et n'est jamais présenté comme
une compilation. **Ce job n'a pas été déclenché.**

## Tests

- `tests/p0_display_ownership_workflow.test.js` : 8 → **15** tests.
- `tests/p0_display_ownership_aggregate.test.js` : 4 → **11** tests.
- Toutes les assertions antérieures sont conservées ; les fixtures ont été
  migrées vers le schéma v2, pas affaiblies.

Nouveaux tests notables : refus d'un asset différent du checkout (M7), manifeste
qui tente d'abaisser son propre niveau de vérification, en-tête forgé **présent
à la fois dans le checkout et l'APK** (seul le contrôle d'en-tête peut le voir),
`SOURCE_ROOT` absent, diagnostic de boot sans fuite, arrêt ciblé avec ému
voisin et PID recyclé (comportemental, vrais processus), splash à 200 ms accepté,
Spotify Web à 200 ms refusé, centre non attribuable à 200 ms refusé.

### Analyse de mutation (11/11 détectés)

| Mutant | Résultat |
|---|---|
| M7 suppression comparaison checkout | détecté |
| M1 ensemble des assets générés vidé | détecté |
| M9 suppression entrées manquantes/supplémentaires | détecté |
| M10 suppression contrôle d'en-tête | détecté |
| M11 suppression compteurs de provenance | détecté |
| M12 suppression persistance du PID | détecté |
| M13 suppression watchdog de vivacité | détecté |
| M14 arrêt qui fait confiance au PID sans vérifier | détecté |
| M15 natif ré-exigé à 200 ms | détecté |
| M16 `undetermined` laissé passer | détecté |
| M17 suppression du recroisement de cohérence | détecté |

M10 et M16 n'étaient **pas** couverts par la première version des nouveaux
tests ; ils l'ont été révélés par l'analyse de mutation puis fermés par des
tests différentiels dédiés.

## Validations exécutées

- `npm test` : **570/570** (556 + 14 nouveaux).
- Ciblé workflow + agrégateur : **26/26**.
- `bash -n` : 5 scripts + **54** blocs `run:` des 6 workflows.
- PyYAML : 6 workflows.
- `python3 -m py_compile scripts/aggregate_p0_display_ownership.py`.
- `javalang` : parse syntaxique OK — **pas une compilation**.
- `git diff --check` : propre.
- `npm ci` a dû être relancé : `node_modules` n'avait pas persisté (jsdom
  manquant), ce qui provoquait 4 échecs de chargement sans rapport avec les
  changements.

## Non vérifiable sans Android

- Compilation réelle du harness (aucun `java`/`javac`/`android.jar`/SDK local,
  `/dev/kvm` absent). Le job CI est prêt mais **non déclenché**.
- Comportement runtime des cinq échéances, du watchdog et de l'arrêt ciblé sur
  un vrai émulateur.
- Les mesures `smallestScreenWidthDp` réelles des deux profils.

## Intégrité

- Aucun `.smali` modifié (branche et working tree).
- Aucune modification de la connexion Spotify, de la session, des playlists ou
  de la mécanique de lecture.
- Les 5 seules lignes supprimées du harness restent la relocation du classifieur
  JS, démontrée identique octet pour octet.
- Confidentialité renforcée, jamais affaiblie : le diagnostic de boot est une
  allowlist de catégories, les statuts instrumentation restent filtrés, et le
  détail d'échec exposé se limite à `failure_phase`/`failure_type`.

## Statut

**P0 téléphone/tablette : ouvert.** Il reste à obtenir et analyser deux
exécutions runtime du **même APK**, sur téléphone et sur tablette.