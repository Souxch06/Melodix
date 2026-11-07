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

## Preview publiée depuis Arena — v1.2.2-test.46-preview (2026-11-06)

- **Architecture autonome** (le token Arena a `contents:write` + releases API, mais 403 sur `actions/secrets`
  et EOF sur `uploads.github.com`) : build + signature effectués localement dans Arena, APK commit dans
  `releases/`, pre-release créée via l'API GitHub (tag `v1.2.2-test.46-preview`, prerelease).
- **Chaîne** : apktool 2.4.1 (npm `apktool-jar`) + JRE Temurin 25 (pypi `jdk4py`) ; copie temporaire, versionCode
  1046, empreinte cert écrite dans la copie temporaire ; zipalign maison (stored 4-aligned, resources.arsc
  stocké) ; signature v1+v2+v3 via `apk_sign_ts` avec le keystore PKCS12 persistant (alias `melodix-test`).
- **Vérifications** : empreinte certificat de l'APK == empreinte keystore (`C2:A9:1D:F7:…:EB:67`) ; stabilité
  (2 signatures → même certificat) ; blocs v1+v2 présents ; package `com.melodix.music` ; versionCode 1046 ;
  `resources.arsc` aligné ; APK redécodable (apktool d) ; suite 790/787/0/3 ; aucun matériel de clé tracké.
- **Limites honnêtes** : build local avec apktool 2.4.1 (CI utilise 2.9.3) ; validation émulateur (walks)
  non exécutée pour cette build (pas d'émulateur local) ; parcours Spotify live toujours non prouvé.

### Release publiée : https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.46-preview
APK : https://github.com/Souxch06/Melodix/blob/arena/6b935c3e-melodix/releases/Melodix-Test-v1.2.2-test46.apk
sha256 `f64da5b6ec115318813a25cc3f5e120a1ad2dc00be0abf3207a57a8d4da826b7` · cert `C2:A9:1D:F7:…:EB:67` ·
commit `85dc840` · chaîne reproductible : `scripts/build_preview_apk.sh` + `zipalign4.py` + `apk_sign.js`.

## MEL-BUG-025 — P1 : l'écran Recherche sans session affichait une liste « Résultats de recherche » vide, sans explication ni action
- **Constat** : sans session prouvée, le shell ne envoie jamais de lignes `search:` (garde `libraryProvesSession`), et le natif rendait `"[]"` (deep link `initial-search`) ou gardait la liste vide — même classe que MEL-BUG-024, côté Recherche.
- **Correctif** (natif, même pattern que MEL-BUG-024) : dans `applyNativeUiData`, la branche `:search_render` et le handler `initial-search` consultent désormais le flag persistant `isNativeSessionUnproven()` ; si vrai, ils rendent la carte d'état réelle via `NativeHomeShelfRenderer` (« Connexion Spotify non confirmée — touchez pour vous connecter », uri `melodix:action:open-login`) et ne rendent PAS la liste vide. Session prouvée : comportement inchangé (lignes + `window.searchMediaItems`).
- **Tests** : `tests/mel_bug_025_search_unproven.test.js` (3 tests : branche search_render, deep link initial-search, non-régression branche prouvée). Suite : 793/790/0/3.
- **Statut** : correctif livré + tests verts ; validation émulateur via prochain run CI (walk search), comme MEL-BUG-024.

## Preview publiée depuis Arena — v1.2.2-test.47-preview (2026-11-06, commit 5722d0f + APK)
- **Contenu** : MEL-BUG-025 (Recherche sans session → carte d'état réelle « Connexion Spotify non confirmée » + Se connecter).
- APK `releases/Melodix-Test-v1.2.2-test47.apk` · sha256 `430360c21080ea868b27846696663bf7500c5305a73cf075f67b390c03ae36d2` · versionCode **1047** · package `com.melodix.music`.
- **Signature** : v1+v2+v3, clé persistante régénérée après reset sandbox (empreinte `F9:A6:3F:7A:22:72:45:99:82:00:20:76:21:6E:48:96:81:75:F2:11:84:D9:1E:2A:D3:99:88:11:52:6C:24:18`) ; stabilité prouvée (2 signatures → même certificat) ; empreinte APK == empreinte keystore ; `resources.arsc` stocké+aligné 4 o ; APK redécodable.
- **Migration** : DÉSINSTALLER test.46 (empreinte `C2:A9:…:EB:67`) avant d'installer test.47 (nouvelle empreinte `F9:A6:…:24:18`) — le bac à sable efface le keystore entre sessions, chaque preview Arena a donc sa propre empreinte documentée.
- Suite : 793/790/0/3. Aucun matériel de clé tracké.

## MEL-BUG-026 — P1 : états vides « Chargement de la playlist… / bibliothèque… » éternels sans session (écrans Détail/Bibliothèque)
- **Constat** : la branche empty générique de `renderNativeRows` affichait un texte de chargement même quand aucune ligne ne pouvait jamais arriver (session non prouvée) — même classe que MEL-BUG-024/025.
- **Correctif** : `:native_rows_library_empty` et `:native_rows_detail_empty` branchent désormais sur `isNativeSessionUnproven()` ; si vrai → carte d'état réelle via `NativeHomeShelfRenderer` (« Connexion Spotify non confirmée », uri `melodix:action:open-login`) et return ; sinon texte de chargement conservé (session prouvée, lignes encore possibles). `:native_rows_search_empty` inchangé.
- **Tests** : `tests/mel_bug_026_empty_states_unproven.test.js` (3 tests). Suite : 796/793/0/3.
- **Statut** : correctif livré + tests verts ; validation émulateur via prochain run CI.

### MEL-BUG-026 (complément) — submit natif de la recherche sans session
`onNativeSearchSubmit` rendait « Résultats de recherche » + `[]` même sans session prouvée → même correctif : branche `isNativeSessionUnproven()` → carte d'état réelle, la branche prouvée garde `[]` + kick WebView. Test ajouté (4/4 dans le fichier MEL-BUG-026). Suite : 797/794/0/3.

## Preview publiée depuis Arena — v1.2.2-test.48-preview (2026-11-06, commit 4399bc8 + APK)
- **Contenu** : MEL-BUG-026 (états vides library/detail + submit recherche sans session → carte d'état réelle « Connexion Spotify non confirmée » + Se connecter, 4 points d'entrée natifs).
- APK `releases/Melodix-Test-v1.2.2-test48.apk` · sha256 `299227909fa7b9a1922f27a93552064f19e458a2516f2dd56a6fb79465389eb9` · versionCode **1048** · empreinte cert `F9:A6:3F:…:24:18` (identique à test.47 — même keystore, pas de reset entre-temps ; **test.47 et test.48 sont installables en mise à jour l'une sur l'autre**).
- Signature v1+v2+v3 vérifiée (cert APK == keystore), `resources.arsc` stocké+aligné, APK redécodable. Suite 797/794/0/3.

## MEL-BUG-027 — P1 : suite flaky en CI (race entre fichiers de test)
- **Constat** : run CI `42229664851` (commit 4399bc8) en échec sur « dimension tokens carry the right unit » alors que le même commit passe en local et en clone frais. Cause : `tests/browse_tiles.test.js` injectait un token sonde en **modifiant res/values/mel_dimens.xml en place** ; `node --test` exécute les fichiers en parallèle, donc `mel_design_system.test.js` pouvait lire le fichier mid-probe (unité bogus) → échec aléatoire.
- **Correctif** : `ui_metrics_measure.py` accepte `MELODIX_DIMENS_DIR` (répertoire res/ copiable) ; le test sonde désormais une **copie** en tmp et ne touche plus le dépôt. Test de garde `tests/mel_bug_027_test_isolation.test.js` (aucun test n'écrit dans res/ ou smali/).
- **Preuve** : 3 runs complets consécutifs 799/796/0/3. Le build CI reste en fail-loud volontaire (secret absent) — inchangé.
- **Statut** : résolu avec preuve (repro + 3 runs stables).

## CI — commit 796f5e0 (2026-11-06, run 42231991349)
- **Unit and regression suite : 799/799/0/0 SUCCESS** (avec javac réel) — la race MEL-BUG-027 est éradiquée.
- **Verify UI metrics phone+tablet : SUCCESS.** Seul échec : build signée, fail-loud volontaire « MELODIX_TEST_KEYSTORE_B64 is not set » (inchangé, à poser via l'interface GitHub pour débloquer walk émulateur + release CI).

## Outillage — commit suivant (2026-11-06)
`scripts/publish_preview_release.sh` : publie + **vérifie** une pre-release via l'API GitHub (tag test inédit, prerelease, notes avec APK/sha256/empreinte/limites, contrôle existence release + APK servie). Le canal Arena est désormais entièrement scripté : `build_preview_apk.sh` → `publish_preview_release.sh`.

## MEL-BUG-028 — P2 : recherche avec requête mais 0 résultat affichait l'indice « Recherchez un artiste… »
- **Constat** : la branche empty de l'écran Recherche affichait toujours l'indice de saisie, même après une requête soumise sans résultat.
- **Correctif** : `:native_rows_search_empty` branche sur `nativeExpectedSearch` ; requête non vide → « Aucun résultat pour « <requête> » » ; requête vide → indice conservé. 2 tests (`mel_bug_028_search_no_results.test.js`), test MEL-BUG-026 ajusté. Suite : 801/798/0/3.
- **Statut** : correctif livré + tests verts ; validation émulateur via prochain run CI.

## Preview publiée depuis Arena — v1.2.2-test.49-preview (2026-11-06, commit cbcee2a + APK)
- **Contenu** : MEL-BUG-028 (recherche 0 résultat → « Aucun résultat pour « … » »).
- APK `releases/Melodix-Test-v1.2.2-test49.apk` · sha256 `af05b7e2e5eaf64957a72de74592cf5618edd2669a147413d06c2057c5a6e53e` · versionCode **1049** · empreinte `F9:A6:3F:…:24:18` (identique test.47/48 → mise à jour directe). v1+v2+v3 vérifié, arsc aligné. Suite 801/798/0/3.

### MEL-BUG-026 (complément 2) — branche empty de la Recherche
`:native_rows_search_empty` branche désormais d'abord sur `isNativeSessionUnproven()` → carte de connexion (la recherche sans session ne peut jamais produire de résultats, même via Retour). Ensuite seulement la distinction MEL-BUG-028 (indice vs « Aucun résultat »). Test ajouté dans mel_bug_028. Suite : 802/799/0/3.

## Preview publiée depuis Arena — v1.2.2-test.50-preview (2026-11-06, commit 51e133e + APK)
- **Contenu** : MEL-BUG-026 complément 2 (branche empty Recherche sans session → carte de connexion avant toute autre chose).
- APK `releases/Melodix-Test-v1.2.2-test50.apk` · sha256 `e0a2886aefd5ed076d90b34f13d0d37e67a359ea654259c8d0695d1c2689c1b2` · versionCode **1050** · empreinte `F9:A6:3F:…:24:18` (identique test.47→49 → mise à jour directe). v1+v2+v3 vérifié. Suite 802/799/0/3.

### MEL-BUG-026 (complément 3) — clic tuile de genre sans session
`performNativeLiveSearch` kicke toujours la recherche WebView, puis rend la carte de connexion si `isNativeSessionUnproven()` (la grille de genres ne reste plus figée sans feedback). Test ajouté (5/5 dans le fichier). Suite : 803/800/0/3.

## Preview publiée depuis Arena — v1.2.2-test.51-preview (2026-11-06, commit ba32135 + APK)
- **Contenu** : MEL-BUG-026 complément 3 (recherche live depuis tuile de genre sans session → carte de connexion).
- APK `releases/Melodix-Test-v1.2.2-test51.apk` · sha256 `d08ebc75120ad70600ecfbc0bdbb31ae21f559feae0ee157a09795d25e9da9f7` · versionCode **1051** · empreinte `F9:A6:3F:…:24:18` (mise à jour directe depuis test.47→50). Suite 803/800/0/3.

## MEL-BUG-029 — P1 : l'accueil affichait « non connecté » pour un utilisateur réellement connecté (sélecteurs DOM périmés)
- **Cause** : la preuve « connecté » exigeait exactement `user-widget-link`/`.main-userWidget-box` ET `control-button-playpause`/`.main-playButton-entrancePoint`. Si une famille de sélecteurs Spotify change, l'état reste « unknown » → `mediaLibraryAuthReady()` faux → aucune preuve de session → carte « Connexion Spotify non confirmée » sur l'accueil malgré une vraie session.
- **Correctif** (fail-closed conservé) : chaque côté accepte désormais plusieurs sélecteurs déjà utilisés dans le codebase (profil : + `a[href^="/user/"]` ; lecteur : + `now-playing-bar`, `mini-player`, skip forward/back). L'état connecté exige toujours **les deux** côtés ; les routes login/accounts restent prioritaires (SIGNED_OUT). Assets minifiés régénérés via `build_runtime_assets.sh`. Tests : `mel_bug_029_auth_signals.test.js` (5) + fixture `p0_shell_takeover` mise à jour. Suite : 808/805/0/3.
- **Statut** : correctif livré + tests verts ; validation avec une vraie session Spotify toujours en attente (non simulable en sandbox).

## Preview publiée depuis Arena — v1.2.2-test.52-preview (2026-11-06, commit 1b29e71 + APK)
- **Contenu** : MEL-BUG-029 (accueil « non connecté » à tort → détection auth élargie, fail-closed conservé).
- APK `releases/Melodix-Test-v1.2.2-test52.apk` · sha256 `140f8513d828b1100945d6c571f49c90e309d1670068e38a5001d163948c3ca4` · versionCode **1052** · empreinte `F9:A6:3F:…:24:18` (mise à jour directe depuis test.47→51). Suite 808/805/0/3.

## CI — commit 1b29e71 (2026-11-06, run 42241948330)
Suite unitaire CI : **808/808/0/0 SUCCESS**. Seul rouge : fail-loud volontaire (secret keystore absent).

## MEL-BUG-023 — expérience « Package en conflit » à la mise à jour (2026-11-06)
- **Cause** : Android refuse la mise à jour si la signature change. Le bac à sable efface le keystore local à chaque réinitialisation → une nouvelle session Arena peut publier une empreinte différente → conflit avec l'app installée. C'est la protection voulue (aucun contournement, jamais de contrôle de signature désactivé).
- **Procédure documentée partout** (releases/README.md en tête, notes de chaque release via publish_preview_release.sh, test de garde) : `adb uninstall com.melodix.music` (ou Réglages → Applications → Melodix → Désinstaller) puis installer la nouvelle APK. La désinstall efface la session Spotify (reconnexion nécessaire). Même session Arena = même empreinte = mise à jour directe.
- Suite : 809/805/0/3.

## MEL-BUG-030 — P1 : après login, les playlists flashent 1 frame puis l'accueil retombe sur la carte 401 « Connexion Spotify à vérifier » (2026-11-06)
- **Cause** : `requestMediaLibraryProof` n'autorisait **exactement une** tentative de preuve par époque de sign-in après un 401/403. Si ce premier essai 401 (race de cookies juste après le login Spotify), plus aucun retry automatique pour cette époque → l'accueil reste bloqué sur la carte d'erreur jusqu'au « Réessayer » manuel, alors que la session est valide (d'où le flash des playlists).
- **Correctif** (fail-closed conservé, contrats auth/session intacts) : budget **borné de 3 tentatives** par époque de sign-in (`__sfMediaLibRefusalEpoch`/`__sfMediaLibRefusalAttempts`), réinitialisé quand l'époque augmente ou quand la preuve réussit ; au-delà, bloqué (aucune boucle infinie possible). Le retry manuel « Réessayer » reste disponible. Aucune ligne privée n'est jamais rendue sans preuve libraryV3 valide.
- Tests : nouveau `tests/mel_bug_030_refusal_budget.test.js` (4) + P0 `p0_home_visibility_gate`/`p0_shell_takeover`/`p0_playlist_sync` mis à jour vers la sémantique bornée. Suite : **813/810/0/3**.
- **Statut** : correctif livré + tests verts + preview test.53 publiée ; validation avec une vraie session Spotify toujours en attente (non simulable en sandbox).

## Preview publiée depuis Arena — v1.2.2-test.53-preview (2026-11-06, commit fa71128 + APK)
- **Contenu** : MEL-BUG-030 (budget borné de 3 retries post-401 par époque de login).
- APK `releases/Melodix-Test-v1.2.2-test53.apk` · sha256 `ef76d0a4a82579f4a1a131eb93ec12eefdbccda8dc123a518cdcc2a98c137fa6` · versionCode **1053** · empreinte `DB:63:77:15:AA:DE:11:58:EF:AD:BF:16:4F:CD:E3:10:A5:8E:1F:AF:1B:E2:D5:A1:E5:2F:AE:DE:70:C8:59:A2` (nouvelle session Arena = nouveau keystore local, d'où le warning « Package en conflit » → `adb uninstall com.melodix.music` d'abord). Suite 813/810/0/3.

## MEL-BUG-031 — P2 : effacer la recherche laissait les résultats figés à la place de la grille de genres (2026-11-06)
- **Cause** : `NativeSearchWatcher.afterTextChanged` ne réagissait qu'aux requêtes ≥ 2 caractères ; une requête effacée (< 2) ne déclenchait rien, les rows de résultats restaient visibles.
- **Correctif** : requête courte/effacée → `pendingQuery` annulé + appel de la nouvelle `MainActivity.onNativeSearchQueryCleared()` qui remet `nativeGenreScroll` VISIBLE, `nativeRowsScroll` GONE et oublie `nativeExpectedSearch`. La live search ≥ 2 caractères est inchangée.
- Tests : nouveau `tests/mel_bug_031_search_clear_genre_grid.test.js` (3). Suite : **816/813/0/3**. CI 508d948 : suite unitaire SUCCESS (seul rouge = fail-loud volontaire).

## Preview publiée depuis Arena — v1.2.2-test.54-preview (2026-11-06, commit 508d948 + APK)
- **Contenu** : MEL-BUG-031 (recherche effacée → retour grille de genres).
- APK `releases/Melodix-Test-v1.2.2-test54.apk` · sha256 `d03d24473465615b7ca0a5a44e75ef7862b7615e5fcd2f39dc265b168051e5f6` · versionCode **1054** · empreinte `DB:63:77:…:59:A2` (même session Arena que test.53 → mise à jour directe). Suite 816/813/0/3.

## MEL-BUG-032 — P1 : un 400 pathfinder (hash persistant libraryV3 rotaté) bloquait la preuve Home indéfiniment (2026-11-06)
- **Cause** : `fetchAllLibrary` classait toute erreur non-2xx autre que 401/403/429 en `http-400`, **non transitoire** dans la porte du shell → plus aucun retry automatique, accueil bloqué. Si Spotify a rotaté le hash `libraryV3`, chaque requête返ait 400 `PersistedQueryNotFound` avec le hash embarqué/périmé.
- **Correctif** (fail-closed conservé) : sur un 400, le hash caché `sp_hash_libraryV3` est supprimé (le prochain essai retombe sur le hash embarqué/re-résolu), le corps est inspecté localement (jamais loggé) pour classer `http-400-persisted-query`, et ces erreurs deviennent **transitoires** (retry borné avec backoff). 401/403 gardent leur budget borné MEL-BUG-030. Aucune ligne privée sans preuve.
- Tests : nouveau `tests/mel_bug_032_persisted_query_400.test.js` (3). Suite : **819/816/0/3**.

## Preview publiée depuis Arena — v1.2.2-test.55-preview (2026-11-06, commit MEL-BUG-032 + APK)
- **Contenu** : MEL-BUG-032 (400 PersistedQueryNotFound → hash vidé + retry borné au lieu d'un blocage permanent).
- APK `releases/Melodix-Test-v1.2.2-test55.apk` · sha256 `75e8200e567e91843010750a6ab1b65c34aa1f3648389271c42781955e135901` · versionCode **1055** · empreinte `DB:63:77:…:59:A2` (même session Arena que test.53/54 → mise à jour directe). Suite 819/816/0/3.

## MEL-BUG-033 — P3 : aucun layout paysage dédié (2026-11-06)
- **Ajout** : `res/layout-land/activity_main.xml` avec exactement le même contrat que le portrait (ids, onClick, contentDescription, tuiles) + tests de parité anti-dérive (`mel_bug_033_landscape_layout.test.js`, extension de `mel_tablet_layout.test.js`). Suite : **821/818/0/3**.

## Preview publiée depuis Arena — v1.2.2-test.56-preview (2026-11-06, commit 04719fa + APK)
- **Contenu** : MEL-BUG-033 (layout-land) + MEL-BUG-030/031/032 déjà dans test.53-55.
- APK `releases/Melodix-Test-v1.2.2-test56.apk` · sha256 `a091e1747fdd0a25e3f88a27056fa9c0b8d495e2236831533bbbb03eb4729da7` · versionCode **1056** · empreinte `DB:63:77:…:59:A2` (même session Arena → mise à jour directe). Suite 821/818/0/3.

## CI — commit 04719fa (2026-11-06, runs 42261747619 / 42261747620)
- Job « Unit and regression suite (with a real Java compiler) » : **SUCCESS**. « Verify UI metrics on phone and tablet » : **SUCCESS**. Seul rouge : fail-loud volontaire « Build one build-only APK » (secret keystore absent). Suite locale : 821/818/0/3. Assets minifiés resynchronisés (aucun diff après `build_runtime_assets.sh`).

## MEL-BUG-031 (complément) — Entrée avec champ vide (2026-11-06)
- `onNativeSearchSubmit` avec requête vide appelle désormais `onNativeSearchQueryCleared()` : retour à la grille de genres, comme un effacement. Suite : **822/819/0/3**.

## Preview publiée depuis Arena — v1.2.2-test.57-preview (2026-11-06, commit be773f6 + APK)
- **Contenu** : complément MEL-BUG-031 (submit vide → grille de genres).
- APK `releases/Melodix-Test-v1.2.2-test57.apk` · sha256 `1328aff5e93f85825f4aa5c8f887689edde9e45dd69b2ceb67bfd067b3992ac6` · versionCode **1057** · empreinte `DB:63:77:…:59:A2` (même session Arena → mise à jour directe). Suite 822/819/0/3.

## Preview publiée depuis Arena — v1.2.2-test.58-preview (2026-11-06, commit 744de85 + APK)
- **Contenu** : MEL-BUG-033 complément (layout paysage tablette `res/layout-sw600dp-land/` + parité testée).
- APK `releases/Melodix-Test-v1.2.2-test58.apk` · sha256 `4986bf09298d55c499b521b9cde7cf6d9d4be07da1d8e889291374043f9e6514` · versionCode **1058** · empreinte `DB:63:77:…:59:A2` (même session Arena → mise à jour directe). Suite 823/820/0/3.

## Preview publiée depuis Arena — v1.2.2-test.59-preview (2026-11-06, commit MEL-BUG-032 complément + APK)
- **Contenu** : copie d'erreur honnête pour http-400(-persisted-query) « Réponse Spotify inattendue » + action retry réelle. Suite : **824/821/0/3**.
- APK `releases/Melodix-Test-v1.2.2-test59.apk` · sha256 `9299d91c4a5d8c867c4abc3e04f8497b1ea2415d86165a32e2ee54de29213079` · versionCode **1059** · empreinte `DB:63:77:…:59:A2` (même session Arena → mise à jour directe).

## CI — commit 744de85 (2026-11-06, run 42264490769)
- « Unit and regression suite » : **SUCCESS**. Seul rouge : fail-loud volontaire (secret keystore absent). Suite locale : 823/820/0/3.

## MEL-BUG-034 — P3 : réouverture de l'onglet Recherche avec un texte résiduel (2026-11-06)
- **Cause** : `onNativeSearchClick` rouvrait le champ avec l'ancien texte alors que la grille de genres était affichée (le watcher ne se déclenche que sur édition).
- **Correctif** : `setText("")` à l'ouverture de l'onglet Recherche → le watcher ramène la grille de genres (MEL-BUG-031), champ et écran cohérents. Suite : **825/822/0/3**.

## Preview publiée depuis Arena — v1.2.2-test.60-preview (2026-11-06, commit MEL-BUG-034 + APK)
- APK `releases/Melodix-Test-v1.2.2-test60.apk` · sha256 `868047eb90c8bc3a8ee4b7735720bd18bd7d7ac5ed447fd7dc7b7a00937788eb` · versionCode **1060** · empreinte `DB:63:77:…:59:A2` (même session Arena → mise à jour directe). Suite 825/822/0/3.

## CI — commit d694869 (2026-11-06, run 42265732431)
- « Unit and regression suite » : **SUCCESS**. Seul rouge : fail-loud volontaire (secret keystore absent). Suite locale : 825/822/0/3.

## Garde d'intégrité du canal previews (2026-11-06)
- Nouveau `tests/releases_integrity.test.js` (2) : chaque `releases/*.apk` a un `.sha256` valide (digest réel vérifié), et `releases/README.md` garde la procédure `adb uninstall` + référence la preview la plus récente. Suite : **827/824/0/3**.

## APK « dans la release » — contrainte sandbox uploads.github.com (2026-11-06)
- **Contrainte technique prouvée** : `uploads.github.com` est hors allowlist du bac à sable Arena (TCP OK puis stall, HTTP 000 ; `gh release upload` → EOF). Aucun asset binaire ne peut donc être attaché à une release depuis Arena.
- **Contrat garanti à la place** : chaque **tag de pre-release contient l'APK dans le dépôt git** (`releases/Melodix-Test-…apk` au ref du tag, vérifié via l'API contents > 1 Mo) et les notes de release ont en tête une section « 📥 Télécharger l'APK » avec (1) lien raw **épinglé sur le tag**, (2) page blob du tag (bouton Download), (3) archive zip du tag via codeload. Appliqué rétroactivement aux 15 previews (test.46→60) et généré automatiquement par `publish_preview_release.sh` (liens désormais sur `${TAG}`, pas la branche). Garde : `tests/releases_integrity.test.js` (4 tests). Suite : **828/825/0/3**.

## CI — commit 6811e23 (2026-11-06, run 42277884610)
- « Unit and regression suite » : **SUCCESS** (0 skip avec javac — le check API des tags de previews ne skippe plus en CI, il valide le contrat dépôt hors-ligne). Seul rouge : fail-loud volontaire. Suite locale : 829/825/0/4 (skips = javac absent en local). Note : les runs 8dd6682/a2d5c06/aa7c126 étaient rouges à cause d'un skip conditionnel ajouté en CI (interdit par le workflow) — corrigé.

## Preview publiée depuis Arena — v1.2.2-test.61-preview (2026-11-06, commit APK test.61)
- **Contenu** : cumul MEL-BUG-030/031/032/033/034. APK **vérifié dans le tag** via l'API (`releases/Melodix-Test-v1.2.2-test61.apk` au ref du tag, 3 675 195 o) ; notes de release avec section « 📥 Télécharger l'APK » épinglée sur le tag (raw + blob + zip codeload), générée automatiquement par `publish_preview_release.sh`.
- APK `releases/Melodix-Test-v1.2.2-test61.apk` · sha256 `f307a1b3df7eaa6add7e52dddf8c5235c6cc4804982b88124afeb51e305d5ba1` · versionCode **1061** · empreinte `B0:B8:D5:60:70:9C:00:A7:14:FE:A4:60:5F:DB:22:51:83:CD:59:5F:91:0E:70:28:01:E5:94:E9:79:CB:6C:F5` (**nouvelle session Arena** → « Package en conflit » possible vs test.53-60 : `adb uninstall com.melodix.music` d'abord). Suite 829/825/0/4.

## MEL-BUG-035 — P0 : après login, les playlists flashent puis la carte 401 reste coincee meme apres MEL-BUG-030 (2026-11-06, signal utilisateur « rien n'a changé »)
- **Cause racine** : la branche 401/403 de `requestMediaLibraryProof` remettait `__sfMediaLibRetryAt = 0` → les 3 tentatives du budget MEL-BUG-030 partaient **dans la même milliseconde**, avant que le cookie de session post-login soit posé → toutes 401 → `scheduleHomeRetry` stoppait tout (refus auth) → carte « Connexion Spotify à vérifier » permanente.
- **Correctif** : la branche ne touche plus à `retryAt` (le backoff armé à chaque tentative : >= 5 s, doublé, cap 60 s, bloque les retries immédiats via le check générique) + `scheduleHomeRetry` garde un **timer borné** tant que le budget de 3 refus/epoque n'est pas épuisé (puis stoppe, actions explicites sur la carte). Jamais de boucle infinie (budget + MAX_HOME_RETRIES). Fail-closed conservé.
- Tests : nouveau `tests/mel_bug_035_refusal_backoff.test.js` (3) + 030/P0 mis à jour. Suite : **834/830/0/4**.

## Preview publiée depuis Arena — v1.2.2-test.62-preview (2026-11-06, commit MEL-BUG-035 + APK)
- APK `releases/Melodix-Test-v1.2.2-test62.apk` · sha256 `8c58d998d20fbca0c76622dda4b50c703a79d04abaf4a7a7cd1e9198a7f5d5f4` · versionCode **1062** · empreinte `B0:B8:D5:…:6C:F5` (**même session Arena que test.61 → mise à jour directe, PAS de « Package en conflit »**). APK vérifié dans le tag via l'API.

## MEL-BUG-036 — P0 : 401 persistant sur libraryV3 juste après login (cause racine la plus probable) (2026-11-06)
- **Cause** : la requête pathfinder `libraryV3` n'envoyait que les cookies (`credentials: 'include'`), sans `Authorization: Bearer`. Le WebPlayer s'authentifie sur pathfinder avec un **token web-player** (`GET open.spotify.com/api/token`, cookie-auth) ; un appel cookie-seul peut être répondu 401 juste après login → la preuve est invalidée (fail-closed) → carte « Connexion Spotify à vérifier » alors que la session est valide (d'où le flash des playlists quand un essai réussit puis un autre 401).
- **Correctif** : `fetchWebPlayerToken()` fetch/cache le token (avec expiry, marge 60 s), header `Authorization: Bearer` ajouté **uniquement** si un token existe (requête cookie-seule préservée sinon) ; sur 401/403 le cache est vidé (`dropWebPlayerToken`) pour que le retry borné (MEL-BUG-030/035, 3/époque avec backoff ≥5 s) le re-fetche. Le token n'est **jamais** loggué (snapshot diagnostic = allow-list fixe, vérifié par test). Contrats auth/session inchangés, fail-closed conservé.
- Tests : `tests/mel_bug_036_webplayer_bearer.test.js` (5) + test comportemental dans `p0_library_fetch.test.js` (harnais route `/api/token`, 404 par défaut → header absent, comportement legacy intact). Suite : **840/836/0/4**.
- **Statut** : correctif livré + preview test.63 ; validation avec une vraie session Spotify en attente (non simulable en sandbox).

## Preview publiée depuis Arena — v1.2.2-test.63-preview (2026-11-06, commit d7d253f + APK)
- APK `releases/Melodix-Test-v1.2.2-test63.apk` · sha256 `dc2bef60cf7da96c2b33bccd6b8a8ba21d523157a33639f42b73ce48fcb84f83` · versionCode **1063** · empreinte `B0:B8:D5:…:6C:F5` (même session Arena que test.61/62 → **mise à jour directe**, pas de « Package en conflit »). APK vérifié présent dans le tag via l'API. Suite 840/836/0/4.

## MEL-BUG-037 — P2 : section Paramètres vide / « Chargement… » interminable (2026-11-07)
- **Correctif** : watchdog natif 4,5 s → **2 s** ; le fallback de timeout rend désormais les **vraies sections locales** (État + réessayer, Compte/connexion, Apparence, Préférences de lecture autoplay/canvas/bg_audio avec leurs vraies URIs `melodix:setting:*`, Notifications) + section À propos. Le Settings n'est plus jamais vide.

## MEL-BUG-038 — P2 : grille « Explorer Melodix » au milieu de l'accueil supprimée (demande utilisateur, 2026-11-07)
- Appel `NativeShortcutGrid;->render` retiré de `NativeHomeShelfRenderer` ; la navigation reste dans la barre d'onglets du bas. Tests mis à jour (0 call site).

## MEL-BUG-039 — P2 : restyle « verre » façon Apple (2026-11-07)
- Surfaces translucides (`mel_surface` #CC10151A, `mel_surface_high` #E01A222A, boutons translucides), nouvelle palette verre (`mel_glass_fill/stroke/tabbar/card`) miroir dans `MelColors.smali` ; **tab bar en panneau verre** (haut arrondi 24 dp + filet clair) dans les 4 layouts (phone/land/sw600dp/sw600dp-land) ; **icônes header en disques de verre** (back, engrenage, avatar) ; **carte d'état** avec hairline verre et **icône en disque verre** (smali). Tests de parité XML↔MelColors existants + nouveaux gardes.

## MEL-BUG-040 — P0 : le budget de refus 401/403 est remis à zéro à chaque transition d'état auth (2026-11-07)
- Le listener `sf-spotify-auth-state-changed` reset `__sfMediaLibRefusalEpoch/Attempts` : une vraie reconnexion (même si l'epoch n'a pas bougé) redonne toujours un budget frais de 3 essais avec backoff — la carte 401 ne peut plus rester coincée pour toute la session à cause d'un 401 vu pendant la redirection de login. Cumul avec MEL-BUG-030/035/036 (budget borné + backoff + Bearer web-player token).
- Suite : **847/843/0/4**.

## MEL-BUG-041 — P0 : après épuisement du budget de refus, un cool-down lent auto-répare la carte 401 (2026-11-07)
- Après 3 refus 401/403 dans une époque, la gate bloquait **définitivement** ; or aucun événement `sf-spotify-auth-state-changed` ne se redéclenche tant que la chaîne d'état UI ne change pas → un 401 tardif (settle cookie/token) laissait la carte 401 coincée toute la session. Fix : quand le budget est épuisé, une deadline de cool-down `__sfMediaLibRefusalCooldownAt` autorise un nouveau budget borné (3 essais) toutes les **120 s**, toujours rythme-limité par le backoff générique (`__sfMediaLibRetryAt`) — jamais de boucle infinie, jamais de succès fictif. Le cool-down est aussi remis à zéro avec le budget (époque auth, état prêt, transition auth). Le diagnostic `__sfMediaLibLastDiagnostic` exporte désormais un **booléen** `bearer` (le token n'y est jamais) pour voir si un Bearer web-player était attaché au moment du refus.
- Tests : `tests/mel_bug_041_refusal_cooldown.test.js` (4 tests) + mises à jour `p0_library_fetch`/`mel_bug_030`. Suite : **851/847/0/4**.

## Preview publiée depuis Arena — v1.2.2-test.64-preview (2026-11-07, commit 77afe52 + APK)
- **Contenu** : MEL-BUG-037/038/039/040 (Paramètres remplis, accueil sans grille du milieu, UI verre Apple, 401 plus jamais coincé par époque).
- APK `releases/Melodix-Test-v1.2.2-test64.apk` · sha256 `a7b87f4ebd2ce6d87d9ce743ad41be95841360207e43d26ba2c8ca6c7c183d56` · versionCode **1064** · empreinte `8B:93:8C:…:B7:1D:9E` (**nouvelle session Arena** → `adb uninstall com.melodix.music` d'abord, MEL-BUG-023). APK vérifié dans le tag. Suite 847/843/0/4.
