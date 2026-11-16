# Diagnostic préalable à A et B (1022159)

Retour utilisateur : aléatoire échec avec toast, like ne bascule pas. Aucun DOM ni trace de son appareil disponibles. La cause exacte n'est pas établie ; en particulier, un bouton Spotify désactivé ne prouve pas une restriction de compte ou de contexte. Ne pas fabriquer cette cause.

- Aléatoire : le sélecteur accepte `data-testid` contenant shuffle et certains libellés ; « Activer l'aléatoire » n'était pas reconnu. État accepté seulement si ARIA ou libellé d'action connu ; en cas d'absence ou d'échec le toast ne précise pas l'état avant/après. `shmode=false` est aussi utilisé par le pont protégé comme valeur de repli quand le contrôle manque, donc n'est pas une preuve en soi.
- Like : contrôle choisi par identifiant ou libellé de bibliothèque ; un `add-button` peut ouvrir un menu de listes plutôt qu'ajouter immédiatement aux titres likés. La méthode protégée existante lance aussi des rappels `addAndAuto`, dont des comportements de reprise préexistants : ne pas les étendre et ne pas déduire qu'un simple clic a aimé la piste. La capture ne permet pas d'identifier le contrôle réel sur le téléphone.
- Volume 1022159 : `AudioManager.adjustStreamVolume(STREAM_MUSIC, ADJUST_SAME, FLAG_SHOW_UI)` ouvre le panneau Android. Ce n'est pas le volume Spotify. Le code historique cache certaines vues `volume` dans la barre ; présence d'un contrôle volume DOM sur le téléphone inconnue. Aucun contrôle propre au lecteur n'a été prouvé sur appareil.
- File/paroles/appareils 1022159 : la WebView peut être rendue visible par la méthode `showWebPanel`. La mission l'interdit désormais. Aucun contenu réel de ces panneaux, ni leur fermeture, n'est disponible pour caractérisation ici.

Diagnostics réalisés par inspection statique ; aucune lecture de jeton, cookie ou en-tête ; aucune observation Spotify réelle et aucune garantie sur une restriction de compte.

## Précisions constatées et préparation

- `actShuffle` appelle `PlayerAPI.toggleShuffle()` si disponible, sinon clique le bouton trouvé ; il planifie ensuite la synchronisation. Cela ne prouve pas qu'un changement a eu lieu, ni si Spotify a appliqué un cycle normal/intelligent.
- `actAddToFav` clique le dernier bouton de `now-playing-widget` puis planifie deux appels d'entretien `addAndAuto(true)` ; la nature d'un menu éventuel et le résultat de l'ajout ne sont pas vérifiés par cette méthode. Une commande ambiguë `aria-haspopup=menu` ne doit pas être traitée comme un ajout direct.
- Le CSS du pont masque dans certains contextes les descendants `data-testid` contenant `volume` ; cela n'établit pas qu'un curseur fonctionnel existe sur l'appareil. La présence possible d'éléments `audio, video` est utilisée par le shell comme indice de lecture, pas comme preuve qu'ils pilotent le volume Spotify, ni de persistance après changement de titre. Il faut relever ces éléments sur l'appareil avant d'affirmer un volume séparé ; à défaut, le curseur demandé est bloqué plutôt que simulé.
- `control-diagnostic.js` est une **sonde préparatoire non intégrée à l'application**. Elle retourne uniquement des catégories et des états bornés, sans texte brut, titre, identifiant de piste, identifiant de compte ou accès réseau ; sa classification de menu repose uniquement sur `aria-haspopup`. Ses quatre tests JSDOM sont synthétiques et ne valident pas Spotify. Elle ne constitue ni le diagnostic avant/après intégré, ni une correction des boutons.

## Checklist téléphone à exécuter après livraison effective des APK (non exécutée)

| Action | Attendu | À relever en cas d'échec |
|---|---|---|
| Lire un titre puis appuyer sur Aléatoire | Cycle et état confirmés par la page ; restriction seulement si explicitement attestée | État avant/après et raison dans diagnostic, type de compte/contexte uniquement si choisi par l'utilisateur |
| Appuyer une fois sur Like puis changer de titre | Ajout confirmé, cœur actif uniquement si état réel ; aucun retrait intempestif | Commande/menu observé, état avant/après et échec |
| Appuyer deux fois rapidement, passer arrière-plan puis revenir | Une seule action et reprise sur observation fraîche | Nombre de changements et état avant/après |
| Régler le volume à 0, 50 et 100 %, puis changer de titre | Musique seule, retour immédiat, volume Android inchangé | Type de sortie, effet réel, valeur après changement ; tester aussi volume Android à zéro |
| Ouvrir/fermer File, Paroles et Appareils, Retour Android | Panneaux natifs ou message d'indisponibilité ; jamais la WebView | Panneau, étape et capture expurgée ; ne pas partager de jeton ni cookie |

Aucune de ces cases n'est validée par les tests simulés. L'APK 1022159 ne satisfait pas les critères volume ni panneaux natifs ; les deux APK demandées ne sont pas encore produites.
