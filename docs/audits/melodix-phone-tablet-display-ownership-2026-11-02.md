# Note de correction P0 — différencier téléphone et tablette

- **Date :** 2 novembre 2026
- **Branche :** `arena/7142700d-melodix` (PR #7 maintenue ouverte)
- **Observation utilisateur :** APK `1.2.2-5de71c0`; cette observation est rapportée par l’utilisateur et n’a pas encore été reproduite dans l’émulateur de CI.

## Observation à conserver

**Téléphone :** Melodix apparaît brièvement au démarrage, puis Spotify Web reprend le contenu central tandis que le dock natif Melodix reste visible.

**Tablette :** l’interface Melodix s’applique directement et reste affichée. Des défauts visuels de playlists subsistent, mais le remplacement complet par Spotify Web n’est pas reproduit.

Il ne faut donc pas traiter l’incident comme un comportement uniforme sur tous les appareils, ni corriger la propriété de l’affichage d’une manière qui dégrade le rendu tablette. Les défauts des playlists sont un sujet distinct de la reprise du contenu central par Spotify Web.

## Comparaison exigée avant validation

Comparer le même APK et le même état de session déconnecté sur deux profils Android reproductibles :

| Profil | Cible | État à établir |
|---|---|---|
| Téléphone compact | Émulateur de dimensions compactes et densité de téléphone | Mesurer résolution physique/logique, largeur/hauteur en dp, densité, `smallestScreenWidthDp`, orientation et viewport WebView. |
| Tablette large | Émulateur de dimensions larges et densité de tablette | Mesurer les mêmes paramètres et vérifier le comportement de la configuration `sw600dp`/large largeur disponible. |

**État des tests au 2 novembre :** le workflow courant n’exécute qu’un profil d’émulateur; sa matrice de largeurs WebView est une fixture isolée, pas une reproduction tablette du même APK. La comparaison réelle téléphone/tablette ci-dessous reste à mettre en place et à valider; aucune preuve de non-régression tablette n’est actuellement revendiquée.

Pour chaque profil, conserver uniquement des métadonnées non privées et comparer :

- `SF_CONFIG.guiMode` (`csshack`, `bigwindow` ou valeur autorisée/inconnue) ;
- largeur/hauteur en pixels et dp, densité Android, `smallestScreenWidthDp`, orientation ;
- viewport WebView (`innerWidth`/`innerHeight`, `screen`, `devicePixelRatio`) ;
- classes CSS Melodix/mobile explicitement autorisées sur le `body` (aucun `className` complet ni texte Spotify) ;
- visibilité, géométrie et ordre réel de `nativeRoot` et du conteneur WebView ;
- transitions de propriétaire d’affichage, réduites aux catégories native/Web/login et aux routes autorisées.

Capturer et vérifier les deux profils aux échéances **200 ms, 1 s, 3 s, 8 s et 20 s**. Associer explicitement chaque mesure à son profil et à son temps observé; ne pas présenter une mesure après stabilisation comme si elle était prise depuis le lancement. Le même APK doit être identifié par son SHA de build de CI. Chaque profil repart d’un état de session déconnecté identique, sans compte, cookie ni contenu privé fourni par le test.

## Critère de réussite

L’interface Melodix conserve la propriété de l’écran sur téléphone **et** tablette jusqu’à 20 secondes, sans qu’un callback, lecteur ou watchdog tardif laisse Spotify Web recouvrir le centre sur téléphone. Le profil tablette conserve son comportement fonctionnel et son rendu des playlists déjà observé; toute correction de défaut visuel de playlist reste suivie comme un second sujet.

Un build ou un test statique ne vaut pas reproduction sur appareil. Tant que les deux profils et les cinq échéances ne sont pas observés, ne pas déclarer ce volet validé ni le P0 corrigé.
