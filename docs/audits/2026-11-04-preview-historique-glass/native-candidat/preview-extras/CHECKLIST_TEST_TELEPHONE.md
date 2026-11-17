# Checklist de test téléphone — Preview, à exécuter plus tard

Ne tester un nouvel APK qu'après publication, versionCode et garde signée 7/7 confirmés. Aucune case n'a été validée sur téléphone. Avant de commencer, relever les nombres de titres d'une playlist et des Titres likés sans les modifier. Prévoir une écoute à volume modéré et éviter de partager titre, artiste, identifiant ou données de session dans les diagnostics.

| Action | Résultat attendu | Ce qui indique un échec |
|---|---|---|
| Lancer un titre, mettre l'app en arrière-plan puis revenir ; relever 1, 3, 5 et 10 s et le diagnostic | Barre cohérente, pas de rattrapage visiblement accéléré ; état de la page distingué de l'état natif ; son relevé séparément | Gel prolongé, saut incohérent, barre accélérée, état différent de la page sans explication, reprise audible inattendue |
| En lecture, essayer Aléatoire et copier la sonde avant/après | État réel confirmé ou bouton grisé avec raison explicite | Commande prétendue réussie sans changement, état inconnu ou absence inexpliquée |
| Choisir un titre non liké, appuyer une fois sur Like puis vérifier son état | Ajout confirmé ou raison d'indisponibilité ; aucun retrait automatique | Retrait d'un titre déjà liké, choix de playlist non sollicité, succès non confirmé |
| Régler Volume lecteur à 0, 50 et 100 %, essayer Silence puis Réactiver | Son du lecteur varie, valeur affichée suit la page et Silence restaure la dernière valeur connue ; volume Android inchangé | Aucun effet sonore, valeur fausse, volume Android bouge, touches physiques interceptées |
| Appuyer sur File, puis fermer / Retour | Panneau natif lisible ou message « Indisponible dans cette version » ; aucune WebView visible | Vue Web visible, contenu incohérent, bouton bloqué ou Retour ne ferme pas |
| Appuyer sur Paroles puis fermer | Paroles natives si disponibles, sinon message d'indisponibilité ; aucune WebView visible | WebView visible, texte incohérent ou panneau impossible à fermer |
| Appuyer sur Appareils puis fermer | Liste native si disponible, sinon message d'indisponibilité ; aucun transfert sans confirmation ; aucune WebView visible | WebView visible, transfert imprévu ou panneau impossible à fermer |
| Ouvrir Titres likés | Les titres s'affichent et le nombre correspond au relevé initial | Chargement sans fin, liste vide ou nombre différent ; conserver la phase du diagnostic |
| Ouvrir une playlist | En-tête puis titres corrects ; noter les délais et les phases affichées | Chargement bloqué, données d'une autre playlist, compte différent ou délai anormal |
| Ouvrir le lecteur depuis Accueil, bibliothèque et une playlist ; fermer par flèche, Retour Android et glissement de l’en-tête ou de la pochette | Transition fluide, retour à l’écran précédent ; glissement court ou horizontal annulé ; désactiver les animations système pour vérifier le retour immédiat | Mauvais écran, lecteur invisible ou bloqué, fermeture involontaire, interruption de lecture |
| Pendant la lecture, chercher plusieurs positions avec la barre | Un seul seek par geste, position stable et lecture continue | Retours arrière inattendus, commandes multiples ou lecture interrompue |
| Continuer la musique pendant navigation et retour | Pas de coupure non demandée | Silence, pause ou redémarrage inattendu ; distinguer son réel et état affiché |
| Recompter la playlist et les Titres likés après les essais | Même nombre de titres qu'avant, sauf like ajouté volontairement et vérifié | Titre disparu, doublon ou changement non demandé ; ne pas poursuivre d'actions destructives |

Les contrôles File/Paroles/Appareils peuvent être délibérément indisponibles dans la version en attente : ne pas considérer le message natif comme une preuve que les futurs tiroirs fonctionnent. Les tests simulés ne remplacent pas ces vérifications.
