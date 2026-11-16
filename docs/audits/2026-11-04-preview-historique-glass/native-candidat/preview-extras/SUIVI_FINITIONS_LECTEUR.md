# Finitions lecteur — retour après 1022150

Périmètre : présentation. Les méthodes de commandes, les états observés, le DOM existant, les actions des tuiles et les sept actifs protégés n'ont pas été modifiés. Pas d'ajout de collecte ou de requête Spotify.

1. **Pochette** — plafond 318 dp et marges ; taille adaptée à la hauteur en portrait. La vue existante est conservée. Rendu sur appareil non mesuré.
2. **Titre et like** — titre limité à deux lignes et séparation de 16 dp avec la commande like inchangée.
3. **Progression** — padding latéral du panneau 24 dp, padding horizontal du seek retiré, pastille blanche de 16 dp avec halo de 24 dp. Les listeners et la logique de seek restent en place ; l'alignement, le clipping du halo aux extrémités et le geste sont à vérifier sur appareil.
4. **Temps restant** — texte visuellement transparent et associé au seek comme étiquette accessible ; annonce TalkBack réelle non vérifiée.
5. **Lecture** — dégradé #7B3FE4 vers #E0489E ; `BR_TL` correspond à l'angle Android 135°. Bouton 76 dp.
6. **Répétition** — pictogramme dessiné en surimpression à partir de la description accessible déjà produite par la commande existante ; « 1 » lorsque celle-ci indique « Répéter le titre ». Pas de nouvelle lecture Spotify ; synchronisation visuelle réelle à vérifier.
7. **Tuiles** — quatre tuiles à base 64 × 56 dp avec même espacement ; taille en hauteur extensible si police > 130 %. Les trois fonctions indisponibles restent atténuées ; volume local conservé.
8. **Rythme vertical** — marges et dimensionnement de pochette en place, avec défilement prévu pour grande police ; absence de défilement à 390 × 844 et 360 × 640 dp non démontrée.
9. **Finitions** — appui à 0,95 sur 150 ms et haptique sur commandes actives, sans interception du clic ; la pochette passe à 92 % sur l'icône native « lecture », revient à 100 % sur « pause » (l'icône peut aussi représenter un état arrêté ou optimiste). Animations désactivées si le système les désactive ; test appareil nécessaire.

Le fond du lecteur est appliqué temporairement au conteneur natif sous les barres et restauré en sortie ; couleurs transparentes et edge-to-edge étaient déjà configurés par l'activité, insets existants conservés. Un point d'aléatoire est dessiné uniquement lorsque la description accessible existante indique l'état actif. Barres, insets, point et états doivent être validés sur appareil, notamment rotation et retour à l'arrière-plan.

Contrôles locaux : génération des quatre layouts, bytecode des actions inchangé, assemblage/redécodage non signé, contrôles d'ID des ressources et des sept actifs de 9016, 106 tests Node et deux simulations JVM réussis. Aucun émulateur/adb : pas de capture, ni validation visuelle, tactile, audio, Spotify ou TalkBack. Le SHA de l'APK signée est publié par l'annotation `Candidate APK SHA256` du job avant upload ; ce n'est pas le digest du ZIP d'artefact.
