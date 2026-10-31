# Diagnostic — basculement vers Spotify natif depuis Melodix

- **Date :** 31 octobre 2026
- **Branche :** `arena/7142700d-melodix` (PR #7 et `main` laissées intactes)
- **Préversion précédente :** `v1.2.2-test.88-preview` (release retirée après publication de test.89)
- **Préversion courante :** [v1.2.2-test.89-preview](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.89-preview)
- **Conclusion :** un lancement automatique du CTA Spotify est une cause directe très plausible; la capture ne permet pas encore de confirmer quelle préversion était installée ni de prouver le chemin d’exécution sur le téléphone.

## Observation et limites de preuve

La capture envoyée montre l’accueil de l’application Spotify Android — bannière Premium et navigation Spotify — et non l’écran Melodix. Elle ne contient ni le nom du paquet ni le numéro de version de Melodix. On ne peut donc pas établir qu’il s’agissait de `test.88`, ni attribuer à cette capture un build précis.

La politique native publiée en `test.88` protège déjà les navigations Spotify reconnues par la WebView et les intents `ACTION_VIEW`. Cette protection ne suffit pas à exclure un transfert provoqué par le gestionnaire JavaScript d’un bouton : le code de la page peut réagir à un clic synthétique et demander l’ouverture de l’application sans suivre le chemin de navigation couvert par ces gardes.

## Constat de code

Deux chemins de démarrage cliquaient automatiquement le CTA `data-testid=web-player-link` :

1. **`smali/c91.smali`, callback `onPageFinished`** — lorsque `AppSingleton.B` est faux, le script repère le CTA, conserve l’appel `AndBridge.loginDetected()`, puis faisait `l.click()`. Il lançait ensuite une navigation différée vers le `href` du bouton ou `/app`.
2. **`assets/native_ui_shell.js`, `maybeNavigateToPlayer()`** — après le délai de grâce, lorsque le DOM du lecteur n’était pas monté, le shell faisait lui aussi `cta.click()` avant sa navigation de secours.

`AppSingleton.B` est remis à faux au démarrage du processus. Ces chemins peuvent donc être actifs dans un lancement où la session WebView est encore valide. Le clic synthétique peut activer une action spécifique à Android et expliquer pourquoi les gardes de navigation `test.88` n’ont pas suffi. L’historique Git confirme que ces clics avaient été ajoutés comme tentative de sortie d’une page Spotify d’accueil sans `#main-view` (commits `b808acb` / `fe9ce68`, tests.60/.61).

**Niveau de confiance : élevé comme défaut de code, non confirmé comme cause unique sur l’appareil.** Aucun log du téléphone ne prouve que le clic a effectivement ouvert Spotify natif; la version installée n’est pas identifiée.

## Correctif de cette passe

- Suppression des deux clics automatiques sur le CTA.
- `c91.smali` conserve l’appel `loginDetected()` et son rôle existant; sa redirection différée concurrente est retirée. Le shell Web possède le repli déclenché par le CTA; le probe Android existant demeure un filet de sécurité séparé.
- Le shell lit le `href` sans cliquer, puis n’accepte qu’une URL `https://open.spotify.com` exacte (sans identifiants ni port non standard). Un lien d’intent, HTTP, externe ou ressemblant est rejeté au profit d’une entrée Web Player HTTPS fixe (`/app`, puis `/search` selon le budget déjà en place).
- Aucun changement aux identifiants/cookies, au parcours de connexion, à la capture d’identifiants, ni aux données de playlists. Aucun faux succès n’est affiché.

## Vérifications

- Tests ciblés `tests/p0_startup_diagnostic.test.js` + `tests/native_ui.test.js` : **84/84 réussis**.
- Le test de régression exécute réellement le shell avec un faux DOM d’accueil Spotify : le CTA est présent, aucun clic n’est déclenché, et la navigation de secours reste sur `https://open.spotify.com/app`.
- Tests URL : refus des intents, des hôtes ressemblants et des ports non standards; un iframe HTTPS exact reste prioritaire.
- Syntaxe JS et `git diff --check` : réussis.
- Suite complète Node : **323/325**. Les deux échecs connus et indépendants de cette correction sont :
  - `auth and WebView code do not capture credentials or proxy Spotify requests` — assertion existante incompatible avec les scripts encore référencés dans `c91.smali`;
  - `JavascriptInterface annotations are limited to bridge methods used by active JavaScript` — le test ne prend pas en compte les appels du nouveau shell natif.
- Build/signature/publication : [CI 41198678469](https://github.com/Souxch06/Melodix/actions/runs/41198678469), **succès**. APK `Melodix-Preview-v1.2.2-test89.apk`, SHA-256 `10ba68c341efa0e52c5c5bd53535d5f1b79fa07fddcb65637d88fdb2dab4ff8c`.
- Politique de releases vérifiée : seule la release publique `test.89` reste; la release `test.88` a été supprimée, son tag Git et les commits restent intacts.
- **Essai sur téléphone : non effectué.** La compilation CI et les tests statiques ne prouvent pas que l’interface Melodix s’affiche sur l’appareil.

## Suite nécessaire

Après publication, installer la dernière Preview et vérifier dans les informations de l’application qu’il s’agit bien de `Melodix Preview` avec le nouveau build. Ouvrir l’app et vérifier que Melodix reste au premier plan, puis que son interface/lecteur se monte. Si Spotify natif s’ouvre encore, récupérer le rapport de démarrage (URL WebView, progression, état `login`, trace JS) : cela permettra de départager un autre intent/appel natif d’un échec du shell. Ne pas déclarer le problème résolu avant cette validation sur l’appareil.
