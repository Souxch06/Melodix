# Tests complémentaires sans téléphone — base d0f206b0 + Glass

## Périmètre

Tests exécutés localement sur `assets/spotify_bridge.js` et `assets/native_ui_shell.js` **historiques**, avec données factices, fonctions réseau remplacées par des réponses factices, et DOM JSDOM. Pas de compte Spotify, jeton réel, requête réseau Spotify, Android ou appareil. Les résultats décrivent ces chemins et ces hypothèses, pas l'état actuel des serveurs ni la réponse du téléphone. L'exécution du bridge teste des blocs extraits du fichier réel, avec le reste de l'environnement simulé ; ce n'est pas une exécution complète de la WebView.

## Résultats

- **79/79 simulations passent**, dont : ouverture Bibliothèque en repli Web, ouverture de playlist avec et sans bridge, présence d'un élément de compte pour signaler l'interface prête, et collecte d'une carte ajoutée après le démarrage. Une simulation ne prouve pas la lecture audio réelle.
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

## Chaînes synthétiques JS → dispatch → réception native

Trois nouveaux tests enchaînent les blocs JavaScript historiques et les interpréteurs ciblés du Smali, sur les sources puis sur le dex redécompilé (**3/3 dans chaque cas**). Tout est fictif, y compris objets Android, réseau et données ; les tests ne sont pas une émulation Android :

- Deux réponses `libraryV3` fournissent 75 playlists fictives au vrai callback JavaScript. Avec une activité fictive présente et un contexte application fictif, l'interpréteur du dispatch ne poste rien : aucun rendu natif n'est appelé dans ce scénario. Le même chaînage avec un contexte activité fictif, utilisé comme contrôle, atteint le rendu via `applyNativeUiData`. Cela caractérise une branche, pas la réception réelle de la Bibliothèque sur un téléphone.
- L'accueil fictif envoie les mêmes lignes au callback générique et au callback dédié. Dans le modèle, le générique est abandonné avec le contexte application ; le callback dédié est modélisé suivant le chemin Smali précédemment inspecté et atteint le rendu. Il ne s'agit pas d'exécuter réellement `NativeHomePaintRunnable` ou les widgets Android.
- Autre voie indépendante : `pullNativeHomeList` évalue `native_home_scrape.js` avec `NativeHomeJsonCallback`. Une garde de ce callback fait `"null".equals(valeur)` puis `if-eqz` vers la sortie. Un tableau JSON non nul est donc rejeté avant le parseur, tandis que la chaîne littérale `null` seule passe cette première garde. Deux tests caractérisent cette comparaison sur source et dex ; ils ne préjugent pas de la suite `JSONTokener` ni de la fréquence d'utilisation de cette voie. D'autres callbacks d'accueil subsistent.

## Script de récupération d'accueil et libellé artiste

Nouveaux tests exécutant le **vrai** `native_home_scrape.js` dans un DOM JSDOM isolé, avec liens et données inventés, sans chargement réseau. Une sérialisation `JSON.stringify` représente la réponse attendue au callback : ce n'est pas une WebView Android. Les instructions du callback et de la fabrique de lignes sont lues dans les sources puis dans le dex redécompilé.

- Une carte fictive donne bien une ligne `{title, uri, image, section}` ; sa réponse JSON simulée est ensuite rejetée par la garde `NativeHomeJsonCallback` déjà identifiée. Cela relie maintenant la sortie du script réel à cette garde spécifique. Ce constat ne s'étend pas aux autres voies de l'accueil.
- Si `__sfNativeHomeRowsJson` contient un tableau JSON valide, le script le renvoie sans consulter le DOM courant ni `mediaLib`. Si cette chaîne commence par `[` mais contient un JSON invalide, l'exception conduit à `[]`, sans repli vers le DOM existant. Les tests ne déterminent pas si ces situations surviennent sur appareil.
- Le script collecte au plus 40 lignes **DOM**, puis ajoute séparément toutes les playlists distinctes du tableau `mediaLib` dans le scénario testé : 45 liens DOM plus cinq playlists fictives donnent 40 + 5 lignes. La déduplication compare les chaînes exactes ; une URL Web et une URI Spotify représentant le même identifiant ne sont pas dédupliquées dans notre cas fictif.
- Dans la fabrique native, le chemin de secours qui construit un sous-titre à partir du tableau `artists` saute l'ajout pour un nom d'artiste non vide (`isEmpty() == 0` puis `if-eqz`). Un nom vide atteint l'ajout ; les autres chemins de sous-titres peuvent être utilisés à la place. Le test est une caractérisation du Smali, pas un rendu Android.

Au total, **181/181 tests Node ciblés** passent. Parmi eux, plusieurs caractérisent des comportements défectueux ; ils ne prouvent pas que l'application fonctionne. Les **33/33 tests du groupe Smali/CSS/scrape** passent aussi avec le dex redécompilé, mais le JavaScript et le DOM restent exécutés sur Node/JSDOM.

## CSS et chargement des assets : limites supplémentaires

- Le fichier Glass complet a son empreinte attendue et `rrweb-cssom` 0.8.0 en analyse 347 règles au total, dont les règles représentatives d'accueil et de dock attendues. Le parseur est permissif : son acceptation ne garantit ni la validité de toutes les déclarations, ni la compatibilité de la WebView, ni le rendu visuel. Les deux échecs statiques historiques restent non résolus.
- Lecture statique de `m9.d` : le cache mémoire est prioritaire ; en l'absence de l'exception prévue par la condition debug/`AppSingleton.W`, le chargeur peut lire `filesDir/hotfixes/<nom>` s'il existe, avant l'asset embarqué. Les chemins de `spotify_bridge.js` et du CSS appellent ce chargeur. Cela signifie que les octets vérifiés dans l'APK ne prouvent pas à eux seuls quels octets seront utilisés si un hotfix local existe. Nous n'avons pas vérifié la présence, l'origine ou l'activation réelle d'un hotfix sur appareil et ne demandons pas de supprimer des données. Une Preview fraîche et séparée réduit le risque d'hériter d'un état de l'application normale, sans prouver l'absence de hotfix ultérieur.

Ces tests reproduisent des défauts connus ou de nouvelles branches suspectes : leur réussite n'est pas une validation fonctionnelle. Aucun changement applicatif ou CSS n'a été effectué.

## Démarrage complet du bridge et connexion classique simulée

Vingt-trois tests exécutent les fichiers historiques **entiers**, pas seulement des fonctions extraites, dans JSDOM (`full-bootstrap.test.cjs`). Le DOM et le bridge Android sont fictifs, les requêtes sont interceptées par une fonction locale, XHR/WebSocket sont bloqués et les temporisateurs ne s'exécutent que si le test les déclenche. Aucun compte, réseau Spotify ni WebView Android.

- Le shell complet crée un unique élément script pointant vers le chemin same-origin historique, même si le chargeur est appelé deux fois. JSDOM ne reproduit pas `shouldInterceptRequest` : le test évalue **manuellement** le bridge complet à partir de l'asset historique. Il atteint le marqueur de fin de démarrage et une seconde évaluation ne remplace pas à nouveau `fetch`. Cela ne démontre pas le chargement, la CSP ou le timing réels sur Android.
- Après ce démarrage simulé, une réponse `libraryV3` fictive donne une playlist au callback et, après rafraîchissement manuel du shell, à l'accueil fictif. Une commande de lecture fictive contient la piste et le contexte attendus ; elle reste dans le faux réseau, sans son. Les défauts natifs déjà relevés continuent de s'appliquer aux voies étudiées.
- En simulant l'échec du chargement du script, puis en déclenchant manuellement les quatre callbacks de récupération, le même élément script en échec reste en place ; le bridge ne démarre pas dans cette fixture et aucune nouvelle balise n'est créée. Cela ne prouve pas qu'un chargement échoue sur téléphone ni qu'aucun autre chemin de récupération Android n'existe.
- Le script complet `classic_login.js` ajoute un lien sur un DOM de connexion fictif quand le sélecteur attendu existe et conserve une requête URL existante. Si l'URL fictive possède un fragment `#`, le paramètre ajouté se trouve après ce fragment, pas dans la requête. Deux injections dans le même DOM inchangé créent deux liens ; sans sélecteur reconnu, aucun lien n'est ajouté. Nous n'avons pas vérifié l'URL ni la structure actuelles de Spotify, ni sa connexion réelle.

Les **23/23 tests passent**, y compris lorsqu'ils caractérisent ces limites ; ils ne constituent pas une validation fonctionnelle ou visuelle. Aucune modification des scripts de connexion ou des en-têtes.

## Bibliothèque : réponses simultanées et reprises simulées

Sept cas supplémentaires utilisent les scripts complets et un faux réseau dont le test choisit l'ordre de réponse. Aucun service Spotify, appareil ou donnée personnelle n'est utilisé. Les résultats concernent les tableaux mémoire et les callbacks JavaScript, non l'affichage natif.

- Deux demandes de bibliothèque lancées simultanément produisent **deux requêtes fictives**. Si la deuxième réponse arrive d'abord, puis la première, l'ancien résultat remplace le plus récent. Le code vérifie `isFetchingLib` avant une attente asynchrone et ne le positionne qu'après celle-ci : les deux appels peuvent donc franchir la garde dans cet ordonnancement simulé.
- Si la première demande renvoie un refus fictif après le succès de la seconde, le tableau est ensuite remplacé par une bibliothèque vide et un callback vide est émis. Cela ne démontre ni qu'une réponse réelle serait refusée, ni que ce scénario est la cause des observations sur téléphone.
- Autre cas de concurrence : la fin d'une des deux demandes enlève le marqueur d'occupation alors que l'autre reste en attente ; une troisième vérification non forcée démarre alors. À l'inverse, une demande arrivée **après** que le premier chargement a commencé est mise en attente dans le scénario testé, puis satisfaite par sa réponse.
- Pour chacun des statuts fictifs 401, 403 et 429, une première réponse est convertie en liste vide ; une demande ultérieure réussit avec la réponse fictive suivante. Cela complète les tests précédents sur fragments avec le bridge complet, sans préjuger de la session ou des réponses réelles.

Les quatre cas de concurrence ont également été rejoués trois fois avec le même ordonnancement contrôlé, **4/4 à chaque fois**. Ces tests reproduisent des comportements existants ; aucun correctif n'a été appliqué.

## Playlists : file de lecture et réponses arrivant dans le désordre

Sept nouveaux tests font fonctionner le shell et le bridge complets sur des réponses de playlist fictives. Le test choisit explicitement l'ordre de réponse ; le réseau est un double local et la commande de lecture est interceptée sans envoi ni son. Les tests invoquent des fonctions JS directement : les gardes de clic natif déjà identifiées empêchent de conclure qu'un tel parcours est accessible sur appareil.

- Deux playlists fictives A puis B sont demandées ; B répond, puis A répond en retard. Le contexte et la file mémorisés par le bridge deviennent ceux de A. Si les deux playlists contiennent une même piste, un appel direct à `__sfNativeOpenUri` pour cette piste construit une commande avec le contexte et la file **A**, bien que B ait été la dernière demandée. Pour une piste présente uniquement dans B, le test obtient une file réduite à cette seule piste. L'appel direct à `playFromUri` avec le contexte B explicite utilise B dans le contrôle ; cela ne corrige pas le chemin testé.
- Dans un autre scénario, une playlist B vide ne remplace pas la dernière file non vide de A. Une piste fictive partagée jouée ensuite sans contexte explicite réutilise le contexte A. Le comportement réel d'une playlist vide et d'un clic n'est pas observé.
- Le test enchaîne aussi les callbacks JS avec l'interpréteur de `applyNativeUiData` en supposant une livraison native : la réponse B est acceptée et A rejetée par la garde d'identifiant attendue, mais la file JS a déjà été remplacée par A. Ce contrôle passe avec le Smali source et le dex redécompilé. Il contourne volontairement le défaut de dispatch générique déjà décrit et n'exécute pas Android.
- Dans deux cas fictifs sans valeur d'authentification ou sans identifiant d'appareil, `__sfNativeOpenUri` renvoie `true` même si aucune commande de lecture n'est construite. Cette valeur ne prouve donc pas une lecture effective dans ces cas.

Ces sept tests **réussissent en caractérisant** les comportements constatés, pas en prouvant une lecture fonctionnelle. Aucun code applicatif n'a été modifié.

## Connexion et session : tests uniquement fictifs

Le nouveau fichier `session-simulation.test.cjs` exécute des fragments historiques dans Node, avec stockage, appels réseau et attente remplacés par des doubles en mémoire. Aucun compte, cookie, jeton réel ou service Spotify n'est lu ni contacté. Les tests ne reproduisent pas la connexion réelle sur Android.

- `ensureAuthToken` accepte immédiatement une valeur non vide présente en mémoire sans contrôler sa validité ou son expiration. Sans valeur en mémoire, il relit le stockage simulé ; si le stockage est vide ou inaccessible, il renonce après 30 attentes de 40 ms **simulées**, sans attendre réellement. Un effacement fictif du stockage seul ne retire pas une valeur déjà en mémoire dans ce test isolé. Ce n'est pas une preuve de ce qui subsiste après une déconnexion ou un redémarrage réel.
- Dans l'intercepteur `fetch` historique, les en-têtes fournis comme objet simple sont capturés dans nos fixtures ; une instance standard `Headers` est transmise au faux réseau mais n'est pas lue par les accès directs aux propriétés. Le préfixe est comparé de façon sensible à la casse. En option Canvas désactivé, un objet `Request` fictif déclenche une erreur sur l'appel de `includes`, avant transmission au faux réseau. Ces résultats dépendent des formes d'appel utilisées ; aucun de ces cas ne démontre comment Spotify ou la WebView appellent `fetch` aujourd'hui, ni l'origine d'un code HTTP observé par l'utilisateur.
- Dans le shell simulé, l'action de déconnexion efface les deux stockages **fictifs**, puis invoque un callback natif fictif si disponible ; sinon elle demande une navigation fictive. Si l'effacement du premier stockage lève une exception fictive, le second n'est pas effacé mais le callback natif fictif est quand même appelé. Le callback étant une simple fonction de test, il ne redémarre pas la WebView et la valeur en mémoire reste présente dans cette simulation : on ne peut pas extrapoler au téléphone.
- Analyse ciblée des sources et du dex : le callback natif poste `NativeLogoutRunnable`, qui appelle `MainActivity.A()`. Dans cette méthode, le bloc d'effacement natif des données Web est conditionné par le booléen `l0` : faux le saute, vrai y entre. Ni le callback inspecté ni ce runnable ne fixent ce booléen eux-mêmes. Sa valeur réelle dépend d'autres chemins ; nous ne l'avons pas observée. La présence des appels ne garantit pas non plus leur achèvement sur appareil. Aucun effacement réel n'a été exécuté.

**16/16 nouveaux tests** passent sur les sources et sont rejoués avec les classes redécompilées (seuls les trois tests natifs lisent le Smali ; le reste reste simulé en Node). Ils caractérisent le code, pas la réussite d'une connexion ou d'une déconnexion.

## Préparation Preview et piste fictive vers les gardes natives

- **8/8 tests Python**, sur des copies minimales créées dans un répertoire temporaire : ils utilisent un certificat factice en forme d'empreinte, jamais de clé. La préparation transforme les fichiers attendus, adapte le package, les autorités, la permission et les actions PIP, retire un éventuel attribut `debuggable`, et conserve les deux JS et un asset témoin. La comparaison structurée du manifeste vérifie que ses autres attributs restent identiques dans cette fixture ; elle ne vérifie pas la signature ni une installation Android.
- Une empreinte de CSS incorrecte, l'altération de l'un des deux JS ou des paramètres invalides sont refusés avant toute écriture dans ces scénarios. Le projet déjà préparé est aussi refusé. Le script **n'est pas transactionnel** : avec un mauvais package, il a déjà remplacé le CSS avant de s'arrêter ; avec un `apktool.yml` défectueux, manifeste, CSS et chaînes ont déjà été modifiés. Il faut donc jeter la copie en cas d'échec, et ne jamais l'utiliser sur l'application normale. Le workflow prépare bien une copie distincte, mais son exécution réelle reste non vérifiée.
- La vérification par empreinte du script couvre le CSS fourni et deux JS nommés, **pas tous les fichiers** historiques. Le workflow vérifie le commit du checkout et plus tard les assets embarqués, mais cela ne remplace pas la vérification d'une exécution réelle et signée.
- Un nouveau test utilise une piste fictive renvoyée par le vrai bloc historique de `fetchPlaylist` : le payload contient notamment `id`, `image` et `artists`. Les valeurs obtenues sont ensuite passées aux gardes Smali ciblées de la fabrique : elles reproduisent les sauts du listener, du chargement de pochette et de l'ajout du nom d'artiste. Ce chaînage est répété sur source et dex redécompilé ; le parsing JSON Android, les widgets et le clic ne sont pas exécutés. Il relie les résultats précédents sans prouver qu'une piste réelle atteindra cette fabrique sur téléphone.

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

Les tests sont dans `diagnostic-simulation.test.cjs` et `playlist-playback.test.cjs`. Le job manuel `v1.2.2-test.9003-preview` installe `jsdom`, applique le CSS Glass dans son checkout historique jetable puis exécute les 71 tests ciblés historiques, les 79 simulations, les 27 tests de caractérisation Smali et 4 contrôles CSS/callback, ainsi que 8 tests Python de préparation sur fixtures jetables ; il recompilera puis redécompilera également le dex et rejouera le groupe de 49 tests Smali/CSS/scrape/session et les cinq chaînes simulées ; il conserve le rapport complet historique. Le workflow **n'a pas été lancé**. Aucun fichier applicatif, en-tête, authentification ou CSS n'a été modifié pendant ces tests.

Sur une copie du commit historique avec `jsdom@26.1.0` disponible :

```bash
MELODIX_HISTORICAL_ROOT=/chemin/vers/copie-historique \
NODE_PATH=/chemin/vers/node_modules \
node --test docs/audits/2026-11-04-preview-historique-glass/diagnostic-simulation.test.cjs \
  docs/audits/2026-11-04-preview-historique-glass/playlist-playback.test.cjs
```

Avant toute conclusion sur un build signé, les défauts natifs ci-dessus nécessitent une décision sur un éventuel correctif ; le test sur téléphone décrit dans [README.md](README.md), quand l'utilisateur pourra le faire. Ne pas effacer les données ni demander de cookies, jetons ou captures privées.
