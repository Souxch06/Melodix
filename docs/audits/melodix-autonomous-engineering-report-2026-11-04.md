# Melodix — Rapport d'ingénierie de la mission autonome (2026-11-04)

Objet : sécuriser, tester et documenter la préparation de la validation Android du
P0 « propriété de l'affichage » (téléphone vs tablette), **sans** changement
fonctionnel non autorisé et **sans** aucune opération git distante.

État initial et réconciliation : voir
`docs/audits/melodix-autonomous-session-baseline-2026-11-04.md`.

> **Le P0 n'est pas résolu.** Aucun résultat runtime Android n'a été produit.
> Tout ce qui suit est de la préparation vérifiée, pas une observation appareil.

---

## 1. Périmètre et méthode

Périmètre audité : le job `p0-display-ownership.yml`, ses cinq scripts shell,
l'agrégateur Python, le harness d'instrumentation Java, les deux suites de tests
dédiées, plus les workflows de référence `preview-apk.yml` et
`test-preview-emulator.yml` et le sanitiseur `sanitize_verify_diagnostic.py`.

Méthode : cycles comprendre → corriger (un problème à la fois) → tester → auditer →
documenter. Chaque correction est justifiée par un défaut démontré, et chaque
affirmation de couverture est appuyée par une **mutation** exécutée dans `/tmp`,
jamais dans le dépôt.

Résultat net de la session : **579 tests passent** (570 au départ, aucun skip),
**31 mutants tués**, dont **20 étaient invisibles** à la suite existante, et **une
compilation Java réelle** du harness contre un `android.jar` API 36 authentique.

---

## 2. État git et opérations effectuées

Aucun commit, aucun push, aucune modification de `main`, aucune fusion, aucun
déclenchement de workflow, aucune publication, aucune modification de permission
ou de secret. Toutes les commandes git étaient des lectures. L'arbre de travail
porte les modifications ; elles ne sont pas engagées.

Aucun fichier de production modifié. Les seuls fichiers touchés hors `docs/` sont
sous `tests/`, `scripts/`, `.github/`, plus `.gitignore`.

`git diff --stat` : **7 fichiers suivis, +649 / −28**. Empreintes SHA-256 des
fichiers modifiés pendant la mission (l'état de départ est dans le document de
baseline) :

| Fichier | SHA-256 |
|---|---|
| `tests/android/HomeRenderInstrumentation.java` | `b9ef4a6fec83a4187b3c91fa9e29e204d36bc6d3b6a93591b3b23b23f394a886` |
| `scripts/p0_display_boot_avd.sh` | `057eac954eac3e898c1806262c1c589fdd471ff1e7023b8ce58310e1a5a2df6e` |
| `tests/p0_display_ownership_workflow.test.js` | `89fc3e941bface41ff25fed00905f932ae207968995071190e6e657f119230da` |
| `tests/p0_display_ownership_aggregate.test.js` | `707847d4a2fbe4cc8aed05efa1d74b570ca9dafcabc1da60c1886e2cda5a6305` |
| `tests/p0_display_dock_visibility.test.js` | `c72d5d3b36bbb9bf325cb947c4671fbfc8b47ab1dfd57490d6ae19b8e42997b8` |

Le harness est passé de 6620 à **6696 lignes**. Le layout de production
`res/layout/activity_main.xml` a été lu, jamais modifié.

---

## 3. Schéma de flux des données

```
        [checkout @ source_ref]                 [inputs: enabled=false par défaut]
                 │                                        │
                 ▼                                        ▼
   ┌──────────────────────────┐              ┌────────────────────────────┐
   │ compile-display-harness  │              │  build-display-apk         │
   │ javac --release 8        │              │  (workflow réutilisable)   │
   │ + javap (6 signatures)   │              │  build_only, debuggable    │
   │ + d8 → DEX               │              │  APK + .sha256 + manifeste │
   └────────────┬─────────────┘              └─────────────┬──────────────┘
                └───────────────┬──────────────────────────┘
                                ▼
                  ┌───────────────────────────────┐
                  │ prepare-display-comparison    │
                  │ p0_display_verify_apk.sh      │
                  │ SOURCE_ROOT obligatoire       │
                  │ → provenance.json (schema 2)  │
                  └───────────────┬───────────────┘
                                  │  même APK, même SHA, même runner
                    ┌─────────────┴─────────────┐
                    ▼                           ▼
        ┌───────────────────────┐   ┌───────────────────────┐
        │ capture: phone        │   │ capture: tablet       │
        │ boot_avd → run_profile│   │ boot_avd → run_profile│
        │ 5 échéances launch-rel│   │ 5 échéances launch-rel│
        │ → sidecar strict      │   │ → sidecar strict      │
        │ stop_avd (ciblé)      │   │ stop_avd (ciblé)      │
        └───────────┬───────────┘   └───────────┬───────────┘
                    └─────────────┬─────────────┘
                                  ▼
                  ┌───────────────────────────────┐
                  │ aggregate-display-comparison  │
                  │ 2 sidecars schema 2, même APK │
                  │ scan confidentialité          │
                  │ fail-closed sur indéterminé   │
                  │ p0_resolution_claimed = false │
                  └───────────────────────────────┘
```

Point de contrôle clé : **la compilation est en amont et bloquante**
(`prepare-display-comparison` a `needs: [build-display-apk,
compile-display-harness]`). Un harness non compilable empêche toute capture.

---

## 4. Provenance et intégrité de l'APK

### 4.1 Ce que le vérificateur garantit

`SOURCE_ROOT` est obligatoire (`:?`) : sans le checkout exact, la comparaison des
assets ne serait qu'une auto-attestation du manifeste. Les trois assets générés
(`spotify_bridge`, `native_ui_shell`, `melodix_home`) sont fixés par le **contrat de
build**, jamais par le manifeste : omettre `source`/`source_sha256` ne peut donc pas
abaisser le niveau de vérification. Chaque asset embarqué doit être **octet pour
octet** égal au fichier du checkout, et l'en-tête de dérivation doit dire la vérité.

La provenance expose : SHA-256 de l'APK, package, versionCode, versionName,
empreinte du certificat, commit source, SHA-256 du manifeste, nombre d'assets
vérifiés, nombre de sources générées vérifiées, et `assets_source_root_verified`.
Le sidecar n'est écrit qu'après **tous** les contrôles : jamais de partiel présenté
comme complet.

### 4.2 Défaut de couverture trouvé et corrigé

Les 15 tests existants n'exerçaient que des valeurs **bien formées mais fausses**.
Les garde-fous de **format** et l'**identité de l'APK** n'étaient jamais atteints.
Preuve par mutation : dix mutants survivaient à toute la suite, dont

- `M22` — `apksigner verify … || die` remplacé par `|| true` : **la vérification de
  signature pouvait être supprimée sans qu'aucun test ne bronche** ;
- `M23` — idem pour `sha256sum -c` : **le contrôle du checksum APK était invisible** ;
- `M21` — le package attendu réduit à « non vide » ;
- `M18`/`M25` — `HEX64.fullmatch` remplacé par un test de vérité ;
- `M19`/`M20` — garde `bool` et garde de type du comptage d'octets supprimées ;
- `M24` — contrôle de traversée de chemin réduit au préfixe ;
- `M26`/`M27` — contrôles « objet » du manifeste et des entrées désactivés.

Un test comportemental a été ajouté
(`the APK verifier rejects malformed manifest fields, a wrong package, an unsigned
APK and a stale checksum`) : **21 cas négatifs** sur de vrais petits APK altérés à
manifeste cohérent, plus un contrôle final que la fixture non altérée passe toujours
— les rejets viennent donc bien des mutations, pas d'une fixture cassée.

**Résultat : 10/10 mutants détectés, 10/10 survivaient auparavant.**

---

## 5. Agrégateur v2 et validité des preuves

L'agrégateur n'accepte que deux sidecars `schema_version: 2`, de profils
**distincts** (`phone` < 600 dp, `tablet` ≥ 600 dp), partageant **le même APK, le
même SHA-256, le même commit, la même provenance, la même version et le même
certificat**. Les cinq échéances doivent être présentes, uniques, ordonnées,
dans la tolérance, monotones et ancrées sur le lancement réel.

Trois états sont distingués et **jamais confondus** :

| État | Signification |
|---|---|
| `observed` | observation **positive** d'une appropriation du centre |
| `not_observed` | observation **positive fiable** de l'absence d'appropriation |
| `undetermined` | pas de mesure attribuable → **échec**, jamais un succès |

`all_checkpoints_determinate` est requis : un seul `undetermined` suffit à faire
échouer l'agrégation. Aucune correction silencieuse n'est appliquée ; toute
anomalie produit une erreur explicite. `p0_resolution_claimed` reste `false`.

---

## 6. Sémantique des 200 ms et chronologie

La chronologie reste **launch-relative** : 200 ms, 1 s, 3 s, 8 s, 20 s depuis le
lancement réel. Elle n'est **pas** décalée après disparition du splash.

À 200 ms, le harness ne réclame pas le natif complet. Il mesure quelle surface
possède le centre, à partir de la seule hiérarchie native :

- `native_shell` ou `splash` ⇒ `not_observed` (mesure positive, transition normale) ;
- `web` + `spotify_web` ⇒ `observed` (appropriation effective) ;
- `web` + `melodix_web` / `login_web` ⇒ `not_observed` ;
- autre catégorie, `unavailable` ou `unknown` ⇒ `undetermined` ⇒ échec.

L'absence de WebView n'est **jamais** une réussite en soi : elle ne produit un
`not_observed` que si une surface native ou le splash est positivement identifiée
comme propriétaire du centre. La géométrie centrale est conservée, l'état transitoire
est enregistré (`splash_transient`). Aux **quatre** échéances suivantes, la
visibilité native, la géométrie, le dock et l'absence d'appropriation sont exigés ;
l'appropriation est interdite aux **cinq**.

---

## 7. Revue Java du harness — défaut réel trouvé et corrigé

### 7.1 `rootCoversDock` était une tautologie

Le critère d'appartenance native exigeait :

```java
boolean rootCoversDock = rootBounds != null && dockBounds != null
        && rootBounds.contains(dockBounds);
```

Or `dockBounds = visibleBounds(nativeHomeTab)` utilise `getGlobalVisibleRect()`,
qui **clippe un vue à ses ancêtres**. Le layout de production
(`res/layout/activity_main.xml`, inspecté, non modifié) place le dock à
`main > nativeRoot > nativeTabBar > nativeHomeTab`. Donc `dockBounds ⊆ rootBounds`
est **vrai par construction** dès que les deux rectangles existent.

Conséquence : ce terme ne prouvait que « le dock est mis en page ». Il **ne pouvait
pas échouer** quand `hScrollView`/WebView était dessiné par-dessus le dock — c'est-à
-dire précisément l'appropriation que le P0 cherche à détecter. `getGlobalVisibleRect`
ignore l'occlusion entre frères et l'élévation : un dock recouvrait restait « visible ».

### 7.2 Correction

La décision est déplacée dans `dockUnoccluded`, méthode **statique sans type
Android**, qui ajoute les deux contrôles réellement discriminants :

1. le dock doit tenir dans la fenêtre applicative à l'écran ;
2. aucune surface dessinée **au-dessus** du shell natif ne doit couvrir son centre
   — comparaison `(Z, index de dessin)` identique à celle de
   `frontmostFullscreenSurface`, appliquée à `hScrollView` et `splashOverlay`.

Un adaptateur en lecture seule, `nativeDockActuallyVisible`, convertit la hiérarchie
vivante en géométrie pure. Aucune UI de production n'est modifiée ; la sonde reste
strictement lecture seule.

**Limites documentées de `getGlobalVisibleRect`** : ne tient pas compte de
l'occlusion entre frères, de l'élévation/translation Z hors comparaison explicite,
ni du découpage par une fenêtre système. Le contrôle est donc une teste d'occlusion
**explicite contre les surfaces superposées connues**, pas un hit-test général. Un
enfant de `hScrollView` ne peut pas échapper à l'ordre de dessin de son parent :
tester `hScrollView` est suffisant et sans faux négatif.

### 7.3 Preuve

La méthode est extraite **verbatim** du harness par
`tests/p0_display_dock_visibility.test.js`, compilée, puis **exécutée sur une vraie
JVM** : **21 cas**, tous verts, dont le cas discriminant « WebView au-dessus
couvrant le dock ⇒ invisible », les ordres Z/index, les bords exclusifs, les
géométries dégénérées et hors fenêtre. Un cas supplémentaire démontre que
l'**ancienne** formule restait vraie sous occlusion.

Six mutants de cette logique (`M35`–`M40`) sont **tous détectés**.

---

## 8. Cycle de vie de l'AVD

Budgets explicites et bornés : **900 s** pour le boot, **1500 s** pour la capture,
tous deux très en dessous du timeout de job de **45 min**, ce qui laisse la marge
pour SDK → AVD → boot → installation → instrumentation → validation → nettoyage.

Le PID de l'émulateur, le nom d'AVD, le serial adb, l'identité et les deux échéances
sont persistés dans `STATE_DIR`. La vivacité est contrôlée **avant** l'instrumentation,
**pendant** par un watchdog, et **après**. Le script de profil refuse de démarrer si
`adb get-state` échoue.

L'arrêt est ciblé : `adb -s <serial enregistré> emu kill`, puis vérification que
`/proc/<pid>/cmdline` contient bien `-avd <nom enregistré>` avant tout signal, et la
même revérification avant un éventuel `SIGKILL`. **Un PID réutilisé n'est jamais
confondu avec notre émulateur, et un émulateur voisin n'est jamais tué.**

Les diagnostics sont bornés et assainis : le writer ne conserve que des **catégories**
de marqueurs (11 catégories : KVM, accélération, GPU, disque, config AVD, skin,
snapshot, image système, port, fatal…) et des **compteurs**, avec
`raw_log_retained: false`. Aucune sortie brute de l'émulateur n'est exportée.

### 8.1 Défaut de couverture trouvé et corrigé

Les contrôles de vivacité et d'échéance n'étaient assertés que **textuellement**
(`assert.match(runner, /…/)`). Ces assertions prouvent que le contrôle est *écrit*,
pas qu'il se *déclenche*. Preuve : `M45` (vérification `adb get-state` supprimée) et
`M46` (validation du PID supprimée) passaient inaperçues.

Quatre tests **comportementaux** ont été ajoutés. Ils exécutent le vrai runner contre
un faux `adb` et un vrai processus vivant tenant le rôle de l'émulateur, et couvrent :
émulateur mort avant l'instrumentation, perte d'ADB, échec d'installation, échéance
de capture expirée, échéance invalide, statuts d'instrumentation en échec, sidecar
**réellement vide** (0 octet), code retour incorrect, identité d'émulateur absente ou
invalide (PID 1, non numérique, négatif), répertoire d'état manquant, et **mort de
l'émulateur pendant l'instrumentation** — le watchdog doit échouer en moins de 60 s
au lieu d'attendre le budget de 180 s.

Chaque test vérifie aussi l'**absence de sidecar partiel** et l'**absence de fuite**
des charges utiles d'instrumentation non autorisées. Un **contrôle positif** final
exécute le cycle complet sain et exige que le sidecar validé soit produit, seul, sans
fichier inattendu.

**Résultat : 8/8 mutants détectés** (`M41`–`M48`), dont 4 invisibles à l'ancien test.
Deux d'entre eux (`M47` sidecar vide, `M48` contrat de code retour) **survivaient à
ma première version** de ces tests : les cas manquants ont été ajoutés puis la
détection revérifiée. La couverture n'est donc pas déclarée, elle est mesurée.

### 8.2 Limite découverte : `kill -0` et les zombies

Un processus tué mais non *reapé* reste un zombie, et `kill -0` **réussit** sur un
zombie : la vivacité paraît vraie. Les fixtures utilisent donc un processus
double-forké (`setsid`), reparenté à l'init qui le réape, pour que la mort soit
réellement observable. En production l'émulateur est orphelin reparenté à l'init dès
la sortie du script de boot, donc la fenêtre zombie est négligée ; c'est néanmoins
une limite de `kill -0` à connaître, et non un défaut du script.

---

## 9. Compilation Android réelle

### 9.1 Outillage obtenu

| Élément | Détail |
|---|---|
| `android.jar` API 36 | 27 768 026 o, sha256 `d9eb9da8…59b59f9a` |
| Fidélité SDK | 14 996 entrées, corps `Stub!`, bytecode major 52, **aucune API cachée** (`ActivityThread`, `com.android.internal.R`, `IActivityManager` absents), `java.*` présent (1258 entrées) |
| Compilateur | **ECJ 3.8.2** (`org.eclipse.jdt.core.compiler.batch`), 1 513 931 o |
| Runtime | JRE 17 (jdk4py), **sans `javac`** |

L'`android.jar` a été obtenu via `api.github.com` (`git/blobs`), les assets de
release GitHub étant inaccessibles depuis cet environnement.

### 9.2 Résultat

**Compilation réelle réussie : 77 fichiers `.class`, zéro erreur.** Classe
principale `com/melodix/test/HomeRenderInstrumentation.class`, conforme à la cible
d'instrumentation déclarée au manifeste
(`android:name="com.melodix.test.HomeRenderInstrumentation"`).

Vérifications sur le bytecode produit :

- magic `CAFEBABE` sur les 77 classes, version major **51** ;
- **89/89** clés JSON de la sonde présentes, dont `center_surface_owner`,
  `web_center_category`, `web_center_takeover_state`, `splash_transient`,
  `native_route_root_covers_dock`, `display_ownership_launch` ;
- **les 6 signatures exigées par le job CI** sont toutes présentes :
  `runDisplayOwnershipComparison`, `inspectDisplayOwnershipCheckpoint`,
  `completeDisplayOwnershipWebCenter`, `displayOwnershipWebCenterCategory`,
  `evaluateJavascriptWithDeadline`, `displayOwnershipDeviceMetrics`.

Commande exacte :

```
java -cp ~/.melodix-toolchain/ecj.jar org.eclipse.jdt.internal.compiler.batch.Main \
  -source 1.7 -target 1.7 \
  -bootclasspath ~/.melodix-toolchain/android-36.jar \
  -classpath   ~/.melodix-toolchain/android-36.jar \
  -d <classes> -nowarn <copie /tmp>/HomeRenderInstrumentation.java
```

### 9.3 Limites — à ne pas surinterpréter

1. **ECJ n'est pas `javac`.** Le job CI utilise `javac --release 8 -Xlint:all`. La
   compilation locale n'est pas celle de la CI.
2. **Niveau de langage 7, pas 8.** ECJ 3.8.2 plafonne à Java 7. Le harness utilise la
   capture *effectivement finale* (Java 8). Une **copie `/tmp`** a donc reçu
   **8 mots-clés `final`** (6 variables locales, 2 paramètres) — sémantiquement
   neutres, car ces variables étaient déjà effectivement finales (affectées une
   seule fois, vérifié). **Le dépôt n'a pas été modifié pour cela.**
3. Premier passage sur le fichier **du dépôt** : **35 erreurs, toutes** la règle de
   capture Java 8, **zéro erreur d'API, de type ou de signature**. Toute la surface
   API Android est donc résolue contre l'`android.jar` authentique.
4. **Pas de D8, pas de DEX, pas d'APK, pas de signature, aucune exécution.**
   `d8`, `apksigner`, `zipalign`, `adb`, `emulator` sont absents, `/dev/kvm` aussi.
5. **Compiler n'est pas exécuter.** Ce résultat ne dit rien du comportement runtime.

---

## 10. Workflow CI

Audité, **jamais déclenché**.

- Déclencheur : `workflow_dispatch` **uniquement**. Ni `push`, ni `pull_request`,
  ni `schedule`, ni `workflow_call`.
- `enabled` : booléen requis, **`default: false`** — strictement opt-in.
- `source_ref` : chaîne requise, **sans défaut** : aucune branche par défaut
  implicite, la contrainte de branche n'est pas contournée.
- Permissions : `actions: read`, `contents: read`. Aucune écriture, aucune
  publication, aucune release.
- Cinq jobs : `compile-display-harness` (20 min), `build-display-apk` (workflow
  réutilisable — `timeout-minutes` n'est pas applicable à un job `uses:`),
  `prepare-display-comparison` (25 min), `capture-display-profile` (45 min, matrice
  phone/tablet, **sans secrets**), `aggregate-display-comparison` (10 min).
- Dépendances : la compilation est **en amont et obligatoire**. L'agrégation n'a
  lieu qu'après les deux captures.
- Même APK et même runner pour les deux profils ; les sidecars sont liés au bon run
  via `run_id` et au bon APK via `apk_sha256`.

---

## 11. Confidentialité

Deux surfaces d'export : les **sidecars** et les **diagnostics AVD**.

**Sidecars.** Allowlist stricte : `set(report) != REPORT_KEYS` (et idem pour
`device`, `webview_viewport`, chaque `checkpoint`, chaque transition) ⇒ tout champ
inattendu est refusé. Tous les champs sont typés ou énumérés : il n'existe **aucun
champ libre**. Derrière cette barrière, un scan de motifs (6 catégories :
marqueur de credential, URI, chemin privé, requête privée, valeur opaque ≥ 48
caractères, e-mail) agit en défense en profondeur. Les digests de provenance
`apk_sha256` sont explicitement exemptés du scan, car ce sont des preuves requises.

**Tests canaris ajoutés.** 15 catégories — access token, refresh token, en-tête
Bearer, cookie, e-mail, URI privée, URI Spotify, chemin utilisateur, chemin privé
d'application, stockage externe, identifiant de compte, titre musical, mot de passe,
client secret, blob opaque — injectées à **4 profondeurs** (champ racine, `device`,
`checkpoint`, valeur d'un champ énuméré), soit **60 exécutions**. Assertions :
refus, **aucun artefact produit**, et **aucun canari dans stdout ni stderr** — un
rejet qui réaffiche le secret le ferait fuir dans le journal CI.

**Diagnostics AVD.** Le même jeu de 15 canaris est injecté dans le log émulateur
**et** dans les paramètres recopiés (`reason`, `profile`). Aucun ne survit, et les
vraies catégories de panne restent correctement détectées — un writer qui se
contente de tout jeter échouerait à ce test.

**Durcissement.** Le writer valide désormais `profile` en plus de `reason` : il ne
dépend plus de la validation faite en amont par le script appelant.

**Frontière assumée et testée.** Le scan de motifs reconnaît 13 des 15 catégories ;
un chemin utilisateur nu (`/home/...`) et un titre musical brut ne portent aucune
syntaxe de credential et sont refusés par l'**allowlist**, pas par le scan. Cette
répartition est assertée explicitement pour qu'un futur élargissement du schéma
oblige à la revisiter — plutôt que d'élargir les regex au risque d'effacer une
information nécessaire à la preuve.

**Mutations :** `M28` (scan entièrement désactivé), `M30`/`M31` (allowlists
`checkpoint`/`device` relâchées en « sur-ensemble »), `M33` (motif e-mail neutralisé)
**survivaient tous** à la suite existante. Les 7 mutants de confidentialité sont
désormais **tous détectés**.

---

## 12. Qualité des tests et mutations

Les tests sont **comportementaux** : ils construisent de vrais petits APK, altèrent
manifestes et outils, exécutent les scripts et l'agrégateur, et assertent sur le
**résultat** (code de sortie, contenu du sidecar, absence d'artefact, absence de
fuite), pas sur des regex de script. Chaque nouveau bloc se termine par un
**contrôle positif** : la fixture non altérée doit toujours passer.

| Lot de mutants | Catégories | Détectés | Survivaient avant |
|---|---|---|---|
| `M18`–`M27` | format manifeste, type, package, signature, checksum, traversée, objet | **10/10** | **10** |
| `M28`–`M34` | scan confidentialité, allowlists, énumération, motifs | **7/7** | **4** |
| `M35`–`M40` | occlusion du dock, ordre de dessin, Z, géométrie, visibilité | **6/6** | nouveau code |
| `M41`–`M48` | vivacité AVD, watchdog, échéance, ADB, PID, sidecar vide, code retour | **8/8** | **4** (+2 dans ma 1ʳᵉ version) |
| **Total session** | | **31/31** | **20 trous réels comblés** |

Toutes les mutations ont été appliquées à des **copies dans `/tmp`**
(`p0-mut4` à `p0-mut7`). Le dépôt n'a jamais été altéré par une expérience ; les
fichiers cibles ont été restaurés et revérifiés après chaque lot.

**579 tests passent, 0 échec, 0 skip.** Le test du dock s'exécute réellement en CI
(JDK 17) ; dans un environnement sans compilateur il se déclare *skippé* avec un
message explicite plutôt que de simuler une réussite. Pendant cette session il a
été exécuté pour de vrai (21 cas sur JVM), puis a correctement signalé son skip
lorsque l'environnement a été réinitialisé, avant d'être réexécuté après
restauration de l'outillage — le skip est donc lui-même vérifié.

---

## 13. Non-régression fonctionnelle

Vérifié par `git status`/`git diff` : **aucun** fichier `.smali`, aucune logique de
connexion Spotify, gestion de session, récupération de playlists, mécanique de
lecture, lecture en arrière-plan, MediaSession, commandes audio, WebView de
production ou pont JS de production n'a été modifié. Aucune permission ajoutée.
Les seuls changements Android sont dans `tests/android/` (harness d'instrumentation).
Le layout `res/layout/activity_main.xml` a été **lu** pour établir la tautologie,
**jamais modifié**.

---

## 14. Qualité shell, Python et JavaScript

- **Shell** : les 5 scripts passent `bash -n`. Tous utilisent `set -euo pipefail`,
  un `die()` explicite, valident le nombre et la forme des arguments **avant** de
  toucher Android, quotent leurs expansions, créent leurs temporaires via
  `mktemp -d` et les nettoient par `trap … EXIT`. Les diagnostics sont des messages
  catégorisés, jamais des sorties brutes.
- **Python** : `py_compile` OK sur l'agrégateur et le sanitiseur. Types gardés
  (`bool` exclu explicitement des entiers), chemins via `pathlib`, JSON strict,
  fail-closed systématique. Les 6 workflows sont analysés par PyYAML (**54 blocs
  `run:`**).
- **JavaScript** : suites `node --test`, fixtures réalistes construites puis
  détruites dans `finally`, aucun ordre implicite entre tests, `spawnSync` avec
  tableaux d'arguments (pas d'interprétation shell).
- `git diff --check` : propre.

---

## 15. Limites et blocages

1. **Aucune exécution Android possible** : ni SDK, ni JDK complet, ni `adb`, ni
   émulateur, ni `/dev/kvm`. Le P0 ne peut pas être clos ici.
2. **Compilation locale ≠ compilation CI** : ECJ 3.8.2 en niveau 7 sur une copie
   `/tmp`, contre `javac --release 8` en CI. Pas de D8/DEX/APK localement.
3. **Historique git perdu** : les dix SHA antérieurs sont absents des objets ;
   la continuité repose sur l'inspection de l'arbre, pas sur git.
4. **Aucune autorisation d'écriture git** : les travaux restent non engagés.
5. **Le test du dock dépend d'un compilateur** : skippé explicitement si absent.
6. **L'environnement est réinitialisé entre les sessions.** `node_modules`, les
   paquets pip (PyYAML, `javalang`, le JRE `jdk4py`) et l'outillage de compilation
   hors dépôt ne persistent pas. Séquence de restauration vérifiée :

   ```bash
   npm ci                                    # sinon 474/579 avec jsdom absent
   pip install --break-system-packages pyyaml javalang jdk4py==17.0.9.2
   # android-36.jar et ecj.jar via api.github.com/git/blobs (SHA-256 contrôlés)
   ```

   Un échec `Cannot find module 'jsdom'` est un symptôme d'environnement, **pas**
   une régression. Les deux jars ont été réacquis à l'identique (mêmes SHA-256).
7. **`kill -0` réussit sur un zombie** : la vivacité d'un processus tué mais non
   réappé paraît vraie. Voir §8.2.

---

## 16. État du P0

**`OUVERT — PRÉPARATION NON DÉPLOYÉE`**

> **Verdict révisé le 2026-11-04 après tentative d'exécution réelle.** Le verdict
> précédent était `OUVERT — JOB PRET MAIS NON EXECUTE`. Il était **trop
> optimiste** : la mission d'exécution a établi que le workflow
> `p0-display-ownership.yml` et les 5 scripts `p0_display_*.sh` **n'existent que
> comme fichiers locaux non suivis**. Le workflow n'est pas enregistré côté
> GitHub (`404`, absent de `main` et du tip distant `a6b0270`, absent des
> 7 workflows enregistrés). Le job n'est donc **pas prêt à être exécuté** :
> le dispatch est structurellement impossible sans commit+push, interdits.

Détail complet des preuves, des erreurs exactes et de l'état de chaque job :
`docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md`.

**Téléphone et tablette restent ouverts** : le P0 exige l'analyse de **deux
résultats runtime réels issus du même APK**, et aucun n'existe (0 artefact de
comparaison sur les 720 artefacts du dépôt). Ni la préparation, ni 579 tests
unitaires, ni une compilation JVM ne peuvent clore le P0.

---

## 17. Reprise

Une seule action prioritaire : **déployer la préparation** — committer et pousser
sur la branche de session le workflow, les 5 scripts, l'agrégateur v2, le harness
modifié et les suites de tests, puis vérifier que GitHub enregistre le workflow.
Cette action exige une **autorisation explicite de commit/push**, absente à ce jour.

Le dispatch sur runner KVM ne devient possible qu'**après** ce déploiement. L'ordre
inverse était indiqué à tort dans la version initiale de ce rapport.

Procédure détaillée :
`docs/audits/melodix-p0-display-ownership-runbook-2026-11-04.md`.
Preuves de la tentative d'exécution :
`docs/audits/melodix-p0-display-ownership-execution-2026-11-04.md`.
