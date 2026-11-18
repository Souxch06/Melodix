# Correctifs des réponses tardives des panneaux — simulation

Base : commit `c93b99c10eca2241c0583568104e8bcf0f3cd44f`, APK précédent 1022250. Les tests sont synthétiques et ne sont ni une véritable WebView Android, ni Spotify connecté, ni une vérification du son.

## File, Paroles et Appareils

La génération `queueSerial` ou `panelSerial` reste l'identité d'un essai ; une réponse d'un essai antérieur ou d'un autre dialogue reste ignorée. Après succès, échec ou délai, les callbacks de démarrage et de polling sont également arrêtés lorsque `settledSerial` / `panelSettled` correspond à cet essai : ils ne peuvent plus modifier le panneau ni lancer de nouvelle action. Un nouvel essai incrémente toujours la génération. La tâche JavaScript de page n'est pas annulée : ses protections d'exclusion et de fermeture restent actives, y compris un éventuel état bloqué si la fermeture est incertaine. Une fermeture du tiroir peut toujours observer l'état final du travail identifié à des fins de diagnostic sans afficher son contenu.

Un transfert dépassant 11 secondes affiche explicitement « Transfert non vérifié » et demande de vérifier l'appareil actif avant une nouvelle tentative. Un résultat tardif ne déclenche ni nouvel affichage de liste ni commande supplémentaire. **Il ne s'ensuit pas que le transfert a ou n'a pas eu lieu.**

## Volume

Les lectures continuent à utiliser `serial` et la dernière intention de commande utilise `commandSerial`. Enregistrer une nouvelle valeur à envoyer invalide les réponses des commandes précédentes ; une lecture seule n'invalide plus la réponse de la dernière commande. Les cycles de visibilité/détachement invalident les anciens callbacks. Un échec est désormais rapporté même après le lancement d'une lecture, sans effacer l'observation de page d'une lecture plus récente. Un résultat « envoyé » ne prouve toujours pas que Spotify a appliqué la commande ni que le volume audible a changé.

Si la réponse ne revient pas, le tick visible marque l'action « non confirmée : délai » après 3 secondes (avec la granularité du tick de 800 ms et sous réserve que le thread UI tourne) au lieu de rester indéfiniment sur « en attente ». Une réponse tardive de la même commande, si aucun nouvel ordre ni interruption ne l'a invalidée, peut ensuite préciser l'état du diagnostic. Lors d'une interruption, une commande en attente devient « non confirmée : interruption » et une valeur en file non encore envoyée devient « non envoyée : interruption ».

## Tests exécutés

- `test_bridge_integration.py` avec les sources `org.json` de libcore GrapheneOS (`2804897a14425d5e045ff8bc13a14ba7bef5b9bb`) et JSON-java (`2cd0a8c2112a3bc17d33ba8546c54ecb613613f1`) : passé avec chaque parseur. DOM JSDOM artificiel, minuterie et callbacks contrôlés. Les anciens scénarios rouges sont désormais des assertions de comportement attendu. Couverture : trois tiroirs après délai avec et sans relance, démarrage et résultat tardifs, résultat tardif après un nouveau succès, transfert tardif sans action supplémentaire, réponses de volume envoyée et échec après lecture, échec après observation plus récente, absence de réponse, nouvelle commande en file et détachement/rattachement.
- `test_tiles_jvm.py` : passé avec stubs ; les tests du pont ne prouvent pas le comportement sous Android réel.
- Tests Node des scripts et des panneaux : 471/471, dont trois tests **de caractérisation** qui reproduisent encore la limite de fraîcheur des données immédiatement non vides. Leur passage n'est pas un correctif de cette limite.
- Java recompilé en classes cibles Java 6 avec ECJ, converti en Dex avec `dx` 1.7 (`dx.jar` SHA-256 `e884faca923bcc112abf35e19046f01c3332f1b19c98b4604013b03f18f7e95d`, tiré de `simplehappy2600/dxjar` commit `77c2315158cd27340e53de87535bb38812649853`), puis désassemblé avec les bibliothèques d'Apktool 2.9.3. Les valeurs SHA épinglées dans `apply_preview_player_visual.py` ont été mises à jour ; `test_compiled_scripts.py`, `test_compiled_text.py` et `test_five_buttons.py` passent.
- Assemblage puis désassemblage d'un **APK local non signé** : succès ; 40 fichiers Smali des deux contrôleurs sont identiques après aller-retour. Les sept actifs protégés 9016 correspondent dans le projet et l'APK. Cet assemblage local réutilise le projet jetable du candidat précédent ; il ne constitue pas une validation Android ou une nouvelle livraison signée.

Les données de panneau anciennes mais immédiatement non vides peuvent toujours être acceptées. Le fonctionnement réel des sélecteurs Spotify, l'audio et le transfert restent à vérifier sur appareil connecté ; le risque Like est indépendant et non corrigé ici.
