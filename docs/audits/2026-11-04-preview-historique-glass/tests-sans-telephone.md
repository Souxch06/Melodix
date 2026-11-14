# Tests complémentaires sans téléphone — base d0f206b0 + Glass

## Périmètre

Tests exécutés localement sur `assets/spotify_bridge.js` et `assets/native_ui_shell.js` **historiques**, avec données factices, fonctions réseau remplacées par des réponses factices, et DOM JSDOM. Pas de compte Spotify, jeton réel, requête réseau Spotify, Android ou appareil. Les résultats décrivent ces chemins et ces hypothèses, pas l'état actuel des serveurs ni la réponse du téléphone. L'exécution du bridge teste des blocs extraits du fichier réel, avec le reste de l'environnement simulé ; ce n'est pas une exécution complète de la WebView.

## Résultats

- **33/33 simulations passent**, dont : ouverture Bibliothèque en repli Web, ouverture de playlist avec et sans bridge, présence d'un élément de compte pour signaler l'interface prête, et collecte d'une carte ajoutée après le démarrage. Une simulation ne prouve pas la lecture audio réelle.
- Bibliothèque : 75 éléments fictifs répartis sur deux réponses `libraryV3` (50 + 25) sont convertis et transmis au callback natif. Dans ce scénario précis, deux callbacks contenant les 75 éléments sont émis ; l'effet éventuel sur Android n'a pas été mesuré. Une réponse complète est limitée à 1 000 éléments par la boucle historique.
- Les 12 éléments maximum concernent le complément **personnel de l'accueil**, pas toute la Bibliothèque. En repli sans bridge, la collecte DOM de la page Bibliothèque renvoie au maximum **32** éléments. Le chemin bridge est différent et le test à 75 n'établit pas l'exhaustivité sur un compte réel.
- Les réponses fictives HTTP 401, 403 et 429 en première page conduisent le bridge historique à produire une bibliothèque vide, sans état d'erreur spécifique ; un refus en seconde page produit une bibliothèque partielle de 50 éléments sans signal distinct. Une erreur GraphQL fictive en HTTP 200, sans données, devient également une bibliothèque vide. Sans jeton fictif, la demande reste en attente sans callback. Ces simulations ne prouvent **aucun** de ces statuts sur le téléphone et n'expliquent pas à elles seules l'absence réelle des playlists.
- Le lien DOM `/collection/tracks` n'est pas collecté par le fallback historique : cela concerne ce chemin, non la totalité des chemins possibles pour Titres likés.
- La navigation de repli programmée après 6 secondes pour une playlist n'est pas annulée par un simple callback natif simulé ; l'exécution effective sur Android dépend notamment d'autres événements de page. Aucune mesure réelle sur appareil.
- La garde Smali historique de `NativeImageLoader` a été interprétée pour des URL fictives : une URL HTTPS non vide est dirigée vers l'effacement **avant** `Picasso.load`. Les pochettes natives ne peuvent pas être attendues de ce chemin historique ; ceci ne démontre pas le comportement de toutes les images Web.
- Le CSS complet est transmis à une affectation `style.textContent` simulée sans perte de texte. Cela ne vérifie ni son injection par `evaluateJavascript` sur Android, ni le rendu, ni les éventuels conflits CSS.

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

Les tests sont dans `diagnostic-simulation.test.cjs` et `playlist-playback.test.cjs`. Le job manuel `v1.2.2-test.9003-preview` installe `jsdom`, applique le CSS Glass dans son checkout historique jetable puis exécute les 71 tests ciblés historiques et les 33 simulations ; il conserve le rapport complet historique. Le workflow **n'a pas été lancé**. Aucun fichier applicatif, en-tête, authentification ou CSS n'a été modifié pendant ces tests.

Sur une copie du commit historique avec `jsdom@26.1.0` disponible :

```bash
MELODIX_HISTORICAL_ROOT=/chemin/vers/copie-historique \
NODE_PATH=/chemin/vers/node_modules \
node --test docs/audits/2026-11-04-preview-historique-glass/diagnostic-simulation.test.cjs \
  docs/audits/2026-11-04-preview-historique-glass/playlist-playback.test.cjs
```

L'étape restante est une compilation signée Preview, puis le test sur téléphone décrit dans [README.md](README.md), quand l'utilisateur pourra le faire. Ne pas effacer les données ni demander de cookies, jetons ou captures privées.
