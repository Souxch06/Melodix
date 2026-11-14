# Tests complémentaires sans téléphone — base d0f206b0 + Glass

## Périmètre

Tests exécutés localement sur `assets/spotify_bridge.js` et `assets/native_ui_shell.js` **historiques**, avec données factices, fonctions réseau remplacées par des réponses factices, et DOM JSDOM. Pas de compte Spotify, jeton réel, requête réseau Spotify, Android ou appareil. Les résultats décrivent ces chemins et ces hypothèses, pas l'état actuel des serveurs ni la réponse du téléphone. L'exécution du bridge teste des blocs extraits du fichier réel, avec le reste de l'environnement simulé ; ce n'est pas une exécution complète de la WebView.

## Résultats

- **34/34 simulations passent**, dont : ouverture Bibliothèque en repli Web, ouverture de playlist avec et sans bridge, présence d'un élément de compte pour signaler l'interface prête, et collecte d'une carte ajoutée après le démarrage. Une simulation ne prouve pas la lecture audio réelle.
- Bibliothèque : 75 éléments fictifs répartis sur deux réponses `libraryV3` (50 + 25) sont convertis et transmis au callback natif. Dans ce scénario précis, deux callbacks contenant les 75 éléments sont émis ; l'effet éventuel sur Android n'a pas été mesuré. Une réponse complète est limitée à 1 000 éléments par la boucle historique.
- Les 12 éléments maximum concernent le complément **personnel de l'accueil**, pas toute la Bibliothèque. En repli sans bridge, la collecte DOM de la page Bibliothèque renvoie au maximum **32** éléments. Le chemin bridge est différent et le test à 75 n'établit pas l'exhaustivité sur un compte réel.
- Les réponses fictives HTTP 401, 403 et 429 en première page conduisent le bridge historique à produire une bibliothèque vide, sans état d'erreur spécifique ; un refus en seconde page produit une bibliothèque partielle de 50 éléments sans signal distinct. Une erreur GraphQL fictive en HTTP 200, sans données, devient également une bibliothèque vide. Sans jeton fictif, la demande reste en attente sans callback. Ces simulations ne prouvent **aucun** de ces statuts sur le téléphone et n'expliquent pas à elles seules l'absence réelle des playlists.
- Le lien DOM `/collection/tracks` n'est pas collecté par le fallback historique : cela concerne ce chemin, non la totalité des chemins possibles pour Titres likés.
- La navigation de repli programmée après 6 secondes pour une playlist n'est pas annulée par un simple callback natif simulé ; l'exécution effective sur Android dépend notamment d'autres événements de page. Aucune mesure réelle sur appareil.
- La garde Smali historique de `NativeImageLoader` a été interprétée pour des URL fictives : une URL HTTPS non vide est dirigée vers l'effacement **avant** `Picasso.load`. Les pochettes natives ne peuvent pas être attendues de ce chemin historique ; ceci ne démontre pas le comportement de toutes les images Web.
- Le CSS complet est transmis à une affectation `style.textContent` simulée sans perte de texte. Cela ne vérifie ni son injection par `evaluateJavascript` sur Android, ni le rendu, ni les éventuels conflits CSS.

## Alerte : branches natives inversées dans cette version historique

Les simulations JavaScript antérieures ne traversaient pas le code Android natif. Une interprétation ciblée des instructions Smali et de leurs branchements, vérifiée sur les **sources** puis sur les classes **redécompilées de l'APK non signée**, établit les points suivants pour des valeurs fictives non vides :

1. Dans `NativeUiRowFactory.create`, `String.isEmpty()` renvoie `0` pour une URI valide ; `if-eqz` saute donc l'installation de `NativeRowClickListener`. Le chemin de rendu `applyNativeUiData('home') → renderNativeRows → NativeHomeFeed.paint → NativeUiRowFactory.create` appelle cette fabrique pour les lignes de contenu.
2. Même si `MainActivity.openNativeRow` était appelée directement, sa première garde `if-eqz` sort pour une URI valide avant le routage vers playlist ou piste. Cela invalide la conclusion que le succès des simulations JS démontrerait l'ouverture par clic natif. D'autres surfaces ou chemins Web peuvent exister ; aucun comportement sur téléphone n'est affirmé.
3. Dans la même fabrique, une image non vide saute l'appel du chargeur ; indépendamment, la garde du chargeur historique rejette elle aussi les URL HTTPS non vides. `applyNativeListText` sort avant `NativeTextWalker` pour un texte non vide.

**Important : les anciens tests `content rows keep their title, cover and tap target` et `row taps open playlists, albums and tracks` passent alors qu'ils attendent précisément ces opcodes inversés.** Ils vérifient la présence de texte Smali, et leurs commentaires interprètent mal `if-eqz` après `isEmpty()` : le chiffre de tests verts précédent ne prouve donc pas le clic ni l'ouverture.

Le test `native-smali-characterization.test.cjs` caractérise ces défauts (6/6 sur les sources et 6/6 après redécompilation) ; il **réussit parce qu'il les reproduit**, pas parce qu'ils sont corrigés. Aucun correctif n'a été appliqué : la demande était de préserver la version historique complète. Le candidat ne devrait pas être présenté comme fonctionnel sans corriger ces gardes puis effectuer les tests Android/téléphone.

## Nouveau : chemin des réponses du bridge vers l'interface

Les tests précédents interceptaient le callback côté JavaScript ; ils ne prouvaient pas que le callback arrivait à l'écran. Nous avons exécuté un petit interpréteur du Smali réel `AndBridge.dispatchNativeUi`, puis les mêmes tests sur les classes redécompilées de l'APK non signée. Ce n'est pas un simulateur Android complet. Les objets `Activity` et `Context` sont fictifs ; le comportement de la WebView sur téléphone n'a pas été observé.

- Le constructeur du bridge utilisé par la WebView reçoit le contexte stocké par `getApplicationContext()`. Quand une référence d'activité existe et que le contexte est de type application (scénario normal attendu), la branche actuelle de `dispatchNativeUi` passe par le test `instance-of MainActivity`, échoue et ne poste pas les données à l'activité. Sans référence d'activité, elle ne poste pas non plus, même avec un contexte d'activité. Avec une référence et un contexte d'activité fictifs, elle poste. **7/7 tests caractérisent ces branches**, sur source et dex redécompilé : ils réussissent en reproduisant le défaut.
- `onNativeUiData` utilise ce dispatch générique, tout comme la partie qui envoie `onMediaItemsLoaded` à l'interface native. L'accueil dispose aussi du callback distinct `onNativeHomeRows`, qui passe par la référence d'activité et `NativeHomePaintRunnable` sans utiliser ce dispatch. Dans une simulation du shell, le même payload d'accueil est envoyé aux deux callbacks. Il est donc plausible que l'accueil et la Bibliothèque aient des résultats différents, mais ce test ne prouve ni l'existence de playlists réelles, ni le parcours exact observé sur téléphone, ni l'absence d'autres voies.
- Un second interpréteur exécute le Smali de `applyNativeUiData` : les réponses `media:` avec ID attendu et écran correspondant arrivent au rendu dans les cas fictifs, alors que les réponses avec ancien ID ou mauvais écran sont rejetées. En revanche, un payload `home` tardif peut forcer l'écran à revenir sur l'accueil ; un payload vide peut réutiliser le JSON précédent. La garde `screen-title` rejette un titre non vide. **10/10 cas de caractérisation**, sur source et dex redécompilé ; les comportements constatés ne sont pas des correctifs.

Ces résultats renforcent la nécessité de vérifier le chemin natif entier et pas seulement les résultats JS. Les simulations et les tests verts précédents ne démontrent toujours pas que la Preview fonctionne sur téléphone. Aucun code de l'application, authentification, en-tête ni CSS n'a été modifié.

## Playlist et lecture : vérifications supplémentaires

- Le bridge simulé transmet jusqu'à **80 pistes** pour une playlist via une seule requête `fetchPlaylist` (offset 0) dans ce code historique. Titres likés utilise une première requête de **50 pistes**. Aucune pagination supplémentaire n'est effectuée par ces deux chemins dans le scénario testé ; cela ne détermine pas le contenu réellement reçu sur Spotify aujourd'hui.
- En repli DOM, 40 liens de pistes fictifs donnent **32** lignes. Si la dernière piste disparaît du DOM, aucun payload `detail` vide n'est envoyé dans la simulation : le comportement visuel Android en résultant n'a pas été mesuré.
- Une playlist non vide est conservée en cache mémoire ; la rouvrir dans la simulation réutilise ce cache sans requête de rafraîchissement. Dans deux scénarios fictifs, une playlist en cache ou `mediaLib` en mémoire restent envoyées au callback même après absence du jeton ; il n’y a pas de preuve ici sur le parcours réel de déconnexion ou de changement de compte. Un refus HTTP fictif ou une réponse GraphQL vide produit une liste vide, et une requête refusée peut être retentée.
- Après chargement de deux pistes fictives, le test appelle les fonctions historiques et intercepte une commande `play` : elle contient l'URI de playlist, la piste choisie et son indice. Sans identifiant de périphérique ou jeton fictif, aucune commande n'est émise. **Aucune commande n'est réellement envoyée à Spotify, aucun son n'est joué.**
- Les **15 tests historiques pause/lecture** passent en simulation, notamment pause répétée et reprise explicite. Ils ne vérifient pas les interactions réelles du téléphone.

## CSS historique comparé au CSS Glass

Sur les **mêmes 129 tests historiques**, sans modification du code : CSS historique **113 réussis / 16 échecs**, CSS Glass complet **111 / 18**. Les deux nouveaux échecs sont des assertions statiques de `melodix_home.test.js` et `mobile_ui.test.js`, portant sur des sélecteurs/règles attendus de l'ancienne feuille. Cela établit une incompatibilité avec ces attentes, **pas** la preuve visuelle d'une panne ou de son absence. Les 16 autres échecs étaient présents avec la feuille historique.

## Contrôle de l'APK locale

L'APK locale **non signée**, reconstruite au tour précédent, a été décompilée avec apktool 2.9.3 : les **16 assets** correspondent octet pour octet au projet préparé ; le manifeste décodé indique le package Preview et ne porte pas `android:debuggable=true`. Il conserve `usesCleartextTraffic=true`. Les ressources compilées contiennent la base, la référence de livraison simulée utilisée localement et l'empreinte publique Preview. Ce contrôle ne remplace ni une signature ni un lancement Android.

## Reproduction et intégration

Les tests sont dans `diagnostic-simulation.test.cjs` et `playlist-playback.test.cjs`. Le job manuel `v1.2.2-test.9003-preview` installe `jsdom`, applique le CSS Glass dans son checkout historique jetable puis exécute les 71 tests ciblés historiques, les 34 simulations et les 23 tests de caractérisation Smali ; il recompilera puis redécompilera également le dex et rejouera ces 23 tests ; il conserve le rapport complet historique. Le workflow **n'a pas été lancé**. Aucun fichier applicatif, en-tête, authentification ou CSS n'a été modifié pendant ces tests.

Sur une copie du commit historique avec `jsdom@26.1.0` disponible :

```bash
MELODIX_HISTORICAL_ROOT=/chemin/vers/copie-historique \
NODE_PATH=/chemin/vers/node_modules \
node --test docs/audits/2026-11-04-preview-historique-glass/diagnostic-simulation.test.cjs \
  docs/audits/2026-11-04-preview-historique-glass/playlist-playback.test.cjs
```

Avant toute conclusion sur un build signé, les défauts natifs ci-dessus nécessitent une décision sur un éventuel correctif ; le test sur téléphone décrit dans [README.md](README.md), quand l'utilisateur pourra le faire. Ne pas effacer les données ni demander de cookies, jetons ou captures privées.
