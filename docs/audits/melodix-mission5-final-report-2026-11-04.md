# Mission 5 — Intégration, diagnostic Android, corrections et validation finale

**Branche :** `arena/6b935c3e-melodix` · **Date :** 2026-11-04 · **Dépôt :** `Souxch06/Melodix`

---

## Verdict

> ## P0 PARTIELLEMENT RÉSOLU — VALIDATION INCOMPLÈTE

**Ce qui est démontré par la mesure réelle**, sur émulateurs Android 16, téléphone **et** tablette, avec le même APK par run. Run final **41891575697** : les deux captures réussissent, les deux sidecars passent la validation stricte, tous les horodatages sont dans la tolérance.

- À **20 s**, le **shell natif possède le centre de l'écran** sur les deux profils, WebView toujours montée et visible dessous.
- La **tablette est déjà native à 8 s** ; le téléphone est encore sur la page de connexion Web à 8 s et devient natif entre 8 s et 20 s.
- **Aucune appropriation `spotify_web` n'a été observée à aucun des 5 checkpoints, sur aucun des deux profils, sur aucun des trois runs mesurés.** Tous les checkpoints déterminés répondent `not_observed`.
- La surface Web observée à 8 s sur le téléphone est la **page de connexion** (`owner=login`, classée `login_web`), racine native volontairement `GONE`. C'est le chemin de connexion explicite, légitime pour une session non authentifiée — pas la navigation Spotify.

**Ce qui reste non validé, et pourquoi le verdict n'est pas « résolu » :**

1. Les checkpoints **200 ms / 1 s / 3 s** sont **indéterminés** : rien n'est observable dans le processus car l'activité n'a pas repris et le thread principal est occupé. Le démarrage à froid dépasse **4 s** (mesuré). La porte exige une réponse déterminée aux 5 checkpoints ; elle refuse donc, correctement.
2. Le critère « natif aux 4 checkpoints établis » n'est pas satisfait sur le téléphone : à 8 s il est encore en connexion Web. La tablette, elle, est native dès 8 s.
3. **La session authentifiée n'a pas été testée.** Aucun identifiant n'a été fabriqué. C'est précisément le contexte où l'utilisateur décrit le défaut ; il reste hors de portée de cette validation.
4. **Aucun code de production n'a été modifié.** Les corrections portent sur l'outillage de mesure, qui était incapable de produire une mesure valide. Le défaut d'appropriation par Spotify Web n'a pas été reproduit dans le scénario testé ; il n'y avait donc pas de correctif production justifié par la preuve.

---

## Phase A — Intégration du travail réconcilié

| Élément | Valeur |
|---|---|
| Point de départ | `a6b0270` (HEAD détaché du rapport de réconciliation) |
| Fast-forward | prouvé par `git merge-base --is-ancestor` avant tout push |
| Commit d'intégration | `af329f2` — 18 fichiers, +6689/−16 |
| Workspace initial | `/home/user/Melodix`, HEAD `44902d9`, **26/26 empreintes conformes**, jamais écrit |
| Worktree de travail | `/home/user/melodix-a6b0270` |

Aucun artefact introduit. Les 9 fichiers déjà identiques n'ont pas été réintroduits. La réconciliation n'a pas été recommencée.

**Chaîne de commits (tous en fast-forward) :**
`a6b0270` → `af329f2` → `b552241` → `c93c737` → `a14cea6` → `18d2662` → `ae31ddb` → `6f9b02e` → `16ba836`

---

## Phase B — Enregistrement du workflow et environnement réel

### Blocage rencontré et résolu : workflow non dispatchable

Le dispatch renvoyait **404** alors que le fichier existait sur la branche. Cause établie par la documentation GitHub (`cli/cli` #9781, commentaire `mxxk`) : la dispatchabilité exige **soit** la présence du fichier sur la branche par défaut, **soit** l'existence d'un run antérieur.

Résolu sans toucher à `main` : push d'un squelette à trigger `push` inerte (`b552241`) → run `41876754848` `completed/skipped` → workflow **id 407194203 enregistré** → restauration du fichier manuel-seul (`c93c737`, SHA `1999e596…`). Depuis, chaque dispatch est `204`.

### Permissions et surface

- `actions: read`, `contents: read` uniquement.
- Trigger `workflow_dispatch` **seul**, garde `enabled == true` sur **5/5 jobs**.
- **0 publication** : ni release, ni Play Store, ni déploiement.
- `403` persistants sur `actions/permissions`, `permissions/workflow`, `actions/runners`, `billing/actions` — documentés, non contournés.

### Runner réellement observé

| Élément | Constat |
|---|---|
| Émulateur | Android 16, images système `android-36;google_apis;x86_64` |
| KVM | présent et utilisé sur les runners GitHub (prouvé par les jobs de boot réussis) |
| Profils AVD | `MelodixDisplayPhone` **1080×2400 @420 dpi** · `MelodixDisplayTablet` **1600×2560 @320 dpi** |
| Budgets | boot 900 s, capture 1500 s, instrumentation 180 s |
| Sandbox local | `java`, `adb`, `emulator`, `d8`, `apksigner`, `aapt` **absents**, `/dev/kvm` absent → aucune mesure Android locale possible |

---

## Phase C — Chaîne de construction APK réellement prouvée

ECJ seul ne prouvait pas un assemblage APK. Deux voies indépendantes ont été obtenues :

1. **Sonde `validate-android-assembly.yml`** — run **41878596540 `completed/success`**, runner 1000002560, étape « Assemble and inspect unsigned APK » : apktool 2.9.3 → smali → DEX → APK non signé + contrôle `aapt`, dans `RUNNER_TEMP` uniquement.
2. **Job `build-display-apk` du workflow P0** — `javac --release 8` puis `d8 --min-api 24` réels, succès à chaque run.

**Identité de l'APK du run de référence 41889092970 — identique sur les deux profils :**

```
package      = com.melodix.music.preview
source       = 6f9b02e0f0a55cd8c4f9bf6a1a64c01488baf70d
versionCode  = 1020886
versionName  = 1.2.2-6f9b02e
debuggable   = true
sha256       = 916f694cfee7e450048160d44f962f07ee559bfae54e99bec51a314eccbbea20
assets_verified_count = 17 · generated_assets_source_verified_count = 3
```

Le `versionCode` s'incrémente d'un run à l'autre ; l'égalité du SHA-256 **entre les deux profils d'un même run** est vérifiée à chaque fois par `p0_display_verify_apk.sh`.

---

## Phase D — Diagnostic réel sur les deux profils

### Run final de référence 41891575697 — captures réussies, sidecars validés, origine corrigée

**Téléphone — 1080×2400 @420 dpi**

| Checkpoint | Observé | Propriétaire | Centre | Appropriation | Racine native | WebView |
|---|---|---|---|---|---|---|
| 200 ms | 1414 ms | unknown | unknown | undetermined | non | non |
| 1 s | 2212 ms | unknown | unknown | undetermined | non | non |
| 3 s | 4223 ms | unknown | unknown | undetermined | non | non |
| 8 s | 8149 ms | **login** | **web** | **not_observed** | non | oui |
| 20 s | 20002 ms | **native** | **native_shell** | **not_observed** | **oui** | oui |

**Tablette — 1600×2560 @320 dpi**

| Checkpoint | Observé | Propriétaire | Centre | Appropriation | Racine native | WebView |
|---|---|---|---|---|---|---|
| 200 ms | 1402 ms | unknown | unknown | undetermined | non | non |
| 1 s | 2208 ms | unknown | unknown | undetermined | non | non |
| 3 s | 4204 ms | unknown | unknown | undetermined | non | non |
| 8 s | 8170 ms | **native** | **native_shell** | **not_observed** | **oui** | oui |
| 20 s | 20001 ms | **native** | **native_shell** | **not_observed** | **oui** | oui |

APK commun aux deux profils : `sha256=ace3653ad4d5183be9a17d59fde1216440bc1ce1469b6d8ebfa48dfe735936a3`, `versionCode=1020888`, `source=16ba836`.

Agrégateur : `p0_display_ownership_satisfied=false`, `p0_resolution_claimed=false`, `authenticated_spotify_test=not_performed`. La porte refuse **uniquement** parce que les trois premiers checkpoints sont indéterminés et que le téléphone n'est pas natif à 8 s — **jamais** parce qu'une appropriation aurait été observée.

### Run 41889092970 — première chronologie complète

Même APK sur les deux profils (`sha256=916f694cfee7e450048160d44f962f07ee559bfae54e99bec51a314eccbbea20`, `versionCode=1020886`).

| Checkpoint | Téléphone | Tablette |
|---|---|---|
| 200 ms | 1421 ms · undetermined | 1600 ms · undetermined |
| 1 s | 2223 ms · undetermined | 2219 ms · undetermined |
| 3 s | 4203 ms · undetermined | 4220 ms · undetermined |
| 8 s | 8252 ms · login/web · undetermined | 8307 ms · login/web · not_observed |
| 20 s | 20007 ms · **native/native_shell** · not_observed | 20001 ms · **native/native_shell** · not_observed |

### Run de reproductibilité 41890081437

Le résultat substantif **s'est reproduit sur les deux profils** : à 20 s, `owner=native`, `center=native_shell`, `takeover=not_observed`, racine native visible, WebView visible (phone 20004 ms, tablet 20001 ms). La tablette retrouve aussi `login/web` à 8 s.

Ce run a en revanche été **rejeté à juste titre** par l'agrégateur (`checkpoint observation is not launch-relative within tolerance: 200ms`, observé à 3572 ms) : il a révélé le dernier défaut d'origine du harness, corrigé depuis (voir Phase F). Le run final confirme la correction : plus aucun rejet de tolérance.

### Honnêteté des mesures

- `undetermined` n'est **jamais** compté comme absence d'appropriation : l'agrégateur exige un état déterminé aux 5 checkpoints.
- Un checkpoint non observable est enregistré comme tel, avec son horodatage réel ; **aucun horodatage n'est inventé et aucune échéance n'est déplacée**.
- Les timestamps restent dans la tolérance documentée de 1500 ms par construction.
- Le dock n'est jamais déclaré visible sur la seule containment ancêtre (voir Phase E).

---

## Phase E — Analyse de cause racine (8 points)

1. **Contrat d'empilement mesuré dans le layout.** Enfants directs de `@id/main` : `hScrollView` (élévation 0) → `webViewContainer` (0, fond `spotify_black`) ; `nativeRoot` (**15 dp**, fond `native_shell_background`, **`visibility="gone"` à l'inflation**) ; `btnSettings` (10 dp) ; `splashOverlay` (**20 dp**, fond opaque, visible) ; `progressBar` (25 dp, invisible). Le natif passe donc **au-dessus** de la WebView dès qu'il devient visible. Confirmé à 20 s sur les deux profils.

2. **`showNativeUi` ne masque pas la WebView.** Elle reste montée et `VISIBLE` ; la couverture se fait par élévation + `bringToFront()` + fond opaque. La mesure le confirme : à 20 s, `native_root_visible=1` **et** `webview_visible=1`.

3. **`applyLoginWebUi` est le seul chemin qui masque `nativeRoot`** (`GONE`) et expose `webViewContainer`. Il est atteint par `isLoginWebRoute`, qui ne lit que `nativeLoginWebRequested` — une permission explicite, pas un repli automatique.

4. **`isLoginWebPath`** reconnaît `accounts.spotify.com`, ou `open.spotify.com` avec `/login|/signin|/oauth|/auth`. `revealWebUiFrom` route vers le Web **uniquement** en connexion, sinon vers `showNativeUiFrom`. Aucun repli « Spotify Web » n'existe dans le code.

5. **La surface Web observée à 8 s est la connexion**, pas la navigation Spotify. Le classement DOM de la tablette la confirme (`login_web` → `not_observed`). L'hypothèse « Spotify Web recouvre le natif » **n'est pas reproduite** dans le scénario non authentifié à froid.

6. **Le démarrage à froid est le vrai obstacle mesuré.** L'activité n'a pas repris à 2,2 s ; à 3 s l'échantillonnage ne peut toujours pas aboutir. `MainActivity.onCreate` construit un arbre de vues considérable, dont un **formulaire de connexion créé par programme** (`LinearLayout` + « Spotify Password », stocké dans `Lml;->g`, immédiatement `GONE`) — des centaines d'allocations sur le thread principal à chaque démarrage, pour un formulaire initialement invisible. C'est une piste d'optimisation réelle, **hors périmètre du P0 d'affichage**, documentée et non corrigée.

7. **Aucune ressource tablette Melodix.** `res/values-sw600dp/*` ne contient que des bibliothèques. `MainActivity.smali:707` bascule le viewport WebView à 1600 px quand `smallestScreenWidthDp >= 600`. La tablette mesure 800 dp de large, le téléphone 411 dp : les deux profils exercise bien les deux branches, et **les deux donnent le même résultat d'appropriation**.

8. **Tautologie du dock corrigée.** `rootBounds.contains(dockBounds)` ne pouvait pas échouer : `nativeHomeTab` est un descendant de `nativeRoot` et `getGlobalVisibleRect()` clippe aux ancêtres. Remplacé par `dockUnoccluded`, qui tient compte de l'élévation, de l'ordre de dessin et de l'intersection réelle — exécuté sur JVM par un test dédié.

**Correctifs antérieurs :** les protections vérifiées en phase E (pas de repli Spotify Web, WebView maintenue montée, fond opaque, élévation native) sont **toujours effectives** dans le code et confirmées par la mesure à 20 s.

---

## Phase F — Corrections appliquées

**Périmètre : outillage de mesure uniquement. Aucun code de production modifié.**

Le harness était structurellement incapable de produire une mesure valide. Cinq défauts ont été démontrés par des runs réels, puis corrigés :

| # | Défaut | Preuve | Correctif |
|---|---|---|---|
| 1 | `upload-artifact@v4` enracine à l'ancêtre commun → artefacts imbriqués, consommateurs à plat | run 41877113743 | staging dans un répertoire unique ; test discriminant #23 |
| 2 | `launchStart` pris avant `startActivitySync` bloquant → 200 ms inaccessible | run 41880564012 | lancement non bloquant, activité lue via l'observateur de cycle de vie |
| 3 | Abandon de toute la chronologie si l'activité n'a pas repris | run 41883130651 | checkpoint « non observable » honnête, la chronologie continue ; la porte refuse toujours |
| 4 | `runOnMainSync` attend sans borne un thread principal occupé | run 41887640414 | `postOnMainWithDeadline`, sonde JS bornée par le reste de la fenêtre |
| 5 | Origine prise avant un dispatch qui attendait encore le thread principal | run 41890081437 | origine enregistrée **dans** la tâche postée, juste avant `startActivity` |

**Canal de mesure.** Les artefacts Actions ne sont pas téléchargeables depuis cet environnement (hôte blob hors allowlist). Un résumé par checkpoint a donc été ajouté au canal d'annotations, à **vocabulaire strictement fermé** :

```
owner;center_surface;takeover_state;observed_ms;root_visible;web_visible
```

Le seul champ libre est un entier borné. **7 canaris de confidentialité** (URL, jeton, entier trop long, bit hors plage, énuméré inconnu) sont prouvés rejetés et absents du JSON retenu. Les mesures sont publiées en cas d'échec comme de succès ; une mesure manquante est annoncée `not_measured`, jamais passée sous silence.

**Phases d'échec affinées** dans l'allowlist existante : `launch_dispatch`, `checkpoint_<label>`, `_no_activity`, `_main_busy`, `_inspect`, `_probe`, `_window`, `session_state`, `web_probe`, `device_metrics`, `sidecar`, `no_activity_ever`. C'est ce qui a permis de localiser chaque défaut sans télécharger d'artefact.

---

## Phase G — Reconstruction, revérification, tests

- APK reconstruit et revérifié à chaque run : DEX, manifeste, signature, SHA-256, provenance, 17 assets vérifiés.
- Réinstallation sur AVD propre à chaque capture ; émulateur vérifié vivant **avant, pendant et après** l'instrumentation.
- **584/584 tests, 0 échec, 0 skip, 0 todo.**
- Tests comportementaux ajoutés, exécutés sur **vraie JVM** (pas des regex sur des noms) :
  - `p0_display_dock_visibility.test.js` — règle d'occlusion du dock, 21+ cas.
  - `p0_display_launch_timeline.test.js` — règle d'ordonnancement des checkpoints, 26+ cas.
  - Filtre de statut : acceptation des mesures valides + rejet des 7 canaris.
  - Agrégateur : un checkpoint de lancement non observable **échoue toujours fermé**, avec un contrôle entièrement natif qui passe — le test est donc discriminant.
- **Mutations** : M1–M6 tuées sur le lancement/chronologie ; restauration de la sonde JS bloquante tue le test ; mutation de l'artefact tuée avec le message terrain exact. Toutes les mutations ont été faites dans `/tmp`, **jamais dans le dépôt**.
- Le test 159 codifiait le motif bloquant défectueux : son assertion a été **remplacée par le contrat corrigé, renforcé**, pas supprimée.

---

## Phase H — Validation fonctionnelle : testé vs inspecté

| Domaine | Statut | Détail |
|---|---|---|
| Appropriation de l'affichage à froid, non authentifié | **TESTÉ sur appareil** | 5 checkpoints × 2 profils, 3 runs mesurés, 2 sidecars validés par run |
| Géométrie, visibilité racine/WebView, dock | **TESTÉ sur appareil** | mesuré à 20 s sur les deux profils |
| Contrat d'empilement natif/WebView | **TESTÉ + INSPECTÉ** | layout + mesure concordants |
| Chemin de connexion Web | **TESTÉ (observation)** | `owner=login`, `center=web` à 8 s |
| Session authentifiée, playlists, chargement | **NON TESTÉ** | mode `authenticated-home` présent, mais ses runs CI (`test-preview-emulator.yml` 41796437131, 41795561759, 41793140692) sont tous en échec. Aucun compte simulé, aucun jeton fabriqué. |
| Lecteur, `MediaSessionCompat`, notifications, arrière-plan | **INSPECTÉ STATIQUEMENT** | non exercé sur appareil dans cette mission |
| Pont JS/Android, `AndBridge` | **INSPECTÉ STATIQUEMENT** | contrats non modifiés |
| Permissions Android | **INSPECTÉ STATIQUEMENT** | non modifiées |

**Aucune fonctionnalité n'a été déclarée opérationnelle sur la foi d'une UI affichant un succès.**

---

## Phase I — Appareils physiques

Aucun appareil physique n'est accessible depuis cet environnement (`adb` absent, pas de périphérique USB, `/dev/kvm` absent). Protocole prêt à exécuter :

1. `adb devices` — connecter un téléphone compact et une tablette ≥ 600 dp.
2. Installer l'APK de debug produit par le job `build-display-apk` (SHA-256 vérifié).
3. `adb shell am force-stop com.melodix.music.preview` puis lancement à froid.
4. Exécuter le harness en mode `display-ownership` avec `profile`, `source_ref`, `run_id`, `apk_sha256`.
5. Relevés aux 5 échéances depuis le lancement réel ; ne jamais décaler après disparition du splash.
6. **Élément indispensable manquant :** un compte Spotify réel fourni par l'utilisateur pour couvrir le scénario authentifié, où le défaut est décrit. Sans lui, la validation reste incomplète.

---

## Phase J — Intégrité et protections

| Contrôle | Résultat |
|---|---|
| Workspace initial `/home/user/Melodix` | HEAD `44902d9`, **26/26 empreintes conformes**, jamais écrit |
| Sauvegarde `/home/user/melodix-preservation-2026-11-04/` | 37 fichiers, 36 empreintes vérifiées, conservée |
| Branche `main` | **81ef774 inchangée** |
| Releases | dernière `v1.2.2-test.95-preview`, publiée 2026-11-01 — **aucune publication** |
| Fichiers touchés par la mission 5 | **20** (dont ce rapport), tous workflows/scripts/tests/docs — **0 code production** |
| Binaires du dépôt | `classes.dex`, `1.apk`, `SpotiDuck-…zip` **préexistants et identiques depuis 44902d9** |
| Git | fast-forward uniquement ; aucun push forcé, aucun `reset --hard`, aucun `clean -fd`, aucune réécriture d'historique |
| Mutations | exclusivement dans `/tmp` |
| Secrets | aucun jeton, cookie, mot de passe ni identifiant de session dans les sidecars ou annotations ; canaris prouvés rejetés |
| Worktree | status propre à chaque commit |

---

## Blocages documentés, non contournés

1. **Artefacts Actions non téléchargeables** — `artifacts/<id>/zip` redirige vers `productionresultssa*.blob.core.windows.net`, hors allowlist réseau → 0 octet. Les artefacts **existent et sont valides** sur GitHub ; ils sont listés ci-dessous pour téléchargement par l'utilisateur. Contournement légitime : canal d'annotations à vocabulaire fermé.
2. **403 sur les API de permissions Actions** — documenté, non retenté.
3. **Pas d'Android local** — outil de mesure exclusivement CI.
4. **Pas de compte authentifié** — non fabriqué, non simulé.

### Artefacts du run final 41891575697

| Artefact | Taille |
|---|---|
| `Melodix-Preview-v1.2.2-test96-display-ownership.apk` | 2 705 259 o |
| `melodix-display-tooling-41891575697` | 109 903 o |
| `melodix-display-ownership-phone-41891575697` | 992 o |
| `melodix-display-ownership-tablet-41891575697` | 952 o |
| `melodix-display-ownership-combined-41891575697` | 1 513 o |

Les sidecars des runs 41889092970 et 41891575697 sont tous deux validés par le schéma strict.

---

## Historique des runs

| Run | SHA | Résultat | Apport |
|---|---|---|---|
| 41876754848 | `b552241` | skipped | enregistrement du workflow (bootstrap) |
| 41877113743 | `c93c737` | failure | défaut #1 : artefacts imbriqués |
| 41878596540 | — | **success** | Phase C : assemblage APK réel prouvé |
| 41880564012 | `a14cea6` | failure | AVD réels ; défaut #2 : lancement bloquant |
| 41883130651 | `18d2662` | failure | phase localisée au checkpoint 200 ms |
| 41887640414 | `ae31ddb` | failure | **premières mesures réelles** ; défaut #4 |
| 41889092970 | `6f9b02e` | captures **success**, agrégat fail-closed | première chronologie complète sur les deux profils |
| 41890081437 | `6f9b02e` | failure | reproductibilité du résultat 20 s ; défaut #5 |
| **41891575697** | `16ba836` | captures **success**, agrégat fail-closed | **run de référence : origine corrigée, 0 rejet de tolérance, tablette native dès 8 s** |

---

## Prochaine action exécutable

1. Télécharger les artefacts du run final depuis GitHub (hors allowlist de cet environnement) pour consulter les sidecars complets : géométrie, bounds, `owner_transitions`, état du dock.
2. Fournir un compte Spotify de test pour couvrir le scénario **authentifié**, seul contexte où le défaut décrit par l'utilisateur peut être reproduit ou écarté.
3. Si le défaut doit être traité en tant que latence de démarrage : différer la construction du formulaire de connexion programmatique dans `MainActivity.onCreate` (aujourd'hui construit puis immédiatement `GONE`). Piste mesurée, **non appliquée**, car hors périmètre du P0 d'affichage et risquée sans validation authentifiée.
