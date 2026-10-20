# Pause de lecture : verrou et diagnostic

Ce document décrit le comportement de pause du lecteur Melodix, les garde-fous ajoutés et la
façon de lire la trace de lecture quand le problème « la musique passe à la piste suivante
quand on met en pause » réapparaît.

## Comportement attendu

1. Un appui sur pause (mini-lecteur, plein écran, notification, écran verrouillé, widget ou PiP)
   convertit l'état demandé en action explicite : `actPlayPause(false)`.
2. L'intention est mémorisée avant le clic (`__sfUserRequestedPause`, `reqPause`) : aucune
   reprise automatique ne peut annuler une pause demandée par l'utilisateur.
3. Le bouton n'est cliqué que si l'état courant diffère de l'état demandé. Un second appui sur
   pause ne produit donc jamais un « play ».
4. Après une pause explicite, un verrou de 45 s surveille le lecteur. Si la lecture repart
   toute seule (flux de position qui avance **et** bouton qui se déclare en lecture), la pause est
   réappliquée immédiatement (au plus 5 fois, espacées de 1,5 s). Un nouveau clic de pause
   pendant le verrou ne le redémarre pas et ne remet pas le compteur à zéro.
5. Toute demande explicite de lecture libère ce verrou ; une piste suivante/précédente l'arrête
   sans jamais relancer la lecture. Le verrou ne combat donc jamais un choix de l'utilisateur.
6. Une reprise signalée par Spotify lui-même (`manageAll(true)`, écho d'état, autoplay, file
   d'attente) **n'efface pas** le verrou : elle est tracée (`auto-resume-ignored`) puis ignorée
   tant que l'utilisateur n'a pas appuyé sur lecture. C'était la fuite qui permettait à une
   reprise automatique de relancer la musique après une pause explicite.

Le verrou ne clique **jamais** quand seul le libellé du bouton annonce « lecture » : il exige que
la position audio avance réellement entre deux mesures. Un fondu de sortie encore en cours, un
élément `audio` en tampon ou la piste silencieuse de maintien de session (`silent.mp3`) ne sont
donc jamais confondus avec une reprise de lecture.

## Ancien « Take Control »

Le bloc hérité `TakeControl` (intervalle de 5 s qui cliquait un bouton vert puis la première ligne
d'une liste dès que le lecteur paraissait en pause) est neutralisé : dans Melodix, il pouvait
relancer la lecture, voire démarrer une autre piste. Les modes `autoPlayMode` (`onetime`,
`permanent`) vérifient tous le verrou de pause avant d'agir.

## Trace de lecture (Preview uniquement)

`assets/spotify_bridge.js` conserve un tampon circulaire de 80 événements dans
`localStorage['melodix_playback_trace_v1']`, exposé par `window.__sfGetPlaybackTrace(n)` :

- `act-pause`, `act-play`, `act-skip-forward`, `act-skip-back`, `play-from-uri` ;
- `pause-hold-start`, `pause-hold-kept`, `pause-hold-reapply`, `auto-resume-ignored` ;
- `manage-all-pause`, `manage-all-play`, `dom-playpause-click`, `dom-skip` ;
- `dom-track-row-while-paused` (clic sur une ligne de piste alors que l'utilisateur a mis pause) ;
- `track-change` avec la précision `while-user-paused` ou `while-playing` ;
- `track-change` (avec la mention `while-user-paused` si le changement survient pendant la pause) ;
- `dom-track-row-while-paused` quand une ligne de piste est activée pendant la pause.

Chaque entrée contient l'horodatage, l'événement, l'état de lecture mesuré, le libellé du bouton,
la visibilité de la page et le titre courant (48 caractères au plus). Aucun jeton, cookie,
en-tête ou URL n'est enregistré.

En Preview (`com.melodix.music.preview`), le diagnostic runtime affiché après le chargement de la
page inclut cette trace dans `samples[].playback` :

- `trace` : les 40 derniers événements ;
- `userPaused` : état du verrou de pause ;
- `pauseHoldReapplies` : nombre de pauses réappliquées depuis le lancement.

Procédure : reproduire le problème, fermer puis rouvrir l'application Preview, attendre le
diagnostic, appuyer sur « Copier » et transmettre le contenu.

## Commandes de contrôle local

```bash
node --check assets/spotify_bridge.js
node --test tests/*.test.js
```

`tests/playback_pause.test.js` couvre l'intention de pause, l'idempotence, le verrou, les
protections contre les fausses reprises et les cibles tactiles des contrôles de lecture.

## Filet de sécurité : réinjection du bridge

Le 2026-10-20, le rapport de diagnostic Preview d'un appareil montrait
`nativeUiShellStarted/Ready/Completed: true` **mais** `bridgeStarted: false`,
`homeInitAttempted: false` et aucun marqueur `#sf-mobile-nav` : le shell natif tournait,
tandis que `assets/spotify_bridge.js` n'avait jamais démarré sur cette page. Toutes les
correctifs de pause vivant dans ce fichier étaient donc inactifs.

`assets/native_ui_shell.js` (asset séparé, toujours exécuté) surveille désormais le démarrage du
bridge. S'il est absent au bout de 3 s, il appelle
`AndBridge.injectBundledAsset('spotify_bridge.js')` : `AndBridge` relit l'asset via `m9.d`,
puis `NativeAssetRunner` poste `evaluateJavascript` sur le thread UI. Six tentatives maximum,
espacées de 3 s. Le diagnostic expose `ui.bridgeRecoveryAttempts` et `ui.bridgeRecovered`
pour distinguer « le bridge s'est lancé tard » de « le bridge ne démarre jamais ».
