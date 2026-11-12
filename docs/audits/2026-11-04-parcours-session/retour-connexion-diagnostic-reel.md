# Retour de connexion : investigation après essai sur appareil

## Faits et limites

L’APK expérimental `82e5a6a` a été essayé sur un Samsung SM-S721B sous Android 16. Le lecteur Web Spotify et ses contrôles ont été visibles ; la requête libraryV3 observée a répondu HTTP 401 et le gate est passé de `verifying` à `error` (`library-http-401`). Cela ne valide ni la session ni l’accès aux playlists. Le diagnostic indique notamment `homeGuiMode=csshack`, `homeDecision=renderer-inactive`, `homeRootPresent=false` et `nativeUiShowMethodCalled=false` ; ces indicateurs concernent le renderer Web historique et ne constituent pas à eux seuls une preuve que le shell natif limité n’a pas été monté. Le journal fourni documente surtout le démarrage et ne permet pas de reconstituer précisément toutes les étapes après le clic. Les erreurs JS anonymes et la violation CSP inline ne suffisent pas à établir une cause ; le pont a également été exécuté par `eval`.

La vérification actuelle de libraryV3 utilise les cookies du navigateur, sans acquisition ni transmission du jeton privé précédemment retiré. Le refus 401 est compatible avec une autorisation insuffisante pour cet appel, mais ne démontre ni pourquoi Spotify l’a refusé ni que l’ajout d’un jeton résoudrait le problème. Aucun contournement des contrôles ni restauration de playlists n’est revendiqué.

## Retour Glass

L’examen du code montre que la surface de connexion reste active tant que le retour automatique n’a pas observé une navigation vers le compte, puis un début de navigation principal vers `open.spotify.com`, suivi de la fin de page correspondante. Si cette séquence n’est pas observée, le lecteur Web peut rester visible avec les contrôles du pied de page ; cette hypothèse correspond à la capture, mais le journal disponible ne confirme pas que c’est la séquence réellement rencontrée. Une page Spotify visible ne suffit pas non plus à prouver la bibliothèque.

Le commit `3a68a50b` ajoute donc une **sortie manuelle**, pas une correction démontrée du retour automatique : « Retour à Melodix » est visible pendant la connexion interactive et revient au shell Glass limité. L’action vérifie la génération, l’invalide, interrompt le chargement et remet l’état à erreur non vérifiée ; elle ne déclenche ni authentification, ni vérification, ni suppression des cookies ou données Web. Une ancienne réponse ne peut pas valider la nouvelle génération. Les actions de connexion et de retry restent distinctes.

## Vérifications et décision de livraison

- Local : 53 tests ciblés réussis, aucun ignoré ; un contrôle supplémentaire de la suite de coalescence échoue sur l’ancienne normalisation de provenance du jeton déjà en échec dans la CI existante.
- [Assemblage Android](https://github.com/Souxch06/Melodix/actions/runs/43306266907) : réussi.
- [Instrumentation Android synthétique](https://github.com/Souxch06/Melodix/actions/runs/43306290125) : téléphone et tablette réussis, ainsi que navigation bridge et persistance de mise à jour. Le téléphone exécute la nouvelle phase `login_explicit_return_unverified`, y compris le rejet d’une ancienne réponse. Il ne s’agit pas d’une authentification Spotify réelle.
- [CI complète](https://github.com/Souxch06/Melodix/actions/runs/43306260620) : 1 326 tests, 1 296 réussis, 30 échecs, zéro ignoré ; le build QA exige également le secret de signature persistant absent. Aucun test ni garde de sécurité n’a été désactivé.
- [Candidat expérimental exact](https://github.com/Souxch06/Melodix/actions/runs/43306295438) : le build est signé et sa version et sa signature ont été vérifiées, mais les deux parcours hors ligne échouent sur le contrôle supplémentaire de focus (`resumed=True focused=False`). Le contrôle historique Home échoue également. Les parcours complets du candidat exact et notamment la nouvelle sortie ne sont donc pas établis par ce run. **Ce nouvel APK n’est pas livré comme candidat vérifié** ; les résultats de l’instrumentation séparée ne remplacent pas ceux du binaire exact.

La suite nécessaire est d’expliquer le focus réel ou le diagnostic du harness sans affaiblir ce contrôle, de reréunir les parcours du binaire exact et d’observer le retour automatique avec un diagnostic capturé après le clic. Aucun identifiant, cookie ou jeton ne doit être partagé.
