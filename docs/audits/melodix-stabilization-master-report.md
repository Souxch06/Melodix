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
| 3 | Inspection des 10 surfaces | à venir |
| 4 | Audit des 15 commandes et des parcours | à venir |
| 5 | Stabilité Android et renforcement des tests | à venir |
| 6 | Validations authentifiées | bloqué — session utilisateur requise |
| 7 | Non-régression et bilan bêta | à venir |

## Tableau des anomalies

| ID | Gravité | Objet | Statut |
|---|---|---|---|
| MEL-BUG-001 | P2 | Géométrie tablette non conforme — **diagnostic initial réfuté** | **En diagnostic** |
| MEL-BUG-002 | P1 | Touche système Retour inopérante sur écran natif | **Bloqué — autorisation requise** |
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

## Blocages et besoins

| Besoin | Pour | Qui |
|---|---|---|
| Exécution du protocole authentifié sur votre appareil | MEL-BUG-006, lecteur, mini-lecteur, playlists, albums, commandes de lecture | **Vous** — aucun identifiant ne m'est demandé |
| Autorisation de toucher au répartiteur de retour | MEL-BUG-002 : seul point d'accroche restant, mêlé à la fermeture du lecteur plein écran | **Vous** — zone protégée |

Aucune modification de zone protégée n'est nécessaire à ce stade. Si le diagnostic de MEL-BUG-001 désigne le bridge ou la session, je m'arrêterai et demanderai votre autorisation.

## Prochain travail réalisable

Cycle 2 : vérifier sur les deux profils que `back-from-settings` et `home-again` passent à `reached`, et lire le relevé `MelMetrics` pour identifier MEL-BUG-001. En parallèle, préparer l'extension du parcours aux scénarios de retour multiples et aux transitions de cycle de vie.
