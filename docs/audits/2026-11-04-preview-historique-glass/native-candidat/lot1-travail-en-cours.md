# Lot 1 Preview — travail en cours, non livrable

Référence de non-régression : Preview 9016, livraison `f5f32ffe61dea424486639468b1729cbbeea6c9f`, base historique `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`. Voir [diagnostic des deux bases](../diagnostic-lot1-reference.md). Ni les tests ni la mesure de l'application racine ne sont modifiés. Le lot 1 n'est pas déclaré conforme et aucun APK du lot ne doit être installé ou distribué à ce stade.

## Travaux préparés

- Un garde épingle les sept assets protégés de la 9016 et compare leurs octets par SHA-256 dans le projet transformé puis dans l'APK signé. Des tests vérifient le rejet d'une modification, d'une absence et d'un doublon dans le ZIP. Il est activé dans la chaîne historique, y compris le travail en cours.
- Un patch épinglé traite les valeurs du lecteur comme des secondes, corrige le remplissage des secondes et produit `h:mm:ss` à partir d'une heure. Un test exécute le shell réel en JSDOM, puis interprète un sous-ensemble strict des instructions Smali décodées jusqu'aux champs de texte simulés : les sept cas demandés et 38 s / 141 s passent. Sur la 9016, ces assertions échouent. Ce test est **une simulation**, pas une exécution ART ni une observation des vues Android.
- Un second patch préparatoire enlève la forme de bouton des repères Home, remplace l'ancien libellé Preview au seul rendu des réglages, ajoute une marge de 16 dp aux réglages, masque l'engrenage sur cet écran et prépare des replis dégradé/note pour les pochettes. La zone défilante et le mini-lecteur sont des frères dans une disposition verticale pondérée ; les réserves basses sont augmentées à 32 dp. Les tests sont structurels ; la possibilité de faire défiler le dernier élément au-dessus du mini-lecteur reste à confirmer sur téléphone.
- La comparaison de tous les IDs publics de ressources entre les APK décodés 9016 et candidat passe en local. Aucun CSS n'a été modifié.

## Vérifications et limites

Compilation et redécodage apktool locaux réussis ; 46 tests JS ciblés sur le Smali décodé et les scripts synthétiques réussis ; les contrôles structuraux du patch visuel et ceux de la garde passent. Les tests ne prouvent pas le rendu, la charge d'une image, le geste Android, la lecture, le temps restant ni les durées de listes sur un téléphone ou un compte Spotify réel. Le lecteur natif montre une position et une durée totale ; aucun affichage de temps restant n'a été établi. Les durées de listes n'ont pas encore été validées.

La 9016 utilise une seule sauvegarde de retour : des écrans imbriqués tels que playlist → lecteur → réglages peuvent écraser l'origine. Le retour Android passe par le dispatcher hérité et ne suit pas encore nécessairement le bouton natif. L'utilisateur a autorisé le raccordement au retour natif, sans modification de récupération ou contenu des playlists. Ce travail, ses tests et une vérification sur téléphone restent à faire.

Le sélecteur CI `v1.2.2-test.9017-preview` est un **contrôle de travail en cours** : il construit et teste le candidat, mais n'en publie aucun artefact. Une CI verte ne signifie pas que le lot est complet. Ne pas fournir de lien d'installation avant correction et validation de l'ensemble du lot.
