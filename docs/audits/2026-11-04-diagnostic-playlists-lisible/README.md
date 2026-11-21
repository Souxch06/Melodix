# Diagnostic des playlists lisible et copiable

## Capture reçue

La capture du 14 novembre à 15 h 29 affiche une carte d’état « Spotify limite les requêtes », aucune carte attachée, « dernier payload reçu = inconnu » et un ancien code commençant par cinq zéros. L’ancienne sonde renvoyait exactement cette série soit si l’origine n’était pas celle attendue, **soit si n’importe quelle exception survenait pendant la mesure** : ce code ne permet donc pas de conclure que la WebView était sur une autre origine. L’absence de réception enregistrée ne prouve pas non plus que Spotify n’a aucune playlist : le diagnostic ne couvrait que la réception par un chemin et l’activité/le document ont pu changer. La carte visible peut aussi correspondre à un état antérieur : ces éléments ne sont pas reliés par un identifiant commun. Aucun contenu personnel de la capture n’est publié.

## Nouvelle version

Le bouton Diagnostic de l’en-tête ouvre un rapport textuel défilant, sélectionnable et doté d’un bouton **Copier** qui copie le texte affiché au moment de l’appui. Si la sonde n’a pas encore répondu, cette attente est explicite et c’est le texte en attente qui est copié. La sonde et la copie ne lancent aucune navigation ni requête Spotify.

Le rapport distingue :

- dernier payload Home reçu par le pont, sa taille et son âge ; dernier passage effectif au moteur de rendu Home, sa taille et son âge ; panneau d’état et carte attachés ; première carte intersectant la fenêtre et route active ;
- présence de la WebView de l’activité et identité avec la WebView partagée, origine Android catégorisée sans URL, progression, attachement, JavaScript et compteurs réseau/HTTP existants ;
- origine et catégorie de page **vues par le document** ; état du document et HTTP de navigation ; exécution du shell et du pont ; signal de connexion UI et preuve API ; état, phase, catégorie d’erreur, HTTP et tentative API ; compteurs API et DOM, lignes choisies et indicateur d’envoi.

Chaque sonde est isolée : l’échec de lecture d’un champ ne remplace pas tous les autres par des zéros. Le pont JavaScript transmet exclusivement 28 entiers bornés. Côté Android, les nombres et leur nombre sont contrôlés avant la mise en forme ; ni texte de page, titre, compte, URI, URL ou jeton ne figurent dans le rapport. Les données sont volatiles. `inconnu / non observé` n’est pas zéro ; 999999 est un maximum inclusif. La liste DOM peut être virtualisée, cachée ou placée dans un iframe et n’est pas exhaustive. Les nombres de lignes peuvent inclure un panneau d’état. Une carte hors de l’écran après défilement n’est pas nécessairement absente. Les observations Web et Android peuvent appartenir à des instants différents ; leur âge est indiqué lorsqu’il est connu. Les éventuels codes HTTP de document et d’API désignent des requêtes distinctes.

## Vérifications

631/631 tests Node, dont exécution réelle de la sonde en jsdom avec origine autorisée ou non, valeurs manquantes, erreur isolée, HTTP document et API distincts et données factices confidentielles ; 4/4 tests Python. Vérifications statiques de la validation des valeurs, des registres larges, du bouton Copier et du texte courant copié. APK reconstruit, archive et assets vérifiés ; signatures v2/v3 pour API 24–36 et garde de certificat vérifiées. SHA-256 APK : `472f2d001f2485ca0553ab6640673693430d6b8f73d4cdb734486766d917e266` ; certificat : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Pas d’appareil ni d’émulateur disponibles : ni l’interface, ni le presse-papiers, ni le rendu ART, ni les playlists n’ont été vérifiés sur Android réel. Ce changement enrichit le diagnostic sans prétendre corriger la cause des playlists absentes. Patch complet vérifié sur la base propre `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 66 fichiers comparés avec le candidat ; SHA-256 `6aff334cdd172b4c02d352368f3e8e975fa0a10f4be5dd09ce83cb33dd701364`. Aucune clé n’est incluse.
