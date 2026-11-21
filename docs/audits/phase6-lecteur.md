# Phase 6 — lecteur et mini-lecteur

Les rayons des pochettes du lecteur (16 dp téléphone, 18 dp tablette) et du mini-lecteur (12/14 dp) sont harmonisés avec le système visuel. La surface du mini-lecteur utilise son propre jeton (16/18 dp). Aucun changement des dimensions, marges, ordre des commandes, gestion de lecture, progression, texte ou données ; aucun flou ajouté. Les tailles des contrôles natifs restent au moins 48 dp.

Tests ciblés 84/84 ; suite Node 1090 tests : 1086 réussis, 0 échec, 4 ignorés. Références applicatives et `git diff --check` propres. Les tests ne prouvent pas l'apparence, la lisibilité en grande police ni les interactions de lecture sur Android. Captures téléphone portrait et tablette paysage authentifiées non disponibles ; les risques de chevauchement et d'insets restent à valider sur appareil. Session, Spotify et publicité inchangés.
