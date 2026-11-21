# TEST164 — état d'étape, mission non terminée

## 1. HEAD initial et final

Initial `0c036f785b5c4232eb708abbcc57e722c8e527c4`. Code et tests exécutés au HEAD `4d6ca5302338e4048f204e055257d7c94b4ec1b5` ; un commit ultérieur peut ajouter ce rapport sans changer le produit. Clone isolé `/home/user/melodix-test161` propre et aligné avant travaux.

## 2. Branche et PR

`arena/6b935c3e-melodix`, [PR #8](https://github.com/Souxch06/Melodix/pull/8) ouverte. Pas de merge, tag, release ou force-push.

## 3. Cause du shell invisible — partiellement validé

Dans le code, le vrai `nativeRoot` démarre `GONE` ; `NativeSessionSurface.protectUnderlyingViews/paint` le masque et retire son accessibilité hors état 3 ; `NativeSessionGate.blocked` empêche `showNativeUiFrom` et `activateNativeUiRoute` en même temps que les deux entrées de données privées. `handleNativeSystemBack` ferme hors état valide. Le dernier Android produit disponible est TEST162 sur l'APK TEST160 : activité au premier plan, root absent de l'arbre accessible pour les trois tailles ; ce seul constat ne prouve pas sa visibilité graphique. Le code TEST164 n'a pas été exécuté sur Android.

## 4. Corrections apportées — partielles

Dans `spotify_bridge.source.js`, `invalidateLibraryProofForAuthChange` vide désormais les caches de recherche et média, contexte/pistes et payload lecteur, et annule le contrôleur de recherche si présent, lorsqu'une route login ou un état auth-required est **reconnu par le JS** ; ceci même sans preuve ni requête bibliothèque. Le traitement d'un cache défaillant ne doit pas empêcher la révocation de la preuve bibliothèque. `assets/spotify_bridge.js` a été régénéré et vérifié. Préférences non privées et cookies ne sont pas effacés par ce changement. Les quatre gardes du shell n'ont pas été levées : le contrat de fraîcheur reste insuffisant.

## 5. Provenance des données

[Cartographie détaillée](provenance.md) : chaîne Android → gate → WebView → bootstrap → bridge → caches/DOM → vues natives/renderer, fonctions, signaux, invalidations et limites. Le renderer Home injecte du DOM ; les composants et stores internes du lecteur Spotify externe ne sont pas prouvés maîtrisés par Melodix. L'interface `addJavascriptInterface` possède une limite top-level mais pas de contrôle d'origine individuel des frames ; risque documenté par le test historique `runtime_state.test.js`. Ne pas dire que tous les frames sont isolés.

## 6. Invalidation native — partiellement validée

Le travail TEST163 efface vues, champs privés/retour, cibles Picasso et lecteur ; l'époque/génération rejette certains envois mis en file sous un état ancien. TEST164 ajoute un interpréteur strict du préfixe Smali de transition : états 0/1/2/4 ferment l'état, avancent l'époque et invalident le propriétaire synthétique ; l'état 3 ne le fait pas ; sans propriétaire, l'époque avance. Cela n'établit pas la sécurité de tous les threads ni de rotation Android. Les champs `nativeCurrentScreen`/`nativeReturnScreen` restent effacés ; préservation de navigation non réalisée.

## 7. Invalidation JavaScript / WebView — partiellement validée

Deux tests utilisent l'IIFE du bridge réel dans un VM à données synthétiques : nettoyage des stores quand la route login est reconnue sans bibliothèque ; poursuite de la révocation de preuve même si un cache lève une erreur. Le probe `node tests/test164_webview_cache_probe.cjs` passe. Une route JS reconnue n'est cependant pas garantie lors d'une transition native, d'un retour d'activité ou de la reconnexion ; tous les stores, closures, DOM, préchargements et autres documents ne sont pas couverts. Un cache dont `clear` échoue n'est pas prouvé effacé. Aucune purge des préférences ni des cookies n'est ajoutée.

## 8. Réponses tardives — blocage non résolu

Le test existant `p0_library_fetch.test.js` démontre en fixture le rejet d'une réponse bibliothèque après une navigation login JS reconnue. En revanche, `AndBridge.onNativeUiData` ne reçoit pas la génération de production : `NativeUiUpdateRunnable` capture état/époque à **réception**. Une charge ancienne arrivant après la validation suivante est indiscernable d'une charge fraîche pour ce contrôle. Le diagnostic séparé `node tests/test164_stale_provenance_probe.cjs` échoue avec code 1 sur l'interpréteur synthétique du runnable ; il démontre l'absence de provenance au point de décision, pas une requête réseau réelle. `onMediaItemsLoaded` et `onSearchCompleted` alimentent aussi directement `WebService.E/F` hors runnable UI. Tant que toutes ces voies ne sont pas réconciliées, lever les protections pourrait exposer des données anciennes.

## 9. Test rouge NativeSessionGate — validé localement, portée limitée

Le test historique compare à `9e55740c` toutes les instructions du gate hors classification du refus ; TEST163 a légitimement changé la déclaration `state` en `volatile`, ajouté `privateUiEpoch` et modifié `transition`, donc cette identité exacte ne reflétait plus le contrat. Le test conserve la comparaison historique après retrait **uniquement des ajouts identifiés**, et vérifie en outre que l'ensemble du gate hors classification est exactement identique au commit `68def1d2fb47c804c12993695f707a9635a81c17` contenant ces ajouts. Ainsi une modification non revue de la partie historique **ou** des ajouts échoue. Un autre contrôle épingle textuellement l'unique ajout JS de TEST164 avant la comparaison historique du bridge. Les nouveaux tests exécutent le chemin Smali de transition en interpréteur strict, en complément des tests de refus/session et du runnable. Ce vert ne prouve pas la sécurité globale ni la conformité Android.

## 10. Tests

- Suite locale `npm test` sur le code `4d6ca530` : **1275/1275**, zéro ignoré ; inclut les nouveaux tests ciblés, pas les probes `.cjs` séparés.
- Ciblés bridge, refus et assets : 38/38 ; gate/transition/invalidation : 11/11. Fixtures VM/interpréteurs, pas session Spotify réelle.
- Probe caches WebView sur route login reconnue : **PASS** en VM synthétique.
- Probe de provenance ancienne après nouvelle validation : **FAIL, sortie 1**, séparé et non compté comme vert ; blocage de confidentialité décrit §8.
- [Assemblage Android non signé 43184221500](https://github.com/Souxch06/Melodix/actions/runs/43184221500) : **PASS** sur `4d6ca530`, vérification package ; aucun APK distribué/signé, aucune installation ou exécution. Cela ne valide pas le fonctionnement.

## 11. Android par taille — non testé pour TEST164

| Taille | Produit TEST164 | Capture TEST164 |
|---|---|---|
| Petit écran | Non exécuté | Aucune |
| Téléphone | Non exécuté | Aucune |
| Tablette | Non exécuté | Aucune |

Les critères shell/navigation/recherche/réglages/écrans privés/retour/données périmées/crash ne sont donc pas validés. Pour référence seulement, [run réel TEST162 43176854120](https://github.com/Souxch06/Melodix/actions/runs/43176854120) : échec accueil sur ancienne APK ; captures [small](https://github.com/Souxch06/Melodix/actions/runs/43176854120/artifacts/13925290240), [phone](https://github.com/Souxch06/Melodix/actions/runs/43176854120/artifacts/13924666915), [tablet](https://github.com/Souxch06/Melodix/actions/runs/43176854120/artifacts/13924716646). Pas de test physique.

## 12. Bridge de production — non validé

L'ordre des assets et la restriction de navigation top-level sont inspectés statiquement ; aucun lancement réel démontrant ressources, bootstrap, page, canal, message, réponse et invalidation n'a été effectué pour TEST164. La [fixture TEST163](https://github.com/Souxch06/Melodix/actions/runs/43180565686) est synthétique, isolée et ne constitue pas une preuve du bridge ou du shell de production. L'origine des frames reste une limite distincte (§5).

## 13. APK et empreinte

**Aucune Preview TEST164**, aucune empreinte ou capture d'une nouvelle version : les conditions préalables ne sont pas satisfaites. Le workflow d'assemblage non signé ne publie pas d'artefact installable. L'état des secrets QA ne peut pas être inventorié (`gh secret list` HTTP 403) ; aucune clé fictive ou éphémère n'a signé Melodix. L'ancienne Preview TEST160 ne valide pas cette mission.

## 14. Limites et critères A–N

A–D shell, navigation, recherche/réglages et états privés : **non validés**. E session simulée complète : **non validée**. F/G déconnexion/expiration à travers les couches : **partiels**. H réponse tardive : **échec du probe de provenance**. I/J retour/nouvelle session : **non validés**. K bridge production : **non validé** ; L fixture séparée : **partielle** ; M confidentialité globale : **non démontrée** ; N contrat gate local : **partiellement validé** par tests ci-dessus. Aucun compte, bibliothèque, playlist, audio ou OAuth Spotify réel n'a été validé.

Blocage précis : pas de provenance producteur bout en bout, voies WebService non couvertes, stores/DOM pas atomiquement invalidés par les transitions natives, navigation actuellement effacée, et isolation par frame non prouvée. Il faut résoudre ces points, reconstruire explicitement les vues neutres tout en préservant la navigation, séparer accès privé et montage, puis exécuter le produit et le bridge réels sur trois tailles avant de lancer Preview. Pas de contournement 400/403 ou API privée présentée comme officielle.

## 15. État de main

Avant les travaux, `main` distant `81ef774fcb2208d4c4e999943411040aa1bfa33f` ; aucun changement volontaire sur `main`. Voir vérification finale dans la réponse de mission.

## 16. WIP partagés

Avant les travaux : `/home/user/Melodix` HEAD `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, empreinte du statut `218e42f623f0f1e9a33cd7fdb94aea06a51dd8bde8850264ec992971c27af87e`. L'inventaire révélait de nombreux fichiers modifiés/non suivis ; aucun n'a été modifié, réinitialisé ou copié aveuglément. Voir vérification finale dans la réponse de mission.

**Verdict : TEST164 non terminé.** La suite verte, l'assemblage non signé et la fixture ne remplacent pas les sept critères d'acceptation du vrai produit.
