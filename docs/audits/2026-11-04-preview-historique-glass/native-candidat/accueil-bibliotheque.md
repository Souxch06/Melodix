# Candidat 9007 — accueil et bibliothèque

Base : Preview 9006, elle-même basée sur `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`, sans changement du bridge Spotify, de l'authentification ou de la clé Preview.

## Correctifs

- Le scrape DOM de la bibliothèque ne classe plus `/collection/tracks` (titres likés) en playlists ; les routes inconnues ne se font pas passer pour cette catégorie. Pour les catégories reconnues, il ne garde que le type d'URI correspondant. Ceci empêche une source plausible des titres erronés ; la capture ne suffit pas à prouver la source exacte.
- Le callback natif du scrape de l'accueil ne rejette plus les réponses JSON non nulles. Le scrape lui-même refuse de lire une autre route que l'accueil, pour éviter de pousser les titres d'une autre page comme accueil après une navigation.
- Quand le préchargement existant de la bibliothèque se termine, l'accueil demande aussitôt une mise à jour au lieu d'attendre une mutation DOM. La mise à jour est conditionnée à la route Home actuelle et le garde natif 9006 protège l'écran courant.
- Pas de nouveau cache persistant, pas de données fictives, pas de modification de la pagination ou du jeton. La récupération complète reste séquentielle : on n'a **pas** démontré une réduction du temps réseau de Spotify, ni chiffré le gain sur téléphone.

## Validation locale

- Patchs appliqués dans l'ordre sur copie jetable, entrées épinglées par SHA-256 : test Python 2/2.
- APK reconstruite avec apktool 2.9.3 puis redécodée ; contrôles de ressources et ZIP réussis. Ne pas distribuer cette APK locale non signée.
- Test JS/Smali candidat sur l'APK redécodée : 9/9 (filtrage et catégorie, routes non-Home, retour tardif de warmup, premier garde callback). Les gardes Smali sont inspectés, pas exécutés par ART. 40/40 tests natifs et simulation ciblés ; 9/9 caractérisation du défaut historique sur la base historique intacte ; scénarios synthétiques 3/3, 1/1 et 3/3. Aucun compte ni service réel.
- Ne pas inverser les attentes des tests historiques : ils documentent toujours les défauts sur leur base d'origine.

## Limites importantes

Aucun émulateur ni téléphone : affichage et temps réels, navigation, clics et lecture Spotify restent à vérifier. Les gardes historiques de clic des lignes et de `openNativeRow` restent inversées ; la sélection d'une playlist peut donc encore ne pas fonctionner. Le bridge historique a aussi des courses et caches connus ; pas de garantie sur un changement de compte. Test avec un compte secondaire recommandé à cause des protections anciennes (voir rapports précédents). Le défaut de la capture peut avoir d'autres causes que le scrape corrigé. Les retries natifs historiques n'ont pas été modifiés car leur correction pourrait réveiller l'accueil tardivement après changement d'onglet.

## Preview signée 9007

- [Build réussi](https://github.com/Souxch06/Melodix/actions/runs/43681091226), source `5a38ad933694fae390633fa7f3379a2be4ed7194`, numéro de run 614, versionCode calculé `1022101`.
- [Télécharger le ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43681091226/artifacts/14148705396), expire le 29 novembre 2026 à 05:27 UTC. SHA-256 ZIP (API GitHub) : `bf52b840ec8970b1ad919e650489891df978f60ea4a4798b093c8509743a9cc6`.
- Signature Preview épinglée vérifiée par le workflow, package `com.melodix.music.preview`, pas de publication release. Le succès du build ne valide pas le fonctionnement sur Android.
