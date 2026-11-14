# Audit P0 — démarrage du bridge et affichage de l’interface Melodix

- **Date :** 31 octobre 2026
- **Branche :** `arena/7142700d-melodix` (PR laissée ouverte)
- **Référence demandée :** `62bc4862fdb7b62600169a38bda41205567f409d`
- **Base de l’investigation :** `906bb637da9679af0f1edb8b00215db3125d0847`; le HEAD distant de la branche a été vérifié et correspondait à cette base.
- **État appareil :** aucune nouvelle exécution/capture de l’appareil n’a confirmé l’affichage après ces changements.

## Conclusion honnête

Le rapport précédent de l’utilisateur — `bridgeStarted=false`, `bridgeCompleted=false`, `#sf-melodix-home` absent, `nativeHomeDataSent=true`, 33 lignes — établit que la transmission des lignes a été tentée alors que le bridge de lecture n’avait pas terminé. Il ne prouve ni que le transfert du bridge était complet, ni qu’il s’est exécuté, ni que l’Activity a rendu un écran visible. **La cause finale sur l’appareil n’est donc pas encore prouvée.**

Le code contient néanmoins deux défauts de démarrage compatibles avec cet état, maintenant corrigés :

1. Le lecteur s’arrêtait à la première tranche plus courte que la taille demandée, même si elle était non vide; aucune comparaison au nombre total de caractères de l’asset ne prouvait que le source était complet.
2. `AndBridge.injectBundledAsset()` poste un `evaluateJavascript()` sur le thread UI et retourne `void`. L’ancien shell traitait le simple retour de cet appel comme un succès, sans attendre le marqueur d’exécution du bridge. Un payload rejeté pouvait ainsi laisser `bridgeStarted=false` tout en faisant croire que l’injection avait réussi.

La taille est un autre risque objectivement supprimé : le bridge source faisait 161 543 octets; son ancien chemin pouvait finir par envoyer un payload unique trop volumineux pour le WebView concerné. Les bundles de production générés ici font **103 913 octets** (bridge) et **66 209 octets** (shell), sous le seuil historique de 108 867 octets. Cela rend le correctif plausible et vérifiable, mais ne démontre pas que le WebView du téléphone affichera l’accueil.

## Traçage des sept étapes

| Étape | Chemin dans le dépôt | Ce que l’instrumentation prouve — et ne prouve pas |
|---|---|---|
| 1. Fin de chargement de page | `c91.smali`, `onPageFinished()`; `NativeCrashGuard.stage("page-finished")` | Callback natif reçu pour une page finie. Ce n’est pas le démarrage des scripts applicatifs. |
| 2. Disponibilité de `window.AndBridge` | `c91.smali`, `onPageStarted()` attache l’interface pour `open.spotify.com` (port par défaut ou 443); l’asset diagnostic lit `andBridgeAvailable` | Présence de l’objet JS. Cela ne prouve pas que ses méthodes ont réussi à traiter un appel. |
| 3. Lecture complète de `assets/spotify_bridge.js` | `native_ui_shell.js` appelle la longueur whitelistee puis `readBundledAssetRange()`; les résultats sont consignés dans `__sfBridgeReadLog` | Longueur attendue/reçue en unités de chaîne Java/JS, nombre de morceaux, lecteur et complétude. Une tranche courte non vide n’est plus interprétée comme EOF. |
| 4. Exécution effective | `executeBridgeSource()` essaie script inline, `eval`, `Function`, puis l’injection native; le shell attend `__sfMelodixBridgeStarted` | `bridgeExecMode` distingue `pending`, `started` et `no-start`; `bridgeExecSteps` et la catégorie CSP sont bornés et ne contiennent pas d’URL. Un appel natif planifié n’est plus annoncé comme exécution réussie. |
| 5. Initialisation de l’accueil | `spotify_bridge.source.js` pose `__sfMelodixBridgeStarted`, tente `initializeMelodixHome()` et renseigne `__sfMelodixBridgeBootstrapReady`; `__sfMelodixBridgeCompleted` n’est posé qu’en fin de script | Les marqueurs distinguent démarrage, tentative d’initialisation, bootstrap et fin du script. Ils ne signifient pas que le DOM attendu existe. |
| 6. Création de `#sf-melodix-home` | `updateMelodixHome()` dans `scripts/spotify_bridge.source.js` | Le root exige la route Home Spotify, un mode GUI `csshack`/`bigwindow`, `#main-view` et au moins deux cartes réelles. Le diagnostic relève root, classe active et nombre de cartes. |
| 7. Données natives et `MainActivity.showNativeUi()` | `native_ui_shell.js` transmet via `AndBridge.onNativeUiData()` et `onNativeUiReady()`; `AndBridge.smali` poste les opérations avec `runOnUiThread`; `NativeUiUpdateRunnable` appelle `applyNativeUiData()` ou `showNativeUi()`; l’Activity rend `nativeRoot` visible | `nativeHomeDataSent` et `nativeUiReadyNotified` sont des marqueurs d’appel/demande, pas un accusé de rendu. Le nouveau handshake renseigne après la méthode native `nativeUiShowMethodCalled` et si `nativeRoot` a été trouvé (`nativeUiRootFound`). Même cela ne prouve pas qu’une frame a effectivement été présentée par l’écran. |

## Rôle et références du shell natif

Aucune refonte d’architecture n’a été faite. `smali/c91.smali` lit `assets/native_ui_shell.js` et l’injecte d’abord dans la WebView Spotify existante. Il appelle ensuite `window.__sfLoadBundledBridge('spotify_bridge.js')`. Le shell natif est distinct du bridge de lecture : il collecte les lignes Spotify, transmet la route/les données natives et possède le mécanisme de récupération du bridge; le bridge contient notamment les gardes de lecture et l’accueil Melodix HTML/CSS/JS. La WebView et sa session restent en place sous l’overlay natif.

Les sources lisibles sont désormais `scripts/native_ui_shell.source.js` et `scripts/spotify_bridge.source.js`. `scripts/build_runtime_assets.sh` génère leurs assets de production avec Terser 5.51.2, sans compression AST ni mangling; les chemins consommés par Android restent `assets/native_ui_shell.js` et `assets/spotify_bridge.js`.

## Modifications

- Lecture par plages comparée à la longueur native de l’asset, poursuite après une réponse courte non vide, et fallback du lecteur complet seulement s’il est vérifié.
- Source bridge et shell gardées lisibles dans `scripts/`; bundles de production régénérés et bornés sous 108 867 octets.
- Injection native considérée comme en attente jusqu’au marqueur `__sfMelodixBridgeStarted`; fallback Blob uniquement après absence de confirmation; télémétrie CSP limitée à la directive et au type d’URI bloquée.
- Diagnostic de démarrage enrichi de la lecture, des étapes d’exécution, de l’initialisation/DOM de l’accueil et du résultat `nativeRoot`.
- La politique d’authentification, Spotify, navigation, recherche et playlists n’est pas modifiée par cette correction; aucun contenu fictif ni faux succès n’est ajouté.

## Vérifications et limites

- Tests P0 ciblés sur le chargement, les assets, la politique de whitelist, les callbacks natifs, la structure Smali et l’accueil/navigation : **217/217 réussis**. Tests de workflow APK : **2/2 réussis**.
- `node --check` sur les sources et bundles modifiés, `bash -n scripts/build_runtime_assets.sh`, et `git diff --check` : réussis.
- Suite complète `node --test tests/*.test.js` : **335/336**. L’unique échec restant est le test historique `auth and WebView code do not capture credentials or proxy Spotify requests`, dont une assertion interdit des noms de scripts pourtant toujours conditionnellement référencés dans `c91.smali`; aucun code d’authentification n’a été modifié dans cette mission. Le test d’inventaire `JavascriptInterface` passe maintenant en incluant les sources actives et le contrôle natif `isSignatureValid`.
- Le mode `[skip-release]` utilise désormais l’identifiant d’artefact `v1.2.2-test.92` pour garder un `versionCode` supérieur à test.91, mais la création de release reste explicitement désactivée.
- L’assemblage local Android n’est pas disponible ici (`java`/Apktool absents); le build-only GitHub Actions assemble et signe l’APK ainsi que l’assemblage Smali.
- Les tests statiques ou la réussite d’un build ne remplacent pas un lancement sur l’appareil concerné. Une validation réelle reste nécessaire; si l’accueil est encore absent, le nouveau rapport doit inclure `bridgeReadExpected/Received/Complete`, `bridgeExecSteps`, `bridgeCspViolation`, `nativeUiReadyNotified`, `nativeUiShowMethodCalled` et `nativeUiRootFound`.
