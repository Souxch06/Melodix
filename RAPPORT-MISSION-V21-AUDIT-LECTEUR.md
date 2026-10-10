# RAPPORT MISSION V21 — AUDIT ET FIABILISATION DU LECTEUR SPOTIFY WEB

**Date** : 9 octobre 2026 · **Base** : HEAD `d2430db` (V20 final) ·
**Branche** : `arena/fcdae8c6-melodix` (PR #6, base `main`) ·
**Version** : `4.5.0-test.26 / 45026` (pins workflow synchronisés dans le même
commit que le bump — convention V20)

**Rappel de niveau de preuve (règle absolue de la mission)** : aucun test
physique n'a été effectué dans ce contexte (ni téléphone, ni compte Spotify
autorisé). Tout ce qui suit est inspection + tests automatisés + CI. Les
statuts « TESTÉ PHYSIQUEMENT » restent VIDES et le sont restés.

---

## 1. HEAD départ / final

- **HEAD départ** : `d2430db3799710cea2243df0ff74e36bd73f7efa` (V20 final,
  CI `37896421451` SUCCESS) — local = remote vérifié avant tout travail.
- **HEAD de code final (commit A)** : `c0a9919` (hash complet §6) —
  corrections + tests + docs + bump `4.5.0-test.26/45026` + pins workflow.
- **HEAD final de branche** : le commit contenant la version définitive du
  présent rapport — HEAD local = HEAD remote vérifié après le dernier push.
- **PR #6** : ouverte, **non fusionnée** ; `main` n'a reçu aucune action.

## 2. Fichiers inspectés / modifiés

**Modifiés (18 fichiers dans le commit A — §6)** :

| Fichier                                                                         | Nature du changement                                                                                                                                                                                                                                                                   |
| ------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `services/playbackBackend/spotifyWebFeature.ts`                                 | **Réécrit** : contrat V21 — activation technique = flag seul ; `physicalValidation` exposé comme STATUT (non bloquant) ; consigne UI seule (preuve non vide) ; docs d'audit.                                                                                                           |
| `services/playbackBackend/spotifyWebActivationBootstrap.ts`                     | **Réécrit** : lève uniquement le flag local (idempotent) ; auto-record `PASSED_ON_DEVICE` + constante `SPOTIFY_WEB_PHYSICAL_VALIDATION_EVIDENCE` **supprimés** ; doc honnête (historique v7 + verdict V21).                                                                            |
| `services/playbackBackend/index.ts`                                             | Export `SPOTIFY_WEB_PHYSICAL_VALIDATION_EVIDENCE` retiré.                                                                                                                                                                                                                              |
| `services/playbackBackend/playbackBackendSelection.ts`                          | `PHYSICAL_VALIDATION_BLOCKER` + skip `physical-validation-missing` : code conservé (stabilité de contrat, testé) + docs « HÉRITÉ de v7, inatteignable depuis V21 ».                                                                                                                    |
| `services/player.ts`                                                            | Note V21 commentée sur la branche défensive morte (blocker physique legacy conservé comme garde — zéro changement de logique moteur).                                                                                                                                                  |
| `app/_layout.tsx`, `hooks/usePlaylistResolutions.ts`                            | Commentaires alignés sur le contrat V21.                                                                                                                                                                                                                                               |
| `app/settings/spotify-web-player.tsx`                                           | UI : docstring 3 états, readiness hint, card Lecture (porte technique), card Validation physique (« statut, non bloquant », NOT_TESTED affiché honnêtement), cardNote 3 états. Seuls mécanismes de consigne : boutons Consigner PASSED (preuve non vide exigée) / Repasser NOT_TESTED. |
| `docs/SPOTIFY-WEB-PHYSICAL-TEST.md`                                             | Section « Validation consignée v7 » **remplacée** par le rectificatif V21 (4 faits contradictoires listés, séparation 3 états, décision v7 « pas de repli » inchangée, tableaux de test physique restés VIDES).                                                                        |
| `docs/SPOTIFY-WEB-INTEGRATION-PLAN.md`                                          | Entête statut V21 (plan historique, snapshot `83e646e`).                                                                                                                                                                                                                               |
| `services/playbackBackend/__tests__/spotifyWebFeature.unit.test.ts`             | Réécrit : contrat V21 + garde du câblage production.                                                                                                                                                                                                                                   |
| `services/playbackBackend/__tests__/spotifyWebActivationBootstrap.unit.test.ts` | **NOUVEAU** : 3 régressions (aucune consigne physique au démarrage ; idempotence ; la consigne UI est le seul chemin légitime).                                                                                                                                                        |
| `services/playbackBackend/__tests__/spotifyWebPlaybackIntegration.unit.test.ts` | Mis à jour : openGate = flag seul ; porter fermée → blocker unique `flag-local-desactive` ; skip `feature-disabled`.                                                                                                                                                                   |
| `services/__tests__/playerSpotifyWeb.unit.test.ts`                              | +3 tests V21 (Objectif 4 — §4).                                                                                                                                                                                                                                                        |
| `services/__tests__/playerSpotifyWebPlaylist32V21.unit.test.ts`                 | **NOUVEAU** : 4 tests scénario 32 titres (Objectif 5 — §5). Le fichier v7 `playerSpotifyWebPlaylist32.unit.test.ts` (438 lignes, 7 tests) est **inchangé** et passe.                                                                                                                   |
| `package.json`, `app.config.js`                                                 | Bump `4.5.0-test.26` / `versionCode 45026`.                                                                                                                                                                                                                                            |
| `.github/workflows/android-apk.yml`                                             | Pins `EXPECTED_VERSION_CODE: '45026'` / `EXPECTED_VERSION_NAME: 4.5.0-test.26` — **même commit** que le bump (leçon V20 : run `37891473419`).                                                                                                                                          |

**Inspectés (audit O2/O3/O6, zéro ou note uniquement)** :
`services/player.ts` (2677 L — `trySpotifyWeb` L973+, `playIndex` L1615+,
`onSpotifyWebPublished` L812+), `services/mediaBridge.ts`,
`hooks/usePlaylistResolutions.ts` (135 L — zéro recherche réseau),
`components/Player/SpotifyWebHostView.tsx`,
`services/playbackBackend/spotifyWebPlaybackIntegration.ts`,
`services/spotify/authConfig.ts`, `services/spotify/useSpotifyAuth.ts`,
`services/spotify/apiClient.ts`, `services/spotify/devLog.ts`,
`scripts/smoke-test-android-apk.sh`, rapports V7/V10/V19/V20,
`docs/SPOTIFY-WEB-*.md`.

## 3. Défauts confirmés, corrections, régressions

### D1 — « Validation physique 2026-10-07 » : preuve NON fiable (audit O1)

Fait contradictoire documenté dans le dépôt :

1. Le bootstrap de production (`spotifyWebActivationBootstrap.ts`)
   **consignait automatiquement** `PASSED_ON_DEVICE` au démarrage à partir
   d'une chaîne prédéfinie — sans aucun compte rendu rempli dans le dépôt.
2. `RAPPORT-MISSION-V10-VALIDATION-PHYSIQUE-ANDROID.md` (du même jour,
   build 45014) : « validation physique non exécutable depuis ce sandbox » —
   section « TESTÉ PHYSIQUEMENT » **vide**.
3. `RAPPORT-PRIMIER-TEST-REEL-SPOTIFY.md` (45015) : « le code est prêt pour
   le premier test réel » — soit **non effectué**.
4. La CI citée comme preuve (`37577095621`) = SUCCESS mais head `f821485`
   (v6) — **pré-intégration** du lecteur.

**Correction** : plus aucun auto-record ; le statut repart à `NOT_TESTED`
(honnête) ; la consigne ne peut plus passer que par l'UI (Réglages → Lecture
Spotify Web) avec preuve non vide exigée. La fonctionnalité n'a PAS été
désactivée : elle est activée TECHNIQUEMENT (flag levé en production) avec
le statut physique affiché honnêtement « non vérifiée sur appareil ».

### D2 — La validation physique bloquait l'activation (double verrou v7)

`resolveSpotifyWebPlaybackActivation()` refusait l'activation tant que la
validation physique n'était pas consignée — avec le D1, seule la chaîne
prédéfinie (non prouvée) pouvait lever la porte.

**Correction** : séparation en 3 états (Objectif 1) :

1. **ACTIVATION TECHNIQUE** — le flag local décide si le moteur est autorisé
   à ESSAYER Spotify Web (configuration ; testée auto + CI).
2. **VALIDATION PHYSIQUE** — statut affiché, **non bloquant** (`NOT_TESTED`
   par défaut) ; elle informe, n'active ni n'interdit rien.
3. **CONFIRMATION RÉELLE DE LECTURE** — seul un état `playing` PUBLIÉ par la
   page Spotify (bonne piste, bonne session) autorise un `playing` moteur.
   Ni le flag, ni la validation physique, ni une commande `play` ne le font.

**Régressions** : 3 suites de tests (2 réécrites, 1 nouvelle — §2) = 57/57
passés (exécution locale, chiffres finaux §4).

### Audit O2/O3 — chemin de lecture (14 cas) : AUCUN défaut démontré

Les 14 cas de la mission sont couverts par le design existant (V7–V20),
vérifié par inspection + tests :

| Cas                                | Comportement constaté (code + tests)                                                                                                                                                                                                |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Post-sélection                     | `playIndex` invalide la session Spotify en vol, émet `resolving` + reset position/durée/provider.                                                                                                                                   |
| Post-geste                         | Intention manuelle consommée par piste ; la vue s'ouvre ; rien d'autre ne la déclenche.                                                                                                                                             |
| Handshake non prêt                 | Grace bornée (poll 100 ms) puis vraie erreur structurée (`spotify-web-engine-not-ready`).                                                                                                                                           |
| Navigation pendant commande        | F2/F5 (V20) : `load` idempotent via `getURL()`, clôture de session synchrone — testé.                                                                                                                                               |
| Document détruit / rechargé        | Dead document ne ressuscite rien ; état final honnête (`host-unmounted` / codes pont) — testé.                                                                                                                                      |
| Piste introuvable / illisible      | `confirmation-timeout` après la fenêtre 20 s — **honnête mais sans code dédié** `track-unavailable` : limitation documentée (§8).                                                                                                   |
| Timeout                            | `confirmation-timeout` → VRAIE erreur Spotify Web (notice avec code), jamais `playing`, jamais de repli.                                                                                                                            |
| Pause / reprise                    | Commandes port ; l'état suit les PUBLICATIONS de la page, pas la commande (test L645).                                                                                                                                              |
| Next / previous                    | Commandes port ; vue rouverte si masquée (test L414).                                                                                                                                                                               |
| Changement rapide                  | `playToken` invalide l'essai en vol ; identité F3 (trackId exact) — testé (V20 + V21 N5).                                                                                                                                           |
| Commandes retardées / désordonnées | Corrélation session/séquence au transport (V20) — testé.                                                                                                                                                                            |
| Fermeture / remontage WebView      | État final à l'unmount ; ré-enregistrement propre ; re-mount re-adopté uniquement sur `playing` publié à l'identité exacte.                                                                                                         |
| Désactivation moteur               | Gate = flag seul (V21) → `spotify-web-disabled` immédiat, pas d'attente (tests feature + integration).                                                                                                                              |
| Retour autre source                | Pause best-effort de la page AVANT création du Sound natif (`priorSpotifyActive`) — test L446 ; mediaBridge : session native STOPPÉE pour une source Spotify Web (pas de 2ᵉ notification), ré-activée au retour (test mediaBridge). |

**Politique sources (Objectif 3) — conforme v7, aucun défaut démontré, zéro
changement** :

- Piste Spotify → Spotify Web **seul** : jamais de relais Audius/YouTube,
  jamais de `provider.resolveMatch` sur ces pistes (asserté dans les 4 tests
  playlist V21 + 25 tests player existants).
- Pas de 2 moteurs simultanés : une seule MediaSession active à la fois
  (WebView ou native, jamais les deux) ; `mockCreatedSounds` = 0 sur tout
  parcours Spotify (asserté).
- Pas de confirmation tardive mal attribuée : garde d'identité
  (`published.trackId === active.spotifyId` ou adoption sur `current` exact)
  — testée (V20 F3 + V21 N3 + playlist « état tardif »).
- `play()` ≠ `playing` : contrat moteur durci par le test V21 N2.
- Codes transitoires v9 (perte d'infrastructure) : le moteur RESTE sur la
  piste (erreur honnête), retry au prochain PLAY explicite — testé (V21
  playlist, titre 5).
- Audius/YouTube conservés pour les pistes non-Spotify (cascade intacte).
- `nextEngineAfterSpotifyWebFailure` : export mort (non consommé par le
  moteur — la cascade est dans le moteur) mais testé ; **conservé** pour la
  stabilité du contrat de module, documenté.

## 4. Tests renforcés (Objectif 4) — résultats EXACTS

**Nouveaux tests moteurs** (`services/__tests__/playerSpotifyWeb.unit.test.ts`,
+3, suite 25 → 28) :

1. « commande play ACCEPTÉE ne produit JAMAIS seule un `playing` moteur » —
   essai en vol (`resolving`) + `sendCommand('play')` accepté + publication
   `loading` → jamais `playing` ; fenêtre expirée sans `playing` publié →
   vraie erreur, arrêt propre, **0** ligne `playback-confirmed`.
2. « état playing TARDIF de l'ancienne piste (A) ne valide jamais la piste
   courante (B) » — B confirmé ; publication `playing` tardive de A →
   ignorée, B intact (position/durée/identité).
3. « changement Spotify A → B : l'essai tardif d'A ne confirme rien, B seul
   joue » — essai d'A en vol pendant que l'utilisateur passe sur B ; verdict
   tardif « confirmé » d'A = obsolète ; **une seule** ligne
   `playback-confirmed` (celle de B) ; **0** Sound expo-av.

> Note de rigueur : ces tests démasquent un artefact de harness (un espion
> `console.log` non restauré par un test en échec fait **partager** le
> tableau `mock.calls` par jest aux espions suivants — le 2ᵉ test comptait
> alors une ligne d'un test précédent). Correction propre : les 2 tests qui
> comptent des lignes appellent `mockSpy.mockClear()` après création de
> l'espion (comptage isolé au test courant) — documenté dans le code.
> Aucun seuil/timeout n'a été modifié pour du vert.

**Résultats EXACTS (exécution locale, HEAD `c0a919`… cf. §6)** :

| Gate                                                                | Résultat                                                        |
| ------------------------------------------------------------------- | --------------------------------------------------------------- |
| `npx tsc --noEmit`                                                  | **exit 0** (0 erreur)                                           |
| ESLint (11 fichiers modifiés/nouveaux)                              | **exit 0** (0 problème)                                         |
| Prettier (`npm run prettier:check` — périmètre CI `ts,tsx,json,md`) | **All matched files use Prettier code style!**                  |
| `git diff --check`                                                  | OK (0 erreur whitespace)                                        |
| **Jest COMPLET**                                                    | **2080 passés / 14 ignorés / 2094 total — 155 suites** (≈ 80 s) |

Baseline V20 : 2069 passés / 14 ignorés / 2083 total (154 suites) →
**+11 tests** (3 moteurs + 4 playlist V21 + 4 tests du contrat O1 réécrits
/ réorganisés), **0 échec**, 0 test supprimé. Les 7 tests v7 du fichier
`playerSpotifyWebPlaylist32.unit.test.ts` passent **inchangés** contre les
modifications V21 (dont « moteur désactivé (porte fermée) : vraie erreur
immédiate »).

## 5. Playlist 32 titres (Objectif 5) — simulation de scénario

**NIVEAU DE PREUVE (impératif de la mission, inscrit en tête du fichier de
test)** :

- Niveau 1 = **CE TEST** : simulation de scénario — le moteur tourne pour de
  vrai (file, avancement, identité, erreurs) mais le port Spotify Web est un
  DOUBLE piloté : ni page, ni WebView, ni compte, ni audio.
- Niveau 2 = test du moteur réel (transport/hôte) — existant (V17–V20).
- Niveau 3 = **lecture RÉELLE confirmée sur téléphone — NON EFFECTUÉ.**

4 tests (`services/__tests__/playerSpotifyWebPlaylist32V21.unit.test.ts`,
**4/4 passés**) :

1. **32 titres, ordre exact** : les 32, une fois chacun, dans l'ordre
   (unicité des ids, aucune mal-attribution : `resolved.sourceId` = identité
   exacte de la piste courante à chaque étape) ; 32 lignes
   `playback-confirmed` ; `resolveMatch` **jamais** appelé ; 0 Sound expo-av.
2. **Erreur en milieu de file (titre 17)** : `confirmation-timeout` (code
   honnête — ex. piste non lisible côté page) → vraie erreur affichée, la
   file avance d'elle-même sur 18 ; 31 titres lus dans l'ordre ; t17 absent
   ; **aucun** repli Audius/YouTube (asserté).
3. **Perte d'infrastructure transitoire (titre 5)** : `bridge-unavailable`
   → la file **NE SAUTE PAS** (moteur reste sur t5, erreur honnête,
   `resolved` null) ; PLAY explicite → la **même** piste est retentée et
   confirmée ; les 32 titres dans l'ordre, t5 une seule fois.
4. **État publié TARDIF en cours de file** : publication `playing` de t1
   pendant que t2 joue → ignorée (identité), position/durée de t2 intactes.

## 6. Livraison (Objectif 7)

- **Commits de la mission** (sur `arena/fcdae8c6-melodix`) :
  - `c0a9919` — **HEAD de code final** : correction O1 (3 états) + tests O4
    (+3 moteurs, +4 playlist, 2 suites réécrites, 1 nouvelle) + docs + bump
    `4.5.0-test.26/45026` + pins workflow synchronisés — 18 fichiers,
    +986/−186.
  - (dernier commit) — version définitive du présent rapport.
- **Hash complet du HEAD de code final** :
  `c0a9919026023feb2171d639b005141fa7017b0d` (préfixe `c0a9919`).

## 7. CI (honnête, runs identifiées)

- **RUN PRODUCTRICE / FINALE : `37914503981` (commit `c0a9919`) — SUCCESS**
  (~14 min) — **toutes les steps passées** : TypeScript/ESLint/Prettier,
  Jest (suite complète), Robolectric (module média), Gradle + compilation
  APK, alignement 16 KiB + signature, **vérification intégrité/
  installabilité/signature de l'APK** (versionCode **`45026`** / versionName
  **`4.5.0-test.26`** — pins synchronisés dans le même commit que le bump,
  plus d'incident type `37891473419`), **installation ET lancement réel de
  l'APK sur émulateur Android 14** (smoke — section hôte de production :
  host-mounted, handshake, aucun faux `playback-confirmed` sans compte),
  publication de l'artifact + release de test.
- **Lien APK** : `Melodix-v4.5.0-test.26-c0a9919.apk` (44 MiB) — artifact
  de la run `37914503981` :
  <https://github.com/Souxch06/Melodix/actions/runs/37914503981> (onglet
  « Artifacts »).
- La run du dernier commit de la branche (rapport) re-valide le code ;
  elle est identifiée dans les checks de la PR #6.
- Run V20 de référence : `37896421451` (HEAD `d2430db`) — SUCCESS.

## 8. Statuts séparés (honnêtes — jamais « fonctionnel » par déduction)

| Élément                                            | Statut                                                                                                                                                                                                                                                    |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Lecture physique** (audio réel sur téléphone)    | **NON TESTÉ** — pas de téléphone dans ce contexte. Le chemin est testé AUTOMATIQUEMENT (contrats moteur/hôte/transport) ; l'état `playing` n'est émis que sur publication réelle de la page (protection anti-faux `playing` conservée, jamais supprimée). |
| **Arrière-plan** (audio en background)             | **NON TESTÉ sur téléphone.** Le code existe (AudioMode, MediaSession de la WebView) et est couvert en test auto ; rien ne le déclare « fonctionnel ».                                                                                                     |
| **Écran verrouillé** (MediaSession / notification) | **NON TESTÉ sur téléphone.** Mêmes réserves.                                                                                                                                                                                                              |
| **Bluetooth** (transfert de contrôles)             | **NON TESTÉ sur téléphone.** Mêmes réserves.                                                                                                                                                                                                              |
| **403 connexion**                                  | Diagnostic §9 — **non tranchable sans compte Spotify autorisé** (pas de test physique effectué).                                                                                                                                                          |

## 9. Diagnostic 403 (Objectif 6)

**Revue non destructive du diagnostic V19 + du code actuel** (pas de
re-audit token/PKCE/SecureStore — aucun nouvel indice ; pas de changement du
flux OAuth — aucun défaut concret identifié) :

1. **Observations V19 conservées** : 403 `/v1/me` à corps **non JSON /
   vide**, `server: envoy` + `Via: HTTP/2 edgeproxy, 1.1 google` →
   signature d'un rejet au **edge Spotify** (identique sur les réponses
   normales), pas d'un 403 JSON d'API.
2. **Preuves externes (V18/V19)** : (a) apps **dev-mode** : 403 pour les
   comptes absents de « Users and Access » du dashboard (ajout du compte →
   200 sur `/v1/me`) ; (b) 403 **intermittents** backend documentés (même
   requête + même token : 200 puis 403, « Usually retrying makes the error
   go away, sometimes 4+ attempts ») ; (c) variante « User not approved for
   app » en **JSON** — NON observée ici (donc pas la cause définitive
   connue).
3. **Code actuel vérifié (V21, non destructif)** : PKCE S256 via
   expo-auth-session (inchangé) ; **aucun champ Client ID utilisateur**
   (non réintroduit — le Client ID n'est lu qu'au build :
   `EXPO_PUBLIC_SPOTIFY_CLIENT_ID` / `app.config.js` extra) ; redirect
   `melodix://callback` inchangé ; 401 = **1** refresh (RAE) + **1** retry ;
   403 edge sans message = **2 retries bornées** (backoff 1,5 s / 3 s) avec
   `attempts` remonté au diagnostic ; diagnostic 403 = en-têtes
   **allowlistés non sensibles** uniquement ; **403 ≠ succès** (jamais) ;
   `/v1/me` jamais contourné ; aucun secret dans les logs (whitelist devLog).
4. **Ce qui manque pour trancher** : un **compte développeur Spotify** avec
   le compte de test ajouté à « **Users and Access** » (dev-mode) — ou un
   compte Premium utilisé sur un vrai appareil autorisé par l'app.
   **Indisponible dans ce contexte.** Statut : **en attente de vérification
   sur appareil avec compte autorisé** — rien d'autre n'est asserté.
5. **Vérification non destructive (déjà en place, conservée)** : la smoke CI
   (section hôte de production, émulateur Android 14) exécute l'app SANS
   compte et asserte le comportement de l'écran de diagnostic — elle ne
   nécessite aucun secret et ne simule aucune connexion.

## 10. Limites + prochaines actions

**Limites (honnêtes)** :

- Piste introuvable / illisible (404 côté page) : se manifeste comme
  `confirmation-timeout` après la fenêtre de 20 s — comportement honnête
  (vraie erreur, avancement) mais **sans code dédié** `track-unavailable`
  (la page ne le publie pas explicitement dans le contrat actuel).
- Lecture physique, arrière-plan, écran verrouillé, Bluetooth : **NON
  TESTÉS** (pas de téléphone) — les statuts du §8 sont les seuls valables.
- Lecture réelle des 32 titres : **NON EFFECTUÉE** (le test de §5 est une
  simulation de scénario, jamais présentée comme preuve d'écoute).
- 403 : non tranchable sans compte autorisé (§9).

**Prochaines actions (exigeant un téléphone / un compte — hors sandbox)** :

1. Test physique sur téléphone avec compte Spotify autorisé : remplir
   `docs/SPOTIFY-WEB-PHYSICAL-TEST.md` (tableaux VIDES) + consigner via
   l'UI (Réglages → Lecture Spotify Web) la validation PASSED avec preuve.
2. Diagnostic 403 côté dashboard Spotify : vérifier le mode de l'app
   (dev-mode ?) et « Users and Access » du compte de test.
3. Écoute réelle des 32 titres (niveau 3) puis consignation.
4. Si l'écoute réelle confirme : considérer un code `track-unavailable`
   dédié dans le contrat de publication de la page (aujourd'hui
   `confirmation-timeout` est le code honnête).

## 11. Confirmations mission

- **`main` non modifié** : aucun commit, tag ni push sur `main` ; tout le
  travail est sur `arena/fcdae8c6-melodix`.
- **PR #6 non fusionnée** : ouverte, en attente — aucune action de merge.
- **Aucun test flaky supprimé** : les 2 « échecs » rencontrés pendant le
  développement (comptage de lignes) étaient un artefact de harness
  identifié (espion partagé) — corrigé proprement (§4, note de rigueur),
  pas masqué.
- **Aucune prétention de téléphone réel** ; aucun « lecteur totalement
  fonctionnel » : Jest/CI verts ≠ lecture testée.
- **Protections anti-faux `playing`** (V17–V20) : toutes conservées, aucune
  supprimée ni contournée.
