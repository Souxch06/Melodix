# Préparation Preview — expérience bibliothèque

**État : pas d’APK Preview installable livré.** Le candidat a été assemblé localement sous forme d’APK **non signé**, uniquement pour vérifier la compilation ; cet APK n’est pas distribué et ne peut pas être installé. La clé Preview existante n’est accessible que dans les secrets CI, et la consultation des permissions Actions retourne 403. Ne pas signer avec une autre clé ni désinstaller une Preview existante pour contourner ce blocage.

## Ce qui est préparé

Le point de comparaison est exactement le candidat de l’APK `1.2.2-glass-reprise-sans-delai-test.apk` publié à `a1221cbf7e72a8d3254f294395c8ec43ac05815c`. Le [patch complet de ce candidat sur la base `44902d9`](../2026-11-04-reprise-sans-delai/correctif-et-tests-sur-base-44902.patch) est déjà publié. Le fichier `diagnostic-sur-candidat-sans-delai.patch` de ce dossier est une **seconde étape**, applicable à ce candidat uniquement : il ne faut pas l’appliquer directement à une Preview différente.

- `css_hacks_sans_section9.css` est la feuille complète, avec seule la section 9 retirée : SHA-256 `4c700997e6e5f816abe5743f5001ac1307f50d7ed547880ef6c39427f2393405`.
- L’injection `spotify_sw_compat.js` est sautée et le désenregistrement par `desktop_spoof.js` est retiré. Les autres fonctionnalités du script restent actives. On ne supprime aucune donnée WebView et on ne modifie pas les workers déjà stockés.
- `adblock_hosts.txt` intégré est vide et les deux lectures du fichier de règles téléchargé sont redirigées vers cet asset vide ; aucun fichier stocké n’est supprimé. Cette modification ne prouve pas que d’éventuels autres bloqueurs système ou réseau sont désactivés.
- Les deux points d’exécution WebView de `playlist_sort.js` sont neutralisés ; le fichier reste intact.
- Le profil natif et les valeurs JavaScript utilisent déjà le numéro issu de l’UA du WebView. Aucun numéro fixe inventé ni changement d’en-tête réseau n’a été ajouté. Les en-têtes Client Hints HTTP réels et le numéro du téléphone restent à observer.
- Le débogage WebView est activé **uniquement si le package exécuté est exactement `com.melodix.music.preview`**. Il donne un accès étendu au contenu de la WebView aux outils de débogage : ne l’utiliser que sur un appareil et un ordinateur de confiance, puis revenir à une version non débogable. Ne pas publier cet APK comme version normale.

La variante ne modifie ni `spotify_bridge.js`, ni `classic_login.js`, ni `google_spoof.js`, ni `facebook_consent.js`, ni le code de connexion, cookies ou jetons **par rapport au candidat cité**. Elle n’efface pas les données de la Preview ; le service worker peut néanmoins changer le comportement ou l’état WebView au cours du test. La Preview partage ses données avec toute autre installation du même package Preview, mais pas avec l’application normale.

## Vérification et fabrication restantes

Le patch a été appliqué sur une copie de cinq fichiers du candidat et comparé octet pour octet aux entrées de compilation. L’APK non signé a été compilé avec Apktool 2.9.3, en transformant localement son manifeste pour `com.melodix.music.preview` ; ses trois assets CSS, liste vide et JS ont été extraits et comparés aux entrées. L’essai ne vérifie **ni signature, ni installation, ni lancement Android, ni service worker réel**. Ne pas l’installer.

Les neuf tests ciblés (`preview-check.test.cjs` et `../2026-11-04-profil-navigateur/profile.test.cjs`) passent : ce sont des vérifications statiques et JSDOM, pas des tests sur appareil. Les anciennes suites peuvent attendre explicitement l’ancien blocage SW ou l’exécution du tri : elles ne sont pas une validation de cette variante.

Pour une fabrication signée fidèle, il faut reconstruire dans une copie propre la base `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, y appliquer d’abord le patch complet du candidat sans délai, puis `diagnostic-sur-candidat-sans-delai.patch`, et utiliser une procédure Preview qui signe **ce résultat exact** avec la clé Preview existante, en appliquant les transformations habituelles package, autorités, version et empreinte du certificat. Le workflow Preview standard checkout le `source_ref` indiqué et **n’applique pas automatiquement ces deux patchs** : lancer ce workflow directement sur le commit de cet audit ne construirait pas cette variante. Vérifier le certificat, le package, un `versionCode` supérieur à la Preview installée, et les assets de l’APK signé avant tout essai. Il n’y a pas ici de CI accessible pour réaliser ces opérations.

## Plan d’essai quand l’APK signé existe

1. Installer comme mise à jour de la Preview seulement ; ne pas toucher à l’application normale. Vérifier connexion, accueil, bibliothèque, ouverture d’une playlist et lecture, et noter bibliothèque vide, chargement infini ou affichage mal découpé.
2. Si la bibliothèque s’affiche, conserver le résultat de référence et réactiver un changement à la fois, avec le même package et la même clé : section 9, puis service worker, puis liste d’adblock, puis tri. Tester les mêmes étapes après chaque variante. Un échec au retour d’un élément est un indice, à reconfirmer avec une désactivation ; des interactions ou variations réseau restent possibles. Le profil UA n’a pas été modifié dans cette expérience.
3. Si elle ne s’affiche pas : sur un ordinateur de confiance, activer temporairement le débogage USB Android, ouvrir `chrome://inspect/#devices`, sélectionner la WebView de **Melodix Preview**, puis l’onglet Network et reproduire la navigation. Chercher `libraryV3`, `fetchPlaylist` et éventuellement `fetchPlaylistContents` (ces noms peuvent se trouver dans la charge utile ou les paramètres plutôt que dans le nom de la requête). Noter uniquement opération, statut HTTP ou absence/échec, et si la réponse contient une erreur GraphQL ou des éléments, sans copier contenu personnel. Un HTTP 200 ne garantit pas des données valides ou visibles. Si aucune requête n’est observable, le noter au lieu d’inventer un statut.

Ne transmettre ni HAR, ni URL complète, ni requêtes ou réponses brutes, ni en-têtes, cookies, jetons, identifiants ou noms de playlists. Couper le débogage USB après usage et revenir à une Preview non instrumentée.
