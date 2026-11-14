# Playlists Spotify dans l'interface Melodix — APK de test

## Objectif et changement

La version précédente ouvrait la WebView Spotify après connexion. Cet essai conserve la WebView et sa connexion, mais rend à nouveau l'interface native Glass prioritaire et raccorde les playlists présentes dans le DOM Spotify à l'accueil et à la bibliothèque Melodix. Une playlist peut ouvrir une page de détail native. La lecture des données DOM repose sur un signal d'interface Spotify connectée ; elle ne constitue pas une preuve d'accès à l'API privée `libraryV3`, dont l'état reste distinct.

Le collecteur s'exécute uniquement dans le document principal HTTPS `open.spotify.com`, et le pont est attaché uniquement sur cette origine principale. Android `addJavascriptInterface` reste toutefois exposé aux frames de la WebView : ces contrôles de page principale ne sont pas une isolation par origine des frames, limitation préexistante à traiter séparément. Le collecteur ne consigne pas les titres, liens ou images de playlists dans les diagnostics. Les callbacks d'ancienne page sont bloqués pendant le login et les données natives mémorisées sont effacées lorsque le login s'ouvre. Un ancien collecteur Home indépendant, susceptible d'écraser les nouvelles données, n'est plus programmé.

Le DOM peut être partiel ou virtualisé : la bibliothèque projette au maximum 500 éléments chargés par Spotify, pas nécessairement toutes les playlists du compte. Aucun téléchargement supplémentaire ni accès officiel Spotify Developer n'est ajouté. La compatibilité avec le DOM et les parcours réels sur téléphone reste à vérifier.

## Validation

- Tests Node : **580/580**, dont tests DOM jsdom, transitions d'état, origine et tests de structure smali. Certaines assertions interdisant tout DOM sans preuve API ont été adaptées à la nouvelle fonctionnalité ; les tests conservent la distinction entre données DOM et preuve API.
- APK assemblé avec apktool, aligné, signé ; vérification des signatures v2/v3 pour Android API 24–36. Le certificat correspond au dernier APK de test : SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.
- APK décodé : assets JS/CSS comparés avec les sources construites, présence des nouvelles méthodes vérifiée. Aucun téléphone ni émulateur disponible ; aucune conclusion sur le login, les playlists complètes, le défilement ou la lecture sur appareil réel.
- APK `1.2.2-glass-playlists-natives-test.apk` : SHA-256 `efab3577539c9265a53f5764464eb83aea8cf4ff0c18651fdfa8be988f93a0a8`, paquet `com.melodix.music`, version 1.2.2 / code 27.

## Reproduction

`correctif-playlists-sur-base-44902.patch` applique les sources, ressources et tests du candidat à la base git `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`. SHA-256 : `78722b6fe58dfa3447831f89ea988c1f9096e6e87b88f98f6a2f2849d9f6b3fd`. Application vérifiée sur une extraction propre de cette base et fichiers principaux comparés. `prototype-non-valide.patch` est un ancien essai incomplet conservé pour historique : ne pas l'utiliser pour cette version.

Le keystore et son mot de passe restent hors du dépôt. Les fichiers WIP préexistants de la branche de travail locale n'ont pas été remplacés.
