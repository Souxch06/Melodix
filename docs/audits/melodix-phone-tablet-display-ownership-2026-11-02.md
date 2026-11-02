# Note de correction P0 — différencier téléphone et tablette

- **Date :** 2 novembre 2026
- **Branche :** `arena/7142700d-melodix` (PR #7 maintenue ouverte)
- **Observation utilisateur :** APK `1.2.2-5de71c0`; cette observation est rapportée par l’utilisateur et n’a pas encore été reproduite dans l’émulateur de CI.

## COMPLÉMENT IMPORTANT — COMPORTEMENT DIFFÉRENT TÉLÉPHONE / TABLETTE

**Téléphone :** Melodix apparaît brièvement au démarrage, puis Spotify Web reprend le contenu central tandis que le dock natif Melodix reste visible.

**Tablette :** l’interface Melodix s’applique directement et reste affichée. Des défauts visuels de playlists subsistent, mais le remplacement complet par Spotify Web n’est pas reproduit.

Il ne faut donc pas traiter l’incident comme un comportement uniforme sur tous les appareils, ni corriger la propriété de l’affichage d’une manière qui dégrade le rendu tablette. Les défauts des playlists sont un sujet distinct de la reprise du contenu central par Spotify Web.

## Comparaison exigée avant validation

Comparer le même APK et le même état de session déconnecté sur deux profils Android reproductibles :

| Profil | Cible | État à établir |
|---|---|---|
| Téléphone compact | Émulateur de dimensions compactes et densité de téléphone | Mesurer résolution physique/logique, largeur/hauteur en dp, densité, `smallestScreenWidthDp`, orientation et viewport WebView. |
| Tablette large | Émulateur de dimensions larges et densité de tablette | Mesurer les mêmes paramètres et vérifier le comportement de la configuration `sw600dp`/large largeur disponible. |

**État des tests au 2 novembre :** le workflow courant n’exécute qu’un profil d’émulateur; sa matrice de largeurs WebView est une fixture isolée, pas une reproduction tablette du même APK. La comparaison réelle téléphone/tablette ci-dessous reste à mettre en place et à valider; aucune preuve de non-régression tablette n’est actuellement revendiquée.

Pour chaque profil, conserver uniquement des métadonnées non privées et comparer :

- `SF_CONFIG.guiMode` (`csshack`, `bigwindow` ou valeur autorisée/inconnue) ;
- largeur/hauteur en pixels et dp, densité Android, `smallestScreenWidthDp`, orientation ;
- viewport WebView (`innerWidth`/`innerHeight`, `screen`, `devicePixelRatio`) ;
- classes CSS Melodix/mobile explicitement autorisées sur le `body` (aucun `className` complet ni texte Spotify) ;
- visibilité, géométrie et ordre réel de `nativeRoot` et du conteneur WebView ;
- transitions de propriétaire d’affichage, réduites aux catégories native/Web/login et aux routes autorisées.

Capturer et vérifier les deux profils aux échéances **200 ms, 1 s, 3 s, 8 s et 20 s**. Associer explicitement chaque mesure à son profil et à son temps observé; ne pas présenter une mesure après stabilisation comme si elle était prise depuis le lancement. Le même APK doit être identifié par son SHA de build de CI. Chaque profil repart d’un état de session déconnecté identique, sans compte, cookie ni contenu privé fourni par le test.

## Diagnostic CI distinct — blocage avant les mesures d’écran

Le run `41470619043`, source `b0fbd6d92a20c958822f2ef8c297b44c6fda5a34`, a construit les deux APK et vérifié leur provenance; l’installation du SDK a réussi. APK instrumentation : SHA-256 `52456602862c0f3f1db86f37f63764447a6411c51b2e7316501ca044aac6de24`; candidat non débogable : SHA-256 `f69da0ecda9ee8f5a34dda7e3aa97d772a42426d95f45d80cb05f1c4257a2b82`. L’émulateur n’a toutefois pas gardé le processus actif : le diagnostic assaini a relevé un `VerifyError` dans `MainActivity.completeNativeUiVisibility`. Inspection Smali : dans le chemin « visibilité en attente », `v0` recevait la chaîne `watchdog`, puis était retourné depuis une méthode de type `Z` sans restaurer un booléen.

Le commit `10d5586b8bb5453445ed6c526cfd43894311abd3` restaure `false` après l’écriture du diagnostic et ajoute une régression statique. Le run `41471785140` a construit et vérifié les nouveaux APK (instrumentation SHA-256 `5e7ab6af8883460024c47c3f50a64f737f27c8e4dc23d7d510dcfd3d74be96d8`; candidat non débogable SHA-256 `d932658e40bf141b6326ee08228961f934b78068765552552f31783023d15b79`) et a dépassé le lancement sans le `VerifyError` précédent.

Cette exécution a émis les cinq échantillons Home (`200 ms`, `1 s`, `3 s`, `8 s`, `20 s`) **à partir du début du timeline après disponibilité de l’état natif Home**, pas du lancement de l’application. La vérification globale de pixels/hierarchie a ensuite échoué à `login_surface_visibility` (`InvocationTargetException`); les scénarios empty-Home et routes ne sont pas allés au bout. Une modification locale du runner retire maintenant au plus quatre wrappers de réflexion et ne conserve que la classe d’exception cible, jamais son message ni sa pile; un nouveau run est nécessaire pour connaître cette classe et poursuivre les scénarios.

Le run suivant `41475356674`, source `04b40709f8a47bc1a4717e5f1c09e08992615734`, a aussi construit et vérifié les APK (instrumentation SHA-256 `132224f23c90198a7fe7708167f025e9baf13a3550bb17aca187332f8cf76d23`; candidat SHA-256 `a1da044b433ef7702445bdcf7bd79bff2a722ac53168188b2d99cfa944a3f69d`) et dépassé le lancement, la timeline Home et le probe de login. Il a ensuite échoué dans le fixture JavaScript isolé, à `javascript_native_shell_status_visibility` (`AssertionError`). L’inspection du test indique que le propriétaire de login explicite restait activé alors que le fixture simulait une route Home; le correctif local relâche ce seul garde-fou pendant le fixture status-only, sur le thread UI, puis le parcours rétablit explicitement le login. Cette explication attend encore la confirmation d’un nouveau run.

Le run `41477173949`, source `0d1156627391afc4c66b686c267e90e33c66abe7`, a construit et vérifié le candidat et l’APK d’instrumentation (SHA-256 respectifs `efdf8ceb33b67f0d9c1e18340af784f5227566f5a15163e124d37094ff840fbc` et `5a37c176dc98edb518963733187a7b32a89232b2c1f60d486b4300e4f10a0f12`). Le fixture du shell a dépassé `javascript_native_shell_status_visibility`, et l’instrumentation a atteint `native_route_owner_matrix` avant une `RuntimeException`. L’analyse du code indique une cause probable : l’envoi du payload Home vide pour cette matrice appelait le bridge depuis le thread d’instrumentation, alors que `postNativeUiRoute` lit l’URL de la WebView primaire via `isLoginWebPath`. Ce diagnostic reste à confirmer. L’inspection différée a également signalé que la surface native n’avait pas été observée; les pixels Home vide/status ne sont pas validés, donc ce run ne prouve pas une défaillance visuelle de l’application.

Le commit `251db45e6ee2387eebcf42f00dfcd9af6735012a` a construit et vérifié le candidat SHA-256 `d6849f55932bf443a0dae762bf39994bad0bff9f6ad70d1098ddb554378d847c`, la cible Preview debuggable SHA-256 `ec26127ff4c19b44203224401f4573ada62311eea29e43ab8ab530eb334a9fd9` et le runner test-only SHA-256 `641dec80f8b0de4761c02438d5dd6d9aae4901c434b0de6d0ab119f793ebe5bf`. La CI a rejeté le statut requis `login_spa_exit_observed=true`; elle n’a pas certifié les assertions de la matrice de routes dans ce run, et les pixels Home restent non vérifiés. Le contrôle imposait à tort une sortie SPA même lorsque `isLoginWebPath()` confirme que la WebView est encore sur un parcours login.

Le correctif conserve les callbacks sur le thread UI, isole la matrice en relâchant uniquement son garde-fou login, et restaure explicitement la même surface de connexion/WebView. Il distingue deux résultats valides, sans transfert vers Spotify Web : sortie SPA confirmée, ou route login-only toujours active. La CI exige l’une de ces paires de booléens et continue d’exiger la restauration explicite du login après la matrice. Aucun changement de navigation, session, preuve `libraryV3` ou comportement applicatif n’est inclus.

Le run `41481664562`, sur le commit `1a6cd9626ff345c0b1b663ac5e234de0eb79aa3f`, a réussi les builds, l’instrumentation Android et les inspections post-instrumentation. Les artefacts vérifiés dans ce run sont : APK Preview debuggable, versionCode `1020995`, SHA-256 `b86709301b5ffc57c90d9db38ec3225bd734ddd210bf47b2d365078e4ee42d1c`; runner test-only, SHA-256 `233f6ac47bf8bda1e2113921a08eb77ec0868760ee6c64037f84a3526c3459d8`; candidat non débogable, versionCode `1021134`, SHA-256 `126569bd791195780330104bee962f9faad46ea93f8d7f579f389d52a46122f3`. Le contrôle séparé de hiérarchie cold-launch a échoué avec `mounted_webview_under_native_home_surface_not_observed`; le test du candidat release et la publication ont donc été sautés. L’échec précède la vérification des pixels du snapshot cold-launch.

Dans `inspect_hierarchy.py`, l’échec initial était déclenché si l’identifiant d’accessibilité `webViewContainer` **ou** un nœud de classe `WebView` manquait. Le diagnostic publié ne distinguait pas ces cas. Le nouveau run `41484492132`, source `1ed1542db2bee54fb05a0337e7e00d8dfd7fe090`, a confirmé le détail : `web_container_present=false`, `web_container_visible=false`, mais `webview_class_present=true`, `webview_class_visible=true`, `webview_bounds_present=true`, `native_root_visible=true` (17 nœuds). L’élément manquant est donc uniquement le nœud d’accessibilité du `FrameLayout` conteneur; ce résultat ne prouve pas une WebView détachée. Le contrôle s’est arrêté avant les pixels cold-launch; les tests du candidat release sont restés sautés. Les APK exacts de ce run étaient : cible Preview debuggable versionCode `1020996`, SHA-256 `83d791004ba0a8ddcdf2dbdf946cd4084daa230a376e2eefadd66f179a2a23b6`; runner test-only SHA-256 `ff5318d15d60e178e6125f151cd65f517e7bff3419446c442212dbceaa08e4b1`; candidat non débogable versionCode `1021135`, SHA-256 `7cb29edfbbebc10f8ced65ec94718210363720352e166a7b279c5de26f4f952f`.

Le correctif local de l’inspecteur conserve l’exigence d’un nœud `WebView` visible et borné, mais n’exige plus un nœud d’accessibilité pour son `FrameLayout` parent, qui peut être omis lorsque le conteneur ne porte pas lui-même de contenu accessible. Pour ne pas relâcher la preuve de montage, les checks runtime de Home vide/Home status/routes vérifient maintenant `webView.getParent() == webViewContainer` (parent direct), au lieu du seul parent non nul.

Le run `41486507185`, sur le commit `2d0ae8f54e274d6d1e7a1d69f5f8617565cd384d`, a validé cette adaptation sur l’unique profil AVD utilisé : instrumentation, inspections post-instrumentation, hiérarchie **et pixels** cold-launch, puis installation et cold launch du candidat release non débogable ont tous réussi. Le candidat a repris l’activité; aucune publication n’a eu lieu. Identités d’artefacts : cible Preview debuggable versionCode `1020997`, SHA-256 `11fc30dc4da6e1bf49161d75daafa343c9e075a3440d73d5c94ca36b24a6613d`; runner test-only SHA-256 `93832a116582c91b3dedccaced26c31e1903ed2941e07369bb927a2b80391ec6`; candidat versionCode `1021136`, SHA-256 `37a7452c77a1f0f38345d873a11248e049dded23cec6b668fe8e9b89179ffe1b`. Le run complet est néanmoins en échec à l’étape indépendante `Add verified run details to the summary` (code de sortie 1), après ces vérifications; le résumé assaini n’a pas été produit et les journaux du runner restent inaccessibles.

L’inspection locale du workflow a trouvé une cause probable et reproductible : le second processus Python du résumé référençait `timeline_hierarchies`, défini seulement dans le premier processus, ce qui provoque un `NameError`; il tentait aussi de concaténer un tuple avec une liste. Le script local redéfinit désormais ses noms de fichiers dans son propre processus et utilise des listes homogènes. Le workflow marque ses phases, masque tout stderr brut de cette étape et ne publie qu’une phase et un code de sortie assainis. Un smoke test synthétique du résumé passe, et une entrée JSON volontairement invalide échoue sans faire apparaître de message ni de pile Python. Cela identifie une défaillance du code source très plausible, mais ne remplace pas un rerun CI du commit corrigé.

Cette validation ne compare toujours qu’un AVD; elle ne reproduit pas la différence téléphone/tablette et ne déclare pas le P0 corrigé. Le workflow doit être relancé, puis comparer les profils réels demandés.

`node --test tests/preview_workflow.test.js tests/p0_home_visibility_gate.test.js` passe 28/28, et `npm test` passe 475/475 après ces changements. Ces tests locaux et le run `41486507185` restent limités à un seul profil d’émulateur : ils ne constituent ni une comparaison téléphone/tablette, ni une validation de la propriété de l’écran sur appareil réel, ni la validation du P0.

## Critère de réussite

L’interface Melodix conserve la propriété de l’écran sur téléphone **et** tablette jusqu’à 20 secondes, sans qu’un callback, lecteur ou watchdog tardif laisse Spotify Web recouvrir le centre sur téléphone. Le profil tablette conserve son comportement fonctionnel et son rendu des playlists déjà observé; toute correction de défaut visuel de playlist reste suivie comme un second sujet.

Un build ou un test statique ne vaut pas reproduction sur appareil. Tant que les deux profils et les cinq échéances ne sont pas observés, ne pas déclarer ce volet validé ni le P0 corrigé.
