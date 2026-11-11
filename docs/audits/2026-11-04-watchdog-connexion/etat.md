# Connexion, démo et diagnostic de démarrage — état provisoire

## Faits observés

- Sur l'émulateur vierge hors ligne du run 43039978756, le bouton démo de la
  session a ouvert l'accueil et le lecteur démo. Après sortie, l'acceptation a
  échoué : le panneau `CONTENT STUCK` était présent et le retour à la surface
  réelle attendue n'a pas été confirmé. Les réglages réels ne sont pas validés.
- Les réponses rapportées par le téléphone incluent des refus 400, 403 et 401.
  Ces seuls codes ne déterminent pas pourquoi Spotify refuse l'accès. Ils ne
  prouvent pas non plus que les modifications ci-dessous réparent la connexion.
- La build 11ba41aa/test156 ne contient pas la modification 7b821603.

## Travail effectué sans appareil

- 7b821603 évite de montrer le diagnostic de contenu et de lancer ses sondes si
  le contrôle effectué sur le fil UI observe une surface de session appartenant
  à l'activité courante ou la page de connexion visible, lorsque l'état de
  session n'est pas valide. Le rapport enregistré reste conservé. Un diagnostic
  de démarrage bloqué et une session validée conservent leur chemin précédent.
- Ce contrôle utilise `isShown()` et l'état de l'activité au moment du callback ;
  son comportement pendant que l'activité démo est au premier plan et lors du
  retour reste à vérifier sur Android. Un ancien rapport de contenu peut aussi
  être conservé et réaffiché ultérieurement : ce correctif ne le supprime pas.
- Le parcours strict de capture maintient désormais le lecteur démo pendant 70 s,
  au-delà du délai du watchdog, puis exige 10 s de surface réelle stable sans
  panneau `CONTENT STUCK`, avec l'entrée démo si la session est affichée. Les
  contrôles de captures, DEX, signature et réglages réels restent bloquants.

## Limites et prochaine validation

Les tests locaux (y compris des doubles Android) ne prouvent ni le rendu réel ni
la validité d'un compte Spotify. Il faut une build explicitement autorisée,
son test depuis le launcher sur émulateur vierge et, ultérieurement, un essai
réel de connexion avec l'utilisateur ; ne jamais collecter d'identifiants ou
jetons. Ne pas présenter l'absence d'authentification sur un émulateur hors ligne
comme une preuve d'accès aux réglages réels. Aucune garde ni requête Spotify n'a
été modifiée par ce travail.
