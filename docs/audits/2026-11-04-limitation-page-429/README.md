# Limitation HTTP de la page Spotify

## Capture reçue

La capture du 14 novembre à 15:02 montre le code D2 `11011100001010000-1100101011011100-429` : l'entrée Navigation Timing du document `https://open.spotify.com` expose `responseStatus=429`, donc la page courante a reçu une réponse signalant une limitation des requêtes. Le diagnostic natif indique en parallèle HTTP principal `0` (aucune erreur observée par ce callback), une erreur HTTP de sous-ressource `1/429`, aucune erreur réseau ou SSL observée. Les deux mesures ont des origines différentes et leur différence ne permet pas d'identifier la ressource annexe, ni d'expliquer pourquoi le callback principal n'a pas relevé l'erreur. Une valeur zéro ne prouve pas un succès.

Ce résultat donne une explication plausible à l'absence de lecteur : il ne prouve pas la cause exacte de la limitation, sa durée, l'identité précise du composant serveur qui a répondu ou l'état de connexion. Le diagnostic ne capte pas `Retry-After` pour cette navigation. Le bit `document invisible` ne suffit pas à identifier une cause graphique et peut notamment dépendre de l'état du dialogue. La capture n'est pas publiée.

## Candidat de prudence

Le shell affiche un état « Spotify limite les requêtes » lorsque `NavigationTiming.responseStatus === 429` sur l'origine HTTPS attendue. Il suspend alors ses demandes automatiques de preuve de bibliothèque et sa navigation de secours initiale. Le pont bloque aussi les demandes explicites à `checkMediaLib` pendant cette observation ; ce n'est ni une déconnexion, ni une preuve API, ni une limitation extrapolée à une réponse de sous-ressource. L'utilisateur peut toujours choisir de relancer le lecteur plus tard ; aucun délai serveur n'est inventé, aucune boucle de rechargement n'est ajoutée et ni les cookies ni le stockage ne sont effacés. Le bouton manuel ne possède pas de minuterie imposée. L'état disparaît lorsque le document courant ne rapporte plus ce 429.

Ce candidat ne peut pas lever une limitation côté serveur ni garantir que l'écran noir ou les playlists seront résolus. Éviter les relances répétées et attendre avant une nouvelle tentative. L'accès API privé et la complétude de la bibliothèque restent non établis.

## Vérifications

6 tests dédiés exécutent le vrai runtime, le shell et le pont, y compris leurs assets compilés, en DOM simulé : page 429, requêtes automatiques et pont direct, signal manquant/200/403/500, 429 d'une sous-ressource distincte, puis retour hypothétique à 200. Ils ne constituent pas une réponse réelle Spotify ni une exécution sur Android. Suite totale 626/626 Node et 4/4 Python.

APK apktool compilé, intégrité ZIP et assets comparés, signatures v2/v3 API 24–36 et concordance du certificat avec la garde compilée. Paquet `com.melodix.music` 1.2.2 code 27, SHA-256 `52d603e6e15677094e4cf8cfa48c4e79cd5283fa639a3b8e7dd7bd36c681103e`, certificat inchangé `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. Le shell compilé fait 108862 octets, sous la limite de 108867 octets déjà exécutée sur appareil, mais une taille sous la limite n'est pas une validation Android.

Patch complet `correctif-complet-sur-base-44902.patch`, SHA-256 `6f85f636ceb3d3345cc7b0b7560072fafc90c2bd3fe5b158197c7bfaf2df0a28`, vérifié sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`. Aucune clé incluse.
