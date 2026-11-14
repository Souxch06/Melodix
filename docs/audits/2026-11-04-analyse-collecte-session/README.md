# Analyse et candidat : détection du lecteur et collecte de bibliothèque

## Constat et limites

La capture utilisateur précédente affiche `110111000` : origine Spotify et document présents ; runtime, shell et pont initialisés ; aucun des sélecteurs de contenu, profil et lecteur testés dans le document principal. La WebView a des dimensions positives, est visible et sa progression atteint 100 %. Plusieurs relances manuelles n'ont rien changé. Cette capture ne permet pas de déterminer si une sous-page existe, si Spotify a chargé ses ressources ou pourquoi le lecteur est noir. Les deux scénarios ci-dessous sont des défauts reproductibles du code, pas des causes établies sur ce téléphone.

## Défauts reproduits et corrigés

1. `collectLibraryDrawerRows` choisissait le premier conteneur reconnu. Une barre `.Root__nav-bar` sans playlists pouvait empêcher la lecture d'un vrai conteneur « Votre bibliothèque » ultérieur. Le collecteur visite maintenant tous les conteneurs spécifiques de bibliothèque, déduplique les URI, et ne se rabat sur la navigation générique qu'en l'absence de conteneur spécifique. Les liens tiers restent exclus.
2. La détection de connexion et la collecte du tiroir ignoraient les éléments d'un lecteur installé dans une iframe ; les recherches de contenu, elles, envisageaient déjà les frames. Le pont prend maintenant en compte un document enfant seulement si sa propre URL est exactement HTTPS `open.spotify.com` au port par défaut/443 et si profil et lecteur se trouvent dans ce même document, sans route ni action de connexion. Les signaux de documents distincts ne sont pas combinés. Le shell ne lit que les documents enfants autorisés, observe leur chargement et leurs mutations, et rafraîchit après le délai de lissage. Cette information est une observation UI, jamais une preuve d'accès API ou une garantie de bibliothèque complète.

Le code ne lit que les données DOM présentes, pas de nouveau jeton ni Client ID ; il ne change ni les cookies ni le stockage. La limite préexistante d'`addJavascriptInterface` exposé aux frames demeure, elle n'est pas corrigée par le filtrage DOM. Aucune donnée n'est inventée quand la session ne peut pas être observée.

## Vérifications

Avant correction, deux tests intégrés échouaient séparément dans les scénarios décrits ; après correction les tests d'intégration exécutent les vrais `runtime_state.js`, `spotify_bridge.source.js` et `native_ui_shell.source.js` avec DOM simulé. Ils couvrent aussi ordre réel runtime → shell → bridge sur document déjà chargé, assets compilés, non-combinaison de signaux entre documents, iframe tierce, iframe de connexion, absence du profil ou du lecteur, déduplication, chargement et mutation différés. Ces tests simulent le DOM ; ils ne démontrent ni le comportement du Spotify actuel, ni le rendu Android, ni la complétude ou la lecture des playlists.

Suite complète : 603/603 tests Node et 4/4 Python ; compilation, intégrité ZIP et concordance des deux assets empaquetés ; signatures v2/v3 API 24–36 et garde de signature compilée vérifiées. Pas de téléphone ni d'émulateur disponible. Les causes réseau, réponse serveur et rendu de l'écran noir ne sont pas résolues.

APK `1.2.2-glass-bibliotheque-corrigee-test.apk`, paquet `com.melodix.music`, version 1.2.2 code 27, SHA-256 `707af0c17ff18649539b0de759d4a0f5b4c546e2bb8d6ba717aad59480a79666`. Même certificat que les APK précédents : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Patch complet `correctif-complet-sur-base-44902.patch` applicable sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, application et fichiers modifiés vérifiés. SHA-256 `2e44b2857b995afad6edef5e5d3389409ea6f03000dd346ad6cf83fb489466e1`. Il ne comprend aucune clé de signature.
