# Melodix — système visuel et reconstruction des surfaces

**Référence préservée** `9322581` · **Branche** `arena/6b935c3e-melodix` · **HEAD** `c5246aa`, arbre propre
**Dernier run** `42081094275` — build ✅, unitaires ✅, **parcours téléphone ❌, tablette ❌**
**Suite** 757 tests, **754 pass, 0 fail, 3 skip** (les 3 règles JVM exigent `javac`, absent ici ; elles tournent en CI, job vert)

> **La CI est rouge, et je l'ai laissée rouge volontairement.** L'échec est une assertion que j'ai
> ajoutée ce cycle : après un tap sur une tuile de genre, une tuile doit être sélectionnée. Elle ne
> l'est pas. Assouplir le garde pour repasser au vert est interdit ; je livre donc l'échec avec sa
> preuve plutôt qu'un vert obtenu en abaissant l'exigence. Détail au §6.

---

## 1. Écrans réellement terminés

| Surface | État | Preuve |
|---|---|---|
| **Recherche — tuiles de genres** | **Refonte visuelle livrée et observée** sur les 2 profils | 8 tuiles mesurées : **184,8 × 96 dp** téléphone (2 colonnes), **173,5 × 116 dp** tablette (4 colonnes). Dégradé, glyphe sombre, contraste AA. Captures §4 |
| **Bibliothèque — état de chargement** | **Livré et observé** sur les 2 profils | Icône de chargement distincte, titre réel conservé, description. 3 descendants, 2 TextViews |
| Accueil | Acquis du cycle précédent **préservé** | 3 tuiles distinctes, inchangées |

## 2. Écrans encore provisoires

| Surface | Ce qui manque |
|---|---|
| **Recherche — états d'interaction** | **Sélectionné ne fonctionne pas** (§6). Appuyé (ripple) et indisponible (voile) existent comme ressources mais **ne sont pas observés** : aucun doigt maintenu dans le parcours, et rien ne désactive une tuile aujourd'hui |
| Playlists / Albums / Artistes | Le système d'états est branché sur leur renderer partagé, mais **leurs écrans ne sont pas atteignables sans session** : non déclarés inspectés |
| Lecteur / mini-lecteur | **Préparé, pas observé.** Panneau masqué sans session. État désactivé ajouté aux boutons, en additif only |
| Profil / Paramètres | Inchangés ce cycle |

## 3. Système d'états réutilisable

`NativeStateView.smali` — **11 états**, chacun avec icône, titre, description :

`chargement` · `chargement prolongé` · `aucun résultat` · `bibliothèque vide` · `réseau` ·
`session` · `accès refusé` · `données indisponibles` · `invite de recherche` · `erreur réglages` · `erreur bibliothèque`

**Séparation des causes, exigée par test :** session, réseau, bibliothèque vide et accès refusé ont
**quatre icônes distinctes**. Le réseau ne parle jamais de session ; la bibliothèque vide ne parle ni
d'erreur ni de reconnexion.

**Actions réelles uniquement.** Seules trois états ont un bouton, toutes dispatchées par
`openNativeRow` **existant** : `open-login` → « Se connecter », `retry-settings` et `retry-library` →
« Réessayer ». **Le réseau n'a aucun bouton** : il n'existe pas de réessai générique, et en inventer un
serait inventer une capacité. Une URI inconnue ne produit **aucun** bouton.

**Intégration réelle, pas de composant orphelin.** Le point d'appel est `renderNativeRows`, le
renderer **partagé** par bibliothèque, playlists, albums, artistes et résultats de recherche : une
seule intégration couvre ces surfaces (priorité 3). `NativeEmptyState.forMessage`, supplanté, a été
**retiré** plutôt que laissé en code mort.

**Session.** Un accesseur **en lecture seule** (`iget-boolean` seul) du drapeau déjà maintenu par
`noteNativeHomeSessionUnprovenStatusAttached` permet d'afficher « session non confirmée » avec la
vraie action « Se connecter » au lieu d'un chargement sans fin. Aucune logique de session modifiée.
Sur les runs, ce drapeau est **faux** : c'est bien l'état chargement qui s'affiche, et je ne prétends
 pas avoir observé la variante session.

## 4. Captures téléphone et tablette

```
docs/audits/ui-qa-42081094275/{phone,tablet}/   dernier état (refonte + système d'états)
docs/audits/ui-qa-42073299222/{phone,tablet}/   run 5/5, glyphe corrigé
docs/audits/ui-qa-42031794726/{phone,tablet}/   avant toute reconstruction
```

**Toutes ont été examinées**, pas seulement produites. Deux défauts n'ont été vus que là :

1. **Glyphe gris opaque** (run `42071302322`) : `android:tint` sur l'ImageView est resté **sans effet**,
   le vecteur partagé gardait `mel_icon_muted` `#6e7684`. Ce placeholder sert aussi les rendus de
   lignes et de rayons : le modifier aurait changé d'autres écrans. J'ai créé `native_genre_glyph`,
   même tracé, remplissage sombre propre. Vérifié sur la capture suivante.
2. **Absence d'anneau de sélection** après tap → §6.

## 5. Contraste, mesures, avant/après

**Contraste mesuré, pas estimé.** Six des huit teintes échouaient au WCAG AA pour un libellé blanc :

| Tuile | Avant | Après |
|---|---|---|
| Ambre | **2,10:1** | 4,63:1 |
| Teal | **2,45:1** | 4,68:1 |
| Orange | **2,82:1** | 4,65:1 |
| Forêt | 3,20:1 | 4,71:1 |
| Rose | 3,75:1 | 4,64:1 |
| Violet | 4,35:1 | 4,61:1 |

Mer 4,92:1 et bleu 5,32:1 étaient déjà conformes et n'ont pas bougé. Le libellé étant en haut de la
tuile, la couleur de base est le pire cas : un test la mesure pour les huit.

**Géométrie** — `container_items_deep`, pas les pixels :

| Mesure | Téléphone | Tablette |
|---|---|---|
| Tuile avant → après | aplat 86 dp de haut → **184,8 × 96 dp** | 104 dp → **173,5 × 116 dp** |
| Colonnes | 2 → **2** | 4 → **4** |
| Texte | 15 → **16 sp** | 17 → **19 sp** |
| Glyphe | — → **62 dp** | — → **78 dp** |
| Rayon | 12 → **14 dp** | 12 → **16 dp** |

**0 défaut géométrique** sur 38 dumps, 2 profils. **`crash.txt` 0 octet**, `state-diag` 0 octet.
19 étapes par profil, dont 2 en échec attendu : lecteur et mini-lecteur, bloqués sans session.

## 6. Le défaut ouvert : la sélection d'une tuile ne fonctionne pas

**Chaîne de preuve, quatre runs :**

| Run | Constat |
|---|---|
| `42073299222` | 5/5 mais capture sans anneau. L'étape disait « tap delivered only » : elle ne prouvait rien |
| `42075202324` | J'ajoute l'assertion. **5/5 avec `selected=0`** : mon grep testait la *présence* de la ligne, pas un compte ≥ 1. **Faux vert de mon cru**, corrigé en `^selected=[1-9]` |
| `42077053251` | Rouge. `tap=delivered`, `selected=0`, trace du styleur vide |
| `42078730287` | `tap_point=284 625`, cible `FrameLayout desc='Pop' enabled=true bounds=[42,499][527,751]` — **le tap frappe la bonne tuile, active, en son centre** |
| `42081094275` | Styleur déplacé **avant** `performNativeLiveSearch`. Toujours `selected=0`, trace toujours vide |

**Établi :** le tap atteint la tuile ; `onNativeGenreClick` **ne s'exécute pas** ; aucun crash.
**Non établi :** pourquoi. `android:onClick` ne se déclenche pas sur ces `FrameLayout`. Je n'ai
**pas** modifié `performNativeLiveSearch` ni la logique de recherche.

**Important et honnête :** l'ancien parcours n'a **jamais** vérifié qu'un tap de genre produisait un
effet. Il est donc possible que ces taps n'aient **jamais** fonctionné dans le shell natif — ce
serait un défaut préexistant révélé, pas une régression. **Je ne peux pas le trancher** avec les
preuves disponibles et je ne l'affirme pas.

**Prochaine étape la plus informative :** poser l'écouteur **programmatiquement** sur chaque tuile
plutôt que via `android:onClick`, et journaliser l'entrée du handler. Cela distingue un problème
d'attribut XML d'un problème de dispatch.

## 7. Tests, compilations, gardes

| Contrôle | Résultat |
|---|---|
| Suite locale | **757 / 754 pass / 0 fail / 3 skip** |
| CI unitaires (avec `javac`) | ✅ |
| CI build APK | ✅ |
| CI parcours téléphone / tablette | ❌ **selection assertion, §6** |
| Défauts géométriques, 38 dumps | **0** |
| Registre smali (25 sources) / signatures Android | **0 / 0** |

**Gardes ajoutées, tous validés en les faisant échouer :** contraste mesuré sur les 8 teintes ;
structure et tokenisation des tuiles ; 3 états d'interaction dans le foreground ; composition
tablette ≠ téléphone ; **8 termes de genre épinglés** (aucun inventé) ; interprétation des 11 états,
des actions réelles et du mapping de messages ; `ui_selected_check` ; déclencheur CI.

**Deux vrais bogues attrapés par mes propres interpréteurs :**
- `actionLabel` utilisait `if-nez` pour `retry-library` : la vraie action de réessai perdait son
  libellé et « Réessayer » allait à des URI inconnues.
- `v3` journalisé à `:g_done`, atteint aussi par les sorties précoces où il n'est pas défini :
  **le VerifyError qui avait coûté trois runs au cycle précédent**. Initialisé à l'entrée, sous test.

**Deux de mes propres erreurs, corrigées et documentées :** l'assertion `selected=` sans compte
positif ; et un contrôle d'ordre qui lisait les **commentaires** (celui que je venais d'écrire
mentionnait la méthode avant son appel). Plus une faute de process : un patch YAML avait levé
`AssertionError`, je l'ai poussé avec son test rouge, corrigé au commit suivant.

**Lacune CI réelle corrigée :** le filtre `paths` surveillait `Native**` mais **pas**
`MainActivity.smali`. Un commit modifiant l'écran principal pouvait partir **sans aucun parcours
appareil** — c'est arrivé. Le chemin est ajouté, sous test.

**Aucune assertion assouplie.** Deux contrôles ont été *corrigés* car faux positifs sur du code
correct (`layout_width="0.0dip"` de poids ; dimensions négatives légales en Android), avec test
prouvant que `12px`, `?attr/`, un nombre nu et `wrap_content` restent rejetés.

## 8. Fichiers modifiés

```
res/layout/activity_main.xml, res/layout-sw600dp/activity_main.xml   16 tuiles restructurées
res/values/colors.xml                    6 teintes AA + 8 couleurs de palette
res/values/mel_dimens.xml, res/values-sw600dp/mel_dimens.xml          jetons tuiles
res/drawable/native_genre_{tile,ripple,foreground,glyph}.xml          profondeur, états, glyphe
res/drawable/native_state_*.xml                                     7 icônes d'état
res/drawable/native_button_{white,green}.xml                        état désactivé additif
smali/com/melodix/music/NativeStateView.smali                       nouveau, 11 états
smali/com/melodix/music/NativeGenreTileStyler.smali                 nouveau, sélection + trace
smali/com/melodix/music/NativeEmptyState.smali                      code mort retiré
smali/com/melodix/music/MainActivity.smali                          accesseur RO, points d'appel
scripts/ui_selected_check.py                                        nouveau
scripts/ui_view_center.py, ui_metrics_measure.py, ui_qa_walk.sh      preuves et jetons négatifs
.github/workflows/ui-qa.yml                                         publication + déclencheur
tests/browse_tiles, native_state_view, ui_selected_check            nouveaux gardes
```

**Zones protégées intactes** : possession native/WebView, connexion Spotify, bridge, sessions,
MediaSession, arrière-plan, permissions, contrats de données. `metric()`, gouttières et gardes
structurelles du cycle précédent préservés.

## 9. Git

`9322581` → `a1176cc` → `95f92a9` → `be08e30` → `82751bb` → `abb0633` → `8b5657e` → `c297924` →
`e4b9946` → **`c5246aa`** (+ commits de captures CI). `main` intact, aucune fusion, aucune release,
rien de supprimé. Tout est poussé.

**Ce que je livre :** une Recherche visuellement aboutie et mesurée, un système de 11 états
réellement branché sur le renderer partagé, et une CI rouge sur un défaut réel que je refuse de
masquer. **Ce que je ne livre pas :** la sélection de tuile fonctionnelle, et les écrans dépendant
d'une session.