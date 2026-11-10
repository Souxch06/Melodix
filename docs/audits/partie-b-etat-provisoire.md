# Polish liquid glass — spécification vs réalisé

Les liens ci-dessous pointent vers les captures CI jointes à cet artefact : téléphone portrait et tablette paysage. Elles montrent exclusivement une **démo locale fictive**, sans audio et sans session Spotify. Elles permettent d'examiner le rendu de la démo et du shell partagé, mais ne valident ni les données ni les parcours réels. Les états ci-dessous distinguent le code réalisé des vérifications visuelles : la lecture manuelle des images n'a pas été possible dans l'environnement de travail.

| Spécification | État | Preuve et limites |
|---|---|---|
| Fond commun et surfaces translucides | Partiel | [Accueil téléphone](captures/demo-captures-phone/accueil.png) · [tablette](captures/demo-captures-tablet/accueil.png). Base et lueurs radiales, verre et reflet définis par ressources ; certains rendus natifs programmatiques conservent leurs propres styles. |
| Flou derrière les dialogues / feuilles API 31+ | **Pas fait** | Aucun faux `RenderEffect` appliqué aux vues ; aucun blur-behind des fenêtres ajouté. |
| Accent violet–magenta | Partiel | [Recherche téléphone](captures/demo-captures-phone/recherche.png) · [tablette](captures/demo-captures-tablet/recherche.png) ; [lecteur téléphone](captures/demo-captures-phone/lecteur.png) · [tablette](captures/demo-captures-tablet/lecteur.png). Dégradé sur onglet, boutons et progression ; interrupteurs natifs encore à teinte unie et halo coloré absent. |
| Barre et indicateur avec padding symétrique | Partiel | [Accueil téléphone](captures/demo-captures-phone/accueil.png) · [tablette](captures/demo-captures-tablet/accueil.png). Padding 4 dp déclaré ; mesure visuelle et chevauchement historique non vérifiés. |
| En-tête, retour et diagnostic | Partiel | [Playlist téléphone](captures/demo-captures-phone/playlist.png) · [tablette](captures/demo-captures-tablet/playlist.png) ; [réglages téléphone](captures/demo-captures-phone/reglages.png) · [tablette](captures/demo-captures-tablet/reglages.png). Titre sur deux lignes, logo masqué avec retour ; diagnostic déplacé dans les informations réelles. Titres dynamiques et parcours réel non vérifiés. |
| Réglages : marge, icônes, interrupteurs | Partiel | [Téléphone](captures/demo-captures-phone/reglages.png) · [tablette](captures/demo-captures-tablet/reglages.png). Marge de ligne 20 dp et fabrique partagée ; icônes spécifiques et pistes dégradées non généralisées. |
| Recherche verre et focus | Partiel | [Téléphone](captures/demo-captures-phone/recherche.png) · [tablette](captures/demo-captures-tablet/recherche.png). Champ sombre avec icône, bordure de focus et validation dégradée ; halo lumineux et état focus non prouvés par ces captures. |
| Lecteur et mini-lecteur | Partiel | [Lecteur téléphone](captures/demo-captures-phone/lecteur.png) · [tablette](captures/demo-captures-tablet/lecteur.png) ; [mini téléphone](captures/demo-captures-phone/mini-lecteur.png) · [tablette](captures/demo-captures-tablet/mini-lecteur.png). Progression dégradée et rayon 36 dp ; commandes et pastilles de démo factices, sans audio. Largeur à 85 %, halo coloré et curseur lumineux non réalisés. |
| Pochettes fictives | Partiel | [Bibliothèque téléphone](captures/demo-captures-phone/bibliotheque.png) · [tablette](captures/demo-captures-tablet/bibliotheque.png). Dégradé fictif partagé ; ombre colorée non réalisée. |
| Indication démo / toast | Partiel | Pastille démo dans le contenu ; suppression du toast de présence dans le code. La pastille n'est pas présente sur tous les écrans, notamment le lecteur. |
| Chevauchement historique de 14 px | **Pas fait** | Aucune correction ni preuve de mesure. |
| Erreurs JavaScript WebView répétées | **Pas fait** | La démo n'utilise pas de WebView ; aucune correction ni preuve. |

L'activation se fait par un appui long sur **Version de Melodix** dans les réglages de test. Les actions de démonstration sont locales et fictives. Aucune preuve d'une session Spotify réelle n'est fournie.
