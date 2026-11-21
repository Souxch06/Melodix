# Historique des playlists : référence, écarts et limites

## Conclusion

La régression n'est pas démontrée corrigée sur un compte réel. Le test téléphonique du build `64f42154921380578876ce90d0a12f03bd159c46` a donné 400 puis 403 aux endpoints de jeton et 401 à la bibliothèque sans bearer. La cause de ces réponses n'est pas établie. La relance suivante avec génération nulle est un second problème observé, non expliqué. Aucun nouvel APK n'est proposé.

La référence accessible demandée est `5d38b1fdd9c08df9033f674e57e26b09b7b6f261`, actuellement sur `origin/arena/dbf2d44f-melodix` (PR 6). La branche demandée `arena/a7599eaa-melodix`, le commit `9eb41eb` et le tag `v4.4.0` ne sont pas présents dans les références GitHub disponibles. Un résultat Web indexé mentionne `v4.4.0` et `9eb41eb`, mais la page et l'API de release renvoient 404 : leur code n'a pas pu être comparé.

Un jalon plus ancien, `5986ed6b2ca40f0efb4cedfc877fdcf56322ba24`, ancêtre de `5d38b1f`, est décrit par le commit `e6035751` comme le dernier accueil dont une capture utilisateur montrait des playlists ; `31767147` republie une base tirée de ce jalon. La documentation `docs/mobile-ui-redesign-2026-10-20.md` évoque une capture antérieure, mais comporte aussi des contrôles de bibliothèque et détail encore à effectuer sur appareil. `e6035751` précise qu'il n'y a pas eu de nouveau test téléphonique de la restauration. Ce sont des indices de playlists visibles à cette époque, **pas** la preuve que le chargement complet ou l'ouverture fonctionne aujourd'hui, ni que `5d38b1f` soit le dernier état fonctionnel. Le shell historique pouvait également récolter des liens du DOM et de la barre latérale : une capture d'accueil seule ne prouve pas que `libraryV3` a réussi.

## Chaîne et protections

| Référence | Comportement constaté dans le code |
| --- | --- |
| `5d38b1f` | Interception globale de `window.fetch`, lecture d'un bearer et d'autres éléments du Web Player, stockage local et attente brève d'un bearer avant `libraryV3`. La bibliothèque reçoit le bearer ; le code ancien peut transformer certains échecs ou réponses incomplètes en liste vide/partielle. |
| `719f9ec5` | Renforcement de la lecture de bibliothèque pour distinguer les erreurs d'une bibliothèque vide. Cette distinction reste nécessaire. |
| `45b0de99` | Suppression de la capture de credentials et des proxys, avec changements étendus du bridge, WebView et lecteur. Une restauration totale ne serait pas ciblée. |
| `85d7293e` | Après suppression de la capture, rend de nouveau atteignable `libraryV3` avec cookies seuls. Le commit annonce des tests VM, pas une preuve Spotify sur téléphone. Cette stratégie seule a échoué par 401 dans le test utilisateur récent. |
| `35de93c7`, `7543b274` | Conditionnement de l'accueil et de la session à une preuve de bibliothèque privée, puis durcissement du shell ; un simple DOM de lecteur n'est pas une preuve de réponse bibliothèque. |
| `d7d253f0`, `cc29cac3`, `d77d8ec3` | Acquisition directe d'un jeton du lecteur, repli et évolution des en-têtes. Les valeurs ne sont pas reproduites dans ce rapport. |
| `0c3ed32c`, `392f785a` | Blocage des requêtes bibliothèque sans jeton et rejet d'un jeton expiré ou sans expiration vérifiable. |
| `d6e7c5ff` sur la branche actuelle | Retrait ciblé du blocage sans jeton : tentative avec cookies en l'absence de bearer ; une réponse valide reste exigée. La gate native accepte cette preuve sans bearer. L'expiration des bearers obtenus et les refus HTTP restent contrôlés. |

Aucune protection supplémentaire n'a été retirée et aucune interception historique n'a été réintroduite pendant cette enquête. Réutiliser un bearer vu sur une requête du Web Player pourrait être une piste différente du chemin cookies, mais on ne sait pas si le lecteur effectue une telle requête dans la session réelle, ni si elle arrive après l'injection du bridge, ni si elle autorise la bibliothèque. Une restauration brute enregistre des credentials et change d'autres voies ; elle ne prouverait pas le résultat et dépasserait le périmètre. Une éventuelle expérimentation ciblée doit d'abord établir émission et timing, origine et durée de vie, isolement des sessions, invalidation, non-divulgation et respect des refus.

## Vérifications

- Nouveau `tests/playlist_bridge_shell_flow.test.js` : le vrai bridge et le vrai shell s'exécutent ensemble en VM ; réponses HTTP, DOM et callback natif sont synthétiques. Après 400/403 aux endpoints de jeton, une réponse bibliothèque 200 synthétique transmet la playlist synthétique au callback natif d'accueil. Les réponses bibliothèque 400, 401 et 403 ne transmettent pas cette playlist et ne donnent pas une session prouvée. Ce test ne prouve ni rendu Android final ni succès Spotify.
- Suite complète locale avec outils Java/YAML : **1 320 réussis, 0 échec, 0 ignoré**. Une première exécution sans ces outils en avait ignoré cinq ; l'exécution complète remplace ce résultat incomplet.
- La CI Android du build `64f4215`, [run 43271120992](https://github.com/Souxch06/Melodix/actions/runs/43271120992), reste rouge pour les deux versions WebView dans la phase `queued_real_retry_invalidation`. Dans la fixture Android inchangée, cette phase exige exactement les deux requêtes token et aucune requête bibliothèque ; le code actuel effectue une requête bibliothèque supplémentaire quand les deux jetons sont refusés. Il existe donc une contradiction de contrat démontrable, mais l'annotation CI ne donne pas la ligne exacte de l'assertion en échec ; le téléchargement détaillé des logs a échoué. Aucune fixture Android ni persistance n'a été modifiée. Les autres jobs signalés verts ne démontrent pas l'accès à un compte réel.

Pour aller plus loin, il faut une preuve non sensible de l'existence et du moment des requêtes authentifiées du lecteur dans la session concernée, puis un test de la voie réellement autorisée. Toute expérimentation doit conserver les refus HTTP, vérifier la réception jusqu'à l'interface, lever explicitement le conflit de contrat Android sans supprimer ni ignorer les tests, et être validée avant production d'un APK Preview.
