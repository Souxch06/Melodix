# Page Web Spotify : message « Lecture désactivée »

La capture réelle de l'APK `fcddd282` montre que l'activité « Spotify (page Web) » s'ouvre, mais que Spotify affiche « Lecture désactivée ». Le texte évoque plusieurs possibilités : contenu protégé, navigateur incompatible ou navigation privée. Il ne permet pas de choisir entre elles. Le profil de la nouvelle WebView n'était pas celui de l'ancienne : elle utilisait l'agent utilisateur Android par défaut, alors que la WebView du lecteur historique utilise `BrowserProfile.desktopUserAgent`, avec une version déterminée à partir du fournisseur installé.

Le candidat `7a964a00afa50730e9db168d5abdf4dc350f4460` applique ce même profil à la page séparée avant le chargement. Il ne modifie ni le visuel Glass, ni la bibliothèque, ni sa preuve, et n'ajoute aucune lecture de cookie, de jeton ou de page. Il ne réutilise pas le bridge Web, ne crée pas d'interface JavaScript et ne donne aucune nouvelle permission. JavaScript et DOM storage du site restent activés comme dans le précédent candidat ; le stockage normal de WebView peut persister, ce n'est pas une garantie incognito.

Autre différence réelle, non modifiée dans cet essai : l'ancienne WebView a un WebChromeClient traitant des demandes de contenu protégé, que la page séparée n'a pas. Son comportement historique accorde toute la liste demandée si le contenu protégé figure parmi les ressources ; il ne doit pas être copié tel quel. L'autorisation d'identifiant de média protégé peut présenter un enjeu de confidentialité ; elle ne doit pas être octroyée indistinctement ni être présentée comme une réparation du 401. Aucun test ici ne démontre qu'une telle autorisation résoudrait le message ou serait effectivement demandée par Spotify. Le message peut aussi refléter une incompatibilité ou une restriction côté fournisseur. La cause exacte est **non établie**.

## Vérifications

- Local : `node --test tests/spotify_web_page.test.js tests/limited_glass_access.test.js tests/session_gate*.test.js` : 38 réussis. `smali_register_check.py` : 0 problème sur l'activité. `git diff --check` réussi.
- [Android exact, téléphone et tablette](https://github.com/Souxch06/Melodix/actions/runs/43388720082) : assemblage et signature vérifiés, parcours hors ligne de l'activité séparée et retour réussis ; instrumentation synthétique vérifie dans l'activité la valeur effective du profil navigateur, JavaScript et l'interdiction de l'accès aux fichiers. Tests de session, pont et mise à jour synthétiques réussis. Aucun appel réel Spotify ni lecture DRM n'a été validé.
- [ZIP APK expérimental](https://github.com/Souxch06/Melodix/actions/runs/43388720082/artifacts/14020381683), versionCode 1023016, package `com.melodix.music.preview`. L'APK ne peut être affirmé fonctionnel avec Spotify avant essai réel.
- [CI générale](https://github.com/Souxch06/Melodix/actions/runs/43388720326) encore rouge ; consulter les annotations pour les détails. Les échecs historiques et la clé QA absente ne sont pas contournés.

## Essai suivant

Installer l'APK, ouvrir « Spotify (page Web) », attendre et signaler si le message persiste et si la page de contenu apparaît. Ne pas transmettre de mot de passe, cookie, jeton ou copie de données privées. L'accès à l'accueil Glass et le 401 de bibliothèque restent indépendants et non réparés par ce changement. La lecture d'un titre et le fonctionnement d'un compte gratuit restent à confirmer sur le téléphone ; ne pas supposer de fonctionnalité Premium.
