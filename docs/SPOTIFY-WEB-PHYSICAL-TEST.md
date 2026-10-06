# Test physique Spotify Web Player — procédure courte

Cette procédure valide uniquement le prototype isolé. Elle ne modifie pas le lecteur Audius → YouTube et ne demande jamais de communiquer des identifiants à Melodix ou dans un rapport.

## APK à tester

- Workflow : https://github.com/Souxch06/Melodix/actions/runs/37123047052
- Artefact : `Melodix-v4.4.8-diagnostic-16832ed.apk`
- Version affichée par Android : `4.4.8-diagnostic` (`versionCode 44008`)
- SHA-256 : `2f62217d82d10e88f9a15232acff470744b6e522474c7e1591392ee29375a9c6`

Télécharger l'artefact depuis la section **Artifacts** du workflow, extraire l'APK et l'installer. Android peut demander d'autoriser temporairement l'installation depuis la source utilisée.

## Test — 5 à 10 minutes

1. Ouvrir **Réglages → Diagnostic → Prototype Spotify Web Player**.
2. Vérifier que Spotify est visible et navigable, sans écran blanc. Noter les lignes `Bridge`, `MediaSession`, `EME` et `Widevine` du panneau Melodix.
3. Se connecter directement dans la page Spotify. Ne jamais copier l'identifiant, le mot de passe, un cookie ou un token dans un rapport. Si un fournisseur externe est bloqué par l'allowlist, noter uniquement son nom de domaine et utiliser la connexion Spotify classique si possible ; ne pas désactiver l'allowlist.
4. Ouvrir un album ou une playlist, lancer un morceau et vérifier avec les oreilles qu'un son sort réellement. Tester pause, reprise et morceau suivant.
5. Vérifier si le panneau Melodix passe à `Lecture: playing` et affiche titre/artiste/artwork. Une page animée ou un bouton Play ne constitue pas une preuve audio.
6. Appuyer sur Accueil Android, attendre 30 secondes, revenir. Répéter écran verrouillé si la lecture avait démarré. Tester notification et casque/Bluetooth uniquement s'ils sont disponibles.
7. Fermer puis rouvrir l'écran diagnostic, puis l'application. Vérifier si la session Spotify reste connectée.
8. Pour tester la recréation d'activité sans simuler un renderer : activer temporairement l'option développeur Android **Ne pas conserver les activités**, quitter puis revenir. Ne pas utiliser d'URL de crash ou d'outil qui contourne l'allowlist.

## Résultats à communiquer

Aucune capture ne doit montrer email, identifiant, QR code de connexion, cookie, token ou autre donnée de compte.

| Point                               | Valeur attendue à renseigner                |
| ----------------------------------- | ------------------------------------------- |
| Modèle / version Android            | texte                                       |
| Bridge                              | attente / prêt / timeout / renderer détruit |
| MediaSession Web                    | oui / non / inconnu                         |
| EME                                 | oui / non / inconnu                         |
| Widevine                            | oui / non / inconnu                         |
| Spotify visible                     | oui / non                                   |
| Connexion                           | oui / non / fournisseur bloqué              |
| Session après réouverture           | oui / non                                   |
| Audio réellement audible            | oui / non                                   |
| Play / pause                        | oui / non                                   |
| Changement de morceau               | oui / non                                   |
| Titre/artiste remontés dans Melodix | oui / non                                   |
| Progression/durée remontées         | oui / non                                   |
| Audio après 30 s en arrière-plan    | oui / non                                   |
| Audio écran verrouillé              | oui / non / non testé                       |
| Notification Spotify contrôlable    | oui / non                                   |
| Casque/Bluetooth                    | oui / non / non testé                       |
| Retour après recréation activité    | propre / erreur / crash                     |

### Champs ajoutés en Mission 6 — remplissables depuis les diagnostics

Les neuf événements `SPOTIFY_WEB_*` sont horodatés séparément, donc ces trois
lignes deviennent mesurables au lieu d'être des impressions. Si le pont n'est
jamais arrivé à `READY`, laisser ces lignes vides plutôt que de les deviner.

| Point                               | Valeur attendue à renseigner                  |
| ----------------------------------- | --------------------------------------------- |
| `SPOTIFY_WEB_LOAD` observé          | oui / non                                     |
| `SPOTIFY_WEB_READY` observé         | oui / non                                     |
| `SPOTIFY_WEB_PLAY_REQUEST` observé  | oui / non                                     |
| `SPOTIFY_WEB_PLAY_ACCEPTED` observé | oui / non — si oui, la page a REÇU l'ordre    |
| `SPOTIFY_WEB_PLAYING` observé       | oui / non — **seule vraie preuve de lecture** |
| Latence demande → `PLAYING`         | ms (mesurée)                                  |
| `SPOTIFY_WEB_BUFFERING` observé     | oui / non / non testé                         |
| `SPOTIFY_WEB_ENDED` observé         | oui / non                                     |
| `SPOTIFY_WEB_ERROR` observé         | non / code de cause (jamais de texte libre)   |

> Rappel de méthode : `PLAY_ACCEPTED: oui` seul ne vaut PAS « lecture
> fonctionnelle ». Seul `PLAYING` compte. Si les deux premiers arrivent et
> que `PLAYING` manque, la conclusion est « commande acceptée, lecture non
> démontrée » — pas « fonctionne ».

## Interprétation

- `Widevine: non` avec lecture refusée indique un blocage DRM probable de cette WebView/appareil ; ne rien contourner.
- `Bridge: prêt` prouve uniquement le canal WebView ↔ React Native, pas l'authentification ni l'audio.
- `Lecture: playing` provenant de `navigator.mediaSession` est un signal standard utile, mais le son audible reste la preuve nécessaire.
- Durée et position peuvent rester indisponibles : l'API Media Session standard ne fournit pas de getter portable pour ces valeurs.

## Extension pont v2 — ce que l'écran affiche désormais (depuis le commit `acac71b`+)

Lignes du panneau de diagnostic Melodix, toutes en indicateurs contrôlés sans
donnée sensible (jamais d'URL complète, cookie, token, credential, contenu de
requête/réponse ni donnée de compte) :

- `WebView: active | renderer détruit · page: …` — disponibilité du renderer et label de page ;
- `Bridge: attente | prêt | timeout | renderer détruit` — handshake `bridge_ready` reçu ou non ;
- `Runtime: idle|loading|awaiting-bridge|ready|recovering|failed · reconnexion n/3` — cycle de vie et budget de reconnexion automatique après perte (perte réseau, renderer, timeout) ;
- `Lecture: …` — statut normalisé réellement publié par la page ;
- `Métadonnées: titre=oui/non · artistes=oui/non · artwork=oui/non · durée=oui/non · position=oui/non · source: media-session|—` — présence des champs publiés via `navigator.mediaSession` et preuve que l'état vient du runtime de la page ;
- `MediaSession: … · EME: … · Widevine: … · positionState: oui/non/inconnu` — capacités déclarées par le probe ;
- panneau `Événements` — codes sûrs uniquement, y compris `command_unavailable · play · <code>` et `command_accepted · play`.

### Résultat ATTENDU et VALIDE pour les commandes

Sans intégration PlayerContext, la sonde `Play` envoie une vraie commande v2 corrélée.
La page répond actuellement `{accepted:false, code:'no-authorized-execution-surface'}` :
**c'est le résultat correct**, il prouve l'aller-retour émission → corrélation → réponse.

- Ne pas transformer ce refus en succès (aucun DOM, aucun `HTMLMediaElement`, aucun `dispatchEvent`, aucun clavier synthétique — interdits de conception).
- `command_accepted` n'est un signal positif que si la page l'a réellement publié ; même alors, la lecture « réelle » ne se prouve que par le son dans les haut-parleurs ET par `Lecture: playing` avec `source: media-session`.
- Un bouton Spotify animé ou une page qui tourne ne prouve pas l'audio.

### Lignes de résultat à ajouter au tableau existant

| Point                                   | Valeur attendue à renseigner                                                                                 |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Handshake bridge (Bridge:)              | prêt / timeout / attente / renderer détruit                                                                  |
| Reconnexion auto après perte réseau     | n/3 puis retour `ready` / échec                                                                              |
| Statut lu (Lecture:) + source           | idle/playing/paused + media-session/—                                                                        |
| Métadonnées (titre/artistes/artwork)    | oui/non par champ                                                                                            |
| Durée/position publiées (positionState) | oui / non / inconnu                                                                                          |
| Code réponse de commande                | no-authorized-execution-surface (valide) / command_accepted / expired / disconnected / transport-unavailable |
| Audio après 30 s en arrière-plan (réel) | oui / non — à l'oreille, pas à l'écran                                                                       |

### Ce que le smoke CI démontre déjà (Android 14 x86_64, Google Actions emulator)

Le workflow `APK Android` installe le même APK sur un émulateur Android 14 réel, ouvre la
route par deep link, vérifie l'absence de crash, le résultat explicite du handshake (`prêt`
ou `timeout` honnête), le résultat Widevine du probe, la présence des lignes Métadonnées/
positionState, exerce un appui réel sur la sonde `Commande lecture` (via uiautomator), puis le
cycle arrière-plan/retour. **Ce n'est pas un test de compte Spotify** : pas de connexion, pas de
lecture de musique — uniquement le canal WebView ↔ React Native sur un vrai runtime Android.

## Résultats du run CI `37181485551` (commit `dfb2cb7`, Android 14 x86_64 google_apis, sans compte)

Preuves relevées dans les logs/annotations GitHub Actions (build officiel du workflow `APK Android`,
APK signé v4.4.8-diagnostic/44008, sha256 `0e8e1dbf6d946749c4c115e5db541d6acb3aca9bfb22ae1db549dc7d5e51bcec`) :

| Constat                                                          | Verdict sur cet émulateur                                                                                                                                                                                  |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Installation, lancement, ouverture de la route, absence de crash | **Démontré** (gate bloquante du smoke : pid survive, titre « Prototype Spotify Web » rendu)                                                                                                                |
| WebView réellement chargé + handshake v2 (`Bridge:` prêt)        | **Démontré** (ligne `prêt` présente au dump ; absence de warning timeout)                                                                                                                                  |
| Cycle arrière-plan → retour, processus vivant                    | **Démontré** (gate du smoke)                                                                                                                                                                               |
| `source: media-session` publié par la page                       | **Non publié** — page sans session média (aucun compte connecté) : normal, non bloquant                                                                                                                    |
| Widevine/EME                                                     | **Indisponible pour cette configuration d'émulateur** (image `google_apis` sans Play) : blocage documenté, non simulé                                                                                      |
| Appui réel sur la sonde `Commande lecture`                       | **Exécuté et aller simple prouvé** (run `37182486483`) : appui uiautomator réel → pont prêt réel → `transport.send` réel → commande corrélée soldée `expired` par le minuteur réel de 5 s ; rien de simulé |
| Lecture audio Spotify réelle                                     | **Non testé ici** (aucun compte sur l'émulateur) — reste à valider sur téléphone réel                                                                                                                      |

Aucune de ces constantes ne prouve une lecture réelle ; seule la procédure téléphone (section
précédente) peut le faire. Le diagnostic complet d'un run est limité à ce que l'UI affiche :
présences booléennes et codes sûrs, jamais d'URL complète, de cookie, de token ni de contenu réseau.

## Mission 7 — reconstruction propre et état honnête (2026-10-05)

La précédente tentative de Mission 7 (trois fichiers jamais commités) a été
définitivement perdue avec le sandbox. La Mission 7 a été reconstruite depuis
le commit `662b65d` (fin Mission 6), en trois modules commités séparément, puis
un orchestrateur d'intégration. **Aucune ligne de Mission 6 n'a été réécrite.**

### PROUVÉ — par tests automatisés (Jest, sans appareil)

| Élément                                 | Preuve                                                                                                                                                                                                                                              | Verdict           |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| Sélection `playbackBackendSelection`    | 24 tests : ordre Spotify Web → Audius → YouTube constant, incident ≠ absence, erreur inconnue jamais définitive, négatif durable réservé à l'absence PROUVÉE                                                                                        | PROUVÉ (unitaire) |
| Plan `spotifyWebPlaybackPlan`           | 30 tests : refus explicites (explicit/version/durée/ISRC), autoplay, seek borné, reprise (dont reprise collée à la fin → repart du début), runtime pas prêt / recovering / failed, renderer détruit, péremption TTL                                 | PROUVÉ (unitaire) |
| Transport `spotifyWebTrackTransport`    | 29 tests sur le VRAI `SpotifyWebBackend` Mission 6 : `PLAY_ACCEPTED ≠ PLAYING`, confirmation unique par chargement, seek non déclaré avant publication, `expired`, `disconnected`, `stale`, reconnexion, ready tardif refusé après renderer détruit | PROUVÉ (unitaire) |
| Orchestrateur d'intégration             | 16 tests : porte fermée = zéro essai et zéro pénalité, `confirmation-timeout` classé incident **retentable** (jamais absence), cascade Spotify → Audius → YouTube → échec structuré, projection MediaSession via la fonction centrale               | PROUVÉ (unitaire) |
| Garde-fou Mission 6 (lecteur non câblé) | `spotifyWebFeature.unit.test.ts` toujours vert : `services/player.ts`, `context/PlayerContext.tsx`, `services/mediaBridge.ts`, `services/playbackSession.ts` n'importent toujours pas Spotify Web                                                   | PROUVÉ            |

### NON PROUVÉ — exige un appareil réel et un compte Spotify

- lecture audio réelle (son audible) via Spotify Web dans la WebView ;
- `PLAYING` réellement publié par la page après une commande acceptée ;
- pause / reprise / seek confirmés par la page sur un vrai appareil ;
- MediaSession Android alimentée par Spotify (notification, écran verrouillé,
  Bluetooth/casque, commandes matérielles) ;
- lecture en arrière-plan réelle ;
- fallback réellement déclenché par une panne réelle (réseau, renderer tué).

### BLOQUÉ

- **Câblage du lecteur : volontairement non fait.** La Mission 6 porte un test
  (`spotifyWebFeature.unit.test.ts`) qui INTERDIT au lecteur de référencer
  `spotifyWebFeature`, `SpotifyWebBackend` ou la porte d'activation tant que
  `recordSpotifyWebPhysicalValidation('PASSED_ON_DEVICE', preuve)` n'a pas été
  consigné. Câbler avant le test téléphone reviendrait à casser un garde-fou
  testé et à activer un chemin invérifiable. `spotifyWebPlaybackIntegration.ts`
  fournit tout le câblage, testé ; l'étape finale est courte et doit être
  faite APRÈS la validation téléphone, en levant explicitement ce garde-fou
  dans le même commit.
- **APK de la branche : `BLOCKED — GitHub Actions permissions`.** La
  commande `gh workflow run "APK Android" --ref arena/01a10d1a-melodix`
  renvoie : `HTTP 403: Resource not accessible by integration`. Aucune
  permission n'a été contournée et la configuration Android n'a pas été
  modifiée.
- **Test physique minimal : impossible ici** (aucun appareil Android, aucun
  compte Spotify dans l'environnement).

### Rappel de méthode (inchangé)

`code compilé` ≠ `lecture Spotify Web démontrée`. Et `PLAY_ACCEPTED: oui` ne
vaut jamais `PLAYING`. Le tableau « PROUVÉ » ci-dessus ne contient QUE des
garanties de logique (tests unitaires) : il ne contient pas une seule preuve
de son.

### Interprétation exacte du résultat `expired` (run `37182486483`)

`expired` sur l'émulateur prouve physiquement chaque maillon : appui réel → écouteur React Native
réel → vérification du pont prêt → `transport.send` réel → minuteur d'expiration réel. Il prouve
aussi l'absence de réponse de page : sans page Web Spotify réellement active (mur de connexion ou
page d'erreur réseau du datacenter), le canal descendant `postWebMessage` d'Android ne délivre
aucun message, et le probe n'exécute son écouteur que dans un document web vivant. La réponse de
la page (`no-authorized-execution-surface` ou `command_accepted`) ainsi que l'audio réel ne peuvent
être démontrés que par la procédure téléphone avec un vrai compte.

## Mission 8 — câblage réel du lecteur + procédure de validation (2026-10-06)

### Ce qui a changé

Le lecteur est maintenant **réellement câblé** — mais derrières un DOUBLE
verrou, tous deux fermés par défaut :

1. **Porte physique** : `recordSpotifyWebPhysicalValidation('PASSED_ON_DEVICE',
preuve documentée)` (ci-dessous) ;
2. **Réglage utilisateur** : « Lire via Spotify Web » (Réglages → Spotify
   Web), **désactivé par défaut**, grisé tant que la porte physique est
   fermée.

Aucun des deux leviers activé = le moteur est littéralement le même que
depuis la baseline (cascade Audius → YouTube, zéro tentative Spotify Web) —
ceci est testé (`playerSpotifyWeb.unit.test.ts` : « sans port attaché →
comportement 100 % cascade inchangé »).

### Architecture du câblage (contrat de garde)

```
WebView Spotify (hôte SpotifyWebHostView, layout racine)
   ↕ probe v2 (état publié / commandes corrélées, refus honnête)
SpotifyWebPlaybackIntegration (tentative + confirmation réelle)
   ↕ SpotifyWebSourcePort (seul canal connu du moteur)
melodixPlayer (9 états, queue, shuffle/repeat, fallback)
   → PlayerContext / MiniPlayer / FullPlayer / MediaBridge
```

- Le moteur ne connaît que la **porte** `SpotifyWebSourcePort`
  (`attachSpotifyWebSource`), jamais le backend ni l'intégration —
  verrouillé par `spotifyWebWiringGuard.unit.test.ts` ;
- le contexte lecteur **fabrique** la porte et l'attache (detach au teardown)
  sans jamais importer la chaîne WebView (les suites Jest qui chargent
  `@services → @context` restent exemptes de `react-native-webview`) ;
- **l'hôte** (WebView + pont) est monté au layout racine, au-dessus de la
  pile UI, en hors-écran (jamais `display:none`) pour garder le renderer et
  la session Spotify vivants quand la vue est masquée ;
- `playing` n'est émis que sur **confirmation réelle** : la page publie
  `playing` pour la piste planifiée. `PLAY_ACCEPTED ≠ PLAYING` reste la
  loi ; un refus honnête de commande (`no-authorized-execution-surface`)
  réaffiche la vue au lieu d'inventer un état ;
- tout verdict non confirmé (timeout, plan refusé, vue fermée, pas d'id
  Spotify, porte fermée) retombe sur la cascade — **jamais** un fallback
  « parce qu'une promesse JS a fini ».

### MediaSession Android : QUI la porte selon la source

Deux porteurs de MediaSession existent et ils ne doivent JAMAIS coexister
sur la même lecture (double notification + commandes mortes) :

- **Source Audius / YouTube (expo-av)** → la session Media3 native de
  Melodix (`mediaBridge` → `MelodixMediaService` + `VirtualMediaPlayer`)
  projette l'état moteur et relaye les commandes système (play/pause/next/
  previous/seek/stop) vers les MÊMES méthodes du moteur que l'UI.
- **Source Spotify Web (WebView/Chromium)** → la WebView intègre SA PROPRE
  MediaSession système : la notification, l'écran verrouillé, le Bluetooth
  et les boutons pilotent RÉELLEMENT la page via les
  `MediaSessionActionEvent` standards de Chromium. Le pont JS n'a pas de
  surface d'exécution autorisée pour contrôler la page — donc c'est la
  session de la page qui est la seule qui puisse le faire.

Règle tenue par `mediaBridge` (testée) : dès que l'état moteur est lu par
Spotify Web (`resolved.provider === 'Spotify Web'`), la session native est
**fermée** (si elle était active pour un morceau Audius/YouTube) et plus
aucune projection native n'est poussée pour cette piste. Au retour sur
Audius/YouTube, la session native se réactive normalement. L'UI Melodix
(MiniPlayer/FullPlayer) suit dans les deux cas l'état **publié** par le
moteur — elle est agnostique du porteur de la MediaSession.

### Événements de lecture de la probe (réactivité réelle)

La probe s'abonne aux événements standards de l'API Media Session
(`playbackstatechange`, `metadatachange`) : les transitions
`playing`/`paused`/`ended` et le **changement de piste** sont publiés
immédiatement, sans attendre le poll de 1 s. Le poll reste le filet de
sécurité pour la **position** (`positionState`). Aucune surface interdite
n'est ouverte : uniquement l'API publique W3C.

### Check-list physique — 18 points (à consigner sur appareil réel)

| #   | Point                                                                                                    | Valeur attendue                         |
| --- | -------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| 1   | Connexion Spotify dans la WebView                                                                        | oui / non / fournisseur bloqué          |
| 2   | Recherche depuis l'UI Melodix, résultat cliquable                                                        | oui / non                               |
| 3   | LECTURE RÉELLE : son audible + `Lecture: playing` + `source: media-session`                              | oui / non (**seule preuve de lecture**) |
| 4   | Pause : son s'arrête, état `paused` publié                                                               | oui / non                               |
| 5   | Reprise : son reprend, position conservée                                                                | oui / non                               |
| 6   | Seek : la position appliquée est confirmée par la page                                                   | oui / non / non testé                   |
| 7   | Fin de morceau : `ended` publié → la file avance d'elle-même                                             | oui / non                               |
| 8   | Morceau précédent (commande réelle)                                                                      | oui / non / non testé                   |
| 9   | Shuffle : l'ordre est respecté, rien n'est perdu                                                         | oui / non                               |
| 10  | Repeat one / all                                                                                         | oui / non / non testé                   |
| 11  | Queue : liste entière, changement sans perte                                                             | oui / non                               |
| 12  | Notification MediaSession : titre/artwork/commandes                                                      | oui / non                               |
| 13  | Écran verrouillé : commandes + affichage                                                                 | oui / non / non testé                   |
| 14  | Bluetooth / casque : démarrage, coupure, retour                                                          | oui / non / non testé                   |
| 15  | Arrière-plan 30 s : audio réel à l'oreille                                                               | oui / non                               |
| 16  | Fallback Audius : une panne RÉELLE Spotify → la cascade prend                                            | oui / non / non testé                   |
| 17  | Fallback YouTube : double panne → YouTube                                                                | oui / non / non testé                   |
| 18  | Fermeture/réouverture de l'app : session Spotify tenue, **aucun auto-start**, reprise explicite possible | oui / non                               |

Règle de méthode (inchangée) : « oui » n'est validé QUE par un constat
matériel (oreille, écran, notification) — jamais par la compilation, jamais
par `PLAY_ACCEPTED`. Un point « non testé » doit rester « non testé ».

### Enregistrement de la preuve (ce qui déblocle le réglage)

1. Réglages → **Spotify Web** → bloc « Validation physique » ;
2. Coller la **preuve documentée** dans le champ : appareil, version
   Android, heures, et pour le point 3 la valeur exacte du panneau
   diagnostique (`Lecture: playing · source: media-session`) + résultat
   des 18 points ;
3. Appuyer sur **« Marquer PASSED »** — sans texte, le bouton refuse
   (preuve obligatoire, `recordSpotifyWebPhysicalValidation` est le même
   verrou testé dans `spotifyWebFeature.unit.test.ts`) ;
4. Le switch « Lire via Spotify Web » devient alors activable.

Un « NOT PASSED » referme la porte immédiatement (le flag développeur et le
réglage utilisateur perdent leur effet sans rien casser : le moteur retombe
sur la cascade, testé).

### État honnête de cette branche

- **Câblage : IMPLÉMENTÉ et testé unitairement** (moteur, port, transport,
  adaptateur partiel, garde de câblage — voir la liste des tests ci-dessous) ;
- **Lecture réelle : NON VALIDÉE RÉELLEMENT** — aucun appareil ni compte
  Spotify dans l'environnement de travail ; les 18 points ci-dessus sont à
  exécuter sur téléphone ;
- **Tests physiques : NON TESTÉS PHYSIQUEMENT** tant que la check-list
  ci-dessus n'est pas consignée avec la preuve documentée.

### Tests automatisés ajoutés avec le câblage

| Fichier                                                                           | Couvre                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`                                | moteur + port : confirmation réelle → `playing` sans expo-av ; timeout/not-ready/pas d'id → cascade ; intention (geste ouvre, auto non) ; états publiés (pause/position/ended/error, autre piste jamais attribué) ; stop invalide ; sans port = cascade inchangée |
| `services/playbackBackend/__tests__/spotifyWebHost.unit.test.ts`                  | port hôte : bus d'état publié + visibilité ; tentatives (porte fermée, sans hôte, confirmée, timeout, **view-closed**) ; commande refusée → la vue réapparaît ; commande expirée → rien                                                                           |
| `services/playbackBackend/__tests__/spotifyWebTransportUserGesture.unit.test.ts`  | transport : play refusé par le pont puis `playing` publié par la page → confirmation unique ; autoplay:false → rien n'est attribué ; `ended` ; document mort ne ressuscite rien                                                                                   |
| `services/playbackBackend/__tests__/spotifyWebBackendPartialAdapter.unit.test.ts` | backend : adaptateur partiel (load/setVolume) → les 6 commandes passent par le canal bridge corrélé ; refus/timeout/tardif ; toggle suit l'état publié ; capacité non inventée                                                                                    |
| `services/playbackBackend/__tests__/spotifyWebWiringGuard.unit.test.ts`           | garde de câblage : moteur ↔ porte uniquement ; contexte exempt de la chaîne WebView ; hôte au layout racine ; probe (mécanismes + surfaces interdites + événements d'état)                                                                                       |
| `services/__tests__/mediaBridge.unit.test.ts` (bloc Spotify Web)                  | MediaSession : source Spotify Web → AUCUNE session native concurrente (fermeture de la session Audius active, zéro projection) ; retour Audius → la session native se réactive ; réglage désactivé → rien                                                         |

L'ancienne section « BLOQUÉ — Câblage du lecteur : volontairement non fait »
(ci-dessus, Mission 7) est **obsolète** depuis cette Mission 8 : le câblage a
été fait **après** le re-câblage de la porte, en conservant le double verrou
fermé par défaut et le même contrat de garde (le moteur ne référence ni
`spotifyWebFeature`, ni `SpotifyWebBackend`, ni l'intégration).
