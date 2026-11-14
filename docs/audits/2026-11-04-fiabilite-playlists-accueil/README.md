# Parcours des playlists de l’accueil

## Problèmes reproduits côté agent

1. Dans le cas où la page `/collection/playlists` est déjà chargée et l’interface Spotify signale une session connectée, le nouveau chemin de projection vers l’accueil tronquait les 32 premières ressources **avant** de ne conserver que les playlists. Une collection simulée avec 40 albums suivis d’une playlist réelle produisait alors un accueil sans cette playlist. La collecte examine maintenant jusqu’à 500 éléments chargés, filtre les URI Spotify de playlists, puis limite l’accueil à 32 cartes. Le test inclut également 40 playlists et vérifie ce plafond. Cela ne charge aucune page ni ne récupère le reste d’une liste virtualisée.
2. Si l’état UI passait explicitement à « connexion requise » après l’envoi de playlists à l’accueil, le chemin interrompait la mise à jour avant d’envoyer un état sûr : les anciennes cartes pouvaient rester affichées. Le test reproduit cela avec et sans le callback de connexion. Un état sans données privées est désormais envoyé si des lignes Home ont été observées ; si l’envoi échoue, il reste retentable. Cela ne garantit pas qu’Android accepte ou affiche le message après une navigation ou un échec du pont. Un état inconnu, une erreur API ou un HTTP 429 ne sont pas assimilés à une déconnexion.
3. Le moteur de rendu natif inversait le test `String.isEmpty` des sections, ce qui sautait la création d’un titre non vide comme « Vos playlists ». La condition est corrigée ; le test vérifie la branche smali, pas les pixels à l’écran.

Ces cas sont reproductibles en simulation mais ne démontrent pas qu’ils sont la cause de l’accueil vide sur le téléphone de l’utilisateur. Ils ne contournent ni l’authentification ni un 429 et ne créent aucune playlist. L’API Spotify réelle, les éventuels droits, l’état de la page et l’exhaustivité de la collection restent inconnus. Le diagnostic copiable détaillé précédent est conservé.

## Vérification

636/636 tests Node, dont cinq nouveaux contrôles ciblés : ressources mixtes, plafond de 32 playlists, perte de connexion UI avec et sans callback, nouvel essai après échec de transmission, et condition du titre ; 4/4 tests Python. APK compilé, ZIP et assets contrôlés, signatures v2/v3 API 24–36 et garde de certificat vérifiées. Shell généré : 108841 octets, sous le plafond historique de 108867 octets. SHA-256 APK : `9078fea7e8cca830e9a70d4af4f90018abe6ddee80e38597d61eb90cff006440` ; certificat : `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`.

Sans téléphone ni émulateur, aucun rendu ART, aucun comportement du presse-papiers et aucune réponse Spotify réelle ne sont attestés. Le patch complet est vérifié sur la base propre `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` ; ses 67 fichiers correspondent au candidat construit. SHA-256 patch : `5fc17308a556519afe97c75d7fc084529868a3047d1067c76769da67f6772c0b`. Aucune clé incluse.
