# Hypothèse : section 9 du CSS et playlists

## Variante préparée, non installée

`css_hacks_sans_section9.css` est un **fichier CSS complet**, dérivé de l’asset de l’APK `1.2.2-glass-reprise-sans-delai-test.apk` (`a1221cbf7e72a8d3254f294395c8ec43ac05815c`). Son seul changement est la suppression du bloc délimité par `SECTION 9: MELODIX MOBILE HOME & NAVIGATION POLISH` et le début de `SECTION 10: TOUCH APP SHELL`. Tous les autres octets sont identiques. Le CSS original complet est inclus pour comparaison. La section 10 et les règles Glass ultérieures restent donc actives : supprimer la section 9 n’élimine pas toutes les règles de bibliothèque ou de défilement.

- CSS original SHA-256 : `0d1ab6aa71f6978c5b5e1268566306d2811dfcf30c83831027293d36c38ab2f3` (vérifié dans l’APK).
- CSS sans section 9 SHA-256 : `4c700997e6e5f816abe5743f5001ac1307f50d7ed547880ef6c39427f2393405`.
- La feuille entière a été analysée par CSSOM ; la comparaison vérifie exactement la suppression et la conservation du reste. Aucun test de mise en page, de virtualisation ou de pixels n’a été effectué.

Dans ce CSS précis, la section 9 utilise `max-width: 820px` **ou** `hover: none` et `pointer: coarse`, plus un complément `max-width: 390px` ; ce n’est pas uniquement `max-width: 640px`. Les règles visées sont bien présentes. L’accueil montré dans le diagnostic précédent est un panneau Android natif : le CSS Web ne le masque pas directement, mais pourrait influencer le DOM Spotify utilisé comme source de données si ce document se charge.

## Autres observations, sans données privées

- La dernière mesure précise de la page signalait HTTP principal 429 et aucune réponse API `libraryV3` observée ; la capture ultérieure signalait un document `about` à 10 %, sans HTTP principal observé. Ces mesures ne démontrent ni un défaut CSS ni une réponse 200 de bibliothèque. Un affichage du lecteur Spotify ne prouve pas à lui seul l’autorisation des requêtes privées de bibliothèque.
- Dans l’asset `adblock_hosts.txt` embarqué, ni `open.spotify.com`, ni `api-partner.spotify.com`, ni `accounts.spotify.com`, ni `spclient.wg.spotify.com`, ni `i.scdn.co` n’ont de correspondance exacte ou de domaine parent listé. L’asset comporte cependant d’autres sous-domaines Spotify. Cette comparaison statique n’est pas une liste des hôtes réellement contactés ; l’app peut également avoir un fichier d’adblock actualisé dans ses données. Dans le code inspecté, `c91.shouldInterceptRequest(WebView, WebResourceRequest)` renvoie `null` ; ce seul constat ne prouve pas le comportement réseau complet sur téléphone.
- Dans des tests de `fetch` synthétiques, `playlist_sort.js` transmet `libraryV3` sans modification et renvoie la même réponse pour `fetchPlaylist` et `fetchPlaylistContents` en ordre par défaut. Le code inspecté clone et lit la réponse dans ces deux derniers cas : il ne faut pas confondre ce test avec une vérification du temps de réponse réel ou des autres ordres.
- Les sélecteurs `#Desktop_LeftSidebar_Id` et `.YourLibraryX` existent dans la feuille, mais leur présence dans le DOM Spotify actuel n’a pas été vérifiée.

`verification.test.cjs` comprend quatre tests synthétiques (CSS et wrapper `fetch`) ; avec les dépendances du projet installées : `node --test docs/audits/2026-11-04-hypothese-css-section9/verification.test.cjs`. Résultat : 4/4. Les réponses de tests ne sont pas celles de l’utilisateur.

## Limites et prochaines vérifications

Aucun appareil, adb, émulateur ou KVM n’est disponible. L’accès GitHub Actions renvoie HTTP 403 pour cette connexion ; la clé de signature Preview existante est un secret de CI et n’est pas disponible localement. **Aucun APK Preview n’a été construit ou signé**, aucun débogage WebView n’a été activé, et aucune modification de package, signature, cookies, en-têtes ou scripts de connexion/jeton n’a été effectuée. Ne pas installer un APK signé avec une autre clé à la place de la Preview existante.

Pour une comparaison exploitable, construire avec la chaîne Preview et sa clé habituelles une version témoin du même candidat et une version ne changeant que le CSS complet ci-joint, puis observer sur téléphone : connexion, accueil, bibliothèque, ouverture d’une playlist et lecture. Ne réactiver les blocs de la section 9 un par un que si la comparaison montre une différence ; le DOM réel et les statuts 200/erreurs des opérations doivent être examinés sans enregistrer ni communiquer jetons, cookies, en-têtes, corps de requête ou réponses privées. La conclusion est impossible tant que Spotify ne charge pas une page exploitable.
