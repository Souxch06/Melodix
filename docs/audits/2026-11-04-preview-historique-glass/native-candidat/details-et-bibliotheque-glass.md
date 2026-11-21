# Détails et espacement de la bibliothèque Glass

## Constat et portée

Les captures de la 9013 montrent un détail de playlist dont des titres apparaissent plusieurs fois, parfois avec un sous-titre générique ou un badge `E`, et des cartes de bibliothèque visuellement collées. Elles confirment l'affichage d'un détail et de la bibliothèque, pas l'état interne du DOM ni la lecture d'un titre. La cause exacte sur ce téléphone reste à confirmer.

Dans le fallback Web, le collecteur général transformait tous les liens d'une même ligne Spotify (titre, artiste, album, pochette) en cartes distinctes, avec parfois le même titre et une information non pertinente. Le renderer natif écrasait aussi un sous-titre non vide par `Titre • Spotify` à cause d'une branche inversée.

## Correctif candidat 9014

- Pour les pages playlist, album et émission, le fallback collecte une entrée par ligne réelle portant un lien de piste ou d'épisode, avec les artistes présents dans cette ligne. Il ne transforme plus les liens d'album et d'artiste en morceaux et n'utilise pas un badge comme artiste. Deux occurrences réelles du même titre dans des lignes séparées restent présentes. Si aucun conteneur de ligne reconnu n'existe, le secours ne conserve qu'un lien par URI de piste et peut donc masquer une répétition légitime : il s'agit d'un compromis limité au DOM de secours.
- Une réponse non vide du bridge fait autorité sur un DOM partiel ; un DOM déjà affiché ne doit pas être effacé par une réponse vide ou en échec. Un DOM valide peut arrêter le repli automatique tout en laissant une réponse bridge tardive l'améliorer. Aucun changement à la récupération de l'accueil ou de la bibliothèque.
- Le nom réel de la playlist peut servir de titre de détail, seulement sur cet écran ; les sous-titres et libellés d'accessibilité non vides sont conservés.
- Un espacement de 8 dp entre les cartes et un retrait horizontal de 12 dp sont appliqués après le rendu **uniquement sur la bibliothèque** ; les catégories, actions, données et autres écrans ne sont pas modifiés.
- Les profils de pages artiste restent sur le parcours précédent, pour ne pas masquer leurs albums. Les éventuels doublons de ce parcours ne sont donc pas affirmés corrigés ici.

## Validation

Simulations JSDOM : plusieurs liens par piste, artistes et badge, répétitions réelles, fallback sans structure, artist pages, bridge/DOM et réponses vides ou en erreur. Tests statiques des branches Smali, de l'espacement et de son isolement, compilation apktool et contrôle après redécodage. Pas d'exécution Android, ni de test de la playlist réelle ni de mesure de rendu : une vérification sur téléphone reste indispensable.

## Livraison 9014

- [Workflow signé réussi](https://github.com/Souxch06/Melodix/actions/runs/43696283286), source `ee550568b7d0952239bbcbf4486c9fb515fa1b4b`.
- [ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43696283286/artifacts/14154308108), SHA-256 indiqué par GitHub `d25022d162070f4d8f30bc2ebaf9cc82503722b0b6bdcaa2168d371693a31d95`, expiration 2026-11-29 08:50 UTC. Package `com.melodix.music.preview`, versionCode 1022108 calculé pour le run 621. La signature utilise le certificat Preview épinglé ; il ne s'agit pas d'une release publique.
- Local : 117 tests JS ciblés, 5 tests de patch, vérifications statiques après redécodage et compilation APK réussis. Ils ne prouvent pas le résultat sur téléphone.
