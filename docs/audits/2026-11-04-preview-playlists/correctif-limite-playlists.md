# Ne plus tronquer à 40 les playlists déjà chargées

## Défaut reproduit

Dans la variante basée sur test9001, `libraryRows('playlists')` limite à 40 les éléments présents dans `window.mediaLib`, même lorsque le code existant a validé la réponse de bibliothèque. L’onglet Bibliothèque les envoie alors directement à Android et ne tente pas d’afficher les entrées suivantes. Avec 75 playlists fictives déjà chargées, le test reçoit 40 lignes avant changement et 75 après.

Ce cas synthétique **ne démontre pas** que les données arrivent sur le téléphone. Il ne résout pas un chargement infini, un refus HTTP ou une page Spotify inaccessible. Il ne change ni récupération des données, ni preuve de session, ni connexion, cookies, jetons, en-têtes ou identité navigateur.

## Changement

`plus-de-playlists-sur-test9001.patch` relève la limite pour **les playlists uniquement** de 40 à 500, comme pour la projection de la page collection déjà présente dans le candidat. Les albums et autres catégories restent à 40. La limite de 500 demeure : ce n’est ni une pagination, ni un chargement de playlists supplémentaires ; au-delà, des éléments peuvent encore manquer. Les données ne sont utilisées que si la validation existante de la session est vraie.

Le rendu Android actuel crée les vues de ligne dans une liste, sans virtualisation : une bibliothèque très longue peut entraîner des ralentissements ou une pression mémoire. Les tests locaux ne permettent pas de mesurer ce risque. Sur téléphone, vérifier la fluidité, les images, le défilement et l’ouverture avec une bibliothèque longue ; si le rendu se dégrade, une pagination ou une liste virtualisée sera nécessaire plutôt qu’un plafond plus élevé.

Le patch agit sur :

- `scripts/native_ui_shell.source.js` : limite de conversion pour les playlists déjà chargées.
- `assets/native_ui_shell.js` : asset régénéré de cette source.
- `tests/live_library_dom.test.js` : vérifications de 75 éléments, du plafond de 500 et de la conservation des règles de session et de limite des autres catégories.

En outre `.github/workflows/preview-apk.yml` permet une fabrication **manuelle uniquement** avec le tag `v1.2.2-test.9002-preview`, qui reconstruit test9000, ajoute le correctif test9001 des titres likés, puis ce patch. Ce n’est pas une comparaison avec test.118. Le workflow n’a pas été lancé ici ; aucune APK signée test9002 n’est produite. La Preview conserve ses données séparées et la clé Preview ; le débogage WebView reste réservé au package Preview. Aucun CSS modifié : [CSS complet conservé](css_hacks_sans_section9.css).

## Tests effectués

- Tests ciblés JSDOM et modèles : **143/143**. La limite ancienne de 40 est reproduite avant correctif.
- Vérifications profil/Preview précédentes : **9/9** ; Python : **4/4**.
- Suite Node complète : **702/703**. L’échec restant concerne l’assertion du CSS Glass complet, non applicable à la Preview dont la section 9 est volontairement retirée ; ne pas présenter cette suite comme verte.
- Les patchs sont reconstitués et les trois fichiers comparés ; génération identique ; workflow analysé syntaxiquement ; compilation locale d’une APK non signée et vérification des assets. Aucune installation, signature de test9002, exécution Android ou mesure de fluidité réelle.
