# Mission 6 — Finalisation P0 : démarrage téléphone et scénario authentifié

**Branche :** `arena/6b935c3e-melodix` · **Date :** 2026-11-04 · **Dépôt :** `Souxch06/Melodix`
**Point de départ :** `4ffbe7e` (vérifié présent sur la branche distante)

---

## Verdict

> ## P0 PARTIELLEMENT RÉSOLU — VALIDATION AUTHENTIFIÉE INCOMPLÈTE

**Cause racine du délai : identifiée et mesurée.** Le démarrage à froid est dominé par l'**initialisation du provider WebView (Chromium)** dans `MainActivity.onCreate`, qui représente **77 à 83 %** du temps principal échantillonné pendant `onCreate`, sur les deux profils et sur trois runs indépendants.

**La piste du formulaire de connexion est réfutée par la mesure.** Le formulaire est bien construit (`login_form=built` sur les deux profils), mais il représente **0 à 3 échantillons sur 35 à 130** selon les runs, soit **0 à 3 %**. Il n'est pas responsable du délai. **Il n'a donc pas été supprimé.**

**La prémisse « le téléphone reste en connexion à 8 s pendant que la tablette est native » n'est pas reproductible.** Elle venait d'un run unique. Au run final, le résultat s'**inverse** : téléphone natif à 8 s, tablette en connexion. Sur quatre runs, le téléphone est en `login/web` à 8 s trois fois et la tablette deux fois. **Il n'y a pas de pénalité systématique liée au facteur de forme** : c'est de la variance d'exécution.

**Aucun code de production n'a été modifié.** Aucune cause racine ne justifie un correctif production dans le périmètre autorisé : le coût dominant est l'initialisation du moteur WebView, qui est nécessaire au fonctionnement de l'application, et le décaler modifierait l'architecture sans preuve que cela résout le P0 d'affichage.

**Le scénario authentifié n'a pas été exécuté.** Il est entièrement préparé et prêt à lancer ; il requiert une intervention de l'utilisateur sur un appareil qu'il contrôle. Aucune session, aucun cookie, aucun jeton n'a été simulé.

---

## 1. État Git et commit distant

| Élément | Valeur vérifiée |
|---|---|
| Branche | `arena/6b935c3e-melodix` (active) |
| Départ | `4ffbe7e10ef8584ba937b625067e3355222b5281` — confirmé ancêtre de la tête distante |
| Push | tous en fast-forward, aucun push forcé |
| Workspace initial `/home/user/Melodix` | HEAD `44902d9`, 26 entrées préexistantes, jamais écrit |
| `main` distante | `81ef774`, inchangée |

**Incident d'environnement documenté.** Entre deux sessions, le worktree `/home/user/melodix-a6b0270`, la sauvegarde locale et la toolchain ont disparu (réinitialisation du bac à sable). Rien n'a été perdu : tout le travail était poussé. Le worktree a été reconstruit depuis `4ffbe7e`, `npm ci` relancé, et la toolchain de vérification restaurée. La sauvegarde locale hors dépôt n'existe plus ; **le dépôt distant et le workspace initial sont les copies de référence intactes**.

**Chaîne de commits de cette mission :**
`4ffbe7e` → `0f35ac2` → `eba631e` → `976b71b` → `e5b1424` → *(commit du rapport)*

Tous poussés en fast-forward sur `arena/6b935c3e-melodix`.

---

## 2. Liens directs

### Runs

| Run | Objet | Résultat |
|---|---|---|
| [41891575697](https://github.com/Souxch06/Melodix/actions/runs/41891575697) | référence mission 5 | captures ✓, agrégat fail-closed |
| [41902005057](https://github.com/Souxch06/Melodix/actions/runs/41902005057) | 1ʳᵉ attribution startup | mesures obtenues, sidecar rejeté (origine) |
| [41903375677](https://github.com/Souxch06/Melodix/actions/runs/41903375677) | startup corrigé | captures ✓, annotations tronquées |
| [41904677419](https://github.com/Souxch06/Melodix/actions/runs/41904677419) | notices consolidées | startup ✓✓, display téléphone ✓ |
| [41906043895](https://github.com/Souxch06/Melodix/actions/runs/41906043895) | **run final de référence** | **4 captures ✓**, sidecars validés, agrégat fail-closed |

### Artefacts téléchargeables

> **Les sidecars expirent après 1 jour, les APK après 14 jours.** À télécharger sans attendre.

Run 41891575697 (référence mission 5) :
- [APK](https://github.com/Souxch06/Melodix/actions/runs/41891575697/artifacts/13352754924) — 2 705 259 o
- [sidecar téléphone](https://github.com/Souxch06/Melodix/actions/runs/41891575697/artifacts/13353228308) — 992 o
- [sidecar tablette](https://github.com/Souxch06/Melodix/actions/runs/41891575697/artifacts/13354411951) — 952 o
- [rapport combiné](https://github.com/Souxch06/Melodix/actions/runs/41891575697/artifacts/13355225429) — 1 513 o
- [outillage + harness signé](https://github.com/Souxch06/Melodix/actions/runs/41891575697/artifacts/13352969714) — 109 903 o

**Run final 41906043895 — à utiliser pour le scénario authentifié** (les deux APK sont signés par le même certificat) :

- [APK application](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13359918436) — 2 705 205 o
- [Outillage + harness signé](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13360606306) — 116 996 o
- [Sidecar ownership téléphone](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13361180386) — 951 o
- [Sidecar ownership tablette](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13361360749) — 971 o
- [Rapport combiné](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13360477220) — 1 502 o
- [Chronologie démarrage téléphone](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13361815126) — 967 o
- [Chronologie démarrage tablette](https://github.com/Souxch06/Melodix/actions/runs/41906043895/artifacts/13361720126) — 973 o

Les artefacts ne sont pas téléchargeables **depuis cet environnement** (l'API redirige vers `productionresultssa*.blob.core.windows.net`, hors allowlist réseau). Ils sont parfaitement disponibles depuis un navigateur connecté à GitHub. C'est pourquoi un canal d'annotations à vocabulaire fermé a été construit : il rend les mesures lisibles sans téléchargement.

### Tests

**591 tests.** Exécutés **réellement sur JDK 17** par le nouveau job CI `verify-tooling-tests`, qui échoue si un seul test est sauté :

```
grep -qE '^# fail 0$'      ✓
grep -qE '^# skipped 0$'   ✓
grep -qE '^# todo 0$'      ✓
```

Ce job a réussi aux runs 41902005057, 41903375677 et 41904677419. Localement, 3 tests JVM se sautent faute de compilateur Java dans le bac à sable ; **ils ne sont jamais présentés comme réussis**, et le job CI prouve leur exécution réelle.

---

## 3. Chronologie précise du démarrage téléphone

Run final **41906043895**, même APK sur les deux profils :
`sha256=4ffa00d2a880d1467ed92618eedd9774927ce3a4e3ee3aca0f4f14b3a0366138`, `versionCode=1020892`, `source=e5b1424`.

| Événement | Téléphone (1080×2400 @420) | Tablette (1600×2560 @320) |
|---|---|---|
| `onCreate` (durée réelle, callbacks pré/post) | **6 944 ms** | **5 058 ms** |
| Lancement → activité créée | 7 824 ms | 6 031 ms |
| Lancement → activité reprise (`onResume`) | 8 156 ms | 6 084 ms |
| Lancement → **premier affichage** | 9 682 ms | 8 497 ms |
| Lancement → **racine native visible** | 17 318 ms | 16 753 ms |
| Vues dans l'arbre au premier relevé | 93 | 93 |
| Formulaire de connexion | construit | construit |
| Coût de suspension de l'échantillonneur | 991 ms / 96 échantillons | 1 687 ms / 122 échantillons |

### Attribution du temps principal pendant `onCreate`

| Catégorie | Téléphone | Tablette |
|---|---|---|
| `webview_provider_init` (Chromium) | **42** (82 %) | **54** (77 %) |
| `xml_inflate` (layout natif) | 7 (14 %) | 2 (3 %) |
| `melodix_oncreate_other` | 2 (4 %) | 14 (20 %) |
| **`form_widgets_in_oncreate`** | **0** | **0** |

Trois runs indépendants convergent :

| Run | Téléphone — provider / formulaire | Tablette — provider / formulaire |
|---|---|---|
| 41902005057 | 101 / **1** | 42 / **3** |
| 41904677419 | 62 / **0** | 28 / **0** |
| 41906043895 | 42 / **0** | 54 / **0** |

### Effet de l'observateur, mesuré et non caché

Échantillonner la pile du thread principal le suspend. Le coût est **mesuré et exporté** (`sampler_suspend_ms`) : 991 ms côté téléphone, 1 687 ms côté tablette au run final. En le retranchant, `onCreate` reste de l'ordre de **3,4 à 6 s**. Les durées absolues de ce mode sont donc **majorées** ; les durées de référence non perturbées sont celles du mode `display-ownership`, qui n'échantillonne pas. Les **proportions** d'attribution restent valides.

L'intervalle a été porté de 10 à 50 ms pendant `onCreate` et 250 ms ensuite, avec un plafond de 120 échantillons, après avoir constaté et quantifié cette perturbation.

## 4. Comparaison téléphone / tablette

### Checkpoint 8 s sur les quatre runs mesurés

| Run | Téléphone | Tablette |
|---|---|---|
| 41889092970 | login/web | login/web |
| 41891575697 | login/web | native |
| 41904677419 | login/web | native |
| **41906043895** | **native** | **login/web** |

**Le résultat s'inverse au run final.** La prémisse de départ — le téléphone systématiquement en retard — n'est **pas** soutenue par la mesure. Il s'agit de variance d'exécution (chargement réseau de la page de connexion), pas d'un mécanisme propre au facteur de forme.

### Ce qui est stable, en revanche

| Constat | Preuve |
|---|---|
| Le shell natif possède le centre à 20 s | **5/5 runs téléphone, 4/4 tablette**, `native/native_shell`, `not_observed`, racine visible **et** WebView visible |
| Aucune appropriation `spotify_web` | **0 occurrence**, tous checkpoints déterminés, tous profils, tous runs |
| `onCreate` dominé par le provider WebView | **77-83 %** sur les deux profils, 3 runs |
| Formulaire de connexion négligeable | **0-3 %**, 3 runs |

### Configuration Web réellement mesurée (run final)

| Mesure | Téléphone | Tablette |
|---|---|---|
| `window.innerWidth × innerHeight` | 1082 × 2192 | 1600 × 2400 |
| `screen.width × screen.height` | 412 × 915 | 800 × 1280 |
| `devicePixelRatio` | 2,63 | 2 |
| `sf_config_gui_mode` | `csshack` | `csshack` |
| `body.melodix` | false | false |
| `body.mobile` | false | false |

Le branchement de code est confirmé : `MainActivity.smali` L699-765 force la largeur de WebView à **1600 px** au-delà de 600 dp (`h0 = 0x640`) et laisse `MATCH_PARENT` en dessous (`h0 = -1`), appliquée par `FrameLayout.LayoutParams(h0, -1)` (L840-853). Les deux profils reçoivent donc des viewports différents — **mais aucun des deux n'est marqué `mobile` par la page**, et les deux aboutissent au même état natif à 20 s. Le viewport n'est donc **pas** démontré comme cause d'un écart de comportement.

### Réponse à la question posée

| Cause candidate | Statut |
|---|---|
| Construction du formulaire | **RÉFUTÉE** par la mesure (0-3 %, 3 runs) |
| Initialisation WebView | **DÉMONTRÉE** comme coût dominant d'`onCreate` (77-83 %) |
| Blocage du thread principal | **DÉMONTRÉ** (`onCreate` 3,4-8 s, premier affichage 8,5-11,8 s) |
| Écart téléphone/tablette | **NON REPRODUCTIBLE** — inversé au run final |
| Condition de layout (600 dp) | **VÉRIFIÉE** dans le code et le viewport mesuré, sans effet démontré sur l'issue |
| Connexion / navigation | **VARIANCE** observée, pas de mécanisme déterministe établi |
| Transition de visibilité | **NON CAUSALE** : la transition vers le natif aboutit à 20 s sur les deux profils, à chaque run |

## 5. Mesures avant / après

| Étape | Avant cette mission | Après |
|---|---|---|
| Checkpoints 200 ms / 1 s / 3 s | `undetermined`, **sans raison** | `undetermined` **avec raison explicite** : `no_activity` |
| Checkpoint 8 s | `undetermined` ou mesuré | idem, raison `main_busy` quand non mesurable |
| Durée d'`onCreate` | inconnue | **mesurée** via callbacks pré/post |
| Premier affichage | inconnu | **mesuré** (`ViewTreeObserver.OnDrawListener`) |
| Première focus fenêtre | inconnue | **mesurée** |
| Attribution du temps principal | inconnue | **histogramme à vocabulaire fermé** |
| Effet de l'observateur | non quantifié | **mesuré et exporté** |
| Tests en CI | jamais exécutés en CI | **591 tests sur JDK, 0 skip exigé** |
| Scénario authentifié | mode existant, sans mode d'emploi | **script + protocole prêts à exécuter** |

**Aucun checkpoint indéterminé n'a été transformé en `not_observed`.** Le validateur du sidecar refuse explicitement un point non mesuré qui prétendrait porter une observation, et un test le prouve.

---

## 6. Résultat du scénario authentifié

**Non exécuté. Aucune session authentifiée n'a été testée, et aucun résultat n'est inventé.**

Ce qui est prêt :

- `scripts/p0_authenticated_session.sh` — installe une paire d'APK de même signature sur **exactement un** appareil connecté, puis pilote l'observateur passif `authenticated-home` pendant que **l'utilisateur se connecte sur l'écran de l'appareil**.
- `docs/audits/melodix-authenticated-session-runbook-2026-11-04.md` — intervention exacte, gestes à effectuer, lecture du résultat.

Garanties vérifiées par test : le script ne saisit aucun identifiant, n'injecte ni cookie ni jeton, n'efface pas les données, ne lit ni logcat ni capture d'écran ni hiérarchie UI. Son filtre est exécuté contre des canaris `password`, `cookie`, `access_token`, URL et nom de playlist : **aucun n'est retenu**.

**Intervention utilisateur nécessaire :** un appareil Android réel (ou émulateur local) connecté en USB, les deux APK d'un même run CI, et une connexion Spotify effectuée **sur l'écran de l'appareil**. La CI ne peut pas offrir de saisie interactive, et il serait contraire aux règles de sécurité d'y faire transiter des identifiants.

**Le mot de passe ne doit jamais être transmis dans le rapport, les journaux ou la conversation.**

---

## 7. Correctif

**Aucun correctif de production.** La règle posée était : ne pas modifier la production sans cause racine démontrée *justifiant* le changement.

- La cause du délai est démontrée (initialisation du provider WebView), mais la supprimer ou la masquer casserait l'application ; la décaler est un changement d'architecture, hors périmètre, et rien ne prouve que cela résolve le P0 d'affichage.
- La piste du formulaire est **réfutée** : le supprimer aurait été une régression sans bénéfice mesuré.
- Le P0 d'affichage lui-même **n'est pas reproduit** : aucune appropriation Spotify Web à aucun checkpoint déterminé.

Correctifs appliqués, tous dans l'outillage de mesure :

| Défaut | Preuve | Correctif |
|---|---|---|
| Origine du calendrier décalée de 1 ms | rejet validateur, run 41902005057 | `launch_command` écrit comme origine littérale |
| Observateur non quantifié, trop intrusif | 7,0 s vs 2,2-4,2 s jusqu'à reprise | intervalle 50/250 ms, plafond 120, coût exporté |
| Annotations tronquées à 10 par étape | run 41903375677 | 3 notices consolidées + test sur le nombre |
| Dépassement de fenêtre sous charge | run 41904677419, tablette 3 s | marge d'ordonnancement 500 ms, sommeil borné au restant |

**Protection renforcée, pas affaiblie.** L'interdiction faite au harness de capturer une pile a été restreinte au seul échantillonneur, avec des assertions plus fortes : une seule capture par itération, aucune sortie `Log`/statut/fichier dans l'échantillonneur, classificateur limité à des noms déclarés. Deux mutations (journaliser une frame, capturer une pile ailleurs) sont tuées.

---

## 8. Limites restantes

1. **Session authentifiée non testée** — c'est la limite principale. Le protocole est prêt.
2. **Variance des émulateurs** — les durées absolues varient plus entre runs qu'entre profils ; seules les proportions et les constats répétés sont solides.
3. **Effet de l'observateur** — mesuré (1,8-2,3 s) mais non nul dans le mode startup.
4. **Artefacts non téléchargeables depuis cet environnement** — disponibles pour l'utilisateur sur GitHub, avec expiration courte.
5. **Lecteur, MediaSession, notifications** — inspectés statiquement, non exercés sur appareil dans cette mission.
6. **Écart téléphone/tablette en phase Web** — mesuré au run final : il s'inverse. Aucun mécanisme déterministe lié au facteur de forme n'est établi ; la variance d'exécution domine.

---

## 9. Intégrité

- Aucun push forcé, aucune réécriture d'historique, aucun `reset --hard`, aucun `clean -fd`.
- `main` inchangée (`81ef774`), aucune release publiée.
- Aucun artefact binaire ajouté ; les binaires préexistants du dépôt sont identiques.
- Mutations exclusivement dans `/tmp`.
- Aucun identifiant, cookie, jeton ni donnée personnelle dans les sidecars ou annotations ; canaris prouvés rejetés.
- **0 fichier de production modifié** sur l'ensemble des missions 5 et 6.
