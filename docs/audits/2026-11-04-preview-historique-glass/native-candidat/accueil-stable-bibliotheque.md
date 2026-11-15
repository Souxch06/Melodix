# Candidat 9010 — bibliothèque et stabilité de l'accueil

## Retour utilisateur

Sur 9009, la bibliothèque est toujours vide. Sur la capture de l'accueil figurent pourtant des entrées réelles dans « Vos playlists » et d'autres sous « Sélections Spotify » ; l'utilisateur observe des disparitions puis des réapparitions intermittentes. La capture ne montre pas l'écran Bibliothèque et ne prouve pas l'origine précise du défaut. Les clics ne sont pas confirmés.

## Correction candidate

- Lors du clic sur la bibliothèque, le shell relit l'accueil actuellement observé et utilise, en secours, les vraies lignes de la section personnelle déjà visibles, ainsi que les entrées de la barre latérale. Les recommandations et les titres individuels ne sont pas classés comme playlists ; `spotify:collection:tracks` est reconnu explicitement pour « Titres likés ». Les catégories et doublons sont filtrés. Si la récupération Spotify échoue ou répond vide, les lignes de secours sont réémises ; si le panneau devient disponible plus tard, il est observé sans multiplier les mêmes rendus.
- Pour les mises à jour temporairement partielles, les lignes de Home déjà observées sont conservées en mémoire au maximum 15 secondes après leur dernière observation, uniquement avec un jeton Bearer inchangé, sans stockage persistant ; elles expirent ensuite. Changer ou perdre le jeton invalide cette mémoire et les données du bridge liées à l'ancien jeton ne sont pas réutilisées par le nouveau cache. Les caches natifs préexistants et les données DOM restent des limites distinctes lors d'un changement de compte.
- Une seule transmission Home est envoyée par mise à jour. Les deux anciens callbacks appelaient le même rendu natif et pouvaient reconstruire deux fois l'écran ou faire revenir tardivement des données plus anciennes.
- Les tests n'établissent pas que le compte utilisateur renverra des données ni que tous les écrans de bibliothèque fonctionneront. Les anciens défauts des clics, du lecteur, de la connexion et des caches natifs ne sont pas corrigés ici.

## Vérifications locales

- Test de transformation des deux fichiers et rejet d'une entrée modifiée : 2/2. APK locale recompilée et redécodée, ZIP et ressources vérifiés ; elle n'est pas signée et ne doit pas être distribuée.
- 46/46 tests synthétiques ciblés sur les assets redécodés : entrée dans Bibliothèque à partir des vraies données Home simulées, titres likés, exclusion des recommandations, catégorie, route native interprétée, réponse vide/tardive, sidebar tardive, duplication, trous DOM, expiration, token remplacé et conservation 9008/9009. Aucun réseau ou utilisateur réel.
- Chargement complet du shell et du bridge candidats : 3/3 tests synthétiques ciblés ; 40/40 tests natifs/session ciblés, chaînes historiques 3/3 + 1/1 + 3/3. Les tests de caractérisation historiques restent inchangés ; une copie cible le canal Home non dupliqué.
- Aucun appareil ou exécution ART. Le test reste nécessaire sur le téléphone ; le correctif ne garantit pas la disparition totale du problème.
