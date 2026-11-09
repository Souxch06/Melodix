# Phase 5 — réglages : cohérence des cartes

Les cartes de réglages et leur masque d'effet de pression utilisent désormais le même rayon issu d'un jeton en dp (16 téléphone, 18 tablette), converti en pixels par la métrique native. Auparavant la valeur était passée directement comme pixels, malgré le commentaire « 16dp », et variait donc visuellement selon la densité. La surface, la bordure, les cibles, les états, les contrôles et les actions existants restent inchangés ; aucun flou n'est ajouté aux cartes défilantes.

Vérifications : 43 tests ciblés réussis ; l'ancien test du masque attendait la constante en pixels et a été adapté pour exiger la résolution de la métrique. Suite finale 1088 tests, 1084 réussis, 0 échec, 4 ignorés. Vérificateur statique des deux méthodes modifiées : 0 problème ; références applicatives et `git diff --check` propres.

La géométrie et le rendu réels ne sont pas validés par ces tests ; captures téléphone portrait et tablette paysage authentifiées indisponibles. La lisibilité à grande police et les interactions nécessitent une vérification sur appareil. Aucune modification de la logique de session, des requêtes, des caches ou de la publicité.
