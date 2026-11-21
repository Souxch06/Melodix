# Contrôle qualité visuel et fonctionnel — Melodix

**Date :** 5 novembre 2026 · **Base :** `cc29b6c` (refonte UI close) · **Branche :** `arena/6b935c3e-melodix`

---

## 1. Verdict d'ensemble

L'interface est **inspectée sur appareil réel d'émulation, sur les deux profils**, et sept surfaces sur dix sont atteintes et visuellement saines. Les différences de disposition téléphone/tablette sont réelles, pas seulement dimensionnelles. Les quinzes commandes natives sont raccordées à une implémentation existante.

**Trois défauts sont démontrés. Un seul est partiellement traité, deux restent ouverts.** L'application **n'est pas déclarée prête à publier** : le lecteur, le mini-lecteur et tout le contenu Spotify n'ont jamais été observés, faute de session authentifiée.

Ce rapport distingue systématiquement *prouvé*, *corrigé*, et *non vérifié*.

## 2. Méthode et preuves

Aucune maquette, aucune simulation, aucune session Spotify simulée. Les seules preuves sont des captures et des relevés de hiérarchie de vues produits par la CI sur émulateur, puis **commités dans le dépôt** — les artefacts Actions ne sont pas téléchargeables depuis cet environnement (redirection vers un hôte hors liste d'autorisation).

| Run | Rôle | Résultat |
|---|---|---|
| `41982237746` | mesures de dimension post-refonte | 3 jobs SUCCESS |
| `41986397958` | premier parcours complet | captures publiées, 7 surfaces/profil |
| `41988054735` | sonde de ressources | échec : `PROFILE` non déclaré dans l'étape |
| `41988771073` | trace à critères discriminants | 2 défauts confirmés, 2 faux défauts de timing |
| `41989590342` | vérification après correctifs | timing corrigé, sonde publiée |
| `41990724746` | run final de référence | D2 et D3 confirmés, paquet innocenté |

Captures et relevés : `docs/audits/ui-qa-<run>/{phone,tablet}/` — `*.png`, `navigation-*.json`, `layout-*.json`, `resource-table.txt`.

Téléphone : 1080×2400 @420 dpi → 411 dp utiles. Tablette : 1600×2560 @320 dpi → 800 dp utiles.

## 3. Inspection visuelle, surface par surface

| # | Surface | Téléphone | Tablette | Observation |
|---|---|---|---|---|
| 1 | Accueil | saine | **défaut D1** | En-tête, bannière et onglets propres. Le vide central est l'état sans session, pas un défaut. Sur tablette la carte de statut est trop étroite (D1). |
| 2 | Bibliothèque | saine | saine | 4 filtres, gouttières cohérentes, état de chargement lisible. Libellés réels : Playlists, Albums, Artistes, **Podcasts**. |
| 3 | Playlists | **non atteinte** | **non atteinte** | Aucune playlist sans session. Non validée. |
| 4 | Albums / artistes | **non atteinte** | **non atteinte** | Dépend de la bibliothèque réelle. Non validée. |
| 5 | Lecteur principal | **bloqué** | **bloqué** | `blocked_no_session`. Jamais observé. |
| 6 | Mini-lecteur | **bloqué** | **bloqué** | `blocked_no_session`. Jamais observé. |
| 7 | Navigation | saine | saine | 3 onglets, onglet actif distingué en vert, aucune coupure. |
| 8 | Recherche | saine | saine | Grille **2×4** téléphone, **4×2** tablette. Champ clair **volontaire** (Spotify fait de même en thème sombre) : vérifié avant de le signaler. |
| 9 | Profil / paramètres | **défaut D1** | **défaut D1** | Ligne d'erreur « Paramètres indisponibles » + Réessayer. Hauteur de ligne identique sur les deux profils alors que le jeton tablette diffère (D1). |
| 10 | Connexion / chargement | saine | saine | Bannière « Connexion à Spotify… », texte lisible, aucune superposition avec le shell natif. |

Aucune coupure, aucun chevauchement, aucune cible tactile sous 48 dp, aucune vue hors champ : les 18 rapports `layout-*.json` du run final signalent **0 défaut** de ces quatre familles. Les contrastes et les marges ont été contrôlés à l'œil sur les captures, puis mesurés en pixels quand un doute subsistait.

## 4. Parcours de navigation

Verdicts du run `41989590342`, identiques sur les deux profils :

| Étape | Verdict |
|---|---|
| Accueil | `reached` |
| Accueil → Bibliothèque | `reached` |
| Bibliothèque → Recherche | `reached` |
| Recherche → tuile de genre | `reached` — **portée limitée**, voir ci-dessous |
| Navigation → Paramètres | `reached` |
| Paramètres → retour | **`wrong_screen`** (D2) |
| Retour → Accueil | **`wrong_screen`** (D3) |
| Mini-lecteur | `blocked_no_session` |
| Lecteur principal | `blocked_no_session` |

**Bibliothèque → playlist → lecteur : parcours impossible à tester sans session.** Il est câblé (section 5) mais son déroulement réel n'est pas vérifié.

**Tuile de genre :** l'appui est délivré et le shell y survit, mais la capture montre la grille inchangée et le champ toujours vide. « reached » ne signifie donc **pas** que des résultats sont apparus : `searchMediaItems` exige une session. La réserve est désormais portée par le fichier de trace lui-même (`scope_note`), pas seulement par ce rapport.

## 5. Audit fonctionnel — chaque commande est-elle raccordée ?

Outil répétable : `scripts/ui_wiring_audit.py`. Il suit la chaîne complète `android:onClick` → handler `MainActivity.smali` → `window.<fn>` injecté → définition dans `scripts/*.source.js`, sur les **deux** dispositions.

**15 commandes : 10 câblées, 2 natives, 3 de navigation, 0 partiellement raccordée, 0 absente.**

| Commande | Classement | Implémentation atteinte |
|---|---|---|
| Accueil | câblée | `__sfNativeRequestHome` |
| Bibliothèque | câblée | `__sfOpenLibrary` |
| Filtre de bibliothèque | câblée | `__sfOpenLibraryCategory` |
| Validation de recherche | câblée | `__sfSubmitSearch`, `searchMediaItems` |
| Lecture / pause | câblée | `__sfTogglePlayback`, `__sfMarkUserPlaybackIntent`, `actPlayPause` |
| Suivant / précédent | câblée | `__sfSkip` |
| Aléatoire | câblée | `actShuffle` |
| Répétition | câblée | `actRepeat` |
| Ligne de playlist / album | câblée | `__sfOpenCollection`, `__sfNativeOpenUri` |
| Interrupteur de paramètre | câblée | `__sfToggleSpotifySetting` |
| Tuile de genre | native | `performNativeLiveSearch` → `searchMediaItems` |
| Bouton Paramètres | native | `openNativeSettings` → `beginNativeSettingsLoad` |
| Onglet Recherche | navigation | `setNativeScreen` |
| Retour (flèche interne) | navigation | `setNativeScreen` |
| Agrandir le lecteur | navigation | `setNativeScreen` |

Un handler qui ne fait que changer d'écran est classé **navigation**, jamais « câblé » : retour et agrandissement ne contactent pas Spotify.

**Limite explicite :** cet audit est **statique**. Il prouve que la chaîne existe, pas que Spotify l'honore à l'exécution. Le classement « opérationnel en conditions réelles » relève du protocole authentifié (section 8).

Piège rencontré : `window.__sfGetPlaybackSnapshot` est défini par `window.X = getPlaybackSnapshot`, non par `window.X = function`. Une recherche trop étroite concluait à tort à 8 fonctions manquantes.

## 6. Différences réelles téléphone / tablette

Confirmées **visuellement**, pas seulement par les jetons :

- **Recherche : grille 2×4 téléphone, 4×2 tablette** — visible sur les captures.
- `layout-sw600dp` est donc bien sélectionné, ce qui rend le défaut D1 d'autant plus net.
- Barre d'onglets 64 → 76 dp, onglets 58 → 68 dp, bouton d'en-tête 48 → 52 dp (mesures du run `41982237746`).
- Gouttière XML 16 → 32 dp, mesurée à 32 dp sur les captures tablette.
- Lecteur **2 colonnes** sur tablette : **non vérifié**, le lecteur n'a jamais été atteint.

## 7. Défauts démontrés et corrections

### D1 — Les jetons résolus à l'exécution restent à leur valeur téléphone · **OUVERT**

Mesuré sur les pixels, trois fois, par des chemins indépendants :

| Grandeur | Téléphone | Tablette mesurée | Jeton tablette attendu |
|---|---|---|---|
| Hauteur de ligne de paramètres | 63,6 dp | **64,0 dp** | 76 dp |
| Largeur de la carte de statut | 379 dp | **559,5 dp** | 720 dp |
| Gouttière runtime (padding de ligne) | 13,7 dp | **14,0 dp** | 32 dp |

Chaque valeur tablette vaut exactement la **constante de repli** de l'accesseur. La gouttière est le juge de paix : le **même jeton** `mel_gutter` donne 32 dp via XML et ~16 dp via le chemin runtime, sur le même écran.

**Cause — empaquetage innocenté.** `resource-table.txt` (run `41989590342`, `aapt2 dump resources` sur l'APK réellement installé) prouve que les noms **et** les deux configurations sont présents et corrects :

```
resource 0x7f0700b9 dimen/mel_settings_row_height
  () 64.000000dp
  (sw600dp) 76.000000dp
```

Une référence XML est compilée en identifiant numérique et n'a pas besoin du nom à l'exécution ; `Resources.getIdentifier()` en a besoin. La panne est donc dans **la résolution à l'exécution**, pas dans le build.

**Second suspect écarté** (run `41990724746`) : le paquet de la table de ressources et le paquet du manifeste **coïncident** —

```
--- resource table package
Package name=com.melodix.music id=7f
--- manifest package
com.melodix.music
```

`getIdentifier(nom, "dimen", getPackageName())` ne peut donc pas échouer pour cause de paquet divergent.

**Où cela laisse D1 :** les trois causes côté empaquetage sont éliminées (nom absent, valeur sw600dp absente, paquet divergent). Ce qui reste est côté exécution — soit `getIdentifier` échoue pour une raison non encore observée, soit le `Context` transmis aux accesseurs ne porte pas la configuration sw600dp. Trancher exige un relevé **sur l'appareil** de la valeur retournée par `getIdentifier` et de la configuration du `Context`, c'est-à-dire du code de diagnostic dans le résolveur. Je ne l'ai pas ajouté sans autorisation.

**Pourquoi la refonte est passée à travers :** les 67 accesseurs ont un repli **égal** au jeton téléphone. Le téléphone ne pouvait donc structurellement pas révéler la panne. Vérifié : aucun accesseur n'a un repli divergent.

**Non corrigé**, volontairement : la cause n'est pas encore identifiée, et un correctif deviné serait une régression de plus.

### D2 — La touche système Retour ne quitte pas les paramètres · **OUVERT, autorisation requise**

`back-from-settings` et `settings` produisent des captures **identiques octet pour octet** sur les deux profils. Après `KEYCODE_BACK` suivi de **8 secondes** d'attente, la flèche de retour est toujours présente et le titre n'est pas « Accueil ».

La flèche interne (`onNativeBackClick`) est câblée ; la touche système ne l'est pas.

**Non corrigé :** cela touche la gestion du retour Android. J'ai la preuve du problème, pas l'autorisation d'y toucher.

### D3 — Le contenu des paramètres survit sur l'accueil · **PARTIELLEMENT TRAITÉ, symptôme persistant**

Après bascule sur Accueil, le titre et l'onglet passent à « Accueil » mais la ligne « Paramètres indisponibles » reste affichée. Détecté par `forbidden_chrome`, confirmé après 6 s d'attente.

**Correctif appliqué :** `renderNativeRows()` vide le conteneur partagé, mais les drapeaux d'attachement de l'accueil n'étaient remis à zéro que par `beginNativeHomeRender()`, appelée uniquement depuis le rendu de l'accueil. Rendre les paramètres laissait `nativeHomeStatusAttached` à vrai. J'ai ajouté l'appel à cette méthode **existante** sur la branche non-accueil — une instruction, `.locals` inchangé à 10.

**Résultat honnête : le run de vérification montre que le symptôme persiste.** L'invariant restauré est réel et nécessaire, mais il ne suffit pas : sans session, revenir sur Accueil ne déclenche aucun nouveau rendu, donc rien ne remplace les lignes étrangères. Le correctif est conservé — il est correct en soi et gardé par test — mais **D3 n'est pas fermé**.

### Défauts de mon outillage, corrigés

- **Faux vert de la trace.** `back-from-settings` et `home-again` n'exigeaient que `nativeRoot`, `nativeTabBar`, `nativeHomeTab` — visibles sur **tous** les écrans natifs, paramètres compris. Ces étapes ne pouvaient pas échouer. Ajout de `forbidden`, `title_is`, `forbidden_chrome` et du verdict `wrong_screen`. C'est ce qui a révélé D2 et D3.
- **Faux défaut de timing.** Le premier run tablette annonçait Bibliothèque et Recherche `not_reached` avec 15 vues visibles : dump pris pendant la transition. Ajout de `settle()`, attente bornée sur la vue qui définit l'écran. Les deux étapes sont `reached` au run suivant. **Ces deux « défauts » n'ont jamais été rapportés comme applicatifs.**
- **Sonde non publiée**, puis **`PROFILE` non déclaré** dans son étape (`set -u` tuait avant le `mkdir`). Corrigés ; la sonde est non bloquante.
- **Fuite potentielle évitée :** le texte réel des vues n'est jamais echo, ni dans le journal ni dans la trace publiée. Un test injecte un nom de compte et vérifie qu'il ne sort nulle part.

## 8. Session Spotify authentifiée — protocole prêt, non exécuté

`docs/audits/melodix-qa-manual-authenticated-protocol-2026-11-05.md`

Deux passes (`qa-avant` / `qa-apres`), les 10 surfaces avec critères OK / défaut / non testé, et la **synchronisation inter-écrans en 5 étapes** — le point que les captures seules ne montrent pas.

**Aucun identifiant ne m'est demandé et aucun ne doit transiter.** La seule saisie se fait sur l'écran de votre appareil, dans la page Spotify. Ne renvoyez jamais mot de passe, cookie, jeton, ni capture de l'écran de connexion.

Ce protocole exige un appareil que vous contrôlez : la CI ne peut pas offrir de saisie interactive.

## 9. Tests exécutés

- **Suite complète : 672 tests, 669 pass, 0 échec, 3 ignorés.** Les 3 ignorés sont des tests JVM : aucun compilateur Java local. Ils ne sont **jamais** comptés comme réussis.
- Nouveaux outils : `ui_wiring_audit.py` (6 tests), `ui_layout_audit.py` + `ui_qa_trace.py` + sonde (29 tests), `ui_screen_state.test.js` (5 tests).
- 5 runs CI sur émulateur, deux profils à chaque fois, même APK.

## 10. Ce qui reste à faire

1. **D1** — les trois causes d'empaquetage sont éliminées. Prochaine étape : relevé sur appareil de la valeur retournée par `getIdentifier` et de la configuration du `Context` passé aux accesseurs. **Autorisation nécessaire** car cela ajoute du diagnostic dans le résolveur de métriques.
2. **D2** — decidir du traitement de la touche retour Android. **Autorisation nécessaire.**
3. **D3** — traiter la persistance du contenu étranger lors d'un changement d'écran sans nouveau rendu.
4. **Session authentifiée** — exécuter le protocole manuel : lecteur, mini-lecteur, playlists, albums, pochettes, synchronisation.
5. **Publication** — signature de production, politique de confidentialité, exigences du store : hors périmètre, non traités.

## 11. État du dépôt

Branche `arena/6b935c3e-melodix`. `main` inchangé. Chaîne de cette phase :

`cc29b6c` → `0fb8275` audit de câblage + protocole → `7b1d01d` sonde de ressources → `ee77cae` trace discriminante → `f2e3e93` invariant de rendu → `142a2f4` attente bornée + publication de la sonde → `9228793` rapport → commit de mise à jour ci-présent.

Run de référence pour rejouer le contrôle : **`41990724746`**. Ses deux seuls échecs sont D2 et D3 ; toutes les autres étapes sont `reached` ou `blocked_no_session`, sur les deux profils.
