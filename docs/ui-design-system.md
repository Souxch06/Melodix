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
| 4. Lecteur plein écran | **fait** |
| 3. Barre du haut | à faire |
| 5. Mini-lecteur | à faire (verre d'abord, réduction ensuite) |
| 6. Barre d'onglets (`#sf-mobile-nav`) | à faire |
| 7. Tiroir bibliothèque | à faire |
| 8. Parties natives | palette déjà alignée ; icône/splash/notification restent |
| 9. Mode clair | optionnel, non commencé |

## 6. Vérifications automatiques

- `tests/css_theme_integrity.test.js` : palette unique, aucun cycle de variables,
  contraste AA, pas de thème clair accidentel.
- `tests/smali_sanity.test.js` : parité CSS ↔ natif, aucune couleur brute dans le
  corps de la feuille.
- `tests/mel_design_system.test.js` : `--mel-bg`, `--mel-bg-2`, `--mel-accent`
  identiques à `colors.xml`.
