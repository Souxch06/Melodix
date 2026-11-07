# P0 affichage — comparateur assaini téléphone/tablette (préparation)

**Date :** 2026-11-04
**Branche :** `arena/6b935c3e-melodix` (PR #7 maintenue ouverte, `main` intact).
**Objet :** poursuivre la mission de l'ancienne branche sur le volet « interface
absente / propriété de l'écran », sans déclarer le P0 corrigé et sans lancer de
CI tant que l'accès Actions est refusé/clairsemé et qu'un accord explicite n'a
pas été donné.

## Ce qui est ajouté

- `scripts/aggregate_p0_display_ownership.py` : agrégateur **fail-closed** de deux
  rapports de profil déjà assainis (`phone` et `tablet`). Il n'accepte que le
  schéma strict ci-dessous, refuse tout champ inattendu, toute donnée privée, tout
  APK/source/run divergent, tout profil incohérent (`smallestScreenWidthDp`), toute
  échéance manquante ou non monotone, et ne produit aucun rapport en cas d'échec.
- `tests/p0_display_ownership_aggregate.test.js` : 4 tests Node couvrant la
  combinaison valide, la reprise de centre par Spotify Web, les violations
  provenance/schéma/profil/privacy, et les échéances non launch-relative.

## Schéma exigé par profil

Chaque sidecar doit contenir exactement :

```
schema_version=1
profile=phone|tablet
source_commit=<40 hex>
run_id=<CI run id numérique>
apk_sha256=<64 hex>
authenticated_spotify_test=not_performed
session_state=unauthenticated
timeline_origin=app_launch
device={physical_width_px, physical_height_px, density_dpi, width_dp, height_dp,
        smallest_screen_width_dp, orientation}
webview_viewport={inner_width_css_px, inner_height_css_px, screen_width_css_px,
                  screen_height_css_px, device_pixel_ratio}
sf_config_gui_mode=csshack|bigwindow|other|unknown
body_class_flags={melodix, mobile}
checkpoints={200ms,1s,3s,8s,20s}
owner_transitions=[{elapsed_ms, from_owner, to_owner, route_category}]
```

Chaque échéance contient exactement :

```
target_elapsed_ms, observed_elapsed_ms,
native_root_visible, webview_container_visible,
native_root_bounds_px, webview_container_bounds_px,
display_owner=native|web|login|unknown,
route_category=home|login|search|library|detail|player|unknown,
native_owner_verified, webview_mounted_under_native_root
```

Le comparateur exige `phone.smallest_screen_width_dp < 600` et
`tablet.smallest_screen_width_dp >= 600`, les cinq échéances launch-relative
(`timeline_origin=app_launch`, observation monotone et bornée), et le même
`apk_sha256`/`source_commit`/`run_id` pour les deux profils.

## Ce que le comparateur ne fait pas

- Il ne lit **aucun** logcat brut, hiérarchie UI brute, capture d'écran, cookie,
  jeton, donnée de compte Spotify ou contenu privé.
- Il ne lance **aucun** émulateur, aucune CI, aucun dispatch.
- Il ne modifie **aucun** code fonctionnel Smali/UI.
- Il ne déclare **jamais** le P0 corrigé : même validé, le rapport combiné porte
  `p0_resolution_claimed=false`. Le booléen `p0_display_ownership_satisfied`
  n'est vrai que si les deux profils conservent la propriété native aux cinq
  échéances et qu'aucune reprise de centre par Spotify Web n'est observée.

## État de preuve

| Niveau | État |
| --- | --- |
| Code | comparateur + tests écrits et relus |
| Test | 4/4 tests dédiés verts ; suite complète vérifiée au commit |
| Compilation | aucun APK construit par ce lot |
| Exécution | aucune ; pas de comparaison téléphone/tablette réelle encore produite |

## Blocage restant

Les endpoints d'administration Actions ont répondu `403 Resource not accessible
by integration` lors du dernier contrôle lecture seule. Aucun dispatch n'a été
tenté. La comparaison réelle téléphone/tablette du même APK aux cinq échéances
reste à produire par un job CI opt-in, puis à agréger avec cet outil. Tant que
ces deux profils et ces cinq échéances ne sont pas observés, le P0 affichage
reste **non résolu / insuffisamment concluant**.
