# Diagnostic avant modification : 1022158

Observation téléphone : Like actif ; aléatoire, file, paroles et appareils grisés à 0:10 en pause. Aucune trace DOM de ce téléphone disponible : pour l'aléatoire, la cause exacte est **inconnue**, pas nécessairement la pause. Le diagnostic ci-dessous résulte du code uniquement.

| Bouton | État et raison sur 1022158 | Condition d'activation |
|---|---|---|
| Aléatoire | Grisé observé ; motif réel inconnu : WebView/réponse inaccessible, page chargement, bouton absent/non reconnu ou désactivé, plusieurs candidats, ARIA/libellé d'état non reconnu. | Un seul bouton reconnu, état `aria-checked`/`aria-pressed` ou libellé d'action explicite vrai/faux/mixed ; contrôle Web actif. Sondage natif 800 ms (réponse bornée à 2,4 s). Pas de condition sur lecture/pause. |
| File | Grisée car désactivée **inconditionnellement dans le code natif** ; présence réelle du bouton Web inconnue. | Aucun cas dans 1022158. `openQueue` vise `control-button-queue`, mais le résultat reste sous `nativeRoot`. |
| Paroles | Grisées car désactivées **inconditionnellement dans le code natif** ; le bridge mentionne `lyrics-button`, sans vue native ni preuve de contenu. | Aucun cas dans 1022158. |
| Appareils | Grisés car désactivés **inconditionnellement dans le code natif** ; `openConnect` ne reconnaît que `Connect to a device`. | Aucun cas dans 1022158. |

Le CSS protégé masque notamment les contrôles généraux autres que play et la file dans la barre mobile, mais leur présence dans le DOM n'est pas garantie par ce CSS. `shmode` peut valoir `false` en l'absence du bouton Web ; ce fallback ne prouve donc pas que l'aléatoire est désactivé. Le code 1022158 peut interroger un élément DOM caché, mais ne prouve ni sa présence, ni qu'un clic a modifié Spotify.

**Comparaison demandée :** pause à zéro, pause en milieu de titre et lecture depuis 10 s ne sont pas observables ici sans trace du téléphone. Pour les trois tuiles, le code de 1022158 les grise dans les trois cas. Pour aléatoire, le code n'exige pas de lecture active ; sa présence effective dans ces trois états est **inconnue**. On ne peut donc pas dire que les contrôles n'existent que pendant la lecture. Les essais simulés à suivre ne remplaceront pas cette comparaison réelle.

## Résultat après correction

| Bouton | Statut | Correction et cause restante |
|---|---|---|
| Aléatoire | **PARTIEL** | Contrôle inconnu désormais cliquable : message et tremblement léger (sauf animations réduites). État connu : bascule visuelle immédiate avec point et mention « en attente », une seule commande, observation puis confirmation ; après 5 s sans confirmation retour à la dernière observation pendant l'attente ou neutre si aucune, avec message. Le mode intelligent reste neutre pendant la transition si sa cible n'est pas déductible. Les variantes françaises « mode aléatoire » sont reconnues ; ARIA inconnue, contrôle ambigu ou absent restent neutres. `shmode=false` sans contrôle n'est pas fiable et n'est pas inventé. Cause exacte sur téléphone encore inconnue ; test Spotify réel requis. |
| File | **PARTIEL** | Sondage passif des boutons `control-button-queue`, `queue-button` et libellés explicites ; à l'appui unique, recontrôle puis clic sur le bouton Web existant. Un panneau affiche la WebView déjà montée et propose « Retour au lecteur » ; le retour masque seulement cette vue, sans appeler rechargement. Présence/contenu réels, accès au panneau et retour Android à tester sur téléphone. |
| Paroles | **PARTIEL** | Même mécanisme avec `lyrics-button` et libellés explicites. Le bouton n'est pas masqué lorsque le contenu est inconnu : Spotify peut afficher son état réel après ouverture. Présence du bouton ne prouve pas la disponibilité des paroles du titre. |
| Appareils | **PARTIEL** | Même mécanisme avec identifiants et libellés multilingues reconnus, sans dépendre du seul libellé anglais de `openConnect`. Réelle fenêtre d'appareils, interactions et retour restent à tester sur téléphone. |

Les trois tuiles répondent même indisponibles : message « Disponible pendant la lecture » si contrôle/barre absent, ou motif spécifique lorsque la page/réponse est inaccessible, ambiguë ou désactivée. Les descriptions accessibles donnent l'état, le motif et la condition d'activation. Un court chargement est visible et annoncé ; une observation valide peut activer même si `readyState` est encore `loading`. Sondage 800 ms, reprise dès visibilité, sans requête programmée ; l'objectif <2 s dépend de la réactivité de WebView et n'est pas garanti si elle ne répond pas.

La nouvelle navigation **ne crée pas de requête réseau ni n'accède aux jetons, cookies ou en-têtes** ; elle clique une commande déjà présente seulement après un appui explicite. Une action Spotify normale peut elle-même charger du contenu ou produire des requêtes internes, dont l'absence ne peut pas être garantie sans observation réseau réelle. Le pont protégé est inchangé ; aucune commande play/pause ni seek n'est émise. La WebView n'est ni déplacée ni rechargée explicitement. Le dialogue de retour non modal et le comportement Spotify réel restent expérimentaux sur appareil ; les tests simulés ne démontrent pas leur rendu, leur accès tactile, leur prise en charge du Retour système, ni le maintien réel de l'audio/session. Le diagnostic accessible distingue les causes *observables* ; il ne prétend pas distinguer un sélecteur absent d'un libellé inconnu quand seul le résultat négatif est connu.

## Checklist téléphone (pas encore validée)

- [ ] Sans titre, appuyer sur Aléatoire : message, léger tremblement ou immobilité si animations réduites ; pas de point inventé. Échec : commande envoyée ou point vert inventé.
- [ ] Titre en pause à 0 puis à 0:10, ensuite lecture 10 s : relever l'annonce TalkBack des quatre boutons dans chaque cas ; noter actif/indisponible et motif, sans partager de compte ou données sensibles. Échec : annonce muette ou incohérente. Seule cette observation pourra établir si Spotify expose les boutons uniquement pendant la lecture.
- [ ] Aléatoire sur un titre : activer puis désactiver, comparer point et état Spotify, double appui rapide ; attendu une seule action, point immédiat puis confirmation ; échec : double bascule, faux point persistant ou absence de message après 5 s.
- [ ] Mode intelligent : activer puis changer ; attendu état neutre pendant transition non prévisible et état réel après observation ; échec : mode intelligent inventé.
- [ ] File : ouvrir, vérifier contenu Spotify visible et utilisable, toucher « Retour au lecteur » puis Retour Android ; attendu retour sans écran noir/rechargement ni perte de titre ; échec : panneau masqué, bouton de retour absent ou état perdu.
- [ ] Paroles : ouvrir sur un titre avec et sans paroles ; attendu contenu réel ou message Spotify de disponibilité, puis retour sans rechargement ; échec : contenu fabriqué, écran masqué ou rechargement.
- [ ] Appareils : ouvrir et vérifier le sélecteur, fermer puis retourner au lecteur ; attendu dialogue visible, aucune sélection forcée ; échec : boîte cachée ou appareil modifié sans appui.
- [ ] Arrière-plan et reprise : revenir au lecteur, attendre moins de 2 s et vérifier les états et les annonces ; échec : écouteurs doublés, icône périmée ou état figé. Les délais réels dépendent de Spotify/WebView.
