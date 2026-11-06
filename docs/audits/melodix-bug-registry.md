# Registre des anomalies — Melodix

Identifiants stables. Mis à jour à chaque cycle. **Aucune anomalie n'est marquée résolue sans preuve sur appareil.**

Statuts : Ouvert · En diagnostic · Correctif appliqué · En vérification · Résolu avec preuve · Bloqué · En attente de validation authentifiée.

---

## MEL-BUG-001 — Géométrie tablette non conforme aux jetons ( diagnostic initial RÉFUTÉ )

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** (réévaluée de P1 à P2 : le résolveur n'est pas en cause) |
| **Écran** | Paramètres (hauteur de ligne), Accueil (largeur de carte de statut) |
| **Appareil** | Tablette 800 dp. Non observable sur téléphone. |
| **Attendu** | Ligne de paramètres 76 dp ; carte de statut ≤ 720 dp |
| **Observé** | Bande de la ligne : 132 px = **66 dp** (trait inclus), intérieur 128 px = 64 dp |
| **Preuve** | `ui-qa-41998795135/tablet/settings-tablet.png`, relevé de couleurs ligne par ligne : trait à y=224, intérieur 226–353, trait à 354 |

### Le diagnostic initial était FAUX — rectification

J'avais conclu que le résolveur runtime retombait sur ses constantes téléphone. **Le relevé sur appareil le réfute :**

```
mel_settings_row_height id=2131165369 px=152 swdp=800 dpi=320 ctx=MainActivity
mel_status_max_width    id=2131165417 px=1440 swdp=800 dpi=320 ctx=MainActivity
```

152 px / 2,0 = **76 dp**, 1440 px / 2,0 = **720 dp** : ce sont exactement les valeurs `sw600dp`. Le `Context` est bien `MainActivity`, `smallestScreenWidthDp` vaut bien 800, `getIdentifier` renvoie un identifiant valide. **La résolution runtime est correcte.** Les 26 jetons relevés sur tablette portent tous la bonne configuration.

Ce qui reste inexpliqué est donc **en aval** : `settingsRowHeight` est appliqué par `setMinimumHeight(152)`, la ligne est ajoutée en `wrap_content`, et pourtant elle mesure 132 px. Une `LinearLayout` verticale devrait honors son minimum.

| **Cause** | **Non confirmée.** hypothèse restante : la hauteur est contrainte en aval de la fabrique. Aucune modification tentée. |
| **Instrumentation** | Les bornes exactes des vues (id, classe, px, dp) sont désormais publiées dans `layout-*.json`, **sans aucun texte**. C'est la mesure autoritaire ; l'estimation sur pixels m'a déjà induit en erreur une fois. |
| **Statut** | **En diagnostic** |

### MEL-BUG-001a — Fausse conclusion « repli téléphone » · **Résolu avec preuve (réfutation)**

L'affirmation « les 67 accesseurs retombent sur leur constante téléphone » est **retirée**. Elle reposait sur une mesure de pixels, pas sur la valeur réellement résolue. Leçon appliquée : publier les bornes du dump plutôt que deviner sur une capture.

## MEL-BUG-002 — La touche système Retour ne quitte pas les écrans natifs

| Champ | Valeur |
|---|---|
| **Gravité** | **P1** — l'utilisateur reste bloqué sur un écran |
| **Écran** | Paramètres, et tout écran natif poussé (détail, lecteur natif) |
| **Appareil** | Téléphone **et** tablette |
| **Reproduction** | 1. Accueil → bouton Paramètres. 2. Touche système Retour. 3. Attendre 8 s. |
| **Attendu** | Retour à l'écran précédent |
| **Observé** | Rien. Captures `settings` et `back-from-settings` **identiques octet pour octet**. |
| **Preuve** | `ui-qa-41989590342/{phone,tablet}/` + verdict `wrong_screen`, `forbidden_present=[nativeBackButton]` |
| **Cause** | **Confirmée en statique.** `MainActivity` n'a pas de `onBackPressed` ; `androidx.activity.a.onBackPressed()` est **final** et délègue à `androidx/activity/b;->b()`. Cette méthode, **modifiée par Melodix**, injecte du JavaScript dans la WebView (`closeFullscreenPlayer`, `sf-expanded`, `sf-show-nowplaying`). Elle ne connaît aucun écran natif : elle ne trouve rien à fermer et avale la touche. |
| **Correctif** | `MainActivity.onKeyDown` intercepte `KEYCODE_BACK` **uniquement quand le bouton retour natif est réellement affiché** (`isShown()`), et réutilise `onNativeBackClick` qui restaure déjà route, titre et contenu. Sinon, délégation intégrale à la chaîne existante. Le key-up correspondant est consommé pour éviter une double navigation. `.locals` 1 → 4, `pN` reste ≤ v15. |
| **Zone protégée** | La chaîne WebView/lecteur n'est **pas modifiée** : elle reste atteinte dans tous les autres cas. |
| **Tests** | `tests/ui_screen_state.test.js` (7 tests) |
| **Vérification** | Run `41998795135` : `back-from-settings` reste `wrong_screen` sur les deux profils. **Le correctif n'a pas pris effet** : la touche n'atteint vraisemblablement pas `onKeyDown`, consommée en amont par `fm.dispatchKeyEvent` → `kn1.f` → `superDispatchKeyEvent`. |
| **Cause confirmée par mesure** | Run `42002228908`, application démarrée, touche pressée, `back-key.txt` **vide sur les deux profils** : `MainActivity.onKeyDown` n'est **jamais atteint** pour BACK. `fm.dispatchKeyEvent` renvoie directement `superDispatchKeyEvent` et ne repasse jamais par `Activity.onKeyDown`/`onKeyUp`. Le framework appelle ensuite `onBackPressed()`, **final** dans `androidx.activity.a`, qui délègue au répartiteur patché. |
| **Correctif tenté** | Interception dans `onKeyDown` : **inopérant, démontré**. Conservé comme garde inoffensif pour les appareils anciens, à retirer. |
| **Correctif proposé** | Enregistrer un `OnBackPressedCallback` auprès du répartiteur, actif seulement quand un écran natif poussé est affiché. **Mais** le répartiteur `androidx/activity/b;->b()` a été patché par Melodix et son branchement interne (`packed-switch` sur `r70.d`) est mêlé à la fermeture du lecteur plein écran. Y toucher touche une zone protégée. |
| **Correctif appliqué** | Garde **additive** en tête de la branche par défaut de `b()`, avant tout code WebView : si le propriétaire du callback est un `MainActivity` et que `handleNativeSystemBack()` renvoie vrai, l'écran natif a traité la touche ; sinon le code d'origine s'exécute. Cartographie : `melodix-back-dispatcher-map.md`. |
| **Préservation prouvée** | JS du lecteur plein écran, `r70.a()` et `al0` : **empreintes sha256 identiques**, figées dans `tests/fixtures/back-dispatch-preserved.json`. Cas 0 AndroidX intact. Bridge, MediaSession, multimédia, arrière-plan : aucun fichier touché. |
| **Preuve de résolution** | Run `42005106693`, **téléphone et tablette** : `back-from-settings` = **`reached`**. Bornes publiées : flèche présente sur `settings`/`settings-again`, **absente** sur `back-once`, toujours absente sur `back-settled` (aucune double navigation différée), shell vivant sur `background-resume`, `back-from-library` et `back-from-search`. **0 défaut** de mise en page sur les 8 étapes. |
| **Reste à valider en session** | La fermeture du lecteur plein écran **web** ne peut pas être observée sans session : garantie par empreinte du payload, à confirmer en section E/G de la matrice authentifiée. |
| **Statut** | **Résolu avec preuve** (retour natif) — volet lecteur plein écran en attente de validation authentifiée |

## MEL-BUG-003 — Le contenu d'un écran survit sous le titre « Accueil »

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** — contenu incohérent, très visible pour un utilisateur non connecté |
| **Écran** | Accueil après visite des Paramètres |
| **Appareil** | Téléphone **et** tablette |
| **Reproduction** | 1. Accueil → Paramètres. 2. Onglet Accueil. 3. Attendre 6 s. |
| **Attendu** | Contenu de l'accueil |
| **Observé** | Titre et onglet « Accueil », mais ligne « Paramètres indisponibles » toujours affichée |
| **Preuve** | Verdict `wrong_screen`, `unexpected_chrome_present=true`, runs `41988771073`, `41989590342`, `41990724746` |
| **Cause** | **Confirmée.** `onNativeBackClick` appelle `renderNativeRows` ; `onNativeHomeClick` ne faisait que `setNativeScreen` + demande de données. Sans session, aucune donnée n'arrive, donc rien ne remplace les lignes étrangères. |
| **Historique** | Un premier correctif (restauration des drapeaux d'attachement via `beginNativeHomeRender`) était nécessaire mais **insuffisant** : le run de vérification a montré la persistance du symptôme. Il est conservé. |
| **Correctif** | `onNativeHomeClick` capture la route quittée **avant** `setNativeScreen`, et re-rend l'accueil **seulement si elle diffère de `home`**. La garantie d'idempotence d'origine (« ne jamais vider une étagère réelle ») est préservée : sur `home → home`, rien n'est touché. |
| **Correctif final** | Déplacé dans `setNativeScreen`, gardé par le drapeau de changement de route. Un test existant interdisait à `onNativeHomeClick` de vider une étagère réelle : plutôt que d'assouplir l'assertion, le correctif a été placé au bon endroit. |
| **Preuve de résolution** | Run `41998795135` : `home-again` = **`reached`**, `unexpected_chrome_present=false`, sur **téléphone et tablette**. |
| **Tests** | `tests/ui_screen_state.test.js` |
| **Statut** | **Résolu avec preuve** |

## MEL-BUG-004 — Faux vert de la trace de navigation

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** — outillage : masquait des défauts réels |
| **Cause** | `back-from-settings` et `home-again` n'exigeaient que `nativeRoot`/`nativeTabBar`/`nativeHomeTab`, visibles sur **tous** les écrans natifs. Ces étapes ne pouvaient pas échouer. |
| **Correctif** | Critères `forbidden`, `title_is`, `forbidden_chrome`, verdict `wrong_screen`. |
| **Preuve de résolution** | Les mêmes captures sont passées de `reached` à `wrong_screen`, révélant MEL-BUG-002 et 003. |
| **Statut** | **Résolu avec preuve** |

## MEL-BUG-005 — Faux défaut de timing sur tablette

| Champ | Valeur |
|---|---|
| **Gravité** | **P3** — outillage : produisait un défaut applicatif inexistant |
| **Cause** | Délai fixe après appui ; le dump tablette (plus lent) capturait une transition, 15 vues visibles. |
| **Correctif** | `settle()` : attente bornée sur la vue qui définit l'écran. Délais **allongés** pour les étapes dont on attend l'échec, afin qu'un échec ne puisse pas être un artefact. |
| **Preuve de résolution** | Bibliothèque et Recherche `reached` sur les deux profils au run suivant. |
| **Statut** | **Résolu avec preuve** |

## MEL-BUG-006 — Lecteur, mini-lecteur, playlists, albums jamais observés

| Champ | Valeur |
|---|---|
| **Gravité** | **P1** — cœur fonctionnel non validé |
| **Cause** | Aucune session Spotify dans l'environnement de test. Aucune simulation autorisée. |
| **Preuve** | Verdicts `blocked_no_session` sur les deux profils, à chaque run. |
| **Correctif** | Protocole manuel préparé, en attente d'exécution par l'utilisateur sur son appareil. |
| **Statut** | **En attente de validation authentifiée** |

---

## Anomalies écartées après vérification

| Observation | Conclusion |
|---|---|
| Champ de recherche clair dans un thème sombre | **Volontaire.** Spotify fait de même. Vérifié dans le XML avant signalement. |
| Vide central de l'accueil | État sans session, pas un défaut de mise en page. |
| Bibliothèque / Recherche « non atteintes » sur tablette | Artefact de timing (MEL-BUG-005), jamais rapporté comme défaut applicatif. |

## MEL-BUG-007 — Régression de diagnostic : `MainActivity` ne se chargeait plus

| Champ | Valeur |
|---|---|
| **Gravité** | **P0** — l'application ne démarrait pas |
| **Origine** | **Introduite par moi**, dans la sonde `MelBack` du cycle 2 |
| **Appareil** | Téléphone et tablette |
| **Symptôme** | Run `42000520939` : 6 fichiers publiés au lieu de 42 ; « le shell natif n'est jamais apparu » ; écran sur `com.google.android.apps.nexuslauncher` |
| **Cause confirmée** | La `View` du bouton retour était stockée dans `v0`, puis `v0` était écrasé par la chaîne du journal, puis `View->isShown()` était appelé sur une `String`. Échec de vérification de classe : `MainActivity` ne se chargeait plus. |
| **Correctif** | La `View` reste dans `v3`, jamais réutilisée ; `v0`/`v1` ne portent que des chaînes. |
| **Test de non-régression** | `tests/ui_screen_state.test.js` : aucun registre contenant une `View` ne doit recevoir `const-string` ou `move-result` avant son utilisation. |
| **Leçon** | Le symptôme ne pointait pas la cause. Capture du buffer `crash` et des lignes `AndroidRuntime`/`FATAL` ajoutée au parcours, publiée dans `crash.txt` et `app-log.txt`. |
| **Statut** | **Correctif appliqué — en vérification** |

## MEL-BUG-008 — Étapes de trace incomplètes : 4 faux échecs d'outillage

| Champ | Valeur |
|---|---|
| **Gravité** | **P3** — outillage, aucun impact applicatif |
| **Symptôme** | Run `42005106693` : `walk-status=4`, alors que les 8 scénarios de retour s'étaient tous bien déroulés sur appareil |
| **Cause confirmée** | Mes 4 nouvelles définitions d'étapes omettaient la clé `optional`, que `main()` indexait directement → `KeyError`. Les captures et les audits de mise en page, eux, avaient réussi. |
| **Correctif** | Lecture des clés avec défaut (`spec.get`). |
| **Test de non-régression** | Un test parcourt **toutes** les définitions d'étapes et exige que chacune produise un verdict ; il interdit l'indexation directe des clés optionnelles. |
| **Distinction importante** | Ces 4 échecs n'ont **jamais** été rapportés comme défauts applicatifs : les bornes publiées prouvaient le contraire. |
| **Statut** | **Résolu avec preuve** |

## MEL-BUG-009 — Sonde de premier plan muette

| Champ | Valeur |
|---|---|
| **Gravité** | **P4** — outillage |
| **Symptôme** | `foreground.txt` vide sur les deux profils : aucune preuve publiée de l'activité au premier plan |
| **Cause** | Le champ a été renommé selon les versions d'Android (`mResumedActivity`, `topResumedActivity`, …) ; la recherche était trop stricte |
| **Correctif** | Recherche insensible à la casse, repli sur `dumpsys window`, et message explicite si rien n'est disponible — jamais un fichier silencieusement vide |
| **Statut** | **Correctif appliqué — en vérification** |

## MEL-BUG-010 — Retour système inerte sur un onglet racine

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** |
| **Écran / fonction** | Recherche et Bibliothèque — touche système Retour |
| **Appareil** | Téléphone **et** tablette, Android 16 |
| **Reproduction** | Ouvrir Recherche, appuyer sur la touche système Retour |
| **Attendu** | Revenir à l'accueil |
| **Observé** | **L'écran reste sur Recherche.** Capture `back-from-search-*.png` du run `42006533505` : titre « Rechercher », onglet Recherche actif, identique à l'écran précédent. Reproduit sur les deux profils. |
| **Cause confirmée** | La garde MEL-BUG-002 ne se déclenchait que si `nativeBackButton` était affichée. Sur un onglet racine il n'y a pas de flèche : la garde déclinait, le Retour partait dans la chaîne WebView qui ne connaît pas l'écran natif, et rien de visible ne se produisait. |
| **Correctif appliqué** | Extension de `handleNativeSystemBack()` : quand aucune flèche n'est affichée, agir **seulement** si `nativeRoot` est réellement à l'écran et que `nativeCurrentScreen` n'est pas déjà `home`, puis réutiliser `onNativeBackClick`. Sur l'accueil la garde décline toujours : le comportement de sortie d'origine est conservé. |
| **Préservation du lecteur plein écran** | `nativeRoot` est mis à `GONE` (`0x8`) par `applyLoginWebUi` et `showNativeUiFrom` dès que du contenu web s'affiche. Un lecteur plein écran ouvert rend donc `isShown()` faux : la garde décline et le JavaScript d'origine, **inchangé en empreinte**, ferme le lecteur. |
| **Tests** | 3 tests dédiés : discriminant de visibilité, déclin sur l'accueil, réutilisation du retour interne et non-écrasement d'un registre `View`. `back_dispatch.test.js` = **18**. |
| **Statut** | **Correctif appliqué — en vérification** |

## MEL-BUG-011 — Mes assertions de retour depuis les onglets étaient trop faibles

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** — faux vert, défaut de méthode de ma part |
| **Symptôme** | `back-from-library` et `back-from-search` étaient notés **`reached`** alors que l'app n'était pas revenue à l'accueil |
| **Cause confirmée** | Ces deux étapes n'avaient **aucune assertion de titre** (`title_expected: None`). Elles ne vérifiaient que la présence du shell et l'absence de chrome interdit — vrais sur n'importe quel onglet. |
| **Comment il a été pris** | En refusant de traiter `background-resume = wrong_screen` comme un défaut de cycle de vie sans regarder la capture : elle montrait Recherche, et la capture de l'étape précédente aussi. Le « reached » était donc creux. |
| **Correctif** | Assertion `title_is: "Accueil"` ajoutée aux deux étapes. Elles échouent désormais tant que le retour ne fonctionne pas. |
| **Conséquence** | `background-resume` **n'était pas** un défaut de cycle de vie : l'app restaurait fidèlement l'écran réel. Le parcours revient désormais explicitement à l'accueil avant la mise en arrière-plan, pour tester l'invariant « la reprise conserve l'écran courant » sans dépendre d'une navigation non assertée. |
| **Statut** | **Résolu avec preuve** (assertion renforcée, aucune assertion affaiblie) |

## MEL-BUG-009 — Sonde de premier plan : résolu

`foreground.txt` publie désormais `topResumedActivity=ActivityRecord{… com.melodix.music/.MainActivity …}` sur les deux profils (run `42006533505`). **Résolu avec preuve.**

## MEL-BUG-010 — RÉSOLU AVEC PREUVE

Run **`42008408954`**, **5 jobs sur 5 en succès**, **15 étapes, 0 anomalie**, téléphone **et** tablette. Les assertions de titre **renforcées** passent réellement : `back-from-library`, `back-from-search` et `background-resume` = `reached` avec `title_expected = "Accueil"`, `title_matched = true`. Le retour système fonctionne désormais depuis un écran poussé **et** depuis un onglet racine, sans double navigation, et l'app survit à la mise en arrière-plan.

## MEL-BUG-001 — Observation restante enfin mesurée, défaut confirmé

| Champ | Valeur |
|---|---|
| **Gravité** | **P3** — cosmétique, aucun impact fonctionnel |
| **Écran** | Paramètres, variante tablette |
| **Attendu** | Hauteur de ligne ≥ **76 dp** (`mel_settings_row_height`, `values-sw600dp`) |
| **Observé, bornes autoritaires** | `container_items.nativeContent` : **1 enfant, hauteur 66,0 dp, largeur 800,0 dp** sur tablette ; **65,1 dp** sur téléphone. Run `42008408954`, `layout-settings-*.json`. |
| **Ce qui est confirmé** | Le résolveur renvoie bien **76 dp** sur tablette (`px=152 swdp=800`, sonde `MelMetrics`) et le téléphone est conforme (**65,1 ≈ 64 dp**). **La tablette ne respecte pas son minimum**, alors que le téléphone oui. Ce n'est plus une estimation sur pixels : ce sont les bornes du dump. |
| **Cause — hypothèse, non confirmée** | `setMinimumHeight` n'est honoré que si la mesure du parent est `AT_MOST`/`UNSPECIFIED`. La ligne est ajoutée par `addView(View)` **sans LayoutParams** (`MainActivity:9712`) ; si le parent impose une spec `EXACTLY`, le minimum est ignoré. À confirmer en relevant la spec de mesure, pas en devinant. |
| **Correctif proposé, non appliqué** | Passer des `LayoutParams` explicites à l'ajout, ou appliquer la hauteur au lieu du seul minimum. Non appliqué : la cause n'est pas confirmée et je ne modifie pas la construction des lignes sur une hypothèse. |
| **Statut** | **En diagnostic — défaut confirmé par les bornes, cause à établir** |

## MEL-BUG-011 — Résolu avec preuve

Les deux étapes renforcées échouaient avant le correctif MEL-BUG-010 et passent après, sur les deux profils. La chaîne de preuve est complète : faux vert identifié → assertion renforcée → défaut réel révélé → correctif → assertion verte.

## MEL-BUG-012 — Régression P0 de diagnostic, de mon fait : la sonde d'identité écrasait un registre objet

| Champ | Valeur |
|---|---|
| **Gravité** | **P0** — l'application ne démarrait plus |
| **Run** | `42016295325` — walks en échec sur les deux profils |
| **Symptôme** | Shell natif jamais apparu, `visible_ids=5` puis `0`, 7 étapes en échec, `row-identity.txt` vide |
| **Cause confirmée** | Mon générateur de smali émettait `const-string v1` pour les libellés alors que `v1` tenait les `Resources` renvoyés par `getResources()`. L'appel suivant `Resources->getIdentifier` échouait à la vérification. **Exactement le mode de MEL-BUG-007, reproduit par moi.** |
| **Correctif** | Allocation explicite : `v0` StringBuilder, `v1` Resources, `v2` scalaire, `v3` constante `"dimen"`, `v4` chaînes. `v1` n'est réutilisé qu'après le dernier appel sur les Resources. |
| **Garde ajoutée** | Un test parcourt **toutes** les méthodes des deux classes de sonde et, pour chaque registre recevant un objet typé, interdit toute réécriture avant son dernier appel **sur ce type**. Restreindre au type tenu évite le faux positif d'un registre réutilisé ensuite comme tag de log. |
| **Garde validée par mutation** | Le bogue a été réintroduit volontairement : le test le **détecte** ; après restauration, tout repasse. La garde n'est pas décorative. |
| **Statut** | **Résolu avec preuve** (correctif + garde mutée) |
| **Leçon** | Un générateur de smali doit avoir une allocation de registres déclarée, pas des helpers qui choisissent un registre au hasard. |

## MEL-BUG-001 — RÉSOLU AVEC PREUVE : cause racine démontrée

**Cause confirmée, une seule instruction.** Dans `NativeUiRowFactory.metric`, après `getDimensionPixelSize` :

```smali
if-gtz v0, :native_metric_fallback   # saute au REPLI quand px > 0 : chemin de SUCCÈS
return v0
```

`if-gtz` signifie « si **supérieur** à zéro ». Le chemin de succès partait donc au repli : **chaque dimension résolue était jetée** et remplacée par la valeur dp codée en dur. Le résolveur n'a jamais transmis sa valeur à aucun appelant.

**Preuves concordantes, même instant, même contexte** (run `42019138039`) :

| Sonde | Résultat | Interprétation |
|---|---|---|
| `logIdentity` | `id=2131165369`, `pkg=com.melodix.music`, témoin framework `17105764` | la recherche de nom fonctionne |
| `MelMetrics` | `px=152` tablette, `px=168` téléphone | la dimension est bien lue |
| Sonde de géométrie | `token_px=-1` (repli demandé à -1), `min_h=128`/`168` | **l'appelant reçoit `dp(64)`, pas 152** |

**Correctif minimal** : `if-gtz` → `if-lez`. Aucun jeton modifié, aucune valeur en dur ajoutée, aucune exception par composant.

**Vérification sur appareil** (run `42020667077`) :

| Mesure | Téléphone avant → après | Tablette avant → après |
|---|---|---|
| Jeton reçu par l'appelant | -1 → **168 px** | -1 → **152 px** |
| Minimum appliqué | 168 → **168 px** | 128 → **152 px** |
| Hauteur finale de ligne | 171 → **174 px** (66,3 dp) | 132 → **160 px** (**80 dp**) |
| Largeur carte statut Accueil | 379,4 → **379,4 dp** (inchangé) | 560 → **720 dp** |
| Position carte Accueil | x=16 → **x=16 dp** | x=120 → **x=40 dp** |
| Anomalies de navigation | 0 → **0** | 0 → **0** |

**Le téléphone est préservé** : ses jetons valaient ses replis, donc rien ne change sauf `pad_v` qui applique enfin sa valeur (65,1 → 66,3 dp, toujours au-dessus du minimum 64 dp).

**Garde validée par mutation** : réécrire `if-lez` en `if-gtz` fait échouer le test. Le test épingle aussi `dp()`, dont le `if-gtz` est **correct** car sa cible est le label de sortie et non le repli.

**Statut** : **Résolu avec preuve**, sur les deux profils.

## MEL-BUG-013 — Chrome hérité `btnSettings` présent dans la hiérarchie sous le shell natif

| Champ | Valeur |
|---|---|
| **Gravité** | **P3** — non visible, mais signal réel |
| **Appareil** | Téléphone uniquement, run `42020667077` |
| **Étapes** | `background-resume`, `mini-player`, `player` (les trois dernières) |
| **Observé, bornes** | `btnSettings`, `ImageButton`, **40×40 dp**, à x=185,9 dp y=29 dp, chevauchant `nativeRoot` de 11025 px² |
| **Visible à l'écran ?** | **Non.** La capture montre l'en-tête natif normal ; le bouton est couvert par `nativeRoot`, opaque et surélevé de 15 dp. |
| **Absent des runs précédents** | 0 défaut téléphone aux runs `42008408954` et `42019138039` ; `btnSettings` n'était pas dans le dump |
| **Cause** | **Non établie.** Deux hypothèses à départager : l'application des vrais jetons a modifié un calcul de visibilité du chrome hérité, ou il s'agit d'un état transitoire en fin de parcours. |
| **Décision** | **Je n'affaiblis pas l'audit** pour rendre la CI verte. Le défaut reste signalé, le parcours téléphone reste en échec, et c'est la prochaine tâche. |
| **Reproduit** | Run `42030168198`, étape `background-resume`, téléphone. Absent aux runs `42022211867` et `42027909065`. **Intermittent**, lié à la reprise d'arrière-plan. |
| **Cause établie** | `btnSettings` n'a **aucun attribut `visibility`** dans `activity_main.xml` : il est donc visible par défaut. Seul `showNativeUiFrom` le met à `GONE`, et seulement quand le shell natif est prêt. À la reprise, `onCreate` repose la vue et une fenêtre existe entre cet instant et la prise de possession par le shell. Les trois seuls sites qui référencent l'id sont deux dans `onCreate` (écouteur, style) et un dans `showNativeUiFrom` (`GONE`) : **aucun code ne le montre explicitement**. |
| **Défaut d'accessibilité démontré** | `mel_legacy_settings_size` valait **40 dp** et n'avait **aucun override tablette** : sous le minimum tactile de 48 dp sur les deux profils. |
| **Correctif appliqué** | Jeton porté à **48 dp** (téléphone) et **52 dp** (tablette), aligné sur `mel_header_action`, le bouton natif qu'il remplace. Couche visuelle uniquement. |
| **Correctif NON appliqué, et pourquoi** | Mettre `visibility="gone"` en XML supprimerait la fenêtre transitoire, mais **retirerait l'accès aux réglages dans le repli web**, puisque aucun code ne le réaffiche. Périmètre non maîtrisé : je ne l'applique pas. Correctif proposé : l'afficher explicitement dans le chemin de repli, puis le masquer en XML. |
| **Correctif appliqué (cycle 10)** | `android:visibility="gone"` posé sur `btnSettings` dans **les deux layouts** : la fenêtre transitoire onCreate/reprise est fermée à la source. Le chemin de possession Web (`applyLoginWebUi`) ré-affiche explicitement le bouton (`setVisibility(0x0)`), donc l'accès aux réglages dans le repli web est **préservé** — la possession d'affichage native/WebView n'est **pas** modifiée. Garde de test ajoutée (XML gone ×2 + ré-affichage web + masquage natif). |
| **Statut** | **RÉSOLU, confirmé par CI** — run **`42096058683` 5/5 vert** : `btnSettings` **absent des 38 dumps** (il n'apparaît plus dans la hiérarchie visible) et la capture `background-resume` téléphone montre un en-tête natif propre, sans chevauchement. La fenêtre transitoire est fermée par construction (gone en XML), donc le caractère intermittent ne peut plus se reproduire. Audit non affaibli. |

## MEL-BUG-014 — Les lignes de paramètres sont en plein bord, sans gouttière

| Champ | Valeur |
|---|---|
| **Gravité** | **P2** — défaut visuel démontré |
| **Observé, bornes** | `final_w=1600 px = 800 dp` sur tablette (plein écran), `marges=0/0`, parent `LinearLayout` avec `pad_lr=0/0`. Téléphone : `final_w=1080 px = 411,4 dp`, plein bord aussi. |
| **Comparaison** | Le contenu **Accueil** respecte la gouttière (`x=16 dp`, `w=379,4 dp` téléphone ; `x=40 dp`, `w=720 dp` tablette) |
| **Cause confirmée** | `nativeContent` n'a que `paddingTop`/`paddingBottom`, aucun padding horizontal, et les lignes sont ajoutées par `addView(View)` **sans LayoutParams** : elles héritent de `MATCH_PARENT × WRAP_CONTENT` sans marges. Le rendu Accueil, lui, pose des LayoutParams explicites. |
| **Correctif prévu** | Ajouter le padding horizontal de gouttière à `nativeContent` dans les deux dispositions, ce qui couvre toutes les lignes sans exception par composant. Non encore appliqué : à vérifier séparément pour garder chaque changement attribuable. |
| **Correctif appliqué** | `NativeRowInsets.apply` pose des marges horizontales = jeton `mel_gutter` au point d'ajout partagé, en conservant `MATCH_PARENT × WRAP_CONTENT`. Le conteneur n'est **pas** paddé : il est partagé avec Accueil, qui inset déjà ses enfants. |
| **Preuve de résolution** | Run `42022211867` : largeur de ligne téléphone **1080 → 996 px** (411,4 → 379,4 dp, gouttière 16 dp), tablette **1600 → 1472 px** (800 → 736 dp, gouttière 32 dp). Hauteurs préservées. **0 défaut** de mise en page sur les deux profils. |
| **Statut** | **Résolu avec preuve** |

## MEL-BUG-015 — P1 — VerifyError tuant l'application à l'ouverture de la Bibliothèque

- **Repro** : run `42054485935`, profil téléphone et tablette, étape `library`.
- **Attendu** : la Bibliothèque s'ouvre avec un état vide propre.
- **Observé** : `library` = `not_reached`, puis 11 étapes en cascade ; `foreground.txt` contient
  `com.google.android.apps.nexuslauncher` : l'application était morte. Accueil et Recherche
  fonctionnaient. Les deux fichiers de diagnostic étaient vides, l'application étant morte avant.
- **Cause établie** : dans `NativeEmptyState.create`, le helper de résolution de jeton écrivait
  `const-string v2` alors que `v2` tenait les `LayoutParams` fraîchement alloués ; le `iput … v2 …
  topMargin` suivant les traitait comme un objet. Erreur de vérification.
  **Un `try/catch` interne n'attrape pas une erreur de vérification de classe** : elle survient au
  chargement de la classe, chez l'appelant.
- **Correctif** : résoudre la marge avant d'allouer les `LayoutParams` (`b12e5c3`).
- **Garde** : `scripts/smali_register_check.py` suit désormais le **type courant** de chaque registre et
  refuse un usage en position d'objet après réaffectation, y compris via `iput`/`iget`. Le modèle
  inverse (« objet puis écrasement ») manquait ce cas : l'appel au constructeur comptait comme
  utilisation avant l'écrasement. Test rejouant les trois VerifyErrors réels du chantier.
- **Cause RÉELLE, établie par logcat** (run `42060738823`) : `VerifyError … [0xE1] returning undefined
  register`. Le bloc `try` commençait **avant** l'allocation de `v0` et le handler retournait `v0`.
  ART vérifie un handler avec les registres vivants à l'**entrée** du `try`. L'ordre marge/LayoutParams
  et `setBounds(II)V` étaient **deux autres bogues réels**, corrigés aussi, mais **aucun n'était la cause
  de ce plantage**. Correctif décisif : allouer le conteneur avant la région `try` (`ff129cf`).
- **Statut** : **RÉSOLU AVEC PREUVE.** Run `42065755408` **5/5**, `crash.txt` **0 octet** sur les deux
  profils, état vide rendu et mesuré (3 descendants, 2 TextViews).
- **Régression introduite par moi** au commit `12228c8`, détectée par les parcours. C'est exactement ce
  que les parcours sont censés attraper, et ils l'ont fait.

## MEL-BUG-016 — P2 — les tuiles de raccourcis de l'Accueil ne s'affichent pas

- **Repro** : run `42052285204`, les deux profils, écran Accueil sans session.
- **Attendu** : sous l'en-tête « Explorer Melodix », trois tuiles Bibliothèque / Recherche / Réglages.
- **Observé** : `container_items_deep` sur `nativeContent` ne contient que la carte de statut et le
  `TextView` d'en-tête. **La rangée de tuiles est absente.** Le parcours reste vert car il ne vérifie
  que le titre de l'écran.
- **Cause** : **non établie.** Une exception est levée dans `NativeShortcutGrid.render` et avalée par le
  repli, qui rendait l'en-tête sans les tuiles. Le repli muet ne produisait aucune trace.
- **Action** : le repli journalise désormais la cause sous le tag `MelShortcut`, collecté et publié par
  la CI (`shortcut-diag.txt`). Les runs `42054485935` l'ont rendu vide car l'application mourait avant ;
  le run `42057787244` doit fournir la cause.
- **Cause établie** : `Drawable.setBounds(II)V` — la vraie signature prend **quatre** entiers. apktool
  assemble une référence de méthode sans la résoudre ; ART ne la résout pas et **rejette la classe**.
  Deux occurrences dans `createTile`. Corrigé par `54c7f8d`.
- **Statut** : **RÉSOLU AVEC PREUVE.** Run `42065755408` : **3 tuiles** sur les deux profils
  (118,9×66,3 dp tél, 233×55 dp tab), `shortcut-diag.txt` vide, 0 défaut.
- **Enseignement** : un parcours vert ne prouve pas qu'un composant s'affiche. Les assertions de titre
  ne couvrent pas le contenu ; c'est la mesure `container_items_deep` qui a révélé l'absence.


## MEL-BUG-017 — P2 — deux tuiles de raccourci identiques, dispatch à polarité inversée

- **Repro** : run `42063164990`, écran Accueil, les deux profils. **Trouvé en regardant la capture.**
- **Attendu** : trois tuiles distinctes Bibliothèque / Rechercher / Paramètres.
- **Observé** : « Bibliothèque, Rechercher, Rechercher ». La troisième tuile était un doublon.
- **Cause établie** : la chaîne de dispatch de `addTile` utilisait `if-eq` pour sauter au cas
  **suivant**. `if-eq` saute sur **égalité** : l'action 0 tombait sur le libellé de l'action 1, et les
  actions 1 et 2 tombaient toutes deux sur le dernier libellé. `if-ne` est la bonne polarité.
  Le listener, lui, était correct : il utilise `if-eq` pour sauter au cas **correspondant**. Les deux
  formes se ressemblent, ce qui rend l'erreur facile à commettre.
- **Correctif** : `ac696e4`. Ordre de rendu choisi : Bibliothèque, Rechercher, Paramètres.
- **Garde** : test qui **interprète** le dispatch pour les trois actions et exige trois libellés
  **distincts**. Une recherche de chaînes serait passée au travers.
- **Statut** : **RÉSOLU AVEC PREUVE**, run `42065755408`, capture téléphone : trois tuiles correctes.

## MEL-BUG-018 — P2 — état vide de la Bibliothèque avec une loupe et sans sous-titre

- **Repro** : run `42063164990`, écran Bibliothèque, les deux profils. **Trouvé en regardant la capture.**
- **Attendu** : icône bibliothèque et sous-titre « Vos playlists, albums et artistes apparaîtront ici. »
- **Observé** : icône **loupe**, sous-titre **absent** (1 seul TextView dans le dump).
- **Cause établie** : `forMessage` testait `String.equals` avec `if-eqz`, ce qui envoyait tout message
  **autre** que la recherche dans la branche recherche (`subtitle = ""`, icône `native_nav_search`).
- **Correctif** : `if-nez` (`ac696e4`).
- **Garde** : test qui interprète `forMessage` pour les deux messages et vérifie icône **et** sous-titre.
- **Statut** : **RÉSOLU AVEC PREUVE**, run `42065755408` : 2 TextViews, texte 379,4 dp à x=16 (tél)
  et 736 dp à x=32 (tab), icône bibliothèque, sous-titre présent.

**Famille commune 017/018/001** : polarité d'un saut conditionnel. Aucun parcours d'écrans ne les
détecte, parce qu'une étape n'affirme que le titre. Seules la **lecture des captures** et
l'**interprétation du dispatch** les révèlent.

## MEL-BUG-019 — P2 — le tap d'une tuile de genre n'avait aucun effet

- **Repro** : runs `42077053251`, `42078730287`, `42081094275`, `42087348653`, les deux profils.
- **Attendu** : taper une tuile lance la recherche réelle et marque la tuile comme sélectionnée.
- **Observé** : `tap_point=284 625`, cible `FrameLayout desc='Pop' enabled=true
  bounds=[42,499][527,751]` : le tap frappe la bonne tuile, active, en son centre. Pourtant
  `selected=0`, titre inchangé, **aucun crash**.
- **Cause racine** : **trouvée et corrigée** (`7f99e34`). Deux couches :
  1. Le câblage par `android:onClick` restait muet ; un écouteur posé programmatiquement
     (`NativeGenreClickListener` via `NativeGenreTileStyler.install`, run `42087348653`)
     a prouvé que le handler **était** atteint : la trace `tile click received` apparaît.
  2. Mais le handler sortait aussitôt : `String->isEmpty()Z` suivi de **`if-eqz`** sautait
     quand le tag était **non vide** — l'inverse de l'intention. Toutes les tuiles portent
     `android:tag` dans les deux layouts, donc chaque tap sortait avant le styleur, la
     recherche et le titre. Corrigé en **`if-nez`**, avec un test de garde de polarité.
- **Pourquoi les diagnostics étaient vides** : le handler ne plantait pas, il sortait tôt ;
  `MelGenre` vide signifiait « sorti avant le premier log », pas « jamais appelé ».
- **Antériorité** : l'ancien parcours n'a **jamais** vérifié l'effet d'un tap de genre
  (« tap delivered only ») ; ce défaut était donc **préexistant dans le shell natif**.
- **Statut** : **RÉSOLU, confirmé par CI** — run **`42091441657` 5/5 VERT** : `selected=3`
  (tuile Pop + enfants) sur les deux profils, `walk-status=0`, 0 défaut géométrique sur
  38 dumps, titre d'en-tête « Pop » et anneau de sélection vérifiés **sur les captures**
  (pas seulement sur le parcours). L'assertion n'a **pas** été assouplie.

MEL-BUG-020 — P3 — mon assertion de sélection était un faux vert (corrigé)

- **Observé** : run `42075202324` **5/5** alors que `genre-selection.txt` disait `selected=0` sur les
  deux profils. Le garde cherchait la présence de la ligne `selected=`, pas un compte positif.
- **Correctif** : `^selected=[1-9]`, avec un test qui exige cette forme précise.
- **Statut** : **RÉSOLU.** Consigné parce que c'est exactement le faux vert que ce chantier traque.

## MEL-BUG-021 — P2 — le déclencheur QA ignorait MainActivity.smali (corrigé)

- **Observé** : le commit `8b5657e`, qui modifiait l'écran principal, n'a déclenché **aucun** parcours.
  Le filtre `paths` listait `smali/com/melodix/music/Native**` mais pas `MainActivity.smali`.
- **Correctif** : chemin ajouté, vérifié en relisant le YAML parsé, sous test.
- **Statut** : **RÉSOLU.** Un changement réel de l'interface pouvait partir sans contrôle appareil.

## MEL-BUG-022 — Incident P0 : reconnexion Spotify sans récupération des données (carte « Réessayer » affichée à tort)

- **Signalement** : après installation de `v1.2.2-test.44-preview` (commit `419690d`, versionName 1.2.2 / versionCode 27)
  et connexion à Spotify, l'accueil affiche « Votre accueil n'a pas pu être chargé » + « Réessayer », aucune donnée,
  et les Paramètres ne montrent pas l'état attendu.
- **Cause racine identifiée (côté natif)** : `NativeHomeShelfRenderer` `:shelf_no_cards` — quand le payload accueil
  ne contient aucune carte réelle, la carte de repli affichait **systématiquement** `melodix:action:retry-library`,
  même quand la session n'était pas confirmée. Un « Réessayer » sans authentification ne peut jamais récupérer de
  données: le symptôme était donc structurel, pas un simple message.
- **Chaîne OAuth auditée** (traçage statique, sans session live) : connexion (`openSpotifyLogin` → accounts.spotify.com,
  WebView) → retour open.spotify.com → `observeSpotifyAuthState` (signaux `collectAuthSignals`, machine d'état) →
  `requestMediaLibraryProof` **bloquée tant que `authState !== 'connected'`** → `checkMediaLib`/libraryV3 →
  preuve `libraryProvesSession()` → envoi des lignes home. Le point de passage obligé est la preuve libraryV3;
  sans elle, aucune donnée n'est envoyée (conforme à la règle de confidentialité).
- **Correctifs** (`ada507d`) :
  1. `:shelf_no_cards` consulte `isNativeSessionUnproven()` : session non confirmée → carte « Connexion Spotify
     requise » avec **Se connecter** (primaire, réel) + **Réessayer** (secondaire); cas prouvé inchangé.
  2. Carte de chargement de l'accueil actionnable (« Se connecter ») depuis le cycle 13.
  3. Paramètres : états réels distincts + repli natif fonctionnel sans WebView (cycles 13).
- **Tests** : matrice de 10 scénarios (première connexion, réussite, 401, 403, réseau, timeout, jeton absent,
  déconnexion, reconnexion…) sur les lignes d'état Paramètres + test natif de la nouvelle branche.
  Suite **775 / 772 pass / 0 fail / 3 skip**. Run CI **`42172550412` 6/6 vert**, release **`v1.2.2-test.45-preview`**.
- **Limite honnête** : la validation OAuth de bout en bout avec une **vraie session** reste impossible en CI
  (pas de session disponible). Le parcours est audité, les états et actions sont corrigés et testés, mais le
  fonctionnement live post-connexion n'est **pas prouvé** ici. Aucun token n'a été journalisé.
- **Statut** : correctifs livrés et publiés; validation live en attente d'une session de test réelle.

## MEL-BUG-023 — P0 : conflit de signature APK à la mise à jour (« Package en conflit »)

- **Constat** : installer `v1.2.2-test.45-preview` par-dessus `v1.2.2-test.44-preview` échoue.
- **Diagnostic** :
  - applicationId constant `com.melodix.music` (asserté dans le job build) ; versionCode 27 constant
    (accepté en mise à jour si la signature matche).
  - **Cause racine** : le job `build-qa-apk` exécutait `keytool -genkeypair -validity 2` à **chaque run**
    → certificat différent à chaque release → `INSTALL_FAILED_UPDATE_INCOMPATIBLE`. Les sha256 des APK
    publiés (44: `75c0ab2d…`, 45: `a7a4a6f6…`) diffèrent, conforme à des clés différentes.
  - Téléchargement des APK depuis le bac à sable impossible (CDN hors allowlist) : la comparaison des
    certificats est remplacée par une **preuve par construction en CI** (double signature, empreintes
    de certificat identiques exigées).
- **Correctif** (`0d4d143`) : clé de test **persistante** via le secret CI `MELODIX_TEST_KEYSTORE_B64`
  (PKCS12, alias `melodix-test`). Aucun `genkeypair` dans le workflow ; secret absent = build en échec
  explicite (jamais de repli jetable). Preuve de stabilité (2 signatures → même SHA-256 de certificat) +
  test de mise à jour `adb install -r` par-dessus dans le walk. Empreinte du certificat publiée dans les
  notes de release. Clé déposée hors dépôt pour le propriétaire (`melodix-test-release.p12`, à pousser
  UNE FOIS dans le secret avec `gh secret set`) ; aucun matériel de clé tracké (test de garde).
- **Empreinte du certificat de test (publique)** :
  `05:47:8B:C0:52:4C:EC:88:02:D9:13:04:CC:58:84:80:87:B4:9B:05:25:DE:B7:35:42:D1:24:44:EA:9B:06:17`
- **Validation** : le test de mise à jour 44→45 en conditions réelles nécessite le secret posé puis un
  run CI vert (build avec preuve de stabilité + walk avec update-over-install). **En attente du secret.**
- **Migration** : tant que le secret n'est pas posé, aucune nouvelle release n'est publiée (build rouge
  volontaire) ; les testeurs doivent désinstaller l'ancienne build de test avant d'installer la
  nouvelle — c'est la migration la moins risquée, sans toucher à la production.
- **Statut** : correctif livré ; **validation bloquée sur la pose du secret** `MELODIX_TEST_KEYSTORE_B64`.


## Mise à jour P0 — commit `1efd0b2` (état au 2026-11-06)

- **Accueil (P1)** : la carte de statut affiche désormais un vrai `ProgressBar` **indéterminé** quand
  `state == "loading"` (branche `home_status_no_spinner` sinon), dimensionnée via le jeton `mel_splash_spinner`.
  Test natif ajouté (lecture de `state`, comparaison `"loading"`, `setIndeterminate(true)`).
- **Release (P4/P6)** : `versionCode` de la **copie temporaire** bumpé à `1000 + GITHUB_RUN_NUMBER`, asserté
  `> 1000` via `aapt dump badging` (le dépôt n'est jamais modifié) ; les captures réelles
  `capture-home|settings-phone|tablet.png` sont téléchargées et publiées dans les assets de la release.
  Tests de workflow ajoutés (pas de `genkeypair`, bump sur copie temporaire uniquement, captures dans la
  release, fail-loud si le secret manque).
- **Tests** : `npm test` local **778 / 775 pass / 0 fail / 3 skip** (skips pré-existants).
- **CI run `42177264532` (commit `1efd0b2`)** : suite unitaire **success** ; job `build-qa-apk` **failure volontaire**
  (secret `MELODIX_TEST_KEYSTORE_B64` toujours non posé — fail-loud MEL-BUG-023) ; walk/release skipped en
  cascade. **Aucune release publiée depuis `v1.2.2-test.45-preview`** — conforme à l'interdiction de release
  intermédiaire. Workflow « Verify UI metrics » : success (3/3).
- **Bloquant restant** : pose du secret par le propriétaire (`gh secret set MELODIX_TEST_KEYSTORE_B64
  --repo Souxch06/Melodix --body-file <(base64 -w0 melodix-test-release.p12)`) puis run CI vert 6/6 ⇒
  seule la release auto-publie l'APK signé avec la clé persistante. **Test live restant non prouvé** :
  parcours OAuth Spotify complet avec une vraie session + mise à jour 44→45 installée par-dessus sur un
  appareil réel — impossibles à démontrer sans session ni appareil ici ; jamais déclarés réussis.

## Audit P0 — commit `b77ac56` (2026-11-06)

- **Signature (P4)** : fail-loud intact, aucun `genkeypair` effectif dans le workflow. Instructions sûres
  livrées : `scripts/set_test_signing_secret.sh` + `docs/audits/melodix-test-secret-setup.md`
  (base64 du `.p12` passé à `gh secret set` par tube stdin — la valeur n'est jamais affichée, journalisée
  ni commitée ; garde-fou anti-dépôt ; empreinte cert publiée).
- **Accueil — spinner vs chargement réel (distinction vérifiée)** : le spinner natif n'est affiché que
  quand le payload `kind=state` porte `state=loading`, et ce state n'est émis par `homeStateRow()` que
  tant que `__sfMediaLibStatus` est `loading/pending` avec une requête réellement in-flight
  (trace `request in-flight`). `ready`+vide → `empty`, erreur → `error` (+ action réelle
  `melodix:action:retry-library` → `__sfNativeRetryLibrary` → vrai re-fetch), retries épuisés →
  `unavailable`. Session non prouvée : aucune carte, statut `sessionUnproven=true`. Aucun donnée simulée.
- **Paramètres — infos réelles vérifiées** : ligne « État de la connexion Spotify » pilotée par l'état
  réel (`Se connecter` + `melodix:action:open-login` hors session ; `Confirmé` + `spotify:settings:logout`
  + `Se déconnecter` avec preuve libraryV3). Nom de compte affiché uniquement avec session confirmée.
  Fallback sans WebView (timeout 6 s, génération corrélée) : actions réelles `retry-settings`,
  `open-login`, `open-notifications` + section À propos ; **aucune affirmation de connexion non prouvée**.
- **Tests de non-régression** (`tests/p0_home_loading_state.test.js`, 5 tests) : loading réel, empty/error
  jamais « loading », session non prouvée sans cartes, lignes Paramètres réelles, fallback honnête.
  Suite **783 / 780 pass / 0 fail / 3 skip** (skips = absence de javac local, pré-existants).
- **Captures** : inchangé, `capture-{home,settings}-{phone,tablet}.png` publiées dans la release par le
  workflow (vérifié par test).
- **Bloquant inchangé** : pose du secret par le propriétaire → puis run CI 6/6 vert ⇒ release auto.

## CI — commit `d67cc32` (2026-11-06)

- Run `42183389867` : **suite unitaire 783/783/0/0 success** (les 3 tests à toolchain Java exécutés avec
  JDK 17). Le fail isolé du run précédent (`42182200707`, 782/783) était un **flaky** — non reproductible
  sur node 18/22/24 localement ni sur le run suivant ; le workflow publie désormais les noms des tests en
  échec en annotation `::error` (lisible via l'API check-runs) pour tout futur diagnostic.
- Job `build-qa-apk` : **failure volontaire** (fail-loud MEL-BUG-023, secret `MELODIX_TEST_KEYSTORE_B64`
  toujours non posé) ; walks/release skipped en cascade ; **aucune release publiée** (dernière :
  `v1.2.2-test.45-preview`). conforme.
- Prochaine étape inchangée : pose du secret via `scripts/set_test_signing_secret.sh` puis run 6/6 vert
  ⇒ publication auto de la pre-release de test.

## Correctifs workflow `ui-qa.yml` — commit `e5e82dd` (2026-11-06)

- **A (préparation Apktool)** : la boucle de copie des 10 éléments racine est terminée (`done`) AVANT le
  `sed` de `versionCode` sur la copie temporaire ; le `versionCode` attendu est asserté (`grep -q`) avant
  Apktool ; le dépôt n'est jamais modifié (smoke-test local : copie complète d'abord, dépôt intact,
  copie temporaire bumpée à `1000+run_number`).
- **B (apksigner)** : le chemin des build-tools est factorisé en `bt="$ANDROID_HOME/build-tools/35.0.0"` ;
  la concaténation double `"$ANDROID_HOME/.../""$ANDROID_HOME/.../apksigner"` (chemin invalide) est
  supprimée ; `zipalign`, `apksigner sign`, `apksigner verify`, `aapt` passent tous par `"$bt/..."` ;
  contrôles package `com.melodix.music` et `versionCode > 1000` conservés sur l'APK signé.
- **C (signature persistante)** : secret `MELODIX_TEST_KEYSTORE_B64` exclusivement, uniquement pipé
  (`base64 -d > clé`), jamais affiché ; format PKCS12 + alias `melodix-test` vérifiés ; cohérence exigée
  entre l'empreinte du keystore et celle du certificat de l'APK (`cert1 == fingerprint`) ; preuve de
  stabilité (2 signatures → même SHA-256) conservée ; fail-loud conservé ; les logs ne disent plus
  « throwaway-debug » mais `signing=persistent-test-key`.
- **D (captures)** : si aucun profil n'a produit de capture (build KO / émulateurs non démarrés),
  `publish-captures` termine proprement (`exit 0`, aucun commit, aucun échec artificiel) avec un
  `::notice` explicite ; sinon publication inchangée dans `docs/audits/ui-qa-<runId>/`.
- **E (release)** : `release-test` ne tourne que si `build-qa-apk` + `unit-tests` + `walk-qa` sont verts
  (`needs` + `if: success()`), reste en `--prerelease`, publie l'empreinte SHA-256 du certificat dans
  les notes et exige les 4 captures réelles (`capture-{home,settings}-{phone,tablet}.png`) — sinon
  `exit 1`, aucune release.
- **Tests** : 5 nouveaux tests de verrouillage dans `tests/ui_layout_audit.test.js` (ordre copie/bump,
  chemins `$bt`, alias+cohérence empreinte, sortie propre sans captures, gating release) ; `bash -n` OK sur
  les 11 scripts `run` ; suite **788 / 785 pass / 0 fail / 3 skip**.

## MEL-BUG-024 — P1 : l'onglet Bibliothèque affiche « Chargement de votre bibliothèque… » indéfiniment sans session

- **Constat** : capture réelle `ui-qa-42172550412/phone/library-phone.png` — onglet Bibliothèque sans session :
  « Chargement de votre bibliothèque… » + « Cela ne devrait prendre qu’un instant. », **aucune action de connexion**.
- **Cause racine** : `NativeStateView.forSurfaceMessage` sait pourtant distinguer (unproven → `native_state_session`
  + `melodix:action:open-login`), mais `isNativeSessionUnproven()` lisait le flag **à portée écran**
  `nativeHomeSessionUnprovenStatusAttached`, remis à zéro par `setNativeScreen` à chaque changement d'onglet et par
  `beginNativeHomeRender` à chaque rendu Home. Résultat : hors de l'Accueil, la session « non prouvée » était
  perdue et le chargement éternel s'affichait.
- **Correctif** : nouveau champ persistant `nativeSessionUnproven:Z` sur `MainActivity`, maintenu par
  `noteNativeHomeSessionUnprovenStatusAttached` (true), `noteNativeHomeCardAttached` (false, session prouvée par
  des cartes réelles), `openSpotifyLogin` (true, tant que la preuve n'est pas revenue) ; **non** remis à zéro par
  `setNativeScreen`/`beginNativeHomeRender` (le flag home-scoped, lui, garde sa sémantique et ses tests). L'accesseur
  `isNativeSessionUnproven()` lit désormais ce champ persistant. Aucun mécanisme de session/auth, pont ou
  possession WebView modifié.
- **Effet** : Bibliothèque (et détail) sans session affichent « Session Spotify non confirmée » + action réelle
  **Se connecter** (`melodix:action:open-login`) au lieu d'un chargement infini.
- **Tests** : test de régression dédié (champ unique, accesseur persistant, 3 writers, pas de reset par
  navigation, câblage `forSurfaceMessage`). Suite **789 / 786 pass / 0 fail / 3 skip**.
- **Statut** : correctif livré ; validation sur émulateur via le prochain run CI (walk `library`).

## Décision PR #6 / #7 (2026-11-06)

Les PR ouvertes #6 (`arena/dbf2d44f-melodix`) et #7 (`arena/7142700d-melodix`) sont des **branches ancêtres** de
`arena/6b935c3e-melodix` (notre branche en descend directement) : leur contenu est déjà intégré à l'historique
de la branche de travail. **Décision : aucune fusion** — fusionner serait un no-op ou créerait des conflits
inutiles ; `main` reste intacte et non modifiée. Aucun doublon de correctif n'a été trouvé entre ces PR et la
branche de travail.

## CI — commit `03e6c33` (MEL-BUG-024)

- Run `42192828221` : suite unitaire **789/789/0/0 success** (JDK 17, aucun skip). Build toujours en **fail-loud
  volontaire** (`MELODIX_TEST_KEYSTORE_B64` non posé) ⇒ walks émulateur et release skipped, **aucune release
  publiée** (dernière : `v1.2.2-test.45-preview`). La validation sur émulateur du correctif MEL-BUG-024 (capture
  `library` montrant l'état session + « Se connecter ») est prête mais **bloquée par le même secret**.

## Recréation de la clé de test persistante depuis Arena — 2026-11-06

- Le système de fichiers Arena ayant été réinitialisé, l'ancienne clé (`45:62:21:…`) est perdue ; elle n'avait
  jamais signé de release publiée (builds en fail-loud), donc **aucune clé de release publiée n'est remplacée**.
  Les pre-releases ≤ `test.45` utilisent des clés jetables par run : migration = désinstaller l'ancienne build.
- Nouvelle clé persistante recréée ici (openssl 3.0.20) : PKCS12 AES-256-CBC / MAC SHA-256, alias
  `melodix-test`, validité 30 ans, fichier `/home/user/melodix-test-release.p12` (hors dépôt).
- **Empreinte SHA-256 du certificat** : `05:47:8B:C0:52:4C:EC:88:02:D9:13:04:CC:58:84:80:87:B4:9B:05:25:DE:B7:35:42:D1:24:44:EA:9B:06:17`
  (dérivée deux fois depuis le p12 : identique — stabilité vérifiée localement).
- **Blocage confirmé** : le token GitHub d'Arena renvoie **HTTP 403** sur tous les endpoints `actions/secrets`
  (public-key, list, get, set) — permission « Secrets » manquante. `gh secret set` échoue à « failed to fetch
  public key: HTTP 403 ». **Le secret n'a PAS été posé et je ne prétends pas le contraire.**
- **Action requise** : reconnecter GitHub dans Arena (depuis l'interface Arena, aucun PC nécessaire) avec un
  token autorisé à gérer les secrets Actions du dépôt (PAT fine-grained : « Secrets: Read and write »), puis
  exécuter `./scripts/set_test_signing_secret.sh` depuis Arena. Le workflow ne contient **aucune empreinte en
  dur** (test de garde ajouté) : il dérive l'empreinte du keystore à chaque build et la croise avec celle de l'APK.
- Suite : **790 / 787 pass / 0 fail / 3 skip**.
