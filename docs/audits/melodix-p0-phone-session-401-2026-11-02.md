# P0 — relevé téléphone, preuve `libraryV3` et attribution des erreurs

**Date :** 2026-11-02

**Source de la preuve :** relevé et observations fournis par l’utilisateur depuis un téléphone physique. Je ne les ai pas reproduits sur cet appareil. Aucun cookie, jeton, en-tête d’autorisation, contenu de réponse ou identifiant de compte n’est conservé ici.

## Observations reçues

- Bridge : `bridgeStarted=true`, `bridgeCompleted=true`, lecture complète, `bridgeBootstrapErrors=0`, mode `eval`.
- Shell natif : détecté et visible, route `home`, données Home envoyées, notifications de disponibilité et `nativeUiHomeContentReady` reçues.
- `libraryFetchDiagnostic` : HTTP `401`, phase `response`, erreur `http-401`; `mediaLibStatus=error`.
- Home Web : `homeDecision=renderer-inactive`, `homeRootPresent=false`, `homeStylesReady=false`, initialisation tentée; `nativeUiShellErrors=2`.
- L’utilisateur observe le lecteur Spotify après quelques secondes et rapporte que l’écran principal WebView semble presque nul en largeur. Aucune valeur géométrique chiffrée de cet écran n’est incluse dans le relevé résumé ci-dessus.

## Ce que le 401 établit — et n’établit pas

| Étape | Observation vérifiée | Limite de ce que l’on peut conclure |
|---|---|---|
| Session visible dans la WebView | L’utilisateur rapporte que le lecteur Spotify apparaît après quelques secondes; le CTA Web Player peut aussi déclencher un booléen natif. | Le rendu du lecteur et `AppSingleton.B`/`LoggedIn` sont des signaux d’interface/handoff, pas une preuve d’API authentifiée. |
| Jeton disponible pour le bridge | Le chemin `libraryV3` ne lit aucun jeton OAuth et ne construit aucun Bearer; aucun mécanisme de renouvellement n’y est implémenté. | Le relevé ne dit pas si Spotify détient un jeton interne ailleurs dans la page, ni si un cookie précis est disponible. Le bridge ne l’inspecte pas. |
| Credentials réellement employés | Le POST `fetch` utilise `credentials: 'include'`; le navigateur peut joindre les credentials admissibles du contexte WebView. | Aucun cookie ni en-tête n’est inspecté. On ne peut pas affirmer qu’un cookie précis a été présent, envoyé ou accepté. |
| Réponse/validité Spotify | `phase=response`, `http=401` établit qu’une réponse HTTP de refus a été reçue par `libraryV3`; ce n’est pas une panne réseau. | Aucun Bearer n’ayant été fourni par ce chemin, cela ne prouve pas qu’un jeton a été rejeté. Le relevé ne départage pas cookie absent/expiré, contexte de session/API non accepté ou autre règle Spotify; il ne prouve pas une déconnexion WebView. |
| Preuve de bibliothèque | Le 401 ne fournit aucune preuve privée et invalide une preuve API précédente. Seule une réponse `libraryV3` correctement formée peut prouver la bibliothèque/session API. | Un lecteur visible, un profil UI ou un booléen natif ne peut pas remplacer cette réponse ni autoriser l’affichage de données privées. |

Les marqueurs natifs `AppSingleton.B`/`LoggedIn` sont indépendants de la preuve privée : `c91.smali` appelle `AndBridge.loginDetected()` après observation du CTA Web Player, et cette méthode persiste un booléen. C’est un signal d’interface/handoff, pas une validation API.

## Les trois horodatages ne prouvent pas trois requêtes

Les temps rapportés — environ 3 174, 8 006 et 20 169 ms — correspondent presque exactement aux échéances d’échantillonnage du diagnostic runtime (`0`, `3 000`, `8 000`, `20 000` ms, avec le retard normal des timers). `assets/runtime_diagnostic.js` copie à chaque échantillon le **dernier** `__sfMediaLibLastDiagnostic`; ce n’est pas un journal historique de chaque requête. Les trois lignes peuvent donc être trois observations du même 401.

Cela concorde avec le shell : après un 401/403, `requestMediaLibraryProof()` bloque les tentatives de fond; une nouvelle tentative est explicite (ou survient dans un nouveau document WebView). Le relevé ancien ne contient ni numéro d’essai ni origine d’appel et ne permet pas de conclure à trois transactions HTTP distinctes. La nouvelle instrumentation ajoute un identifiant d’essai, le nombre d’appels `fetch` à `libraryV3` dans l’essai et une origine en liste blanche afin que le prochain rapport puisse trancher sans lire de credential. Ce compteur est incrémenté au lancement de chaque appel `fetch`, pas lors de la copie des échantillons.

## Home Web, shell natif et largeur

`homeRootPresent` mesure l’élément Melodix `#sf-melodix-home`, pas la racine Spotify `#main-view` ni la largeur Android de la WebView. Dans `updateMelodixHome()`, la preuve `libraryV3` est vérifiée avant la disponibilité des styles; si elle manque, le renderer retire son élément et sort avec `renderer-inactive`. Dans ce chemin, `homeRootPresent=false` et `homeStylesReady=false` sont donc attendus et ne démontrent pas un défaut CSS.

Le shell natif est une couche différente. Le code envoie un état Home sans lignes privées lorsque la preuve manque; le relevé reçu confirme que les données et callbacks Home sont arrivés et que le shell s’est déclaré prêt. L’AVD du run précédent `41513751727` a validé le rendu natif d’état sans session Spotify réelle. Cela ne démontre pas le rendu pixel du téléphone actuel ni une session réelle.

L’observation de largeur reste à vérifier avec `layoutGeometry.surfaces.spotifyMain.box` et la mesure Android du conteneur WebView. `homeRootPresent=false` n’est pas cette mesure. Aucun CSS, design, navigation ou paramètre n’est modifié dans ce patch.

## Attribution des deux erreurs du shell

L’ancien champ `nativeUiShellErrors=2` est un total agrégé. Le code peut l’incrémenter depuis un événement JavaScript global/échec de ressource, le `catch` de `runUpdate()`, ou le `catch` d’installation du shell. Sans détail assaini par événement, l’origine exacte des deux occurrences déjà comptées est irrécupérable à partir du relevé actuel.

La nouvelle instrumentation conserve le total pour compatibilité et ajoute seulement : catégories de source fixes (`window-js`, `resource-script`, `run-update`, `install`, etc.), classe d’erreur autorisée et ligne/colonne numériques bornées. Elle ne conserve ni URL, nom de fichier, message, stack, cookie, jeton ni contenu Spotify.

## Portée et validation

- Pas de changement OAuth, de stockage de credentials, de contournement de `libraryV3`, de donnée privée synthétique ou de nouvel état « connecté ».
- `npm test` passe sur 486 tests synthétiques. Ils couvrent la réponse API valide, le 401 après preuve antérieure (preuve invalidée/ligne privée effacée), le 401 sans preuve, le refus 401 sans relance automatique, le retry explicite, la bibliothèque réelle de fixture, Home sans preuve, la navigation SPA et le lecteur. Un 401 ne permet pas de distinguer une session expirée d’une session absente; ces tests n’affirment donc pas une cause Spotify réelle.
- AVD et téléphone réel restent séparés : aucun nouvel AVD ni téléphone n’a été exécuté dans cette reprise; le run AVD antérieur n’avait aucune session Spotify. Le relevé téléphone ci-dessus est une observation utilisateur, pas un test que j’ai exécuté.
- Après installation d’un nouvel APK candidat, le prochain rapport permettra de vérifier si les trois horaires sont un seul essai répété par l’échantillonneur ou plusieurs appels, et d’attribuer les erreurs du shell par catégorie sans exposer d’information privée.
