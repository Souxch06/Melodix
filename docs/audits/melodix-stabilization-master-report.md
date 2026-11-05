# Rapport maître — Stabilisation et finalisation de Melodix

**Branche :** `arena/6b935c3e-melodix` · **`main` :** inchangé (`81ef774`) · **Début :** 5 novembre 2026

Registre des anomalies : [`melodix-bug-registry.md`](melodix-bug-registry.md).
Rapport de la phase précédente : [`melodix-qa-visual-functional-2026-11-05.md`](melodix-qa-visual-functional-2026-11-05.md).

> **Règle de lecture.** « Correctif appliqué » n'est pas « résolu ». Une anomalie n'est marquée **Résolu avec preuve** qu'après observation sur appareil, téléphone **et** tablette. Aucun commit n'est présenté comme une validation fonctionnelle.

---

## État d'avancement

| Cycle | Objet | État |
|---|---|---|
| 1 | Diagnostic et correction des défauts ouverts | **fait** |
| 2 | Vérification téléphone + tablette | **fait pour le cycle 1 — D3 résolu, D2 inopérant, D1 rectifié** |
| 3 | Inspection des 10 surfaces | **7 surfaces inspectées sur les 2 profils ; 3 dépendent d'une session** |
| 4 | Audit des 15 commandes et des parcours | **parcours A–F exercés ; matrice de commandes ci-dessous** |
| 5 | Stabilité Android et renforcement des tests | **fait — 3 défauts d'outillage trouvés et corrigés** |
| 6 | Validations authentifiées | **bloqué — matrice prête, session utilisateur requise** |
| 7 | Non-régression et bilan bêta | **en cours — 694 tests, JVM exécutées en CI** |

## Tableau des anomalies

| ID | Gravité | Objet | Statut |
|---|---|---|---|
| MEL-BUG-001 | **P1** | **Garde inversée dans `metric()` : tous les jetons runtime ignorés** | **Résolu avec preuve** |
| MEL-BUG-012 | P0 | Régression de diagnostic de mon fait (2 modes) | **Résolu avec preuve** + gardes mutées |
| MEL-BUG-013 | P3 | Chrome hérité `btnSettings` dans la hiérarchie | **Non reproduit** au run suivant |
| MEL-BUG-014 | P2 | Lignes en plein bord, sans gouttière | **Résolu avec preuve** |
| MEL-BUG-002 | P1 | Touche système Retour inopérante sur écran natif | **Résolu avec preuve** (volet lecteur web : en attente de session) |
| MEL-BUG-010 | P2 | Retour inerte sur un onglet racine | **Résolu avec preuve** |
| MEL-BUG-011 | P2 | Mes assertions de retour trop faibles (faux vert) | **Résolu avec preuve** |
| MEL-BUG-008 | P3 | Étapes de trace incomplètes, 4 faux échecs d'outillage | **Résolu avec preuve** |
| MEL-BUG-009 | P4 | Sonde de premier plan muette | **Résolu avec preuve** |
| MEL-BUG-003 | P2 | Contenu étranger survivant sous le titre Accueil | **Résolu avec preuve** |
| MEL-BUG-004 | P2 | Faux vert de la trace | Résolu avec preuve |
| MEL-BUG-005 | P3 | Faux défaut de timing tablette | Résolu avec preuve |
| MEL-BUG-007 | P0 | Régression de diagnostic introduite par moi : app au launcher | **Résolu avec preuve** |
| MEL-BUG-006 | P1 | Lecteur / playlists / albums jamais observés | En attente de validation authentifiée |

---

## Cycle 1 — diagnostic et correctifs

### MEL-BUG-002 — cause confirmée, correctif appliqué

Chaîne réelle du retour, reconstituée :

```
touche BACK
  → MainActivity.onKeyDown          (ne traitait que MENU)
  → e6.onKeyDown → fm.dispatchKeyEvent
  → androidx.activity.a.onBackPressed()   ← final, non surchargeable
  → androidx/activity/b;->b()             ← MODIFIÉ PAR MELODIX
      injecte du JS dans la WebView : closeFullscreenPlayer,
      sf-expanded, sf-show-nowplaying …
```

Le répartiteur a été patché pour fermer le lecteur plein écran **dans la WebView**. Il ne connaît aucun écran natif : avec les Paramètres natifs au premier plan, il ne trouve rien à fermer et avale la touche. `MainActivity` n'a pas de `onBackPressed`, et celle d'`androidx.activity.a` est `final` — la surcharge était donc impossible.

**Correctif minimal, dans `MainActivity.onKeyDown` :** intercepter `KEYCODE_BACK` **uniquement lorsque le bouton retour natif est réellement affiché** (`isShown()`, qui tient compte des ancêtres masqués), puis réutiliser `onNativeBackClick`. Cette méthode ignore son argument `View` et restaure déjà route, titre et contenu : rien n'est dupliqué.

**Préservation des zones protégées :** dans tous les autres cas la délégation à la chaîne existante est intégrale. Le retour WebView, le lecteur plein écran et la lecture ne sont pas modifiés. Le key-up correspondant est consommé pour empêcher une double navigation.

### MEL-BUG-003 — cause confirmée, correctif appliqué au bon endroit

`onNativeBackClick` appelle `renderNativeRows` ; un simple changement de route ne le faisait pas. Sans session, aucune donnée n'arrive pour remplacer les lignes étrangères.

**Une première tentative a échoué et je l'ai écartée.** Restaurer les drapeaux d'attachement était nécessaire mais insuffisant — le run de vérification l'a montré.

**Une seconde tentative a été rejetée par un test existant, à juste titre.** J'avais placé le re-rendu dans `onNativeHomeClick`, qu'un test interdit explicitement de vider une étagère réelle. Plutôt que d'assouplir l'assertion, j'ai déplacé le correctif vers `setNativeScreen`, **gardé par le drapeau de changement de route**. L'invariant est préservé : sur `home → home`, rien n'est touché. Le correctif couvre désormais tous les chemins vers l'accueil, pas seulement l'onglet.

Récursion vérifiée : `NativeHomeShelfRenderer` n'appelle jamais `setNativeScreen`.

### MEL-BUG-001 — diagnostic sur appareil

Les trois causes d'empaquetage sont éliminées (`aapt2` sur l'APK installé) : noms présents, valeurs `sw600dp` correctes, paquet identique. Vérifié aussi : aucun dex ni aucune classe en double, `metric()` correctement écrit, `settingsRowHeight` appliqué via `setMinimumHeight` sur une ligne en `wrap_content` — donc bien effectif.

Instrumentation ajoutée : `NativeUiRowFactory.logMetricResolution`, appelée depuis `metric()` sans registre supplémentaire, protégée par un `catch Throwable` pour ne jamais casser le rendu. Elle relève pour chaque jeton : **identifiant résolu, valeur en pixels, `smallestScreenWidthDp`, `densityDpi`, classe du `Context`**. Collectée par `logcat -s MelMetrics`, dédupliquée, publiée avec les captures.

Cela tranchera entre les deux hypothèses restantes : `getIdentifier` échoue, ou le `Context` transmis ne porte pas la configuration `sw600dp`. **Aucun correctif deviné.**

### Tests du cycle 1

**681 tests, 678 pass, 0 échec, 3 ignorés** (JVM, aucun compilateur Java local — jamais comptés comme réussis).

Nouveaux : 12 tests dans `tests/ui_screen_state.test.js`, dont la vérification que chaque garde du retour **délègue** au lieu d'avaler la touche, que le key-up est consommé, que la garde de changement de route est présente, et que les budgets de registres restent sous v15.

Deux erreurs de test évitées en cours de route : `indexOf(':label')` tombe sur l'instruction de saut et non sur la définition du label ; un helper `dump()` entrait en collision avec un existant.

---

---

## Cycle 2 — vérification sur appareil (run `41998795135`)

### MEL-BUG-003 : résolu, avec preuve

`home-again` passe de `wrong_screen` à **`reached`** sur **téléphone et tablette**, `unexpected_chrome_present=false`. Le contenu des paramètres ne survit plus sous le titre Accueil. C'est une observation sur appareil, pas une inférence sur le code.

### MEL-BUG-002 : le correctif n'a pas pris effet

`back-from-settings` reste `wrong_screen` sur les deux profils. L'interception dans `onKeyDown` n'a donc pas été atteinte : la touche est consommée en amont, par `fm.dispatchKeyEvent` → `kn1.f` → `superDispatchKeyEvent`, qui ne repasse pas par `Activity.onKeyDown` sur les versions récentes d'Android.

**Je ne tente pas une seconde correction à l'aveugle.** Un relevé `MelBack` répondra à trois questions précises : la touche atteint-elle `onKeyDown` ? le bouton retour est-il trouvé par son identifiant ? est-il `isShown()` ?

### MEL-BUG-001 : mon diagnostic initial était faux — rectification

Le relevé sur appareil réfute l'hypothèse du repli téléphone :

```
mel_settings_row_height  px=152  swdp=800  dpi=320  ctx=MainActivity   → 76 dp
mel_status_max_width     px=1440 swdp=800  dpi=320  ctx=MainActivity   → 720 dp
```

**Le résolveur runtime est correct.** Les 26 jetons relevés sur tablette portent tous la bonne configuration. L'affirmation précédente est retirée du registre.

Le problème est en aval : la ligne mesure 132 px alors que son minimum est de 152 px. Pour trancher sans deviner, les **bornes exactes des vues** (id, classe, px, dp) sont désormais publiées dans `layout-*.json`, sans aucun texte. L'estimation sur pixels m'a induit en erreur ; le dump est la mesure autoritaire.

### Qualité des tests — lacune réelle trouvée et corrigée

Le seul workflow qui exécutait `npm test` était en `workflow_dispatch`, injoignable depuis une branche non défaut. **Les 681 tests, dont 3 règles JVM, ne s'exécutaient donc automatiquement nulle part.** Un job `unit-tests` est ajouté au workflow QA, avec `setup-java` : les 3 règles JVM pourront réellement s'exécuter. Le job vérifie que `pass + fail + skip = total` et **échoue si un test est ignoré alors qu'un compilateur est installé** — un skip en CI signifie une régression d'environnement, jamais une règle validée.

---

---

## Cycle 3 — une régression que j'ai introduite, trouvée et corrigée

Le run `42000520939` n'a produit que 6 fichiers au lieu de 42 : **l'application ne démarrait plus**. La cause était dans ma propre sonde : la `View` du bouton retour, stockée dans `v0`, était écrasée par la chaîne du journal, puis `View->isShown()` était appelé sur une `String`. Échec de vérification de classe, donc `MainActivity` ne se chargeait plus.

Corrigé : la `View` reste dans `v3`. Un test structurel interdit désormais qu'un registre contenant une `View` reçoive une chaîne ou un entier avant son utilisation.

**Conséquence méthodologique.** Le `back-key.txt` vide de ce run ne prouvait rien sur MEL-BUG-002 : l'application n'ayant jamais tourné, aucune touche retour n'a été pressée. J'allais en tirer une seconde conclusion fausse. Elle est retirée ; la question reste ouverte.

Pour ne plus diagnostiquer à l'aveugle, le parcours capture maintenant le buffer `crash` et les lignes `AndroidRuntime`/`FATAL` quand le shell natif n'apparaît pas.

**Tests en CI : le job `unit-tests` a réussi avec un vrai compilateur.** Les 3 règles JVM, jusque-là ignorées partout, ont enfin été exécutées, et le job exige `skip=0`.

---

---

## Cycle 3bis — vérification (run `42002228908`)

**MEL-BUG-007 résolu avec preuve** : l'application démarre, les 9 étapes sont capturées sur les deux profils, `home-again` reste `reached`. La régression que j'avais introduite est corrigée et gardée par test.

**MEL-BUG-002 — cause enfin établie par une mesure valide.** Cette fois l'application a tourné et la touche a été pressée, et `back-key.txt` est **vide sur les deux profils** : `MainActivity.onKeyDown` n'est jamais atteint pour BACK. `fm.dispatchKeyEvent` renvoie directement `superDispatchKeyEvent`, sans repasser par `Activity.onKeyDown`/`onKeyUp` ; le framework appelle ensuite `onBackPressed()`, **final** dans `androidx.activity.a`, qui délègue au répartiteur patché par Melodix.

Mon interception dans `onKeyDown` est donc **structurellement inopérante**, et c'est démontré, pas supposé.

Le seul point d'accroche restant est le répartiteur `androidx/activity/b;->b()`, dont le branchement interne est mêlé à la fermeture du lecteur plein écran — **zone protégée**. Je m'arrête ici et je demande l'autorisation plutôt que de modifier la logique de retour du lecteur.

---

---

## Cycle 4 — MEL-BUG-002 corrigé et vérifié

Autorisation ciblée reçue. **Cartographie établie avant modification** : [`melodix-back-dispatcher-map.md`](melodix-back-dispatcher-map.md).

Le correctif est une **garde additive** en tête de la branche par défaut du répartiteur, avant tout code WebView. Elle ne se déclenche que si le shell natif affiche réellement une flèche de retour, et réutilise `onNativeBackClick`.

**Préservation prouvée par empreintes**, figées dans `tests/fixtures/back-dispatch-preserved.json` : le JavaScript de fermeture du lecteur plein écran (888 caractères), `r70.a()` et `al0` sont **sha256 identiques**. Le cas 0 AndroidX est intact. Bridge, MediaSession, commandes multimédias et lecture en arrière-plan : aucun fichier touché. Toute modification de ces charges utiles fait échouer la suite.

**Vérification sur appareil** (run `42005106693`, téléphone et tablette) :

| Scénario | Résultat observé |
|---|---|
| `settings`, `settings-again` | flèche de retour présente |
| `back-from-settings` | **`reached`** — flèche absente |
| `back-once` | flèche absente : une seule pression suffit |
| `back-settled` | toujours absente après stabilisation : **aucune double navigation différée** |
| `back-from-library`, `back-from-search` | shell vivant : l'application ne s'est pas fermée |
| `background-resume` | shell et onglets présents, aucun contenu étranger |
| Mise en page | **0 défaut** sur les 8 scénarios, les 2 profils |

L'interception `onKeyDown`, démontrée inatteignable, a été **retirée** : la conserver aurait créé un second chemin de navigation sur les appareils anciens.

**Reste en attente de session** : la fermeture du lecteur plein écran *web* ne peut pas être observée sans compte. Elle est garantie par l'empreinte du payload et par la condition de la garde, et sera confirmée par les sections E et G de la matrice authentifiée.

## MEL-BUG-001 — clos comme non-défaut pour les composants mesurés

Les bornes autoritaires publiées montrent que **tous** les composants de navigation portent les bonnes valeurs tablette : bouton retour 52/48 dp, avatar 56/48, barre d'onglets 76/64, onglets 68/57,9, bouton paramètres 52/48. Le relevé runtime avait déjà montré des jetons corrects. La thèse « les jetons runtime sont ignorés » est **définitivement écartée**.

Reste une observation non expliquée : la bande d'une ligne de paramètres mesure 66 dp alors que son minimum résolu est 76 dp. Les lignes n'ayant pas d'identifiant, elles n'étaient pas mesurables ; l'outillage publie désormais `container_items`, la géométrie des enfants anonymes. Cette observation est **reclassée P3** et sera tranchée par les bornes, plus jamais par estimation sur pixels.

## Matrice de validation des commandes

| Commande | Câblage | Résultat visible observé | Statut |
|---|---|---|---|
| Onglet Accueil | oui | changement d'écran + contenu cohérent | **Fonctionnement observé** |
| Onglet Bibliothèque | oui | écran + 4 filtres | **Fonctionnement observé** |
| Onglet Recherche | oui | écran + grille 2×4 / 4×2 | **Fonctionnement observé** |
| Bouton Paramètres | oui | écran paramètres + flèche | **Fonctionnement observé** |
| Retour interne (flèche) | oui | retour à l'écran précédent | **Fonctionnement observé** |
| **Retour système** | oui | retour à l'accueil, sans double navigation | **Fonctionnement observé** |
| Filtre de bibliothèque | oui | chips présentes, appui délivré | Câblage confirmé, résultat non vérifié (session) |
| Tuile de genre | oui | appui délivré, grille inchangée sans session | **En attente de session** |
| Validation de recherche | oui | — | **En attente de session** |
| Ligne de playlist / album | oui | — | **En attente de session** |
| Lecture / pause | oui | — | **En attente de session** |
| Suivant / précédent | oui | — | **En attente de session** |
| Aléatoire / répétition | oui | — | **En attente de session** |
| Agrandir le lecteur | oui | — | **En attente de session** |
| Interrupteur de paramètre | oui | — | **En attente de session** |

Aucune ligne n'est déclarée fonctionnelle sans résultat visible observé.

## Stabilité Android — défauts d'outillage trouvés et corrigés

| ID | Objet | Effet |
|---|---|---|
| MEL-BUG-004 | faux vert de la trace | masquait des défauts réels |
| MEL-BUG-005 | délai fixe capturant une transition | produisait un faux défaut tablette |
| MEL-BUG-007 | **régression P0 de mon fait** : registre `View` écrasé par une chaîne | l'application ne démarrait plus |
| MEL-BUG-008 | clé `optional` indexée sans défaut | 4 faux échecs, alors que l'app se comportait correctement |
| MEL-BUG-009 | sonde de premier plan muette | preuve non publiée |

Chacun est gardé par un test. Le parcours capture désormais le buffer `crash` et les lignes `AndroidRuntime`/`FATAL` quand le shell natif n'apparaît pas — c'est ce qui manquait pour diagnostiquer MEL-BUG-007 sans deviner.

**Aucun plantage applicatif** n'a été observé sur les runs où le code était correct : `crash.txt` absent, shell présent sur toutes les étapes, 0 défaut de mise en page.

---

## Cycle 5 — premier parcours entièrement vert

Run **`42008408954`** : **5 jobs sur 5 en succès**, **15 étapes**, **0 anomalie**, téléphone **et** tablette, **0 défaut de mise en page**. `unit-tests` : **697 tests, 697 pass, 0 fail, 0 skipped** — les règles JVM sont réellement exécutées, aucun test ignoré.

Ce vert n'est pas un artefact : il a été obtenu **après avoir renforcé** les assertions. La séquence honnête a été :

1. `back-from-library` / `back-from-search` étaient notés `reached` **sans aucune assertion de titre** → faux vert de ma part (MEL-BUG-011).
2. `background-resume` sortait en `wrong_screen`. Plutôt que d'ajuster l'attente, j'ai regardé la capture : elle montrait **Rechercher**, et l'étape précédente aussi.
3. Le vrai défaut était donc **le Retour inerte sur un onglet racine** (MEL-BUG-010), pas le cycle de vie : l'app restaurait fidèlement l'écran réel.
4. Assertion de titre ajoutée, défaut corrigé, puis vert réel sur les deux profils.

**Le retour système est désormais vérifié** depuis un écran poussé et depuis un onglet racine, sans double navigation différée, avec survie de l'app après mise en arrière-plan et retour au premier plan (`topResumedActivity = MainActivity`).

**Préservation** : empreintes sha256 du JS de fermeture du lecteur plein écran, de `r70.a()` et de `al0` **inchangées** ; `nativeRoot` est `GONE` dès que du contenu web s'affiche, donc un lecteur ouvert fait décliner la garde et le JS d'origine le ferme. Bridge, MediaSession, multimédia, arrière-plan : aucun fichier touché.

## Ce qui reste ouvert, précisément

| Objet | État | Prochaine action réalisable |
|---|---|---|
| Hauteur de ligne paramètres tablette : **66 dp au lieu de 76** | **Défaut confirmé par les bornes**, cause non établie | Relever la spec de mesure du parent avant tout correctif |
| Lecteur, mini-lecteur, playlists, albums, commandes de lecture | **En attente de validation authentifiée** | Matrice prête, connexion manuelle par vous |
| Fermeture du lecteur plein écran web | Garantie par empreinte, **non observée** | Sections E/G de la matrice |

**Melodix n'est pas déclaré prêt à publier.** Les fonctionnalités musicales essentielles ne sont pas validées sur appareil.

---

## Cycle 6 — MEL-BUG-001 : la cause racine, enfin démontrée

### Ce que mes rapports précédents avaient faux

J'avais écrit « le résolveur fonctionne, ne plus y toucher ». **C'était faux**, et la consigne qui en découlait reposait sur cette erreur. Le journal `MelMetrics` montrait la résolution *réussie* ; il ne montrait pas la valeur **retournée**. Personne ne recevait jamais sa dimension.

### La cause, une seule instruction

```smali
invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
move-result v0
if-gtz v0, :native_metric_fallback   # saute au REPLI quand px > 0 : le SUCCÈS
return v0
```

`if-gtz` = « si supérieur à zéro ». Le chemin de succès partait au repli : **chaque dimension résolue était jetée** et remplacée par la valeur dp codée en dur. Les 26 surcharges tablette n'ont jamais été appliquées.

Le téléphone paraissait conforme **parce que ses replis valent ses propres jetons**. Le défaut était présent sur les deux profils, invisible côté téléphone.

### Instrumentation construite pour trancher

`NativeRowGeometryProbe` / `NativeRowGeometryRunnable`, en lecture seule, relèvent après layout : jeton en pixels, minimum demandé, hauteur mesurée, hauteur et largeur finales, paddings, densite, LayoutParams réellement appliqués (classe, dimensions, marges), classe et hauteur du parent avec ses paddings, nombre d'enfants. `logIdentity` relève en plus le paquet, l'identifiant du jeton, un jeton témoin, le même jeton sans contrainte de paquet, et un témoin framework.

Trois sondes concordantes au même instant ont isolé la contradiction : nom résolu (`id=2131165369`), dimension lue (`px=152`), **appelant servi avec `dp(64)=128`**.

### Résultats sur appareil, avant → après

| Mesure | Téléphone | Tablette |
|---|---|---|
| Jeton reçu par l'appelant | -1 → **168 px** | -1 → **152 px** |
| Minimum appliqué | 168 → 168 px | 128 → **152 px** |
| Hauteur finale de ligne | 171 → 174 px (66,3 dp) | 132 → **160 px (80 dp)** |
| Largeur carte statut Accueil | 379,4 → **379,4 dp** | 560 → **720 dp** |
| Position carte Accueil | x=16 → **x=16 dp** | x=120 → **x=40 dp** |

**Correctif minimal : `if-gtz` → `if-lez`.** Aucun jeton modifié, aucune valeur en dur ajoutée, aucune exception par composant.

### MEL-BUG-014 — gouttière, même exigence de cause commune

Les lignes étaient en plein bord (`marges=0/0`, parent `pad_lr=0/0`) alors qu'Accueil respecte la gouttière. **Je n'ai pas paddé le conteneur** : `nativeContent` est partagé avec le rendu Accueil, qui inset déjà ses enfants — l'aurait doublé. Un test interdit ce padding dans les deux dispositions.

`NativeRowInsets.apply` pose des marges horizontales = jeton `mel_gutter`, en conservant `MATCH_PARENT × WRAP_CONTENT` pour ne pas combattre le minimum de hauteur. **Un seul point d'appel**, partagé par les lignes de paramètres et de contenu.

| Largeur de ligne | Avant | Après |
|---|---|---|
| Téléphone | 1080 px = 411,4 dp | **996 px = 379,4 dp** (gouttière 16 dp) |
| Tablette | 1600 px = 800 dp | **1472 px = 736 dp** (gouttière 32 dp) |

### Deux régressions de diagnostic, de mon fait, assumées

| Mode | Effet | Garde ajoutée |
|---|---|---|
| `const-string v1` alors que `v1` tenait les `Resources` | shell natif jamais apparu, `visible_ids=5` puis `0` | tout registre objet ne doit pas être réécrit avant son dernier appel **sur ce type** |
| `p2` référencé dans une méthode à deux paramètres | l'app tombait à l'ouverture des Parametres, Accueil/Bibliothèque/Recherche fonctionnaient encore | tout `pN` doit exister dans la signature, tout `vN` sous `.locals` |

**Les deux gardes ont été validées par mutation** : bogue réintroduit → détecté ; restauré → tout repasse. La garde de `metric()` est mutée de la même façon.

### État du run final

Run **`42022211867`** : **5 jobs sur 5 en succès**, **15 étapes**, **0 anomalie de navigation**, **0 défaut de mise en page**, téléphone **et** tablette. `unit-tests` : **717 tests, 717 pass, 0 fail, 0 skipped**.

`MEL-BUG-013` (`btnSettings`, chrome hérité 40 dp couvert par le shell) **ne s'est pas reproduit**. Je le laisse au registre comme non reproduit, pas comme résolu : sa cause n'a jamais été établie. **Je n'ai affaibli aucune assertion** pour obtenir ce vert — il est obtenu après en avoir *ajouté*.

---

## Cycle 7 — régression visuelle complète, parcours H, matrice des commandes

### 1. Les 10 surfaces

Détail et mesures : [`melodix-surface-inspection.md`](melodix-surface-inspection.md).

**8 surfaces sur 10 inspectées sur les deux profils**, à partir des **bornes réelles** du dump, jamais d'une estimation sur capture. Les surfaces 9 et 10 — **lecteur plein écran** et **mini-lecteur** — restent **bloquées par l'absence de session** et ne sont pas déclarées inspectées.

### 2. Régression introduite par `metric()` — mesurée

Nouvel outil `scripts/ui_surface_diff.py`, qui compare les bornes entre deux runs, par surface et par profil. Artefacts : `surface-diff-metric-fix.json`, `surface-diff-stress.json`.

**Téléphone : aucune régression.** Un seul déplacement, voulu (gouttière des lignes, 411,4 → 379,4 dp) et +0,8 dp de padding. `library`, `search`, `browse-tile` **strictement inchangés**.

**Tablette : les surcharges s'appliquent enfin.** Carte de statut 560 → **720 dp**, x=120 → **40 dp**, ligne de paramètres 800 → **736 dp** de large et 66 → **80 dp** de haut.

**0 défaut de mise en page avant et après**, sur toutes les étapes des deux profils.

Entre les deux derniers runs : **0 changement de géométrie** — le parcours H et le renforcement des assertions n'ont rien déplacé.

### 3. Lacune de mesure trouvée

`nativeGenreScroll` n'exposait qu'**un** enfant, un conteneur : les tuiles de genre sont des petits-enfants et n'étaient **jamais mesurées**. Le composant principal de Recherche était invisible à l'audit. `container_items_deep` parcourt désormais les descendants jusqu'à profondeur 3, sans enregistrer aucun texte.

### 4. Les 15 commandes

Matrice générée par `scripts/ui_command_matrix.py`, qui croise le câblage statique et les verdicts **observés** : [`command-matrix.md`](command-matrix.md).

| État | Nombre |
|---|---|
| **1 — Opérationnelle, vérifiée sur appareil** | **5** |
| 2 — Câblée, résultat non vérifié | 0 |
| **3 — En attente de session authentifiée** | **10** |
| 4 — En échec | 0 |
| 5 — Non testée | 0 |

Les 5 vérifiées : onglets Accueil, Bibliothèque, Recherche, bouton Paramètres, Retour interne **et** Retour système. Les 10 autres ont un câblage confirmé mais **aucun résultat musical observé** : elles ne sont pas déclarées fonctionnelles.

### 5. Parcours G et H

**H — enchaînement répété : RÉUSSI sur les deux profils.** Trois cycles complets bibliothèque → recherche → paramètres → retour → accueil, puis stabilisation. **19 étapes, 0 anomalie, 0 défaut**, titre vérifié à chaque cycle et après l'effort, premier plan revérifié après la charge (`foreground-after-stress.txt`). Le shell garde la possession de l'écran après navigation répétée.

**G — lecteur plein écran : BLOQUÉ, en attente de connexion manuelle.** Aucune assertion n'a été modifiée pour le faire passer. Les étapes restent `blocked_no_session`.

### 6. Un faux vert de plus, trouvé dans mes propres assertions

`home` n'avait **aucune** assertion de titre, et ses identifiants requis sont présents sur **tous** les onglets natifs : il pouvait être noté `reached` alors que l'app affichait Recherche. C'est le même faux vert que celui déjà trouvé sur `back-from-search`, encore vivant sur `home`.

Titres ajoutés à `home`, `home-again`, `back-once`, `back-settled`, `back-from-settings`, `search`, `browse-tile` et aux quatre étapes H. **Un test interdit désormais toute étape non-session sans assertion de titre.** Les fixtures ont été alignées sur un dump réel, pas les assertions assouplies.

### 7. MEL-BUG-013 — reproduit, localisé, partiellement corrigé

Reproduit au run `42030168198` sur `background-resume`, téléphone, après deux runs où il était absent : **intermittent**.

**Cause établie** : `btnSettings` n'a aucun attribut `visibility` en XML, donc visible par défaut ; seul `showNativeUiFrom` le met à `GONE`, quand le shell est prêt. À la reprise, une fenêtre existe entre `onCreate` et la prise de possession par le shell. Les trois seuls sites référençant l'id sont deux dans `onCreate` et un dans `showNativeUiFrom` : **aucun code ne le montre explicitement**.

**Corrigé** : `mel_legacy_settings_size` valait **40 dp sans aucun override tablette**, sous le minimum tactile sur les deux profils. Porté à **48 dp** / **52 dp**, aligné sur le bouton natif qu'il remplace.

**Non appliqué, et pourquoi** : `visibility="gone"` en XML supprimerait la fenêtre transitoire mais **retirerait l'accès aux réglages dans le repli web**. Périmètre non maîtrisé. Correctif proposé : afficher explicitement le bouton dans le chemin de repli, puis le masquer en XML.

### 8. Non-défaut écarté avec preuve

La divergence `--mel-accent-deep` entre CSS (`#1db954`) et natif (`#0e8f47`) **n'est pas un défaut** : les rôles diffèrent. Le CSS l'utilise comme couleur de texte (**7,76:1**), le natif comme `colorPrimaryVariant` décoratif (**4,4:1**). Aligner le CSS ferait tomber le texte sous le seuil WCAG AA. Aucune modification : ce serait une régression d'accessibilité déguisée en harmonisation.

### 9. Reprise de l'ancienne interface — état des lieux

Il n'existe **pas de branche « ancienne »** dans ce dépôt : seuls `main` et la branche de travail, et l'historique du layout principal commence à la base `44902d9`. L'ancienne interface est la **couche web thémée** (`assets/css_hacks.css`, 2063 lignes), toujours active sous le shell natif, plus 13 vues de chrome hérité (`webViewContainer`, `hScrollView`, `btnSettings`, splash, états d'erreur).

Réintégrer sélectivement ces surfaces demande de faire céder le shell natif, ce qui touche l'invariant de possession d'affichage P0 — **zone protégée**. Je n'ai pas engagé cette modification sans autorisation distincte. Le seul élément sûr et démontré a été traité : la cible tactile du bouton hérité.

### 10. CI honnête

`unit-tests` a échoué une fois **sans nommer le test**, et les journaux ne sont pas joignables depuis cet environnement. Le step capture désormais le statut de la suite et **imprime les lignes `not ok` et les skips** avant de sortir ; un test épingle cette exigence. Au run suivant : **722 tests, 722 pass, 0 fail, 0 skipped** — l'échec ne s'est pas reproduit, et il est consigné comme tel, pas comme résolu.

### État du run final

Run **`42031794726`** : **5 jobs sur 5**, **19 étapes**, **0 anomalie**, **0 défaut**, les deux profils. **Aucune assertion affaiblie** : ce cycle en a ajouté.

---

## Blocages et besoins

| Besoin | Pour | Qui |
|---|---|---|
| Exécution du protocole authentifié sur votre appareil | MEL-BUG-006, lecteur, mini-lecteur, playlists, albums, commandes de lecture | **Vous** — aucun identifiant ne m'est demandé |
| ~~Autorisation répartiteur de retour~~ | accordée et utilisée, MEL-BUG-002 résolu | — |

Aucune modification de zone protégée n'est nécessaire à ce stade. Si le diagnostic de MEL-BUG-001 désigne le bridge ou la session, je m'arrêterai et demanderai votre autorisation.

## Prochain travail réalisable

Cycle 2 : vérifier sur les deux profils que `back-from-settings` et `home-again` passent à `reached`, et lire le relevé `MelMetrics` pour identifier MEL-BUG-001. En parallèle, préparer l'extension du parcours aux scénarios de retour multiples et aux transitions de cycle de vie.

---

## Cycle 8 — reconstruction visuelle, écrans 1 et 2

**Rapport détaillé** : `melodix-visual-rebuild-report.md` (9 points).

- **Référence** `f9399b2` / run `42031794726`. **Dernier run** `42065755408` **5/5 SUCCESS**,
  19 étapes, **0 défaut réel**, **0 plantage**, 2 profils. Suite **740 / 737 pass / 0 fail / 3 skip**.
- **Réellement reconstruits et validés** : **Accueil** (grille de 3 raccourcis, composition tablette
  distincte) et **Bibliothèque** (état vide tokenisé, gouttière respectée). Recherche inspectée mais
  non modifiée. Lecteur, mini-lecteur, playlists, albums, artistes : **bloqués sans session**, non
  déclarés inspectés.
- **Résolus ce cycle avec preuve** : MEL-BUG-015, 016, 017, 018.
- **Toujours ouverts** : MEL-BUG-013 (`btnSettings`, intermittent, **non résolu**) ; parcours **G**
  bloqué sans session ; validation authentifiée manquante ; l'échec unitaire isolé en CI reste
  **non reproduit**, donc non résolu.
- **Coût et honnêteté** : quatre runs rouges ou aveugles. Deux causes supposées (ordre des registres,
  `setBounds`) étaient des bogues réels mais **pas** la cause du plantage. La preuve décisive est
  venue de `crash.txt`, dont la collecte n'était déclenchée qu'au démarrage raté — corrigée.
  Deux défauts supplémentaires n'ont été vus qu'en **regardant les captures**.
- **Aucune assertion assouplie.** Gardes renforcées et validées par mutation : les quatre VerifyErrors
  réels sont rejoués et doivent être détectés.
- **Prochain travail réalisable** : surface 3 (tuiles de genres), puis états de chargement et d'erreur
  sur le modèle de `NativeEmptyState`.

---

## Cycle 9 — système visuel, Recherche et système d'états

**Rapport détaillé** : `melodix-visual-system-report.md`.

- **Référence `9322581` préservée.** HEAD `c5246aa`, arbre propre. Suite **757 / 754 pass / 0 fail / 3 skip**.
- **Livré et observé sur les 2 profils** : refonte des tuiles de genres (contraste AA mesuré, six
  teintes corrigées ; 184,8×96 dp téléphone / 173,5×116 dp tablette ; 2 vs 4 colonnes) et état de
  chargement de la Bibliothèque via le nouveau système d'états. **0 défaut géométrique** sur 38 dumps,
  **0 crash**.
- **Système d'états** : `NativeStateView`, 11 états, actions réelles seulement, branché sur
  `renderNativeRows`, le renderer partagé par bibliothèque, playlists, albums, artistes et recherche.
- **CI ROUGE assumée** : MEL-BUG-019, le tap d'une tuile de genre ne déclenche pas son handler.
  Cause non établie. **Assertion non assouplie.**
- **Résolus ce cycle** : MEL-BUG-020 (mon faux vert) et 021 (déclencheur CI aveugle à MainActivity).
- **Toujours ouverts** : 013 `btnSettings` intermittent non résolu ; parcours G sans session ;
  validation authentifiée manquante ; échec unitaire isolé en CI non reproduit.
- **Prochain travail réalisable sans session** : écouteur posé programmatiquement sur les tuiles pour
  trancher MEL-BUG-019 ; puis états de chargement prolongé et d'erreur sur les surfaces à session.

---

## Cycle 10 — MEL-BUG-019 résolu, CI 5/5 vert

- **HEAD `7b95134` poussé, arbre propre.** Suite **759 / 756 pass / 0 fail / 3 skip**. Validateurs 0/26.
- **Run `42091441657` : 5/5 VERT** (build, unit-tests, walks téléphone **et** tablette, publish).
- **MEL-BUG-019 RÉSOLU et confirmé** : cause racine = polarité inversée (`if-eqz` sur `isEmpty()`)
  dans `onNativeGenreClick` — chaque tuile taguée sortait avant le styleur, sans crash ni trace.
  Le câblage programmatique (`NativeGenreClickListener`) a d'abord prouvé que le handler était
  atteint (trace `tile click received`, run `42087348653`), puis le correctif `if-nez` a débloqué
  la sélection. `selected=3`, `walk-status=0`, 0 défaut sur 38 dumps, titre « Pop » + anneau de
  sélection **vus sur les captures** des 2 profils. Garde de test de polarité ajoutée ; l'assertion
  `selected=[1-9]` n'a jamais été assouplie. L'étape `browse-tile` attend désormais le titre « Pop ».
- **Toujours ouverts** : 013 `btnSettings` intermittent ; parcours G sans session ; validation
  authentifiée manquante.

---

## Cycle 11 — MEL-BUG-013 résolu, deuxième run CI 5/5 vert d'affilée

- **HEAD `6e0ba92` poussé.** Suite **760 / 757 pass / 0 fail / 3 skip**. Validateurs 0/26.
- **Run `42096058683` : 5/5 VERT.** `walk-status=0` et `selected=3` sur les deux profils, **0 défaut
  géométrique sur 38 dumps**, et `btnSettings` **absent de tous les dumps** : la fenêtre transitoire
  (bouton legacy visible entre l'inflation et `showNativeUiFrom`) est fermée à la source par
  `android:visibility="gone"` dans les deux layouts. Capture `background-resume` vérifiée : en-tête
  natif propre. Le repli web ré-affiche le bouton explicitement (`applyLoginWebUi`) : possession
  d'affichage native/WebView **non modifiée**, accès réglages du repli **préservé**. Garde de test.
- **MEL-BUG-019 reste confirmé** (`selected=3`, titre « Pop » + anneau vus sur captures).
- **Ouverts restants** : validation authentifiée manquante ; parcours G sans session ; états
  appuyé/indisponible des tuiles non observables sans geste maintenu.

---

## Cycle 12 — release de test automatique + audit P4 lecteur/mini-lecteur

- **Règle permanente en place** : le job `release-test` de `ui-qa.yml` publie à chaque run QA
  100 % vert une **pre-release** `v1.2.2-test.<run>-preview` taggée sur le SHA exact testé, avec
  l'APK build-only + son sha256. Run **`42102006731` 6/6 vert** → release
  [v1.2.2-test.38-preview](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.38-preview)
  (commit `34d312c`). La porte fonctionne : le run `42100380968` (suite rouge) a **skippé** la release.
- **P4 audit (sans session)** : nouveau `tests/player_structure.test.js` (8 tests) — panneaux
  cachés par défaut, progress inerte (max 1000, progress 0), placeholders réels, cibles ≥ 48 dp
  sur les 2 profils, contraste AA, handlers qui ne délèguent qu'au vrai pont JS.
- **Défaut réel trouvé et normalisé** : `nativeHasTrack` écrit inversé (double inversion avec les
  2 lecteurs = comportement correct par accident, contraire au commentaire). 3 sites normalisés en
  `if-nez`, comportement identique, garde de test sur la cohérence. Aucun mécanisme de transport touché.
- **Workflow** : `paths` inclut `tests/**` (un commit test-seul ne déclenchait plus rien).
- Suite **769 / 766 pass / 0 fail / 3 skip**.
- **Bloqué sans session** (inchangé, documenté) : validation fonctionnelle du lecteur/mini-lecteur,
  résultats de recherche de genre, parcours G.

---

## Cycle 13 — Phases 1 & 2 : Paramètres fonctionnelle + Accueil avec état de connexion actionnable

- **HEAD `419690d` poussé.** Suite **773 / 770 pass / 0 fail / 3 skip**. Run CI **`42113974311` 6/6 vert**.
- **Releases de test publiées** (règle automatique, pre-releases uniquement) :
  - `v1.2.2-test.39-preview` (run `42106633991`, commit `97e6539`) — page Paramètres réorganisée
  - `v1.2.2-test.42-preview` (run `42111159471`, commit `0d817a9`) — repli local Paramètres
  - `v1.2.2-test.44-preview` (run `42113974311`, commit `419690d`) — Accueil actionnable
- **Phase 1 Paramètres** : sections Compte et connexion / Spotify / Apparence et thème /
  Préférences de lecture / Notifications / Informations sur Melodix (version réelle
  `1.2.2 (27)` lue du PackageManager, injectée nativement). États de connexion réels et
  distincts (connecté / refus 401 sans affirmer "expirée" / refus 403 / erreur réseau /
  vérification / non connecté) ; actions réelles (se connecter, se déconnecter,
  renouveler, réessayer, réglages système de notifications). **Sans session**, le timeout
  WebView rend un repli local réel (vérifié sur capture : 5 lignes dont « Se connecter »,
  « Réglages système », « 1.2.2 (27) », « Protégées »). Aucun faux statut, aucun token affiché.
- **Phase 2 Accueil** : la carte de connexion (état chargement compris) propose désormais le
  bouton réel **« Se connecter »** — vérifié sur captures téléphone ET tablette (run
  `42113974311`), raccourcis locaux toujours accessibles dessous.
- **Bloqué sans session** (documenté) : variante connectée des Paramètres/Accueil (données
  Spotify réelles), lecteur/mini-lecteur fonctionnels, parcours G.

