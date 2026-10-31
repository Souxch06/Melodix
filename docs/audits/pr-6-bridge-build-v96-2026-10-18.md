# PR #6 — V96 : réduction de surface du bridge et build de validation

- **Date :** 18 octobre 2026
- **Branche :** `arena/dbf2d44f-melodix`
- **HEAD local et distant :** `552da05dcf9c9a50c530ee4f692d5d3f07081e39` (aucune divergence de commits)
- **PR #6 :** ouverte; aucune action de commit, push, merge ou fermeture effectuée.
- **Rapports précédents conservés :** `pr-6-auth-session-ui-2026-10-18.md` et `pr-6-functional-corrections-2026-10-18.md`.

## État préexistant

Avant toute modification V96, les deux rapports demandés ont été lus. Le worktree contenait déjà les 20 fichiers suivis modifiés et les nouveaux fichiers `assets/runtime_state.js`, `tests/` et `docs/audits/` issus des passes précédentes. Ils ont été préservés; aucun reset, suppression ou remplacement de l’archive ZIP n’a eu lieu. La branche locale et `origin/arena/dbf2d44f-melodix` sont restées au même HEAD.

## Bridge WebView : ce qui est réellement exposé

`m9.g()` attache `AndBridge` à la WebView dès sa création, avant le premier chargement. `c91.onPageStarted()` ajoute ou retire ensuite l’interface selon l’URL **principale**. Cette vérification ne limite pas les frames : `addJavascriptInterface` rend chaque méthode annotée accessible aux frames de la page, sans fournir au callback l’origine ou le statut `isMainFrame` de l’appelant. Le démarrage de la WebView comporte en outre une installation initiale avant ce contrôle d’URL.

Les **22 méthodes** annotées initialement pouvaient donc être appelées par un frame secondaire lorsque l’interface était présente. Les appels JS observés dans le lecteur actif sont les suivants :

- session : `loginDetected`, `logoutDetected`;
- interface/navigation : `cssInjected`, `deferMessage`, `setExpanded`, `setSearchActive`;
- lecture et état média : `playLoaded`, `recMediaPosition`, `recMediaStatus`;
- veille/activité : `isWoke`, `manageTShut`, `manageTSleep`, `wakeOff`, `wakeUp`;
- réponses aux callbacks du catalogue natif : `onMediaItemsLoaded`, `onSearchCompleted` (le script actuel renvoie des listes vides et n’appelle pas les endpoints privés).

Ces **16 méthodes restent frame-callables** : pour chacune, `addJavascriptInterface` ne transmet ni l’origine ni `isMainFrame`. Le contrôle par URL principale n’isole donc aucune méthode contre un frame secondaire. L’examen de leurs effets a relevé les risques concrets suivants :

- `loginDetected()` peut falsifier le signal de session et modifier `AppSingleton.B`; `logoutDetected()` peut remettre ce signal à faux et modifier la préférence locale. La détection UI côté JS n’autorise pas l’appel natif.
- `recMediaStatus(JSON)` met à jour les métadonnées de la session média. Son champ `cover`, contrôlé par l’appelant, est seulement transformé pour la taille d’image puis envoyé à `Picasso.load()` sans validation d’hôte/schéma. Un frame peut donc provoquer une requête d’image sortante vers une URL choisie (y compris HTTP : le manifeste autorise le trafic en clair). Aucune donnée Spotify n’est ajoutée à cette requête, mais ce chemin permet au moins des requêtes réseau et une consommation de ressources déclenchées par un frame. Il reste à sécuriser dans une reconstruction testable; une liste d’hôtes CDN ne peut pas être choisie ici sans vérifier les URLs réellement utilisées.
- `onMediaItemsLoaded()` et `onSearchCompleted()` retirent un résultat natif en attente par clé, puis convertissent le JSON fourni en éléments MediaBrowser, y compris des URI d’icône. Les appels du JS actif fournissent actuellement `[]`, car le catalogue natif est désactivé; un frame peut néanmoins tenter de compléter un résultat en attente avec ses propres métadonnées.
- `manageTShut()`, `manageTSleep()`, `wakeOff()` et `wakeUp()` commandent les minuteries/le service de lecture; `recMediaPosition()` et `playLoaded()` modifient l’état de lecture utilisé par Android. Les méthodes `setExpanded()`, `setSearchActive()` et `cssInjected()` modifient l’état ou le rafraîchissement de l’interface.
- `deferMessage(String)` ne sert au JS actif qu’avec le jeton `reload`. Son comportement natif envoyait auparavant toute chaîne inconnue vers le texte d’état de l’application. V96 le limite maintenant aux trois clés locales reconnues (`unlock`, `reload`, `adblock`) et ignore les chaînes inconnues, y compris les collisions de hash. Cela empêche l’injection de texte arbitraire par cette entrée, mais ne bloque pas l’appel d’un frame aux trois messages fixes.
- `isWoke()` ne divulgue que l’état de veille du service; il reste toutefois appelable par n’importe quel frame.

Aucun test runtime avec un frame hostile n’a été effectué. La récupération de l’isolation complète nécessite toujours un bridge public qui vérifie l’origine et `isMainFrame`.

### Réduction appliquée

J’ai retiré uniquement l’annotation `@JavascriptInterface` de six méthodes sans appel dans le JavaScript actif :

- `enterPip`, `enterPipVideo` — actions PiP non utilisées par les assets actifs;
- `isSignatureValid` — appelée directement depuis du Smali Java, pas depuis JavaScript;
- `nativeFetch` — stub de proxy désactivé, sans appel JS;
- `onUserInfoCaptured` — méthode no-op, sans appel JS;
- `setCanvasDisabled` — écriture d’une préférence, sans appel JS actif.

Les méthodes et leurs corps restent présents; seuls leurs points d’accès JavaScript sont retirés. Aucun comportement JS actif ne dépendait de ces six méthodes. Un test de régression compare l’ensemble des annotations à l’ensemble des appels du bridge actif; il échoue si une méthode inutilisée est de nouveau exposée. Cela réduit la surface de 22 à 16 méthodes, **sans présenter le bridge restant comme sûr pour les frames**.

Les erreurs TLS restent annulées, le contenu mixte interdit, le débogage WebView désactivé et les accès fichier/contenu désactivés. Aucun jeton Spotify, cookie ou endpoint privé n’a été ajouté.

## Migration publique AndroidX WebKit : blocage vérifié

Le dépôt est un projet Apktool décompilé : aucun `build.gradle`, `settings.gradle`, wrapper Gradle, AAR/JAR AndroidX WebKit ou source Android n’est présent. Dans les classes disponibles, `androidx/webkit` ne contient que les classes de proxy. Le dex contient le marqueur `WEB_MESSAGE_LISTENER` et les interfaces **internes** `WebViewProviderBoundaryInterface` / `WebMessageListenerBoundaryInterface`, dont la callback inclut un `Uri` et un booléen de frame principal; il ne contient pas de wrapper public `androidx.webkit.WebViewCompat.addWebMessageListener` appelable par l’application.

L’interface interne n’est pas une dépendance publique utilisable directement. Implémenter son protocole `InvocationHandler` à la main en Smali, sans sources ni possibilité d’assemblage/runtime-test, reviendrait à inventer un wrapper et n’est pas une correction sûre. Aucune migration hasardeuse n’a été tentée.

**Migration à réaliser dans une reconstruction Android publique :** utiliser `WebViewCompat.addWebMessageListener` avec l’origine HTTPS exacte autorisée; vérifier à chaque message `isMainFrame` et `sourceOrigin` (schéma, hôte et port); limiter le protocole aux actions JSON nécessaires; retirer entièrement `addJavascriptInterface`, sans fallback non filtré. Tant que cette migration n’est pas intégrée et testée, les méthodes restantes restent accessibles aux frames et ne doivent pas servir de frontière d’autorisation.

## Préparation du build Android

Les deux workflows existants (`preview-apk.yml` et `release-apk.yml`) aboutissent à la publication/attache d’un APK signé : Preview assemble, signe et crée une release; le workflow release réutilise un APK signé préexistant ou assemble/signe puis l’attache. Aucun ne fournit un mode de compilation seul. Le projet contient les dix éléments racine requis par Apktool ainsi que `android/apktool-framework/1.apk`; `apktool.yml` référence Apktool 2.9.3.

J’ai ajouté `.github/workflows/validate-android-assembly.yml`, qui est **manuel uniquement** (`workflow_dispatch`) et distinct des workflows de publication. Sur un runner GitHub, il installe Java 17, le SDK Android et build-tools 35.0.0, télécharge Apktool 2.9.3, assemble une copie temporaire du projet et vérifie le package `com.melodix.music`. Le fichier de sortie est limité au répertoire temporaire du runner. Ce workflow :

- ne demande aucun secret de signature;
- n’accorde que `contents: read`;
- ne signe pas l’APK et ne dépose pas d’artifact;
- ne crée pas de release et n’est pas déclenché automatiquement.

Le workflow a été validé statiquement, **pas exécuté**. Il n’est pas encore disponible côté GitHub : le fichier est local au worktree et aucun commit/push n’a été autorisé. De plus, `workflow_dispatch` requiert que la définition soit disponible sur la branche par défaut; sans autorisation de la mettre à disposition, aucun déclenchement n’est possible ni effectué. La compilation locale n’est pas possible non plus : `java`, `apktool`, `smali`, `gradle`, `gradlew` et le SDK Android (`ANDROID_HOME`/`ANDROID_SDK_ROOT`) sont absents.

Les workflows de publication existants référencent les secrets `MELODIX_PREVIEW_KEYSTORE_B64`, `MELODIX_PREVIEW_KEYSTORE_PASSWORD` et éventuellement `MELODIX_PREVIEW_KEY_PASSWORD` pour Preview; `MELODIX_KEYSTORE_B64`, `MELODIX_KEYSTORE_PASSWORD` et éventuellement `MELODIX_KEY_PASSWORD` pour la release normale; les deux utilisent aussi `GITHUB_TOKEN` pour publier. Aucune valeur n’a été lue ou affichée. La présence réelle des secrets n’a pas pu être confirmée : la consultation antérieure de la liste des secrets avait été refusée par l’API GitHub (403), et elle n’a pas été retentée. Le workflow de validation V96 n’en nécessite aucun.

## Tests et résultats

| Vérification | Résultat |
|---|---|
| Tests Node (`node --test tests/*.test.js`) | **17/17 réussis** après V96 |
| Inventaire des interfaces JS | Réussi : les annotations correspondent aux appels du bridge actif; 16 méthodes exposées |
| Allowlist native de `deferMessage` | Réussi statiquement : seuls `unlock`, `reload`, `adblock` atteignent le texte UI; entrées inconnues et collisions refusées |
| Sentinelle d’isolation des frames | Réussie comme constat du risque résiduel, pas comme test de sécurité runtime |
| Contrôle structurel Smali (`tests/smali_sanity.test.js`) | Réussi; ne remplace pas l’assembleur |
| Vérification YAML des workflows | 3 workflows valides |
| `bash -n` des blocs de workflow | 10 blocs valides |
| XML du manifeste et des ressources | 504 fichiers analysés, 0 erreur |
| CSS | 103 règles de premier niveau, 0 erreur de syntaxe |
| `git diff --check` | Réussi |

Aucune compilation Android réelle, aucune installation, aucun test sur appareil, aucun login Spotify réel et aucune lecture réelle n’ont eu lieu. Les validations sont automatisées/statique uniquement; elles ne démontrent ni l’assemblage réussi ni l’isolement d’un frame secondaire.

## Étape suivante

Ce workflow ne pourra être déclenché qu’après autorisation explicite de publier sa définition sur la branche par défaut (condition de `workflow_dispatch`), puis autorisation distincte du lancement. À ce moment-là, examiner le résultat d’assemblage sans artifact. La résolution complète du risque de frames exige ensuite une reconstruction avec la dépendance publique AndroidX WebKit, une validation d’hôte pour les URI d’artwork, puis des tests d’intégration sur appareil couvrant chaque action du bridge et les frames secondaires. Aucun APK ni release n’a été généré ou publié pendant V96.
