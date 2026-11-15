# Adaptation Glass native sur la Preview historique

L'utilisateur souhaite reprendre toute l'interface Glass depuis le projet, sans perdre la bibliothèque et le démarrage rétablis sur 9011. Référence retenue : design system et ressources natives du commit `b9b01c70011c3ebd7d03668350e7e7f2bbb44499`. La capture de 9011 montre le shell Android natif, pas la WebView : remplacer uniquement la feuille CSS ne suffit pas. Il ne serait pas sûr de copier le layout ou le renderer modernes entiers : leurs identifiants, classes et dépendances diffèrent de la base historique.

## Première passe sur les composants natifs

- Adaptation des ressources de fond à halos, barre de navigation en verre, onglet actif violet/rose, mini-lecteur, commandes du lecteur, champ de recherche sombre, puces, lignes de bibliothèque/résultats et cartes de paramètres. Les couleurs et les formes sont dérivées de la référence ; les ressources sont incluses dans `glass-reference` et leurs empreintes vérifiées. La résolution des tokens en valeurs explicites évite de réassigner les IDs historiques.
- Coques des cartes, images arrondies et placeholders ; correction des conditions inversées des deux helpers historiques d'application de drawable, afin qu'une vue non nulle et une ressource existante puissent réellement recevoir le style ou l'image de repli. Les données et l'image réelle continuent d'utiliser les chemins antérieurs.
- Rendre le lecteur plein écran défilable en paysage court, sans changer les IDs ou les actions ; boutons d'en-tête élargis, y compris retour et paramètres. Les layouts téléphone et tablette restent distincts et le dock tablette reste centré.
- Les scripts Spotify, les flux de données, la connexion, le routage des écrans et les corrections 9011 ne sont pas remplacés. Les effets natifs imitent la surface en couches ; ils ne garantissent pas le flou réel de la WebView.

## Limites importantes

C'est **une première passe**, pas une reproduction complète ni une validation visuelle de tous les écrans. Les composants modernes absents de la base historique, par exemple le tiroir de bibliothèque et les dispositions plus riches, ne sont pas tous portés. Les gardes historiques des clics de playlists et de l'ouverture des paramètres restent inversées, ainsi que d'autres limites documentées : cette passe ne démontre pas que ces parcours fonctionnent. Cela doit être corrigé et validé séparément avant de déclarer l'interface complète. Les effets, la lisibilité, les insets, le lecteur paysage et la navigation nécessitent un essai portrait et paysage sur Android. Les risques de l'ancienne connexion et des caches natifs s'appliquent toujours.

## Tests sans appareil

- Transformation sur une base 9011 strictement épinglée et référence Glass épinglée : 6/6 tests, y compris conservation des IDs et onClick, refus des fichiers modifiés et comportement simulé des gardes de ressources. Contraste blanc sur les extrémités du dégradé ≥ 4,5:1.
- Chaîne complète depuis l'archive `d0f206b0` et toutes les transformations 9004–9011 rejouée, puis adaptation Glass appliquée sans écart d'empreinte.
- Compilation APK non signée, redécodage et intégrité ZIP réussis. Sur le résultat : 56/56 tests synthétiques chargement et bibliothèque, 3/3 bootstrap et 40/40 tests natifs/session ciblés ; 3+1+3 chaînes historiques ; vérifications XML, gardes de drawable, dock et player redécodés. Ce ne sont pas des essais ART, Spotify ou visuels ; les tests de caractérisation conservent aussi des défauts historiques.
