# Test physique Spotify Web Player — procédure courte

Cette procédure valide uniquement le prototype isolé. Elle ne modifie pas le lecteur Audius → YouTube et ne demande jamais de communiquer des identifiants à Melodix ou dans un rapport.

## APK à tester

- Workflow : https://github.com/Souxch06/Melodix/actions/runs/37123047052
- Artefact : `Melodix-v4.4.8-diagnostic-16832ed.apk`
- Version affichée par Android : `4.4.8-diagnostic` (`versionCode 44008`)
- SHA-256 : `2f62217d82d10e88f9a15232acff470744b6e522474c7e1591392ee29375a9c6`

Télécharger l'artefact depuis la section **Artifacts** du workflow, extraire l'APK et l'installer. Android peut demander d'autoriser temporairement l'installation depuis la source utilisée.

## Test — 5 à 10 minutes

1. Ouvrir **Réglages → Diagnostic → Prototype Spotify Web Player**.
2. Vérifier que Spotify est visible et navigable, sans écran blanc. Noter les lignes `Bridge`, `MediaSession`, `EME` et `Widevine` du panneau Melodix.
3. Se connecter directement dans la page Spotify. Ne jamais copier l'identifiant, le mot de passe, un cookie ou un token dans un rapport. Si un fournisseur externe est bloqué par l'allowlist, noter uniquement son nom de domaine et utiliser la connexion Spotify classique si possible ; ne pas désactiver l'allowlist.
4. Ouvrir un album ou une playlist, lancer un morceau et vérifier avec les oreilles qu'un son sort réellement. Tester pause, reprise et morceau suivant.
5. Vérifier si le panneau Melodix passe à `Lecture: playing` et affiche titre/artiste/artwork. Une page animée ou un bouton Play ne constitue pas une preuve audio.
6. Appuyer sur Accueil Android, attendre 30 secondes, revenir. Répéter écran verrouillé si la lecture avait démarré. Tester notification et casque/Bluetooth uniquement s'ils sont disponibles.
7. Fermer puis rouvrir l'écran diagnostic, puis l'application. Vérifier si la session Spotify reste connectée.
8. Pour tester la recréation d'activité sans simuler un renderer : activer temporairement l'option développeur Android **Ne pas conserver les activités**, quitter puis revenir. Ne pas utiliser d'URL de crash ou d'outil qui contourne l'allowlist.

## Résultats à communiquer

Aucune capture ne doit montrer email, identifiant, QR code de connexion, cookie, token ou autre donnée de compte.

| Point                               | Valeur attendue à renseigner                |
| ----------------------------------- | ------------------------------------------- |
| Modèle / version Android            | texte                                       |
| Bridge                              | attente / prêt / timeout / renderer détruit |
| MediaSession Web                    | oui / non / inconnu                         |
| EME                                 | oui / non / inconnu                         |
| Widevine                            | oui / non / inconnu                         |
| Spotify visible                     | oui / non                                   |
| Connexion                           | oui / non / fournisseur bloqué              |
| Session après réouverture           | oui / non                                   |
| Audio réellement audible            | oui / non                                   |
| Play / pause                        | oui / non                                   |
| Changement de morceau               | oui / non                                   |
| Titre/artiste remontés dans Melodix | oui / non                                   |
| Progression/durée remontées         | oui / non                                   |
| Audio après 30 s en arrière-plan    | oui / non                                   |
| Audio écran verrouillé              | oui / non / non testé                       |
| Notification Spotify contrôlable    | oui / non                                   |
| Casque/Bluetooth                    | oui / non / non testé                       |
| Retour après recréation activité    | propre / erreur / crash                     |

## Interprétation

- `Widevine: non` avec lecture refusée indique un blocage DRM probable de cette WebView/appareil ; ne rien contourner.
- `Bridge: prêt` prouve uniquement le canal WebView ↔ React Native, pas l'authentification ni l'audio.
- `Lecture: playing` provenant de `navigator.mediaSession` est un signal standard utile, mais le son audible reste la preuve nécessaire.
- Durée et position peuvent rester indisponibles : l'API Media Session standard ne fournit pas de getter portable pour ces valeurs.
