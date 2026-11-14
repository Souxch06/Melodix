# Phase 3 — accueil : lisibilité et cohérence des pochettes

## Périmètre

Les pochettes de l'accueil Web reprennent le rayon d'image du design system, avec un fin contour issu de la palette ; titres et sous-titres gagnent en lisibilité, et les titres de section sont légèrement renforcés. Le mouvement de pression est supprimé si la préférence de mouvement réduit est active. Sur l'accueil natif, le rayon des pochettes est harmonisé par jeton (16 dp téléphone, 18 dp tablette) et le repli de la métrique correspond à la valeur téléphone.

Les dimensions et l'ordre des cartes, le contenu, les routes, les actions, les caches et les placeholders sont conservés. Aucun traitement du chevauchement historique de 14 px n'est revendiqué. Les commandes « Tout afficher » et « Plus du genre de » ne sont pas modifiées. Aucune logique de session, requête Spotify ou publicité ne change ; pas de flou sur les cartes défilantes.

## Vérification

- 106 tests ciblés réussis ; suite Node 1084 tests, 1080 réussis, 0 échec, 4 ignorés.
- Méthode smali de métrique : zéro problème au vérificateur statique ; références applicatives et `git diff --check` propres.
- Ces tests ne sont pas une capture du téléphone ni une preuve d'authentification. Captures portrait/téléphone et paysage/tablette avec des données réelles non réalisées.
- Le workflow de mesure native de la phase 2 (`42648214755`) a assemblé son APK de test mais n'a pu mesurer ni téléphone ni tablette : le shell natif n'était pas visible dans son environnement sans compte. Une autre vérification d'intégration par fixtures Android a été lancée pour cette phase 2 (`42649488213`) ; elle n'est pas une validation de cette phase 3.
