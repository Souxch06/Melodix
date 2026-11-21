# Suivi visuel du lecteur

Périmètre : présentation uniquement à partir de b88ac803. Les quatre layouts sont générés par `apply_preview_player_visual.py` ; la présentation des tuiles est dans `PreviewPlayerTiles.java` et son smali. Aucune nouvelle ressource publique, aucun nouvel accès DOM, aucune action modifiée. Le listener de volume généré a été comparé au bytecode précédent, octet pour octet après recompilation avec les anciens numéros de ligne conservés.

| Zone | Résultat |
| --- | --- |
| En-tête | Partiel : chevron, titre neutre centré, points indisponibles. Barre supérieure avec réglages conservée. Aucun nom de playlist inventé. |
| Pochette | Agrandie (limite 480 dp), coins et bordure ; même vue et même chargement, placeholder onde conservé. |
| Titre | 26 sp, deux lignes avec ellipse ; artiste clair et jusqu'à deux lignes ; bouton +/état existant conservé. |
| Progression | Dégradé et curseur blanc existants, pas de halo permanent ; seek et événements inchangés. |
| Commandes | Icônes sans pilule, centre agrandi en dégradé avec élévation ; état rose existant, pas de point conditionnel ni de halo rose garanti. |
| Tuiles | Quatre boutons arrondis avec symboles agrandis et libellés sur plusieurs lignes. Ancrage en bas quand la hauteur le permet en portrait ; en paysage ou petit écran, défilement si nécessaire. File, Paroles et Appareils restent indisponibles, volume reste local. |
| Fond | Dégradé violet/noir et lueur rose positionnée en bas à droite. |

Dette de confidentialité conservée sans extension : `preview-extras/PreviewPlayerMode.java` (`observe`, `invoke`, `call`), `preview-extras/control.js` (fonction anonyme de contrôle) et `assets/spotify_bridge.js` (`actAddToFav`, `actShuffle`, `actRepeat`). Les tests DOM sont synthétiques. Ce lot n'ajoute aucune lecture.

Contrôles locaux : quatre layouts et ID des ressources ; comparaison bytecode du lecteur, des modes et du listener volume ; sept actifs protégés identiques à 9016 ; tests historiques (6/6), autres contrôles décodés et 145 tests Node ; simulation JVM ; APK non signée construite et redécodée. Premier essai : le test historique d'égalité de tous les ID a échoué avec de nouvelles ressources ; ces ressources ont été retirées et le test inchangé repasse. Un appel de test sans argument a échoué (IndexError), puis réussi avec son chemin requis. Aucun test Android visuel, texte système, Spotify ou audio n'est prouvé par ces contrôles.
