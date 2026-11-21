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

## Diagnostic affiché avant le retour au premier plan

Le watchdog peut poster son panneau sur `MainActivity` pendant qu'une autre
activité, comme la démo, est au premier plan. Au retour du focus, le code retire
désormais ce panneau **uniquement** s'il s'agit d'un diagnostic de contenu,
s'il appartient à la fenêtre courante et si la surface de session ou la page de
connexion est visible. Le rapport enregistré n'est pas effacé ; un diagnostic
`STARTUP STUCK`, une activité différente et une session validée ne sont pas
écartés par cette vérification. Cette protection ne prouve pas que les sondes
antérieures ont été évitées, et doit encore être testée sur Android.

## Confirmation avant reconnexion

Le bouton « Se reconnecter » affichait déjà un avertissement, mais lançait
immédiatement l'effacement global des cookies et données Web de l'application.
Il ouvre maintenant une confirmation précisant cette portée et indiquant qu'une
reconnexion peut ne pas résoudre le refus Spotify. « Annuler » ne lance aucune
suppression ; seul « Effacer et se reconnecter » appelle le parcours existant.
Si le dialogue ne peut être affiché, l'effacement n'est pas lancé. L'activité,
la génération de session et l'absence d'une opération en cours sont contrôlées
à la confirmation ; la garde existante reste inchangée. Le texte de l'écran
suggère d'abord de réessayer sans effacer la session.

Les tests exécutent les branches Smali avec des doubles et vérifient aussi la
logique de la garde existante ; l'assemblage Smali isolé a réussi. Cela ne
constitue ni un test Android du dialogue ni une preuve que le refus Spotify est
résolu. Aucune build ni release n'a été lancée pour ce changement.

## Test157 après les correctifs (run 43074770471)

La suite CI et la build Preview de la source `377eb0aae8f2b824e3c6d68def15e7d80122dd2f`
ont réussi. L'inspection du même APK indique le paquet
`com.melodix.music.preview`, versionCode `1021503`, versionName
`1.2.2-377eb0a`, SHA-256
`00ce34bf864e0678d88906eab43b4f529398cc63624394edc4b80aefde880fec`,
certificat `e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f`,
et `DemoEntry` défini dans `classes2.dex`. La CI vérifie le certificat Preview
épinglé et une version supérieure à test156 (`1021502`).

L'acceptation stricte a échoué : après le lancement depuis l'icône, les réglages
de test, la surface session, l'accueil et le lecteur démo, elle n'a pas reconnu
la surface réelle attendue après la sortie. L'annotation rapporte une page de
connexion Spotify visible ; elle ne suffit pas à prouver un retour conforme, un
compte connecté ou l'accès aux réglages réels. Le dialogue de confirmation n'a
pas été validé sur cet émulateur. Captures partielles dans l'artefact
`demo-launcher-observations` 13882062108 ; elles n'ont pas été consultées depuis
cet environnement. Aucun bundle validé n'a été produit et aucune release n'a
été publiée. L'APK reste non validée, indépendamment du succès de la build.
