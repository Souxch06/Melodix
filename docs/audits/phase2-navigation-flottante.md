# Phase 2 — design system et navigation flottante

## Périmètre

La navigation native utilise maintenant un fond verre de forme entièrement arrondie, une bordure d'accent issue de la palette existante, des marges latérales et un décollement inférieur définis par des jetons `mel_tab_*`. Elle reste dans le flux vertical du shell : l'espace du dock est réservé, sans superposition sur le contenu ou le mini-lecteur. Téléphone portrait/paysage : largeur disponible moins les marges ; tablette portrait/paysage : pilule centrée de 560 dp maximum. Le texte et les icônes restent ceux de l'application ; l'onglet actif expose aussi son état sélectionné aux services d'accessibilité.

Les trois vues et leurs handlers, le positionnement relatif du mini-lecteur, les hauteurs de cible (58 dp téléphone, 68 dp tablette), les routes, le lecteur et les gardes de session sont conservés. Le fond translucide est un repli sans flou, sans `backdrop-filter` sur les surfaces défilantes. Aucune requête, entête, version Spotify, cookie, publicité ou fichier `adblock_hosts.txt` n'est modifié. Aucun changement du mode clair, de « Tout afficher » ou de « Plus du genre de ».

## Vérifications

- Tests ciblés de structure et parité téléphone/tablette/paysage : 94/94.
- Suite Node : 1081 tests, 1077 réussis, 0 échec, 4 ignorés.
- Vérification statique de la méthode smali modifiée : zéro problème ; `git diff --check` et contrôle des références applicatives réussis.
- Les assertions de layout ne constituent pas des captures réelles : les mesures Android CI et l'éventuelle preview sont à examiner séparément. La validation sur téléphone réel/authentifié n'est pas faite.

## Réserves

Le plafond 560 dp est réservé aux variantes `sw600dp` pour ne pas forcer une largeur supérieure à un petit téléphone ; le téléphone en paysage garde une largeur fluide. Le flux réservé évite de cacher le contenu derrière le dock, mais réduit de 10 dp l'espace vertical disponible. Clavier, zoom texte important et accessibilité doivent être contrôlés sur appareil ; les captures de fixture CI ne remplacent pas ce contrôle. L'instrumentation MDXPERF existante est conservée.
