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

## Poursuite du diagnostic Like

La sonde passive compte désormais les boutons Like reconnus par identifiant ou libellé et les liens de piste **en dehors** des zones lecteur reconnues. Ces nombres sont plafonnés à 99, ne contiennent ni titre, ni lien, ni identifiant ni données de session, et peuvent correspondre à une playlist ou à une autre piste : ils ne déclenchent aucun clic et ne prouvent pas une identité. Ils permettent uniquement de distinguer un contrôle éventuellement présent ailleurs d'un contrôle non reconnu dans tout le document. La sécurité Like et la conclusion bloquée ci-dessus ne changent pas.

Vérification locale de ce diagnostic : 99 scénarios JS du lot lecteur/panneaux, tests JVM et geste, décodage de l'APK non signée et garde 9016 7/7 réussis. Aucun résultat Like réel n'est établi par ces simulations.

## Captures suivantes : bandeau, boutons et Like

- Le bandeau de statut adopte la teinte sombre du haut du lecteur ; ses drapeaux et sa couleur d'origine sont restaurés à la fermeture. Pour Android 15 et la cible 35, un fond est dessiné uniquement dans l'inset du statut afin de gérer la barre transparente imposée par le système. Ceci reste à vérifier visuellement sur l'appareil réel.
- Les icônes système de taille intrinsèque séparaient les icônes des libellés dans les boutons. Les commandes sont maintenant centrées avec de petits symboles et un texte accessible ; le curseur Spotify et la logique audio restent inchangés.
- Le toast « Déjà dans vos titres likés » est bien visible dans la capture mais ne prouve pas le contenu de la bibliothèque. Les faux états/clics génériques reproductibles sont corrigés ; voir `LIKE_SECURITE.md`. L'ajout n'est pas présenté comme validé sur Spotify réel.
- Vérification finale : 103 scénarios JS du lot lecteur/panneaux, simulation JVM (dont restauration de la barre d'état et gestes), compilation UTF-8 et décodage Smali, chaîne jusqu'à l'APK non signée et garde 9016 : 7/7. Aucun des sept fichiers protégés modifié.

## Retour après c41ee42b — transitions et volume

- La couleur système suit maintenant la translation du lecteur : interpolation pendant ouverture, fermeture et glissement, remise en place après retour annulé, et nettoyage du listener. Sur Android 15+, l'opacité de l'overlay d'inset suit aussi le geste. Les paramètres d'origine sont restaurés après fermeture.
- Panneau volume épuré, contrôles centrés et pictogrammes vectoriels dessinés localement ; les commandes existantes ne changent pas.
- Simulations JVM geste, statut et volume, vérification Smali, suite locale APK non signée et contrôle des sept ressources protégées réussis. Cela ne remplace pas un essai visuel sur téléphone réel.

## Retour téléphone : panneau et logo pendant la descente

- Panneau volume plus compact : valeur près du titre, curseur dans une surface discrète, actions moins saturées et fermeture accessible dans l'en-tête. Les commandes existantes et la distinction avec le volume système sont conservées.
- Les panneaux Volume, File, Paroles et Appareils partagent une ouverture verticale de 340 ms et une fermeture de 280 ms, avec courbes proches du lecteur. Retour, fermeture, clic extérieur et glissement de l'en-tête passent par la même fermeture ; un court glissement est annulé. La fermeture immédiate est conservée lors de la destruction ou du masquage et les animations système désactivées sont respectées. Les autres dialogues de confirmation ne sont pas transformés en panneaux.
- L'image temporaire de l'écran précédent est dessinée sur un canevas logiciel, qui peut ignorer les coins arrondis matériels des CardView. Le logo d'en-tête et la pochette du mini-lecteur sont masqués pendant ce dessin, puis redessinés avec leur masque arrondi ; leur alpha est restauré même en cas d'erreur. Cela vise le carré observé pendant la transition, mais l'aspect doit encore être vérifié sur téléphone.
- Les simulations JVM couvrent glissement, annulation, fermeture différée, nettoyage et animations désactivées ; le dessin masqué et la restauration des images sont simulés. APK locale non signée vérifiée, sept ressources protégées identiques. Aucune validation visuelle sur appareil réel.
- Le Like est signalé toujours bloqué après la dernière APK. Cette version ne prétend pas le corriger : recueillir les lignes « Like » et « Structure lecteur » du diagnostic après un essai, sans titre ni données de session, afin d'identifier la cause avant toute nouvelle action.

## Essai suivant — raccords système et panneaux

- Restauration du fond vivant immédiatement après le retour natif, avant de remettre la translation du lecteur à zéro ; test JVM des branches sortie réussie et retour refusé. L'origine exacte de la micro-frame reste à confirmer sur appareil.
- Les couleurs des bords du fond natif du lecteur sont échantillonnées sans accès WebView ; elles prolongent le fond dans les barres système. Dégradés dans les insets Android 15+, transition à la descente et restauration des couleurs, drapeaux et contraste précédents. Rendu/contraste à vérifier sur téléphone, en particulier selon le mode de navigation Android.
- File, Paroles et Appareils reprennent l'en-tête, le fond, la poignée, les cartes et les boutons du volume ; le même composant assure déjà les animations et gestes. Icônes vectorielles partagées, descriptions accessibles et boutons inchangés côté commandes.
- Java compilé UTF-8 avec ECJ, conversion DX puis Smali apktool, empreintes mises à jour ; simulations JVM, scripts embarqués et compilation du candidat local réussis, dont 116 tests du lecteur et garde ressources 9016 7/7. Aucun test Android réel n'a été réalisé ici.
- Like inchangé : toujours en attente des lignes de diagnostic anonymes « Like » et « Structure lecteur » ; aucun succès Spotify n'est supposé.
