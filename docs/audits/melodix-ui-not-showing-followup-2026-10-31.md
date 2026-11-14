# Suivi du diagnostic — interface Melodix absente

- **Date :** 31 octobre 2026
- **Branche :** `arena/7142700d-melodix` (PR #7 et `main` laissées intactes)
- **Préversion publiée à l’issue de ce suivi :** [v1.2.2-test.90-preview](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.90-preview)
- **Signalement initial :** l’utilisateur dit que c’est toujours pareil; il n’a pas identifié le build installé ni joint de nouvelle capture. L’installation de test.89 n’est donc pas confirmée.
- **État du diagnostic :** défaut de concurrence repéré dans le code; cause très plausible, mais pas encore confirmée sur l’appareil.

## Ce que fait le chemin de démarrage

Dans `smali/c91.smali`, le callback `onPageFinished` injecte `assets/native_ui_shell.js`, puis appelle immédiatement `AndBridge.runProbe(WebView)`. Il programme aussi un probe après 3 secondes et un filet de secours natif après 15 secondes.

Deux composants pouvaient donc essayer de reprendre la même page :

1. `native_ui_shell.js` attend normalement 2,5 secondes avant sa navigation de secours. Il vérifie d’abord si le DOM du lecteur est monté, puis choisit une URL Web Player autorisée. Son budget est conservé dans `localStorage` sous `mel_player_nav`.
2. Le probe Android, s’il ne trouve pas le lecteur dans le DOM supérieur, inspecte immédiatement les iframes et peut appeler `window.location.assign()` vers le lecteur ou `/app`, `/search`, puis `/`. Il partage le même budget `mel_player_nav` avec le shell.

Cette seconde navigation peut arriver avant que la page Spotify/React ait fini de monter, provoquer plusieurs `onPageFinished` et consommer le budget partagé avant l’expiration du délai de grâce du shell. Le shell peut alors abandonner son propre repli alors que l’écran qu’il cherche n’a pas été initialisé. C’est un défaut concret de coordination; les sources statiques seules ne prouvent toutefois pas que ce chemin est celui emprunté sur le téléphone.

## Correctif de coordination

Le probe Android vérifie maintenant `window.__sfNativeUiShellCompleted === true` avant d’inspecter les iframes ou de toucher au budget de navigation. Si le shell s’est installé sans erreur, le probe journalise `probe yield shell` et lui laisse la main. Si le shell n’a pas terminé son initialisation, le probe garde son comportement de secours afin de ne pas supprimer le dernier chemin de récupération.

Ce garde-fou se fonde sur `__sfNativeUiShellCompleted`, défini uniquement après la réussite de `install()` dans le shell, et non sur le simple marqueur précoce `__sfNativeUiShellStarted`. Le test couvre donc aussi le cas où le shell a commencé puis échoué : le probe doit alors conserver son repli.

Aucun changement n’a été fait à l’authentification, aux cookies, au parcours de connexion, à la lecture/écriture de credentials ou aux données de playlists. Le CTA Spotify n’est toujours jamais cliqué automatiquement.

## Vérifications

- Tests ciblés `tests/p0_startup_diagnostic.test.js`, `tests/native_ui.test.js` et `tests/p0_spotify_redirect_guard.test.js` : **93/93 réussis** avec le marqueur de réussite final.
- Les nouveaux tests exécutent réellement le JavaScript extrait du probe : shell terminé ⇒ aucun scan d’iframe, aucune modification de budget et aucun `location.assign`; shell incomplet ⇒ le repli Web Player `/app` reste actif.
- La suite complète `node --test tests/*.test.js` : **326/328 réussis**. Les deux échecs sont les mêmes échecs préexistants documentés dans l’audit précédent : assertion sur les scripts référencés par `c91.smali`, et liste figée des annotations `JavascriptInterface`.
- GitHub Actions, build/publication **réussis** : [run 41208138433](https://github.com/Souxch06/Melodix/actions/runs/41208138433). APK signé et attaché : [Melodix-Preview-v1.2.2-test90.apk](https://github.com/Souxch06/Melodix/releases/download/v1.2.2-test.90-preview/Melodix-Preview-v1.2.2-test90.apk).
- La release test.89 a été supprimée après publication de test.90; la liste API vérifiée ne contient maintenant que test.90. Son tag Git a été conservé.
- Essai sur téléphone réel : non effectué; aucun succès appareil ne peut être revendiqué pour l’instant.

## Validation encore nécessaire

Installer test.90 et confirmer que l’icône lancée est bien **Melodix Preview**, puis relever le build affiché dans les informations de l’application. Une capture de l’écran obtenu (ou le rapport de démarrage Melodix) permettra de distinguer un mauvais APK installé, un transfert vers Spotify Android et un échec du shell natif. Tant que cet essai n’est pas confirmé, le correctif reste un candidat sérieux, pas une résolution prouvée.
