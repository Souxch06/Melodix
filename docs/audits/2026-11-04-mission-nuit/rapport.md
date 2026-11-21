# Mission de nuit — état vérifiable et livraison expérimentale

## État / livraison

**L'application complète n'est pas validée.** Une Preview expérimentale a été construite par le workflow habituel, installée et lancée sur émulateur ; sa validation Android stricte reste rouge. Les démos hors ligne ont été parcourues sur deux tailles, mais ce ne sont ni l'interface réelle authentifiée ni les données Spotify de l'utilisateur. Aucun appareil physique ni compte Spotify autorisé n'était disponible.

- APK : [Melodix-Preview-v1.2.2-test159.apk — artefact GitHub ZIP](https://github.com/Souxch06/Melodix/actions/runs/43107820755/artifacts/13893829564).
- Source exacte : `392f785af7887eaffae04e948f5090c44281651d`; nom `1.2.2-392f785`; versionCode `1021505` (> test158 `1021504`); package `com.melodix.music.preview`.
- SHA-256 **de l'APK**, non de son ZIP : `31f561be0765c0d7f5b4b790ded3f47c5a86b877ab6dd0b8c7c8f5d2c224f8f7`.
- Certificat Preview SHA-256 : `e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f`.
- L'inspection du runner `130816879842` vérifie aapt/apksigner, l'identité, le hash et DemoEntry dans `classes2.dex`. Le rejeu `43108989960` a retéléchargé l'APK et revérifié ce SHA avant chaque installation. Le sandbox local ne peut pas lire les blobs GitHub (EOF/502) : les octets n'ont pas été recalculés localement.
- Référence antérieure : [test158](https://github.com/Souxch06/Melodix/actions/runs/43094648501/artifacts/13890636572), SHA `2251561cc171edba1059ce3250e3ba1b66172050bd25b8eff57f321736e76bf9`. Elle reste expérimentale et n'a pas été supprimée.

La Preview peut cohabiter avec une application utilisant le package normal `com.melodix.music`. Si une Preview de même package est déjà installée, il s'agit d'une mise à jour soumise aux certificats et versionCodes effectivement présents sur le téléphone ; ceux-ci ne sont pas connus ici. En cas de refus, conserver l'application et ses données, ne pas désinstaller ni effacer la session.

## A. Référence Git et WIP

L'état avant modifications figure dans [reference.md](reference.md). PR [#8](https://github.com/Souxch06/Melodix/pull/8), branche `arena/6b935c3e-melodix`, HEAD initial `899aaec41d73b850e7092a9485a9bff6dd7d6f25`, parent `9ef2dc4032fceb2920465e38386aa028494029ca`. Les commits `0c3ed32c`, `b514e528`, `b056bc8a` et la référence historique `5986ed6b2ca40f0efb4cedfc877fdcf56322ba24` existent dans l'historique isolé. `main` distant est resté à `81ef774fcb2208d4c4e999943411040aa1bfa33f` lors des contrôles. Aucun merge, release, push forcé ni modification de main.

Checkout partagé `/home/user/Melodix` : WIP préservé ; hash de son `git status --porcelain=v1` avant et après : `218e42f623f0f1e9a33cd7fdb94aea06a51dd8bde8850264ec992971c27af87e`. Le fichier non suivi `docs/audits/2026-11-04-token-test157/etat-preview158.md` préexistait aussi dans le clone isolé et reste intact.

Commits de la mission :
- `82cdabb0` — distinguer les erreurs affichées sur l'accueil Web.
- `634b7f14` — diagnostic de démo de l'APK test158 originale, sans reconstruire.
- `392f785a` — refuser les jetons expirés ou à expiration invérifiable ; source de test159.
- `89cf0532` — réutiliser le diagnostic de démo sur l'APK test159 originale, sans la reconstruire.
- Le rapport et l'état de référence sont des documents, pas des changements de produit ; consulter `git log` pour le HEAD exact incluant la documentation.

## B. Corrections démontrées

### Accueil Web — erreurs distinctes

Le test de reproduction avec `token-missing` affichait auparavant « Vérifiez la connexion » malgré l'absence de preuve de panne réseau. `scripts/melodix_home.source.js` et l'asset généré `assets/melodix_home.js` distinguent désormais jeton indisponible, réponse mal formée, réseau/délai et cause inconnue, en plus des HTTP confirmés 401/403/429 et 5xx. Messages traduits en français, anglais, espagnol, allemand, italien et portugais. `tests/melodix_home.test.js` vérifie les distinctions, l'absence de faux 401/403 et le bouton de relance ; les tests ne simulent qu'une preuve de session pour exercer le rendu DOM. Aucune démonstration sur une page Spotify authentifiée réelle.

### Jetons — expiration

Reproduction avant correctif : une réponse **synthétique** avec `accessTokenExpirationTimestampMs` déjà passé déclenchait une requête bibliothèque, car l'ancien code fabriquait une expiration d'une heure. Autre reproduction : après expiration pendant la pagination, 20 requêtes avec le jeton périmé étaient possibles. `scripts/spotify_bridge.source.js` et son asset généré rejettent désormais les valeurs absentes, non textuelles, blanches, expirées ou sans expiration vérifiable ; avant chaque page, la validité et l'identité du jeton en cache sont revérifiées. L'expiration interrompt la pagination et invalide la preuve partielle, sans inventer de 401 ou déclarer une session expirée. Une réponse secondaire valable est toujours utilisable après un premier jeton expiré. Aucun endpoint, paramètre, en-tête, cookie ou accès Spotify n'a été contourné.

Tests `token_expiry_regression.test.js`, `session_attempt_diagnostic.test.js` et voisins : réponses factices uniquement. Les comparaisons historiques normalisent seulement les blocs exacts revus et continuent d'exiger l'identité octet pour octet du reste ; la fixture 401/403 reçoit une expiration future au lieu d'un jeton à durée inconnue. **Limite importante :** si un vrai endpoint interne renvoie un jeton sans expiration vérifiable, il est maintenant refusé par précaution ; son format réel n'a pas pu être vérifié ici et peut nécessiter une adaptation documentée, sans inventer de durée.

### Android / critères

L'échec de l'attente `sessionTitle` est reproductible et ce titre est volontairement `gone` dans le layout de connexion. Les critères d'acceptation Android n'ont pas été modifiés pour passer artificiellement ; aucun correctif du parcours réel n'a été annoncé sans preuve de son état et de son bouton démo. Le test Android d'instrumentation `SessionGateInstrumentation.java` exige également le titre visible dans certains scénarios et n'a pas été exécuté lors de ce run ; sa compatibilité doit être étudiée avec un oracle de surface réel et au moins les mêmes garanties.

## C. Tests et CI

| Vérification | Résultat et limites |
|---|---|
| Suite locale sur le code produit `392f785a` et suite sur HEAD de code/diagnostics `89cf0532` | **1 258/1 258**, 0 échec, 0 ignoré ; outillage Java/Android temporaire réel. |
| Tests ciblés bibliothèque, token, refus, concurrence, pagination, diagnostic | **81/81** après correction ; test ciblé de repli/expiration **11/11**. Fixtures synthétiques, pas réseau Spotify. |
| Accueil Web, visibilité et traces | **55/55** ; jsdom et CSS réel, pas WebView Android authentifiée. |
| Suite CI obligatoire Preview | Réussie avant build dans [43107820755](https://github.com/Souxch06/Melodix/actions/runs/43107820755) ; son script exige 0 échec et 0 skip. |
| Validation stricte Android | **Échec**, `Fresh emulator launcher and actual user navigation` : `real session surface not observed`, liste visible `Spotify`, `Welcome back`, `Email`, `Continue`. Inspection APK réussie ; captures finales et bundle validé non produits. |
| Installation/lancement Android 16 | Réussis sur émulateurs via le run strict et le rejeu de l'APK exacte. Pas de test physique ni de mise à jour sur téléphone. |
| Démo hors ligne Android | [43108989960](https://github.com/Souxch06/Melodix/actions/runs/43108989960) réussi sur téléphone et petit écran ; installation, icône/launcher, accueil, bibliothèque, playlist fictive, recherche, retour accueil et lecteur observés. La sortie a été cliquée mais la surface après sortie n'a pas été assertée par ce rejeu. |
| WebView/bridge Android, page cible authentifiée | Non testés avec une session réelle ; ne pas déduire leur succès des envois de données ou du rendu démo. |
| Spotify OAuth et playlists réelles | Non testés : aucun flux OAuth PKCE applicatif configuré identifié, aucun compte de test autorisé disponible. Pas de test de déconnexion réelle. |
| QA séparée | Run `43107810820` rouge car `MELODIX_TEST_KEYSTORE_B64` absent ; la suite de ce workflow est verte. Cette clé QA distincte n'est pas la clé Preview. |
| Métriques Android séparées | Run `43094642658` : build réussi, mais racine native non mesurée en 180 s sur téléphone et tablette ; zéro exception fatale rapportée, données insuffisantes pour affirmer une cause. |

## D. Interface et captures réelles de démo

Les captures suivantes proviennent de l'APK **test159 exacte**, sur émulateurs vierges, réseau coupé, depuis le launcher : [téléphone](https://github.com/Souxch06/Melodix/actions/runs/43108989960/artifacts/13894519753) et [petit écran](https://github.com/Souxch06/Melodix/actions/runs/43108989960/artifacts/13894959170). Chaque ZIP contient `accueil.png`, `bibliotheque.png`, `playlist.png`, `recherche.png`, `retour-accueil.png`, `lecteur.png` et des résumés JSON. Le script vérifie effectivement des éléments visibles, le badge `MODE DÉMO · HORS LIGNE`, et les étapes de navigation ; les titres et la playlist sont **fictifs et isolés dans la démo**. Ces captures n'ont pu être ouvertes localement à cause du stockage inaccessible ; les descriptions reposent sur les assertions et annotations du runner.

La comparaison avec `5986ed6b` montre une évolution architecturale majeure (239 fichiers modifiés dans les ressources, scripts, assets, Smali et démo) : un remplacement complet serait destructif. Les sources actuelles contiennent un accueil Web conditionné par l'origine, les styles et une preuve de bibliothèque, et un shell natif distinct ; leur existence et les tests DOM ne prouvent pas leur visibilité sur la page Spotify authentifiée. Aucune restauration générale de l'interface n'a été prétendue ni réalisée. Recherche réelle, navigation réelle et contenu de playlist réel restent à vérifier. Les sources audio envisagées Audius/YouTube ne sont pas déclarées opérationnelles ici ; aucune interface invitée alternative n'a été ajoutée.

## E. Chaîne Spotify et bridge

- Flux actuel : WebView du lecteur, GET interne `/api/token` puis `/get_access_token?reason=transport&productType=web_player` avec cookies et en-têtes existants ; réponse `accessToken` attendue. Ensuite `libraryV3` interne `api-partner.spotify.com`, Bearer requis. Ce ne sont **pas** des API officielles garanties.
- Les observations historiques indiquent 400 puis 403 côté token, sans corps conservé. La cause reste inconnue : ni quota OAuth, ni périmètre, ni expiration de session ne sont démontrés. Aucun accès réel n'a été tenté avec des secrets.
- Jeton absent/invalide : aucune nouvelle requête bibliothèque, `token-missing`, pas de 401 inventé, aucune preuve d'expiration ; vrais 401 et 403 bibliothèque après bearer gardent leurs catégories, 429 respecte le délai borné, réseau et formats invalides restent distincts. Une session réellement expirée n'est pas déduite des seuls refus de jeton ; il n'existe pas ici de démonstration positive d'expiration.
- Un jeton OAuth Web API et un jeton interne de lecteur ne sont pas interchangeables par hypothèse. Aucun client ID à saisir, jeton ou identité factice en production n'a été ajouté. Les sources ne montrent pas de flux PKCE applicatif complet utilisable dans ce build.
- `NativeBridgeNavigation.prepare` attache `AndBridge` uniquement sur `https://open.spotify.com` port par défaut/443 selon `NativeSessionTrace.playerOrigin` ; il le détache pour les autres origines, dont accounts. `postNativeUiData` enfile les données ; `applyNativeUiData` consulte `NativeSessionGate.blocked` avant parsing/rendu. L'absence du bridge sur accounts est attendue. Les événements envoyés ne prouvent pas l'exécution, l'affichage ou la mise à jour sur le lecteur réel.
- Les tests simulent initialisation, sérialisation, parsing, pagination et garde ; l'initialisation complète, le bootstrap et `#sf-melodix-home` n'ont pas été observés sur la page cible authentifiée. Ne pas élargir les origines pour forcer un résultat.

La documentation officielle recommande [Authorization Code + PKCE](https://developer.spotify.com/documentation/web-api/tutorials/code-pkce-flow) pour mobile ; un Client ID d'application enregistrée et une redirect URI exacte sont nécessaires, sans champ de saisie utilisateur. [Les scopes](https://developer.spotify.com/documentation/web-api/concepts/scopes) dépendent des données ; `GET /me/playlists` pagine jusqu'à 50 éléments selon [la référence](https://developer.spotify.com/documentation/web-api/reference/get-a-list-of-current-users-playlists). [429 et Retry-After](https://developer.spotify.com/documentation/web-api/concepts/rate-limits) sont distincts des refus. La [migration 2026](https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide) limite les éléments accessibles de certaines playlists et renomme `tracks` en `items` ; le [mode développement](https://developer.spotify.com/documentation/web-api/concepts/quota-modes) impose notamment Premium au propriétaire et une liste limitée d'utilisateurs. Ces règles officielles ne prouvent pas la cause des 400/403 internes.

## F. Diagnostic Android détaillé

- Test158 : téléchargement et inspection dans le runner, installation par `adb install` avant exécution du script, launcher et clic `Ouvrir Melodix` observés ; écran Spotify de connexion affiché. La WebView a été observée par un rejeu distinct, qui est arrivé à un autre état. La navigation complète, le retour démo et le bridge lecteur n'ont pas été démontrés par ce run. [Annotations du run](https://github.com/Souxch06/Melodix/actions/runs/43094648501).
- Test159 : même assertion de surface (`sessionTitle`) en échec avec les mêmes libellés Spotify ; l'APK et sa signature ont été inspectées, installées et lancées. Le code de la page cible et le bridge ne sont pas établis par la seule présence de texte de connexion.
- Les deux runs ont tenté d'envoyer des diagnostics ; l'envoi initial test158 a échoué à la finalisation ; l'envoi de test159 a réussi. Le sandbox local reste bloqué par EOF même après nouvelle tentative. [Diagnostics partiels test159](https://github.com/Souxch06/Melodix/actions/runs/43107820755/artifacts/13895621160).
- Un premier rejeu de test158 a observé WebView, surface et bouton démo mais sa propre attente rigide `Spotify` a échoué ; un second n'a pas observé la WebView dans le délai. Ne pas présenter ces échecs de sonde comme une preuve d'un crash produit.

## G. Priorités restantes

- **P0 — démarrage :** aucun crash immédiat démontré sur les parcours de démo ; démarrage réel et stabilité prolongée sur téléphone non validés.
- **P1 — interface réelle / acceptation :** identifier avec trace et captures réelles la surface et le bouton démo pendant le login, puis corriger le décalage entre titre masqué et instrumentation sans diminuer les garanties. Poursuivre le contrôle du retour après démo, des réglages réels et de l'écran lecteur authentifié ; l'acceptation stricte ne doit pas être contournée.
- **P1 — bibliothèque et bridge :** observer le bridge sur `open.spotify.com` avec une session déjà autorisée, vérifier le rendu effectif et les étapes de parsing/navigation. Diagnostiquer les réponses token 400/403 sans collecte de secrets. Une configuration d'application et des autorisations externes sont indispensables avant d'implémenter honnêtement l'API officielle ; ne pas demander de Client ID dans l'interface.
- **P1 — durée du token :** la validation fail-closed repose sur l'expiration fournie par le mécanisme interne non documenté ; vérifier les formats et l'horloge sur un contexte réel. `fetchWebPlayerToken` attend actuellement les réponses token sans délai explicitement borné : une requête qui ne se résout pas peut bloquer la vérification ; reproduire et traiter avec tests de concurrence/annulation avant de modifier le mécanisme réseau.
- **P2 — CI :** rétablir la clé QA persistante par la configuration autorisée du projet ; analyser pourquoi la métrique native n'atteint pas `nativeRoot`, sans confondre ce build QA/debug et l'APK Preview.
- **P2 — visuel :** contrôler captures et géométrie réelles, bibliothèque, recherche, playlist, rotation et petites tailles sur la page authentifiée ; la démo ne prouve pas la restauration Web.
- **P3 — entretien :** les sources comportent des listeners et temporisations de lecture historiques à auditer séparément ; le chantier audio/minuterie a volontairement été laissé intact.

## RÉSUMÉ VÉRIFIABLE

Deux corrections ciblées avec tests, CI Preview verte avant build, nouvelle APK signée et installée sur émulateur, captures démo réelles sur deux tailles. Validation stricte rouge, Spotify réel et interface authentifiée non prouvés. L'APK reste expérimentale ; aucune release publique ni merge.
