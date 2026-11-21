# APK 1 — barre, latence et diagnostic : plan initial

**Mise à jour :** l'implémentation et la CI signée ont été réalisées après la rédaction du plan ci-dessous. Voir [la livraison APK 1](livraison-preview-apk1.md) pour l'identité, la comparaison bloquante des deux APK signées et les limites. Aucun essai sur téléphone n'est encore déclaré. Les passages ci-dessous décrivent l'état au début du travail.

## Garde de la référence

Le précédent contrôle local `verify_9016_protected_assets.py project` visait le répertoire décodé avant construction. Il ne remplace pas une comparaison d'APK. Le workflow historique de livraison (`preview-apk.yml`, étape « Compare protected bytes with original signed 9016 artifact ») télécharge l'artefact 14156257401, compare son APK signée à l'APK candidate signée et produit les empreintes côte à côte. L'étape est actuellement conditionnée au tag 9017 : les deux futures livraisons devront passer par ce chemin ou étendre explicitement ce conditionnement, et le contrôle doit précéder l'upload. Aucune comparaison d'APK n'a été exécutée pour une nouvelle candidate, qui n'existe pas encore.

## Source observée, sans mesure sur téléphone

Le shell tente d'échantillonner les éléments média et se rabat sur les horloges affichées. Le timer nominal du shell est de 1 s, mais la publication peut être filtrée jusqu'à 4 s selon la signature ; ce ne sont pas des intervalles mesurés sur appareil. Le payload actuel arrondit les positions et ne véhicule pas l'identifiant de piste : il faut compléter la représentation non protégée et refuser l'interpolation si l'identité ou la position fiable manque. L'état « playing » seul ne démontre pas qu'un flux avance pendant un buffering.

## Objectif d'implémentation

Une seule horloge monotone native partagée par les deux barres, démarrée seulement sur un état valide et avançant ; elle doit gérer gel, durée, changement de titre, seek et données invalides. Une petite correction de position doit rester continue ; un changement de plus de 2 s ou un seek explicite se recale immédiatement. `preview-player-clock-model.js` est uniquement un modèle simulé, non livré, pas l'implémentation native.

Au toucher, les deux commandes natives doivent recevoir immédiatement le même état visuel provisoire ; la commande existante reste unique et son état réel est réconcilié sans faire osciller l'interface. `preview-optimistic-play-model.js` est uniquement un modèle simulé, non livré. Les limites de 100 ms ne sont pas mesurées.

## Diagnostic Preview à construire

Accès discret dans Réglages / À propos, sans ajouter de fonctionnalité à l'application normale. Utiliser uniquement une horloge monotone et des compteurs ; aucune donnée de compte ou valeur de session. Distinguer clairement l'instant du toucher, l'entrée observable dans la commande, la réception de l'état du lecteur et la fin de mise à jour de l'interface. Le lancement de la commande n'est pas un accusé Spotify, et un changement d'interface n'est pas le premier son. Conserver des intervalles de position bornés en mémoire, copiables ; ne conserver aucun titre ou identifiant de piste. Ne pas supposer que l'instant de réception via le pont équivaut exactement à l'instant d'exécution côté WebView. Le diagnostic n'est pas encore implémenté.

## Vérification

Construire et décoder, lancer les tests de non-régression et les tests supplémentaires, signer avec la clé Preview CI, comparer directement les deux APK signées, puis publier l'artefact et son identité et préparer le plan téléphone. Tant qu'une de ces étapes manque, aucune livraison ni conformité ne peut être annoncée.
