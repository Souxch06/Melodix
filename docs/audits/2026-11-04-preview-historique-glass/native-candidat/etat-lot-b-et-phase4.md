# État du lot B et préconditions de la phase 4

Audit statique du projet décodé correspondant à la Preview. Aucun rendu téléphone, aucune nouvelle requête, aucun changement de connexion ou de bridge protégé. Conformément à l'ordre cumulatif demandé, il n'y a pas d'APK 3 tant qu'une APK 2 complète n'a pas été publiée avec sa garde signée verte.

| Écran | Existant repérable | Manque / non démontré |
|---|---|---|
| Accueil | `NativeHomeShelfPreview` crée des défilements horizontaux ; salutation existante dans le shell. | Carte 156 dp, « Reprendre » conditionnel et rendu exact restent à établir ; pas de validation téléphone. |
| Recherche | Champ, bouton et résultats natifs existants. | Dégradés, effacer, état vide, cibles 48 dp et effets demandés non achevés ; champ et bouton font 46 dp dans le layout. |
| Bibliothèque | Catégories horizontales, lignes et retour natifs. | 72 dp, centrage actif, sous-titres disponibles et rafraîchissement manuel sans requête additionnelle non établis. |
| Playlist | En-tête natif et listes progressives. | Grand en-tête réductible, badge E et boutons lecture/aléatoire conditionnés au lot A non réalisés. Aucun nouvel autoplay. |
| Lecteur | Titre deux lignes, mini/full et affichages de temps ; lecteur complet défilant. | La barre native est un `ProgressBar`, pas un contrôle tactile seek ; shuffle/répéter font 44 dp ; swipe réduire et AA/130 % non établis. Ne pas annoncer seek tactile fonctionnel. |
| Mini-lecteur | Mini et contrôle lecture/pause existants. | Swipe suivant/précédent non établi. |
| Réglages | Sections, version, ligne cache et action de déconnexion existantes. | Confirmation déconnexion, historique recherche et comportement exact sur téléphone non établis ; ne pas modifier la connexion. |
| Transversal | Retour natif et mise en page existants, simulations ciblées. | Squelettes/erreurs, transitions, contraste AA, paysage/tablette, texte 130 %, fin de scroll, retour réel et absence de flash ne sont pas démontrés. |
| Identité | `logo_melodix` renvoie au foreground du lanceur ; l'interface comporte des accents violets. | Splash utilise encore `spotify_black` ; `sfnotif` est un vecteur distinct. Unification violet-magenta des formes/couleurs sur lanceur, notification et splash non démontrée. La vraie pochette bleue n'a pas été modifiée. |

## Phase 4 : conception seulement

Les mesures réelles de lenteur ne sont pas encore disponibles. Aucun nouvel optimiseur, préchargement, cache persistant, défilement forcé ou requête n'est activé. Le shell historique possède déjà des caches en mémoire ; ils ne constituent pas la nouvelle solution par compte demandée.

Avant une éventuelle implémentation désactivée par défaut, il faut : (1) une source d'identité de partition **non sensible**, sûre et indépendante des jetons/cookies/en-têtes, ou renoncer au cache persistant si elle manque ; (2) prouver l'effacement sur toutes les voies de déconnexion et l'isolation après changement de compte sans modifier l'authentification ; (3) mesurer cinq cold starts et cinq ouvertures de playlist sur téléphone, puis définir budget mémoire et obsolescence ; (4) tests isolation, déconnexion, interrupteur OFF, courses et absence de requêtes supplémentaires. Si l'une de ces conditions manque, conserver le comportement existant sans cache nouveau. Aucune de ces étapes n'est déclarée réalisée par cette note.
