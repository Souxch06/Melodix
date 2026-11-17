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
