# Reconstruction et finalisation de l'interface Melodix

**Date :** 2026-11-05
**Branche :** `arena/6b935c3e-melodix`
**Base :** `c83d164`
**Périmètre :** interface uniquement — aucune logique de lecture, aucun bridge Spotify, aucune MediaSession, aucune permission, aucune gestion de session modifiée.

---

## 0. Verdict

**INTERFACE RECONSTRUITE ET ADAPTATION TABLETTE PROUVÉE SUR APPAREIL. VALIDATION AUTHENTIFIÉE TOUJOURS MANQUANTE.**

Le shell natif est passé de dimensions codées en dur, identiques sur tous les écrans, à un système de design à jetons avec une **véritable adaptation tablette** : variante de layout dédiée, 151 surcharges de métriques, 67 accesseurs smali.

**La différence téléphone/tablette est mesurée sur émulateur, pas seulement affirmée** (§7) : barre d'onglets 64 dp contre 76 dp, onglets 58 dp contre 68 dp, bouton Paramètres 48 dp contre 52 dp, sur le **même APK**. Android sélectionne donc réellement `res/values-sw600dp`.

Ce qui **n'est pas** prouvé : le rendu avec une session Spotify authentifiée. Aucune capture d'un lecteur en lecture, d'une étagère de pochettes réelles ou d'une bannière de playlist n'a pu être produite, faute de compte. C'est déclaré, pas masqué (§5, §9).

---

## 1. Point de départ : l'« ancienne branche UI » était déjà intégrée

La demande supposait une branche UI perdue à récupérer. Vérification faite :

| Fait | Preuve |
|---|---|
| PR #6 `arena/dbf2d44f-melodix` (« Fix startup sign-in and refresh the mobile UI »), tip `5d38b1f` | `git merge-base --is-ancestor refs/ui-review/mobile-ui c83d164` → **oui** |
| L'état actuel est **plus évolué** que cette branche | PR #7 (remédiation bridge) par-dessus, palette `mel_*`, assets générés |

**Conclusion : rien à récupérer, aucune fusion à faire.** Restaurer les `assets/*.js` de cette branche aurait écrasé la remédiation du bridge. Le travail a donc porté sur l'**amélioration et l'achèvement** de l'existant.

Le manque réel : **zéro adaptation tablette**. Un seul `res/layout`, des dimensions en dur (`48.0dip`, `64.0dip`, `23.0sp`…), et `res/values-sw600dp` ne contenant que des valeurs de bibliothèque héritées. Une tablette recevait l'interface téléphone telle quelle.

---

## 2. Écrans réellement traités

| # | Surface | Travail réalisé | État |
|---|---|---|---|
| 1 | **Accueil** | Étagères, cartes, pochettes, gouttières, titres de section ; carte de statut et tuiles rapides | Refait — **0 conversion dp brute restante** |
| 2 | **Bibliothèque** | Lignes (pochette, hauteur, rayon, paddings, titre, sous-titre), chips de catégories | Refait |
| 3 | **Playlists** | Bannière de collection (pochette 200→260 dp, titre 26→32 sp, pastille d'action) + lignes | Refait |
| 4 | **Albums & artistes** | Même bannière de collection et mêmes lignes de détail | Refait |
| 5 | **Lecteur principal** | Tous les rôles tokenisés ; **deux colonnes sur tablette** | Refait, structure vérifiée par test |
| 6 | **Mini-lecteur** | Hauteur, pochette, textes, bouton, insets, progression | Refait |
| 7 | **Navigation générale** | Barre 64→76 dp, onglets 58→68 dp, labels 11,5→13 sp | **Mesuré sur appareil** |
| 8 | **Recherche** | Champ 48→54 dp, bouton d'envoi, **grille de genres 2×4 → 4×2** | Refait |
| 9 | **Profil & paramètres** | 13 métriques + 4 tailles de texte | Refait — **0 conversion dp brute restante** |
| 10 | **Connexion & chargement** | Splash tokenisé ; barre de chargement `teal_200` → `mel_accent` ; **fonds WebView alignés sur le shell** | Refait |

**Aucun écran provisoire, aucun composant d'une autre application.** La seule référence à un nom de gabarit Material dans le shell (`teal_200`, qui contenait déjà le vert Melodix) a été remplacée par le jeton de palette équivalent.

---

## 3. Ce qui a été créé

### 3.1 Système de design

* **`res/values/mel_dimens.xml`** — **169 jetons**, source de vérité unique des métriques du shell.
* **`res/values-sw600dp/mel_dimens.xml`** — **151 surcharges tablette**, **par rôle et non par facteur global**.

Les valeurs téléphone sont **les littéraux historiques** : l'introduction des jetons n'a changé aucun rendu téléphone. Le raffinement visuel est un changement séparé et explicite.

### 3.2 Variante de layout tablette

**`res/layout-sw600dp/activity_main.xml`** — générée depuis le layout téléphone puis restructurée, ce qui garantit la parité par construction :

* lecteur plein écran en **deux colonnes** (pochette à gauche, métadonnées + commandes à droite) ;
* grille de parcours en **4 colonnes × 2 rangées** au lieu de 2 × 4 ;
* textes du lecteur alignés à gauche dans la colonne latérale ;
* **aucun nouvel identifiant** → aucune entrée `public.xml` nécessaire.

### 3.3 Couche de métriques smali

**`smali/com/melodix/music/NativeUiMetrics.smali`** — **67 accesseurs**, un par jeton, chacun portant son littéral historique en repli. **75 appels** depuis les rendus.

Deux helpers dans `NativeUiRowFactory` :
* `metric(Context, String, int)` — résout un dimen par nom, laisse Android choisir la ressource qualifiée ;
* `applyTextSize(TextView, Context, String, float)` — `getDimension()` + `COMPLEX_UNIT_PX`, pour n'appliquer l'échelle de police sp **qu'une seule fois**.

**Contrainte technique découverte et respectée.** Première tentative : passer le nom du jeton sur le site d'appel en incrémentant `.locals`. Le test de sanity smali l'a **rejetée à juste titre** : incrémenter `.locals` décale les registres de paramètres au-delà de `v15`, que les `invoke` non-range ne peuvent pas encoder. D'où la classe d'accesseurs : chaque site reste un unique `invoke-static` réutilisant le registre de contexte déjà présent, et **`.locals` est démontré inchangé** dans toutes les méthodes touchées.

### 3.4 Outillage de vérification

* **`scripts/ui_metrics_measure.py`** — compare les dimensions **réellement rendues** (dump `uiautomator` converti en dp via la densité) aux jetons. Fail-closed.
* **`scripts/ui_metrics_diagnose.py`** — distingue « UI jamais lisible » de « shell absent », sans jamais écho de contenu écran.
* **`scripts/ui_view_center.py`** — centre réel d'une vue, pour taper un onglet sans coordonnée en dur.
* **`.github/workflows/verify-ui-metrics.yml`** — build-only, **aucun secret**, **aucune publication**.

---

## 4. Fichiers modifiés

**22 fichiers, +3 938 / −371.** Nouveaux fichiers :

```
res/values/mel_dimens.xml                    res/values-sw600dp/mel_dimens.xml
res/layout-sw600dp/activity_main.xml         smali/com/melodix/music/NativeUiMetrics.smali
scripts/ui_metrics_measure.py                scripts/ui_metrics_diagnose.py
scripts/ui_view_center.py                    .github/workflows/verify-ui-metrics.yml
tests/helpers/mel_dimens.js                  tests/mel_design_system.test.js
tests/mel_tablet_layout.test.js              tests/ui_metrics_measure.test.js
```

Fichiers existants modifiés : `res/layout/activity_main.xml`, `assets/css_hacks.css`, `NativeHomeShelfRenderer.smali`, `NativeUiRowFactory.smali`, `NativeSettingsRowFactory.smali`, et 5 fichiers de tests.

**Aucun fichier de logique Android, de bridge, de session, de permission ou de service de lecture touché.**

Chiffres clés : **223** références `@dimen` dans le layout téléphone, **224** dans la variante tablette. Il ne reste **aucun littéral dimensionnel non nul** dans le shell — seuls les `0.0dip` des tailles pondérées subsistent, ce qui est correct.

Conversions `dp()` brutes restantes : **étagères 0, paramètres 0, lignes 3** (deux marges incidentes + le repli partagé dans `metric()`), sous garde de budget.

---

## 5. Captures avant/après

**Aucune capture « avant » n'existe** : aucun rendu d'appareil n'était possible avant ce chantier, et aucune maquette n'a été fabriquée pour être présentée comme une capture réelle.

**Des captures « après » existent**, produites par le run réussi sur les deux profils :

| Artefact | Contenu | Expire |
|---|---|---|
| `melodix-ui-metrics-phone-41982237746` | `home-phone.png`, `search-phone.png`, `ui-metrics-phone.json`, dumps | 2026-11-12 |
| `melodix-ui-metrics-tablet-41982237746` | `home-tablet.png`, `search-tablet.png`, `ui-metrics-tablet.json`, dumps | 2026-11-12 |

Ces artefacts sont téléchargeables depuis l'onglet Actions du run **41982237746**. L'agent ne peut pas les télécharger lui-même (hôte de blob hors liste d'autorisation) ; les **mesures chiffrées** ont été lues via les annotations et sont reproduites en §7.

---

## 6. Tests réellement exécutés

### 6.1 Suite locale

| Étape | Total | Réussis | Échecs | Sautés |
|---|---|---|---|---|
| Référence avant toute modification | 591 | 588 | 0 | 3 |
| Après jetons + tokenisation du layout | 591 | 588 | 0 | 3 |
| Après métriques smali des étagères | 591 | 588 | 0 | 3 |
| Après lignes + garde du design system | 602 | 599 | 0 | 3 |
| Après variante de layout tablette | 611 | 608 | 0 | 3 |
| Après paramètres + bannières | 612 | 609 | 0 | 3 |
| Après alignement des fonds WebView | 613 | 610 | 0 | 3 |
| Après outillage de vérification | 624 | 621 | 0 | 3 |
| **État final** | **631** | **628** | **0** | **3** |

Les **3 sauts** sont les tests JVM historiques : ni `javac` ni jar ECJ disponible. Ils sont sautés explicitement, **jamais comptés comme réussis**.

### 6.2 Régressions attrapées en cours de route

Preuve que les garde-fous fonctionnent :

1. **`modified Smali non-range invoke instructions use only v0-v15`** — a rejeté l'incrément de `.locals`. Corrigé par la classe d'accesseurs.
2. **`every smali accessor names a token that exists`** — a détecté deux accesseurs pointant vers des jetons non définis. Corrigé.
3. **`[P0v30] … caps tablet width`** — gardait le plafond `0x230` en littéral. Réécrit pour vérifier l'accesseur **et** les deux plafonds ; plus fort, car le plafond ne s'adaptait pas du tout auparavant.
4. **4 assertions à littéral dimensionnel** — devenues aveugles après tokenisation. Réécrites pour **résoudre les jetons et vérifier les deux form factors**.
5. **YAML du workflow** — un heredoc Python en colonne 0 cassait le bloc scalaire. Garde de validité YAML ajoutée.

### 6.3 Assemblage Android réel (CI)

`validate-android-assembly.yml` exécute `apktool 2.9.3 b --force-all` : **compilation aapt2 de toutes les ressources** (dont les deux fichiers de dimens et la variante `layout-sw600dp`) **et assemblage de tout le smali en dex**, puis vérification du package id.

| Run | Commit | Résultat |
|---|---|---|
| 41913777322 | `77fee86` | **success** |
| 41914418020 | `1e8e42d` | **success** |
| 41915947591 | `1d4011b` | **success** — la variante tablette compile |
| 41916589852 | `62be9cc` | **success** |

---

## 7. Résultats téléphone / tablette — MESURÉS SUR APPAREIL

### 7.1 Run de référence

**Run `41982237746` sur `2b6c91d` — les trois jobs `success`.** Un seul APK, signé par une clé de debug jetable, installé sur les deux profils.

| Profil | Pixels | Densité | Largeur utile mesurée | Ressources sélectionnées |
|---|---|---|---|---|
| Téléphone | 1080 × 2400 | 420 dpi | **411,4 dp** | `res/layout`, `res/values` |
| Tablette | 1600 × 2560 | 320 dpi | **800,0 dp** | **`res/layout-sw600dp`, `res/values-sw600dp`** |

### 7.2 Dimensions réellement rendues

| Vue | Jeton | Téléphone mesuré | Tablette mesurée | Attendu |
|---|---|---|---|---|
| `nativeTabBar.height` | `mel_tab_bar_height` | **64,0 dp** | **76,0 dp** | 64 / 76 ✓ |
| `nativeHomeTab.height` | `mel_tab_height` | **57,9 dp** | **68,0 dp** | 58 / 68 ✓ |
| `nativeSearchTab.height` | `mel_tab_height` | **57,9 dp** | **68,0 dp** | 58 / 68 ✓ |
| `nativeLibraryTab.height` | `mel_tab_height` | **57,9 dp** | **68,0 dp** | 58 / 68 ✓ |
| `nativeSettingsButton.width` | `mel_header_action` | **48,0 dp** | **52,0 dp** | 48 / 52 ✓ |

L'écart de 0,1 dp sur les onglets téléphone est l'arrondi de `getDimensionPixelSize` à 420 dpi ; la tolérance est de 1 dp et une dérive de 2 dp fait échouer le test.

**C'est la preuve décisive** : le même APK rend 64 dp sur téléphone et 76 dp sur tablette. La tablette n'est donc **pas** un téléphone étiré — Android choisit bien le jeu de ressources qualifié, et les jetons gouvernent le rendu réel.

Processus confirmé vivant après lancement sur les deux profils (`Status: ok`, pid 2243 téléphone / 2091 tablette).

### 7.3 Différences tablette vérifiées par test structurel

| Rôle | Téléphone | Tablette |
|---|---|---|
| Gouttière | 16 dp | 32 dp |
| Carte d'étagère | 148 dp | 190 dp |
| Pochette de ligne | 48 dp | 64 dp |
| Hauteur de ligne | 60 dp | 76 dp |
| Pochette du lecteur | 272 dp | 360 dp |
| Lecteur | 1 colonne | **2 colonnes** |
| Grille de parcours | 2 × 4 | **4 × 2** |
| Plafond de la carte de statut | 560 dp | 720 dp |
| Titre d'en-tête | 23 sp | 28 sp |

Un test interdit explicitement un **multiplicateur uniforme** : les ratios tablette/téléphone doivent différer selon le rôle.

### 7.4 Deux obstacles réels rencontrés et résolus

1. **`workflow_dispatch` renvoie HTTP 404** depuis une branche de travail : GitHub n'enregistre ce point d'entrée que depuis la branche par défaut, et `main` est intouchable. Le run est donc piloté par un déclencheur `push` restreint par chemins.
2. **L'app vérifie sa propre signature.** Les deux premiers runs ont échoué : dump lisible (23 nœuds) mais appartenant à `com.android.chrome`, aucun processus Melodix vivant. L'app compare son certificat à `res/values/strings.xml` `expected_signature_sha256` et s'arrêtait au démarrage. Correctif : générer la clé jetable **avant** le build, dériver son empreinte SHA-256 et l'écrire dans la **copie temporaire** du projet avant `apktool b` — la même approche que le build preview, mais sans aucun secret et sans toucher au dépôt. Le run suivant est passé au vert sur les deux profils.

Un bug de diagnostic a aussi été corrigé au passage : `pidof` renvoie 1 quand le processus est absent, ce qui, sous `set -e`, interrompait l'étape avant l'affichage du diagnostic — masquant la cause du premier échec.

---

## 8. Problèmes visuels restants

1. **`--mel-accent-deep` diverge entre les deux couches** : `#1db954` en CSS contre `#0e8f47` en natif. Les variantes translucides sont dérivées de la valeur CSS ; l'aligner impose de recalculer chaque wash. Laissé volontairement : cela exige un contrôle rendu.
2. **Bannière de collection encore en colonne unique sur tablette.** Ses métriques sont adaptées mais elle n'a pas reçu la restructuration deux colonnes du lecteur.
3. **3 conversions `dp()` subsistent dans `NativeUiRowFactory`** — deux marges incidentes et le repli partagé, sous garde de budget.
4. **`NativeSettingsRowFactory.dp()` est devenu mort** — conservé, inoffensif, supprimable dans un nettoyage séparé.
5. **3 onglets seulement** (Accueil, Recherche, Bibliothèque). Playlists, Albums et Paramètres s'atteignent par chips et bouton d'en-tête. Aucun onglet n'a été inventé : ajouter une destination sans câblage réel aurait été un bouton simulé.
6. **Le lecteur deux colonnes n'est pas capturé** : il faut une lecture réelle pour l'afficher. Sa structure est vérifiée par test, son rendu ne l'est pas.

---

## 9. Raccordements fonctionnels manquants

**Règle respectée : aucune simulation.** Pas de fausse lecture, pas de playlist inventée, pas de fausse donnée Spotify, pas de faux état de connexion, pas de bouton simulé. Ce chantier n'a touché **que des métriques, des drawables et des couleurs**.

| Élément | Pourquoi non vérifié | Ce qu'il faudrait |
|---|---|---|
| Lecteur plein en lecture | Nécessite une lecture réelle | Session Spotify authentifiée, saisie **sur l'appareil** |
| Étagères et pochettes réelles | Nécessitent le DOM Spotify connecté | Idem |
| Bannière de playlist / album | Nécessite une vraie collection | Idem |
| Mini-lecteur visible | Nécessite un morceau en cours | Idem |

Le script de mesure **liste explicitement ces éléments comme `not_measured`** au lieu de les inventer. Les états vides et de chargement existants restent **honnêtes** : leur texte, leur logique et leur visibilité n'ont pas été modifiés d'un caractère.

**Contrainte de sécurité maintenue :** aucun mot de passe, cookie ou jeton n'a été demandé, capturé ou stocké. Le diagnostic d'échec ne rapporte que des faits structurels (compteurs, noms d'identifiants, classes d'exception) — un test vérifie qu'une adresse e-mail et un jeton placés dans le texte d'une vue ne sont jamais renvoyés. Runbook conservé : `docs/audits/melodix-authenticated-session-runbook-2026-11-04.md`.

---

## 10. État Git

**Commit final :** `2b6c91d` — poussé sur `arena/6b935c3e-melodix` (le présent rapport est ajouté par le commit suivant).

```
2b6c91d  ci: write the build's own signing fingerprint so the app actually starts
98957b1  ci: diagnose why the shell could not be measured instead of guessing
619780a  ui: finish tokenising the shelf renderer - zero raw dp conversions left
e91de19  ci: drive the UI metrics run from a path-scoped push trigger
0091754  test: verify the rendered UI metrics on phone and tablet emulators
29a2eba  ui: match the WebView backdrops to the native shell palette
e172815  ui: adapt the home status card and quick tiles to the tablet
62be9cc  ui: adapt settings/profile rows and collection banners to the tablet
1d4011b  ui: add a real tablet layout - two-column player, four-column browse
1e8e42d  ui: adapt list rows to the tablet and lock the design system with tests
77fee86  ui: resolve shelf and section metrics from the design tokens
daa4398  ui: introduce Melodix design tokens and a real tablet metric set
```

Garanties respectées :

* base `c83d164`, dont `44902d9` est un ancêtre — **aucun commit perdu** ;
* **`main` (`81ef774`) inchangé** ;
* historique préservé, aucun rebase, aucun force-push ;
* **aucune version publiée**, aucun tag, **aucun secret utilisé** ;
* les assets générés (`assets/*.js`) n'ont **pas** été édités à la main — seule `css_hacks.css`, fichier source, a été modifiée ;
* la ressource de signature n'a été réécrite que dans la **copie temporaire du runner**, jamais dans le dépôt.

**Note d'environnement :** le poste de travail a été réinitialisé plusieurs fois en cours de session. Tout le travail était poussé ; seul un correctif non commité a dû être réappliqué. Aucun travail livré n'a été perdu.

---

## 11. Suites possibles

1. **Capturer les surfaces authentifiées** avec le runbook P0 sur les deux profils — lèverait la seule réserve du verdict.
2. **Bannière de collection en deux colonnes sur tablette**, sur le modèle du lecteur.
3. **Aligner `--mel-accent-deep`** et recalculer ses wash, avec contrôle rendu.
4. Étendre la mesure instrumentée aux surfaces authentifiées (cartes 190 dp, lecteur deux colonnes) une fois une session disponible.
5. Nettoyer le `dp()` mort dans `NativeSettingsRowFactory`.
