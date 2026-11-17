# Retour lecteur, volume et Like

## Transitions et volume

Le retour indique un fond noir visible pendant la réduction du lecteur. La cause exacte sur le téléphone n'a pas été observée ici ; dans le code précédent, seul le contenu du lecteur se déplaçait, tandis que l'écran précédent restait masqué jusqu'à la fin de l'animation. Cela explique un fond intermédiaire possible sans prouver que c'est l'unique cause sur l'appareil.

Avant l'ouverture, on capture uniquement la vue native déjà affichée, jamais la WebView cachée. Cette image temporaire, limitée à 1,2 million de pixels et non persistée, est placée derrière le panneau. Le fond du lecteur se déplace avec son contenu à l'ouverture, au glissement et à la fermeture ; au retour, l'image est libérée et le routage natif existant reprend. Si la capture est impossible, le fond natif existant est conservé. Les animations désactivées par le système restent désactivées. Aucun changement de lecture ou de seek.

Le panneau du volume conserve les mêmes commandes du volume de la page Spotify, sans AudioManager. La carte a un dégradé Glass et les actions Silence/Réactiver et Actualiser ainsi que les bornes du curseur ont des icônes ; les libellés et descriptions restent accessibles. L'état indisponible et l'actualisation sont conservés.

## Like

Le nouveau retour indique que Like ne fonctionne toujours pas avec l'APK fournie. Il est cohérent avec les deux diagnostics déjà relevés en 1022193/1022194, mais ne précise pas une nouvelle cause. Ces diagnostics ne montraient ni identité de piste ni bouton Like reconnus dans la page. Le bridge protégé fournit un ancien repli positionnel dont un contre-exemple a démontré le clic sur une cible sans rapport et deux déclenchements de lecture ; il n'est pas utilisé. Aucun ajout, retrait ou succès n'est inventé : **Like reste bloqué**, faute d'un contrôle et d'une identité vérifiables respectant les contraintes. Voir `RETOUR_LIKE_1022193.md`.

## Validation

- Tests JVM simulant le geste, la capture bornée, l'échec de capture, les icônes et le volume : réussis.
- Chaîne locale jusqu'à l'APK non signée : réussie, 97 scénarios JS du lot lecteur/panneaux, contrôle Smali compilé et garde des sept fichiers 9016 : 7/7.
- Aucune validation Android réelle de l'animation, du rendu des icônes ou d'un Like réussi. Aucune APK signée publiée sur cette base. L'état est **partiel**, et non une correction confirmée sur téléphone.
