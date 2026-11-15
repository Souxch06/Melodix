# Finition visuelle Glass de l'accueil et des playlists

Sur les captures de la 9015, les deux sources sont clairement distinctes mais les bandeaux prennent beaucoup de place et les cartes répètent souvent le nom de leur section en sous-titre. Le détail de playlist est lisible mais très nu. Les captures montrent le haut d'une playlist et de l'accueil ; elles ne démontrent pas que tous les morceaux ont été chargés ni que les interactions fonctionnent.

## Changements

- Accueil : bandeaux d'origine conservés mais plus compacts, titres d'étagères allégés, cartes légèrement réduites pour mieux laisser apparaître la suite de la rangée. Dans ces cartes uniquement, un sous-titre identique au nom de la section est masqué ; un artiste ou une description différente reste visible. Aucun contenu, provenance, ordre ou écouteur n'est modifié.
- Détail : rangées légèrement espacées et surfaces translucides discrètes avec retour tactile ; une petite étiquette « Titres de la playlist » est ajoutée uniquement quand l'identifiant de détail est une playlist. L'étiquette n'invente ni pochette, ni total, ni action. Les indications de chargement ou d'aperçu partiel restent présentes.
- Changements limités au rendu natif et à deux ressources ; aucune modification des scripts de pagination, de récupération Spotify ou de la navigation. Les corrections et limites 9015 restent applicables, notamment le fallback DOM potentiellement incomplet et le chargement séparé des titres likés.

## Vérifications

Tests sémantiques des gardes Smali, dimensions et ressources XML ; contrôle que les IDs de ressources publics de la base ne changent pas ; compilation et redécodage apktool ; suites JS existantes pour les données, pagination, écrans et cache. Ces tests sont statiques ou simulés. Aucun rendu Android/ART ni test sur le téléphone ou Spotify n'est disponible ici : l'apparence, les interactions et les performances restent à confirmer sur appareil.
