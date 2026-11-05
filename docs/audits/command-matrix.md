# Matrice des 15 commandes — run `42031794726`

Générée par `scripts/ui_command_matrix.py` : croisement du câblage statique
et des verdicts **observés** par le parcours sur appareil. Un bouton présent
n'est jamais déclaré fonctionnel sans résultat visible vérifié.

| # | Commande | Composant porteur | Fonction appelée | Couche atteinte | Conditions | Résultat observé (tél / tab) | État |
|---|---|---|---|---|---|---|---|
| 1 | Onglet Accueil | `nativeHomeTab` | `onNativeHomeClick` | wired → `__sfNativeRequestHome` | aucune | reached / reached | **1 — Opérationnelle, vérifiée sur appareil** |
| 2 | Onglet Bibliothèque | `nativeLibraryTab` | `onNativeLibraryClick` | wired → `__sfOpenLibrary` | session pour le contenu | reached / reached | **3 — En attente de session authentifiée** |
| 3 | Onglet Recherche | `nativeSearchTab` | `onNativeSearchClick` | navigation → `renderNativeRows,setNativeScreen` | aucune | reached / reached | **1 — Opérationnelle, vérifiée sur appareil** |
| 4 | Bouton Paramètres | `nativeSettingsButton` | `onNativeSettingsClick` | native → `openNativeSettings` | aucune pour l'écran | reached / reached | **1 — Opérationnelle, vérifiée sur appareil** |
| 5 | Retour interne (flèche) | `nativeBackButton` | `onNativeBackClick` | navigation → `renderNativeRows,setNativeScreen` | écran poussé | reached / reached | **1 — Opérationnelle, vérifiée sur appareil** |
| 6 | Retour système Android | `touche KEYCODE_BACK` | `onNativeBackClick` | navigation → `renderNativeRows,setNativeScreen` | écran poussé ou onglet racine | reached / reached | **1 — Opérationnelle, vérifiée sur appareil** |
| 7 | Filtre de bibliothèque | `nativeLibraryCategories` | `onNativeLibraryCategoryClick` | wired → `__sfOpenLibraryCategory` | session | reached / reached | **3 — En attente de session authentifiée** |
| 8 | Tuile de genre | `nativeGenreScroll` | `onNativeGenreClick` | native → `applyNativeUiData,performNativeLiveSearch` | session pour les résultats | reached / reached | **3 — En attente de session authentifiée** |
| 9 | Validation de recherche | `nativeSearchInput` | `onNativeSearchSubmit` | wired → `__sfSubmitSearch,searchMediaItems` | session | aucune étape / aucune étape | **3 — En attente de session authentifiée** |
| 10 | Ligne playlist / album | `nativeContent` | `openNativeRow` | ? → `?` | session | aucune étape / aucune étape | **3 — En attente de session authentifiée** |
| 11 | Lecture / pause | `nativePlayerPlayPauseButton` | `onNativePlayPauseClick` | wired → `__sfGetPlaybackSnapshot,__sfMarkUserPlaybackIntent,__sfTogglePlayback,actPlayPause,pBtn,playing` | session + piste | blocked_no_session / blocked_no_session | **3 — En attente de session authentifiée** |
| 12 | Suivant | `nativePlayerNextButton` | `onNativePlayerNextClick` | wired → `__sfSkip` | session + file | blocked_no_session / blocked_no_session | **3 — En attente de session authentifiée** |
| 13 | Précédent | `nativePlayerPreviousButton` | `onNativePlayerPreviousClick` | wired → `__sfSkip` | session + file | blocked_no_session / blocked_no_session | **3 — En attente de session authentifiée** |
| 14 | Aléatoire / répétition | `nativePlayerShuffleButton` | `onNativePlayerShuffleClick` | wired → `actShuffle` | session + piste | blocked_no_session / blocked_no_session | **3 — En attente de session authentifiée** |
| 15 | Agrandir le lecteur | `nativeMiniPlayer` | `onNativePlayerExpandClick` | navigation → `setNativeScreen` | session + piste | blocked_no_session / blocked_no_session | **3 — En attente de session authentifiée** |

## Répartition

- **1 — Opérationnelle, vérifiée sur appareil** : **5**
- **2 — Câblée, résultat non vérifié** : **0**
- **3 — En attente de session authentifiée** : **10**
- **4 — En échec** : **0**
- **5 — Non testée** : **0**

## Limite explicite

Les commandes marquées « en attente de session » ont un câblage confirmé et,
pour certaines, un appui délivré, mais **aucun résultat musical observé**.
Elles ne sont pas déclarées fonctionnelles. La validation se fait via
`melodix-authenticated-validation-matrix.md`, connexion manuelle par l'utilisateur.
