# Audit UI — refonte « liquid glass » de Melodix

Étape 0 de la mission. Rien n'a été modifié pour produire ce document.

## 1. Comment le CSS et le JS arrivent dans la WebView

| Quoi | Où | Détail utile |
|---|---|---|
| `css_hacks.css` | injecté par `smali/c91.smali` (~l. 1455-1500) via `Lm9;->d(Ljava/lang/String;)Ljava/lang/String;` | lu **depuis l'APK** : `m9.d()` lit `filesDir/hotfixes_off/<nom>` (hotfix désactivé volontairement) puis retombe sur l'asset. Toute modification du fichier est donc bien prise en compte au rebuild. |
| `spotify_bridge.js` | 5 sites smali, chargé par `loadBundledBridge()` avec lecture par tranches de 48 Kio et plusieurs stratégies d'exécution (inline → eval → Function → injection native → blob) | **fichier généré** : son en-tête dit `generated from scripts/spotify_bridge.source.js; sha256=…; terser=5.51.2`. Éditer `assets/spotify_bridge.js` directement serait perdu à la régénération. |
| `native_ui_shell.js`, `melodix_home.js`, `native_home_fallback.js`, `runtime_diagnostic.js` | chargés par la WebView | injectent aussi des `<style>` (dont `#sf-mobile-nav`). |
| Police du lecteur plein écran | `css_hacks.css` l. 667 : `font-family: 'Montserrat', sans-serif` | **aucun `@font-face`, aucune fonte embarquée** : Montserrat n'est utilisé que s'il est présent sur l'appareil, sinon repli système. Il n'y a donc pas de mécanisme de police à réutiliser — il faudrait l'embarquer. |

## 2. Ce qui est natif, ce qui est web

**Web** : accueil, recherche, bibliothèque, listes de pistes, mini-lecteur (`aside[data-testid="now-playing-bar"]`), barre du haut (`#global-nav-bar`), tiroir bibliothèque (`#Desktop_LeftSidebar_Id`), et **tout le lecteur plein écran `#sf-fs-player`** (construit par le bridge, donc 100 % à nous).

**Natif** : `MainActivity` (hôte WebView), `SettingsActivity` + `res/layout/settings_activity.xml`, `res/drawable/mel_launch_background.xml` (splash), thème/`res/values/colors.xml`, notification média (`WebService`).

Détail qui compte : `spotify_bridge.js` injecte un bloc `.encore-dark-theme{--background-base:#000; …}` et force `aside[data-testid=now-playing-bar]{background:#000!important}`. C'est un **doublon d'autorité** avec `css_hacks.css` — voir risque n°2.

## 3. Variables et couleurs

Deux familles coexistent :

1. **Nos tokens `--mel-*`** (une seule `:root`, l. 6-64) : `--mel-bg: #060809`, `--mel-text`, `--mel-text-dim: #b3b3b3`, `--mel-accent: #1ed760`, `--mel-accent-deep: #1db954` + dérivés `rgba(30,215,96,…)`.
2. **Les variables Spotify** (surchargées par le bridge) : `--background-base`, `--background-highlight`, `--background-elevated-base`, `--background-elevated-highlight`, `--background-elevated-press`, `--background-tinted-base`.

**Le vert est centralisé** : 6 occurrences de vert brut dans `css_hacks.css`, mais 27 usages de `var(--mel-accent…)`. Changer `--mel-accent` / `--mel-accent-deep` / leurs dérivés rgba suffit pour l'essentiel du CSS. Les 4 verts restants sont dans du JS (`playlist_sort.js` ×3, `spotify_bridge.js` ×1 dans son bloc de repli), plus le `#1ed760` en dur dans le `.encore-dark-theme` du bridge.

**Non vérifiable sans appareil** : la liste exacte des variables calculées par Spotify dans la WebView (`chrome://inspect`). Celles ci-dessus sont celles que **notre** code surcharge déjà — c'est la seule assise dont je dispose hors ligne, et je m'y tiendrai.

⚠️ **Conflit de conception à trancher** : le test `tests/css_theme_integrity.test.js` impose (a) **une seule** `:root` porteuse des tokens `--mel-*`, (b) **aucun** token `--mel-*` en dehors de cette racine, (c) aucun token `--mel-*` dans les JS. Ma consigne dit « tokens `--mx-*` dans `:root` » en fin de fichier. Les deux sont conciliables : `--mx-*` vit dans un `:root` séparé **sans aucun `--mel-*`**, et je **redirige** les tokens `--mel-*` existants vers les nouvelles valeurs violet/magenta (édition de la racine existante, pas de doublon). Je propose cela ; dis-moi si tu préfères l'inverse.

## 4. Faisable en CSS seul / nécessite du JS

| Élément | Faisable |
|---|---|
| Thème global, lueurs, texte, remplacement du vert | **CSS seul** |
| Cartes 24 px, pochette arrondie, ombre colorée | **CSS seul** (sélecteurs `[data-testid="card"]`) |
| Lignes de pistes aérées (`tracklist-row` ≥ 56 px) | **CSS seul** |
| Barre du haut en verre, recherche en pilule | **CSS seul** (sauf l'état de focus : CSS suffit avec `:focus-within`) |
| Lecteur plein écran (pochette 85 vw, halo depuis `--sf-art-color-*`, progression dégradée, bouton 76 px, entrée 350 ms) | **CSS seul** — le DOM nous appartient |
| Mini-lecteur en pilule flottante | **CSS seul**, mais la **réduction** en portrait (masquer artiste/contrôles secondaires) est du CSS fragile : voir risque n°4 |
| Barre d'onglets flottante | **existe déjà** (`#sf-mobile-nav`, 3 onglets) → cf. risque n°1 |
| Tiroir bibliothèque en verre | **CSS seul** |
| Icône adaptative, splash, couleurs système | **natif** (ressources XML, pas de CSS) |

## 5. Risques (classés par gravité)

1. **La barre d'onglets existe déjà.** `#sf-mobile-nav` est injectée par `spotify_bridge.js` en mode `csshack`, stylée par `css_hacks.css` (l. 1583-1645) **et** par un bloc de repli injecté par le bridge (`sf-mobile-shell-fallback-style`). Créer `#mx-tabbar` produirait **deux** barres. Je propose de **restyler l'existante** plutôt que d'en ajouter une. À valider.
2. **Le bridge gagne sur le CSS.** Son bloc `.encore-dark-theme` et son `background:#000!important` sur la barre de lecture sont des `<style>` injectés **après** `css_hacks.css` : à sélecteur égal ils l'emportent. Pour que le verre tienne, il faudra soit des sélecteurs plus spécifiques côté CSS, soit toucher ce bloc côté bridge (modification isolée, cf. §2 de la mission). À trancher à l'étape 5.
3. **`window.__sfEnsureMobileShell` peut recréer le DOM.** L'installation de la barre d'onglets passe par un chemin de repli ; un restylage qui suppose une structure DOM stable peut se retrouver face à une barre reconstruite.
4. **Le mini-lecteur est le composant le plus risqué.** « Réduire en portrait à pochette + titre + lecture/pause + fine barre » suppose de **masquer** des enfants (boutons de file, volume, appareils Connect). Les masquer en CSS aveuglément casserait « la barre Connect reste visible ». Cette réduction demande une inspection DOM réelle que je ne peux pas faire sans appareil : je livrerai d'abord la surface de verre **sans rien masquer**, puis proposerai la réduction avec les sélecteurs exacts, à valider.
5. **Performance du flou.** `backdrop-filter` sur la barre du haut + mini-lecteur + barre d'onglets + lecteur plein écran = 4 surfaces simultanées possibles. Sur API 24-28 (WebView ancienne), `backdrop-filter` est absent : le repli `@supports not` est donc **obligatoire**, pas décoratif.
6. **`color-mix()` et `:has()`** sont déjà utilisés dans le CSS actuel ; les mêmes replis s'appliquent. Je ne les introduirai pas davantage.
7. **Contrainte de branche (bloquante pour la consigne)** : la mission demande une branche `feature/ui-glass`. Cette session est **liée** à `arena/6b935c3e-melodix` et ne peut pas en créer d'autre. Je livre donc sur cette branche, un commit par étape. `versionCode` actuel 27 / `versionName` 1.2.2.
8. **APK de test, pas de vraie installation** : mes builds sont signés avec une clé de test **différente** du certificat historique (`4C:79:D7:…:18:87`). Il faut désinstaller avant d'installer.

## 6. Ce que je ne ferai pas

- Aucune classe générée par Spotify (hashes) : uniquement `data-testid`, `data-encore-id`, `aria-label`, `role`, ids connus.
- Aucune suppression de règle existante de masquage, safe-area ou mode `sf-*`.
- Aucune retouche de `adblock_hosts.txt`, `desktop_spoof.js`, `google_spoof.js`, `classic_login.js`, `playlist_sort.js`.

## 7. Décisions à valider avant l'étape 1

1. `--mx-*` dans un `:root` séparé + redirection des `--mel-*` (ma proposition) — ou autre arrangement ?
2. Barre d'onglets : **restyler `#sf-mobile-nav`** (mon avis) ou créer `#mx-tabbar` et neutraliser l'ancienne ?
3. Mini-lecteur : livrer la pilule de verre **sans masquer** d'enfants (mon avis), et traiter la réduction ensuite avec le DOM réel ?
4. Police : garder le repli système (Montserrat n'est pas embarqué) ou embarquer un woff2 en data URI ?
