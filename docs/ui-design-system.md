# Melodix — design system « liquid glass »

Version 1.3.0. Complète `docs/ui-audit.md` (constat) : ce document dit **quoi**
utiliser et **pourquoi**, avec la liste des sélecteurs dont dépend chaque règle.

## 1. Couleurs

Tout vient de l'unique `:root` de `assets/css_hacks.css`. Aucune couleur brute
n'est autorisée hors de cette racine (vérifié par `tests/smali_sanity.test.js`).

| Token | Valeur | Rôle |
|---|---|---|
| `--mel-bg` | `#0b0b14` | fond de page, identique au natif `mel_background` |
| `--mel-bg-2` | `#141222` | surface de page, identique au natif `mel_surface` |
| `--mel-glow-a` / `-b` | `#3B1D7A` / `#6B1A55` | lueurs radiales fixes du fond |
| `--mel-text` | `#F5F5FA` | texte principal (18.0:1 sur `--mel-bg`) |
| `--mel-text-2` / `--mel-text-dim` | `#A1A1B5` | texte secondaire (7.7:1) |
| `--mel-accent-a` / `-b` | `#7C3AED` / `#DB2777` | **dégradé de marque**, utilisé en fond |
| `--mel-accent` | `#a78bfa` | **accent lisible** (texte, icônes, traits) |
| `--mel-text-on-accent` | `#ffffff` | texte posé sur le dégradé |

### Pourquoi deux valeurs d'accent

`#7C3AED` sur `#0b0b14` ne donne que **3.52:1**, sous le seuil AA de 4.5.
Il est donc réservé aux **fonds** (blanc dessus : 5.70:1). Pour du texte ou une
icône posée sur le fond sombre, c'est `#a78bfa` (7.20:1). Les tests imposent
`contrast(--mel-bg, --mel-accent) >= 4.5` : c'est ce qui force cette séparation.

## 2. Spécification du verre

Une surface de verre = quatre couches :

```css
background-color: var(--mel-glass-bg);        /* rgba(255,255,255,.07) */
border: 1px solid var(--mel-glass-border);    /* rgba(255,255,255,.14) */
box-shadow: var(--mel-glass-shadow);          /* inset 0 1px 0 rgba(255,255,255,.18) */
backdrop-filter: blur(var(--mel-glass-blur)) saturate(var(--mel-glass-saturate));
```

- **Repli sans flou** : `@supports not (backdrop-filter: blur(1px))` bascule sur
  `--mel-glass-fallback-bg` (quasi opaque). Obligatoire : WebView API 24-28.
- **Désactivation** : `body.mx-glass-off` rend toutes les surfaces opaques.
  Aucun réglage ne pose la classe aujourd'hui ; le hook existe.
- **Périmètre** : barre du haut, mini-lecteur, barre d'onglets, lecteur plein
  écran, menus. **Jamais** sur une zone de défilement longue.

## 3. Rayons et ombres

| Token | Valeur | Usage |
|---|---|---|
| `--mel-radius-card` | 24px | cartes |
| `--mel-radius-art` | 16px | pochettes, lignes de pistes |
| `--mel-radius-pill` | 999px | chips, pastilles, barre d'onglets |
| `--mel-radius-sheet` | 28px | panneaux, lignes de contrôles |

## 4. Composants et sélecteurs

Chaque ligne indique **ce qui casse si Spotify renomme le sélecteur** : la règle
cesse de s'appliquer, rien d'autre. L'app reste utilisable, moins stylée.

| Composant | Sélecteurs | Fragilité |
|---|---|---|
| Chips de filtres | `[data-testid="chip"]`, `[data-encore-id="chip"]`, `#main-view [role="tablist"] [role="tab"]` | moyenne : trois variantes couvrent les versions connues |
| Cartes | `[data-testid="card"]`, `[data-testid="card-title"]`, `[data-encore-id="cardSubtitle"]` | faible : `data-testid="card"` est stable depuis des années |
| Lignes de pistes | `[data-testid="tracklist-row"]` | faible |
| Titres de sections | `[data-testid="component-shelf"] > div > h2`, `[data-encore-id="shelfHeader"]` | **élevée** : dépend de la profondeur du DOM ; repli visuel acceptable |
| Lecteur plein écran | `#sf-fs-player`, `#sf-fs-bg`, `#sf-fs-art`, `#sf-fs-title`, `#sf-fs-bar-rail`, `#sf-fs-bar-fill`, `.sf-fs-play`, `.sf-fs-extra-controls` | **nulle** : DOM construit par notre bridge |
| Titres d'accueil | `#main-view h1`, `#main-view h2` | faible, confiné à `#main-view` |

## 5. État d'avancement

| Étape | État |
|---|---|
| 1. Thème global | **fait** |
| 2. Accueil, cartes, listes, chips | **fait** |
| 3. Barre du haut | **fait** (section 10.10) |
| 4. Lecteur plein écran | **fait** (section 10.9) |
| 5. Mini-lecteur | **fait** — verre d'abord, rien de masqué (section 10.11) |
| 6. Barre d'onglets (`#sf-mobile-nav`) | **fait** (section 10, dock 68 px / onglets 34 px) |
| 7. Tiroir bibliothèque | **fait** (section 10.12) |
| 8. Parties natives | **fait** : palette, barres système, splash, icône adaptative, notification |
| 9. Mode clair | optionnel, non commencé |

## 6. Vérifications automatiques

- `tests/css_theme_integrity.test.js` : palette unique, aucun cycle de variables,
  contraste AA, pas de thème clair accidentel.
- `tests/smali_sanity.test.js` : parité CSS ↔ natif, aucune couleur brute dans le
  corps de la feuille.
- `tests/mel_design_system.test.js` : `--mel-bg`, `--mel-bg-2`, `--mel-accent`
  identiques à `colors.xml`.

## 7. La pile tactile (une seule source de vérité)

Les six valeurs ci-dessous, déclarées dans l'unique `:root`, gouvernent
**tous** les décalages du bas de l'écran. Aucun littéral ne subsiste : dock,
mini-lecteur, tiroir bibliothèque, réserve de contenu `#main-view` et vue
d'accueil maison sont calculés à partir d'elles.

| Token | Valeur | Usage |
|---|---|---|
| `--sf-dock-h` | `68px` | hauteur de la barre d'onglets |
| `--sf-mini-gap` | `10px` | respiration entre dock et mini-lecteur |
| `--sf-mini-h` | `68px` | hauteur du mini-lecteur |
| `--sf-stack-gap` | `4px` | respiration au-dessus du mini-lecteur |
| `--sf-dock-inset` | `16px` | marge latérale de la pilule (deux fois, une par bord) |
| `--sf-dock-lift` | `24px` | décollement de la pilule par rapport au bord |

Empilement (vérifié par `tests/mel_glass_theme.test.js`) :

```
contenu + scrim 10004 < tiroir 10005 < dock 10010 < mini-lecteur 10015 < SF 100000
```

`tests/mobile_ui.test.js` et la feuille de repli injectée par le bridge
utilisent les mêmes tokens et les mêmes valeurs de repli ; changer une hauteur
ne demande donc qu'une seule édition.

## 8. La recette du verre, appliquée

| Surface | Section | Verre | Rayon |
|---|---|---|---|
| Barre du haut | 10.10 | `--mel-glass-scrim` + blur 24 px | pilule pour les boutons, 999 pour la recherche |
| Mini-lecteur | 10.11 | `--mel-glass-scrim` + blur 24 px | 28 px |
| Barre d'onglets | SECTION 10 tactile | `--mel-glass-scrim` + blur 24 px | 34 px par onglet |
| Tiroir bibliothèque | 10.12 | `--mel-glass-scrim` + blur 24 px | 28 px en haut, carré en bas |

`--mel-glass-scrim` (`rgba(11, 11, 20, 0.62)`) n'est pas un joli gris : sur une
pochette blanche, il laisse encore `#F5F5FA` à **5.1:1**. C'est ce qui autorise
le verre sur du contenu que nous ne contrôlons pas.

Le flou n'est appliqué qu'à ces quatre surfaces (jamais à une zone qui défile) ;
un test échoue si un autre sélecteur reçoit `backdrop-filter: blur`.

## 9. La barre d'onglets : une pilule, pas un rail

La barre est une **pilule de verre flottante**, pas une bande collée au bord.

| Propriété | Valeur | Pourquoi |
|---|---|---|
| `left` + `transform` | `50%` + `translateX(-50%)` | centrée quelle que soit la largeur |
| `width` | `calc(100vw - 2 * --sf-dock-inset)` | 16 px de chaque côté |
| `max-width` | `560px` | sur tablette elle ne s'étire pas |
| `height` | `--sf-dock-h` (**68 px**) | la hauteur *ne contient plus* la safe-area |
| `bottom` | `calc(--sf-dock-lift + safe-area)` | elle décolle de 24 px |
| `border-radius` | `34px` | exactement la moitié de la hauteur |
| Onglet | `min-height: 44px`, rayon `34px` | cible tactile garantie, forme en pilule |
| Onglet actif | dégradé d'accent + `--mel-text-on-accent` | libellé toujours visible, jamais masqué |

Conséquences, toutes vérifiées par un test :

- **rien ne passe derrière la pilule** : mini-lecteur, tiroir, réserve de
  défilement et vue d'accueil sont décalés de `--sf-dock-lift` **en plus** de
  la pile. Un test parcourt chaque règle `position: fixed` de la barre et exige
  le centrage, le plafond et une largeur dérivée de `--sf-dock-inset` ;
- **une seule source de style** : le rail pleine largeur (`100vw`, `bottom: 0`,
  `inset-inline: 0`) n'existe plus nulle part, y compris dans la feuille de
  repli injectée par le bridge ;
- **la navigation reste en paysage** : elle n'est jamais masquée par une media
  query. Le seul `display: none` légitime est le garde clavier
  (`body.sf-keyboard-open`, < 820 px) et le parking initial avant que le shell
  existe. Un test échoue si une media query la cache sur un appareil tactile ;
- **cibles tactiles** : onglet ≥ 44 px de haut, boutons d'en-tête ≥ 44×44
  (largeur en `min-width`, pour qu'une icône plus longue ne soit jamais
  rognée) ;
- **téléphone en paysage très bas** (≤ 400 px de haut) : le lecteur plein écran
  repasse en colonne et la pochette est plafonnée à `38vh` — rien n'est coupé.

## 10. La carte d'erreur native (MEL-BUG-083)

La carte « Connexion Spotify à vérifier » est la première chose qu'un
utilisateur non connecté voit. Elle doit ressembler à un message, pas à un
rapport de crash.

| Élément | Spécification |
|---|---|
| Icône | pastille d'avertissement (`MelColors.warning` **uniquement** sur l'icône) |
| Titre | 19 sp, `--mel-text` |
| Message | **une phrase**, 14 sp, texte secondaire |
| Action primaire | « Se connecter », dégradé d'accent, blanc dessus (5.70:1) |
| Action secondaire | « Réessayer », recette du verre (`native_button_dark`) |
| Détails techniques | divulgation **fermée par défaut**, 12 sp, `#A1A1B5` (6.98:1 sur la carte), monospace |
| Copier le diagnostic | bouton verre, 44 dp, réutilise `onNativeDiagCopyClick` (un seul chemin de copie) |

Règles tenues par des tests :

- **plus aucun rouge pleine taille** : `MelColors.warning` n'apparaît plus dans
  la carte ; le texte machine n'est plus la deuxième chose qu'on lit ;
- la découpe du suffixe ` [auth=…]` hors de la phrase est **conservée** (c'est
  elle qui rend le message lisible), mais le suffixe va dans la divulgation ;
- la divulgation bascule la visibilité de deux `TextView` — aucun rebuild, donc
  aucun lag perceptible ; une animation optionnelle de 120 ms (alpha +
  translation de 2 %) explique le changement sans toucher au layout. Elle est
  résolue **par nom** (`NativeUiRowFactory.animId`) et le retour `0` est testé :
  un id codé en dur casserait au prochain rebuild ;
- la marge de la divulgation est un token (`mel_status_disclosure_gap`,
  8 dip téléphone / 12 dip tablette) dont le repli smali égale la valeur
  téléphone, donc une ressource manquante est inerte.
