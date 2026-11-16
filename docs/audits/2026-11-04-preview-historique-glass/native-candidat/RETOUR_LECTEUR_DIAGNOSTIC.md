# Retour lecteur : interruption et diagnostic

## Diagnostic avant correctif (1022154)

`onPause` ne changeait ni l'ancre ni l'état de lecture. `onStop` sauvait aussi
`moving` en mémoire. Au retour, la position native était calculée depuis la
dernière ancre et le temps monotone écoulé, même si le son s'était arrêté.
L'état affiché juste avant le départ et au retour sur le téléphone n'a pas été
observé ici. L'utilisateur rapporte l'arrêt du son en quittant l'application ;
la reprise éventuelle du son au retour reste inconnue.

Chemins de reprise préexistants, **non modifiés** : `onResume` réactive le shell
et des temporisateurs ; `addAutoFeatures()` peut cliquer sur le contrôle Play
si le mode autoplay `onetime` ou `permanent` est activé et que ses gardes sont
satisfaites. `desktop_spoof.js`, sur `visibilitychange`, restaure les vidéos de
fond qu'il avait mises en veille et appelle `play()` pour celles qui jouaient.
Ce code cible des vidéos qualifiées de Canvas, pas nécessairement l'audio ; son
comportement effectif sur l'appareil n'est pas établi. Des commandes de lecture
natives existent aussi dans le service média, sans preuve qu'elles soient
appelées par ce chemin de retour. Aucun de ces mécanismes n'a été modifié.

## Correctif d'habillage

À la perte du premier plan, l'estimation affichée est figée, l'état devient
`interrupted`, et aucune durée d'absence n'est ajoutée. Les callbacks en
arrière-plan ne redémarrent pas cette horloge. Au retour, une observation
fraîche et cohérente ainsi qu'un état `playing` sont nécessaires pour relancer
l'horloge et afficher l'icône pause. Une incohérence persistante pendant au
moins 10 s est rattrapée progressivement à partir de plusieurs observations
récentes de même source et de même côté, espacées au maximum de 5 s ; il s'agit
d'un indice, non de la preuve d'un écart constant entre observations.

Aucun signal audio natif n'est utilisé : `AudioManager.isMusicActive()` est
global et ne prouve pas que *cette application* a joué pendant toute l'absence.
Même si de l'audio a continué écran éteint, la position reste donc figée jusqu'à
la resynchronisation à partir des observations. Le diagnostic le mentionne.
Aucune donnée n'est persistée sur disque ; la rotation conserve la position
figée en mémoire et un processus neuf commence avec `-:--`.

L'âge est mesuré depuis la lecture JS existante et non depuis la mise à jour
réelle de Spotify ; une valeur déjà périmée peut donc passer ce filtre. Le
bouton reflète l'état déduit de ces observations et non une preuve audio. Le
rapport ne contient ni titre, artiste, URI, ni donnée de compte ; il journalise
cycles, état, valeur affichée, âge/écart/source et décision, ainsi que jusqu'à
dix relevés par seconde après le retour. Les timers peuvent être retardés.

Les simulations JVM couvrent sorties en lecture de 10 s, 1 min et 10 min,
pause, retour avec observation cohérente, divergence prolongée, absence de
signal, changement de titre, rotation, processus recréé et seek confirmé avant
sortie. Elles ne testent pas le son réel, la source de l'audio, une véritable
mise en veille Android ou Spotify. La présence de son pendant l'absence n'est
ni confirmée ni infirmée par ces tests ; ce scénario reste à valider téléphone.
