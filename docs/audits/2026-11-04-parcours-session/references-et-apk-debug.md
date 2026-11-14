# Références historiques et APK débogable — PR #8

## Démontré : trois comparaisons corrigées

Les trois échecs de la suite locale étaient causés par les ajouts de diagnostic
introduits sur `ca7a4c40` et `d73c84cb`, pas par une modification volontaire
des endpoints ou de la preuve de session :

1. `session_diagnostic_pull.test.js` compare `fetchAllLibrary` à une version
   historique. La seule différence supplémentaire dans cette fonction est
   l'appel au diagnostic de réponse ; `token_guard_normalize.js` vérifie que
   cette ligne exacte apparaît une seule fois avant de l'enlever pour la
   comparaison. Le garde token absent et le contrôle expiration restent actifs.
2. `session_retry_coalescing.test.js` épingle `fetchWebPlayerToken`. Le hash
   ancien ne correspondait plus aux métadonnées d'origine du jeton (`api`,
   `fallback` et cache). `token_expiry_normalize.js` utilise désormais une
   référence exacte sur `d73c84cb` avant substitution de la fonction antérieure
   `89a02b1c`, puis conserve le hash historique et les autres assertions. La
   comparaison de `fetchAllLibrary` utilise également la normalisation limitée
   du point 1.
3. `token_session_security_neighbors.test.js` utilise la même comparaison token
   sur le script complet. Quatre blocs précis sont épinglés ou vérifiés avant
   normalisation : source du jeton, helpers debug, garde/diagnostic des getters,
   appel sur réponse bibliothèque. La comparaison historique du reste du script
   est maintenue. Cette vérification atteint ensuite la comparaison de la gate,
   qui exigeait à son tour de reconnaître les deux lignes exactes ajoutant le
   journal debug aux détails ; aucune autre partie de la gate n'est retirée.

Le nouvel auxiliaire `tests/helpers/session_debug_normalize.js` utilise des
commits Git fixes, pas une référence prise dans le code en cours. Un test
supplémentaire vérifie qu'une altération des blocs reconnus est refusée et
qu'une modification extérieure reste visible. Aucun test n'a été supprimé ou
ignoré. Suite complète : **1309 réussis, 0 échec, 0 ignoré**, avec PyYAML,
JRE et compilateur Eclipse ECJ fournis pour exécuter les contrôles qui étaient
précédemment ignorés faute d'outils.

## APK : emplacement et signature

Artefact débogable :
[Melodix-Preview-v1.3.2-test138-update-after.apk — téléchargement GitHub Actions](https://github.com/Souxch06/Melodix/actions/runs/43254637810/artifacts/13961217319).
GitHub distribue un ZIP contenant l'APK ; son téléchargement nécessite une
session GitHub habilitée. Date d'expiration de l'artefact selon l'API GitHub :
`2026-11-26 16:05:59 UTC`. Run :
[43254637810](https://github.com/Souxch06/Melodix/actions/runs/43254637810),
code applicatif `d73c84cb2b1ce1007d16c4f2c1f91b6aabcd172b` (les commits
suivants modifient des tests et rapports seulement).

Métadonnées publiées par le job de build : package
`com.melodix.music.preview`, versionCode `1022718`, versionName
`1.2.2-d73c84c`, SHA-256 de l'APK
`58e936119460e34a77ca5641f789d6700cd41ee9ebe5fdd39116633d35756a74`.
Le job indique `target_debuggable=true`. Le contrôle du run `update-persistence`
a vérifié le package et le certificat public épinglé ; la version est
supérieure à test170 (`1021650`) dont le build est aussi soumis au contrôle de
certificat. Cela ne prouve pas la version ou la signature actuellement présentes
sur le téléphone. Ne pas désinstaller ni effacer les données en cas de refus.
Le SHA-256 de l'APK n'est pas celui du ZIP téléchargé.

Ce fichier déjà signé ne demande **aucun secret de signature à l'utilisateur
pour le télécharger ou l'installer**. En revanche, sa **construction** dépend
bien des secrets GitHub `MELODIX_PREVIEW_KEYSTORE_B64` et
`MELODIX_PREVIEW_KEYSTORE_PASSWORD` (et éventuellement de
`MELODIX_PREVIEW_KEY_PASSWORD`) : on ne peut pas affirmer qu'elle est
indépendante des secrets de signature. Le secret distinct manquant du job UI
n'est pas requis pour télécharger cet artefact déjà construit. Le téléchargement
local depuis ce sandbox échoue sur l'hôte de stockage GitHub bloqué : les
métadonnées, signatures contrôlées et empreinte ci-dessus proviennent des
jobs CI, pas d'une inspection locale du ZIP.

## Supposé / inconnu et action unique

Les hypothèses de timing d'injection du pont et les causes des 400/403 restent
non démontrées. `generation-null` n'est pas déclaré résolu malgré 0/5 échec
observé dans la série documentée ; un échec intermittent antérieur existe. Les
scénarios Android sont synthétiques et ne prouvent pas une connexion Spotify.

Sur téléphone, avec cet APK débogable installé, **ouvrir « Détails techniques »
puis toucher « Copier le diagnostic » et transmettre le texte copié**. Aucune
purge ni désinstallation n'est demandée.
