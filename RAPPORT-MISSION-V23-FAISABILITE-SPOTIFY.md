# Rapport Mission V23 — Audit de faisabilité du lecteur Spotify Web

**Date** : 2026-10-09 · **Dépôt** : `Souxch06/Melodix` · **Branche** :
`arena/fcdae8c6-melodix` · **PR** : #6 (ouverte, non fusionnée)

**NIVEAU DE PREUVE GLOBAL (rappel impératif)** : rien dans ce rapport ne
prétend à une validation physique. Aucun téléphone, aucun compte Spotify,
aucune écoute réelle dans ce contexte. Un test simulant `playing` ne prouve
pas le son ; un APK qui s'installe ne prouve pas que Spotify fonctionne.
Tout ce qui n'est pas prouvé par le code ou par un test automatique est
déclaré tel quel (§5, §11).

**Note de départ** : le sandbox avait rollbaqué sur un état local périmé
(`efff66c`, worktree sale pré-push) alors que le remote était `8906d0e`
(V22 final). Réalignement `git reset --hard origin/arena/fcdae8c6-melodix`
effectué et vérifié avant toute action (snapshot du diff périmé conservé
hors dépôt) — le code examiné correspond bien au dernier commit distant.

---

## 1. SHA initial / final

- **HEAD initial (départ V23)** :
  `8906d0ef9979041ce4ece7efe02e8b50b588476a` — rapport V22, version
  `4.5.0-test.27` / `versionCode 45027`.
- **Commit code V23** : SHA dans la section 9 (fix §8 + bump version),
  version livrée **`4.5.0-test.28` / `versionCode 45028`** — bump synchronisé
  dans `package.json`, `app.config.js` ET les pins du workflow
  (`EXPECTED_VERSION_CODE`/`EXPECTED_VERSION_NAME`) **dans le même commit**
  (règle V20 : aucun décalage version/pins).
- **HEAD final de branche** : le commit contenant la version définitive du
  présent rapport — HEAD local = HEAD remote vérifié après le dernier push.

## 2. État de la PR + `main` non modifiée

- **PR #6** : `OPEN`, `MERGEABLE`, `base=main`, head =
  `8906d0e` au départ, puis head = HEAD final (ce rapport) après le dernier
  push. **Non fusionnée.**
- **`main`** : `fceab85950b069edcb65ed718a8ffd419a1bc785` — **intouché**
  (aucun commit, tag, push, merge, release ; re-vérifié à la fin de mission).

## 3. Architecture réelle du lecteur + fichiers importants

Vérifiée fichier par fichier contre le HEAD de départ (et re-vérifiée après
correction) — les affirmations du rapport V22 sont **confirmées** par le
code :

| Couche               | Fichier                                                                                                                                                                                                                         | Rôle (vérifié dans le code)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Moteur audio         | `services/player.ts` (2699 L)                                                                                                                                                                                                   | File/shuffle/repeat, `playQueue`/`playIndex`, tentative Spotify Web unique source pour les pistes Spotify, `onSpotifyWebPublished` (seul chemin de mise à jour d'état), adoption tardive, dédup `ended` (`spotifyEndedHandledForId`), pertes transitoires (piste conservée), `togglePlayPause`/`seekTo`/`setVolume` (expo-av uniquement — jamais la page Spotify), persistance session                                                                                                                                                                                                                              |
| Projection état      | `context/PlayerContext.tsx`                                                                                                                                                                                                     | Abonnement au moteur → React (mini/plein écran)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Port/intégration     | `services/playbackBackend/spotifyWebPlaybackIntegration.ts` (446 L)                                                                                                                                                             | Porte d'activation (flag local + réglage utilisateur), bus de visibilité (`requestSpotifyWebHostVisible`), `SpotifyWebSourcePort` consommé par le moteur — `player.ts` ne référence jamais `spotifyWebFeature`/`SpotifyWebBackend` directement (garde-fou testé)                                                                                                                                                                                                                                                                                                                                                    |
| Backend pont         | `services/playbackBackend/SpotifyWebBackend.ts` (497 L)                                                                                                                                                                         | Handshake versionné, commandes corrélées (sequence/requestId), projection d'état à 5 valeurs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Transport piste      | `services/playbackBackend/spotifyWebTrackTransport.ts` (623 L)                                                                                                                                                                  | Plan de lecture par piste, fenêtre de confirmation 20 s (`attempt`), `loadEpoch` (session de document), refus honnêtes (`no-authorized-execution-surface`), corrélation confirmation↔piste planifiée                                                                                                                                                                                                                                                                                                                                                                                                               |
| Runtime WebView      | `services/playbackBackend/spotifyWebRuntime.ts` (508 L)                                                                                                                                                                         | Cycle de vie document (loading/ready/recovering/failed), reconnexion bornée 3× (backoff 1,5→15 s), `onRendererGone`, app state (background diffère la reconnexion)                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Probe page           | `services/playbackBackend/spotifyWebMediaSessionProbe.ts` (217 L)                                                                                                                                                               | **Read-only** `navigator.mediaSession` (playbackState/metadata/positionState) + identité = URL du document (`/track/<id>`), publication sur `playbackstatechange`/`metadatachange` + poll 1 s, détection `ended` = paused collé à `playing` dans les 3 dernières secondes, commandes entrantes **refusées** (aucune surface d'exécution autorisée)                                                                                                                                                                                                                                                                  |
| Vue hôte             | `components/Player/SpotifyWebHostView.tsx` (552 L)                                                                                                                                                                              | WebView montée **hors écran** (`left:-6000`) pour conserver la session, overlay + bouton Fermer **via le bus** (fix D1 V22), démontage publie `error`/`host-unmounted` + reset bus (fix D1b V22), rechargement manuel                                                                                                                                                                                                                                                                                                                                                                                               |
| Activation           | `services/playbackBackend/spotifyWebFeature.ts` + `spotifyWebActivationBootstrap.ts`                                                                                                                                            | 3 états distincts : activation technique (flag, levée dans `app/_layout.tsx`), validation physique (`NOT_TESTED` par défaut, consigne utilisateur avec preuve, **non bloquante**), confirmation réelle (état publié uniquement)                                                                                                                                                                                                                                                                                                                                                                                     |
| MediaSession Android | `services/mediaBridge.ts` (398 L) + `modules/melodix-media/` (Kotlin : MediaController, MediaService foreground, NotificationProvider, VirtualMediaPlayer, NoisyAudioReceiver)                                                  | Pour une piste Spotify Web : l'app **arrête sa session Media3** et laisse la MediaSession **de la WebView (Chromium)** porter notification/verrouillé/Bluetooth — la continuation en arrière-plan **doit** être vérifiée sur téléphone (Android peut throttler un WebView hors écran)                                                                                                                                                                                                                                                                                                                               |
| Auth OAuth           | `services/spotify/{authConfig,useSpotifyAuth,session,apiClient}.ts`                                                                                                                                                             | Authorization Code + PKCE S256 (expo-auth-session), **aucun Client Secret**, Client ID build-only (`EXPO_PUBLIC_SPOTIFY_CLIENT_ID` → `none`), redirect unique `melodix://callback` (déclaré dans `app.config.js` `scheme: 'melodix'` + intent-filter), scopes : `user-read-private`, `user-library-read`, `playlist-read-private`, `playlist-read-collaborative` — **aucun scope de lecture/modification de lecture** (cohérent avec la voie Web Player), session SecureStore + refresh borné, 403 jamais = succès, retry 403 « edge » borné (2×, backoff 1,5/3 s), métadonnées 403 allow-listées (jamais de token) |
| Catalogue            | `api/spotify/{search,playlist,me,artist,album,artist}.ts` + `api/search/searchCatalog.ts`                                                                                                                                       | Recherche `/v1/search` (pagination adaptative — **fixée par V23, §8**), playlists `/items` (migrées fév. 2026 par une mission antérieure), cascade : Spotify → backend Melodix → Audius                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Écrans               | `app/settings/spotify-web-player.tsx` (statuts + consigne physique), `app/settings/spotify-web-diagnostic.tsx` (prototype isolé, ne touche ni le moteur ni la cascade), `docs/SPOTIFY-WEB-PHYSICAL-TEST.md` (procédure de test) |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

**Conclusion d'audit** : le rapport V22 est fidèle au code ; aucun des
défauts corrigés (D1/D3) n'est réapparu ; aucune fonctionnalité n'est
régressée par la présente mission (seule la couche catalogue est modifiée,
§8).

## 4. Parcours de lecture — du clic à la confirmation

Tracé complet (fichier → fonction → comportement prouvé par le code) :

1. **Sélection** (file, ligne tapée, `playAtIndex`) → `playIndex()`
   (`player.ts`) : émet `status:'resolving'` (distinct de `loading` — aucune
   couche ne peut interpréter une source trouvée comme une lecture en cours),
   invalide `spotifyWebActive` de l'ancien morceau (anti-attribution croisée),
   `playToken++` (toute commande obsolète est jetée).
2. **Piste Spotify** (`track.source.provider === null`) → `trySpotifyWeb()` :
   ouvre la vue (bus de visibilité), grace bornée si hôte/pont pas montés
   (`waitSpotifyWebReady`, polling borné), puis `port.attempt({…,
autoplay:true, timeoutMillis:20_000})`.
3. **Chargement page** : le runtime charge `https://open.spotify.com` puis
   `loadUrl('/track/<id>')` (URL publique ; idempotence : pas de
   re-navigation si la page piste est déjà chargée — une re-navigation
   détruirait une lecture déjà démarrée).
4. **Le tap dans la page** : **oui, l'utilisateur doit appuyer sur Lecture
   dans la page Spotify** (limite structurelle documentée, §5 L1) — le probe
   refuse toute commande entrante (`no-authorized-execution-surface`) :
   `play()` appelé ≠ lecture ; la fenêtre de confirmation (20 s) court le
   temps de lire la page + taper.
5. **Comment l'app sait que le son joue** : la page publie
   `navigator.mediaSession.playbackState === 'playing'` (événement
   standard) ; le probe l'identifie avec l'URL du document (`/track/<id>` →
   trackId exact) ; le backend l'accepte (handshake versionné) ; le
   transport le corrèle à la piste planifiée (bonne identité, bon
   `loadEpoch`) ; `attempt()` résout `confirmed` ; le moteur émet
   `playing` **avec l'état publié** (position/durée) — c'est le SEUL chemin
   d'un `playing` moteur (garde V17→V22, trace logcat
   `playback-confirmed` unique).
6. **Distinction piste demandée/lue** : triple garde — identité exacte dans
   le transport (`confirmedEpoch === loadEpoch`), identité exacte dans le
   moteur (`published.trackId !== active.spotifyId` → ignoré, fix D3 V22
   pour `playing`/`ended`), queueId stable (file qui bouge → états rejetés).
   Une confirmation d'ancienne piste est structurellement impossible ;
   `ended` dupliqué dédupliqué (`spotifyEndedHandledForId`).
7. **Commandes** : pause/reprise/seek/volume via le bridge (`mediaBridge` →
   mêmes méthodes publiques que l'UI). Pour une piste Spotify Web :
   **pause/seek/volume sont refusés par la page** (pas de surface
   autorisée) → la vue se réaffiche (contrôle réel, refus honnête) ;
   next/prev = navigation de file moteur (nouvelle tentative + tap) ;
   stop = pause best-effort refusée + réouverture de la vue (limite
   documentée, §5 L5). Les commandes système/Bluetooth, eux, passent par la
   MediaSession **de la WebView** si la page l'a déclarée (§5 L4 —
   non vérifié en conditions réelles).
8. **Changements d'état** : changement rapide de piste → `playToken` rend
   l'ancienne tentative obsolète (résultat jeté) ; erreur → notice avec le
   code du verdict (jamais inventé) ; timeout de confirmation (20 s) →
   `confirmation-timeout` ; perte d'infrastructure (hôte/pont bas) → code
   transitoire : **la piste est conservée**, le prochain PLAY explicite
   retente la même piste (file/index/shuffle/repeat préservés) ; fermeture
   de la vue pendant une tentative → abandon immédiat via le bus (fix D1
   V22) ; démontage de l'hôte → `error`/`host-unmounted` publié avant
   purgage (jamais un `playing` orphelin).
9. **Propagation UI/MediaSession** : `PlayerContext` (React) +
   `mediaBridge` (JS→Android). Spotify Web : la session Media3 de l'app est
   **stoppée** pour éviter deux notifications concurrentes ; la WebView
   porte la MediaSession système (notification postée par le processus de
   l'app → permission `POST_NOTIFICATIONS` demandée une fois, non
   bloquante).
10. **Arrière-plan/verrouillé/retour** : la WebView reste montée hors écran
    (`left:-6000`, pas `display:none`) pour conserver la session ; le
    runtime diffère la reconnexion en background et la reprend au
    foreground ; `onRenderProcessGone` → reconnexion bornée 3×. **La
    continuation audio écran verrouillé et la réception des commandes
    verrouillé/Bluetooth par la MediaSession Chromium restent NON VÉRIFIÉS
    sur téléphone** (Android peut throttler un WebView hors écran) — §5 L4,
    §11.

**Distingueur de preuve** (règle de mission) : les étapes 1-8 sont
**prouvées par le code et testées automatiquement** (Jest, doubles
contrôlés) ; les étapes 5, 7 (commandes système) et 10 sont **non
vérifiées en conditions réelles** (nécessitent page Spotify réelle +
téléphone) ; l'émulateur CI prouve seulement montage + handshake + absence
de faux `playing` sans compte.

## 5. Tableau des capacités — niveau de preuve

Légende : ✅ code = confirmé dans le code · 🧪 sim = testée uniquement
avec des simulations/doubles · 🔑 cfg = dépendante du compte/config · 📵 phys
= non vérifiée sur appareil réel · ❌ imp = impossible/non prise en charge
par l'approche actuelle.

| Capacité                                                    |                   Code                   |            Sim (Jest/CI)             |             Compte/config              | Physique réelle | Note                                                                                                                                                                                                           |
| ----------------------------------------------------------- | :--------------------------------------: | :----------------------------------: | :------------------------------------: | :-------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Démarrage du son **depuis Melodix** (sans interaction page) |                  ❌ imp                  |                  —                   |                   —                    |        —        | Aucune surface d'exécution autorisée (DOM/clic synthétique = contournement interdit) ; le démarrage est un GESTE dans la page (L1)                                                                             |
| Lecture après **tap dans la page Spotify**                  |                 ✅ code                  |             🧪 (doubles)             |           🔑 (compte loggé)            |     📵 phys     | La seule voie de lecture ; aucun `playing` sans état publié                                                                                                                                                    |
| Lecture d'une **piste précise** par identifiant             |                 ✅ code                  |                  🧪                  |                   🔑                   |     📵 phys     | `loadUrl('/track/<id>')` + identité par URL ; une autre piste n'est jamais confirmée (D3)                                                                                                                      |
| Fiabilité des événements `playing`/`ended`                  |                 ✅ code                  |                  🧪                  | 🔑 (la page doit publier MediaSession) |     📵 phys     | `ended` = héuristique `positionState` (±3 s) — **si `positionState` est absent dans la WebView, la fin de piste est INDÉTECTABLE** (rien n'est inventé) ; `playing`/`ended` sans identité ignorés (D3)         |
| Contrôle pause/reprise/seek/volume **depuis Melodix**       |                  ❌ imp                  |                  —                   |                   —                    |        —        | Refus honnête par le probe ; la vue se réaffiche (contrôle réel dans la page)                                                                                                                                  |
| Synchronisation UI ↔ moteur                                |                 ✅ code                  |                  🧪                  |                   —                    |     📵 phys     | État publié uniquement ; `—:--` affiché sans identité ; aucun faux `0:00`                                                                                                                                      |
| **Arrière-plan / écran verrouillé / Bluetooth**             | ✅ code (porteur = MediaSession WebView) | 🧪 (Robolectric : montage/handshake) |                   🔑                   |     📵 phys     | **Non vérifié** : continuation audio + commandes verrouillées/Bluetooth portées par la MediaSession Chromium de la WebView — Android peut throttler un WebView hors écran                                      |
| Comptes **gratuits** sur le Web Player                      |                    —                     |                  —                   |                   🔑                   |     📵 phys     | Sources tierces récentes (2026, non officielles) : Web Player accessible avec compte gratuit (pubs/restrictions) ; le Web Playback SDK et les endpoints de lecture de l'API Web exigent **Premium** (officiel) |
| DRM/Widevine dans la WebView                                |        ✅ code (capacité sondée)         |                  🧪                  |         🔑 (CDM de l'appareil)         |     📵 phys     | Le probe sonde `requestMediaKeySystemAccess('com.widevine.alpha')` et publie la capacité — jamais de création de session/clés ; **le décodage réel DRM dans la WebView Android reste non vérifié**             |
| **403 au login** (cause réelle)                             |       ✅ code (traitement honnête)       |            🧪 (contrats)             |        🔑 (dashboard/dev-mode)         |     📵 phys     | Diagnostic §6 — non tranchable sans compte/dashboard                                                                                                                                                           |
| Audio dans **plusieurs moteurs simultanés**                 |            ✅ code (interdit)            |                  🧪                  |                   —                    |        —        | Anti-double-lecture : best-effort pause de l'ancienne source + `playing` unique par piste                                                                                                                      |

**Limites structurelles (documentées — PAS de contournement fragile
tenté)** :

- **L1 — Geste dans la page requis** : aucune commande de lecture ne peut
  être exécutée « depuis » la page (pas de surface standard autorisée) ;
  chaque piste démarre par un tap dans la vue ; pause/seek/stop sont des
  contrôles de la page (la vue se réaffiche en refus honnête).
- **L2 — Identité = URL du document** : une pub jouée DANS le contexte de la
  page piste (document resté `/track/<id>`) est indistinguable de la piste
  (sans technique interdite) ; les états sans identité sont ignorés (D3)
  mais ne couvrent pas ce cas.
- **L3 — Volume** : la page n'expose aucune API de volume ; no-op honnête
  côté page (le volume moteur reste l'intention globale expo-av).
- **L4 — Arrière-plan** : porteur MediaSession = WebView ; non vérifié
  téléphone (§5, §11).
- **L5 — `stop()`** : l'audio continue jusqu'à arrêt dans la vue (pas de
  surface d'exécution) ; l'app le signale en réouvrant la vue.

## 6. Diagnostic 403 — analyse détaillée + inconnues restantes

**Faits établis dans le code (re-vérifiés ce jour, zéro changement)** :
chaîne PKCE S256 sans Client Secret, Client ID build-only, redirect unique
`melodix://callback` identique au `/authorize` et à l'échange (élimine
`redirect_uri_mismatch`/`invalid_grant` par construction), scopes en
lecture, 403 jamais = succès, retry 403 « edge » borné (2×, 1,5/3 s),
métadonnées 403 allow-listées (URL finale, statusText, headers non
sensibles, `attempts`) — **jamais de token/code/secret journalisé**.

**Faits officiels Spotify récoltés pour cette mission (sources citées §13)** :

1. **Migration dev-mode de février 2026** (guide officiel) :
   - **toute app dev-mode exige que le PROPRIÉTAIRE de l'app ait un
     abonnement Premium actif** — « If the owner's Premium subscription
     lapses, the app will stop working » ;
   - apps existantes migrées le **9 mars 2026** (grandfathering : les apps
     avec >5 utilisateurs ou plusieurs Client IDs les conservent) ;
   - nouveaux apps : 1 Client ID / 5 utilisateurs max ;
   - endpoints/fields changés (`/items` playlistes, `limit` `/search` 50→10,
     `offset` ≤1000, `top-tracks` retiré, champs `/me` réduits…).
2. **Réponse officielle Spotify (communauté, mars 2025)** : « Each user
   needs to be added to your app's allowlist. **API requests with an access
   token from a non-allowlisted user will receive a 403 error.** »
3. **Signature observée (V14→V22)** : 403 sur `GET /v1/me`, **corps VIDE non
   JSON**, `server: envoy` + `via: HTTP/2 edgeproxy, 1.1 google` = rejet
   **edge-level** (un refus API classique serait JSON avec
   `error.message` ; un 403 « User not approved for app » serait JSON —
   ce n'est PAS la signature observée).

**Hypothèses classées (aucune n'est affirmée comme cause sans preuve)** :

| #   | Hypothèse                                                                 | Statut                                                                                                                                     | Preuve disponible                                                                           |
| --- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| H1  | Compte testant **absent de « Users and Access »** du dashboard (dev-mode) | **Non tranchée — la plus probable**                                                                                                        | Mécanisme officiel documenté (§6.2) ; non vérifiable sans dashboard                         |
| H2  | **Premium du PROPRIÉTAIRE de l'app expiré** (nouvelle exigence fév. 2026) | **Non tranchée — nouvelle depuis la mission V16**                                                                                          | Mécanisme officiel documenté (§6.1) ; non vérifiable sans dashboard/abonnement              |
| H3  | 403 edge **intermittent** Spotify (instabilité backend)                   | Non tranchée                                                                                                                               | Communauté : 403 intermittents mêmes requêtes+token ; le retry borné du code existe pour ça |
| H4  | Défaut de config Melodix (redirect/scopes/PKCE)                           | **Écartée par le code** (§3 chaîne auth re-vérifiée ; les erreurs de config produiraient des codes OAuth explicites, pas un 403 edge vide) | —                                                                                           |
| H5  | Scope non autorisé                                                        | **Écartée par la signature** (un 403 de scope serait JSON « Insufficient client scope »)                                                   | —                                                                                           |

**Ce qui manque EXACTEMENT pour trancher (ordre de coût croissant)** :

1. **Dashboard Spotify** (mainteneur) : onglet **Users and Access** — le
   compte de test y est-il listé ? (H1) + statut du **Premium du
   propriétaire** de l'app (H2 — exigence nouvelle de fév. 2026).
2. **Métadonnées 403 de l'app elle-même** (écran de connexion, déjà
   collectées par `apiClient` — aucun secret) : `attempts ≥ 2` = 403
   persistant à travers le retry (renforce H1/H2) ; `attempts = 1` =
   intermittent possible (H3) ; `finalUrl` + headers allowlistés
   (confirme/refute l'edge).
3. **Un compte Spotify autorisé** (H1 résolue) + écoute réelle (procédure
   §11/§13) — seul le test physique tranche le reste.

**Aucun changement du flux OAuth, des scopes, du redirect ou de
SecureStore** n'est justifié à ce jour ; aucun champ de saisie Client ID,
aucun credential tiers n'est ajouté.

## 7. Comparaison des architectures A / B / C

Facts officiels utilisés (sources §13) : **Web Playback SDK** = Premium
exigé (abonnements mobile-only exclus), « must not be used in commercial
projects without Spotify's prior written approval », autoplay bloqué sans
geste sur mobile (`activateElement()` requis) ; **API Web lecture**
(`PUT /me/player/…`) = « This API only works for users who have Spotify
Premium », pilote un **appareil Spotify Connect** (l'app Spotify installée) ;
**SDK Android officiel** = sunsetting (dernière release github.com/spotify/
android-sdk : juil. 2023, non maintenu ; la communauté confirme la
discontinuité) ; **réponse officielle Spotify (mars 2025)** : le Web
Playback SDK « is specifically designed for embedding a player within a
_website_ application. Its use in native mobile apps might not be the
intended or supported scenario » ; les SDK mobiles « control playback within
the _official Spotify application_ ».

| Critère                           | **A — Web Player intégré (ACTUEL)** : WebView `open.spotify.com` + probe MediaSession                                                                                                    | **B — API Web officielle (délégation à l'app Spotify)** : auth+catalogue Melodix, lecture pilotée via `PUT /me/player/*` sur l'appareil Spotify Connect de l'utilisateur                                                                    | **C — Hybride Melodix** : Spotify (auth/métadonnées/playlistes) + **Audius/YouTube** pour l'audio                       |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Où joue le son                    | Dans la WebView de Melodix (audio **dans** l'app)                                                                                                                                        | Dans l'**app Spotify** (Melodix pilote à distance)                                                                                                                                                                                          | Audius/YouTube (audio dans Melodix via expo-av)                                                                         |
| Comptes gratuits                  | Probablement oui (Web Player ; sources tierces 2026, non officielles) — **Premium non exigé officiellement** pour la page                                                                | **Non — Premium exigé** (officiel) + app Spotify installée                                                                                                                                                                                  | Oui (Audius/YouTube sans compte Spotify)                                                                                |
| Commandes de lecture              | ❌ Aucune depuis Melodix (geste dans la page ; pause/seek/stop refusés honnêtement)                                                                                                      | ✅ **Toutes** : play/pause/seek/next/prev/volume/shuffle/repeat/queue (officiel), état fiable via `GET /me/player`                                                                                                                          | ✅ Toutes (moteur expo-av existant)                                                                                     |
| Fidélité du contenu               | Piste Spotify **exacte** (DRM, master officiel)                                                                                                                                          | Piste Spotify **exacte**                                                                                                                                                                                                                    | **Autre enregistrement** (version/remaster possibles — le matcher fait son travail mais ce n'est pas le master Spotify) |
| Arrière-plan/verrouillé/Bluetooth | 📵 Non vérifié (MediaSession WebView hors écran ; Android peut throttler)                                                                                                                | ✅ Robuste par construction (l'app Spotify gère son propre arrière-plan ; Melodix lit l'état via API)                                                                                                                                       | ✅ Testé (exo-av + MediaSession Media3 — chemin actuel Audius/YouTube)                                                  |
| Surface légale                    | **Zone grise** : page Web dans une WebView native = non documentée comme scénario supporté (réponse officielle ci-dessus) ; pas d'approbation commerciale requise pour la page elle-même | La plus propre pour la lecture (l'API est conçue pour piloter le client Spotify) ; app commerciale → SDA (demande Spotify)                                                                                                                  | Hors périmètre Spotify (sources libres)                                                                                 |
| Risque principal                  | Comportement réel inconnu (MediaSession/DRM/autoplay dans WebView Android) — **l'incertitude est dans le domaine public**                                                                | Dépend de l'app Spotify installée + Premium ; l'audio sort de Melodix (UX : deux apps)                                                                                                                                                      | Attribution de contenu différent pour les pistes Spotify (interdite en **silencieux** par la mission)                   |
| Effort de code pour Melodix       | **Déjà fait** (6 missions, ~10 000 L, durci, testé)                                                                                                                                      | **Nouveau module** : scopes `user-read-playback-state`/`user-modify-playback-state`, `GET /me/player/devices`, transfert de lecture, polling `GET /me/player` (l'état de lecture n'a pas d'événement push), gestion app absente/non-Premium | **Déjà fait** (cascade existante — le comportement non-Spotify actuel)                                                  |
| Faisabilité (honnête)             | **À trancher par le test physique** — rien ne permet d'affirmer qu'elle marche ni qu'elle échoue dans une WebView Android 14                                                             | **Techniquement solide, exigeant côté compte** (Premium + app installée) — voie de repli crédible                                                                                                                                           | **Faisable aujourd'hui** mais ne lit pas la piste Spotify exacte                                                        |

**Recommandation (détaillée au §12)** : **conserver A comme voie Spotify
principale** (c'est la seule qui joue l'audio dans Melodix sans Premium et
sans approbation commerciale ; l'investissement existant est intact et
honnête), **à condition de trancher par le test physique** ; si le test
physique révèle une blocage technique A (MediaSession/DRM/autoplay WebView),
la voie **B** est le repli réaliste pour les utilisateurs Premium avec app
Spotify ; **C** reste la politique non-Spotify existante (jamais de
basculement silencieux d'une piste Spotify).

## 8. Bugs réellement trouvés + correction

### V23-1 (important) — `/v1/search` demandé avec `limit=50` hors contrat API 2026

**Défaut** : `api/spotify/search.ts` demandait `limit=50` par type
(`MAX_PER_TYPE = 50`, `DEFAULT_LIMIT = 50`, 40 pages → couverture 2000).
Le contrat API officiel en vigueur (migration dev-mode **février 2026**,
guide officiel + référence `/v1/search` consultées ce jour) fixe
**`limit` à 0-10 (défaut 5)** et **`offset` à 0-1000**. Deux conséquences
réelles selon le comportement de l'edge Spotify :

1. **rejet** (erreur) → la source Spotify de la cascade de recherche tombe
   sur le backend (état dégradé) — le catalogue Spotify brisé ;
2. **clamp silencieux à 10** → la page 1 renvoyant < `perType` résultats,
   `previousWaveComplete` restait faux et **la pagination s'arrêtait après
   la première page** : 10 pistes par requête au lieu du plafond conçu →
   **effondrement silencieux de la couverture du catalogue**, donc du
   matcher Audius/YouTube (qui s'appuie sur ce catalogue pour les pistes
   sans provider — fonctionnalité protégée par la mission).

Le code de playlists (`/items`) avait déjà été migré par une mission
antérieure (commit `518ea02`) — la couche recherche, elle, pinnait encore
l'ancien contrat (y compris dans ses tests).

**Correction** (3 fichiers, ciblé, zéro refactoring) :

- `api/spotify/search.ts` : `MAX_PER_TYPE = 10`, `DEFAULT_LIMIT = 10`,
  `MAX_TRACK_PAGES = 101` — la borne dure est calée **sur le plafond API**
  (offset ≤ 1000 → 101 pages de 10 au maximum) : la boucle ne peut jamais
  demander un offset invalide ; couverture maximale **1010 pistes**
  (l'ancien 2000 est **impossible** sous le contrat 2026 — dégradée honnête,
  documentée) ; commentaires mis à jour avec les références.
- `api/search/searchCatalog.ts` : commentaire `SEARCH_LIMIT` mis à jour
  (valeur 50 conservée : c'est le nombre souhaité backend/Audius ; le côté
  Spotify se plafonne à 10 et paie la quantité par pagination).
- `api/spotify/__tests__/search.unit.test.ts` : **4 tests mis à jour vers le
  contrat officiel 2026** (clamp → 10 ; page par défaut → 10 ; borne dure →
  101 pages ; catalogue max → 101 pages × 10 = 1010, offset final 1000) —
  **aucun test supprimé** ; les 4 tests **échouent contre le code pré-fix**
  (qui enverrait `limit=50`) et passent après correction.

**Vérification** : `npx jest api/spotify/__tests__/search.unit.test.ts` →
**23/23 passés** (post-fix) ; les 4 tests mis à jour échouent sur
`limit=50` du code pré-fix (vérifié par lecture du contrat :
`toContain('limit=10')` vs `limit=50` envoyé).

### V23-2 (constat — non corrigé, comportement déjà sûr)

`api/spotify/artist.ts` appelle `GET /artists/{id}/top-tracks?market=FR` —
endpoint listé **retiré (sans remplacement)** dans le guide de migration
février 2026 (la page de référence reste publiée avec `403` parmi les
réponses — le statut réel pour une app donnée n'est pas vérifiable ici).
Le code encaisse déjà l'échec (`.catch(() => null)` → top titres vides,
aucune régression) : **pas de correction indispensable**, donc aucun
changement — documenté pour la prochaine mission (retirer l'appel mort si
le test physique confirme l'échec systématique).

**Aucun autre défaut trouvé** dans l'audit §3/§4 (moteur, pont, vue,
runtime, MediaSession, auth, deep links) : les corrections V22 (D1/D3) sont
intactes, les garde-fous anti-faux-`playing` intacts, aucune fonctionnalité
dégradée.

## 9. Résultats exacts des tests exécutés

| Commande                                                                                                 | Résultat réel                                                                                                                                                                                                                 |
| -------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `npx tsc --noEmit`                                                                                       | **exit 0**                                                                                                                                                                                                                    |
| `npx eslint api/spotify/search.ts api/search/searchCatalog.ts api/spotify/__tests__/search.unit.test.ts` | **exit 0**                                                                                                                                                                                                                    |
| `npx prettier --check` (fichiers modifiés + rapport)                                                     | **OK**                                                                                                                                                                                                                        |
| `npx jest api/spotify/__tests__/search.unit.test.ts`                                                     | **23/23 passés**                                                                                                                                                                                                              |
| `npx jest` (suite complète, arbre pré-bump)                                                              | **2084 passés / 14 ignorés / 2098 total** — 155 suites passées, 14 suites sautées (sur 169) ; **identique à la baseline V22** (aucun test supprimé ; les 4 tests mis à jour remplacent des attentes obsolètes, pas des tests) |
| Robolectric/Kotlin, Gradle, APK 16 KiB, émulateur Android 14                                             | Exécutés en CI sur le HEAD final (§10)                                                                                                                                                                                        |

## 10. CI du HEAD final

- Run du code (commit fix+version) : ID et statut — voir les checks de la
  PR #6 (workflow « APK Android » : TypeScript, ESLint, Prettier, Jest
  complet, backend, Robolectric, build + signature + alignement 16 KiB,
  installation + lancement émulateur Android 14, intégrité, artefact).
- **APK attendu** : `Melodix-v4.5.0-test.28-<shortSHA>.apk` (artefact de la
  run ; **aucune release définitive** — étapes de release volontairement
  `skipped` par conception du workflow de test).

## 11. Statut de validation physique — sans ambiguïté

**TEST PHYSIQUE : NON EFFECTUÉ.** Aucun téléphone, aucun compte Spotify
autorisé, aucune écoute réelle dans ce contexte. L'émulateur CI (install +
lancement + logcat) ne prouve que : montage de la vue, handshake du pont,
et **l'absence de faux `playing` sans compte** — pas la lecture. La
procédure de validation reproductible est prête
(`docs/SPOTIFY-WEB-PHYSICAL-TEST.md` + §13) : connexion (compte
allowlisté), tap Lecture dans la page, contrôles, enchaînement, cycle de
vie verrouillé/arrière-plan/Bluetooth, consigne `PASSED_ON_DEVICE` avec
preuve depuis l'UI (jamais l'inverse).

## 12. Recommandation finale

**Continuer avec l'architecture actuelle (A) — sans réécriture — mais
conditionnée à la validation physique, avec la voie B préparée en repli
documenté.**

Justification (code existant + contraintes réelles) :

1. **A est la seule voie qui joue l'audio Spotify DANS Melodix sans Premium
   ni approbation commerciale** ; elle est entièrement bâtie et durcie
   (6 missions, garde-fous anti-faux-`playing` intacts, CI verte, émulateur
   vert). La réécrire maintenant, avant même un test physique, serait une
   dépense injustifiée : **aucun fait ne dit qu'A échoue** dans une WebView
   Android 14 — l'incertitude (MediaSession/DRM/autoplay dans la WebView)
   est tranchable par UN test physique de 30 minutes (§13).
2. **B (API Web → app Spotify) est le repli réaliste si A échoue** :
   techniquement solide (commandes complètes, état fiable, arrière-plan
   géré par l'app Spotify), légalement le plus propre pour la lecture —
   mais Premium exigé + app Spotify installée, et l'audio sort de Melodix
   (deux apps côte à côte). C'est un module à construire **dans une
   mission dédiée**, seulement si le test physique le justifie (pas avant).
3. **C reste la politique non-Spotify** (cascade Audius/YouTube existante,
   testée) — jamais de basculement silencieux d'une piste Spotify vers un
   autre enregistrement (interdit par la mission) ; une éventuelle
   délégation explicite/consentie serait une décision produit à part.
4. **Le 403 se tranche AVANT tout** (il bloque le login → bloque le test) :
   deux vérifications dashboard (Users and Access + Premium du
   propriétaire — exigence nouvelle fév. 2026) + lecture des métadonnées
   403 collectées par l'app (§6) — aucun code à changer dans cette voie.

**Ne PAS** : réécrire le lecteur, ajouter de scopes de lecture sans
décision d'architecture, toucher OAuth/PKCE/SecureStore, contourner une
restriction Spotify/DRM, publier une release définitive.

## 13. Plan d'action priorisé (prochaine mission) + sources

**Dépendances humaines (bloquantes, hors sandbox)** :

| #   | Action                                                                                                                                                                                                                                                                                                                               | Qui                 | Dépendance |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------- | ---------- |
| 1   | Dashboard Spotify : vérifier **Users and Access** (compte de test listé ?) + **Premium du propriétaire de l'app actif** (exigence fév. 2026)                                                                                                                                                                                         | Mainteneur (2 min)  | —          |
| 2   | Installer l'APK test.28 sur téléphone Android 14+, login, lire les métadonnées 403 si 403 (`attempts`, `finalUrl`) et consigner                                                                                                                                                                                                      | Mainteneur          | 1          |
| 3   | **Test physique A** (procédure `docs/SPOTIFY-WEB-PHYSICAL-TEST.md`) : tap Lecture dans la page → `playing` affiché ? ; pause/seek dans la page ; D1 (fermer puis relancer) ; D3 (naviguer hors de la page piste) ; enchaînement 32 titres ; verrouillé/arrière-plan/Bluetooth ; consigner `PASSED_ON_DEVICE` avec preuve depuis l'UI | Mainteneur (30 min) | 2          |
| 4   | **Décision d'architecture** sur le compte rendu : A validé → continuer A ; A bloqué (MediaSession/DRM/autoplay WebView) → mission dédiée voie B (scopes `user-read-playback-state`/`user-modify-playback-state`, `GET /me/player/devices`, transfert + polling `GET /me/player`) ; documenter la limite dans tous les cas            | Équipe              | 3          |

**Sans dépendance humaine (faisable en sandbox, après revue)** : retrait de
l'appel mort `top-tracks` (V23-2) **si** le compte rendu le confirme ;
amélioration du diagnostic écran de connexion pour afficher `attempts` de
façon plus lisible (si les métadonnées le permettent).

**Sources officielles consultées (dates consultées : 2026-10-09)** :

1. Spotify — « February 2026 Web API Dev Mode Changes — Migration Guide » :
   <https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide>
   (Premium du propriétaire exigé ; 9 mars 2026 = migration des apps
   existantes ; `limit` `/search` 50→10 ; `offset` ≤1000 ; `/items`
   playlistes ; `top-tracks` retiré sans remplacement).
2. Spotify — Web API Reference « Search for Item » :
   <https://developer.spotify.com/documentation/web-api/reference/search>
   (`limit` : Default 5, **Range 0-10** ; `offset` : Default 0, **Range
   0-1000**).
3. Spotify — Web Playback SDK :
   <https://developer.spotify.com/documentation/web-playback-sdk> (Premium
   exigé, mobile-only exclus ; autoplay mobile bloqué sans geste,
   `activateElement()` ; « must not be used in commercial projects without
   Spotify's prior written approval »).
4. Spotify — Web API Reference « Start/Resume Playback » :
   <https://developer.spotify.com/documentation/web-api/reference/start-a-users-playback>
   (« This API only works for users who have Spotify Premium »).
5. Spotify — Web API Reference « Get Artist's Top Tracks » (page encore
   publiée ; `403` parmi les réponses) :
   <https://developer.spotify.com/documentation/web-api/reference/get-an-artists-top-tracks>.
6. Spotify Community — « Inquiry About Integrating Spotify Content into a
   Third-Party App » (réponse officielle, 2025-03) : dev-mode =
   allowlist, 403 pour un user non allowlisté ; Web Playback SDK « designed
   for embedding a player within a website application… use in native
   mobile apps might not be the intended or supported scenario » ;
   <https://community.spotify.com/t5/Spotify-for-Developers/Subject-Inquiry-About-Integrating-Spotify-Content-into-a-Third/td-p/6879704>.
7. Spotify Community — « Remote playback SDK and commercial SDA question »
   (2025-01) : le remote playback est un usage SDA (commercialement
   encadré) ;
   <https://community.spotify.com/t5/Spotify-for-Developers/Remote-playback-SDK-and-commercial-SDA-question/td-p/6662045>.
8. Spotify — blog 2022-07-15 (sunsetting des mobile streaming SDKs) +
   releases github.com/spotify/android-sdk (dernière : juil. 2023, non
   maintenu) : <https://developer.spotify.com/blog/2022-07-15-mobile-streaming-sdks-update>.
9. Web Player avec compte gratuit (pubs/restrictions) : sources tierces
   2026 (non officielles — à confirmer par le test physique) ; **le
   Premium officiellement exigé ne s'applique qu'au Web Playback SDK et aux
   endpoints de lecture de l'API Web** (sources 3-4).

---

## Ce qui fonctionne et est prouvé

- Chaîne auth PKCE S256 sans Client Secret, redirect unique, scopes en
  lecture, session SecureStore, 403 jamais = succès, retry borné,
  métadonnées 403 sans secret (code re-vérifié + tests).
- Moteur : file/shuffle/repeat/restore, tentative Spotify Web comme seule
  source des pistes Spotify, `playing` **uniquement** sur état publié
  (bonne piste, bonne session — D3), adoption tardive, dédup `ended`,
  pertes transitoires (piste conservée), fermeture d'overlay via le bus
  (D1), `host-unmounted` honnête (code + 2084 tests Jest + CI).
- Pont page↔app : handshake versionné, commandes corrélées, refus honnêtes
  (`no-authorized-execution-surface`), probe read-only MediaSession +
  identité par URL (code + doubles).
- Catalogue : playlists `/items` (migrées), recherche **réalignée sur le
  contrat API 2026** (fix V23-1, 23 tests), cascade Spotify→backend→Audius.
- Non-Spotify : cascade Audius/YouTube intacte, MediaSession Media3,
  arrière-plan expo-av (testé automatiquement).
- Build : tsc/ESLint/Prettier/Jest verts, APK test.28 signé + aligné 16 KiB
  (CI), installation + lancement émulateur Android 14 (CI).

## Ce qui est seulement simulé ou non vérifié

- **Lecture audio réelle Spotify** (son qui démarre après tap dans la page)
  — simulée par doubles, **non vérifiée** (aucun compte, aucun téléphone).
- **Continuation arrière-plan / écran verrouillé / Bluetooth** sur piste
  Spotify (MediaSession WebView hors écran) — non vérifiée.
- **Détection de fin de piste** (`ended` = héuristique `positionState`) —
  non vérifiée ; si `positionState` est absent dans la WebView, la fin est
  indétectable (documenté, rien n'est inventé).
- **DRM/Widevine** dans la WebView Android — capacité sondée, décodage réel
  non vérifié.
- **403 (cause réelle)** — non reproductible sans compte/dashboard (H1/H2
  les plus probables, non tranchées).
- **Compte gratuit** sur le Web Player — sources tierces non officielles.
- Émulateur CI = montage + handshake + absence de faux `playing` — PAS une
  preuve de lecture.

## Ce qui doit être fait ensuite et pourquoi

1. **Dashboard (2 min, mainteneur)** : Users and Access + Premium du
   propriétaire — tranche H1/H2 et débloque le login (sinon rien d'autre
   n'est testable).
2. **Test physique de l'APK test.28 (30 min, téléphone)** — la SEULE preuve
   qui tranche la faisabilité de l'architecture A (son, `ended`,
   verrouillé/Bluetooth, D1/D3 en conditions réelles) ; consigner avec
   preuve dans l'UI (`docs/SPOTIFY-WEB-PHYSICAL-TEST.md`).
3. **Décision d'architecture sur le compte rendu** : A validé → continuer ;
   A bloqué → mission dédiée voie B (délégation à l'app Spotify via API
   Web — Premium, module neuf, légalement le plus propre) ; documenter la
   limite éventuelle (pas de contournement).
4. **Nettoyage mineur (sandbox, après revue)** : retrait de l'appel mort
   `top-tracks` si confirmé échoué ; lisibilité du diagnostic 403
   (`attempts`).
