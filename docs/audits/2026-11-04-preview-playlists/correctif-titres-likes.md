# Correctif ciblé : « Titres likés » dans le tiroir de bibliothèque

## Base, problème et limite

Ce correctif est une différence **sur la Preview de diagnostic test9000** (run 43620014478, source de fabrication `eaf86debc7430d4db82d6c6f98ddd52d528d1d69`), pas un retour à test.118. L’appareil et la dernière version fonctionnelle ne sont pas identifiés ; cette variante ne constitue pas une comparaison test.118. Test9000 inclut les autres changements diagnostiques déjà décrits dans README.md.

Dans `collectLibraryDrawerRows`, une URL `/collection/tracks` était censée être acceptée pour les titres likés, mais `spotifyResourceUri` refuse ce chemin : la vérification `!uri` quittait donc la boucle avant le traitement prévu. Un test JSDOM échoue sur test9000 et passe avec ce correctif. L’entrée apparaît seulement si elle est réellement présente dans le tiroir Spotify et si le code existant autorise déjà le DOM de cette page. Aucun contenu n’est inventé et le signal d’état de connexion n’est pas modifié.

Le code reconnaît uniquement l’URL HTTPS `open.spotify.com/collection/tracks`, avec ou sans préfixe localisé `intl-xx`, sans identifiant ni port non standard, et la mappe sur `spotify:collection:tracks`. Il préserve la déduplication existante, le visuel prévu, et utilise la navigation existante. Des liens externes, chemins ressemblants ou contextes non confirmés sont rejetés. Aucun cookie, jeton, en-tête ou logique de connexion n’est changé.

**Ce correctif ne résout pas un 429, ne fait pas apparaître les playlists si la page Spotify ne charge pas et ne démontre pas la cause de la bibliothèque vide.** L’ouverture et la lecture sur téléphone ne sont pas testées.

## Fichiers

Le patch `liked-songs-sur-test9000.patch` change seulement :

- `scripts/native_ui_shell.source.js` : corrige la reconnaissance du lien du tiroir.
- `assets/native_ui_shell.js` : fichier généré à partir de la source ci-dessus.
- `tests/live_library_dom.test.js` : quatre tests synthétiques (ligne présente, filtrage/déduplication, contexte inconnu, destination de navigation).

La branche contient aussi l’adaptation de `.github/workflows/preview-apk.yml` pour pouvoir construire manuellement la variante **test9001** à partir de test9000 puis du patch ci-dessus. Aucun CSS n’est modifié ; la [feuille complète de test9000](css_hacks_sans_section9.css) reste inchangée. La Preview garde la signature prévue et son package séparé ; le débogage WebView reste limité à ce package, comme dans test9000.

## Vérifications

- Avant correction, le test de présence des titres likés échoue comme prévu ; après correction, les trois suites ciblées réussissent : **140/140**. Les neuf tests du profil Preview et de l’expérience précédente réussissent aussi.
- Suite Node complète : **699/700** ; l’unique échec est le test qui exige le CSS Glass historique complet alors que test9000 retire volontairement sa section 9. Tests Python : **4/4**. Ce n’est pas une suite intégralement verte.
- APK non signé compilé localement pour vérifier l’assemblage et les assets ; il n’est pas installable et n’est pas distribué. Pas de test Android réel, ni d’APK test9001 signé construit ou publié.
- La recette applique et vérifie chaque patch, régénère les assets puis exécute les tests ciblés avant signature ; son YAML et ses commandes shell sont vérifiés localement. Le workflow modifié n’a pas été exécuté dans GitHub Actions : **ne pas supposer que son build est validé**.

Pour l’essayer après relecture de la PR existante, utiliser le workflow `Build Melodix Preview APK` sur la branche de travail avec le tag réservé `v1.2.2-test.9001-preview` et le SHA complet du commit qui contient ce document et le workflow. Vérifier le succès CI, le certificat Preview, le package et le versionCode avant installation ; ne pas désinstaller pour contourner une incompatibilité. Aucune release publique ne doit être créée par ce mode.
