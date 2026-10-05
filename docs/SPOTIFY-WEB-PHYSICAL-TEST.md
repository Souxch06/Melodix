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

### Interprétation exacte du résultat `expired` (run `37182486483`)

`expired` sur l'émulateur prouve physiquement chaque maillon : appui réel → écouteur React Native
réel → vérification du pont prêt → `transport.send` réel → minuteur d'expiration réel. Il prouve
aussi l'absence de réponse de page : sans page Web Spotify réellement active (mur de connexion ou
page d'erreur réseau du datacenter), le canal descendant `postWebMessage` d'Android ne délivre
aucun message, et le probe n'exécute son écouteur que dans un document web vivant. La réponse de
la page (`no-authorized-execution-surface` ou `command_accepted`) ainsi que l'audio réel ne peuvent
être démontrés que par la procédure téléphone avec un vrai compte.
