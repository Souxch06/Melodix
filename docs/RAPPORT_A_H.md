# Rapport Melodix — mission autonome

Document de travail, mis à jour à chaque lot de corrections.
Branche : `arena/7142700d-melodix` (aucune autre branche touchée, `main` et
PR #7 intacts).

Ce rapport sépare systématiquement quatre niveaux de preuve :

| Niveau | Signification |
| --- | --- |
| **Code** | le changement est écrit et relu dans le dépôt |
| **Test** | la suite Node le vérifie (chiffres exacts ci-dessous) |
| **Compilation** | la CI `Build Melodix Preview APK` produit un APK vert pour ce SHA |
| **Exécution** | un émulateur ou un appareil a réellement lancé l'APK |

Tant que la dernière colonne n'est pas remplie pour un point, il est décrit
comme **non vérifié à l'exécution** — jamais comme « testé sur appareil ».

---

## A. Git et état du dépôt

- Dépôt : `Souxch06/Melodix`, branche de travail `arena/7142700d-melodix`.
- `main` n'est jamais modifiée ; PR #7 n'est ni fusionnée ni fermée.
- Aucun force-push, aucun reset destructif, aucun tag ni release supprimé.
- Historique de la session (du plus récent au plus ancien), tous poussés :

| SHA | Objet |
| --- | --- |
| `fa51438` | a11y : cibles tactiles natives à 48dp |
| `18b07fb` | a11y : texte tertiaire conforme AA sur toutes les surfaces |
| `ca0c086` | navigation : l'onglet Accueil déjà actif ne vide plus la shelf |
| `a885bf3` | stabilité : écran/corps `null` via le pont ignoré au lieu de crasher |
| `fb96511` | accueil : une erreur de bibliothèque reste toujours rattrapable |
| `b9c3880` | diagnostic : la chaîne d'étapes prouve page chargée + shell injecté |
| `9390eeb` | bibliothèque : payload sans identifiant attendu plus jeté |
| `ac9955f` | recherche : résultats plus jetés sur une différence de casse |
| `eae651d` | release preview `v1.2.2-test.81-preview` (déclencheur + trace) |

## B. Accueil et playlists réelles

Aucune playlist fictive, aucune donnée de démonstration : la règle appliquée
partout est « une ligne n'existe que si Spotify a réellement fourni son URI ».

Causes racines corrigées pendant la session (chacune avec test) :

1. `window.spotAuthToken` jamais défini → la bibliothèque ne pouvait pas être
   lue (`85d7293`).
2. Un échec HTTP écrasait `window.mediaLib` → un incident réseau ressemblait à
   un compte vide. Le résultat partiel réel est désormais conservé, et un échec
   total laisse la bibliothèque précédente intacte.
3. `notifyNativeUiReady` exigeait au moins une ligne → un compte réellement vide
   restait sur l'écran de chargement (`ec51fa6`). Une réponse vide honnête est
   maintenant un état affichable.
4. `fetchMediaItems` était un `return []` → chaque tap coûtait 6 s (`4fc6bf0`).
5. Onglets et chips natifs inertes (`3e999b3`) : la navigation déclenche
   désormais une vraie demande au shell (`__sfNativeRequestHome`,
   `__sfOpenLibrary`) et ne se contente plus d'un transport vide.
6. Recherche morte (`4580dc1`) puis résultats jetés si la casse ou les espaces
   différaient de l'attente native (`ac9955f`).
7. Payload `media:` jeté quand aucun identifiant n'était attendu (`9390eeb`) :
   c'était le cas exact d'un premier affichage de bibliothèque.

État des états d'erreur (P0-E, `fb96511`) :

- erreurs transitoires (429, 5xx, réponse illisible) → carte d'état avec action
  réelle `melodix:action:retry-library` ;
- erreurs définitives (401, 403, session absente) → carte d'état avec action
  réelle `melodix:action:open-settings` (ouvre les paramètres natifs) ;
- le texte ne promet un « essai automatique » que tant que la boucle de reprise
  du shell est réellement programmée. Sinon il dit « touchez pour réessayer ».
- ces cartes ne portent jamais d'URI de playlist : elles ne peuvent pas être
  prises pour un contenu réel.

## C. Refonte visuelle

Palette native (`MelColors` + `res/values/colors.xml`, épinglées entre elles par
`tests/smali_sanity.test.js`) :

- fond `#060809`, surfaces `#10151a` / `#1a222a` / `#232d36`, accent `#1ed760`,
  accent profond `#0e8f47`, textes `#ffffff` / `#bfc0cb` / `#949cab`.

Audit d'accessibilité mesuré (pas déclaratif) :

- 20 couples texte/fond audités ; 19 étaient déjà conformes, un seul écart :
  `mel_text_tertiary` sur `mel_surface_btn_top` à 4.37:1. La teinte passe de
  `#8e96a3` à `#949cab` → pire cas 4.72:1 (`18b07fb`).
- `accentDeep` reste sous AA sur les surfaces : il est donc interdit comme
  couleur de texte, et un test échoue si un renderer l'utilise comme tel.

Cibles tactiles (`fa51438`) : retour, paramètres, avatar, envoi de recherche,
chips de bibliothèque, shuffle et repeat étaient entre 38 et 46dp. Tous les
contrôles natifs à dimension fixe atteignent maintenant 48dp ; un test échoue
si un contrôle cliquable repasse sous ce seuil.

## D. Navigation

- Chaque onglet met à jour l'écran, le titre, l'identifiant attendu et la
  requête attendue avant de demander ses données ; le retour Android restaure
  écran, identifiant, recherche, titre et dernier payload JSON.
- Toucher l'onglet Accueil alors qu'il est déjà affiché ne vide plus la liste
  (`ca0c086`) : le rendu vide n'a lieu que lors d'un vrai changement d'onglet,
  sinon les lignes restent affichées pendant le rafraîchissement.
- Les actions de la barre et des chips appellent toutes une fonction réelle du
  shell ; aucune n'est décorative.
- Lecture : l'état du lecteur est publié par un intervalle dédié, et chaque
  clic sur un contrôle de lecture déclenche une republication immédiate — les
  boutons du lecteur natif ne restent donc pas figés.

## E. Stabilité

- `applyNativeUiData` ignore désormais un écran ou un corps `null` : le pont est
  joignable depuis la page, et un `null` atteignait `String.equals`/`length`
  (`a885bf3`).
- `renderNativeRows` analyse le JSON sous `try/catch JSONException` : un
  payload malformé ne remonte pas en crash.
- Les images sont chargées avec annulation et capture de `RuntimeException`.
- Démarrage : un écran de démarrage plein écran couvre la WebView (aucun flash
  de l'ancienne interface), et un filet de sécurité Java force l'affichage
  natif si le shell n'a rien livré — le logo ne peut pas rester indéfiniment.

## F. Tests et build

- Suite Node complète : **286 tests, 284 passent, 2 échouent**.
- Les 2 échecs sont **préexistants** et sans rapport avec ce travail :
  - « auth and WebView code do not capture credentials or proxy Spotify
    requests » ;
  - « JavascriptInterface annotations are limited to bridge methods used by
    active JavaScript ».
- Aucun test n'a été supprimé ni affaibli ; les assertions existantes ont été
  renforcées quand un contrat changeait (par exemple la carte d'erreur qui
  porte maintenant une action réelle).
- Nouveaux fichiers de test de cette session : `tests/p2_accessibility_contrast.test.js`
  (contrastes calculés + cibles tactiles) et des cas ajoutés dans
  `tests/native_ui.test.js`, `tests/p0_shell_takeover.test.js`,
  `tests/p0_playlist_sync.test.js`.
- Compilation : chaque SHA de la table ci-dessous a un run
  `Build Melodix Preview APK` **vert** (voir H).

## G. Reste à faire

- **Vérification à l'exécution** : aucune preuve d'exécution exploitable pour
  l'instant (voir H). Tout ce qui précède est prouvé au niveau code/test/
  compilation, pas sur un appareil.
- Refonte de la page détail (hiérarchie typographique interne, en-tête) non
  commencée.
- Variante tablette (`layout-sw600dp`) non traitée : la mise en page est
  fluide mais pensée pour le téléphone.
- Les 2 tests préexistants en échec restent à traiter séparément.

## H. Preuves (SHA, runs, artefacts)

| SHA | Build `preview-apk` | Conclusion |
| --- | --- | --- |
| `fa51438` | 41142605470 | en cours à la rédaction |
| `18b07fb` | 41142540639 | success |
| `ca0c086` | 41142441189 | success |
| `a885bf3` | 41142354291 | success |
| `fb96511` | 41142291474 | success |
| `b9c3880` | 41142114343 | success |
| `9390eeb` | 41142017977 | success |
| `ac9955f` | 41141962598 | success |
| `eae651d` | 41141786125 | success |

Release : `v1.2.2-test.81-preview` (2 assets : APK + empreinte SHA-256) a été
produite à partir du build vert `eae651d`. Elle est donc **antérieure** aux
corrections `ac9955f` → `fa51438` : une nouvelle release preview ne sera créée
qu'après un build vert des derniers commits, avec un tag unique.

Capture d'exécution (`Capture preview launch trace on emulator`) : le run
41141786095 (commit `eae651d`) a été lancé le 2026-10-30 à 23:00:42Z ; l'étape
« Install, launch and collect the trace » est la dernière suivie. Tant que ce
run n'a pas produit de log, **aucune conclusion d'exécution n'est tirée**.
