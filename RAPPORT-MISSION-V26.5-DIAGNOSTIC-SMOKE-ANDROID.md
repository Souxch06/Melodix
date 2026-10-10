# RAPPORT MISSION V26.5 — Diagnostic post-fusion PR #7 et correction du smoke test Android

> **Synthèse** : l'échec du run `38059652388` (étape « Installer et lancer
> réellement l'APK sur Android 14 », exit 1) **n'est pas une régression produit
> et n'est pas causé par le `bridge_timeout` affiché en fin de log**. Cause
> démontrée : le sondage UI de l'écran de diagnostic du prototype Spotify Web a
> expiré (16 dumps × 5 s ≈ 121 s mesurés) sur un runner lent, alors que le build
> testé était **identique au bit près** à celui du run vert `38057481568`
> (33 minutes plus tôt). Correction **limitée au harnais CI**
> (`scripts/smoke-test-android-apk.sh`) : fenêtre portée à 24 itérations
> (~180 s, toujours bornée, assertion inchangée), échecs de dump comptabilisés
> au lieu d'être avalés, et preuve exploitable imprimée avant chaque échec.
> **Verdict : corrigé et validé en CI sur le commit corrigé** — mais la lecture
> Spotify Web sur téléphone réel reste **non validée** (jamais testée
> physiquement ; voir §8).

---

## 1. Branche de départ et SHA de référence

| Champ                              | Valeur                                                                                                                                                                                                                                                     |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dépôt                              | `Souxch06/Melodix`                                                                                                                                                                                                                                         |
| Branche de référence de la mission | `arena/fcdae8c6-melodix` (branche de travail de la PR #6) — SHA distant `e30461ac3f37ff6874da1bee3380ee408e764c2e` à l'ouverture de la mission                                                                                                             |
| Branche de cette conversation      | `arena/9dadfbee-melodix`, **partie exactement de `e30461a`** (HEAD du dépôt local = SHA demandé par la mission ; vérifié `git ls-remote` + `merge-base --is-ancestor`)                                                                                     |
| PR #7                              | **MERGED** le 2026-10-10T14:27:02Z dans `arena/fcdae8c6-melodix` (merge par rebase : `e30461a` est le commit unique de la PR, parent `557d8f7` ; arbre strictement identique à celui de `46e6650`, head de `arena/95205ecf-melodix` : les deux `d2907e0f`) |
| PR #6                              | **OPEN**, base `main`, head `arena/fcdae8c6-melodix` @ `e30461a` — **non fusionnée**, jamais touchée par cette mission                                                                                                                                     |
| `main`                             | `fceab85950b069edcb65ed718a8ffd419a1bc785` — **non modifiée** (aucune écriture, re-vérifiée via `ls-remote` le 2026-10-10)                                                                                                                                 |
| Rapport V26 après fusion PR #7     | `RAPPORT-MISSION-V26-DIAGNOSTIC-SPOTIFY.md` **présent** au HEAD `e30461a` (c'est le fichier que la PR #7 a apporté/mis à jour)                                                                                                                             |
| Workspace au démarrage             | clone **superficiel (depth 1)** — historique re-fetché (`--unshallow` + refs de toutes les branches) pour rendre l'audit possible ; **aucun travail local perdu, aucune réinitialisation**                                                                 |

Étape 0 de la mission : **réussie**. La branche part bien du dernier état de
`arena/fcdae8c6-melodix` après intégration de la PR #7 (HEAD `e30461a` == tip
distant de la branche de référence). Le fait que `e30461a` soit à la fois le
parent attendu du merge PR #6 et le « merge commit » rapporté par GitHub
s'explique par le mode de fusion (rebase → le commit de la PR devient le tip).

## 2. Branche finale et SHA du commit

| Commit          | SHA                                                                   | Contenu                                                                                    |
| --------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Point de départ | `e30461ac3f37ff6874da1bee3380ee408e764c2e`                            | HEAD de `arena/fcdae8c6-melodix` après PR #7 (documentation V26.3 uniquement vs `557d8f7`) |
| V26.5 (fix)     | `d8dbc7adbd92d40d00aec7a0d0270f1b21f82d07`                            | `fix(ci)` — un seul fichier : `scripts/smoke-test-android-apk.sh` (+45 −7)                 |
| V26.5 (rapport) | ce commit (documentation seule, poussée après lecture du résultat CI) | `RAPPORT-MISSION-V26.5-DIAGNOSTIC-SMOKE-ANDROID.md`                                        |

Branche finale : `arena/9dadfbee-melodix`. PR de validation : **#8**
(head `arena/9dadfbee-melodix` → base `arena/fcdae8c6-melodix`), **ouverte, non
fusionnée** — créée pour déclencher le run `pull_request` complet sur le commit
corrigé (le sandbox ne peut pas `workflow_dispatch` : le token GitHub de
l'intégration n'a pas `actions: write`, HTTP 403 ; le trigger `pull_request`
est exactement celui des runs étudiés).

## 3. Cause exacte de l'échec — preuves (logs complets du run `38059652388`)

Le run (job « Construire l'APK », 14:27:10→14:44:17 UTC, ~17 min) a réussi les
20 premières étapes (config Spotify validée, Jest 2143, Robolectric,
`assembleRelease`, alignement 16 Kio, signature V3, intégrité/sha256 de l'APK
`Melodix-v4.5.0-test.30-e30461a.apk`, 89 Mo, `APK_VALID=true`). L'échec est
dans l'étape 21 (283 s), l'émulateur Android 14 (`api-level 34`, `x86_64`,
`google_apis`, `pixel_2`, 2 cœurs, swiftshader, boot 51,5 s < timeout 600 s).

Chronologie exacte du script dans le log :

| Horodatage        | Événement (ligne de log)                                                                                                                         | Verdict                           |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------- |
| 14:41:32 / :44    | `adb install --no-streaming` : « Success » deux fois (installation propre + `-r`)                                                                | OK                                |
| 14:41:48          | `am start -W MainActivity` : `Status: ok`, `LaunchState: COLD`, `TotalTime: 2800`                                                                | OK                                |
| 14:41:56          | processus vivant `pid=4281` ; deep link warm `melodix://callback` : `Status: ok`                                                                 | OK                                |
| 14:42:02          | `host-mounted` confirmé en logcat (hôte de production monté)                                                                                     | OK                                |
| 14:42:07          | `::warning handshake non prêt (codes: bridge_timeout)` + `::warning aucun bridge-state`                                                          | **warning non bloquant, attendu** |
| 14:42:07.7        | deep link `melodix://settings/spotify-web-diagnostic` livré à la top-most instance (`Status: ok`)                                                | OK                                |
| 14:42:07→14:44:08 | boucle de sondage : 16 × (sleep 5 + `uiautomator dump` + `cat` + grep « Prototype Spotify Web ») ≈ 121 s mesurés, texte jamais trouvé            | **expiration**                    |
| 14:44:08.6        | `##[error] écran de diagnostic Spotify Web absent après deep link (16 dumps)` puis `##[error] The process '/usr/bin/sh' failed with exit code 1` | **échec du step**                 |

Points prouvés par les logs (API `check-runs/114235129578/annotations` + log
complet) :

1. **Le message final cité dans l'énoncé de la mission est une fausse piste.**
   « handshake non prêt (codes: bridge_timeout) — aucune capacité de lecture
   revendiquée » est émis en `::warning` par la section « hôte de production »
   du smoke, et **ce warning figure à l'identique dans les runs verts**
   `38051128062` (557d8f7) et `38057481568` (46e6650) — c'est le comportement
   honnête attendu sans compte Spotify en CI (la section 2 du script l'accepte
   explicitement : « Attendu sans compte »). Le bridge n'a donc « jamais été »
   la cause de l'exit 1.
2. **L'émulateur n'était pas en cause au sens « pas prêt »** : boot 51,5 s,
   installations réussies dès le 1ᵉʳ essai (pas d'OOM), lancement confirmé,
   processus vivant (`pid=4281` présent y compris après le deep link warm),
   `host-mounted` observé. Aucun timeout de boot, aucun crash.
3. **L'échec vient de la fenêtre du sondage UI** de l'écran de diagnostic du
   prototype (`app/settings/spotify-web-diagnostic.tsx` → route expo-router
   rendue côté JS, livrée par `onNewIntent` à l'instance déjà top-most) :
   la navigation JS n'a pas atteint l'écran dans les ~121 s de la fenêtre
   (16 itérations). Sur ce runner, le thread JS est affamé par la charge
   simultannée : Hermes au cold start + WebView Chromium hors écran de
   `open.spotify.com` (montée par l'hôte de production, en chargement/reconnexion
   avec GPU logiciel swiftshader sur 2 cœurs).
4. **Ce n'est pas une régression introduite par la PR #7** : l'arbre git du
   commit testé `e30461a` est `d2907e0fda680a84b052129cd8d1d92ede41ef42`,
   STRICTEMENT identique à celui de `46e6650` (run succès 33 min plus tôt, sur
   le même workflow et le même émulateur) ; la fusion n'a modifié que le rapport
   Markdown (+53 −32 sur un seul fichier). Le workflow `pull_request` qui a
   échoué est celui déclenché par la mise à jour du head de la PR #6.
5. **Famille d'incidents connue** : le commentaire du script documente déjà un
   précédent identique — run `37810103366` où la fenêtre de 60 s avait expiré
   pour la même raison (« faux négatif classique sur émulateur CI lent »),
   portant la fenêtre à 80 s en V17. Le run `38059652388` dépasse 80 s sur un
   runner plus chargé : même mécanisme, troisième occurrence.
6. **Défaut d'observabilité du harness** : dans la boucle, les éventuels échecs
   de `uiautomator dump` (« ERROR: could not get idle state. ») étaient redirigés
   vers `/dev/null` avec `continue` muet, et le message « (16 dumps) » comptait
   des **itérations**, pas des dumps réussis — impossible, dans le log du run
   échoué, de distinguer « écran jamais rendu » de « dumps tous aveugles ». Le
   chemin d'échec n'imprimait aucune preuve (contrairement aux autres `fail()`
   du même script qui vident `logcat -d | tail -300`). Le timing (121 s pour
   16 itérations ≈ 7,6 s/itération, soit le coût d'un dump qui aboutit) indique
   que les dumps réussissaient et que la navigation était simplement en retard,
   mais rien dans le log ne le prouvait — l'exigence « logs exploitables en cas
   d'échec » n'était pas remplie.

Ce qui reste écarté par les preuves : problème de démarrage de l'émulateur,
failure d'installation (mémoire), bridge WebView cassé (le `bridge_timeout` est
un verdict volontaire et toléré), crash de l'app, et régression de la fusion
#7. Ce qui n'est PAS démontré par ces logs et le devient par la correction :
la nature exacte (retard vs dumps aveugles) au prochain incident — le nouveau
bloc « diag » le tranchera lui-même.

## 4. Fichiers modifiés et justification

**Un seul fichier de code, harnais CI exclusivement** (règle « aucune
correction risquée sans preuve » et « ne pas changer le comportement du
produit pour faire passer la CI ») :

- `scripts/smoke-test-android-apk.sh` (+45 −7) :
  1. **Fenêtre de sondage 16 → 24 itérations** (~80 s → ~180 s de wall-clock,
     sleep 5 s par itération inchangé). Justification : délai de démarrage
     trop court mesuré (121 s constatés sans écran rendu, alors que le même
     binaire a rendu l'écran sur un runner moins chargé 33 min plus tôt) ;
     c'est la correction du défaut réel (attente), pas un assouplissement :
     la fenêtre reste **bornée** et l'assertion reste **l'écran doit EXISTER**,
     sinon `fail()`.
  2. **Détection de disponibilité durcie** : les échecs de dump ne sont plus
     avalés en `/dev/null` ; compteurs `dumps réussis`/`dumps en échec` séparés
     ; dernier message d'erreur `uiautomator` conservé (160 car.) et reporté
     dans le texte du `fail()`. Justification : lever l'ambiguïté « (16 dumps) »
     et rendre le test auto-explicatif.
  3. **Preuve imprimée avant l'échec** : lignes « diag » (compteurs, fenêtre
     focalisée `mCurrentFocus`/`mFocusedApp`, `pidof`, textes visibles du
     dernier dump réussi, fin de fil `[MelodixSpotifyWeb]`). Justification :
     exigence mission « logs exploitables en cas d'échec » ; même pattern que
     les chemins d'échec existants du script, sans rien masquer.
  4. Commentaires de traçabilité (run `38059652388`, comparaison `46e6650`,
     précédent `37810103366`) — documentent la règle appliquée.

**Aucun autre fichier modifié** par la correction : zéro changement de code
applicable (SPA/React, services Spotify/Audius/YouTube, bridge, manifest,
Gradle), zéro changement de workflow, zéro changement de test, zéro secret,
zéro retouche d'attente ailleurs. La PR #7 et la PR #6 restent telles quelles.

## 5. Tests et validations réellement exécutés

### Local (sandbox — mêmes commandes que les portes CI)

| Porte                                                      | Résultat                                                                                                                                                                                                                                                                                     |
| ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `sh -n` + `/bin/dash -n` sur le script modifié             | OK (POSIX, pas de dépendance bash)                                                                                                                                                                                                                                                           |
| `npx tsc --noEmit`                                         | 0 erreur                                                                                                                                                                                                                                                                                     |
| `npm run lint` (`expo lint` → eslint)                      | exit 0, 0 erreur                                                                                                                                                                                                                                                                             |
| `npm run prettier:check`                                   | « All matched files use Prettier code style! »                                                                                                                                                                                                                                               |
| `git diff --check`                                         | 0                                                                                                                                                                                                                                                                                            |
| `npm test -- --runInBand` (env Spotify vides, comme la CI) | **158 suites passées / 14 suites sautées / 2143 tests passés / 14 sautés / 0 échec** — baseline V26 exactement préservée ; les régressions 500/503/timeout (`services/spotify/__tests__/apiClient.unit.test.ts`, incl. « timeout (fetch qui pend) → abort à 10 s ») sont dans le lot et PASS |

### Ce que le sandbox ne peut PAS faire et qui est donc délégué à la CI

- Robolectric (`Tests Kotlin du module média`), `expo prebuild`, `assembleRelease`,
  signature/alignement : impossibles localement (pas d'Android SDK/Gradle
  configurés ici) → couverts par le run CI ci-dessous.
- **Émulateur Android 14** : pas de `/dev/kvm` ni d'émulateur dans le sandbox →
  le smoke complet du script modifié est exécuté par le run CI (seul endroit où
  `scripts/smoke-test-android-apk.sh` tourne réellement).

### CI — run de validation du commit corrigé

| Champ                                                 | Valeur                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Run                                                   | `38063512026` — <https://github.com/Souxch06/Melodix/actions/runs/38063512026>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Déclencheur                                           | `pull_request` (PR #8, base `arena/fcdae8c6-melodix`, head `arena/9dadfbee-melodix` @ `d8dbc7a`) — workflow `APK Android`, `workflow_dispatch` impossible depuis le sandbox (token d'intégration sans `actions: write`, HTTP 403)                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Conclusion                                            | **success** — job `114246380894`, 15:25:00 → 15:37:37 UTC (~12 min 37 s), vérifiée via l'API `runs/38063512026`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Étapes 1–20                                           | success : config Spotify déterministe (redirect canonique `melodix://callback`, Client ID 32 hex non affiché), tsc/eslint/prettier, Jest complet, Robolectric `:melodix-media:testDebugUnitTest`, `assembleRelease`, alignement 16 Kio + signature V3 (`fac617…33b9c`), intégrité + sha256 + schéma `melodix` dans le manifest                                                                                                                                                                                                                                                                                                                                |
| Étape 21 (smoke ÉMULATEUR ANDROID 14, script corrigé) | **success en 199 s** (vs 283 s au run échoué) : double installation « Success », lancement `Status: ok`, hôte de production `host-mounted`, `bridge_timeout` en warning honnête, écran de diagnostic trouvé par le sondage (fenêtre 24 non atteinte), prototype survivant au cycle arrière-plan/retour, FGS + MediaSession + notification `melodix_media`, deep-link OAuth A/B ordonnés, aucun faux `playback-confirmed`, notice finale « installation + HÔTE Spotify Web production + prototype WebView + cycle arrière-plan/retour + service foreground + MediaSession + notification + deep-link OAuth (A et B) réussis sur Android 14 x86_64 (pid=6327) » |
| Étape 22 (Diagnostic OAuth build-level)               | success (2 s)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Artefact                                              | `Melodix-v4.5.0-test.30-d8dbc7a.apk` — 47 051 116 o, non expiré                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Release                                               | **Aucune publiée** (`publish_test_apk=false` ; garde de branche de publication intacte, `main` jamais concernée)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

Runs de comparaison cités par la mission (mêmes artefacts, même workflow) :

| Run           | Commit    | Étape 21           | Résultat                                                                             |
| ------------- | --------- | ------------------ | ------------------------------------------------------------------------------------ |
| `38051128062` | `557d8f7` | success, 219 s     | vert — avec déjà le warning `bridge_timeout`                                         |
| `38057481568` | `46e6650` | success, 242 s     | vert — arbre **identique** à celui du run échoué                                     |
| `38059652388` | `e30461a` | failure, 283 s     | rouge — erreur « écran de diagnostic Spotify Web absent après deep link (16 dumps) » |
| `38063512026` | `d8dbc7a` | success, **199 s** | vert — harnais corrigé, assertions et warning honnêtes préservés                     |

## 6. Marge de sécurité de la fenêtre

Budget step 21 mesuré sur le run vert le plus lent connu avant correctif :
242 s dont ~180 s utiles. Après correctif, pire cas du sondage : 24 × (5 s +
~10 s de dump lent) ≈ 360 s, job `timeout-minutes: 60` (run complet ~17 min).
Aucun risque d'atteindre le timeout du job ; aucune autre étape n'est modifiée.

## 7. Ce que la correction NE prétend pas faire

- Elle **ne désactive pas** le smoke test et ne transforme aucun échec en
  succès : le `fail()` reste déclenché si l'écran n'apparaît jamais ; les
  diagnostics ajoutés ne font que documenter l'échec.
- Le `bridge_timeout` reste un **warning honnête** (comportement sans compte),
  comme les tests de capacité qui continuent de déclarer « aucune capacité de
  lecture revendiquée ». Ces diagnostics ne sont pas supprimés.
- La chaîne de garde-fous Spotify Web (expérimental, désactivé par défaut,
  aucun faux `playing`, `playback-confirmed` interdit en CI) est inchangée ;
  la cascade Audius → YouTube est inchangée ; la saisie manuelle du Client ID
  reste absente ; aucun secret n'est ajouté.

## 8. Limites restantes

1. **Aucun test physique sur un vrai téléphone** : le sandbox n'a ni appareil,
   ni adb, ni compte Spotify. Le smoke sur émulateur Android 14 prouve le
   montage/wiring, pas une lecture Spotify Web réelle — l'émulateur ne prouve
   pas le comportement sur Samsung Galaxy S24 (recommandation des missions
   précédentes, inchangée).
2. **La cause « thread JS affamé » est inférée** (timing + identité bit-à-bit
   avec le run vert + précédent documenté V17) ; elle n'est pas observée
   directement dans le log du run échoué — c'est précisément le défaut
   d'observabilité que le bloc « diag » corrige pour la prochaine occurrence.
   Si un futur run échoué montrait une navigation jamais livrée (fenêtre
   focalisée ≠ écran attendu malgré dumps réussis et app vivante bien au-delà
   de la fenêtre), la cause serait alors un vrai défaut de routing deep-link —
   à traiter comme bug produit, avec les nouveaux diag comme preuve.
3. La **fenêtre de 80 s → ~180 s** réduit fortement la probabilité de faux
   négatifs sur runners lents mais ne l'annule pas théoriquement (un runner
   pathologique pourrait toujours expirer ; le diagnostic dira alors lequel).
4. Run CI vert = validation du **harnais** sur le commit `d8dbc7a` ; les runs
   `pull_request` de la PR #6 sur `arena/fcdae8c6-melodix` restent la référence
   pour le code produit (inchangé ici).

## Bilan

**Corrigé et validé** — au périmètre honnête de la mission :

- **Cause identifiée avec preuves** : expiration de la fenêtre du sondage UI de
  l'écran de diagnostic du prototype sur un runner lent (le `bridge_timeout`
  cité dans l'énoncé était un warning non bloquant attendu, présent dans les
  runs verts) ; aucune régression de la fusion PR #7 (arbres git identiques au
  bit près entre le run vert `46e6650` et le run rouge `e30461a`) ; émulateur
  démarré (51,5 s), installé, lancé et vivant tout au long du run rouge.
- **Correction appliquée, minimale et justifiée** : uniquement le harnais
  `scripts/smoke-test-android-apk.sh` (fenêtre 80 s → ~180 s bornée, assertion
  d'existence inchangée, dumps en échec comptés, preuve imprimée avant
  `fail()`). Zéro changement de code produit, de workflow, de test, de secret
  ou de permission ; smoke test toujours actif ; diagnostics honnêtes
  conservés.
- **Validations réellement exécutées** : toutes les portes locales (tsc,
  eslint, prettier, `git diff --check`, Jest 2143/14/0 — tests 500/503/timeout
  inclus et PASS) + run CI complet `38063512026` **success** sur le commit
  corrigé `d8dbc7a`, Robolectric, build APK signé, **installation et lancement
  réels sur Android 14 (émulateur) avec le smoke test complet du bridge :
  verts** (étape 21 en 199 s).
- **Réserves explicites** : (1) l'élargissement de fenêtre n'a pas pu être
  éprouvé contre un runner aussi lent que celui du run rouge (le sondage vert
  réussit avant la limite) — le durcissement utile garanti est le bloc « diag »
  qui documentera la prochaine occurrence ; (2) **la lecture Spotify Web sur un
  vrai téléphone reste NON validée** (émulateur ≠ Samsung Galaxy S24 ; aucun
  compte Spotify en CI ; jamais prétendu le contraire) ; (3) la cause interne
  exacte du retard (famine du thread JS vs UI jamais idle) reste une inférence
  forte, désormais instrumentée.
- **Cadre préservé** : `main` = `fceab859…` intacte ; PR #6 **toujours OPEN,
  non fusionnée**, jamais touchée ; PR #7 déjà fusionnée, non modifiée ; PR #8
  créée **uniquement** pour déclencher le run de validation, **ouverte, non
  fusionnée** (base = branche de travail, jamais `main`) ; aucun secret ;
  aucune saisie manuelle de Client ID ; cascade Audius → YouTube intacte ;
  lecture Spotify Web expérimentale toujours désactivée par défaut.
