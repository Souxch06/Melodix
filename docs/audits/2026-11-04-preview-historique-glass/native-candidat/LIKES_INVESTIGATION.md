# Investigation Preview — Like et Titres likés

État : investigation, **pas de correctif applicatif livré**. Tests réalisés sur les composants de la Preview assemblée au commit `d7b5e54b`, dans JSDOM et sur JVM avec des réponses synthétiques, sans téléphone ni session Spotify.

## Constats reproductibles

Le fichier `preview-liked-current-characterization.test.cjs` exécute le bridge effectivement présent dans la Preview, avec un réseau factice. Il caractérise quatre problèmes ou ambiguïtés existants :

* la requête `fetchLibraryTracks` part toujours de zéro avec une limite de 50, même si la réponse de test annonce 120 titres ; elle n'effectue pas de pagination ;
* une réouverture réutilise `likedSongsCache`, y compris après changement du jeton dans le scénario synthétique. Ce cache n'est pas associé à un compte ni à une version de bibliothèque ;
* une réponse devenue périmée ne publie pas son callback natif, mais remplit quand même le cache partagé ;
* un refus HTTP et une liste réellement vide aboutissent tous deux à un tableau vide dans le bridge : l'interface ne peut pas conclure, sur cette seule base, que la collection est vide.

Ces tests décrivent délibérément l'ancien comportement ; ils ne doivent pas être confondus avec les critères de validation d'un correctif. Leur présence ne prouve rien quant à l'API Spotify actuelle ou à un compte réel.

Le cache est également utilisé pour construire le contexte de lecture des titres likés. Le vider sans synchronisation n'est donc pas une correction innocente : cela pourrait changer la file envoyée au lecteur. Le fallback `preview-liked-fallback.js` existe dans le dépôt mais n'est pas intégré au shell final. Ses tests exécutés contre ce shell donnent 3 réussites et 10 échecs, ce qui confirme notamment que les cas prévoyant son appel ne sont pas satisfaits dans cette configuration. L'intégrer simplement ne démontrerait ni l'autorisation du jeton, ni sa compatibilité avec les réponses Spotify réelles, ni l'absence de concurrence avec le bridge ; il utilise un autre endpoint et inclut aussi les playlists ordinaires.

Pour le Like, les contrôles actuels refusent un clic lorsque l'identité ou l'état du bouton n'est pas vérifiable. Les tests simulés couvrent notamment l'identité de la piste, les menus ambigus, les titres identiques, les changements de piste et la confirmation après clic. Ces tests n'identifient pas le DOM réellement rencontré sur le téléphone. Ne pas utiliser l'ancien `actAddToFav`, qui peut agir sur un bouton non pertinent et déclencher des actions de lecture.

## Tests exécutés

* 125 tests Node réussis : contrôles, diagnostics, menus et panneaux du lecteur, route likés sécurisée, et quatre caractérisations du bridge existant.
* Simulation JVM du composant natif `PreviewPlayerMode` réussie.
* Suite du fallback non intégré : 3 réussites, 10 échecs attendus contre le shell actuel ; il ne s'agit pas d'une validation du fallback.
* Aucune connexion Spotify réelle, aucun appareil Android et aucune APK modifiée ou signée dans cette investigation.

## Suites nécessaires

Concevoir une récupération de collection bornée et paginée qui traite explicitement erreurs et autorisations, protège les changements de compte et les réponses concurrentes, et ne dégrade pas le contexte de lecture. Tester l'invalidation après ajout confirmé, les ajouts non confirmés, l'annulation/navigation et les collections de plus de 50 titres. Recueillir le diagnostic anonymisé du Like sur la version réellement installée pour savoir quel état/DOM le bloque, puis valider toute correction sur un téléphone et un compte Spotify réels, sans partager de jetons.

## Candidat ultérieur : pagination et invalidation

Le shell Preview charge désormais les titres likés page par page avec la même opération Spotify `fetchLibraryTracks` que le bridge protégé. Chaque ouverture demande des données fraîches ; les pages sont bornées, les doublons de page, réponses incohérentes, refus et expirations ne sont pas présentés comme une liste complète. La liste vide n'est annoncée qu'avec un total explicitement nul. Si le total n'est pas fourni, la liste est signalée comme possiblement incomplète. Le cache de contexte de lecture ne contient que les titres effectivement observés pour la requête courante, y compris si le chargement est partiel ; il n'est pas vidé au début d'une requête infructueuse.

Une tentative d'ajout depuis le lecteur invalide la lecture de collection en cours, même si la confirmation de l'ajout échoue. Le Like peut aussi confirmer l'état d'une case « Titres likés » rendue de nouveau après le clic, si elle est unique dans le même menu et que l'identité reste identique. La commande reste un ajout seulement : aucune piste déjà likée n'est retirée et un état ou une identité ambiguë reste bloqué.

Les nouvelles simulations utilisent le shell Preview et le bridge protégé réels avec réponses factices. Elles ne montrent pas que Spotify accepte la requête, que son format réel comporte tous les champs attendus, ni que le contrôle Like existe sur le téléphone : ces points demandent une validation sur appareil avec une session réelle. Les limites de 125 pages et les refus sont signalés ; aucune limite Spotify n'est contournée.
