# Mission de validation physique — Spotify Web sur Android réel

**Date** : 7 octobre 2026 · **Base** : HEAD `dc1fa8c` (V9) · **Nouveau HEAD** :
`ddea597` (fix + bump) + commit du rapport · **RÉSULTAT** : audit complet du
chemin physique, **1 bug réel corrigé** (permission de notification sur le
chemin Spotify), version `4.5.0-test.14` / `45014`, CI **success** avec
smoke Android 14 — et **validation physique non exécutable depuis ce
sandbox** (section 1), livrée avec un protocole précis à exécuter sur
téléphone réel.

## 1. Contrainte absolue de l'environnement (honnêteté d'abord)

La mission demandait la validation **physique réelle** sur un vrai
téléphone avec un compte Spotify réel. **Ce sandbox ne le permet pas**, et
je refuse de simuler quoi que ce soit :

| Ressource requise                     | Présent dans le sandbox ? | Preuve                                                        |
| ------------------------------------- | ------------------------- | ------------------------------------------------------------- |
| Téléphone Android physique (adb)      | ❌ aucun                  | `adb: command not found` — aucun device, aucun câble possible |
| Émulateur Android                     | ❌ aucun                  | pas d'`emulator`/SDK, pas de Java, **pas de `/dev/kvm`**      |
| Compte Spotify réel (OAuth + session) | ❌ aucun                  | impossible à obtenir ici ; interdit de le simuler (consigne)  |

**Conséquence assumée** : la section « TESTÉ PHYSIQUEMENT » de ce rapport est
**vide** — aucun résultat physique n'a été inventé. Ce que cette mission
apporte réellement : (a) un audit complet du chemin physique au niveau du
code, (b) la correction d'un **bug déterministe découvert** qui aurait fait
échouer le test physique de la notification, (c) un **protocole de test
physique prêt à l'emploi** (section 7) pour exécuter cette validation sur un
vrai téléphone avec l'APK 45014.

## 2. Audit du chemin physique réel (lecture seule, code HEAD `dc1fa8c`)

Chaque maillon de `Spotify Web → lecture → PlayerController → MediaSession →
notification → écran verrouillé → casque/Bluetooth → arrière-plan` a été
vérifié dans le code :

| Maillon              | Fichier(s)                                                     | Verdict code                                                                                                                                                                                                                                    |
| -------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Manifest Android 14  | `modules/melodix-media/plugin/withMelodixMedia.js`             | ✅ `FOREGROUND_SERVICE` + `FOREGROUND_SERVICE_MEDIA_PLAYBACK` + `POST_NOTIFICATIONS` ; service `MelodixMediaService` `mediaPlayback`/exporté + intent-filter Media3 (pattern officiel)                                                          |
| Service MediaSession | `MelodixMediaService.kt`                                       | ✅ Media3 `MediaSessionService` 1.3.1 ; `startForeground` < 5 s (bootstrap + MediaStyle) ; rejet FGS Android 12+ géré ; `onTaskRemoved` : survie si playing, stop si paused ; blindage anti-crash (la lecture ne dépend jamais de cette couche) |
| Relais commandes     | `MelodixMediaController.kt`                                    | ✅ zéro logique de lecture : projection mémo + replay au `onCreate`, retry borné, aucune file/shuffle                                                                                                                                           |
| Module Expo          | `MelodixMediaModule.kt`                                        | ✅ noisy receiver **dynamique** enregistré en `OnCreate` → événement JS ; permission `POST_NOTIFICATIONS` demandée au runtime ; arrêt de session au `OnDestroy`                                                                                 |
| Routeurs JS → moteur | `services/mediaBridge.ts`                                      | ✅ commandes système (`play/pause/next/previous/seek/stop`) relayées aux **mêmes méthodes** du PlayerController que l'UI ; noisy → pause **uniquement si `playing` réel**                                                                       |
| Hôte WebView         | `components/Player/SpotifyWebHostView.tsx` + `app/_layout.tsx` | ✅ monté à la **racine** (jamais démonté par la navigation) ; WebView hors écran (non détruite) quand l'overlay est fermé ; `onAppStateChange` bénin (ne fait que différer la reconnexion)                                                      |
| Confirmation réelle  | `services/player.ts` (L1020)                                   | ✅ `status: 'playing'` + `resolved: {provider:'Spotify Web'}` publiés **uniquement après confirmation** du port                                                                                                                                 |

### Découverte A — BUG réel et déterministe (corrigé, section 3)

Sur le chemin Spotify, `mediaBridge.projectState` partait **avant** la
demande de `POST_NOTIFICATIONS` (demande seulement posée pour les pistes
natives). Conséquence certaine sur **Android 13+** : dans une
session Spotify-only, l'app ne demandait **jamais** la permission → la
notification média (postée par le processus de l'app, via la MediaSession de
la WebView) restait **invisible dans le tiroir**, sans jamais avoir proposé
la boîte de dialogue. Le scénario 4 de la mission (« la notification doit
afficher la piste ») échouait dès le premier lancement sur un appareil
récent.

### Découverte B — fait d'architecture à valider physiquement (risque n°1)

**Aucun Foreground Service Melodix pendant une lecture Spotify** : c'est un
choix assumé et documenté du code (`projectState` : pour une piste
`Spotify Web`, la session Melodix est **fermée** — la MediaSession système
est portée par la **WebView elle-même** (Chromium), pour éviter une double
notification et des commandes mortes). Conséquence : la survie en
arrière-plan d'une lecture Spotify dépend du **processus WebView** restant
en vie sous les restrictions Android 14 (pas de FGS de type
`mediaPlayback` qui l'ancrerait). C'est **le premier point à observer**
dans le scénario 3 (arrière-plan) ; si un arrêt silencieux est observé sur
votre téléphone, c'est lui — et la correction sera alors ciblée et
validée physiquement.

### Découverte C — porteur des surfaces système Spotify

Pour une piste Spotify, **notification / écran verrouillé / boutons
casque** sont portés par la **MediaSession de la page Spotify dans la
WebView** : les boutons système pilotent directement la page (le vrai
moteur audio), et Melodix **observe** l'état via le pont (UI + cohérence).
Pour les pistes natives (Audius/YouTube), c'est la session Media3 Melodix
qui porte ces surfaces, et les commandes **pilotent le PlayerController**.
Donc « les commandes pilotent le même PlayerController » est **littéralement
vrai pour le porteur natif** ; pour Spotify, les commandes pilotent la page
Spotify (l'audio réel) et Melodix reste cohérent par le bus d'états.
Ce n'est ni un second moteur audio ni un faux état : c'est l'architecture
validée v4–v9, documentée ici pour calibrer les attentes des scénarios 4/5/6.

### Découverte D — pas de focus audio requis nulle part

Aucun `AudioManager.requestAudioFocus` dans le code (ni expo-av). Pour une
interruption (appel), le système coupe l'audio mais l'app ne reçoit
**aucun événement de focus** ; seul `ACTION_AUDIO_BECOMING_NOISY` (débranchement
casque) est capté. Point à observer au scénario 7 (interruption) ; sans
observation réelle sur téléphone, aucune modification n'a été faite.

## 3. Correctif (unique) — `services/mediaBridge.ts`

- `ensureNotificationPermissionRequested()` : helper **unique** de la
  demande (une seule boîte de dialogue pour la vie de l'app, quel que soit
  le porteur audio), non bloquante, tolérante au refus.
- Appel posé sur **les deux chemins** de `projectState` : au premier état
  d'une lecture volontaire **confirmée** (Spotify) comme au premier `playing`
  réel (natif). Zéro changement d'architecture, zéro 2ᵉ session, zéro
  impact audio.
- **3 tests** ajoutés dans `mediaBridgeV9.unit.test.ts` : demande unique à
  la première lecture Spotify confirmée (aucune re-demande aux ticks/pause) ;
  Spotify → native : demande toujours unique + projection Media3 native
  normale ; réponse `null` du natif → nouvelle tentative (comportement
  inchangé).

## 4. Tests automatisés

| Gate                          | Résultat                                                        |
| ----------------------------- | --------------------------------------------------------------- |
| Jest (tous)                   | **1949 passed / 0 failed / 14 skipped** (151 suites) — +3 vs V9 |
| TypeScript (`tsc --noEmit`)   | clean                                                           |
| ESLint                        | clean                                                           |
| Prettier (global, dont `.md`) | clean                                                           |
| CI `android-apk.yml`          | voir section 6 (Jest + Robolectric + build + smoke Android 14)  |

Aucun faux `playing`, aucun mock de lecture : les doubles restent limités
aux frontières (module natif, port Spotify).

## 5. Fichiers modifiés (diff V9 → HEAD)

| Fichier                                                                                                                                                                                                     | Changement                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `services/mediaBridge.ts`                                                                                                                                                                                   | Demande `POST_NOTIFICATIONS` posée sur le chemin Spotify Web (helper unique partagé) |
| `services/__tests__/mediaBridgeV9.unit.test.ts`                                                                                                                                                             | +3 tests (permission : unique, partagée entre porteurs, retry `null`)                |
| `app.config.js`, `package.json`, `__mocks__/expo-constants.ts`, `.github/workflows/android-apk.yml`, `screens/__tests__/SettingsScreen.unit.test.tsx`, `screens/__tests__/SettingsSubScreens.unit.test.tsx` | Version `4.5.0-test.14` / `45014`                                                    |

Aucun fichier Kotlin touché. Aucun test V7/V7.1/V8/V9 supprimé. Aucun
refactor, aucun fallback, aucun délai arbitraire.

## 6. CI / Git / APK

- **Commits** : `5d57be2` (fix + 3 tests) → `ddea597` (version 45014) →
  commit du rapport (HEAD final, ci-dessous). Ancêtre : `dc1fa8c` (V9).
  Branche `arena/fcdae8c6-melodix`, poussée ; **aucun reset/rebase/
  force-push** ; PR non fusionnée.
- **CI** : workflow `android-apk.yml`, run **`37637449913`** (head
  `ddea597`) : **success**. Étapes : TypeScript/ESLint/Prettier, Jest,
  Robolectric, compilation, align 16 Kio + signature V3, aapt `45014` /
  `4.5.0-test.14`, smoke d'installation et de lancement sur émulateur
  Android 14.
- **APK** : `Melodix-v4.5.0-test.14-ddea597.apk` (artefact du run
  `37637449913`) — **celui à installer pour le test physique**.
- **SHA-256 local** : non calculable dans ce sandbox (l'endpoint
  d'artefacts GitHub/blob est inaccessible — `curl: (35) SSL connect
error`) ; téléchargeable directement depuis l'artefact du run.

## 7. Protocole de test physique (à exécuter sur téléphone réel)

**Prérequis** : téléphone Android 12+ (idéal 13/14), APK 45014 (artefact CI
`37637449913`), compte Spotify **Premium** (le Web Player exige Premium),
réglage in-app « Lecture Spotify Web » activé. À tout moment :
**Réglages → Diagnostic technique → « Copier le diagnostic »** copie tout le
journal natif+JS dans le presse-papiers (utile pour rapporter un incident).

1. **Lecture Spotify** : ouvrir Melodix → se connecter à Spotify →
   rechercher → ouvrir 3+ titres différents → Lecture dans la vue Spotify →
   vérifier : étiquette « Pont : prêt », titre/position réels dans l'UI,
   **avancée de la position**, pause/reprise, suivant/précédent, seek,
   changement de piste. _Attendu : jamais de « playing » sans son réel._
2. **Playlist (10 titres)** : charger une playlist Spotify ≥ 10 titres →
   lecture du 1ᵉʳ → 4+ passages auto suivants → vérifier : aucun saut
   arbitraire, aucun `0/N`, aucun essai Audius/YouTube, aucun faux
   `playing`. _Si une piste échoue vraiment : noter titre, ID, état affiché,
   code d'erreur (UI + diagnostic), comportement de la file, replay manuel
   possible ?_
3. **Arrière-plan (scénario clé)** : lecture Spotify en cours → bouton
   **Home** → attendre 2–10 min → vérifier que **le son continue** →
   revenir → état cohérent. Puis : verrouillage/déverrouillage, extinction/
   rallumage de l'écran, 30 min+ d'arrière-plan. _Point de vigilance
   (découverte B) : sans FGS, l'arrêt silencieux viendrait de là — si
   observé, rapporter avec le diagnostic copié._
4. **Notification** : pendant une lecture Spotify réelle → tiroir de
   notifications → **boîte de dialogue POST_NOTIFICATIONS attendue au
   premier Play** (fix de cette mission) → accepter → notification avec
   titre/artiste/pochette/état ; boutons précédent/play-pause/suivant →
   vérifier qu'ils pilotent **la lecture réelle** (page Spotify —
   découverte C).
5. **Écran verrouillé** : depuis l'écran verrouillé uniquement :
   play/pause, suivant, précédent, reprise → état affiché = état réel.
6. **Casque/Bluetooth** : avec casque BT : boutons BT play/pause/suivant/
   précédent ; **débrancher le casque** → pause immédiate (noisy réel) ;
   rebrancher → pas de reprise auto (relire manuellement) ; éteindre/
   rallumer le BT (si faisable).
7. **Interruption** : appel entrant (ou musique d'une autre app) →
   interruption → retour à Melodix → **la piste doit être récupérable,
   jamais « définitivement échouée » ni la file avancée artificiellement**
   (vérifier découverte D : l'app ne reçoit pas de focus-loss — relever
   précisément le comportement observé).
8. **WebView/lifecycle** : arrière-plan → retour (plusieurs fois) ;
   rotation si autorisée ; ouvrir/fermer la vue Spotify plusieurs fois ;
   tuer l'app (geste récents) puis relancer → état restauré, **pas de
   relance automatique** de Spotify (consigne §14) ; si l'overlay affiche
   « reconnexion… »/« échec » → bouton **Recharger** → récupération.

**Règle de lecture des résultats** : chaque scénario = succès/échec + ce qui
s'est réellement passé + extrait du diagnostic. Un seul test physique réussi
ne vaut pas une prétention générale.

## 8. Validation — séparation stricte

**FONCTIONNEL (confirmé dans le code)** : tout le câblage audité en section 2
(manifest, service Media3, routeurs de commandes vers le **même**
PlayerController, noisy, hôte WebView enraciné, confirmation réelle avant
`playing`) ; plus le fix POST_NOTIFICATIONS maintenant posé sur le chemin
Spotify.

**TESTÉ AUTOMATIQUEMENT** : Jest **1949/0/14**, tsc/ESLint/Prettier clean,
CI `37637449913` (TypeScript/ESLint/Prettier, Jest, Robolectric, build,
align 16 Kio + signature V3, aapt 45014, **smoke = APK installée et lancée
sur émulateur Android 14**). L'émulateur ne prouve **rien** sur la lecture
Spotify réelle (pas de compte) — c'est un smoke de lancement.

**TESTÉ PHYSIQUEMENT** : **rien** — ce sandbox n'a ni téléphone, ni
émulateur utilisable (pas de KVM/SDK/Java), ni compte Spotify ; **aucun
résultat physique n'a été simulé ni inventé**.

**NON TESTÉ** : lecture Spotify réelle (tous les scénarios 1–8), connexion
compte, lecture arrière-plan réelle, notification réelle, écran verrouillé,
casque/Bluetooth, interruptions, comportement OEM/batterie.

La lecture Spotify réelle en arrière-plan, les commandes écran verrouillé et
Bluetooth sur appareil physique restent non validées tant qu'aucun téléphone
réel n'a été testé.
