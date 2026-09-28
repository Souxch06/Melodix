# Sources audio — Spotify (données) → Audius → YouTube (fallback)

## Objectif

Les playlists Spotify (métadonnées : titres, artistes, albums, covers,
durées, ordre) constituent **la vérité d'affichage**. L'**audio** vient
d'une cascade de providers, dans l'ordre strict :

```
           Playlist Spotify
                 │  données complètes (pagination intégrale)
                 ▼
            TrackResolver (services/audio/trackResolver.ts)
                 │
        ┌────────┴────────┐
        ▼                 ▼
  1. Audius          2. YouTube / YouTube Music   (fallback)
        │                 │
        └────────┬────────┘
                 ▼
           3. Indisponible (ni Audius ni YouTube)
```

- **Audius prioritaire, jamais contourné** : le premier provider est tenté
  en premier et YouTube n'est *jamais* consulté s'il répond avec un match
  fiable (pas de « meilleure offre » ultérieure — priorité absolue).
- **Même moteur de confiance** aux deux étages : normalisation complète
  (casse, accents, tirets, ponctuation), comparaison titre + artistes +
  album + durée, et **pénalité de variante dure** commune : un
  `remix` / `live` / `instrumental` / `karaoke` / `acoustic` n'est *pas* une
  correspondance exacte automatique si la source n'est pas cette version
  (ex. Spotify « Song » vs candidate « Song (Remix) » → rejet). À l'inverse,
  `radio edit`, `remastered`, `official audio/video`, `lyric video`
  restent des variantes acceptées.
- **Aucune substitution** : en dessous du seuil, « indisponible » est
  mémorisé et la queue passe au morceau suivant.

## Où vit quoi

| Morceau | Fichier |
| :-- | :-- |
| Abstraction provider (`AudioProvider`) | `services/audio/types.ts` |
| Provider Audius | `services/audio/audiusAudioProvider.ts` |
| Moteur de score partagé + pénalité variants | `services/audio/audiusTrackMatcher.ts` |
| Provider YouTube | `services/audio/youtubeAudioProvider.ts` |
| Client innertube (recherche + flux) | `services/audio/youtubeInnertube.ts` |
| Cascade ordonnée | `services/audio/trackResolver.ts` |
| File ≤ 5 simultanées (UI) | `services/audio/resolveQueue.ts` |
| Cache des décisions (provider + score + statut) | `services/audio/matchCache.ts` (v2) |
| Résolution progressive de l'écran | `hooks/usePlaylistResolutions.ts` |
| Cascade du player (lecture) | `services/player.ts` `resolveTrack` |
| Badges + statistique + description | `components/Preview/*`, `screens/PlaylistScreen.tsx` |

## YouTube/YouTube Music — décision d'intégration

- **Licence** : aucun code tiers n'est copié ; aucune dépendance npm
  ajoutée. Le module parle le protocole JSON public (`youtubei/v1`,
  clients `WEB_REMIX` / `ANDROID_MUSIC`) documenté de longue date par la
  communauté (InnerTune, MusicSeeker, NewPipe).
- **Maintenance** : ce protocole n'est pas garanti par Google — d'où un
  point d'épinglage unique (`WEB_REMIX` / `ANDROID_MUSIC` versions dans
  `youtubeInnertube.ts`) et une **dégradation propre** : si le protocole
  change, le provider renvoie simplement « indisponible ».
- **Compatibilité** : 100 % fetch/TypeScript — aucun natif ; le flux audio
  passe par expo-av, comme Audius (pause/seek/queue/background inchangés).
- **Aucun stockage serveur** : la lecture est un streaming direct depuis
  l'appareil (URL signée expirant ~6 h), jamais relevée côté backend.
  Aucun téléchargement, aucune copie.

## Cache — mémo des décisions (point 7)

Clé : `spotify:<trackId>`. Valeur v2 :

```json
{ "version": 2, "matchedAt": 1696…, "providerId": "youtube", "matchId": "abc123", "score": 62 }
{ "version": 2, "matchedAt": 1696…, "providerId": null, "matchId": null, "score": 0 }
```

- TTL 30 jours ; migration transparente depuis la v1 (→ Audius) ;
- les négatifs connus ne sont **jamais** recherchés à nouveau inutilement ;
- flux mort à la lecture → purge de l'entrée et cascade relancée ;
- « refaire le matching » : `removeMatchCacheEntry` (unitaire) /
  `clearMatchCacheStorage` (purge complète — `refresh()` du hook).

## UI playlist

- En-tête : cover, nom, **description**, « Par <propriétaire> », « N titres »
  et statistique dynamique **« 85/100 morceaux disponibles »**.
- Toutes les lignes Spotify sont affichées (jamais masquées), avec badge
  discret : **● Audius** (vert) / **● YouTube** (bleu) / **⚠ Indisponible**
  (ambré) ; la ligne indisponible affiche à l'appui
  « Ce morceau n'est pas disponible sur les sources de lecture actuelles. »
- La queue jouée saute automatiquement les indisponibles (notice affichée,
  jamais de blocage ni de crash).

## Sécurité

OAuth/PKCE/callback/SecureStore **inchangés** ; aucun Client ID/Secret
demandé ; aucun token dans Git ; recherche de secréteté vérifiée à chacun
de ces changements (grep négatif).
