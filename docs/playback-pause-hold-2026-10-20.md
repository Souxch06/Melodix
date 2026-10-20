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
4. Après une pause explicite, un verrou de 20 s surveille le lecteur. Si la lecture repart
   toute seule (flux de position qui avance **et** bouton qui se déclare en lecture), la pause est
   réappliquée immédiatement (au plus 2 fois, espacées de 2 s).
5. Toute demande explicite de lecture ou de piste suivante/précédente libère ce verrou : le
   verrou ne combat jamais un choix de l'utilisateur.

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
- `pause-hold-start`, `pause-hold-reapply` ;
- `manage-all-pause`, `manage-all-play`, `dom-playpause-click`, `dom-skip` ;
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
