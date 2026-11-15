# Preview Glass : accès aux détails et aux paramètres

Correctif distinct, appliqué **après** le candidat Glass 9012, sur un projet historique jetable dont les entrées sont épinglées par SHA-256. Les correctifs de chargement de l'accueil et de la bibliothèque sont conservés. Le code de récupération des détails est adapté pour identifier et filtrer les requêtes natives : les autres appels du navigateur média gardent leur protocole.

- Les rangées et bannières ayant une URI non vide reçoivent leur écouteur ; `openNativeRow` accepte ces URI et route paramètres, collections et titres. Les gardes d'avatar, de sous-titre et d'artiste citées par les tests ont également été corrigées.
- L'ouverture des paramètres conserve l'écran et les données de retour et ne les écrase pas si les paramètres sont déjà ouverts. Les réglages historiques qui ne modifiaient que des indicateurs locaux sans preuve d'effet Spotify sont affichés comme indisponibles, sans action. L'actualisation est annoncée comme demandée, pas comme accomplie.
- Un identifiant de requête empêche une réponse de détail devenue obsolète d'écraser le contexte de lecture ou de remplir le cache de ce parcours. Le repli vers la vraie page Spotify après six secondes reste actif en cas de réponse vide, erreur ou absence de réponse ; il est annulé après des données non vides, retour, autre écran ou autre collection. Les lignes de détail issues du bridge conservent leurs champs de navigateur média et reçoivent aussi `title` et `uri` pour le moteur de rangées natif. La réponse conserve l'identifiant original même si une URL est normalisée pour la requête.
- Les données du DOM de la collection précédemment ouverte sont écartées quand une autre collection est en cours. Le contrôle JS ne prouve pas l'absence de toutes les courses entre WebView et la file UI Android ; un callback déjà envoyé au natif peut encore être en transit.

## Vérifications et limites

Compilation APK non signée et redécodage apktool ; inspections sémantiques des branches Smali (ce n'est pas une exécution ART) ; simulations JS/JSDOM avec réseau et timers fictifs, y compris cache synchrone, succès, vide, erreur, retour, changement de compte, changements et double sélection d'une collection, ancien DOM et fallback sans bridge. Les suites ciblées accueil/bibliothèque et autres simulations de routage restent exécutées. Les tests qui caractérisaient les anciennes branches inversées sont conservés pour 9012 et remplacés par des tests de comportement corrigé pour ce candidat.

**Pas de validation sur téléphone ou Android runtime dans cet environnement.** Les clics, l'ouverture réelle des playlists, la lecture, le retour, les paramètres, le lecteur et les performances restent à vérifier sur l'appareil. Les captures 9012 ne démontrent que les écrans affichés. Le lecteur plein écran et la fidélité Glass globale restent à poursuivre. Les caches et changements de compte de la base historique ne sont pas complètement sécurisés par ce correctif.

## Livraison 9013

- Workflow manuel [43694610830](https://github.com/Souxch06/Melodix/actions/runs/43694610830), réussi, source `f7657e30ff4d68a224e2cbf059cecbc949e1aefa`.
- [Artefact ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43694610830/artifacts/14154072320), SHA-256 communiqué par GitHub `2a577a67d8b34c25f7c8be5fecb6cc42ad9ef4d5b7d12c11b88058c3476faaa7`, expiration 2026-11-29 08:28 UTC. Le ZIP et les journaux n'ont pas pu être retéléchargés indépendamment dans le sandbox.
- Package Preview `com.melodix.music.preview`, versionCode 1022107 (calcul du workflow avec run_number 620). Le job de signature et le contrôle du certificat Preview épinglé ont réussi ; ce n'est pas une release publique.
- Localement : compilation/redécodage, 108/108 tests JS ciblés, 4 tests de patch dont les empreintes, 3 contrôles sur l'APK redécodée et tests de routage complémentaires. Ces tests restent simulés/statiques.
