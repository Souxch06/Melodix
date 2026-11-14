# Diagnostic D2 pour écran Spotify noir

## Objectif et confidentialité

Diagnostic de test, non correctif de la page noire. Il conserve les corrections du candidat précédent et ne supprime ni cookies, ni stockage, ni session. Les nouveaux compteurs restent en mémoire, sont effacés à chaque navigation principale et ne sont ni sauvegardés ni transmis automatiquement. Aucun texte de page, URL, en-tête, cookie, identifiant, titre ou réponse HTTP n'est conservé ou affiché. Leur collecte est active uniquement pour une WebView dont la dernière navigation principale démarre sur HTTPS `open.spotify.com`, sans identifiants dans l'URL, port standard/443. Un changement vers une autre origine efface et désactive les compteurs. Les erreurs des sous-ressources sont comptées sans conserver leur origine. Les callbacks arrivant tardivement peuvent concerner une navigation antérieure ; ils ne constituent pas une preuve absolue.

## Champs affichés

- Dimensions, visibilité et progression de la WebView, comme avant.
- HTTP principal : dernier code d'erreur HTTP 400–599 observé pour une requête de document principal depuis le dernier démarrage de navigation. Les succès HTTP ne déclenchent pas `onReceivedHttpError`. Zéro = rien d'observé, pas succès. Les événements d'erreur des ressources annexes sont comptés (max. 99), avec dernier code.
- Réseau principal et ressources : dernier code d'erreur Android documenté (-1 à -15) et nombre limité à 99 pour les ressources annexes. Des annulations -3 peuvent être normales. Aucun message ni URL.
- SSL : nombre limité à 99 et catégorie Android `getPrimaryError` + 1 (1–6, pour distinguer catégorie 0 de l'absence d'événement). Les callbacks SSL ne sont pas qualifiés principal/ressource. Leur traitement par WebView n'a pas été changé.
- `Code D2` : 17 bits historiques, 16 bits complémentaires, puis un nombre HTTP de trois chiffres. Les 17 anciens bits ont leur description dans `2026-11-04-code-etendu/README.md`. Les 16 nouveaux, dans l'ordre : document complet ; indicateur navigateur `onLine` (ne prouve pas accès Internet) ; script inline présent ; script de type module présent ; texte quelconque présent dans le corps (y compris contenu injecté) ; style calculé du corps masqué ; document invisible ; service worker contrôlant la page ; API Resource Timing disponible ; au moins une ressource enregistrée ; au moins une ressource d'initiateur script ; entrée Navigation Timing présente ; `responseStatus` connu ; `responseStatus >= 400` ; balise CSP présente ; sélecteur générique d'alerte/erreur présent. Le nombre final est `responseStatus` 100–599 quand exposé par WebView, sinon `000`. Il est distinct des erreurs HTTP captées nativement. Absence d'une entrée n'exclut pas que la ressource ait été chargée. Les bits des pages non Spotify sont entièrement masqués.

L'interface valide strictement un format fixe `17 bits-16 bits-3 chiffres` et permet le défilement du diagnostic sur les petits écrans. Ce code ne livre aucun contenu dynamique du document, même si celui-ci contient des secrets.

## Vérification

- 620/620 tests Node et 4/4 Python. Le JavaScript du diagnostic, extrait du smali, a été exécuté sur DOM simulés avec et sans URL tierce, APIs Timing ou données privées. Les tests statiques contrôlent les raccordements natifs, bornes, réinitialisations et l'absence de collecte de contenu. Ils ne remplacent pas une exécution Android.
- APK compilé, décompilé et raccordements présents dans le dex reconstruit ; ZIP, assets, signature v2/v3 API 24–36 et garde de signature compilée vérifiés. `com.melodix.music`, version 1.2.2 code 27. SHA-256 `182324928c14c8ff7346e9773f1178c7259fba77bc934c7a871e6ba84c522649`, certificat stable `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.
- Patch complet `correctif-complet-sur-base-44902.patch`, SHA-256 `348ace4462704715626b985443c0d918324d6edcc2657f2f8bbb3528c08640bd`, application et comparaison des fichiers vérifiées sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`. Aucune clé de signature incluse.

Sans appareil Android ni réponse Spotify réelle, on ne peut pas garantir que chaque callback soit émis ou que l'écran noir soit corrigé. Il est préférable de communiquer une capture contenant tous les champs et le code D2, plutôt que d'interpréter des zéros comme des succès.
