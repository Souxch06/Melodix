# Suivi du lecteur Glass

La Preview ajoute les emplacements like, aléatoire, répétition et les quatre tuiles. Like/aléatoire/répétition restent grisés si les boutons et leur état réel ne sont pas reconnaissables dans le DOM déjà présent ; chaque appui valide utilise uniquement l'action existante, et le like recontrôle la piste, le titre et l'état. Le contrôle est désactivé pendant l'attente de changement d'état. Les appels existants de like/répétition exécutent leur rafraîchissement interne habituel. La barre, le seek, la lecture/pause, précédent/suivant, l'horloge et les sept actifs protégés ne sont pas modifiés.

Volume affiche le réglage audio local Android ; il ne prétend pas contrôler un appareil Spotify distant. File et Appareils restent désactivés : les fonctions Web existantes ouvrent une interface Web mais aucun chemin vérifié ne permet d'en montrer le contenu dans l'interface native sans modifier la navigation. Paroles et menu sont désactivés faute d'intégration native vérifiée. Le nom de playlist courant ne dispose pas d'une source fiable ici : le titre générique ne fabrique pas de contexte. Le geste de réduction, les animations complètes et l'extraction de couleur depuis une image locale ne sont pas implémentés ; le bouton de réduction existant reste disponible. Ne pas présenter ces éléments comme fonctionnels.

Les tests DOM et JVM sont des simulations ; ils ne vérifient ni une session Spotify réelle, ni audio, ni rendu, ni accessibilité, ni latence. Les boutons peuvent rester indisponibles si Spotify change son DOM ou ne fournit pas l'état.

Pour le bilan actualisé, les délais, simulations, blocages et la checklist téléphone, voir `AUDIT_BOUTONS_LECTEUR.md`.
