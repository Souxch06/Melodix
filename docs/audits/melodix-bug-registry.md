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
