# Refus des points de jeton — diagnostic ciblé

## Constat rapporté, limites et requêtes

La capture réelle rapportée pour la tentative actuelle indique `/api/token` **400 JSON**, puis `/get_access_token` **403 HTML**, sans appel de bibliothèque. Ces résultats proviennent du téléphone selon l'utilisateur ; nous n'avons ni le contenu de ces réponses ni une nouvelle capture avec les catégories ci-dessous. Le détail test121 dans `docs/audits/session-preview-test122.md` rapporte aussi 400/403, mais mentionne une bibliothèque 401 : ne pas confondre cette ancienne tentative avec la capture actuelle.

Code examiné : `fetchWebPlayerToken` dans `scripts/spotify_bridge.source.js`. Les blocs de requêtes et leur ordre sont identiques octet pour octet avant/après ce diagnostic (test dédié). Requêtes applicatives à `https://open.spotify.com` :

| | Principal | Repli |
|---|---|---|
| Chemin et méthode | `GET /api/token` | `GET /get_access_token` |
| Noms de paramètres query | aucun | `reason`, `productType` |
| Origine paramètres | aucun | littéraux fixes dans l'URL du bridge, pas issus de la session ni d'un flux OAuth |
| En-têtes explicitement fixés par le bridge (noms seulement) | `Accept`, `app-platform`, `spotify-app-version` | les mêmes |
| Corps | aucun | aucun |
| Options | `credentials: include` | `credentials: include` |

`credentials` est une option Fetch, pas un en-tête. Les valeurs des en-têtes ne sont pas reproduites ici. La WebView peut ajouter d'autres en-têtes automatiquement et sélectionner ses cookies selon ses règles ; l'application ne fabrique pas d'en-tête Cookie pour ces appels. La présence d'un cookie dans le magasin ne prouve ni son envoi effectif ni son acceptation ; les en-têtes réellement émis sur ce téléphone ne sont pas connus. Il s'agit d'endpoints internes du web player, pas de l'API OAuth officielle.

## Diagnostic ajouté, sans changer la négociation

Un build débogable, et uniquement lui, examine **un clone** des réponses ciblées, asynchroniquement, sans attendre avant de poursuivre le repli et sans consommer la réponse originale. Aucun corps complet, token, cookie, message ou titre arbitraire n'est journalisé. Les événements passent par une grammaire native fermée, limités à 256 caractères ; le journal mémoire existant est borné et n'est pas persistant. Détails techniques recalcule le journal à l'ouverture et à la copie.

- `token-error endpoint=api http=400` : `body` indique `waiting`, `json`, `invalid_json`, `truncated`, `wrong_mime` ou `unavailable`. `code` conserve seulement les codes reconnus de la liste fermée ou un entier de 0 à 999 ; sinon `other`/`absent`. `status` ne conserve qu'un statut HTTP numérique valide, sinon `unknown`. `message` est classé (`missing_parameter`, `invalid_parameter`, `unsupported`, `auth`, `access_denied`, `rate_limit`, `other`, `absent`), sans texte d'origine. Les champs sont cherchés dans l'objet d'erreur imbriqué ou au premier niveau.
- `token-error endpoint=fallback http=403` : titre réduit aux titres explicitement reconnus (`access_denied`, `403_forbidden`, `forbidden`, `just_a_moment`, `attention_required_cloudflare`) ou `other`/`absent`/`unknown`, et marqueurs génériques `captcha`, `challenge`, `access_denied`, `rate_limit` ou `none`, plus indicateur `cloudflare`. Un titre non reconnu n'est **pas** affiché en clair : même un titre peut contenir des données personnelles. Ces marqueurs sont heuristiques et ne prouvent pas l'identité de l'émetteur du blocage.
- Lecture plafonnée à 8 192 octets et 64 fragments ; JSON tronqué non interprété. MIME inattendu, réponse illisible, JSON invalide ou flux non terminé restent explicitement indiqués. Un événement `waiting` est émis immédiatement ; si la lecture n'est pas terminée lors de la copie, le résultat final n'est pas encore disponible. Si le panneau est déjà ouvert, le refermer puis le rouvrir actualise son texte ; la copie recalcule aussi les détails.

## Historique et niveau de preuve

- **Démontré par Git :** `d7d253f0` introduit l'API interne et les deux en-têtes d'identification, sans repli ; `cc29cac3` ajoute le repli après un 400 rapporté ; `d77d8ec3` ajoute `Accept` aux deux. `392f785a` rejette ensuite jetons mal formés, expirés ou sans expiration vérifiable, au lieu d'inventer une expiration de secours ; `0c3ed32c` empêche l'appel bibliothèque sans jeton ; `77f4e925` affine le diagnostic et la gestion d'erreurs, `ca7a4c40` ajoute la provenance debug. Ces modifications ne démontrent pas la cause des refus HTTP actuels.
- **Démontré par rapport antérieur :** test121, source `91c74d48`, présentait déjà la paire 400/403 rapportée ; le rapport test122 indique les deux blocs Fetch identiques octet pour octet à cette source. Le registre MEL-BUG-061 rapporte un 400 dès test83, avant l'introduction du repli. Les succès de tests synthétiques avec token ne sont pas des succès Spotify réels.
- **Inconnu :** aucune version identifiée par une preuve vérifiable comme dernier succès réel d'obtention de jeton sur le téléphone. Un ancien rapport `docs/diagnostic-auth-v131.md` parle de « dernière version connue comme fonctionnelle » sans capture de succès de jeton ni identification exploitable de cette borne ; ses hypothèses sur l'empreinte ou la session ne tranchent pas la cause. Impossible de faire un bisect « depuis le dernier succès » sans cette borne.
- **Supposé seulement :** validation serveur des paramètres, du contexte client ou de la session, ou un blocage intermédiaire, sont des pistes. Ni le statut 400, ni 403, ni la présence de cookie ne permettent de départager ces causes. Les nouvelles catégories peuvent orienter l'analyse mais peuvent aussi rester `other` ou être tronquées.

## Vérifications

La source et l'asset généré sont mis à jour ensemble, sans changer les getters ni `generation-null`, la persistance, les requêtes ou les fixtures Android. L'asset bridge fait 145 288 octets, sous son plafond de 147 456. Les nouvelles comparaisons historiques substituent seulement le bloc complet de diagnostic vérifié et épinglé au commit immuable `44d7e7a4fb5d39557d20c7b1ef997213c17f5521` ; les autres octets restent comparés, avec tests de mutation.

Tests ciblés : cas JSON et HTML fragmentés, bornes, flux en attente, code/message/titre adversariaux contenant secrets, JSON invalide, MIME incorrect, lecture impossible, debug désactivé, absence de consommation, grammaire native, et identité de la fonction réseau. Validation locale complète : **1 316 réussis, 0 échec, 0 ignoré**. Validation Android synthétique : [run 43262944639](https://github.com/Souxch06/Melodix/actions/runs/43262944639) **vert** : assemblage, matrices téléphone/tablette, bridge WebView 133 et 156, et mise à jour synthétique. Ce run ne constitue pas un test Spotify réel et ne publie aucune release.

## APK et unique action sur le téléphone

APK de diagnostic débogable signé Preview : [artefact de CI](https://github.com/Souxch06/Melodix/actions/runs/43262944639/artifacts/13964986331), `Melodix-Preview-v1.3.2-test138-update-after.apk`, package `com.melodix.music.preview`, versionCode **1022719**, source **81b30f4d08bed61da92d864f2a78b55a0d4ac247**, SHA-256 APK annoncé par CI **e11dc3adb960dd235e58f9b4ac15a14f525e92a7892c808fd7f5081dc7a8f4e8**. CI contrôle la signature Preview épinglée et l'assemblage ; l'APK n'a pas été téléchargé ni inspecté localement. Cette version dépasse l'APK debug précédemment proposé 1022718 ; la mise à jour suppose même package, certificat et version installée non supérieure. Elle reste un artefact d'instrumentation, pas une release de production, et peut bloquer une future mise à jour de versionCode inférieur. L'artefact expire selon GitHub le 26 novembre à 16:51 UTC.

**Une seule action demandée :** installer cet APK par-dessus la preview sans désinstaller ni effacer les données ; en cas de refus de signature ou downgrade, arrêter. Reproduire le refus puis copier « Détails techniques » et transmettre la copie. Si elle ne montre que `body=waiting`, patienter quelques secondes et recopier ; si les détails sont déjà ouverts, les rouvrir pour rafraîchir l'affichage. Ne transmettre aucune valeur de token ou cookie.
