# Spotify Web — plan d'intégration à l'architecture de lecture

Statut global : **PROTOTYPE ONLY**. Ce document prépare l'intégration ; il ne
l'active pas. Spotify Web **n'est pas** un moteur de production et ce plan
n'affirme nulle part qu'il fonctionne.

Références de code vérifiées au commit `83e646e` (relues dans le dépôt réel,
pas depuis une maquette).

---

## 1. Architecture actuelle (audit réel)

```
UI (PlayerScreen, contrôles)
  └─ context/PlayerContext.tsx          façade React mince (aucun état dupliqué)
       └─ services/player.ts             MOTEUR — unique source de vérité
            ├─ queue / shuffle / repeat / position / historique
            ├─ cascade de résolution : services/audio/trackResolver.ts
            │    ORDER = ['audius', 'youtube']   (services/audio/index.ts:16)
            └─ expo-av (audio réel)
  └─ services/mediaBridge.ts            projection MINCE JS → Android
       MediaSession + notification ; verrou : aucune activation sans
       statut 'playing' émis par le moteur (mediaBridge.ts:196)
       commandes Android → mêmes méthodes publiques du moteur

 Prototype isolé (NON câblé au lecteur) :
 screens/SpotifyWebPrototypeScreen.tsx
  ├─ services/playbackBackend/SpotifyWebRuntime.ts  (cycle de vie WebView)
  ├─ services/playbackBackend/SpotifyWebBackend.ts  (implémente PlaybackBackend)
  ├─ services/playbackBackend/spotifyWebBridge.ts   (protocole v2)
  └─ services/playbackBackend/spotifyWebMediaSessionProbe.ts (lecture seule)
```

Vérifications faites :

- `PlaybackBackend` (`services/playbackBackend/types.ts`) : `id`, `getState`,
  `subscribe`, `play`, `pause`, `seek`, `next`, `previous`, `destroy`. Aucune
  méthode `toggle`/`setQueue`/`enqueue` dans l'interface (le `toggle` de
  Spotify Web est local au backend ; la queue n'appartient pas au backend).
- **Aucun consommateur de production** du module `playbackBackend` : seul le
  route prototype (`app/settings/spotify-web-player.tsx`) l'utilise ; le barrel
  `services/index.ts:149` le ré-exporte sans consommateur additionnel.
- `PlayerContext` est une façade : il délègue à `melodixPlayer` et expose
  `pendingRestore/resumeSession/dismissSession` (persistance de session via
  `services/playbackSession.ts`). Il ne possède AUCUN état de lecture propre.
- L'historique et les effets « lecture démarrée » ne partent QUE de la
  confirmation runtime `isPlaying=true` d'expo-av
  (`player.ts:236` commentaire, `markPlaybackStarted` `player.ts:415`, appelé
  `player.ts:515`, garde par token `lastPlaybackStartedForToken`).
- `mediaBridge` : sens unique état → Android ; jamais de logique queue/
  shuffle/repeat, jamais d'URL de flux projetée, jamais d'autoplay au boot
  (en-tête `services/mediaBridge.ts:1-19`).

### Ce qui empêche aujourd'hui toute activation sans risque

Le backend Spotify Web ne peut produire qu'un état `playing/paused/idle`
**reçu de la page** (MediaSession du document) et des accusés de commande
corrélés. Rien ne prouve sur cet état qu'un flux audio est audible,
interruptible par le système, ou compatible arrière-plan. Un backend dont
`play()` répond `true` n'a prouvé qu'une livraison de message.

---

## 2. Architecture cible (préparée, non câblée)

```
                            ┌──────────────────────────────┐
  PlayerContext ──► moteur actif (1 seul possesseur à la   │
                    fois, choisi par la sélection)          │
                            └──────────────────────────────┘
   sélection = resolveSpotifyWebPlaybackActivation()   [spotifyWebFeature.ts]
   ├─ flag LOCAL false (défaut) OU porte physique fermée →
   │     engines: ['audius-youtube']            ← comportement actuel, bit
   │                                               pour bit inchangé
   └─ double verrou levé →
         engines: ['spotify-web', 'audius-youtube']
         Spotify Web devant, Audius → YouTube ENTIERS en fallback
```

Règles de conception du futur câblage (aucune ne doit être violée par la
suite du chantier) :

1. **Le flag ne se branche pas maintenant** : l'activation exigerait de
   décider qui alimente `positionMillis`, la queue et l'audio en
   arrière-plan — trois hypothèses que seul le test physique peut trancher.
2. Un seul possesseur par notion (cf. §4) : le moteur sélectionné possède
   l'état temps réel ; l'autre est `idle` et ignoré. Jamais de moyenne ou de
   fusion des deux.
3. Bascule vers `audius-youtube` uniquement sur preuve d'incapacité (état
   `error` du backend, pont perdu sans récupération, refus persistant de
   commandes) — jamais sur une simple absence de réponse ponctuelle.
4. L'historique et la reprise de session restent dans `player.ts` /
   `playbackSession.ts` ; un futur backend Spotify Web ne fait QUE leur
   fournir les mêmes primitives déjà validées (événement « lecture réellement
   démarrée », position, identité de morceau `spotify:<id>` déjà utilisé comme
   clé de cache par le moteur actuel, `player.ts:45,196`).

## 3. Mécanisme de feature flag (livré, désactivé, non câblé)

`services/playbackBackend/spotifyWebFeature.ts` :

- `isSpotifyWebPlaybackEnabled()` — défaut **false** ; mémoire seule ; aucune
  persistance, aucun UI, aucun remote config.
- `recordSpotifyWebPhysicalValidation(passed, evidence)` — la preuve physique
  doit être textuelle et non vide, sinon `throw`. Pas de porte dérobée
  booléenne.
- `resolveSpotifyWebPlaybackActivation()` — double verrou ; renvoie toujours
  `['audius-youtube']` tant qu'un verrou manque ; quand les deux sautent :
  `['spotify-web', 'audius-youtube']` (fallback conservé en dernier).
- Garde-fou mécanique : le test `spotifyWebFeature.unit.test.ts` lit les
  sources de `PlayerContext`, `player.ts`, `mediaBridge.ts`,
  `playbackSession.ts` et échoue si l'une d'elles référence le module ou
  `SpotifyWebBackend` — l'interdiction de câblage est donc testée, pas juste
  décrétée.

## 4. Contrats d'intégration par source

### Spotify (futur backend optionnel — PROTOTYPE ONLY)

| Aspect          | Contrat cible                                                                                                                 | Statut actuel                                                                                            |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Auth / identité | Session utilisateur dans la WebView uniquement ; Melodix ne lit ni cookie, ni token, ni en-tête ; identité = compte Spotify   | **NOT TESTED** (login réel jamais exercé hors écran du compte utilisateur)                               |
| Métadonnées     | `title/artists/artwork/duration/trackId` lus par le probe DEPUIS `navigator.mediaSession.metadata` du document                | **NOT TESTED** sur page réelle (mur de connexion en CI : aucune metadata publiée)                        |
| État Web Player | protocole pont v2 : `state` + `source:'media-session'`, statuts `idle/loading/playing/paused/buffering/ended`                 | **READY** en prototype (machine prouvée sur émulateur aller simple ; réponse de page attendue téléphone) |
| Source audio    | aucune : Melodix ne possède ni URL de flux, ni décodeur, ni DRM ; le son appartient au lecteur Web de Spotify                 | **BLOCKED** — aucune surface autorisée démontrée à ce jour                                               |
| Commandes       | émissions v2 corrélées ; `accepted:true` n'est JAMAIS une lecture ; refus `no-authorized-execution-surface` = résultat valide | **NOT TESTED** (aller prouvé en émulateur, retour page non observé)                                      |

### Audius — fallback principal actuel (production)

Résolution par titre/artistes/ISRC (`trackResolver.ts`, cache positif/négatif,
« guérison » unique) puis stream du provider. Ordre `audius` en premier, figé
à `services/audio/index.ts:16` et épinglé par test. **inchangé** par ce
chantier, en flag off comme en flag on (il reste en dernier dans la liste).

### YouTube — fallback secondaire actuel (production)

Second provider de la même ORDER ; cascade de lecture par morceau (provider
suivant pour le MÊME titre en cas de stream mort, décision persistée au cache,
négatif confirmé sans boucle — `player.ts:725+`). **inchangé**.

### Qui possède quoi (règle anti double source de vérité)

| Notion               | Possesseur aujourd'hui            | Possesseur cible quand Spotify Web actif                                                                                                   |
| -------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Queue                | `melodixPlayer`                   | `melodixPlayer` (la queue reste au moteur, quel que soit le backend actif)                                                                 |
| Position             | `melodixPlayer` (tick expo-av)    | **backend actif** pendant la lecture Spotify Web ; re-synchronisée vers le moteur à chaque bascule — JAMAIS interpolées ensemble           |
| playing/paused       | `melodixPlayer` (état expo-av)    | **backend actif** uniquement, et pour `spotify-web` seulement sur `state` publié par la page                                               |
| Historique           | `player.ts` `markPlaybackStarted` | inchangé : exige un vrai début de lecture (définition à fixer au test physique : `playing` persistant ≥ seuil, pas un accusé)              |
| Shuffle              | `melodixPlayer`                   | `melodixPlayer` (le backend n'a que next/previous)                                                                                         |
| Repeat               | `melodixPlayer`                   | `melodixPlayer` (repeat-one côté Spotify Web = next→reseek : NON TESTÉ, à ne pas promettre)                                                |
| MediaSession Android | `mediaBridge` (projection unique) | projection toujours issue de l'état du moteur/ backend actif fusionné, via la MÊME porte `playing` ; jamais le probe qui écrit directement |
| Background playback  | moteur expo-av + réglage          | **inconnu pour Spotify Web** (c'est LA question du test téléphone)                                                                         |

## 5. Compatibilité avec les protections en place (à conserver impérativement)

| Protection                                    | Où elle vit                                                                                     | Comment l'intégration la préserve                                                        |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| latest-command-wins                           | `SpotifyWebBackend.runLatestCommand` (séquence + session, lignes 233-245)                       | déjà dans le backend ; le futur câblage passe par lui, pas autour                        |
| `playing` seulement après confirmation réelle | `normalizeSpotifyWebState` + mappage payload (jamais sur accusé de commande)                    | inchangé ; l'activation du flag ne touche aucune de ces fonctions                        |
| Historique après lecture réellement commencée | `player.ts:415/515` (token expo-av)                                                             | définition « lecture Spotify » à verrouiller au test physique AVANT tout branchement     |
| loading/buffering/paused                      | `mapSpotifyWebBridgePayload` (buffering→loading ; ended/idle→idle avec booléens retirés)        | inchangé                                                                                 |
| Expiration des commandes                      | minuteur `commandTimeoutMillis` armé AVANT `send`                                               | inchangé ; `expired` observable et distingué (prouvé sur émulateur au run `37182486483`) |
| Invalidation après changement de session      | `runtimeSession` incrémenté (beginRuntimeSession/markRuntimeUnavailable) + flush `disconnected` | inchangé                                                                                 |
| Récupération après renderer détruit           | `SpotifyWebRuntime` (phases, reconnexion bornée, remount)                                       | inchangé                                                                                 |
| Persistance de session                        | `playbackSession.ts` (anti-spam, windowQueue)                                                   | hors périmètre du module de flag : jamais modifiée ici                                   |

## 6. Conditions AVANT activation (checklist bloquante)

1. Test téléphone réel consigné (procédure `docs/SPOTIFY-WEB-PHYSICAL-TEST.md`)
   avec : connexion compte, audio entendu, `Lecture: playing` +
   `source: media-session`, position qui avance, artwork/métadonnées réels,
   audio en arrière-plan, notification MediaSession, comportement des
   commandes UI (un refus persistant valide = **BLOCKED** pour la source
   audio ; une acceptation réelle = documenter la surface autorisée AVANT
   tout design de queue).
2. Décision écrite : qui possède la position pendant la lecture Web (le
   backend, source page) et comment `mediaBridge` la projette via le moteur —
   sans double source de vérité.
3. Définir la bascule de repli (critères, anti-rebond) et le sort des pistes
   non lisibles côté Spotify (jamais de substitution silencieuse).
4. Seulement alors : importer `resolveSpotifyWebPlaybackActivation()` dans un
   point de sélection du moteur (décision d'architecture à faire PRÉ-
   code), retirer la garde-fou §3 en la remplaçant par des tests d'orchestration.

## 7. État de chaque fonctionnalité

| Fonctionnalité                           | Statut                                                                      |
| ---------------------------------------- | --------------------------------------------------------------------------- |
| Flag local désactivé par défaut          | **READY**                                                                   |
| Porte validation physique                | **READY**                                                                   |
| Contrat de sélection des moteurs         | **READY**                                                                   |
| Garde-fou anti-câblage (test source)     | **READY**                                                                   |
| Pont v2 (protocole, corrélation, expiry) | **READY** (prototype)                                                       |
| Handshake + états lus par MediaSession   | **PROTOTYPE ONLY**                                                          |
| Réponse de page à une commande           | **NOT TESTED** (mur connexion/erreur en CI ; téléphone requis)              |
| Auth Spotify dans WebView                | **NOT TESTED**                                                              |
| Métadonnées réelles                      | **NOT TESTED**                                                              |
| Position/durée réelles                   | **NOT TESTED**                                                              |
| Largevine/EME                            | **BLOCKED** sur l'émulateur CI (image sans Play) ; téléphone **NOT TESTED** |
| Audio Spotify réel                       | **NOT TESTED**                                                              |
| Audio en arrière-plan                    | **NOT TESTED**                                                              |
| Queue/position communes (câblage)        | **BLOCKED** (décisions §6.2-6.3 non prises)                                 |
| Remplacement d'Audius → YouTube          | interdit hors périmètre — **jamais**                                        |

> Ligne volontairement honnête : si le téléphone confirme qu'aucune surface
> autorisée n'existe, l'activation reste **BLOCKED** à jamais et le prototype
> meurt documentaire — ce résultat est un succès de validation, pas un échec.
