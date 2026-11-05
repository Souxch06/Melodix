# Registre des anomalies — Melodix

Identifiants stables. Mis à jour à chaque cycle. **Aucune anomalie n'est marquée résolue sans preuve sur appareil.**

Statuts : Ouvert · En diagnostic · Correctif appliqué · En vérification · Résolu avec preuve · Bloqué · En attente de validation authentifiée.

---

## MEL-BUG-001 — Les métriques runtime ignorent `sw600dp`

| Champ | Valeur |
|---|---|
| **Gravité** | **P1** — toute l'interface tablette est dimensionnée comme un téléphone |
| **Écran** | Accueil (carte de statut), Paramètres (lignes), et par extension tout composant rendu en code |
| **Appareil** | Tablette 800 dp (1600×2560 @320 dpi). Invisible sur téléphone. |
| **Reproduction** | 1. Installer l'APK QA sur le profil tablette. 2. Ouvrir Paramètres. 3. Mesurer la hauteur de ligne. |
| **Attendu** | 76 dp (`mel_settings_row_height`, sw600dp) |
| **Observé** | **64,0 dp** — exactement la constante de repli de l'accesseur |
| **Preuve** | `docs/audits/ui-qa-41989590342/tablet/settings-tablet.png` ; mesures pixel : ligne 64,0 dp, carte de statut 559,5 dp (au lieu de 720), gouttière runtime 14 dp (au lieu de 32) |
| **Cause** | **Non encore confirmée.** Trois causes d'empaquetage éliminées par `aapt2` sur l'APK installé : noms présents, valeurs sw600dp correctes, paquet identique (`com.melodix.music`, id 7f). Une référence XML est compilée en id numérique ; `getIdentifier()` a besoin du nom. La divergence est donc dans le chemin runtime. |
| **Pourquoi masqué** | Les 67 accesseurs ont un repli **égal** au jeton téléphone : le téléphone ne peut structurellement pas révéler la panne. |
| **Correctif** | Aucun. Diagnostic sur appareil ajouté (`NativeUiRowFactory.logMetricResolution`, tag `MelMetrics`) : relève id, pixels, `smallestScreenWidthDp`, `densityDpi`, classe du `Context`. |
| **Tests** | `tests/ui_layout_audit.test.js` (sonde), mesures pixel des captures |
| **Statut** | **En diagnostic** |

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
| **Statut** | **Correctif appliqué — en vérification** |

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
| **Tests** | `tests/ui_screen_state.test.js` |
| **Statut** | **Correctif appliqué — en vérification** |

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
