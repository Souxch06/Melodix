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
