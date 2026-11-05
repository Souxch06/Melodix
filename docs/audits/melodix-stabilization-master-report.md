# Rapport maître — Stabilisation et finalisation de Melodix

**Branche :** `arena/6b935c3e-melodix` · **`main` :** inchangé (`81ef774`) · **Début :** 5 novembre 2026

Registre des anomalies : [`melodix-bug-registry.md`](melodix-bug-registry.md).
Rapport de la phase précédente : [`melodix-qa-visual-functional-2026-11-05.md`](melodix-qa-visual-functional-2026-11-05.md).

> **Règle de lecture.** « Correctif appliqué » n'est pas « résolu ». Une anomalie n'est marquée **Résolu avec preuve** qu'après observation sur appareil, téléphone **et** tablette. Aucun commit n'est présenté comme une validation fonctionnelle.

---

## État d'avancement

| Cycle | Objet | État |
|---|---|---|
| 1 | Diagnostic et correction des défauts ouverts | **fait — en attente de vérification CI** |
| 2 | Vérification téléphone + tablette | à venir |
| 3 | Inspection des 10 surfaces | à venir |
| 4 | Audit des 15 commandes et des parcours | à venir |
| 5 | Stabilité Android et renforcement des tests | à venir |
| 6 | Validations authentifiées | bloqué — session utilisateur requise |
| 7 | Non-régression et bilan bêta | à venir |

## Tableau des anomalies

| ID | Gravité | Objet | Statut |
|---|---|---|---|
| MEL-BUG-001 | P1 | Métriques runtime ignorent `sw600dp` | **En diagnostic** — instrumenté sur appareil |
| MEL-BUG-002 | P1 | Touche système Retour inopérante sur écran natif | **Correctif appliqué** |
| MEL-BUG-003 | P2 | Contenu étranger survivant sous le titre Accueil | **Correctif appliqué** |
| MEL-BUG-004 | P2 | Faux vert de la trace | Résolu avec preuve |
| MEL-BUG-005 | P3 | Faux défaut de timing tablette | Résolu avec preuve |
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

## Blocages et besoins

| Besoin | Pour | Qui |
|---|---|---|
| Exécution du protocole authentifié sur votre appareil | MEL-BUG-006, lecteur, mini-lecteur, playlists, albums, commandes de lecture | **Vous** — aucun identifiant ne m'est demandé |

Aucune modification de zone protégée n'est nécessaire à ce stade. Si le diagnostic de MEL-BUG-001 désigne le bridge ou la session, je m'arrêterai et demanderai votre autorisation.

## Prochain travail réalisable

Cycle 2 : vérifier sur les deux profils que `back-from-settings` et `home-again` passent à `reached`, et lire le relevé `MelMetrics` pour identifier MEL-BUG-001. En parallèle, préparer l'extension du parcours aux scénarios de retour multiples et aux transitions de cycle de vie.
