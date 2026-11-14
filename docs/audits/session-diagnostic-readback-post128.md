# Historique de session — correctif après Preview128

## Périmètre et reprise

Base `04a26c8131691c9d0814254053ab359f024c342c` (Preview128). Le test utilisateur montre une relance 2/0 sans ligne Tentative après 20 secondes et un diagnostic de requête native-retry en 401. La cause exacte sur téléphone n'est pas établie. Après une réinitialisation de l'environnement, le worktree et le correctif précédemment préparés ont disparu : ce correctif a été reconstitué à partir de la conversation et retesté. Une nouvelle sauvegarde distincte des 26 fichiers WIP et de l'index du principal a été créée et vérifiée avant la reconstitution. La référence Git est partagée entre les worktrees ; les fichiers et l'index du principal n'ont pas été modifiés.

## Comportement

Le JavaScript conserve un instantané diagnostique native-retry, borné et filtré, avant l'envoi au canal détaillé. Le natif lit cet instantané via evaluateJavascript indépendamment des interfaces de notification : au maximum 30 lectures, 30 secondes monotones, référence WebView faible, arrêt au changement de génération. Le contenu lu est reconstruit avec des valeurs fermées, puis validé (source, taille, génération, tentative) et fusionné dans l'historique existant. Aucune valeur de cookie, empreinte, URL, jeton ou donnée privée n'est exportée. Les doublons ne régressent pas les observations.

Ce secours ne modifie pas le classifieur, les gardes de génération, les règles de preuve, le verrou, les cookies, les requêtes/en-têtes/version Spotify ou la publicité. Il ne transforme jamais un tap ou une valeur inconnue en preuve. Il dépend encore de la WebView, du thread principal, du fusionneur et du rendu ; il refuse une génération non correspondante, sans fabriquer 2/2. Il s'agit d'une mitigation testée localement, pas d'une cause confirmée sur le téléphone.

Des jalons fermés de réception, d'enregistrement, de vue et de lecture sont ajoutés au journal MDXPERF en mémoire, sans écriture disque synchrone ni message d'exception ; le retour d'enregistrement ne prouve pas qu'une clé précise a été insérée. Le diagnostic général contient MDXPERF, contrairement à la copie des détails de session seule. Une absence de jalon reste inconnue.

## Tests et risques

Les tests Node couvrent pont absent/exception, snapshot initial et final 401, fusion sans régression, génération différente, confidentialité, limites de durée et de nombre, fermeture et absence de WebView. Ils interprètent le smali avec primitives Android simulées : ce n'est pas une exécution ART/WebView. Un scénario de WebView synthétique a été préparé dans `tests/android/SessionPhase127Instrumentation.java` mais n'a pas été exécuté ici. Suite complète : 1069 tests, 1065 réussis, 0 échec, 4 ignorés. Checker registres : 0 problème sur 17 NativeSession et NativeStartupTiming ; un avertissement préexistant dans AndBridge.injectBundledAsset, aucun sur les méthodes modifiées. Aucun test d'authentification Spotify réelle ni capture téléphone/tablette n'est revendiqué.

Test utilisateur prévu : installer par-dessus Preview128 sans désinstaller ni effacer les données, un appui sur Réessayer, attendre 20 secondes, ouvrir et copier les détails ; noter la ligne Tentative et recueillir séparément le diagnostic général MDXPERF si elle manque. Un 401 isolé ne prouve pas une session expirée. Aucune phase 2.
