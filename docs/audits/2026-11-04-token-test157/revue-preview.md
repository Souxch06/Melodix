# ÉTAT / LIVRAISON — revue du correctif 0c3ed32c

Aucune APK Preview construite ou livrée ; aucune release, aucun merge, aucun push. Le workflow Preview démo existant impose une suite complète sans échec ni skip avant build : la suite demeure rouge. Ne pas contourner cette étape ou les tests Android pour obtenir un artefact. La compilation locale non signée décrite ci-dessous n'est pas une Preview installable.

## Révision intégrale et périmètre

Base distante PR : `aa8b20785a7d72da4c81625f338129302d911374`. Branche dans la copie isolée `/home/user/melodix-correctif-connexion` : `arena/6b935c3e-melodix` ; correctif audité `0c3ed32cfe6cde0294ab1f24108b37137c341dac`, parent `9e55740c161e26a7afe82c53342f2ea9fe1f0593` (bandeau non validé). Checkout partagé sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, WIP préservés.

Diff du correctif :
- `spotify_bridge.source.js` : `fetchAllLibrary` retourne avant construction/envoi de la requête bibliothèque si le jeton est nul ; invalide la preuve et les lignes privées, sans conclure à une session expirée ; vérifie génération/époque avant cette mutation. Enum diagnostic borné.
- `assets/spotify_bridge.js` : asset régénéré, empreinte source concordante, contrôle de taille exécuté ; pas de code source différent sauf la garde et enum après neutralisation exacte vérifiée par test.
- `NativeSessionGate.smali` : absence de jeton classée `token-unavailable`, 401/403 bibliothèque avec jeton classés distinctement, état non validé et `expiredEvidence=false`. Le chemin de validation positive continue à exiger jeton, `libraryOk` et HTTP 2xx ; le reste de la garde est comparé octet pour octet au parent.
- `NativeSessionSurface.smali` : messages distincts ; `AndBridge.smali` et `NativeStartupTiming.smali` : catégories fixes et grammaire bornée, sans contenu privé ; `tests/token_missing_regression.test.js` et rapport historique sont nouveaux.
- Aucun changement des endpoints, en-têtes ou récupération du jeton. Aucune suppression de cookie/jeton de session ou contournement de protection. Un effacement *de données privées déjà en mémoire* et l'invalidation de preuve sont volontairement effectués si le jeton manque. La reconnexion manuelle existante reste une action distincte, avertie et confirmée, non déclenchée par ce correctif ; le test utilisateur ne doit pas la répéter.

## Revue des 34 échecs de la suite d'origine

La liste exacte est dans `rapport.md` (section « Tests échoués non modifiés »). Les 26 échecs de `p0_library_fetch.test.js` se divisent ainsi :

1. **Contrat devenu incorrect (4 tests)** : le premier teste un succès sans en-tête Bearer ; le test « absent session ... 401 » attend un 401 obtenu après défaut de jeton ; « session diagnostics ... » exige le démarrage de la bibliothèque après un 403 du jeton ; « manual session retry ... » exige deux nouvelles requêtes bibliothèque après deux refus de jeton. Ces attentes sont incompatibles avec la règle imposée. Adapter les scénarios pour exiger zéro requête et aucune invention de 401 tout en gardant les assertions de confidentialité et de relance.
2. **Propriétés voisines (22 tests échoués)** : chargement/concurrence, pagination/dédoublonnage, refus 401/403 y compris en page suivante, limites 429, erreurs réseau/HTML/JSON, annulation après navigation, signaux DOM/preuve, bibliothèque vide ou mal formée, transformation, données partielles et timeouts. Leurs fixtures ne fournissent pas de jeton. Pour les réexaminer sans modifier leurs critères ou fichiers, `token_library_bearer_neighbors.test.js` réexécute les assertions de 22 d'entre eux avec un jeton **synthétique** comme précondition ; deux tests voisins déjà verts sont également rejoués. 24/24 passent. Cela ne rend pas les tests historiques verts et ne prouve pas Spotify.
3. **Garde historique (6 tests)** : `case 3`, `destructive reconnect ...`, `stale/duplicate ...`, `missing/changed cookie ...`, `actual gate plus actual evidence ...`, `incomplete or unknown ...` attendent notamment que 400/403/401 avec jeton absent constitue une preuve d'expiration ou alimente son compteur. Cette classification n'est plus défendable avec le 401 obtenu sans Bearer. Les assertions de sécurité voisines ont été reprises séparément : preuve positive requise, refus répétés ne débloquant pas les données, rejets incomplets/périmés, aucune suppression automatique et garde/confirmation de reconnexion manuelle. Les anciens tests restent inchangés ; une adaptation ultérieure doit conserver explicitement les contrôles contre les résultats périmés et la suppression abusive.
4. **Deux tests d'identité textuelle** : `snapshot and telemetry do not modify requests ...` et `generation guards, reconnect, Spotify request functions and proof publication unchanged from 127` interdisent toute modification de `fetchAllLibrary`. Ils échouent sur la garde de jeton volontaire. Le nouveau test vérifie que seul le bloc fail-closed et les enums diagnostics changent, et que les autres instructions et les endpoints restent identiques. Les contrôles historiques d'identité restent inchangés.

Le projet interdit de changer des critères pour obtenir du vert. Ces contradictions ne sont pas masquées, même si certaines attentes historiques sont obsolètes. Il faut définir et approuver une migration des tests sans supprimer leurs garanties, puis exécuter à nouveau toute la suite et les tests Android.

## Vérifications distinctes

- **Suite complète du code avec 24 réexécutions complémentaires :** résultat détaillé plus bas ; échecs historiques toujours présents. Les tests supplémentaires n'ont pas remplacé les anciens.
- Tests complémentaires spécifiques `token_session_security_neighbors.test.js`, `session_recovery.test.js`, `session_active_login_action.test.js` : 13/13 avant ajout d'une cinquième vérification de diff ; cette dernière passe séparément. Fixtures uniquement.
- Registres Smali : 0 problème sur `NativeSessionGate` et `NativeSessionSurface`. `AndBridge` conserve un avertissement préexistant identique au parent.
- Assemblage local Apktool **2.4.1** : Smali et ressources compilés dans une copie temporaire, injection des points d'entrée Preview préparée, mais pas de classes démo dans le DEX, pas de signature ni de Preview installable. Ce n'est pas le workflow officiel (Apktool 2.9.3), ni une preuve d'installation ou de lancement.
- Pas d'appareil, adb ni émulateur ici. L'acceptation Android du bandeau du parent vise encore un titre désormais masqué et n'a pas été exécutée ; le comportement réel avec clavier et sortie démo est inconnu. Aucun critère d'acceptation n'a été modifié.
- Build Preview existant : `test-preview-emulator.yml` → `demo-preview.yml`, job `suite` → `build` ; les 34 échecs bloquent le job `build` tant que le contrat de tests n'est pas résolu. Signature Preview et versionCode d'une nouvelle APK ne peuvent donc pas être confirmés ; aucun SHA ni lien d'APK nouvelle à fournir.

## Spotify officiel, distinct du lecteur interne

Voir `rapport.md`. OAuth PKCE avec une application du projet enregistrée et son client ID public configuré au build (pas de champ Client ID utilisateur, pas d'identité de compte codée) donne accès à la Web API suivant les permissions et quotas ; ne pas substituer ce jeton au jeton interne ni promettre le résultat sans autorisation et validation réelles. Documentation :
- https://developer.spotify.com/documentation/web-api/tutorials/code-pkce-flow
- https://developer.spotify.com/documentation/web-api/reference/get-a-list-of-current-users-playlists
- https://developer.spotify.com/documentation/web-api/concepts/quota-modes
- https://developer.spotify.com/documentation/web-api/tutorials/february-2026-migration-guide

## RÉSUMÉ VÉRIFIABLE

Correctif partiel : zéro requête bibliothèque sans jeton, aucune preuve de réparation du jeton ni des playlists. Build Preview bloqué par les tests inchangés ; aucune APK livrée. Voir les résultats chiffrés ajoutés après la dernière exécution.

Dernière exécution complète : **1 251 tests, 1 217 réussis, 34 échoués, 0 ignoré**, exit 1. La suite est réellement rouge ; les 24 tests de voisinage avec jeton synthétique et les 5 tests complémentaires de garde sont inclus. Résultat ciblé jeton, diagnostic et voisinage : 38/38 ; les tests de garde, récupération et login ciblés sont 14/14 après ajout du test d'identité du diff. Aucune validation Spotify réelle.
