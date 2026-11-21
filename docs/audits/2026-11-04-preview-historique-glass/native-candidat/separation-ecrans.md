# Preview historique : séparation Accueil, Recherche et Bibliothèque

Les captures de la Preview 9005 montrent des étagères et des pochettes réelles à l'accueil, mais aussi les mêmes étagères sous les titres Recherche et Bibliothèque et l'onglet Accueil encore éclairé. Elles ne démontrent pas les résultats de recherche, les filtres, l'ouverture d'une playlist ni la lecture.

Sur la base historique, plusieurs instructions expliquent des mécanismes possibles : des données d'accueil tardives changent toujours l'écran courant ; les résultats vides gardent l'ancien arbre ; Bibliothèque réutilise le JSON de l'écran courant faute de cache bibliothèque ; une condition inversée peut interrompre le style des onglets ; et le dispatcher générique rejette l'activité faible disponible quand le bridge possède un contexte Application. Cela ne prouve pas à lui seul le chemin exact sur l'appareil.

La variante manuelle `v1.2.2-test.9006-preview` est une expérience sur copie jetable de la Preview 9005. Elle conserve les données et l'authentification historiques. Elle :

- conserve en cache une réponse Accueil mais ne revient pas à Accueil lorsqu'un autre écran est actif ;
- n'affiche pas le JSON d'Accueil comme données de Bibliothèque, efface les anciennes lignes pour un résultat vide non-Accueil, et ne met en cache que les réponses associées à la catégorie playlists ;
- affiche la grille de catégories plutôt que les lignes précédentes sur Recherche vide ;
- corrige les gardes de style d'onglet et de puces ainsi que les gardes empêchant d'envoyer une recherche non vide ; invalide une ancienne recherche attendue dès que le texte change ;
- utilise l'activité faible disponible pour les callbacks génériques, avec le contexte activité en repli.

Les modifications des callbacks et de la recherche changent le comportement historique, contrairement aux changements purement visuels précédents. Il reste des défauts connus : notamment les clics des lignes/playlist et leur routage sont toujours inversés, les courses et caches JavaScript ne sont pas complètement corrigés, et les refus Spotify ou erreurs réseau peuvent aboutir à un état vide. Aucun résultat fictif n'est ajouté. Les anciens risques de la connexion historique restent présents.

Tests locaux : trois tests Python de préparation sur fixture ; 17 tests JS ciblés interprétant des branches Smali et vérifiant statiquement les modifications ; groupe compilé/redécodé de 49 tests, plus 3 + 1 + 3 tests de chaînes JS/Smali synthétiques. APK Preview de test compilée puis redécompilée avec Apktool ; archive valide. Pas d'exécution ART, pas d'émulateur ni de test Spotify réel. Les tests anciens qui caractérisent le dispatcher et le retour forcé à Accueil comme des défauts ne sont pas utilisés sur le candidat modifié : ils sont remplacés par des tests des nouveaux comportements. Ils restent exécutés sur la base historique avant patch. Cette version ne garantit donc pas le bon fonctionnement sur appareil ni la restauration complète de l'interface.

## Artefact signé

Le [run 43647350041](https://github.com/Souxch06/Melodix/actions/runs/43647350041) a réussi le job dédié, dont la préparation, les vérifications et la signature avec le certificat Preview épinglé. [ZIP de la Preview](https://github.com/Souxch06/Melodix/actions/runs/43647350041/artifacts/14133748984), contenant `Melodix-Preview-historique-glass.apk` ; expiration prévue le 28 novembre 2026 à 22:19 UTC. SHA-256 de l'archive : `2f5ebcbd25096683a54c82a35507ec49dfa8330222feccc33d807f08537b4ccb`. Package `com.melodix.music.preview`, versionCode calculé `1022100`, supérieur à celui de 9005 (`1022099`). Pas de validation Android ni de garantie de compatibilité avec une autre installation.
