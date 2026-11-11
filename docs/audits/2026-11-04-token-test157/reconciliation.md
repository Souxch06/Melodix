# ÉTAT — Réconciliation des 34 tests

Base PR `aa8b20785a7d72da4c81625f338129302d911374`, correctif `0c3ed32c`, revue `b514e528`. A = ancienne attente interdite ; C = fixture inadaptée ou comparaison textuelle devenue ambiguë ; B = régression applicative démontrée par le test. Pas de B démontrée sur ces 34 échecs : ceci ne prouve pas l’absence d’autres régressions. Aucun test supprimé.

| Test historique | Classe | Correction justifiée |
|---|---|---|
| 539 — checkMediaLib transforms a valid library response and sends cookies without inventing a token | A | Ancien succès sans bearer : exiger le Bearer de fixture et préserver le contrôle des données et de confidentialité. |
| 540 — loading clears an earlier raw count before the response settles | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 541 — concurrent and forced checks share one in-flight libraryV3 request | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 542 — the library paginates multiple playlist pages and deduplicates entries | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 543 — an absent session represented by HTTP 401 remains an unknown-cause refusal, not a fabricated login diagnosis | C | Le 401 observé doit être un vrai refus avec bearer ; conserver la distinction cause inconnue. |
| 544 — HTTP refusals and server responses retain their status-specific errors and proof semantics | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 545 — library request diagnostics distinguish actual attempts from repeated snapshots using safe source and counts | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 546 — a 401 invalidates earlier proof and clears private rows from memory | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 547 — a later-page 401 clears partial private rows and revokes the earlier page proof | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 548 — a 403 invalidates private library proof and clears stale rows without asserting player logout | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 549 — a later-page 403 discards partial private rows and invalidates the earlier page proof | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 550 — a 429 honours a bounded Retry-After delay without logging the header or response body | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 551 — network failure, invalid JSON and HTML response are distinguished | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 552 — login navigation aborts an in-flight request and rejects its late private response | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 553 — unknown DOM may verify with Spotify but a profile alone never proves private access | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 554 — a confirmed player UI permits one libraryV3 check and records a separate proof epoch | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 555 — a valid empty library is distinct from a failed request and proves only the API response | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 556 — unexpected JSON shape and GraphQL errors are not reported as an empty library | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 557 — a successful API response with unsupported items is a transform error, not a false empty library | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 558 — a transient network error preserves an earlier verified proof without asserting new auth | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 559 — partial real data remains available when a later page fails | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 561 — a stalled request times out, aborts where supported, and does not create false proof | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 562 — a stalled response body also uses the bounded request deadline | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 563 — concurrent checkMediaLib calls do not double-fetch | C | Fournir un bearer synthétique comme précondition ; conserver toutes les assertions de ce scénario (pagination, concurrence, parsing, erreurs, délais ou confidentialité). |
| 565 — session diagnostics record actual token endpoint codes without credential values | A | Token refusé : exiger zéro requête, état token-missing et HTTP bibliothèque 0. |
| 567 — manual session retry runs a new API, fallback and library request after a complete refusal | A | Relance : garder les deux essais token mais exiger zéro requête bibliothèque et aucune invention de 401. |
| 974 — snapshot and telemetry do not modify requests, proof or export sensitive data | C | Comparaison exacte du réseau et de la confidentialité : exclure uniquement le bloc fail-closed vérifié octet pour octet ; tout le reste demeure identique. |
| 989 — case 3: one complete refusal with same cookie offers explicit reconnect, never auto redirect | A | Ancien triplet sans bearer ne prouve pas une expiration ; exiger état indisponible, aucune preuve ni redirection. |
| 998 — destructive reconnect is disabled during official login, even after repeated refusal evidence | C | Garder le contrôle de reconnexion interdite pendant login, en initialisant séparément des preuves synthétiques. |
| 1006 — a stale/duplicate attempt cannot count twice; retries accumulate without pretending SSO is fresh | A | Conserver contrôle stale/duplicate et absence de SSO fraîche, mais sans preuve invalide sur token absent. |
| 1007 — missing/changed cookie and network break the repeated-refusal proof, fresh refusal explains account denial | A | Conserver vérification cookie remplacé et fraîche connexion ; token absent ne prouve plus refus du compte. |
| 1008 — actual gate plus actual evidence: first refusal, slow retry deadline, second distinct refusal | A | Conserver contrôle du délai et des doublons ; preuve préexistante réinitialisée, aucune nouvelle expiration. |
| 1010 — incomplete or unknown diagnostic rows can never add a session refusal | A | Conserver isolation du canal diagnostic et refus des résultats incomplets ; token manquant réinitialise la preuve. |
| 1057 — generation guards, reconnect, Spotify request functions and proof publication unchanged from 127 | C | Conserver comparaison exacte des fonctions et publication ; normaliser exclusivement la garde fail-closed revue. |

## Vérifications

- Suite locale complète : **1 253/1 253**, 0 échec, 0 ignoré. Fixtures exclusivement, pas une validation Spotify réelle.
- Tests antérieurs conservés ; les critères ont évolué seulement où ils contredisaient explicitement la nouvelle règle ; les propriétés voisines sont réexécutées avec un jeton synthétique. Les comparaisons d’identité n’ignorent que le bloc exact vérifié.
- Tests ajoutés : tentatives simultanées sans jeton et réponses HTTP 200 sans accessToken : aucune requête protégée, pas de faux 401.
- Aucun changement des endpoints, cookies, signature, ni des contrôles d’acceptation. La reconnexion reste une action explicite distincte.
- Le correctif du bandeau est dans l’ancêtre local `9e55740c`, non encore validé Android. L’acceptation historique peut encore dépendre du titre masqué ; attendre le résultat réel du workflow et ne pas l’assimiler à un succès.

## RÉSUMÉ VÉRIFIABLE

Les 34 tests historiques sont réconciliés en conservant leurs propriétés de sécurité pertinentes. Un build Preview et son installation doivent encore être observés sur CI ; le jeton Spotify réel demeure non résolu.
