# Prototype Spotify Web Player — phase 1

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

`PlaybackBackend` expose un état normalisé minimal (status, titre, artiste, artwork, durée, position, erreur) ainsi que `play()` et `pause()`. L'adaptateur Audius/YouTube prouve que la frontière peut envelopper l'existant sans le réécrire. `SpotifyWebBackend` est instancié uniquement par l'écran expérimental.

## Limites volontaires de la phase 1

- aucun script injecté ;
- aucun scraping DOM ou contrôle d'élément média ;
- aucune lecture de cookie, storage, token, credential, réponse réseau, DRM ou flux ;
- aucune donnée OAuth PKCE transmise à la WebView ;
- play/pause Web sont définis dans le contrat mais restent non branchés et diagnostiqués comme indisponibles ;
- connexion effective et session perdue ne sont pas déduites artificiellement : seul le passage par `accounts.spotify.com` puis le retour vers `open.spotify.com` est observé au niveau navigation ;
- aucune projection MediaSession du Web Player avant une source d'état fiable et testée.

Le smoke Android ouvre la route expérimentale par deep link, vérifie son rendu natif et exerce un cycle arrière-plan/retour. Il ne se connecte pas à un compte et ne prétend donc pas valider l'authentification, la lecture, la continuité audio de fond ni la récupération après destruction forcée du renderer.

La WebView utilise son stockage/cookies normaux (`domStorageEnabled`, cookies partagés, mode non-incognito) sans les exposer au code Melodix. Les navigations sont limitées aux origines Spotify HTTPS. Les diagnostics ne conservent ni URL complète, ni path, ni query, ni fragment, ni texte d'erreur upstream.
