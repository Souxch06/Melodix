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

- 7b821603 visait à éviter le diagnostic de contenu pendant une session visible,
  mais sa condition `startsWith("CONTENT STUCK")` ne correspondait pas au rapport
  réel : `buildReport` commence par `MELODIX DIAGNOSTIC`. Le contrôle était donc
  inopérant pour ce rapport. Le correctif suivant fournit au runnable un préfixe
  explicite, tout en conservant le rapport complet et le rapport stocké original.
  Un vrai diagnostic de démarrage bloqué garde son chemin précédent.
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

## Action pendant la connexion interactive

Dans le code antérieur, si `loginActive` était vrai mais que l'état de session
restait 2 ou 4, la construction de l'en-tête affichait quand même « Réessayer ».
Son action peut appeler `verify` si un cookie est présent ; `begin` remet alors
`loginActive` à faux. Ce chemin est démontré par lecture/exécution des branches
Smali avec des doubles, pas observé sur un téléphone. La présentation masque
maintenant cette action dès que la connexion est active, sans retirer l'entrée
Preview distincte et sans changer la garde, les cookies ou les requêtes. Le
bouton réapparaît normalement pour les états 2 et 4 hors connexion interactive.
La cause des refus Spotify reste inconnue et une validation Android reste due.
