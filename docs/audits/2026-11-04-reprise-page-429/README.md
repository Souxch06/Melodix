# Reprise manuelle après HTTP 429 de la page Spotify

## Constat depuis le téléphone

Le diagnostic communiqué montre un HTTP 429 de la navigation principale dans la WebView ; le shell et le pont sont présents, mais le DOM principal Spotify et les signaux UI connectés ne sont pas observés, et aucun HTTP de bibliothèque API n’est observé. Le panneau d’état natif est attaché ; aucune carte de playlist n’est attachée. Ces observations n’établissent ni la durée de la limitation, ni sa cause exacte, ni la réponse ultérieure de libraryV3.

## Modification

L’ancien panneau détectait le 429 et évitait les relances automatiques mais ne permettait pas directement de relancer la page depuis le panneau. Le nouveau panneau propose « Réessayer » : une action explicite attend une pause conservatrice de cinq minutes depuis l’observation du 429 (et entre deux tentatives manuelles), puis demande une seule navigation vers `https://open.spotify.com/`. Une échéance est enregistrée dans `sessionStorage` pour les navigations de la même WebView ; si ce stockage ne fonctionne pas, l’action échoue sans requête. Un nouveau document confirmé HTTP 200–399 efface l’ancienne échéance. Une observation inconnue ne l’efface pas. Les relances automatiques et l’accès anticipé à l’API restent bloqués pour cette page 429 ; la preuve de session et les règles précédentes ne sont pas contournées.

Les cinq minutes sont une précaution locale, **pas un délai Retry-After reçu de Spotify**, qui n’est pas accessible ici. Spotify peut limiter plus longtemps. Le stockage de session ne garantit pas la conservation de l’échéance après destruction complète de la WebView ou du processus. Les autres chemins explicitement ouverts par l’utilisateur ne sont pas prétendus soumis à ce délai.

## Vérifications et limites

**696/696 tests Node et 4/4 tests Python passent**. Des tests synthétiques, sur source et assets compilés, vérifient l’absence de relance automatique, le clic prématuré, la reprise à échéance, la persistance entre documents simulés, le nouvel espacement, le blocage en cas de stockage indisponible et la reprise de projection de playlists quand un nouveau document 200 et le DOM connecté sont simulés. Le chemin du bouton a également été relié aux instructions Smali du listener et de la méthode de routage via des modèles de vues et Activity simulés. Aucun appareil ni émulateur n’est disponible : aucun HTTP Spotify réel, événement tactile ou rendu Android n’a été vérifié. Ce correctif ne peut pas lever une limitation serveur ni garantir l’affichage des playlists.

APK `1.2.2-glass-reprise-429-test.apk` : SHA-256 `b819956a11127ba564c5b63fee96070f1c9fbce689d5fd5e44352afec319c786` ; alignement, ZIP, trois assets, signatures v2/v3 API 24–36 et garde de certificat vérifiés. Certificat de test SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. Shell compilé : 108791 octets, inférieur au plafond de 108867 octets des tests existants.

Patch complet appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 76 fichiers comparés au candidat ; SHA-256 `c145033ded8fa02b84d83f12877d34911ea984cfada6f526865a86ad56c33c59`.
