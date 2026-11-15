# Preview 1022131 — candidat de diagnostic, pas une correction garantie

[APK signée (archive)](https://github.com/Souxch06/Melodix/actions/runs/43731627612/artifacts/14168189542) ; package `com.melodix.music.preview`, versionCode 1022131 ; source `738c165943819a280df47b00548ba2c378c3903e` ; SHA-256 APK `32b5ad175bb04666201e5082f8644b5f01c7fe194e17930365dd2148e0b4af48` ; SHA-256 ZIP `c9c6d286e8ee16ae5a8454b5e53316e8469b0c15eafc38e6da68d814a50b9f41`.

[Construction et garde signée des sept actifs](https://github.com/Souxch06/Melodix/actions/runs/43731627612) réussies ; [smoke hors ligne Android 11 et 15 de l'APK exacte](https://github.com/Souxch06/Melodix/actions/runs/43731794894) réussi. Les suites synthétiques et le smoke ne testent ni Spotify, ni audio, ni vitesse, ni rendu physique.

La 1022128 n'affiche aucune playlist d'après le retour utilisateur ; cette version ne garantit pas le retour des titres : elle ne résout que des scénarios de bridge/jeton tardifs, et évite les rechargements de secours quel que soit l'état observé. Voir [suivi et limites](suivi-1022128-playlists.md). La cause réelle peut être un échec ou une incompatibilité du bridge : aucune réponse ni mise en cache n'est inventée. En cas d'échec, ce candidat peut rester incapable d'afficher les titres, même en pause. Le diagnostic local permet de mieux distinguer les cas sans exposer la valeur du jeton ni l'identité de la playlist.

## Test proposé

1. Installer la Preview 1022131. Écouter un titre, ouvrir la bibliothèque puis une playlist, attendre environ 30 secondes et noter si la lecture recommence et si les titres apparaissent.
2. Sans rouvrir une autre playlist, aller aux paramètres et faire un appui long sur la ligne « Melodix • Client Spotify Natif » dans la section À propos. Copier le diagnostic et le communiquer après vérification. Il ne contient ni titre, ni URI, ni compte, ni valeur de jeton ; uniquement un état fixe et la présence ou non d'un jeton, plus des mesures locales.
3. Vérifier si l'animation de la barre est visible en lecture et s'arrête en pause ; vérifier l'arrière-plan. Ne pas supposer que les tests synthétiques reflètent le rendu du téléphone.
