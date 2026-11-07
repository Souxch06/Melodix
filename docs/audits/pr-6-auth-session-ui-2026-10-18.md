# Audit PR #6 — démarrage, session Spotify et interface Melodix

- **Date :** 18 octobre 2026
- **Dépôt / branche :** `Souxch06/Melodix`, `arena/dbf2d44f-melodix`
- **HEAD audité :** `552da05dcf9c9a50c530ee4f692d5d3f07081e39`
**PR :** [#6](https://github.com/Souxch06/Melodix/pull/6), toujours ouverte et non fusionnée.

## Périmètre et précautions

Revue de la branche réelle et de son diff de travail, sans remplacer l’archive source ni les fichiers décompilés à la racine. Les fichiers de profil chiffrés préexistants ne sont pas supprimés. Aucun secret de signature n’a été consulté ou ajouté au dépôt.

Cette passe n’a fait **ni commit, ni push, ni fusion/fermeture de PR, ni build, ni assemblage Smali, ni publication, ni génération d’APK**. Les changements restent dans le worktree de la branche ci-dessus.

## Causes et risques relevés

1. **Un indicateur natif mémorisé ne suffit pas à valider une session.** L’ancienne préférence `LoggedIn` pouvait être obsolète après expiration, redémarrage ou changement de compte. Le CTA public de Spotify ne prouve pas davantage une connexion.
2. **Le bridge Web historique dépendait de mécanismes privés.** L’inspection a trouvé des chemins de capture/réutilisation de données de session, un proxy réseau natif et des appels de catalogue Spotify non contractuels. Ces voies étaient fragiles et ne doivent pas être étendues.
3. **La page officielle de compte n’exécute pas le bridge Web Player.** Le retour de `accounts.spotify.com` devait donc aussi invalider le drapeau natif périmé, sans toucher aux cookies pendant une connexion normale.
4. **L’état visuel du tiroir n’était pas autonome.** Il pouvait être déduit de classes/largeurs Spotify changeantes et rester ouvert après Accueil ou Recherche.
5. **La bannière d’état et les zones système nécessitent une intégration mobile prudente.** Une bannière en position fixe aurait recouvert une partie de la page ou du formulaire officiel.
6. **La documentation et le workflow Preview divergeaient.** La test.19 est publiée, la documentation détaillée indiquait encore test.9, et le workflow pouvait créer le tag de release sur `main` même s’il compilait une autre branche.

## Changements apportés

### Authentification et démarrage

- `assets/runtime_state.js` fournit une machine d’état non persistante (`unknown`, `signed-out`, `signed-in`). Au redémarrage, l’état repart de `unknown`; la préférence `LoggedIn` n’est plus lue comme preuve de session dans `AppSingleton`.
- `assets/spotify_bridge.js` traite les pages/composants de connexion comme des signaux de déconnexion, jamais de connexion. La confirmation positive exige à la fois un contrôle de compte identifiable et des commandes du lecteur visibles et actives. Un simple accueil public, CTA de connexion ou avatar isolé ne confirme pas la session.
- Si l’interface Spotify ne permet pas de conclure après 15 secondes, le bridge affiche un message français avec un bouton de rechargement. Il ne force aucune redirection : le formulaire et les redirections de connexion restent ceux de Spotify.
- Le retour sur `open.spotify.com` peut confirmer l’état via l’interface du lecteur. La navigation `shouldOverrideUrlLoading` est maintenant déléguée au comportement WebView standard; l’ajout forcé de `prompt=select_account` a été retiré.
- `smali/c91.smali` remet `AppSingleton.B` et la préférence historique `LoggedIn` à faux sur l’hôte exact `accounts.spotify.com`, sans supprimer de données. Les scripts Melodix ne sont injectés que sur `https://open.spotify.com` avec hôte/autorité et port par défaut vérifiés (`443` ou absent).
- La même origine exacte conditionne l’attachement de `AndBridge` au démarrage de la page; il est retiré pour les autres pages principales. Les erreurs TLS sont toujours annulées. `smali/m9.smali` désactive le débogage WebView, interdit le contenu mixte HTTP et ferme l’accès WebView aux fichiers et URI `content://`.
- Le chemin de déconnexion explicite existant (`MainActivity.A()`, piloté par `l0`) n’a pas été modifié. Le callback `AndBridge.logoutDetected()` ne supprime pas de cookies : il met à jour l’état natif/préférence historique et `m9.k()` programme le rafraîchissement d’interface `MainActivity.G()`. Le bouton natif **Log in to New Account** conserve son effacement de données explicitement demandé par l’utilisateur avant la connexion officielle. Aucun observateur automatique ne déclenche ces effacements.

### Arrêt des voies de capture et profils de session

- `assets/spotify_bridge.js` ne lit ni ne stocke de jetons/localStorage, n’intercepte pas `fetch`, et n’appelle plus les endpoints Pathfinder/connect-state.
- `smali/com/melodix/music/AndBridge.smali` neutralise le proxy réseau natif et la copie de profil utilisateur; les callbacks de catalogue restent terminés avec des résultats vides quand ils ne sont plus pris en charge.
- Les anciens scripts `assets/desktop_spoof.js`, `google_spoof.js`, `playlist_sort.js` (interception privée), `facebook_consent.js` et `classic_login.js` sont inertes; le client WebView ne les injecte plus. Leurs fichiers restent présents à la racine.
- `smali/c91.smali` délègue les requêtes et l’interception standard à WebView au lieu de faire un proxy/correctif CORS.
- `smali/bh.smali` ne sauvegarde, ne lit, ne sélectionne ni ne liste plus les profils; les callbacks d’enregistrement, changement et import (`u51`, `v51`, `z1`) sont neutralisés. Le callback de suppression des anciens profils (`a61`) indique maintenant qu’aucun fichier ne sera modifié. Les fichiers chiffrés préexistants restent en place.
- Les libellés de réglages concernés dans `smali/e61.smali` signalent l’indisponibilité de ces profils. Les mécanismes locaux de langue Android dans `bh` ne sont pas des profils Spotify et restent inchangés.

### Lecteur, navigation mobile et zones système

- `playFromUri`/recherche naviguent vers les pages officielles Spotify; les URI d’éléments sont validées et les URL avec credentials/port non autorisé rejetées. Les recherches mal encodées ne font pas échouer le script.
- Le parcours de catalogue natif (`fetchMediaItems`/`searchMediaItems`) retourne explicitement des résultats vides avec un avertissement plutôt que d’appeler des interfaces privées. Les contrôles existants du Web Player restent pilotés par son interface, mais ne sont pas testés ici.
- `window.switchLs` conserve l’état même si la sidebar Spotify n’existe pas encore. Accueil et Recherche ferment aussi le tiroir dans le modèle d’état, et la fermeture initiale est explicitement demandée.
- L’avertissement de session est inséré dans le flux du contenu, pas en superposition fixe. Le CSS mobile conserve les couleurs sombres/accent vert et les insets système existants; les styles s’adaptent au mobile sans cacher volontairement le formulaire de connexion.
- `smali/m9.smali` conserve l’agent utilisateur WebView standard et ne réintroduit pas le spoofing desktop au document-start.

### Workflow Preview et documentation

- `.github/workflows/preview-apk.yml` et les guides utilisent maintenant le tag inédit `v1.2.2-test.20-preview` (la test.19 est déjà publiée). Le `versionCode` calculé est `1020221`, contre `1020220` pour la test.19.
- `target_commitish` pointe maintenant sur `${{ github.sha }}`, afin que le tag corresponde au commit de la branche sélectionnée qui a été compilé, et non à `main`.
- `README.md` et `docs/preview-apk.md` expliquent la sélection de branche et la prochaine version Preview. Les dix éléments Apktool attendus par le workflow sont présents à la racine.
- La vérification distante en lecture seule n’a trouvé aucun tag `v1.2.2-test.20-preview` au moment de l’audit. Aucun workflow n’a été déclenché et aucun APK/release n’a été produit.

## Tests et validations effectués

| Vérification | Résultat |
|---|---|
| `node --check` sur tous les `assets/*.js` et `tests/*.js` | Réussi |
| `node --test tests/*.test.js` | **12 tests réussis** au total : 11 cas unitaires/static (auth, retour de connexion, expiration, redémarrage, tiroir/zones système, profil, WebView TLS/origine) et contrôle structurel Smali |
| `tests/smali_sanity.test.js` | Réussi pour les fichiers Smali modifiés : blocs méthode équilibrés et cibles directes des branches résolues; ce n’est pas un assembleur |
| Analyse CSS par `tinycss2` | 122 règles de premier niveau, 0 erreur de syntaxe détectée |
| Analyse YAML avec PyYAML `BaseLoader` | Les deux workflows sont syntaxiquement valides |
| `bash -n` sur les blocs `run` des deux workflows | 8 blocs vérifiés, tous syntaxiquement valides |
| Préconditions du workflow Preview | 10/10 éléments Apktool présents; le tag test.20 est accepté et le `versionCode` dépasse celui de test.19 |
| `git diff --check` | Réussi |
| Recherche statique token/endpoints privés dans `assets/` et `smali/` | Aucun marqueur `spot_auth_token`, `spot_cli_token`, `Client-Token`, endpoint Pathfinder/connect-state, `CookieManager.getCookie/setCookie`, ni `localStorage.getItem/setItem` trouvé |

Des chaînes génériques `Authorization`/`Proxy-Authorization` subsistent dans `ei.smali`, `g40.smali`, `jg1.smali` et `xg.smali`; aucune URL privée Spotify n’a été trouvée en lien avec elles. Elles n’ont pas été modifiées dans cet audit.

## Limites et fonctions non vérifiées

- Les sélecteurs du lecteur (`data-testid`, `aria-label`) sont des détails DOM Spotify non contractuels. Une mise à jour HTML peut conduire à l’état `unknown` et à l’avertissement; l’authentification n’est pas présentée comme confirmée dans ce cas.
- L’API Android `addJavascriptInterface` expose l’objet à tous les frames du document Web Player autorisé et ne révèle pas à l’objet l’origine de son frame appelant. Le code le retire pour les autres pages principales, mais ce risque résiduel dans un frame intégré au lecteur ne peut pas être éliminé par ce simple bridge. L’acceptation de cookies tiers reste activée pour ne pas casser un flux officiel non testé; aucun code Melodix ne lit ces cookies.
- Le catalogue natif de recherche/navigation et le tri ajouté par l’ancien script privé sont volontairement indisponibles. Les éléments Spotify ouvrent les pages officielles; la compatibilité des fonctions de lecture et des contrôles DOM dépend toujours du Web Player.
- Les chemins explicites de nettoyage restent présents : déconnexion réglages via `MainActivity.A()`/`l0`, et bouton **Log in to New Account** via `w51`/`b2`. Ils sont déclenchés par l’utilisateur; le détecteur de session et le retour de `accounts.spotify.com` ne les appellent pas.
- Aucun assembleur Smali, Java ou Apktool n’est installé localement. Les tests structurels Smali ne valident ni les registres Dalvik, ni l’assemblage, ni l’exécution.
- Aucun appareil Android, formulaire officiel, session Spotify valide/expirée, redémarrage réel, lecture, capture d’écran ou rotation n’a été testé. Les validations ci-dessus sont statiques/unitaires et ne prouvent pas un résultat visuel ou une connexion réelle.
- La validation YAML/Bash ne remplace pas l’exécution par GitHub Actions. Les secrets de signature n’ont pas été inspectés et le workflow de publication n’a pas été lancé.

## Étapes ultérieures pour une APK de test

À effectuer seulement lorsque la publication sera autorisée :

1. Revoir le diff sur `arena/dbf2d44f-melodix`, puis demander/obtenir l’autorisation explicite avant tout commit ou push.
2. Vérifier que les secrets Preview requis existent dans GitHub Actions, sans les afficher ni les copier dans le dépôt.
3. Dans **Actions → Build Melodix Preview APK → Run workflow**, choisir `arena/dbf2d44f-melodix` et le tag `v1.2.2-test.20-preview`. Le workflow est prévu pour compiler le commit sélectionné et publier une Preview distincte; il n’a pas été lancé pendant cet audit.
4. Après succès, vérifier le checksum `.sha256`, puis installer l’APK comme mise à jour de **Melodix Preview**. La Preview conserve son package et ses données séparés; il n’est pas nécessaire de désinstaller l’application normale.
5. Sur appareil, tester : première ouverture sans session; connexion via la page Spotify officielle; retour au lecteur; session expirée et retour à la connexion sans boucle; redémarrage avec session valide puis invalide; déconnexion explicite; navigation Accueil/Recherche/Bibliothèque et ouverture/fermeture du tiroir sur petit écran portrait/paysage; zones système et contrôles lecture/position/piste.
6. Consigner séparément les résultats appareil/session réelle. Ne pas annoncer une authentification ou une lecture vérifiée avant ces essais.
