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
| MEL-BUG-001 | P3 | Géométrie tablette — **thèse initiale réfutée deux fois** | **Clos comme non-défaut pour les composants mesurés** |
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

## Blocages et besoins

| Besoin | Pour | Qui |
|---|---|---|
| Exécution du protocole authentifié sur votre appareil | MEL-BUG-006, lecteur, mini-lecteur, playlists, albums, commandes de lecture | **Vous** — aucun identifiant ne m'est demandé |
| ~~Autorisation répartiteur de retour~~ | accordée et utilisée, MEL-BUG-002 résolu | — |

Aucune modification de zone protégée n'est nécessaire à ce stade. Si le diagnostic de MEL-BUG-001 désigne le bridge ou la session, je m'arrêterai et demanderai votre autorisation.

## Prochain travail réalisable

Cycle 2 : vérifier sur les deux profils que `back-from-settings` et `home-again` passent à `reached`, et lire le relevé `MelMetrics` pour identifier MEL-BUG-001. En parallèle, préparer l'extension du parcours aux scénarios de retour multiples et aux transitions de cycle de vie.
