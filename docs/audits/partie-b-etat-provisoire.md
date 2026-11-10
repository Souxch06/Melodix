# Polish 3 — spécification vs réalisé

Les liens `captures/demo-captures-phone/` et `captures/demo-captures-tablet/` visent les captures CI jointes au même artefact que l'APK : téléphone portrait et tablette paysage. Elles présentent des **données fictives locales**, sans audio ni validation de session Spotify. Le code est partagé avec une partie des écrans réels, mais ces captures ne prouvent pas le rendu ni le fonctionnement du parcours réel. Les images n'ont pas pu être examinées visuellement dans l'environnement de travail ; les assertions CI portent sur leur présence, l'orientation, les libellés et l'espacement mesuré.

| Spécification | État | Preuve / limites |
|---|---|---|
| Fond sombre et trois lueurs | Partiel | [Accueil téléphone](captures/demo-captures-phone/accueil.png) · [tablette](captures/demo-captures-tablet/accueil.png). Trois dégradés radiaux en haut à gauche, au milieu à droite et en bas à gauche ; l'apparence « douce » et l'effet derrière toutes les surfaces restent à apprécier sur les captures. |
| Verre translucide, bord et reflet | Partiel | [Réglages téléphone](captures/demo-captures-phone/reglages.png) · [tablette](captures/demo-captures-tablet/reglages.png). Ressources partagées : blanc 7 %, bord blanc 1 dp à 14 %, reflet haut ; certains composants natifs programmatiques conservent leur propre style. Aucun faux flou des vues. |
| Lecteur : fond, halo et progression | Partiel | [Téléphone](captures/demo-captures-phone/lecteur.png) · [tablette](captures/demo-captures-tablet/lecteur.png). Halo radial d’accent derrière la pochette et point radial de progression. Le lecteur réel prélève localement la couleur dominante quantifiée de l’image décodée (16 × 16 points, assombrissement), avec repli d’accent en attente/échec ; rendu et cas réels restent à vérifier sur appareil. La démo utilise la pochette et le fond d’accent fictifs. |
| Lecteur : titre et pastilles | Partiel | Mêmes captures. En-tête « Lecture en cours » limité à une ligne, pastille démo séparée et actions fictives en verre dans la démo. Les actions Paroles/File/Minuterie ne sont pas implémentées pour les données réelles. |
| Réglages : icônes et interrupteurs | Partiel | [Téléphone](captures/demo-captures-phone/reglages.png) · [tablette](captures/demo-captures-tablet/reglages.png). Icônes distinctes pour lecture, Canvas, version, audio et apparence (contours évidés pour lecture, Canvas et version) ; les autres intitulés gardent un pictogramme de repli. Piste activée dégradée, désactivée translucide ; parcours réels non validés. |
| Mini-lecteur : pochette et espace | Partiel | [Téléphone](captures/demo-captures-phone/mini-lecteur.png) · [tablette](captures/demo-captures-tablet/mini-lecteur.png). Même pochette fictive dès l'accueil ; marge basse 8 dp et contrôle de l'espacement dans la hiérarchie CI. La pochette réelle continue de dépendre des données réelles, non testées ici. |
| Accueil : démo, salutation, carrousel | Partiel | [Téléphone](captures/demo-captures-phone/accueil.png) · [tablette](captures/demo-captures-tablet/accueil.png). La CI vérifie une seule pastille « MODE DÉMO · HORS LIGNE » ; salutation et carrousel fictifs conservés. |
| Recherche et bibliothèque | Partiel | [Recherche téléphone](captures/demo-captures-phone/recherche.png) · [tablette](captures/demo-captures-tablet/recherche.png) ; [bibliothèque téléphone](captures/demo-captures-phone/bibliotheque.png) · [tablette](captures/demo-captures-tablet/bibliotheque.png) ; [playlist téléphone](captures/demo-captures-phone/playlist.png) · [tablette](captures/demo-captures-tablet/playlist.png). Champ verre et dégradé conservés ; données et navigation fictives. |
| Barre inactive | Partiel | Texte et pictogrammes éclaircis, scrim translucide ; test de contraste AA ≥ 4,5:1 sur une composition conservatrice des lueurs. Vérification visuelle CI et surfaces non prévues non garanties. |
| En-tête | Partiel | Shell natif et démo masquent le parent du logo lorsque retour est visible et l’affichent sinon ; parcours réels non authentifiés soumis aux gardes. |
| Transitions et haptique | Partiel | Fondu + glissement de 8 dp sur le contenu lors d’un changement, sans animer le shell opaque ; retour haptique léger sur actions principales. Tests structurels, pas de validation perceptive. |
| Squelettes shimmer et apparition échelonnée | **Pas fait** | Les états de chargement existants restent en place ; aucune simulation de données n’a été ajoutée. |
| Écrans réels sans session | Partiel | La CI lance explicitement MainActivity, hors démo, et conserve les captures de démarrage immédiat et de l’état observé ainsi qu’un fichier observation.json. Une capture d’erreur ou de réglages n’est présente que si l’écran a réellement été observé ; aucune garde n’est contournée. Le démarrage immédiat n’est pas certifié être le splash. |
| Flou derrière dialogues / feuilles | **Pas fait** | Aucun blur-behind ajouté ; les surfaces ont un repli translucide sans flou. |
| Chevauchement historique de 14 px | **Pas fait** | Le contrôle du nouvel écart mini-lecteur/barre en démo ne démontre pas la résolution du défaut historique sur les écrans réels. |
| Erreurs JavaScript WebView répétées | **Pas fait** | Aucun WebView dans la démo ; pas de correction ni preuve concernant ces erreurs. |

Activation : appui long sur **Version de Melodix** dans les réglages de test. La démo ne lit ni ne modifie la session ; les actions du lecteur sont factices. La suite complète doit réussir avant la construction de l'APK de démo.

## Différences réelles / démo à vérifier sur les captures CI

- Le lanceur de démo et ses données sont fictifs, sans WebView ni session ; MainActivity utilise le vrai parcours et ses gardes.
- Les écrans de session réels emploient `session_glass_background` (deux lueurs et carte centrée), leurs propres boutons et le logo de session ; la démo utilise le shell natif à trois lueurs et son bandeau « MODE DÉMO ».
- Les réglages de démo sont des commandes fictives ; les réglages réels peuvent rester inaccessibles sans session. Les lignes communes partagent le style et les icônes, pas les données ni les actions.
- L’image de lecteur de démo et sa couleur sont fixes ; la teinte réelle dépend d’une image effectivement chargée. La CI sans session ne prouve ni chargement Spotify ni lecture.
- Consulter `captures/demo-captures-{phone,tablet}/real-no-session/observation.json` pour distinguer erreur ou réglages effectivement observés des écrans non atteints. Les captures ne sont pas inspectées visuellement par cette suite.

## Résultats CI de test152 (après construction, sans nouvelle preview)

Run [42784941611](https://github.com/Souxch06/Melodix/actions/runs/42784941611), source APK `514f8c56c47a482a8525822cd17782a359604e6c` ; la suite complète CI, l'assemblage et les deux captures démo ont réussi. Une lecture séparée de l'artefact existant ([42785894575](https://github.com/Souxch06/Melodix/actions/runs/42785894575)) n'a construit aucun APK supplémentaire.

| Écran réel sans session | Téléphone | Tablette | Limite |
|---|---|---|---|
| Démarrage immédiat | Capture présente | Capture présente | Aucune assertion ne confirme que l'image est le splash. |
| État après attente | Capture présente | Capture présente | État observé sans compte, réseau désactivé ; aucune analyse visuelle manuelle. |
| Erreur | Non observée | Non observée | Pas de capture d'erreur affirmée, aucune erreur forcée. |
| Réglages | Non atteints | Non atteints | Garde de session ou action absente ; aucun contournement. |

L'artefact contient la version du tableau au moment de la construction ; cette section est ajoutée ensuite pour consigner le résultat réel. La règle d'en-tête masque l'avatar en présence de retour, mais l'avatar peut afficher une image de profil réelle au lieu du logo : l'exigence d'un logo permanent n'est donc pas entièrement démontrée. La CI de capture désactive les animations ; elle ne valide pas perceptivement transition, haptique ou halo.
