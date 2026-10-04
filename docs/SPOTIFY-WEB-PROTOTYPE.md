# Prototype Spotify Web Player — phase 1

Pour le test sur téléphone sans exposer de données de compte, suivre [la procédure physique courte](./SPOTIFY-WEB-PHYSICAL-TEST.md).

## Audit du lecteur actuel

- `context/PlayerContext.tsx` expose l'état et les commandes de `melodixPlayer`. Il propose la restauration persistée mais ne la lance jamais automatiquement.
- `services/player.ts` est le moteur de production unique : queue, seek, shuffle, repeat, résolution Audius puis YouTube, `expo-av`, courses latest-command-wins et persistance.
- `services/playbackSession.ts` sérialise uniquement la session du moteur actuel dans AsyncStorage. Le prototype Web ne lit ni n'écrit cette clé.
- `services/mediaBridge.ts` écoute directement `melodixPlayer`, normalise son état puis reçoit les commandes MediaSession. Le prototype Web n'y est pas branché.
- `modules/melodix-media` projette cet état dans un `MediaSessionService` Media3 et son lecteur virtuel. Il reste une couche de contrôle, pas un deuxième moteur audio.
- Expo Router monte `PlayerProvider` à la racine. Le prototype est une route isolée sous `settings/` et n'altère pas la navigation principale.
- L'OAuth Spotify actuel reste Authorization Code + PKCE, stocké dans SecureStore. La WebView possède sa session WebView normale et ne reçoit aucune donnée PKCE/SecureStore.
- Le projet Expo SDK 51 / React Native 0.74 n'avait pas de WebView. La phase 1 ajoute uniquement `react-native-webview` dans la version compatible SDK 51.
- Le projet Android est généré par Expo prebuild. Le module Media3 local est inchangé.

## Frontière retenue

```text
React Native UI
  -> PlayerContext (inchangé en production)
  -> PlaybackBackend
       -> AudiusYouTubeBackend (adaptateur du moteur existant)
       -> SpotifyWebBackend (prototype non sélectionné)
            -> SpotifyWebRuntime (contrat/lifecycle)
                 -> Android WebView

MediaSession -> mediaBridge -> melodixPlayer (inchangé pour cette phase)
```

`PlaybackBackend` expose un état normalisé minimal (status, titre, artistes, artwork, durée, position, `isPlaying`, `isLoading`, erreur) ainsi que `play()`, `pause()`, `seek()`, `next()` et `previous()`. Le protocole Web est versionné (`version: 1`), borné, refuse tout champ inconnu et ne journalise jamais l'enveloppe brute. L'adaptateur Audius/YouTube prouve que la frontière peut envelopper l'existant sans le réécrire. `SpotifyWebBackend` est instancié uniquement par l'écran expérimental.

## Limites volontaires de la phase 1

- un probe minimal est injecté uniquement pour lire l'API Web standard W3C `navigator.mediaSession` (metadata + `playbackState`) et publier une enveloppe allowlistée ; il ne touche ni DOM, ni élément média, ni API Spotify privée ;
- aucun scraping DOM ou contrôle d'élément média ;
- aucune lecture de cookie, storage, token, credential, réponse réseau, DRM ou flux ;
- aucune donnée OAuth PKCE transmise à la WebView ;
- `onMessage` est réellement relié au backend, mais un document doit d'abord envoyer le handshake strict `{ version: 1, type: "ready" }` avant que tout état soit accepté ; aucun script n'est injecté dans Spotify pour fabriquer ce handshake ;
- un timeout de handshake après chargement classe explicitement le bridge comme indisponible (`bridge_timeout`) ; la destruction du renderer invalide de la même manière les messages et résultats de commandes tardifs ;
- play/pause/seek/next/previous Web sont définis dans le contrat mais restent non branchés et diagnostiqués comme indisponibles ; les commandes sont arbitrées `latest-command-wins`, mais ne peuvent réussir qu'après handshake et confirmation positive d'un runtime autorisé ;
- connexion effective et session perdue ne sont pas déduites artificiellement : seul le passage par `accounts.spotify.com` puis le retour vers `open.spotify.com` est observé au niveau navigation ;
- aucune projection MediaSession du Web Player avant une source d'état fiable et testée.

Le probe standard peut fournir titre, artiste, artwork et état playing/paused uniquement si Spotify expose effectivement ces champs via `navigator.mediaSession` dans Android WebView. Il teste aussi la présence d'EME et appelle uniquement `requestMediaKeySystemAccess('com.widevine.alpha', …)` avec une configuration audio : il ne crée aucune `MediaKeys`, aucune session DRM et ne demande/extrait aucune clé. Cette disponibilité doit être confirmée pendant une vraie lecture connectée. L'API Media Session ne fournit pas de getter portable pour durée/position et n'offre pas de méthode play/pause/next/previous à appeler : ces valeurs restent donc à zéro et les commandes restent désactivées plutôt que simulées.

Le smoke Android ouvre la route expérimentale par deep link, vérifie son rendu natif et exerce un cycle arrière-plan/retour. Il ne se connecte pas à un compte et ne prétend donc pas valider l'authentification, la lecture, la continuité audio de fond ni la récupération après destruction forcée du renderer.

La WebView utilise son stockage/cookies normaux (`domStorageEnabled`, cookies partagés, mode non-incognito) sans les exposer au code Melodix. Les navigations sont limitées aux origines Spotify HTTPS. Les diagnostics ne conservent ni URL complète, ni path, ni query, ni fragment, ni texte d'erreur upstream.

## Cycle de vie du runtime WebView (phase 1.1)

Le cycle de vie WebView est centralisé dans `services/playbackBackend/spotifyWebRuntime.ts` (`SpotifyWebRuntime`) ; l’écran ne fait que relayer les événements de la WebView et rendre le snapshot du runtime.

- `loading` à chaque nouveau document (montage, `onLoadStart`, rechargement manuel), `awaiting-bridge` à la fin du chargement, puis `ready` uniquement après le handshake versionné `bridge_ready` ; la deadline de handshake n’est jamais réarmée par un événement de sous-frame tardif ;
- pertes traitées explicitement : `bridge_timeout`, `renderer_destroyed` et `network_error` marquent l’état `error` côté backend et invalident les résultats de commandes tardifs (sessions backend inchangées) ;
- reconnexion automatique bornée : 3 tentatives au maximum avec backoff exponentiel borné (1,5 s puis 2×, plafond 15 s), rechargement simple si le renderer est vivant et recréation native de la WebView (`remount` via clé React) si le renderer est détruit ; budget réarmé par un handshake réussi ou par le bouton de rechargement manuel ; après épuisement, l’écran affiche `failed` et n’attend plus que l’utilisateur ;
- en arrière-plan, la reconnexion planifiée est différée et reprend au retour au premier plan ; le runtime ne déduit jamais une connexion ou une session ;
- aucune lecture simulée : ni mock de lecture, ni état playing inventé — un nouveau document doit rejouer le handshake strict pour que le pont accepte à nouveau l’état, et les commandes Web restent non branchées ; `PlayerContext`, `services/player.ts` et `mediaBridge` ne sont pas touchés.
