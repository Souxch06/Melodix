# Correctif expérimental : diagnostic et navigation Glass

Source de l'APK : `b7bcf70df13076e2c7ba4d0419ecdc790d3a8ce5` sur `arena/6b935c3e-melodix`.

## Constat et changement

Sur l'émulateur hors ligne, un panneau de diagnostic pouvait apparaître pendant le parcours : le journal indiquait sa présentation, et une vue texte cliquable plein écran recouvrait les onglets. Les événements d'onglet suivants n'atteignaient pas leurs callbacks. Le conflit du splash legacy avait déjà été corrigé séparément ; il n'expliquait pas à lui seul l'échec observé.

Le diagnostic de type `CONTENT STUCK` reste enregistré, mais sa présentation intrusive est différée lorsque la surface Glass limitée appartient à l'activité, est affichée, mesurée et contient une vue native. Les rapports `STARTUP STUCK`, les autres diagnostics et les cas où la surface est absente ou non mesurée ne sont pas supprimés. Ce contrôle ne modifie pas l'état de session ni la preuve Spotify. L'instrumentation Android vérifie également que le contenu masqué ne satisfait pas la condition.

## Vérifications et APK

- [Run exact Android 16](https://github.com/Souxch06/Melodix/actions/runs/43382218042) : assemblage signé et non débogable, identité de mise à jour vérifiée, installation propre et parcours hors ligne réussis sur téléphone et tablette ; matrice de session synthétique et ponts WebView également réussis.
- [Télécharger le ZIP contenant l'APK expérimental](https://github.com/Souxch06/Melodix/actions/runs/43382218042/artifacts/14017790490). Package `com.melodix.music.preview`, versionCode `1023013`. L'APK testé est celui de cet artefact ; le téléchargement direct dans le bac à sable a échoué (hôte de stockage externe inaccessible), mais le workflow l'a téléchargé, vérifié et installé.
- Sur le parcours hors ligne : accueil, musique locale (ouverture et retour), onglets, réglages, démo isolée et retour, retry volontaire, ouverture explicite de la connexion. Aucun compte Spotify réel ni contenu privé n'a été utilisé. La sélection et la lecture d'un fichier audio réel ne sont pas validées par ce parcours.
- Tests ciblés locaux : 43 réussis, 0 échec.
- [CI complète](https://github.com/Souxch06/Melodix/actions/runs/43382208282) : **1 330 tests, 1 300 réussis, 30 échecs, 0 ignoré** ; en majorité attentes historiques autour des jetons privés retirés. L'autre assemblage QA refuse de créer une clé éphémère, car sa clé persistante n'est pas configurée. Aucun test n'a été désactivé.
- [Métriques UI](https://github.com/Souxch06/Melodix/actions/runs/43382208158) : tablette réussie, téléphone en échec ; onglets mesurés à 55,62 dp contre le contrat de 58 dp.

## Limites

Cet APK reste expérimental, pas une version stable ni la preuve que l'interface Spotify complète fonctionne. Les contrôles sont synthétiques et hors ligne ; l'expérience sur appareil réel reste à confirmer. Le HTTP 401 réel reste non expliqué et non corrigé ; aucun accès à la bibliothèque ni playlist Spotify n'est garanti. La démo est fictive et isolée. Une autorisation Web API officielle nécessiterait une configuration développeur et une implémentation OAuth/PKCE adaptées ; ce correctif ne les réalise pas.
