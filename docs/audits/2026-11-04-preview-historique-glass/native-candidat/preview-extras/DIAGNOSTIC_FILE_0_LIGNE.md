# File : diagnostic ciblé d'une lecture vide

## Observation sur téléphone

Après un premier appui isolé : `opened>sized:0>h:540>rows:0>path:other>links:0>rowsdoc:99>closed>close:verified`, résultat `empty`. Le script a trouvé une racine non masquée, n'a trouvé aucune ligne exploitable ni lien `/track/` ou `/episode/` dans celle-ci, puis a confirmé sa fermeture selon ses vérifications. Les 99 lignes ailleurs dans le document sont un compte plafonné : il serait dangereux de les attribuer à la file sans preuve. Le lecteur était indiqué en pause. Ni une file réellement vide, ni une racine erronée, ni une structure non reconnue ne peuvent être exclues.

## Changement apporté

Candidat **de diagnostic**, pas un correctif de la lecture File. En cas de lecture vide, le journal contient `shape:` suivi de 14 chiffres : uniquement une catégorie de racine et des compteurs structurels limités à 9 (0 = aucun ; 9 = 9 ou plus). Aucun texte, nom, URI, identifiant, attribut ou libellé brut n'est envoyé dans le diagnostic. L'opération ne clique pas sur un autre contrôle et n'interroge pas le réseau. Les cas de succès ne produisent pas ce champ.

Position des chiffres après `shape:` :

0. Origine de la racine : 0 page `/queue`, 1 `queue-page`, 2 `queue-view`, 3 `queue-panel`, 4 `NPV-queue`, 5 cible `aria-controls`, 6 région nommée ou autre.
1. Enfants directs.
2. Descendants tous types.
3. Lignes reconnues par les sélecteurs de ligne.
4. Liens quelconques avec `href`.
5. Liens `/track/` ou `/episode/`.
6. Liens `spotify:track:` ou `spotify:episode:`.
7. Attributs de type `data-uri`, `data-track-uri` ou `data-spotify-uri`.
8. Éléments avec `data-testid` contenant `track`.
9. Éléments `li` ou `role=listitem`.
10. Éléments `role=row`.
11. Éléments avec `data-testid` contenant `queue`.
12. Éléments `data-encore-id=listRow`.
13. Présence (1) ou absence (0) de texte non blanc, sans transmettre ce texte.

Le nouveau code `shape:[0-9]{14}` est autorisé dans le filtre de diagnostic natif et synchronisé avec le Smali. Les tests vérifient les différentes catégories, les bornes, l'absence des données de fixture dans le journal, les refus et le rendu natif du journal.

## Prochain essai

Après avoir lancé de la musique depuis une playlist contenant plusieurs morceaux et vérifié qu'elle joue, ouvrir File une seule fois, attendre le résultat, puis copier la seule ligne `File (tiroir)` depuis À propos. Ne pas cliquer sur Actualiser avant de copier : cela remplace le précédent journal. Si la fermeture ne peut pas être confirmée, ne pas essayer d'autres panneaux sans relancer l'app. Ne pas utiliser Like ou confirmer un transfert pendant cet essai. Le `shape` situe le type et la structure de la racine mais ne montre pas les noms de testid réels : si nécessaire, une observation complémentaire restera requise.
