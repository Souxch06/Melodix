# Pochettes et carrousels — preview test123

## Conclusion : défaut établi, limites téléphone

**Cause client établie :** `NativeImageLoader.load()` vérifiait `isEmpty()` puis sautait vers `clear_native_image` si le résultat était **false**. Toute URL HTTPS non vide était donc effacée **avant** `Picasso.load()`, sans requête et sans callback. Le test `tests/native_artwork.test.js` exécute les instructions de branchement du chargeur : une URL HTTPS atteint maintenant Picasso ; vide/null/HTTP/schéma Spotify ne déclenchent pas de requête.

Cette garde existe déjà dans `44902d9b` (avant notre travail), ce qui est compatible avec l'ancien thème vert également sans pochettes. Ce fait ne dit pas combien de cartes du téléphone avaient réellement une URL : **le payload réel et ses nombres ne sont pas disponibles ici**. L'absence d'événement image ne permettait pas de distinguer URL absente et garde inversée.

Deuxième défaut corrigé : `NativeImageLoader$FirstImageMark.onError()` ne correspondait pas à l'interface Picasso **`onError(Exception)`**. Celui-ci provenait de l'instrumentation `25fb722c`, pas de l'ancien chargeur vert : il ne faut pas confondre les deux provenances. Sans appel réseau auparavant, le chemin d'échec n'était pas exercé.

**Mise en page :** le renderer natif utilise déjà des pistes `HorizontalScrollView` + `LinearLayout.HORIZONTAL`. Les commits B.1 `36d78394` et B.5 `4888103c` modifient le CSS Web/barre/viewport, pas ce renderer ; aucune preuve ne permet de leur attribuer le chevauchement natif du téléphone. Une grille rapide verticale dupliquait toutefois les premières cartes avant les carrousels, et la condition du titre de section était inversée. La grille dupliquée est retirée, les vrais titres de section rétablis. Le débordement précis sur téléphone reste à confirmer par dimensions et propriétaire visible ; il n'est pas présenté comme une cause racine mesurée.

## Payload et chaîne de chargement

Chemin courant : collecteur DOM / bibliothèque → normalisation du champ **`image`** → `onNativeUiData` → `NativeHomeShelfRenderer` → `NativeImageLoader` → **Picasso** → `NetworkRequestHandler` / **OkHttp3Downloader** → `BitmapHunter` / **BitmapFactory** → `ImageViewAction` → `ImageView`.

La nouvelle mesure intervient côté Android sur le JSON effectivement reçu, avant préchargement/rendu :

- `image stage=payload N https=X missing=Y invalid=Z` : N lignes non-state du payload ; X URL de forme HTTPS, Y chaînes vides/absentes, Z autres formes. Ce ne sont pas des comptes uniques de playlists : une ligne de section éventuelle reste une ligne du payload.
- `image stage=source host=… key=… form=https|empty|spotify|invalid` : forme/hôte/hash des 32 premières positions. Aucune URL ni titre de carte.
- HTTPS « de forme valide » ne prouve pas que le serveur possède l'image. Une requête peut encore être refusée ou renvoyer un contenu indécodable.

**Comptage téléphone : non mesuré à ce stade**, pas inventé à partir des fixtures. Les tests de la copie utilisent, par exemple, une fixture de 4 lignes (3 HTTPS / 1 manquante) ; ce n'est pas votre payload.

## Vérifications des causes possibles

| Hypothèse | Résultat vérifié / limite |
|---|---|
| URL vide | L'ancien renderer sautait aussi le chargeur quand `image` était vide. Le nouveau compteur les distingue ; même placeholder pour ce cas. Nombre téléphone inconnu. |
| URL HTTPS non vide | Rejet client systématique reproduit : garde inversée, maintenant corrigée. |
| `spotify:image:…` | Pas une URL HTTPS acceptée par le chargeur. Le normaliseur JS peut déjà l'écarter avant le payload. Aucune preuve de cette forme dans le téléphone ; pas de conversion opportuniste ajoutée. |
| Headers/cookies/UA requis | Pas vérifiable sans réponse réelle du CDN. Picasso utilise sa pile native, pas le magasin cookies du WebView. Aucun header/cookie/UA n'est ajouté ou modifié ; les nouvelles traces HTTP montreront un refus éventuel sans tenter de le contourner. |
| Hôte publicitaire bloqué | Aucun match exact ni parent pour `i.scdn.co`, `mosaic.scdn.co`, `misc.scdn.co`, `image-cdn-ak.spotifycdn.com` dans la liste embarquée. Cela ne prouve pas l'hôte réel de toutes les cartes, ni l'état d'un DNS/VPN externe ou d'une liste personnalisée. **`adblock_hosts.txt` est inchangé** (SHA256 `87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c`). |
| Politique réseau / cleartext | Chargeur limité à HTTPS ; manifeste INTERNET présent et cleartext autorisé, mais pas utilisé par ce chemin. `c91.shouldInterceptRequest` retourne null ; la requête Picasso n'est pas une requête WebView interceptée par cette méthode. Pas de preuve de blocage réseau sur appareil. |
| Décodage | Instrumentation autour des vrais retours BitmapFactory, dont null, sans changer ses paramètres ou décisions. Aucun échec réel de décodage observé ici. |
| View nulle/invisible/recouverte | Taille d'ImageView/drawable et `isShown()` au callback ; mesures des pistes au pre-draw. Un callback peut précéder le layout et donner 0 : ce n'est pas une preuve de taille finale nulle. Pas de preuve pixel du téléphone. |
| Thème qui masque l'image | Aucun filtre/opacité ajouté au chargeur natif ; CSS Web ne peint pas l'ImageView Android. Le placeholder gris initial était explicitement construit dans le renderer. Cela n'exclut pas une autre surface recouvrant le natif : mesurer le propriétaire et les rectangles si le symptôme persiste. |

## MDXPERF : une seule copie, données bornées

Événements introduits :

- `image stage=start … form=… px=…` : entrée chargeur/préchargement ;
- `image stage=request …` : travail confié au downloader Picasso (peut être servi par cache disque, pas forcément une nouvelle connexion) ;
- `image stage=http … code=… duration=… bytes=… type=jpeg|png|webp|avif|gif|other|unknown` : code réel, durée jusqu'à réception de la réponse, **taille déclarée** Content-Length (`-1` si inconnue), type ramené à une enum. Le flux n'est pas consommé pour mesurer : ni octets réellement transférés ni durée complète du corps ne sont prétendus ;
- `image stage=decode … result=ok|failed width=… height=… bytes=…` : résultat réel BitmapFactory, dimensions et octets du bitmap décodé **avant** resize/transform. Un hit mémoire ne redécode pas et n'émet pas forcément cette étape ;
- `image stage=drawable …` : dimensions intrinsèques du drawable, potentiellement ajustées à la densité ;
- `image stage=view … width=… height=… shown=true|false` : état au callback, pas une preuve de pixels affichés ni d'absence d'occlusion ;
- `image stage=result … result=loaded|failed-network|failed-http|failed-io|failed-other|skipped duration=…` : raison fixe et durée. Une erreur IO n'est pas arbitrairement qualifiée de refus Spotify ou de décodage ;
- `shelf stage=layout cards=… orientation=0 width=… height=… overlaps=… overflow=…` : pre-draw, orientation 0=horizontal, recouvrement horizontal de cartes adjacentes à même Y et titre débordant de son parent.

L'identité est uniquement **hôte CDN public contrôlé + huit caractères hexadécimaux de SHA256 de l'URL** ; autres hôtes → `other`. Ni chemin, query, URL complète, en-tête, cookie, titre ou message d'exception. Les hash ne servent pas de preuve d'authentification. Budget 192 événements par période de reprise, puis `image stage=limit` ; journal global 64 Kio. En présence d'un marqueur limit/dropped, une capture plus courte est nécessaire pour une analyse complète.

Tests : grammaire native fermée + filtre réel `startup_timing_journal.py --filter-log` conservent les événements image/shelf et rejettent les URL/secrets. **La présence dans la copie réelle du téléphone reste à vérifier sur test123** ; ces tests ne sont pas une capture de son appareil.

## Corrections et cache

Commits distincts :

1. **`546e598a`** : garde HTTPS, signature callback et chaîne de mesure ;
2. **`6668d3e1`** : placeholder musical violet/magenta, même état pendant attente/absence/échec ; préchargement borné et resize à la taille physique d'affichage ;
3. **`a4705cef`** : carrousels/titres/sonde de layout, tests Android portrait et paysage ;
4. **`2065fdf6`** : distinguer le résultat réel du décodeur de la taille déclarée HTTP et du drawable.

Picasso possédait déjà **LruCache mémoire + cache disque OkHttp** : conservés, pas de deuxième cache réseau maison. Préchargement dès traitement du payload, au plus 12 URL distinctes, avec le même resize/centerCrop que le shelf, priorité basse existante de `fetch()`. L'ImageView reste prioritaire. Aucun gain de latence chiffré revendiqué avant mesure appareil.

L'ancien resize à **176 pixels fixes** du shelf est remplacé par le token d'artwork résolu en pixels : téléphone **148dp carré**, tablette 190dp selon le design existant. Fondu Picasso existant 200ms conservé ; un hit mémoire peut être immédiat. Le placeholder est un layer-list dégradé avec note musicale centrée, résolu **par nom** ; pas d'ID ajouté en dur. Pas de blur sur les cartes qui défilent.

Carrousels : plus de duplication des six premières cartes en grille rapide ; pistes natives horizontales, hauteur wrap-content explicite, titres min/max2 lignes avec ellipse, sous-titre en dessous, marges via tokens. Le chemin Web est également explicite row/nowrap, carte148px, hauteur auto et pochette non rétrécissable. Ces contraintes protègent le contrat mais ne constituent pas une reproduction de votre chevauchement.

## « Tout afficher », « Plus du genre de »

Ces libellés peuvent désigner une navigation de section/collection ou une entrée éditoriale, **pas nécessairement une playlist**. Une action « Tout afficher » ne devrait pas avoir une fausse pochette ; un style de lien/en-tête/chevron serait plus approprié. Une entrée éditoriale n'a une image que si sa source en fournit réellement une. Sans leur type/URI exact, ne pas les reclassifier par leur seul titre.

**Leur comportement et leurs cibles n'ont pas été changés.** Aucune règle de filtrage ni navigation spécifique ajoutée. Une reclassification/style distinct reste à faire seulement après accord.

## Validation, risques, fichiers

Suite finale locale : **1003 tests, 999 réussis, 4 ignorés, aucun échec**. Le vérificateur registres des classes natives passe ; signatures Android des nouveaux helpers sans problème. Les diagnostics anciens du code Picasso décompilé ne sont pas assimilés à de nouvelles régressions.

Le harness Android contient désormais des assertions de carré, parent horizontal et titre dans la carte, ainsi qu'une rotation portrait/paysage d'une **fixture synthétique non authentifiée**. Run lancé sur source `a4705cef` : https://github.com/Souxch06/Melodix/actions/runs/42591068520 . **Échec avant les fixtures de cartes**, phase `cold_start_native_home_timeline` : nœud d’accessibilité du statut natif absent à la fin du contrôle de démarrage. Les étapes 3s et 8s validaient le propriétaire natif ; le run indique absence de VerifyError, Activity reprise, mais n’a atteint ni les cartes synthétiques ni leurs rotations. **Portrait/paysage ne sont donc pas validés sur émulateur par ce run.** Ne pas masquer cet échec, ni modifier l’authentification ou le statut pour rendre ce CI vert dans cette tâche images. Ce run n'inclut pas l'ajout ultérieur du décodeur `2065fdf6` et son binaire instrumentation n'est pas le livrable utilisateur.

Risques : coût du logging borné et du préchargement ; consommation mémoire des grandes images avant transformation ; cache disque dépendant des directives CDN ; URLs filtrées en amont ; sonde de pre-draw silencieuse si aucune frame ; règles d'occlusion non mesurées ; callback qui précède le layout. Les tests locaux n'établissent ni succès CDN sur compte, ni screenshots portrait/paysage du téléphone. Pas d'effacement de session demandé pour tester les images.

Fichiers principaux :

- chargeur/callback : `NativeImageLoader.smali`, `NativeImageLoader$FirstImageMark.smali` ;
- mesures : `NativeImageTrace.smali`, `NativeShelfLayoutProbe.smali`, `NativeStartupTiming.smali`, `scripts/startup_timing_journal.py` ;
- hooks purement observateurs : Picasso `NetworkRequestHandler.smali`, `BitmapHunter.smali` ;
- rendu : `NativeHomeShelfRenderer.smali`, `assets/css_hacks.css` ;
- placeholder : `NativeArtworkPlaceholder.smali`, `res/drawable/native_artwork_placeholder.xml`, tokens `res/values/colors.xml` ;
- tests : `tests/native_artwork.test.js`, `tests/perf_startup_instrumentation.test.js`, `tests/android/HomeRenderInstrumentation.java`.

Aucun diff sur auth/session, bridge Spotify/requêtes/en-têtes/version, spoof/runtime_state, MainActivity ou liste publicitaire par rapport à test122.

## APK à tester et relance

**Prendre le dernier artifact ci-dessous**, pas celui du premier build intermédiaire de test123 :

- **Melodix-Preview-v1.3.2-test123.apk**, package `com.melodix.music.preview`, **vC1021453**, versionName `1.2.2-2065fdf` ;
- source `2065fdf6949633f210573ac41098cfa6f844c0f4` ;
- build/signature/assets réussi : https://github.com/Souxch06/Melodix/actions/runs/42591270957 ;
- téléchargement : https://github.com/Souxch06/Melodix/actions/runs/42591270957/artifacts/13661810643 ;
- SHA256 APK vérifié/annoncé par CI : `fbe382f73d449ee8ae0df02c7fee883f1ca821ac0e56c9d3b260ccc19d3b31dd`.

Installer par-dessus test122, sans désinstallation/clear-data/reconnexion. Si signature incompatible, arrêter. Puis :

1. Ouvrir l'accueil, attendre 10s, faire défiler un carrousel et copier une fois le diagnostic. Relever payload N/X/Y/Z, source→start→request→http→decode→result pour un même hash ; sur cache mémoire, request/http/decode peuvent manquer légitimement.
2. Revenir sur ce même accueil : vérifier réutilisation des images/cache, et placeholder musical pour absence/échec sans carré vide. Pas d'effacement du cache pour ce contrôle.
3. Tourner en paysage puis portrait : pochette carrée, titre≤2 lignes sans chevauchement, sous-titre dessous, balayage horizontal. Copier seulement si anomalie ; les événements shelf doivent avoir orientation0, dimensions positives et overlaps/overflow0.

```sh
gh workflow run preview-apk.yml --ref arena/6b935c3e-melodix \
  -f release_tag=v1.3.2-test.123-preview \
  -f source_ref=2065fdf6949633f210573ac41098cfa6f844c0f4
python3 scripts/startup_timing_journal.py diagnostic.txt --from-launch --json /tmp/artwork.json
```

Les événements bruts de la section MDXPERF restent la référence si le résumé du parseur limite le nombre d'événements affichés. La prochaine conclusion réseau/layout doit partir de cette mesure réelle, pas des fixtures.
