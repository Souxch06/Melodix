# Stabilisation Glass : inventaire de la CI de référence

Base : `04b6fe86ae39f94a674294555b521db54dd63aa6`, branche `arena/6b935c3e-melodix`.

## Résultats et limites de l’inventaire

Le [run GitHub 43289273354](https://github.com/Souxch06/Melodix/actions/runs/43289273354) rapporte **1 323 tests : 1 289 pass, 34 échecs, 0 skip**. Son workflow ne publiait en annotation que les 20 premiers échecs, et le téléchargement des journaux Actions depuis cet environnement échoue. Il est donc impossible de nommer honnêtement son 34e échec. Une reproduction locale de la même base donne **1 290 pass, 33 échecs, 0 skip** ; les 33 noms ci-dessous sont exhaustifs pour cette reproduction, pas une prétention à identifier le 34e résultat du run distant. Une CI ultérieure a reproduit ces 33 échecs avec un compilateur Java réel ([run 43291730380](https://github.com/Souxch06/Melodix/actions/runs/43291730380)). Le reporting CI a été amélioré pour lister désormais tous les échecs, sans changer leur exécution.

La suppression expérimentale du flux de jeton privé a été introduite par `dc323a95`, **avant** la base Glass `4cf50f15` ; le bridge Spotify est identique entre `4cf50f15` et `04b6fe86`. La liste ci-dessous ne démontre donc pas 33 régressions nouvelles du renderer Glass. Les comparaisons historiques et les assertions de sûreté ne doivent pas être invalidées mécaniquement : l’absence de bearer, l’absence de publication de données non prouvées et l’invalidation des générations doivent rester testées. La cause indiquée est un diagnostic initial, pas une conclusion que toutes ces assertions sont obsolètes.

Les trois tests `session_manual_retry_real` qui exigeaient `dropWebPlayerToken` ont été adaptés au transport cookie-only : les vérifications de génération courante, de mise en attente, de vol périmé et de refus restent exécutées. Les autres cas restent ouverts.

| # | Échec reproduit à la base | Fichier | Diagnostic initial |
|---:|---|---|---|
| 1 | historical normalization pins debug changes and retains the complete byte comparison | `tests/debug_session_diagnostics.test.js:66:1` | comparaison historique de blocs/normalisation ; audit de sécurité encore nécessaire |
| 2 | MEL-BUG-057: token-fetch status is tracked as a sanitized enum and exported | `tests/mel_bug_041_refusal_cooldown.test.js:127:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 3 | MEL-BUG-061: token fetch falls back to the web player get_access_token endpoint | `tests/mel_bug_041_refusal_cooldown.test.js:159:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 4 | MEL-BUG-065a: token calls send Accept: application/json and never log the cookie value | `tests/mel_bug_064_065_ui_refresh_token.test.js:81:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 5 | checkMediaLib transforms a valid library response with cookies and a fixture bearer | `tests/p0_library_fetch.test.js:175:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 6 | MEL-BUG-036: with a web-player token, libraryV3 sends Authorization: Bearer and never logs the token | `tests/p0_library_fetch.test.js:789:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 7 | session diagnostics record actual token endpoint codes without credential values | `tests/p0_library_fetch.test.js:814:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 8 | 400 then 403 presentation metadata preserves the exact existing token requests | `tests/p0_library_fetch.test.js:832:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 9 | manual retry repeats token attempts and cookie-only library after refusal | `tests/p0_library_fetch.test.js:851:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 10 | manual retry requests a fresh token even if a valid synthetic bearer was cached | `tests/p0_library_fetch.test.js:872:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 11 | two concurrent native retry invocations for the same active generation make one fresh attempt | `tests/p0_library_fetch.test.js:932:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 12 | native attempt-start acknowledgement is sent only after the token transport was invoked | `tests/p0_library_fetch.test.js:947:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 13 | after a failed retry a new active generation makes exactly one new correlated request | `tests/p0_library_fetch.test.js:961:1` | fixture exige appels ou en-tête bearer ; vérifier transport cookie-only et concurrence indépendamment |
| 14 | page-side timings observe every token attempt without relying on shell installation | `tests/perf_startup_instrumentation.test.js:62:1` | exige des marques temporelles d’un appel de jeton retiré |
| 15 | actual token function records API/fallback refusals without adding or altering a request | `tests/session_attempt_diagnostic.test.js:40:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 16 | actual token success/cache does not claim an unobserved fallback or inherited HTTP status | `tests/session_attempt_diagnostic.test.js:47:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 17 | actual network failure never invents an HTTP refusal or a fallback attempt | `tests/session_attempt_diagnostic.test.js:52:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 18 | expired synthetic primary token is rejected and a valid synthetic fallback is used without changing requests | `tests/session_attempt_diagnostic.test.js:56:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 19 | snapshot and telemetry do not modify requests, proof or export sensitive data | `tests/session_diagnostic_pull.test.js:88:1` | comparaison historique de blocs/normalisation ; audit de sécurité encore nécessaire |
| 20 | manual retry discards cached bearer and launches the actual forced verification | `tests/session_manual_retry_real.test.js:10:1` | attend la purge d’un cache supprimé ; assertion adaptée sans retirer les garde-fous de génération et de vol |
| 21 | manual retry waits for an older flight before discarding bearer and launching a distinct verification | `tests/session_manual_retry_real.test.js:13:1` | attend la purge d’un cache supprimé ; assertion adaptée sans retirer les garde-fous de génération et de vol |
| 22 | queued retry can use canonical native text without accepting stale or malformed values | `tests/session_manual_retry_real.test.js:60:1` | attend la purge d’un cache supprimé ; assertion adaptée sans retirer les garde-fous de génération et de vol |
| 23 | generation guards, reconnect, Spotify request functions and proof publication unchanged from 127 | `tests/session_retry_coalescing.test.js:91:1` | comparaison historique de blocs/normalisation ; audit de sécurité encore nécessaire |
| 24 | token expiry during pagination stops further requests and invalidates partial fixture proof | `tests/token_expiry_regression.test.js:29:1` | suppose une pagination avec bearer expiré ; vérifier l’arrêt et l’intégrité de pagination cookie-only |
| 25 | [bearer fixture] MEL-BUG-036: with a web-player token, libraryV3 sends Authorization: Bearer and never logs the token | `tests/token_library_bearer_neighbors.test.js:32:67` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 26 | tests/token_refusal_debug.test.js | `tests/token_refusal_debug.test.js:1:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 27 | HTTP 400 then HTTP 403 stay distinct and never create a token or read error bodies | `tests/token_response_handling.test.js:29:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 28 | a non-JSON successful primary response falls back without inventing a network failure | `tests/token_response_handling.test.js:37:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 29 | invalid, non-JSON and explicitly expired responses remain distinct from network errors | `tests/token_response_handling.test.js:44:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 30 | valid cached token and expired-token fallback use no fabricated expiry or identity | `tests/token_response_handling.test.js:60:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 31 | network-start acknowledgement follows a transport call and is absent on synchronous dispatch failure | `tests/token_response_handling.test.js:84:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 32 | 400 and 403 response metadata is correlated, bounded, and never contains raw header values | `tests/token_response_handling.test.js:96:1` | contrat hérité d’acquisition, refus, cache ou diagnostic de jeton ; adaptation et invariants à revoir |
| 33 | request changes are limited to the reviewed fail-closed guard and diagnostic enum | `tests/token_session_security_neighbors.test.js:68:1` | comparaison historique de blocs/normalisation ; audit de sécurité encore nécessaire |

## Démarrage et couverture Android

Le précédent contrôle `HomeRenderInstrumentation` attendait les champs de disponibilité et le panneau du renderer Home alimenté par le bridge ; `NativeLimitedGlass` construit un panneau natif autonome et n’alimente pas ces champs. Le vérificateur de hiérarchie possède également une liste fermée d’anciens libellés. Ces deux divergences expliquent l’échec du contrôle historique, mais ne prouvent pas à elles seules que l’écran était visible. De plus, `bind()` intervient avant l’affectation de `H` : le code initial pouvait manquer le masquage du splash au premier montage. La correction résout le splash par son identifiant réel, sans feindre un état « prêt ».

La nouvelle instrumentation contrôle séparément les rectangles visibles, texte et nœud d’accessibilité, splash, commandes et onglets ; le contrôle historique complet reste actif et doit encore être réconcilié avec le nouveau contrat sans perdre ses autres scénarios. Les scénarios d’état synthétiques ne constituent ni une connexion Spotify réelle ni un essai sur téléphone.

## Limitations

- Les réglages limités donnent accès aux notifications Android ; toutes les anciennes fonctions de réglages indépendants ne sont pas encore démontrées.
- La démo est ajoutée uniquement dans une variante preview isolée, jamais dans le build de production.
- Les refus 401/403 ne valident pas la session ; aucune restauration des playlists n’est démontrée.
- Les APK précédents ont des numéros de version distincts : l’installation de mise à jour dépend du même certificat et d’un versionCode supérieur au paquet installé.
