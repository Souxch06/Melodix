# Suite au relevé téléphone de l'APK A

Base fonctionnelle : A `f560281c6487d56b12085a6de4af6d55a4e78a3f`, et non l'expérience B. B et son rapport restent dans l'historique ; ses modifications ont été retirées du code avant ce travail. Le nouvel artefact est une Preview isolée, pas une fusion dans main.

## FAIT (implémentation et tests hors téléphone)

- Position : couple complet `playback-position` / `playback-duration` en texte m:ss prioritaire, puis range ou média en repli ; la source figure dans le diagnostic. Valeurs incohérentes écartées. La lecture et les écouteurs de seek restent inchangés : comparaison des quatre méthodes Smali, hors métadonnées de ligne, identique à A.
- Retour : la correction positive est bornée à 1,25 fois ; correction douce pour un petit écart, saut propre à partir de 3 s. Une première observation fraîche cohérente peut être acceptée dès 1 s. La quantification du range n'est pas traitée comme une preuve expliquant les écarts du téléphone.
- Sonde Mode consultable/copiable : catégories structurelles et comptes de testid, rôles et libellés, sans titre, artiste, identifiant de piste ou données de compte. Reconnaissance conservatrice de variantes localisées, états avant/après et messages d'absence. Like ne retire pas un like déjà actif ; les menus ou états ambigus ne sont pas cliqués. Aucun panneau caché n'est ouvert pour contourner un contrôle absent.
- Aucun nouveau code ne lit de jeton, cookie ou en-tête et aucune requête propre vers Spotify n'est ajoutée. Garde locale 7/7 sur projet et APK non signée ; garde bloquante à répéter sur l'APK signée dans le workflow.

## PARTIEL / BLOQUÉ

- Aléatoire et Like : sélecteurs et sonde élargis, mais les contrôles manquants sur le téléphone restent de cause inconnue. Il faut relever la nouvelle sonde pendant lecture. Les tests DOM sont synthétiques, pas une preuve du DOM réel ni du fonctionnement Spotify.
- Volume : tentative expérimentale sur l'unique `input[type=range]` associé à `volume-bar`, événements input/change, curseur 0–100 et silence/restauration si la valeur précédente est connue. Ne modifie pas AudioManager. Pas de garantie que Spotify accepte l'événement ou contrôle réellement le son ; si le range est absent, ambigu, invalide ou désactivé, le contrôle est indisponible.
- File, Paroles, Appareils : **BLOQUÉ**. Aucun contenu lu ni sonde de ces panneaux ; un message natif d'indisponibilité remplace chaque panneau. Aucune WebView n'est rendue visible. Il faut une observation réelle de la structure pour implémenter des tiroirs natifs ; ce n'est pas une livraison fonctionnelle de ces trois options.
- Retour au premier plan : l'activité remet `__sdBg=false` et relance conditionnellement les routines dont les minuteries ont été arrêtées ; le service poste une tâche de reprise WebView/minuteries/visibilité, et le code préexistant contient des automatismes de lecture conditionnels. Ces constats ne démontrent pas la cause du « playing » observé ni une reprise effective du son. Aucun changement de logique de lecture n'a été ajouté. Choix à demander : conserver ce comportement ou envisager une pause au retour ; ne rien changer avant décision.

## Vérifications et téléphone

Tests simulés : shell/horloge/lecture optimiste 27/27, Mode/diagnostic/volume DOM 23/23, trois simulations JVM, patch 13/13, garde protégée locale 7/7, compilation UTF-8 et texte Smali. Une APK non signée a été assemblée localement. Aucun téléphone ni lecture Spotify réelle testé.

Sur téléphone : lancer un titre, copier la sonde Mode avant et après un appui sur Aléatoire/Like ; vérifier absence de retrait ; relever la source horloge et la position après retour (1 s, 3 s, 5 s) ; noter séparément état affiché et son audible ; tester volume 0/50/100, silence/restauration et changement de titre en vérifiant volume Android inchangé ; ouvrir les trois tuiles et vérifier message natif et absence de WebView. Ne pas partager de données de session.

## Échec de l'unique lancement CI et correction préparée

Le workflow `43861211452` du commit `9ed5921203dc12148a19bba36d46ba9430b433a6` a échoué avant compilation/signature à la phase `apply 1022131 feedback: progress and search`. La comparaison de l'APK signée 9016 ne s'est pas exécutée : il n'y a donc ni nouvel APK signé ni garde signée 7/7. Le changement de shell a modifié le SHA d'entrée attendu par ce patch ultérieur ; son pin et celui du patch bibliothèque qui suit ont été actualisés. La chaîne complète de ces patches a été rejouée sur une copie partielle des entrées, puis le shell a passé 27/27 tests et les contrôles structuraux compilés. Cette correction n'a pas été validée par un workflow complet. Aucun nouveau lancement automatique n'a été effectué.
