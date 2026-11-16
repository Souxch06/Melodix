# Retour téléphone — habillage du lecteur

Ce suivi porte sur les sources de présentation et les quatre layouts générés. Aucun accès DOM ou réseau n'a été ajouté ; les actions et les fichiers protégés restent inchangés. La dette de confidentialité existante décrite dans `SUIVI_VISUEL.md` demeure.

- Un contrôleur de présentation masque l'en-tête global seulement quand le lecteur est visible et rétablit sa visibilité précédente en sortie ; les actions de réduction et de réglages restent dans les layouts. Ce cycle est à tester sur Android et après rotation/arrière-plan.
- Pochette limitée à 318 dp, centrée et dimensionnée selon la hauteur disponible en portrait ; au-delà de 130 % de taille de police, défilement autorisé. Le rendu, notamment en paysage, n'est pas validé.
- Titre sur deux lignes, séparation du bouton like, barre visuelle de 5 dp, chiffres tabulaires, temps restant rendu transparent mais associé au seek pour l'accessibilité, bouton central de 76 dp et tuiles de 56 dp de haut. Actions préexistantes conservées ; tuiles indisponibles grisées, volume local conservé.
- Libellé neutre : aucune source de nom de playlist vérifiée. Pas d'invention.
- Les insets et barres système restent ceux déjà en place : le fond derrière des barres transparentes n'est pas réalisé. La largeur exacte des tuiles et des contrôles secondaires varie avec l'espace ; le halo du curseur, le point d'état aléatoire et la réduction de la pochette en pause ne sont pas réalisés. Les animations, la forme et l'état réel des modes, les cibles tactiles, l'accessibilité du temps restant et l'absence de défilement aux dimensions demandées nécessitent une vérification sur appareil.
- `PreviewPlayerChrome.java` et ses smali portent exclusivement la présentation ; son contrôle structurel ne remplace pas un test de cycle de vie Android. Les autres tests sont conservés.

Contrôles locaux : assemblage non signé et redécodage apktool ; contrôles XML et ID des ressources sur quatre variantes ; bytecode des actions et fichiers protégés comparés ; sept actifs de l'APK locale identiques à 9016 ; 106 tests Node synthétiques et deux simulations JVM passés. Pas d'émulateur/adb disponibles, donc aucune capture avant/après ni validation Spotify, audio, TalkBack ou rendu sur téléphone.
