# Suppression du délai artificiel de reprise de page

À la demande de l’utilisateur, le délai local de cinq minutes et son message ont été supprimés. L’action « Réessayer » du panneau de page Spotify demande immédiatement un chargement natif de `https://open.spotify.com/` dans la WebView existante, y compris si le document courant est `about` et n’a pas le JavaScript Melodix. Le code n’ajoute pas de relance automatique, ne supprime ni cookies ni données, et ne contourne pas les contrôles de session. Chaque appui est une demande explicite distincte. Le backoff de l’API de bibliothèque, distinct de ce délai local de page, n’a pas été retiré.

Un HTTP 429 de Spotify est un refus émis par le serveur : retirer le délai local ne le lève pas et ne prouve pas que les playlists seront accessibles. Le diagnostic précédemment communiqué (document interrogé `about`, progression Android 10 %) ne permettait pas d’identifier la cause du blocage. Le cas où l’ancienne relance JavaScript était absente de `about:blank` reste reproduit en environnement synthétique et l’action native n’en dépend pas.

**696/696 tests Node et 4/4 tests Python passent.** Les tests modélisent notamment l’appui immédiat à travers le rendu Smali, le listener, le dispatch et l’appel WebView ; absence de WebView et exception de chargement sont également couvertes. Le DEX désassemblé confirme l’action native et l’absence de temporisation dans `NativePageRetry`. Il ne s’agit pas d’une exécution Android réelle. Aucun appareil ni émulateur n’est disponible et aucune réponse Spotify authentifiée n’a été observée : les playlists ne sont pas garanties.

APK `1.2.2-glass-reprise-sans-delai-test.apk` : SHA-256 `7134f7873ff2740e7d2afdbb3332a02e8e216f1d2a0cb26e1c8641b4e073f015` ; alignement, ZIP, assets, signatures v2/v3 API 24–36 et garde de certificat vérifiés. Certificat de test SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Patch complet appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 78 fichiers comparés ; SHA-256 `ad38c6b96d21df1e973e72b17aef08a98ea1de1aa7c4ee04bdff27b0f8eeab20`.
