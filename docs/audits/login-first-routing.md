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
