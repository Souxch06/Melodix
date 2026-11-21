# Phase 4 — recherche, bibliothèque et playlists

## Périmètre

Le champ de recherche natif conserve sa surface claire et sa taille ; une bordure accentuée signale désormais le focus. Les filtres de bibliothèque exposent leur sélection aux services d'accessibilité en plus de la teinte existante. La bannière des playlists/albums reprend le rayon de pochette calculé en dp de l'accueil et la pilule d'accent native, au lieu d'un vert codé en dur ; le clic reste sur la bannière existante.

Aucun changement de données, navigation, gestion des requêtes, caches, placeholders ou session. Les rangées partagées ne sont pas modifiées et les commandes « Tout afficher » et « Plus du genre de » restent hors périmètre. Pas de flou sur les contenus défilants. Les tailles des cibles de recherche et de filtres restent celles existantes (au moins 48 dp sur téléphone).

## Vérification

- Tests ciblés 81/81 ; suite Node 1087 tests : 1083 réussis, 0 échec, 4 ignorés.
- Vérification statique des deux méthodes smali modifiées : 0 problème ; références applicatives et `git diff --check` propres.
- Les assertions ne valident pas les pixels, la lecture par TalkBack, le clavier ou les clics Android sur un appareil réel. Captures téléphone portrait et tablette paysage authentifiées non disponibles ; la CI sans compte ne prouve pas l'authentification. Ces points restent à vérifier en conditions réelles.
