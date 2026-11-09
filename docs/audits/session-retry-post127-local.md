# Preview128 — admission Réessayer, état visible et accusé de démarrage

## Périmètre

Préparé dans `/home/user/Melodix-preview127`, depuis `6c6a22d3288205504f5ffdad29a8d62ae48f5650`, sur la branche imposée `arena/6b935c3e-melodix`. **Feu vert utilisateur reçu pour un commit, un push fast-forward et un unique build signé Preview128, versionCode1021464. Aucune phase2.** Au moment de cette rédaction pré-commit, aucun build128 lancé ; le résultat de livraison sera ajouté au rapport externe sans commit documentaire supplémentaire. La génération de l'asset JS et les tests Node ne constituent pas un build APK.

Le retour utilisateur confirme la conservation du premier refus à la deadline dans127, mais signale une trace JS native-retry401 sans ligne native de tentative. Ce correctif ne prétend pas avoir établi la cause téléphone de la perte du canal.

## Comportement préparé

1. **Verrou d'admission natif séparé de l'affichage.** Chaque `Gate.begin()` initialise un délai de15s sur l'horloge monotone `elapsedRealtime`. `Recovery.verify()` vérifie le verrou avant d'appeler `begin` ou de dispatcher du JS. Pendant ce délai, un appui est ignoré et annoté `relance=ignoree-verification-en-cours`, sans nouvelle génération, nouvelle relance réseau ou incrément de preuve ; les appuis n'allongent pas le délai. La deadline d'affichage3s ne libère pas le verrou. Un résultat complet de la génération courante le libère **après** le traitement du résultat par le classifieur. Un résultat ancien/incomplet ne peut pas libérer le verrou d'une vérification plus récente. Le retour d'une connexion interactive reste autorisé (`loginActive`), pour ne pas avaler la vérification de retour de login.
2. **Borne d'admission, pas annulation HTTP.** L'expiration15s est évaluée au prochain appui, sans timer qui effacerait une preuve. Elle permet alors une nouvelle vérification. Elle n'arrête pas une requête Spotify et ne fabrique pas sa fin ; les gardes de génération existantes restent responsables du rejet des anciens résultats. Sans résultat reçu (canal absent, contexte JS obsolète, Activity détruite), la borne15s est le filet de sécurité.
3. **Accusé de démarrage indépendant.** Quand `checkMediaLib` crée effectivement une tentative de source `native-retry`, il appelle `onSessionAttemptStarted(generation, attempt)` avant de mettre le travail asynchrone en route. Le natif construit le snapshot, le poste sur le looper principal et crée une ligne `Tentative g/a`, HTTP/token inconnus, `terminée=non` (début effectivement observé), alias cookie éphémère si vérifiable. Cette ligne ne dépend pas de la bonne livraison du canal JSON détaillé. Un accusé dupliqué ne doit pas faire régresser une ligne terminée ni effacer ses HTTP. Les blocages DOM/429 n'inventent pas de tentative.
4. **Échecs observables, motifs fixes.** Le JS signale au canal de secours whitelisté `onSessionDiagnosticFailure` : `canal=exception-js`, `canal=indisponible` ou `canal=demarrage-indisponible`. Aucun message d'exception, URL, token ou cookie n'est transmis. Le natif journalise `session-diagnostic motif=canal-sans-activity` et poste malgré tout le diagnostic sur le looper principal si aucune Activity propriétaire n'est disponible. Exceptions natives : `session-diagnostic motif=canal-exception-native` ; exception à la construction de l'accusé : `session-diagnostic motif=canal-demarrage-exception`. Le canal de secours est best-effort, sans récursion.

## Fichiers touchés (15)

- `smali/com/melodix/music/NativeSessionVerificationFlight.smali` — nouveau verrou d'admission indépendant, génération et borne monotone.
- `smali/com/melodix/music/NativeSessionGate.smali` — une invocation au début de vérification ; classifieur et gardes inchangés.
- `smali/com/melodix/music/NativeSessionRecovery.smali` — coalescence des appuis avant `begin`.
- `smali/com/melodix/music/NativeSessionGateTask.smali` — libération après résultat complet courant ; deadline3s inchangée.
- `smali/com/melodix/music/AndBridge.smali` — accusé court, secours motifs fixes, traitement sans Activity et erreurs natives.
- `smali/com/melodix/music/NativeSessionAttemptDiagnostic.smali` — snapshots de début, file principale et motifs fermés.
- `scripts/spotify_bridge.source.js` — appel de début indépendant et signalement des échecs du canal.
- `assets/spotify_bridge.js` — asset régénéré depuis cette source.
- `smali/com/melodix/music/NativeSessionSurface.smali` — rafraîchissement de l’état Réessayer même sur la surface mise en cache.
- `smali/com/melodix/music/NativeSessionSurfaceExtras.smali` — libellé et activation de la seule action Réessayer.
- `tests/session_retry_coalescing.test.js` — dix nouveaux tests ciblés, dont état du bouton et réveil visuel à15s.
- `tests/session_gate.test.js` — preuve négative : les lignes incomplètes/inconnues n’incrémentent jamais le compteur.
- `tests/helpers/session_diagnostic_vm.js` — exécute le snapshot natif ; la file Android est remplacée par une consommation synchrone pour ce test.
- `tests/session_attempt_diagnostic.test.js` — adaptations explicitant les seuls ajouts d'admission/signalement autorisés.
- `docs/audits/session-retry-post127-local.md` — ce rapport.

## Invariants et risques

- `Gate.result`, Evidence, Reconnect, publication de preuve et fonctions de requêtes Spotify sont comparées à127 et inchangées. Aucun changement de spoof, en-tête, version Spotify, publicité/adblock, purge de cookie ou navigation hors phase1. Les gardes de génération ne sont ni retirées ni affaiblies.
- Deux taps ne sont jamais deux refus. Les diagnostics n'alimentent pas le compteur. Il faut toujours deux tentatives distinctes complètes répondant à la règle existante400/403/401, avec identité de cookie courante vérifiable.
- **15s n'est pas un timeout HTTP.** Au-delà, un ancien travail peut continuer ou rester dans la file JS. Les gardes existantes s'appliquent ; le comportement de file JS n'est pas réécrit. Cette borne peut permettre une relance alors qu'une ancienne requête reste vivante. Aucun résultat d'une ancienne génération ne doit être adopté comme preuve de la nouvelle.
- La libération anticipée attend le résultat complet sur le chemin natif, pas le simple HTTP401 ni une progression diagnostique. Si la livraison échoue ou si JS n'émet plus de résultat exploitable, l'utilisateur peut devoir attendre jusqu'à15s. C'est une préférence de sécurité, pas une preuve que le serveur travaille encore.
- Le verrou est contrôlé côté natif. Après3s, si le bouton Réessayer est visible, il affiche **« Vérification en cours… »** et est désactivé tant que le verrou est actif. Après fin courante ou borne15s, il retrouve **« Réessayer »**, activé. Le bouton secondaire Réessayer est couvert aussi, sans désactiver Se reconnecter, login, copie ni détails. Un Runnable ne capturant qu’une génération réveille le rendu à15s (si le thread principal est disponible), sans preuve ni transition ; un ancien réveil est ignoré après nouvelle génération. Validation UX/ART sur téléphone encore nécessaire.
- L'accusé est posté immédiatement mais son affichage dépend encore de la disponibilité du thread principal. Si tout AndBridge ou le JS est indisponible, ni l'accusé ni le secours ne sont garantis. Ne pas présenter l'absence de ligne comme une preuve d'absence de requête.
- Sans Activity, l'historique reste en mémoire sur le looper principal ; un processus tué le perd. Les alias restent non atomiques par rapport au cookie effectivement envoyé.
- Nouvelles interfaces et champs statiques : vérifier sur ART la résolution et l'ordre des callbacks, rotation, destruction/recréation d'Activity et retour de login. Pas de validation Android réelle ni d'authentification Spotify revendiquée.

## Tests exécutés localement

- `npm test` final : **1061 tests,1057 passés,0 échec,4 ignorés** ; `/tmp/preview128-full-final.log`.
- Cas initiaux : verrou encore actif après3s, expiration15s sans prolongation par les taps ; fin courante seulement et rejet d'une fin ancienne ; ordre garde→begin et classifieur→libération ; ligne native inconnue au démarrage et fusion sans régression ; échec du canal détaillé et secours sans secret/récursion ; vrai `checkMediaLib` accusant le début avant réseau même sans canal détaillé ; invariants127 comparés ; erreurs des diagnostics de relance et d'accusé signalées.
- Ajouts demandés : exécution du smali de présentation du bouton principal/secondaire, affichage/désactivation pendant le verrou, restauration à fin/bornage ; timer périmé sans effet sur une nouvelle génération. Test Gate/Evidence réel interprété : une ligne diagnostic `terminée=non`, même avec les trois HTTP400/403/401, et une ligne aux HTTP inconnus laissent le compteur à1. Sur le canal de preuve aussi, une triple réponse incomplète est ignorée ; un résultat complet aux HTTP inconnus ne crée aucun refus (il remet à0 la chaîne, conformément au classifieur inchangé).
- `python3 scripts/smali_register_check.py smali/com/melodix/music/NativeSession*.smali` : **0 problème sur16 fichiers**.
- Méthodes modifiées/nouvelles d'AndBridge : **0 problème**. Analyse de toute la classe : un avertissement préexistant dans `injectBundledAsset` (le checker ne reconnaît pas le retypage par `sget-object`), contre deux dans HEAD127. Aucun nouveau signalement. Le second avertissement ancien dans `onSessionAttemptDiagnostic` a disparu grâce à la séparation du registre scalaire et du registre objet.
- `git diff --check` : propre ; assets régénérés. Les tests exécutent du smali interprété et du JS isolé ; ce ne sont pas des tests ART/WebView.

## Tests Android prévus, non exécutés

1. Compteur initial1 ; retry lent ; appuis répétés à0,5s,4s,10s : même génération, une seule relance acceptée, compteur toujours1 ; deadline3s ne libère pas.
2. Deuxième refus complet courant avant15s : compteur2, écran probablement expirée ; callback dupliqué sans effet ; retry immédiatement possible après fin.
3. Aucun callback : nouvel appui accepté à15s, sans preuve créée. Réception ultérieure de l'ancienne génération : rejet, ni incrément ni libération de la nouvelle vérification.
4. Canal détaillé volontairement absent/en exception : ligne de démarrage présente avec inconnus et motif fixe ; aucune donnée privée exportée.
5. Pas d'Activity, rotation et destruction/recréation : journal fixe, conservation en mémoire tant que le processus vit, pas de crash ni verrou définitif.
6. Cookie remplacé/absent/invérifiable : preuve remise à0 selon les règles existantes ; aucun effacement de cookie. Retour de login interactif non avalé par le verrou.

Aucune exécution Android pour128. Java/SDK/ADB non disponibles localement ; les workflows Android existants construisent des APK supplémentaires, hors budget. La compilation/signature128 est autorisée en CI ; elle ne remplace pas ces tests Android ni une authentification réelle.


## Feu vert et procédure Preview128

Autorisation utilisateur reçue. Tête distante vérifiée à `6c6a22d3288205504f5ffdad29a8d62ae48f5650` avant préparation finale ; la revérifier immédiatement avant push et arrêter si changement. Vérifier le périmètre exact des15fichiers avec `git show --stat`, exclusion des26WIP et des archives, puis revérifier principal/index après commit. Push uniquement en fast-forward sur `arena/6b935c3e-melodix`, jamais force/main ; message sans marqueur skip ci. Unique build signé Preview128 cible versionCode1021464 ; second essai uniquement pour panne d'infrastructure, pas pour erreur de code. Le workflow Preview affiche583 exécutions avant préparation : prochain build-only584, soit1020880+584=1021464. Revérifier avant dispatch. Aucun workflow Android construisant d'autres APK ne doit être lancé. Rapporter le SHA du commit et le lien d'artefact après réussite ; s'arrêter ensuite pour test utilisateur.
