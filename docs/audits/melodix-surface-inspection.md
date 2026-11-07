# Inspection des surfaces — base post-`metric()`

Mesures issues des **bornes réelles** du dump (`layout-*.json`), jamais d'une estimation sur capture. Comparaisons produites par `scripts/ui_surface_diff.py`.

## Couverture

| # | Surface | Téléphone | Tablette | Composants mesurés | Défauts |
|---|---|---|---|---|---|
| 1 | Accueil | ✓ | ✓ | carte statut, en-tête, barre d'onglets | 0 |
| 2 | Bibliothèque | ✓ | ✓ | 4 filtres, texte d'état, en-tête | 0 |
| 3 | Recherche | ✓ | ✓ | champ, bouton, grille de genres | 0 |
| 4 | Résultats de genre (appui tuile) | ✓ | ✓ | appui délivré, écran Recherche conservé | 0 |
| 5 | Paramètres | ✓ | ✓ | ligne d'état, gouttière, flèche retour | 0 |
| 6 | Retour depuis paramètres | ✓ | ✓ | shell, titre, absence de flèche | 0 |
| 7 | Retour depuis onglet racine | ✓ | ✓ | shell, titre Accueil | 0 |
| 8 | Reprise après arrière-plan | ✓ | ✓ | shell, onglets, premier plan | 0 |
| 9 | **Lecteur plein écran** | **bloqué** | **bloqué**| — | — |
| 10 | **Mini-lecteur** | **bloqué** | **bloqué** | — | — |

**8 surfaces sur 10 inspectées sur les deux profils.** Les surfaces 9 et 10 exigent une session authentifiée : elles restent explicitement en attente, jamais déclarées inspectées.

Les playlists et albums ne sont pas des surfaces séparées atteignables sans session : leur contenu est celui de la bibliothèque et du détail de collection, couverts par la matrice authentifiée.

## Régression introduite par `metric()` — mesurée, pas supposée

Comparaison `42008408954` (avant) → `42022211867` (après), artefact `surface-diff-metric-fix.json`.

**Téléphone — aucune régression.** Un seul déplacement, voulu :

| Composant | Avant | Après |
|---|---|---|
| Ligne de paramètres, largeur | 411,4 dp | **379,4 dp** (gouttière 16 dp) |
| Ligne de paramètres, x | 0 dp | **16 dp** |
| Hauteur des cartes | 126,1 / 190,1 dp | 126,9 / 190,9 dp (+0,8 dp de padding) |

`library`, `search` et `browse-tile` : **strictement inchangés**.

**Tablette — les surcharges s'appliquent enfin, tout est voulu :**

| Composant | Avant | Après |
|---|---|---|
| Carte de statut, largeur | 560 dp (repli) | **720 dp** (jeton) |
| Carte de statut, x | 120 dp | **40 dp** |
| Hauteur carte Accueil | 127 dp | 134,5 dp |
| Hauteur carte autres écrans | 174,5 dp | 208,5 dp |
| Ligne de paramètres, largeur | 800 dp (plein bord) | **736 dp** (gouttière 32 dp) |
| Ligne de paramètres, hauteur | 66 dp | **80 dp** |

**0 défaut de mise en page avant et après**, sur les 15 étapes des deux profils : aucun chevauchement, débordement ni cible tactile trop petite introduit.

## Lacune de mesure trouvée et corrigée

`nativeGenreScroll` n'exposait qu'**un** enfant : un conteneur. Les tuiles de genre sont des petits-enfants et n'étaient **jamais mesurées** — le composant principal de Recherche était invisible à l'audit. `container_items_deep` parcourt désormais les descendants jusqu'à profondeur 3, avec un chemin stable permettant le diff, **sans enregistrer aucun texte**.

## Non-défaut écarté avec preuve : `--mel-accent-deep`

La divergence relevée précédemment entre CSS (`#1db954`) et natif (`#0e8f47`) **n'est pas un défaut**. Les deux jetons partagent un nom mais pas un rôle :

| Couleur | sur `#060809` | sur `#10151a` | Usage réel |
|---|---|---|---|
| `#1db954` (CSS) | **7,76:1** | **7,1:1** | couleur de texte, anneau de focus |
| `#0e8f47` (natif) | 4,82:1 | **4,4:1** | `colorPrimaryVariant`, décoratif |

Aligner le CSS sur le natif ferait passer le texte **sous le seuil WCAG AA de 4,5:1**. Aucune modification n'est faite : ce serait une régression d'accessibilité déguisée en harmonisation. Retiré de la liste des restes.
