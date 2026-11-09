# Login avant accueil — cartographie et contrat

## Étape 1 : cause observée (source bd04561b, avant modification)

- `MainActivity.smali:440` (`ensureWebPageLoaded`) choisit une URL d’après B/l0/cookie, et réexamine une WebView déjà chargée. `C:661` appelle la factory puis ensure : deux propriétaires de navigation.
- `m9.smali:1605–1675` (`g`, load_first_page) charge player si B et non l0, sinon accounts. Le cookie n’est pas une preuve serveur ; ce choix mélange présence et preuve.
- `MainActivity.smali:7507–7570` (`onWebViewPageFinished`) libère le login au passage sur une page non-login. Les conditions réelles contredisent les commentaires : `if-eqz B` saute vers `native_login_route_proven`.
- `MainActivity.smali:8961–9000` (`showNativeUiFrom`) laisse passer une URL commençant par http même avec B=false. Les callbacks page-finished/ui-ready/route peuvent donc peindre l’accueil avant un payload privé validé.
- `MainActivity.smali:8678` (`noteNativeHomeSessionUnprovenStatusAttached`) marque le statut mais ne navigue pas : l’erreur native reste prioritaire.
- `MainActivity.smali:11479–11489` (`openSpotifyLogin`) retourne vers verify dès qu’un cookie existe, même si une tentative complète a refusé l’accès. Cliquer login ne résout donc pas cette priorité.
- `c91.smali:696–723` invalide B et LoggedIn sur accounts : `clear-accounts` est une invalidation de preuve locale, **pas une suppression de cookies**.
- `AppSingleton.smali:663` initialise B=false ; `auth` affiche ce drapeau de preuve locale. Le contrôle de bibliothèque privé reste séparé et obligatoire.
- `MainActivity.smali:8167–8195` : `loginN` compte les assertions de surface (`applyLoginWebUi`), **pas les redirections réseau**, et ne prouve ni login réussi ni expiration. Le diagnostic test120 n’est pas un test de cette modification.

## Contrat de la nouvelle décision

États : verifying, no-session, session-expired, valid, error. Une présence de cookie ne confère jamais la preuve. Une durée >3 s ne prouve jamais une expiration.

- Cookie absent : login officiel, sans accueil et sans purge.
- Cookie présent : player caché derrière la vérification native ; ne montrer les playlists qu’après jeton obtenu **et** bibliothèque validée.
- Expiration : tentative terminée, même génération/corrélation, jeton refusé par les endpoints (réponses HTTP, pas échec réseau) **et** bibliothèque 401, sans jeton. Login automatique au maximum une fois par lancement, sans supprimer les cookies.
- Réseau/timeout/autre refus : error avec Réessayer non destructif. À 3 s, seule la présentation initiale verifying se termine en error réessayable ; une preuve tardive courante peut encore réussir.
- Retour réel du login : nouvelle vérification. Un refus après ce login frais reste error ; jamais une deuxième redirection automatique.
- Reconnexion destructive : seulement un tap explicite, état session-expired avec preuve corrélée complète, jamais un simple cookie/401/400/403 isolé.
- Rotation/arrière-plan : conserver le budget et la génération au niveau du processus, remplacer la référence faible d’Activity ; ignorer les retours des anciennes tentatives.

## Périmètre protégé

Ne modifier ni endpoints/requêtes/en-têtes/version Spotify, ni spoof, ni blocage publicitaire. Le thème concerne uniquement les vues natives ; aucun style injecté dans accounts. Aucun token, cookie, URL ni contenu privé dans MDXPERF. Ne pas désinstaller ni effacer les données pour tester.

Les étapes suivantes doivent préciser les implémentations, tests exécutés et limites de validation appareil ; les tests statiques ne constituent pas une preuve de pixels ni de session réelle.

## Étape 2 : décision centralisée

`NativeSessionGate` porte les cinq états, la génération, l’anti-duplication de tentative, le budget automatique et le verrou post-login frais. La factory et ensure partagent `initialUrl`; les routes et affichages natifs passent par `blocked`. `onWebViewPageFinished` ne prouve plus un login : il déclenche seulement la revérification au retour du player après accounts.

La publication de fin de pipeline dans `spotify_bridge.source.js` exporte huit champs non sensibles d’une seule tentative. La génération est capturée **avant** le départ ; les garde-fous requestGeneration/authEpoch existants s’exécutent avant la publication. Le retry natif rejoint puis relance après une tentative ancienne, sans adopter son résultat et sans contourner Retry-After. Les requêtes et leur configuration sont inchangées.

`NativeSessionReconnect.start` vérifie `canReconnect` avant toute suppression ; le simple couple 400/403 n’autorise plus la reconnexion destructive. L’ancien timer 15 s ne peut plus remplacer la surface de cette machine. Le timer natif 3 s est non destructif et accepte encore une preuve tardive courante.

Tests ciblés : `node --test tests/session_gate.test.js` (9 cas, interprétation des instructions smali de décision et exécution réelle de la publication JS). Contrôle registres des nouveaux helpers. La surface graphique est l’étape suivante ; cette étape ne constitue pas une validation Android/appareil.

## Étape 3 : surfaces natives et cycle de vie

`native_session_surface.xml` et `NativeSessionSurface*` : fond sombre violet/magenta en dégradé avec bordure, bouton dégradé 48 dp, textes d’erreur sobres, détails techniques repliés (animation existante 120 ms). Aucune modification de la page accounts. La barre de login réserve sa hauteur mesurée au-dessus du conteneur WebView ; les autres états couvrent la totalité du contenu. La rotation remesure, sans nouvelle navigation.

Les quatre entrées show/route/payload/rows sont désormais bloquées avant valid : aucun accueil privé n’est rendu derrière le splash. Retour quitte l’activité non validée sans découvrir l’accueil ni recharger accounts. Les erreurs réseau de page principale deviennent error non destructif ; les erreurs de sous-ressources ne sont pas des preuves d’expiration. La génération reste monotone entre fermetures et relancements afin qu’un ancien callback ne puisse pas appartenir au nouveau lancement. Le début de navigation accounts est observé pour gérer aussi les auto-continues SSO sans commit du formulaire.

MDXPERF admet explicitement les transitions et raisons fixes, et le diagnostic copiable contient `sessionState`. Aucun corps de réponse, URL ni identifiant de compte n’est ajouté au journal.

Tests ciblés : 11 tests session-gate et contrôles registres des helpers. Première suite globale : 1012 tests, 983 réussites, 25 échecs, 4 ignorés. Les échecs comprennent des contrats historiques exigeant le login à chaque resume et l’accueil dès page-finished (désormais explicitement interdits), ainsi que les interpréteurs de tests qui ne connaissent pas encore la nouvelle garde ; ils doivent être migrés à l’étape 4, pas désactivés. Aucune validation de pixels/appareil à ce stade.

## Étape 4 : migration des contrats et validation

Les tests historiques qui exigeaient le login forcé à chaque resume ou l’accueil dès une URL player ont été remplacés par le nouveau contrat centralisé ; leurs contrôles de cookies, garde privée et URL officielle sont conservés. Les interpréteurs smali de routes natives travaillent explicitement **après** validation, les décisions pré-validation étant exécutées dans `session_gate.test.js`. Ajout d’un test négatif réel sur l’entrée de suppression : sans expiration, aucun appel CookieManager.

Durcissements de validation : les flags MainActivity partagés sont publics (contrôle d’accès interclasse), p1/p2 nuls sont ignorés avant tout rendu, les détails affichent uniquement les codes HTTP bornés et une raison fixe. Une session précédemment validée est revérifiée au retour premier plan, sans remettre le budget automatique à zéro. Une reconnexion destructive est interdite pendant la navigation de login : l’ancienne preuve d’expiration ne doit pas autoriser l’effacement d’un cookie qui pourrait venir d’être renouvelé.

`tests/android/SessionGateInstrumentation.java` et `.github/workflows/test-session-gate.yml` constituent une nouvelle instrumentation **synthétique isolée** : premier lancement sans compte, délai 3 s, succès jeton+bibliothèque simulé, réseau/401 isolé, expiration corrélée simulée, refus frais, résultat ancien, rotation, recréation, resume et Retour. Aucun cookie/token n’est lu, écrit ou supprimé par le harness. Aucun secret/URL/stack brut dans ses résultats. Ce protocole ne remplace pas une vraie connexion Spotify ; l’ancienne CI images reste inchangée et son échec précédent n’est pas reclassé en réussite.

Suite locale finale avant lancement CI : voir résultats exacts ci-dessous. Le workflow Android et le build preview doivent être exécutés depuis le SHA poussé ; leurs résultats ne sont pas encore connus au moment de cette entrée.

Résultat local : `npm test` — **1019 tests, 1015 pass, 0 fail, 4 skip**. `smali_register_check.py NativeSession*.smali` — 0 problème sur 10 fichiers. `git diff --check` — propre. Les requêtes token/library, leurs en-têtes et le profil WebView n’ont pas changé ; les changements JS sont strictement observation de fin de tentative et déclenchement de vérification via le pipeline existant.

### Déclenchement CI

Le nouveau fichier de workflow n’est pas encore enregistré sur la branche par défaut : son dispatch direct retourne 404 (aucun problème d’authentification GitHub). Il est donc exposé via une option explicite `session_gate_only=true` du workflow existant `test-preview-emulator.yml`, qui appelle le nouveau workflow réutilisable. Les jobs historiques restent inchangés lorsqu’on ne choisit pas cette option ; ils ne sont ni déclarés réussis ni utilisés comme preuve de cette mission.

### Première exécution CI (limites explicites)

- Build initial `42595754746`, source `41455f19` : succès, APK signé vC1021454. Ce fichier est **intermédiaire**, pas le candidat final : une revue a ensuite repéré la déduplication JS d’un payload déjà envoyé mais refusé pendant verifying.
- CI session `42595817944`, source `c9369a89` : build instrumentation réussi, mais échec dans la préparation du runner Android **avant lancement de l’émulateur**. Aucun scénario appareil n’est donc validé par cette exécution. Les nouveaux diagnostics de setup distinguent compilation, manifest, signature et SDK sans exposer de secret.
- Correctif de revue : hook `__sfNativeSessionVerified` réémet les présentations après preuve existante (signatures/route invalidées), sans navigation, nouvelle requête ou changement de garde privée. Le receiver natif rejette aussi les combinaisons contradictoires (libraryOk avec HTTP401, ou tokenRefused sans les deux réponses de refus) ; le flag de présentation unproven est libéré même pour une bibliothèque réellement vide.

Le hook de resynchronisation reste sous le plafond historique de taille du shell : simplification de textes de statut redondants et invalidation de signatures en chaîne, sans relever la limite ni supprimer les diagnostics/contrôles. Les codes HTTP exportés sont bornés ; le natif recoupe succès avec 2xx et expiration avec les deux codes de refus. La première assertion de plafond a précisément empêché d’ajouter le hook sans cette réduction.

### Durcissement final et protocole utilisateur

- CI `42596432397` : l’annotation identifie `phase=manifest` (compilation Java et DEX déjà franchies), avant émulateur. Le runner reprend désormais le nom `AndroidManifest.xml` et les paramètres aapt du harness existant ; les erreurs de compilation du manifest sont remontées en annotations sûres. Ce n’est toujours pas une preuve de fonctionnement Android.
- Sous la surface non validée, `nativeRoot` est réellement masqué et retiré de l’arbre d’accessibilité ; la WebView reste montée pour vérifier mais son accessibilité n’est ouverte que pour le login. Cela empêche aussi de lire d’anciennes playlists via TalkBack pendant une revérification.
- Le hook de réémission réinitialise aussi le titre de détail, pas seulement ses lignes, pour ne pas perdre un payload refusé avant validation.

À vérifier sur la preview **sans désinstaller ni effacer les données** :

1. Premier lancement sans cookie : login officiel avant tout accueil ; jamais de carte 401 ou de liste vide.
2. Session valide conservée : vérification native ≤~3 s, puis playlists/pochettes réelles après preuve ; si la réponse dépasse le budget, Réessayer, aucune purge.
3. Cookie refusé : seulement après fin de la même tentative (jeton refusé + library401), « Session expirée, reconnecte-toi » et une ouverture automatique du login. Aucune suppression automatique ; aucune reconnexion destructive pendant le login.
4. Hors ligne / délai / 403 isolé : message sobre + Réessayer, détails repliés, cookie conservé, pas de login automatique.
5. Login terminé : retour player → nouvelle vérification → accueil si validé ; si le refus persiste après ce login frais, error sans deuxième ouverture automatique.
6. Arrière-plan, Retour, portrait/paysage et recréation : budget conservé, aucun accueil privé avant preuve, Retour ne découvre pas une liste cachée, aucune boucle.

Risques résiduels à mesurer : comportement réel des redirections SSO, latence réseau >3 s, dimensions du bandeau login avec grande police/clavier, authentification privée et playlists réelles. Les preuves synthétiques/CI ne doivent pas être présentées comme une validation de ces points.

Dernière revue de cold start : `WebView.getUrl()` peut rester nul juste après `loadUrl` dans la factory. La décision initiale est désormais émise une seule fois ; un second appel d’ensure retourne sans naviguer (sentinelle nulle, jamais `about:blank`), pour ne pas annuler le login en vol. Test d’instructions ajouté pour les deux présences de cookie. Le budget est remis à zéro uniquement quand le lancement se termine, pas sur rotation/reprise.

### Blocage ART découvert par la validation

Le runner Android final `42596800499` n’a pas réussi (résultat sauvegardé, aucune validation annoncée). Revue de la hiérarchie : `androidx/activity/a.smali:978` déclare `onBackPressed()V` **final**. La redéfinition ajoutée à MainActivity était illégale et doit être retirée avant livraison. Retour matériel passe maintenant par `onKeyDown` et le geste conserve le dispatcher final existant. Ajout d’un test parcourant les superclasses réellement empaquetées pour interdire une telle redéfinition. **Tous les APK test124 antérieurs à cette correction sont intermédiaires et ne sont pas à installer.** Le premier build réussi n’était donc pas une preuve de chargement de classe ART.

Le contrat historique Retour fournit déjà un adaptateur `handleNativeSystemBack` appelé par le dispatcher final (et mesure que `onKeyDown` ne reçoit pas BACK). Le comportement des surfaces non validées est donc ajouté à cet **adaptateur existant**, pas à onKeyDown ; les payloads fullscreen/history et leurs empreintes de protection restent inchangés. La suite Retour a détecté et fait retirer l’interception matérielle redondante avant livraison finale.

CI après retrait de la redéfinition finale (`42597347997`, source9f79d39d) : le chargement ART et les scénarios **premier lancement, deadline, succès simulé, expiration simulée, refus frais** ont produit des statuts passed. Le job global reste en échec avant les dernières étapes : ne pas l’annoncer vert. Le protocole remonte désormais les classes d’exception AndroidRuntime uniquement (aucun message ni stack contenant une donnée de page) afin de distinguer un arrêt de processus d’une assertion de scénario. La suite locale a aussi relevé l’ancien contrat qui interdit l’interception onKeyDown ; le nouvel adaptateur existant le respecte.

### Résultats après correction Retour

- `42597934736`, source **5acef50b** : **succès Android**, tous les contrôles du runner atteignent `overall=passed` (dont résultats périmés, rotation, recréation et Retour).
- `42598072180`, source **8552a917** : **succès Android** également ; par rapport à 5acef50b, seuls le workflow de collecte et ce document diffèrent, aucun code applicatif.
- `npm test` final : **1024 tests, 1020 réussis, 0 échec, 4 ignorés** ; contrôles registres des 10 helpers : 0 problème.
- APK candidat final source applicative **5acef50b23f1c8d5968a43bea6995e28343d6790**, build **42597941924**, vC**1021459**, versionName **1.2.2-5acef50**, SHA256 **cd7483fb5082df5ed778072a77628e1a64db92525c488bc1066e80060b05191c**. Les builds test124 précédents ne sont pas le candidat final.

Le contrôle background initial appelait seulement l’adaptateur resume. Le runner est renforcé pour effectuer maintenant un vrai `moveTaskToBack`, puis remettre la tâche au premier plan sans clear-task/data ; ce complément doit être exécuté séparément avant d’annoncer le passage arrière-plan OS comme validé. Aucun changement au code de l’APK candidat dans cette étape.
