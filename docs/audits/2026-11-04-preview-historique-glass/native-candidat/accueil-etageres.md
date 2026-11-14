# Expérience Preview : étagères pour l'accueil historique

La capture de la Preview 9004 montre que des pochettes et des titres de playlists s'affichent réellement sur l'appareil. Elle montre aussi une liste verticale, une navigation étirée et des éléments chevauchant les barres système. Elle ne démontre ni les clics, ni l'ouverture des playlists, ni la lecture.

La variante manuelle `v1.2.2-test.9005-preview` reprend la Preview 9004 (même connexion et mêmes données historiques) et ajoute uniquement :

- un rendu expérimental de l'accueil sous forme d'étagères horizontales regroupées par section, en utilisant les données et la fabrique de lignes existantes pour les titres, descriptions et pochettes ; les autres écrans conservent leur rendu précédent ;
- un dock centré de 480 dp lorsque la largeur disponible est d'au moins 600 dp ; le layout standard conserve sa largeur souple ;
- `fitsSystemWindows` sur le shell natif, pour demander au système de ménager les barres système.

Le rendu construit une nouvelle arborescence avant de la substituer à l'ancienne. Si le JSON est vide ou invalide, en présence d'une ligne de réglage, ou si le rendu échoue avant sa substitution, le flux historique reste le repli. Aucun exemple de playlist n'est fabriqué et le bridge, la connexion et la collecte restent inchangés. Les conditions inversées historiques des clics et du routage **ne sont pas corrigées**.

## Vérifications et limites

Quatre tests Python vérifient sur des fixtures les transformations de layout, la conservation des IDs et des handlers, le repli historique, la séparation du rendu Accueil et le refus de sources inattendues. Une copie Preview complète a été compilée avec Apktool 2.9.3 et redécompilée : le chemin Home/fallback, le renderer et la variante de layout large apparaissent dans le résultat. Les tests ciblés de caractérisation et de chaînes synthétiques sur le dex redécompilé passent (49 + 3 + 1 + 3) ; ils caractérisent toujours plusieurs défauts, et n'exécutent pas le nouveau renderer dans Android.

Le rendu, la largeur réelle en paysage et la gestion des insets ne sont pas validés sur appareil. La compilation ne prouve pas la vérification ou l'exécution ART. L'APK locale est non signée et ne doit pas être distribuée ; seul un run Actions réussi peut produire la Preview signée. Ce n'est pas l'interface complète : les autres écrans, l'ouverture et la lecture doivent encore être vérifiés ou corrigés. La base utilise toujours l'ancienne connexion et ses risques connus. Ne pas désinstaller ni effacer les données pour tester.
