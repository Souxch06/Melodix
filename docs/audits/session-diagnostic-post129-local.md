# Rattrapage diagnostique après Preview129

## Observation et limites

Sur le téléphone, Preview129 a montré `Relance 2/0` sans tentative 2 dans les détails, alors que le diagnostic JS rapportait une bibliothèque HTTP 401, tentative 2, source `native-retry`. Le refus complet concordant enregistré reste à 1. Cette divergence ne démontre ni la cause de la perte, ni une seconde preuve complète, ni une session expirée. Le libellé JS `native-retry` est partagé par plusieurs chemins et ne suffit pas à attribuer une requête à un appui donné.

## Changements diagnostiques

- La génération native déjà capturée au démarrage réel de `checkMediaLib` est conservée dans son observation locale. Si la génération est absente ou inconnue, aucun rattachement n'est fait.
- Le lecteur borné peut restituer un HTTP bibliothèque directement observé en phase `response` depuis cette observation quand l'instantané dédié manque. La génération et le numéro de tentative doivent être valides et la génération doit encore correspondre au lecteur natif. Une observation plus ancienne ne complète pas une autre tentative. Le rattrapage isolé ne contient ni résultat token, ni état de fin, ni alias de cookie ; il ne marque pas le démarrage réseau de la relance 2/0. En présence d'un instantané de la même tentative, seul son HTTP bibliothèque inconnu peut être complété.
- Le calendrier de lecture reste limité à 30 appels/30 secondes et s'arrête en cas de changement de génération ou de WebView absente. Il n'attend plus le callback précédent : un callback manquant ne suspend pas toutes les lectures suivantes. En contrepartie plusieurs callbacks peuvent être en attente, au maximum 30 ; une WebView ou un main looper bloqué reste une limite. Un échec immédiat de `evaluateJavascript`, une navigation, ou un lecteur non lancé peuvent encore empêcher ce rattrapage.
- Les diagnostics copiés depuis l'écran de session et depuis le dialogue runtime incluent le journal MDXPERF en mémoire, limité et filtré, notamment les jalons d'enregistrement/lecture. Aucun statut n'identifie à lui seul la cause du problème.
- Aucun changement à `NativeSessionEvidence`, aux critères de `Gate.result`, aux cookies ni aux fonctions de requête Spotify. Cette correction ne détermine pas pourquoi le transport Preview129 a échoué sur le téléphone et ne garantit pas à elle seule le rétablissement de l'authentification.

## Vérifications locales

Suite Node après reconstitution : 1074 tests, 1070 réussis, 0 échec, 4 ignorés. Les tests ciblés couvrent l'observation seule 401, les champs manquants, une ancienne/autre génération, les anciennes tentatives, les formats invalides, l'absence de callback, la borne, le maintien du nombre de preuves et le non-export de données arbitraires. Les tests interprètent le smali et simulent JS : ils ne constituent pas une exécution Android/ART/WebView ni un test d'authentification réel. Vérification statique des registres : 19 fichiers, zéro problème ; `git diff --check` et contrôle syntaxique JS réussis.

Un scénario WebView synthétique a été ajouté à l'instrumentation Android existante, mais n'a été ni compilé ni exécuté localement : SDK Android, Java, ADB et émulateur indisponibles. Captures téléphone portrait et tablette paysage non réalisées pour cette préparation diagnostique. La trace `proof clear-oncreate=T` trompeuse est un problème distinct non modifié ici.
