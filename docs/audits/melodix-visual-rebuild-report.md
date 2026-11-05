# Reconstruction visuelle Melodix — rapport de cycle

**Branche** `arena/6b935c3e-melodix` · **Référence acceptée** `f9399b2` (run `42031794726`)
**Dernier run validé** `42065755408` — **5/5 SUCCESS**, 19 étapes, **0 défaut réel**, **0 plantage**, 2 profils
**Suite** 740 tests, **737 pass, 0 fail, 3 skip** (les 3 règles JVM exigent `javac`, absent du bac à sable ;
elles tournent en CI, où le job unitaires est vert)

> Statut de preuve : les chiffres ci-dessous viennent de dumps `uiautomator` et de captures publiées
> par la CI sur les deux profils. Une compilation n'est pas une validation appareil ; les écrans non
> atteignables sans session sont déclarés non inspectés, pas « réussis ».

---

## 1. Écrans réellement reconstruits

| # | Surface | État | Preuve |
|---|---|---|---|
| 1 | **Accueil** | **Reconstruit, vérifié 2 profils** | Grille « Explorer Melodix » : 3 tuiles distinctes, agencement téléphone ≠ tablette |
| 2 | **Bibliothèque** | **Reconstruit, vérifié 2 profils** | État vide tokenisé : icône + titre + sous-titre, gouttière respectée |
| 3 | Recherche + tuiles de genres | Inspecté, **non modifié** | Déjà abouti : 8 tuiles, 2 colonnes tél / 4 tablette. Aucune modification apportée |
| 4 | Playlists | **Bloqué sans session** | Onglets présents et visuellement cohérents ; contenu non atteignable |
| 5 | Albums / artistes | **Bloqué sans session** | Idem |
| 6 | Lecteur principal | **Bloqué sans session** | `nativePlayerPanel` absent du dump ; non déclaré inspecté |
| 7 | Mini-lecteur | **Bloqué sans session** | `nativeMiniPlayer` absent du dump ; non déclaré inspecté |
| 8 | Profil | Inspecté antérieurement | Voir `melodix-surface-inspection.md` |
| 9 | Paramètres | Inspecté,inchangé | Correctifs `metric()` et gouttière préservés |
| 10 | États vide / chargement / erreur | **Partiellement reconstruit** | État vide bibliothèque reconstruit ; chargement et erreur héritent du même composant |

**Deux surfaces réellement reconstruites et validées sur appareil**, pas dix. Les huit autres sont
inspectées, bloquées, ou déjà conformes. Le chantier n'est pas terminé.

## 2. Composants récupérés de la couche web thémée

- **Jetons de design** issus de `assets/css_hacks.css`, déjà traduits en `res/values*/dimens.xml` :
  `mel_gutter` 16→32 dp, `mel_gutter_half` 8→16, `mel_section_title` 20→24 sp, `mel_text_primary`,
  `mel_text_tertiary`, `mel_surface_btn`, `mel_accent`.
- **Icones vectorielles** `native_nav_home / search / library / settings`, réutilisées telles quelles
  pour les tuiles et l'état vide — aucun nouveau jeu d'icônes inventé.
- **Résolution par nom** : `Resources.getIdentifier(nom, type, paquet)`, imposée parce que drawables et
  couleurs ne sont **pas épinglés** dans `public.xml` (438 ids et 208 dimens le sont, eux).
- **Helpers natifs existants** : `NativeUiRowFactory.metric()` (avec le correctif `if-lez` intact) et
  `applyTextSize()`, qui portent l'échelle typographique tablette.

## 3. Nouveaux composants créés

| Fichier | Rôle |
|---|---|
| `NativeShortcutGrid.smali` | Grille de raccourcis. `render` / `addTile` / `createTile` / `resolveId`. Tablette détectée par `smallestScreenWidthDp >= 600` : icône **à côté** du libellé, tuile plus large et plus plate ; téléphone icône **au-dessus** |
| `NativeShortcutClickListener.smali` | Route les actions 0/1/2 vers `onNativeSearchClick` / `onNativeLibraryClick` / `onNativeSettingsClick` — handlers **réellement existants**, aucune navigation inventée |
| `NativeEmptyState.smali` | État vide unifié : `forMessage` choisit icône et sous-titre selon le message, `create` compose le bloc avec jetons, repli journalisé |

**Outillage durable ajouté** (ce n'est pas de l'interface, mais c'est ce qui a rendu la livraison possible) :

- `scripts/smali_register_check.py` — plage des registres, arité des invokes, indice ≤ v15 hors `/range`,
  type courant d'un registre (usage objet après réaffectation scalaire), et **registre non défini au
  retour d'un handler**.
- `scripts/android_signature_check.py` — table de signatures Android réelles. apktool assemble une
  référence de méthode sans la résoudre : une arité fausse compile et ne casse que sur l'appareil.
- `scripts/ui_qa_walk.sh` — collecte de `crash.txt` rendue **inconditionnelle**.

## 4. Captures téléphone et tablette

Publiées par la CI, run `42065755408` :

```
docs/audits/ui-qa-42065755408/phone/    home, library, search, settings, back-*, stress-*, …
docs/audits/ui-qa-42065755408/tablet/   idem
```

Avant reconstruction : `docs/audits/ui-qa-42031794726/{phone,tablet}/`.

## 5. Différences visuelles avant / après

Mesures issues de `container_items_deep` sur `nativeContent`, **pas estimées sur les captures**.

### Accueil

| Mesure | Téléphone avant → après | Tablette avant → après |
|---|---|---|
| Blocs de premier niveau | 1 → **3** | 1 → **3** |
| Descendants | 5 → **10** | 5 → **10** |
| Tuiles de raccourci | **0 → 3** | **0 → 3** |
| Taille d'une tuile | — → **118,9 × 66,3 dp** | — → **233,0 × 55,0 dp** |
| Agencement | — → icône **au-dessus** | — → icône **à côté** |

La tablette n'est pas un téléphone agrandi : la tuile est **plus large et moins haute**, et l'icône
change de position. C'est une composition différente, pas une mise à l'échelle.

### Bibliothèque — état vide

| Mesure | Téléphone avant → après | Tablette avant → après |
|---|---|---|
| Descendants | 1 → **3** | 1 → **3** |
| TextViews | 1 → **2** (titre + sous-titre) | 1 → **2** |
| Largeur du texte | 411,4 → **379,4 dp** | 800 → **736 dp** |
| Abscisse | 0 → **16 dp** | 0 → **32 dp** |

L'ancien état vide utilisait un padding de **24 pixels bruts** (9,1 dp téléphone / 12 dp tablette),
`setTextSize(16f)` et une couleur codée en dur : il ignorait la densité **et** l'échelle tablette.
Le nouveau respecte la gouttière et la hiérarchie typographique.

### Non-régression

`surface-diff-visual-rebuild.json` : **0 changement de géométrie** sur les surfaces préexistantes.
Les correctifs `metric()` et gouttière sont intacts.

## 6. Limitations fonctionnelles

- **Aucune session Spotify** : lecteur, mini-lecteur, playlists, albums et artistes ne sont pas
  atteignables. Ils n'ont **pas** été reconstruits et ne sont **pas** déclarés inspectés.
- **Aucune donnée inventée** : les tuiles pointent vers des écrans réels ; l'état vide explique ce qui
  apparaîtra, sans simuler de contenu.
- Le message « Chargement de votre bibliothèque… » vient de `MainActivity` et persiste sans session.
  C'est un texte de la logique existante ; il n'a pas été réécrit. Le sous-titre, lui, est désormais
  correct et rassurant.
- **`btnSettings`** : cible tactile 48 dp tél / 52 dp tab ; apparition transitoire à la reprise
  **toujours non résolue** (intermittente, reproduite une seule fois, run `42030168198`). L'accès
  réglages du repli web est conservé.
- Parcours **G bloqué sans session**, **H réussi** (3 cycles) — statuts inchangés.

## 7. Tests et compilations

| Contrôle | Résultat |
|---|---|
| Suite unitaire locale | **740 tests, 737 pass, 0 fail, 3 skip** |
| CI `unit-tests` (avec `javac`) | **success** |
| CI `build` (APK) | **success** |
| CI `walk phone` | **success**, 19 étapes |
| CI `walk tablet` | **success**, 19 étapes |
| CI `publish` | **success** |
| Défauts de mise en page, tous écrans × 2 profils | **0** |
| `crash.txt` | **0 octet** sur les deux profils |
| `shortcut-diag.txt` / `empty-state-diag.txt` | **vides** — aucune exception avalée |
| Registre smali (23 sources `Native*`) | **0 problème** |
| Signatures Android (23 sources) | **0 problème** |

**Aucune assertion n'a été assouplie.** Les gardes ont au contraire été renforcées, et chaque nouveau
garde-fou a été **validé par mutation** : les quatre VerifyErrors réels du chantier sont rejoués et
doivent être détectés.

## 8. Fichiers modifiés

```
smali/com/melodix/music/NativeShortcutGrid.smali          (nouveau, 250 l.)
smali/com/melodix/music/NativeShortcutClickListener.smali (nouveau,  50 l.)
smali/com/melodix/music/NativeEmptyState.smali            (nouveau, 185 l.)
smali/com/melodix/music/MainActivity.smali                (+21/-, point d'appel état vide)
smali/com/melodix/music/NativeHomeShelfRenderer.smali     (+4, grille sur la branche statut)
scripts/smali_register_check.py                           (nouveau, 233 l.)
scripts/android_signature_check.py                        (nouveau,  94 l.)
scripts/ui_qa_walk.sh                                     (+17, collecte de plantage)
tests/smali_register_check.test.js                        (nouveau, 238 l.)
tests/native_shortcut_grid.test.js                        (nouveau,  88 l.)
tests/row_geometry_probe.test.js                          (+11, publication cumulative)
.github/workflows/ui-qa.yml                               (+2, publication des diagnostics)
```

**Zones protégées non touchées** : possession de l'écran, connexion Spotify, bridge, sessions,
MediaSession, lecture en arrière-plan, permissions, contrats de données. La grille n'est branchée que
sur la branche `renderHomeStatus` réussie : **l'accueil authentifié est inchangé**.

## 9. Commit final et état Git

- **Branche** : `arena/6b935c3e-melodix` uniquement. `main` untouched, aucune fusion, aucune release.
- **Chaîne** : `f9399b2` → `cb10ce4` → `12228c8` → `b12e5c3` → `54c7f8d` → `ff129cf` → **`ac696e4`**
  (+ commits de captures CI intercalés).
- **Arbre de travail propre**, tout est poussé.

### Ce cycle en un paragraphe honnête

J'ai livré deux écrans réellement reconstruits et validés sur les deux profils. Le chemin a été
coûteux : **quatre runs CI rouges ou aveugles** avant d'obtenir la cause. J'ai d'abord accusé l'ordre
des registres, puis `setBounds(II)V` — deux bogues **réels et corrigés**, mais **aucun n'était la cause
du plantage**. Il a fallu rendre la collecte de `crash.txt` inconditionnelle pour lire le vrai verdict :
`VerifyError … [0xE1] returning undefined register`, le handler retournant un registre alloué à
l'intérieur du `try`. Ensuite, **les captures ont révélé deux dispatchs à polarité inversée** que le
parcours ne pouvait pas voir puisqu'il n'affirme que le titre : trois tuiles dont deux identiques, et
un état vide bibliothèque affublé d'une loupe sans sous-titre. Ces deux-là sont la même famille que
MEL-BUG-001. Les gardes ajoutées interprètent désormais les dispatchs au lieu de chercher des chaînes.

**Prochain travail réalisable sans session** : surface 3, enrichir les tuiles de genres (décor et
typographie) ; puis composants d'état de chargement et d'erreur sur le modèle de `NativeEmptyState`.