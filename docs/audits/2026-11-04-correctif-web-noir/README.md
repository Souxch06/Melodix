# Candidat de récupération — WebView noire

## Retour sur appareil

L'APK `c19cec9e84c29e60cad169d32ef80a5909bf49f5f3b32f531109479e4b1756b8` affiche « Connexion Spotify non confirmée ». Le dialogue « Ouvrir Spotify » reste noir plus de 30 secondes, mais son bouton de retour est visible ; l'onglet Bibliothèque est vide. Les causes exactes ne sont pas encore établies.

## Modifications du candidat

- Le dialogue rend explicitement la WebView visible, restaure son alpha, reprend la WebView et ses timers, puis remet ses propriétés initiales quand il la restitue. L'action Accueil garde la page courante au lieu de la recharger ; une URL absente ou `about:blank` charge la racine Spotify.
- Pendant qu'un dialogue détient la WebView, `MainActivity.C()` ne la lui retire plus lors d'un changement de configuration ou d'un nouveau rattachement. C'est une course possible, pas une cause démontrée du symptôme rapporté.
- Un bouton « Diagnostic de la page » est disponible dans le dialogue. Il affiche dimensions, visibilité, progression et neuf indicateurs binaires : origine Spotify, corps, élément principal, runtime, shell, pont, profil, lecteur, état connecté. L'évaluation ne relève ni texte de page, ni URL, ni cookie, ni titre, ni identifiant de playlist ; côté Android, toute réponse autre qu'une chaîne de neuf bits est rejetée. Si JavaScript ne répond pas, les dimensions et la progression restent visibles.
- Aucune modification du certificat, des cookies ou du stockage. Le strict contrôle de l'état de connexion reste en place ; cet APK ne prétend donc pas résoudre à lui seul une absence de marqueurs DOM, un pont non démarré ou une page Spotify qui ne charge pas. Le recueil des playlists reste limité aux éléments réellement chargés ; le fonctionnement, la complétude et la lecture sur téléphone ne sont pas prouvés.

## Vérifications et reproduction

590/590 tests Node et 4/4 tests Python de contrôle de signature. Les nouveaux tests simulent le script de diagnostic sur une page Spotify et un domaine tiers, et vérifient statiquement les protections du dialogue ; ils ne constituent pas un test Android. Compilation apktool, intégrité ZIP, décompilation de l'APK, signatures v2/v3 API 24–36 et concordance de l'empreinte compilée avec le certificat ont été vérifiées.

APK `1.2.2-glass-correctif-web-test.apk`, paquet `com.melodix.music`, version 1.2.2 code 27, SHA-256 `a424676327003527b3e65517e3a70b533837fc543dafc311d8515369f5abae06`. Certificat identique au candidat précédent : SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Le patch `correctif-complet-sur-base-44902.patch` reproduit ce candidat depuis `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; son application et les nouveaux fichiers ont été vérifiés. SHA-256 `9b1cb802481bb872a74fe5eb3fc7e5f008a39b225b0baaecc17947f33756e6ee`. Il ne contient aucune clé de signature.
