# Test161 — résultats autonomes, fixtures et session réelle

## État et périmètre

- HEAD initial vérifié : `62138d97b4ad1c36669e19169698b77d9ac564a4`. Branche `arena/6b935c3e-melodix`, [PR #8](https://github.com/Souxch06/Melodix/pull/8) ouverte. `main` : `81ef774fcb2208d4c4e999943411040aa1bfa33f` au contrôle initial. Le diff entre `d0144d425fd211756e32e91bea24d108d0e623b1` et le HEAD initial contient uniquement le rapport test160.
- Checkout partagé laissé intact, HEAD `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, empreinte SHA-256 de son statut `218e42f623f0f1e9a33cd7fdb94aea06a51dd8bde8850264ec992971c27af87e`. Travail dans un clone isolé de la branche. Aucun merge ni release.
- **La mission n'est pas entièrement accomplie.** Les changements portent sur les tests et diagnostics, pas sur le produit : le vrai shell reste bloqué tant que le gate exige la preuve de session. La démo et la fixture ne prouvent pas une interface personnelle ou une intégration Spotify fonctionnelle.

## Trois catégories, résultats distincts

| Catégorie | Résultat | Ce que cela signifie |
|---|---|---|
| A — autonome | **3/3 profils passés**, [run 43171767839](https://github.com/Souxch06/Melodix/actions/runs/43171767839) | Parcours de la **démo isolée** sur l'APK test160 exacte ; ni interface authentifiée, ni fonctionnement complet hors session de l'application réelle. |
| B — intégration synthétique | **fixture WebView passée**, [run 43169801631](https://github.com/Souxch06/Melodix/actions/runs/43169801631) | HTML local, données et preuve synthétiques, réseau WebView bloqué. Pas une vraie page/session Spotify. L'injection d'assets est faite par l'instrumentation, pas par le parcours de production. |
| C — session Spotify réelle | **EN ATTENTE**, [statut explicite](https://github.com/Souxch06/Melodix/actions/runs/43171767839/artifacts/13922202512) | Authentification, données réelles, OAuth, bibliothèque et réglages réels non validés. Le job qui produit ce statut est vert uniquement pour signaler la précondition ; ce n'est pas un test C réussi. |

Le strict d'origine `capture_launcher_acceptance.py` reste inchangé ; ses réglages authentifiés ne sont ni contournés ni déclarés verts. Le script A est un parcours séparé. L'absence de session ne produit plus un échec dans ce parcours limité à la démo, mais elle ne garantit pas l'accès aux vrais réglages.

### A — Android autonome et captures

Sur petit écran 360×640, téléphone et tablette 1920×1200, installation propre de l'APK test160 de SHA vérifié, lancement launcher, accueil, bibliothèque, playlist fictive, retour Android, recherche, résultat vide fictif, réglages de **démo**, retour accueil, écran lecteur fictif, sortie de démo et relancement du launcher ont été vérifiés. Un badge `MODE DÉMO · HORS LIGNE` est obligatoire à chaque capture démo. Le scan `AndroidRuntime` ne trouve pas de `FATAL EXCEPTION` sur ces parcours. Le lecteur est une présentation fictive : aucune lecture audio réelle n'est prouvée. La sortie exige que la démo disparaisse et que le package soit au premier plan ; elle ne valide pas le contenu de la surface suivante.

- [Captures petit écran](https://github.com/Souxch06/Melodix/actions/runs/43171767839/artifacts/13921529733)
- [Captures téléphone](https://github.com/Souxch06/Melodix/actions/runs/43171767839/artifacts/13922577660)
- [Captures tablette](https://github.com/Souxch06/Melodix/actions/runs/43171767839/artifacts/13923125002)

Les deux premiers runs A ont échoué au retour de démo. Une observation expurgée [43171145901](https://github.com/Souxch06/Melodix/actions/runs/43171145901) a identifié le contrôleur de permissions Android au premier plan : le script A n'en tenait pas compte dans sa boucle de retour. La correction traite la permission sur l'émulateur propre, comme le strict existant ; elle ne crée aucune session. La récupération XML UIAutomator est aussi retentée de façon bornée et refuse un dump échoué/stale. Ces corrections sont celles du **test**, pas une correction de produit. Les captures des runs rouges sont conservées dans les artefacts correspondants.

### B — fixture bridge : preuve et limites exactes

[Résultat et trace](https://github.com/Souxch06/Melodix/actions/runs/43169801631/artifacts/13921348603). `LocalBridgeInstrumentation` crée une WebView jetable dont les chargements réseau sont bloqués, avec HTML synthétique chargé via `loadDataWithBaseURL` et URL de base `https://open.spotify.com/`. Il s'agit d'une **origine simulée dans la fixture**, pas d'une page Spotify téléchargée. La politique de production `NativeBridgeNavigation.prepare` et le véritable objet `AndBridge` sont utilisés : le getter Java est effectivement appelé depuis JavaScript et son résultat revient au JavaScript.

L'instrumentation injecte manuellement les vrais assets `runtime_state.js`, `native_ui_shell.js`, `spotify_bridge.js` et `melodix_home.js`, observe leurs marqueurs de démarrage/bootstrap, envoie une donnée native vers le DOM et vérifie une réception JS → Java par `FixtureReceiver`, un canal **de test distinct** du callback produit. Elle vérifie que l'accueil est inactif sans preuve, puis, avec une preuve explicitement synthétique en mémoire de cette WebView de test seulement, exerce les rendus d'erreur `token-missing`, d'état vide et une navigation vers recherche. Elle vérifie la disparition de `AndBridge` et du canal de fixture sur `external.invalid` et `accounts.spotify.com`. Aucun élargissement des origines en production ; aucun cookie ou compte manipulé.

Cette preuve ne démontre **pas** l'injection automatique par l'application, ni la réception/rendu natif d'un payload `AndBridge.onNativeUiData`, ni un aller-retour complet du bridge produit dans l'activité réelle. `FixtureReceiver` n'est pas le bridge de production. Aucun rendu ou accès à une vraie page Melodix connectée n'est démontré. L'état « accueil inactif sans preuve » confirme que la demande d'interface réelle montée malgré refus n'est pas résolue.

## Interface réelle : blocage restant et correction à concevoir

Ce n'est pas seulement une question de tests. `NativeSessionSurface.protectUnderlyingViews` met `nativeRoot` en `GONE` et retire son accessibilité tant que `NativeSessionGate.state != 3` ; `NativeSessionGate.blocked` empêche aussi les opérations de rendu, et `melodix_home.source.js` désactive son rendu lorsque la preuve bibliothèque n'est pas établie. Donc ni les réglages réels ni le shell de production ne sont actuellement prouvés utilisables sans session/refus. La fixture démontre le garde, elle ne le répare pas.

Une réparation sûre devra séparer visibilité/navigation du shell, statut de connexion et autorisation de données ; vider/invalider les données privées précédentes et leurs générations avant tout affichage non prouvé ; présenter des états neutres et une action explicite de connexion ; ne jamais remplacer une bibliothèque privée par des données fictives. Elle doit conserver les restrictions de bridge et vérifier transitions session valide → refus → reconnexion, absence de fuite de données périmées et comportement arrière/rotation. Changer uniquement `state` ou enlever le garde exposerait potentiellement des données périmées et ne constitue pas une correction démontrée. Aucun tel changement n'a été livré ici.

## Spotify et playlists

- Le login `accounts.spotify.com`, les cookies WebView, l'OAuth officiel, le jeton du lecteur, la bibliothèque privée et le rendu sont des étapes séparées. Le code inspecté n'implémente pas un flux Melodix complet Authorization Code + PKCE ; aucun Client ID demandé ou ajouté. [Documentation PKCE Spotify](https://developer.spotify.com/documentation/web-api/tutorials/code-pkce-flow) : challenge S256, redirect enregistré exactement, échange du code, refresh et scopes adaptés.
- Les accès existants `open.spotify.com/api/token`, `open.spotify.com/get_access_token` et `api-partner.spotify.com/pathfinder/v2/query` (`libraryV3`, requête persistée) sont des mécanismes internes du lecteur non garantis, **pas** l'API publique officielle. Aucun nouvel endpoint n'a été ajouté.
- Pagination actuelle : pages de 50, offset borné sous 1000, arrêt sur page courte, changement de génération/époque ou expiration du jeton ; les tests de pagination et 401/403 sont des fixtures. Une absence de jeton ne doit pas être transformée en 401 bibliothèque. La cause des anciens 400/403 reste inconnue sans réponse réelle expurgée.
- Les playlists personnelles ne sont pas validées. Pour une future API officielle, le [guide Dev Mode 2026](https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide) documente notamment `/items` et les limites applicables aux playlists possédées/collaboratives ; le [guide des quotas](https://developer.spotify.com/documentation/web-api/concepts/quota-modes) s'applique selon le mode. Ces règles ne prouvent pas la cause des erreurs observées.

## Clé QA et signature

La QA persistante est distincte de la clé Preview. Le build QA échoue explicitement quand `MELODIX_TEST_KEYSTORE_B64` manque ; l'intégration ne peut pas lister les secrets (HTTP 403). La documentation d'historique indique qu'une ancienne clé est restée dans un sandbox réinitialisé et que la clé persistante suivante n'a pas pu être déposée : l'état effectif de la clé d'origine doit être vérifié par un responsable autorisé. Voir `docs/audits/melodix-test-secret-setup.md`, sans divulguer ni recréer silencieusement une clé.

Une clé éphémère ne peut pas démontrer la compatibilité d'une mise à jour entre runs ni remplacer la signature de production/Preview. Le test `scripts/run_ephemeral_signing_fixture.sh` ne signe qu'une paire de packages `com.melodix.ci.ephemeralfixture` dédiée, distincte de Melodix ; la clé est créée dans le dossier temporaire et retirée en fin de job. Il ne s'agit pas d'une clé QA persistante ou d'une release. [Run 43174175504](https://github.com/Souxch06/Melodix/actions/runs/43174175504) : installation et mise à jour de la **même** fixture sur un émulateur jetable, instrumentation signée par la même clé et certificat différent de la Preview : **passés**. Les premières tentatives ont échoué à la compilation du manifeste puis au lancement d'une cible sans code ; elles restent visibles dans les runs 43171886906, 43172344102, 43172687270, 43173017385, 43173419970 et 43173804414. Le résultat final ne prouve ni la signature persistante ni la mise à jour de Melodix.

Procédure extérieure, si nécessaire : le détenteur autorisé retrouve et vérifie hors dépôt la clé QA persistante et son certificat public attendu ; il configure le secret Actions correspondant sans exposer la valeur, puis relance une CI QA **non publiant de release** après vérification de ses permissions et conditions. Ne pas demander ni transmettre de secret ici. Les anciens scripts QA incluent un job de publication conditionnel : ne pas lancer cette voie en supposant qu'elle est purement diagnostic sans contrôler ses conditions.

## Suites, APK et priorités

- Base : **1 261/1 261** sans échec/skip ; après ajouts **1 265/1 265** sans échec/skip sur `ad4daac9`, y compris les tests existants et les contrôles A/B. Outillage Java/ECJ/Android temporaire. Tests unitaires et fixtures ne remplacent pas l'appareil réel.
- Aucun fichier produit modifié ; aucun build Preview test161, pour ne pas reconstruire une application identique. APK expérimentale utilisée : [test160](https://github.com/Souxch06/Melodix/actions/runs/43168233767/artifacts/13920594061), `com.melodix.music.preview`, versionCode `1021508`, versionName `1.2.2-d0144d4`, SHA-256 `7d3288bca24b8316aa80316d5f9a606fbd850c4d3c058cc7c7477a26227623aa`, certificat `e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f`. Valeurs vérifiées en CI test160 ; artefact expérimental non validé globalement. Le package peut cohabiter avec un package différent ; mise à jour d'une Preview existante selon signature et versionCode, état de l'appareil inconnu.
- **P0** : aucun crash/démarrage impossible détecté sur les parcours démo ci-dessus ; cela ne couvre pas toutes les configurations.
- **P1** : shell réel sans session/refus, réglages réels, reprise/navigation en production, injection et échanges complets du bridge réel encore à réaliser et vérifier ; pas de test physique.
- **P2** : authentification Spotify réelle, OAuth et playlists, causes des 400/403 ; précondition C non satisfaite. Clé QA persistante à établir avec une autorité appropriée.
- **P3** : contrôles de réseau réels, contraste et adaptation sur appareils supplémentaires, réduction des dépendances aux libellés distants, mises à jour d'actions dépréciées.

## Fichiers et commits

Fichiers ajoutés ou modifiés : `.github/workflows/demo-existing-apk-replay.yml`, `.github/workflows/test161-independent.yml`, `scripts/acceptance_autonomous.py`, `scripts/build_local_bridge_test.sh`, `scripts/run_local_bridge_test.sh`, `scripts/run_ephemeral_signing_fixture.sh`, `tests/android/LocalBridgeInstrumentation.java`, `tests/test161_acceptance_contract.test.js`, ce rapport. Aucun test existant supprimé ; aucun fichier produit ni origine autorisée modifié.

Commits : `3de9efbe`, `60bf4af9` séparation A/B/C ; `7a6bf75e`, `9988bb58`, `45a31d64`, `789a3952` diagnostic et correction du parcours A ; `39c01e7d`, `3f5363b6`, `960be5e0`, `950f32a5`, `abd73050`, `73798efe`, `ad4daac9` expérimentation isolée de signature et ses diagnostics. Ce rapport est commité séparément ; le HEAD final est consultable par `git rev-parse HEAD`. Aucun commit de produit ni nouvelle APK test161.
