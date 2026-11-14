# Preview historique d0f206b0 + CSS Glass complet

## Portée et choix

À la demande explicite de l'utilisateur : base entière `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`, parent de `9435c8a8` ; **ancienne connexion comprise**. Le seul remplacement fonctionnel voulu est `assets/css_hacks.css`, par [le CSS Glass complet](css_hacks_glass_complet.css) (SHA-256 `0d1ab6aa71f6978c5b5e1268566306d2811dfcf30c83831027293d36c38ab2f3`, y compris section 9). Source du CSS : `docs/audits/2026-11-04-hypothese-css-section9/css_hacks_original.css` à `7fd27944`.

La préparation opère **uniquement sur une copie temporaire** : identifiant, autorités/permissions et actions PIP adaptés au package `com.melodix.music.preview`, certificat Preview épinglé, numéro et provenance de build. Aucune modification de l'application normale ni de sa clé. Les JS historiques `spotify_bridge.js` et `native_ui_shell.js` sont contrôlés par SHA-256 avant/après, sans modification des en-têtes, notamment `spotify-app-version` d'origine `1.2.40.0`. Les autres fichiers du projet restent ceux de la base, hors ces adaptations Preview et CSS. La restauration annule aussi de fait les correctifs ultérieurs test9000/9001/9002 dans cette variante ; elle ne les intègre pas.

Le CSS agit sur la page Web ; il ne recolore pas nécessairement tous les éléments Android natifs historiques. Il est plus volumineux que l'ancien CSS ; son injection et son rendu complets sur l'appareil n'ont pas été vérifiés. Le fonctionnement actuel de Spotify, les images et l'exhaustivité des playlists ne sont pas garantis par l'ancien code.

## Risques et différences importantes

Cette version n'est **pas durcie comme les versions récentes**. Le bridge historique récupère des jetons depuis les en-têtes et les stocke dans le stockage local de la WebView ; des interfaces JavaScript et une logique de profil/session anciennes sont présentes. Le débogage WebView est activé dans la base historique : cette construction ne vise que Preview, mais un ordinateur connecté en débogage peut inspecter sa WebView. Ne pas partager les jetons, cookies, données privées ou une sortie de débogage brute. L'ancienne gestion TLS appelle `cancel()` pour les erreurs de certificat dans un build non déboguable ; son chemin déboguable peut appeler `proceed()`. Le workflow retire `android:debuggable` et ne publie que cette variante non déboguable ; aucune validation sur appareil n'est faite. Le manifeste historique autorise également le trafic HTTP en clair (`usesCleartextTraffic=true`). Des tests de sécurité historiques échouent : ne pas interpréter une compilation comme une validation de sécurité.

La Preview a ses données Android séparées, mais utilise le même compte Spotify si l'utilisateur s'y connecte. Éviter les réseaux non fiables et n'installer qu'en connaissance de ces limites. Le test Preview ne modifie pas les fichiers ou données de l'application normale ; il ne promet pas qu'une nouvelle connexion ne sera pas nécessaire.

## Vérifications locales

Voir aussi les [tests complémentaires sans téléphone](tests-sans-telephone.md), leurs résultats et limites.

- Base historique récupérée avec le SHA ci-dessus, CSS complet et fichiers d'origine comparés par empreinte.
- Tests historiques ciblés `native_home_feed` + `native_ui` : **56/56**. Suite historique complète avec CSS Glass : **111/129** ; **18 échecs**, dont tests sur état de session, interfaces WebView et protections ; ces résultats sont des tests locaux, pas des résultats téléphone.
- Workflow : YAML et blocs Bash analysés ; **2/2** tests ciblés du sélecteur manuel. La suite des tests du workflow exécutée sur une copie antérieure donne **16/20** : quatre échecs existaient aussi avant ce changement dans cette copie, sur d’autres workflows non alignés ; elle ne constitue pas une validation CI complète.
- Préparation testée : identité Preview/PIP, conservation du bridge, refus de relancer sur un projet déjà préparé et refus si le bridge historique est altéré. La comparaison avec l’archive de base confirme que seuls le CSS, le manifeste, `apktool.yml`, les chaînes et deux fichiers Smali (actions PIP seulement) diffèrent.
- Compilation apktool 2.9.3 d'une Preview **non signée** réussie ; empreintes des trois assets (CSS, shell et bridge) extraits de l'APK identiques aux entrées. Aucun essai Android, signature Preview ou installation locale.
- Le workflow manuel épingle le certificat Preview `e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f`, contrôle package et version, compare tous les assets et ne publie qu'un artefact temporaire. Il n'a pas été lancé. Le numéro généré dépasse 1021487, mais peut être inférieur à une Preview déjà installée d'un numéro plus élevé : vérifier sur le téléphone, sans désinstaller ni effacer les données automatiquement.

## Plan utilisateur après lancement manuel et récupération de l'artefact

1. Vérifier package `com.melodix.music.preview`, certificat, version et SHA-256 de l'artefact ; garder l'application normale intacte. Si installation refusée (signature/version), ne pas désinstaller ni effacer les données : arrêter et relever le message.
2. Ouvrir Melodix Preview, puis « Ouvrir Spotify » ; vérifier si la connexion existante est conservée ou si une reconnexion est demandée.
3. Revenir à l'accueil et observer les playlists et le rendu Glass ; ouvrir **Bibliothèque**, faire défiler et ouvrir une playlist ; lancer une piste si possible. Observer les pochettes sans supposer qu'elles seront présentes dans cette ancienne version.
4. Succès : playlists visibles, ouverture et lecture effectives, connexion et application normale conservées. Échec : noter étape et message, absence/quantité de cartes, rendu Glass, lecture et éventuelle erreur ; une capture expurgée suffit. Aucun cookie, jeton ou contenu privé.

Le build peut être demandé via le workflow manuel « Build Melodix Preview APK » sur cette branche, après revue : `release_tag` = `v1.2.2-test.9003-preview` et `source_ref` = SHA complet du commit livré. Ce tag ne sélectionne que le job historique (pas test9000) ; aucun déclenchement automatique, publication de release ou fusion.
