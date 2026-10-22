# PR #6 — Suivi « Network Error » après V21

- **Date :** 18 octobre 2026
- **Branche :** `arena/dbf2d44f-melodix`
- **Base :** V21, commit `5496fe2de313ccfdcbac078cc0ca3669ccd1bc13`
- **État au moment de la rédaction :** correctif local non commité; V21 était la dernière Preview publiée. Cette note documente l’analyse avant la demande ultérieure de publication V22.

## Analyse : faits et hypothèses

### Faits observés ou vérifiés dans le code

- Le correctif V97/V21 qui évite de transformer les statuts HTTP en écran hors-ligne n’a pas fait disparaître le message sur l’appareil.
- L’utilisateur indique que Spotify Web fonctionne dans Chrome sur le même téléphone sous Android 16. Cela rend une panne générale de connectivité moins probable, mais ne démontre pas que la WebView intégrée suit les mêmes chemins réseau ou dispose du même état de site.
- Le callback moderne `WebViewClient.onReceivedError` reste actif. Avant ce suivi, il ne conservait pas son code d’erreur et l’interface affichait un message générique.
- La comparaison du code introduit en V96 avec le comportement précédent met en évidence plusieurs changements du client WebView : retrait de l’UA Chrome desktop et de `desktop_spoof.js`, changement du traitement/interception des requêtes, et durcissement des réglages de contenu mixte et d’accès fichier/contenu. Ces changements sont des faits de code; aucun n’a été reproduit comme cause.

### Cause la plus plausible — non confirmée

La piste à examiner en premier reste une régression de compatibilité ou de démarrage du lecteur Web introduite par les changements V96, plutôt qu’une panne globale d’Android. Le retrait de l’UA et de l’ancien script peut modifier le bootstrap du lecteur; les changements de chemin de requête peuvent aussi affecter la WebView. Les règles de contenu mixte et d’accès fichier sont moins directement liées à une navigation Spotify HTTPS normale.

Un service worker Spotify ancien ou incohérent dans l’état propre à la WebView est une autre hypothèse plausible, mais de confiance plus faible : aucun état du service worker ni échange réseau n’a été observé sur l’appareil. Chrome fonctionnel ne la confirme ni ne l’exclut. Sans le code WebView observé sur le téléphone, il serait inexact d’annoncer une cause certaine ou de conclure à une panne DNS/TLS.

## Correctif local appliqué

1. `assets/spotify_sw_compat.js` tente de bloquer les nouvelles inscriptions de service worker et demande la désinscription des enregistrements existants, uniquement pour l’origine exacte `https://open.spotify.com`. L’efficacité de ces opérations n’a pas été testée à l’exécution.
2. `smali/m9.smali` installe ce script via l’API AndroidX WebKit `DOCUMENT_START_SCRIPT` et l’allowlist d’origine exacte, seulement si la fonctionnalité est prise en charge. Aucun UA, état `can_be_player`, requête réseau, cookie ou cache n’est réécrit ou effacé.
3. `smali/c91.smali` conserve le comportement de panne du frame principal, ignore `ERR_ABORTED` (`-3`) et mémorise uniquement le code numérique `WebResourceError`. L’URL, les paramètres, en-têtes et données de compte ne sont ni conservés ni affichés. Ce diagnostic en mémoire est remis à zéro à la prochaine navigation principale validée vers Spotify.
4. `smali/zk0.smali` affiche ce code à côté du message « Network Error », s’il est disponible.

La désinscription du service worker est asynchrone et intervient au démarrage du document : elle n’assure pas que le premier chargement déjà intercepté par un ancien worker réussira. Cette mitigation reste un essai ciblé, pas une preuve ni une correction confirmée.

## Validation et limites

- `node --test tests/*.test.js` : **20/20 réussis**.
- `node --check assets/spotify_sw_compat.js` et `node --check tests/runtime_state.test.js` : réussis.
- `node tests/smali_sanity.test.js` : réussi (contrôle structurel et labels, pas un assemblage Dalvik).
- `git diff --check` : réussi.
- Aucun assemblage Apktool/Smali, APK, appareil Android, Logcat, session Spotify ou test de lecture n’a été effectué après ce correctif. Le code d’erreur réel n’est donc pas encore connu.
- Au moment de la rédaction, aucun commit, push, tag ou release V22 n’avait été fait; une autorisation explicite distincte était nécessaire. La demande de publication de V22 est intervenue ensuite.

## Étape suivante

Si le message persiste après qu’une Preview contenant ce correctif aura été testée, relever uniquement le nombre affiché « WebView error code: … » et le contexte de l’essai. Ne pas collecter l’URL de navigation, les cookies, en-têtes ou jetons. Selon ce code, comparer ensuite les hypothèses WebView/lecteur et réseau sans désactiver les erreurs DNS/TLS ni les contrôles de sécurité.
