# Melodix Preview 1.2.2-d0f206b-glass - campagne du 2026-11-26

Branche `claude/melodix-native-login-visibility-xfjyai`. `main` non touché, aucune PR fusionnée.
APK finale : versionCode 1022462, SHA-256 `4a9bba1a9b2ee03f80efe8c851bfb402cb6d8eb6d79433b560078d15ca370b66`,
construite par la vraie chaîne `preview-apk.yml` (run 45896207173, source `a1359af`), signée avec la clé Preview
(certificat `e3ceb66f...7802f`), garde 9016 : 7 fichiers protégés identiques.

## Bugs trouvés et corrigés (3 cycles)
1. **Connexion refusée par Spotify (« Oops! Something went wrong » / « Incorrect email address or password »)**.
   La WebView se présentait en Chrome/Windows tout en envoyant des indices Android : reCAPTCHA refusait même une
   saisie humaine. Correction : identité réelle de la WebView sur la page de connexion, identité « bureau »
   rétablie à la connexion (`apply_honest_login_ua.py`). Prouvé : la connexion humaine réussit.
2. **Page figée (login puis open.spotify.com), interface native vide**. `classList.remove()` d'une classe absente
   réécrit l'attribut, l'observateur du pont se relance sans fin (renderer à 100 % de CPU). Correction par un
   préambule exécuté avant le pont, sans modifier `spotify_bridge.js` (`apply_bridge_nav_scope.py`). Reproduit dans
   Chromium (figé / 2 ms) et jsdom, puis validé sur Android connecté : l'accueil affiche les données du compte.
3. **Chaîne de build** : le correctif 1 n'était pas branché dans `preview-apk.yml` (détecté en comparant l'APK
   de la chaîne à l'arbre validé). Corrigé, avec test.
Autres correctifs : hotfixes Firebase qui remplaçaient les assets Melodix, injection de style avant `<head>`, fond
de la page de connexion, barre Melodix superposée à la page Spotify, texte « aucune session » (ligne 1.3.x).

## Tests Android 16 (émulateur, session connectée par l'utilisateur)
Réussis : démarrage, connexion humaine, session reconnue (Paramètres : « Session Spotify active »), accueil
(Liked Songs, playlists, sélections, Daily Mix), bibliothèque (catégories, 2 éléments), titres likés (56 titres),
playlist (48 titres, durées), recherche (« daft punk » : titres et albums), lecture, pause, reprise, suivant,
précédent, seek (touche à 60 % -> 1:35), enchaînement automatique en fin de titre, lecteur complet, file d'attente,
paroles synchronisées, retour Android (Paramètres, titre -> bibliothèque), fermeture/réouverture (session
conservée, dernier titre restauré, accueil rempli en ~15 s).

## Mesures
Démarrage à froid de l'activité : 1,78 s. Accueil rempli : ~14,8 s après le lancement. Lecture : 54 % CPU, 350 Mo
(émulateur sans GPU, pas représentatif d'un S24). Avant correctif : renderer à 103 % CPU, page muette.

## Défauts restants
- Retour Android depuis l'onglet Bibliothèque quitte l'appli au lieu de revenir à l'Accueil.
- Position du mini-lecteur restaurée ~12 s avant celle de la fermeture.
- Paroles : squelette de chargement ~10 s au premier affichage ; petit à-coup de lecture ponctuel.
- Deux erreurs `appendChild` persistent dans `spotify_bridge.js` (fichier protégé par la garde 9016).

## Non vérifié
Audius et YouTube comme sources audio : absents du code (aucune des deux lignes ne contient « audius » ; « youtube »
n'apparaît que dans une liste de bloqueurs et un test d'adresses). L'audio passe par le lecteur web de Spotify.
Son réellement audible (émulateur sans sortie audio), ajout/retrait dans la file, menus contextuels, onglets
Albums/Artistes/Podcasts (contenu), historique, recommandations, stabilité prolongée, fuites mémoire, nouvelle
connexion complète avec l'APK finale (seule l'APK de test, même code, a été installée sur l'émulateur).
