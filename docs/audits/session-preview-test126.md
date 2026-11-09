# Preview126 — récapitulatif par tentative, phase1 uniquement

## Synchronisation et sauvegarde

Fusion conflictuelle annulée par `git merge --abort`, sans résolution. Commit local `00c743af95c66f28de7a42ae8d6d0339ca919a3b` toujours présent ; bundle autonome `/home/user/melodix-backups/avant-sync-preview125.bundle` vérifié. Retour sur Preview125 `70429cb8989bb26694374ab76952236547094992` par `git reset --keep`, sans `reset --hard`. Aucun travail du commit de sauvegarde n’est réintroduit dans le diff de cette livraison. Des fichiers portant certains des mêmes noms existaient déjà dans Preview125 : ils ne sont pas supprimés.

## Ajout limité au diagnostic

Un canal `onSessionAttemptDiagnostic` **séparé** de `onSessionVerification` observe chaque tentative effectivement démarrée. Il conserve jusqu’à16 récapitulatifs en mémoire, identifiés par génération/tentative, avec source contrôlée (`shell-update`, `native-retry`, etc.).

Exemple synthétique :

```text
Tentative 3/1 · source=shell-update · token API=400 · repli=403 · bibliothèque=401 · terminée=oui · cookie=c1 · token=refusé
Tentative 4/2 · source=native-retry · token API=inconnu · repli=inconnu · bibliothèque=inconnu · terminée=non · cookie=c1 · token=inconnu
```

- Les HTTP proviennent seulement des réponses de **cette tentative** ; pas des dernières valeurs globales, qui peuvent provenir d’une tentative précédente ou d’un accès au cache.
- Un HTTP non observé est `inconnu`, pas0 ni un code inventé. Après token obtenu depuis le cache, le token peut être `obtenu` et les HTTP API/repli rester `inconnu`.
- `terminée=non` est publié au démarrage, `oui` au passage dans le `finally` du travail asynchrone, y compris après obsolescence. La deadline de présentation3s ne marque pas la tentative terminée et n’efface pas ce récapitulatif.
- Un événement de progression tardif ne peut pas faire régresser une tentative déjà terminée.
- Le token est `non tenté` seulement à l’observation initiale avant l’appel, `inconnu` pendant une attente/erreur non concluante, `obtenu` si un token a réellement été fourni et `refusé` si les deux endpoints ont explicitement répondu par des codes de refus sans token obtenu. Ces libellés ne modifient pas la décision de session.
- L’alias `c1`, `c2`… est attribué par le natif au cookie sp_dc observé à la réception initiale du récapitulatif. La corrélation interne utilise un digest éphémère, dans une table séparée de la preuve de session. Ni cookie, ni digest, ni token ne sont copiés. Les alias sont remis à zéro au nouveau lancement et ne sont pas comparables entre lancements ; après16 identités, l’alias est `inconnu`, sans réutiliser c1. Ce n’est pas une capture atomique du cookie envoyé sur le réseau et cela ne prouve pas qu’il n’a pas changé pendant une requête.

Le récapitulatif apparaît dans les détails de l’écran de statut et dans **Copier le diagnostic**, ainsi que dans le diagnostic global copié. Les mises à jour rafraîchissent uniquement le texte déjà présent : aucune navigation, nouvelle vérification ou ouverture de données privées.

## Invariants

Tests d’égalité avec Preview125 sur `NativeSessionGate.result`, `begin`, `canReconnect`, `requestLogin`, `publishSessionVerification` et les helpers Evidence/Reconnect/GateTask. Les corps de requête, endpoints, en-têtes, credentials, version Spotify et décisions de retry sont inchangés. Aucun changement d’adblock, d’interface, de classement ou de preuve d’accès privé. Aucune phase2.

Le dernier test125 ne peut pas être enrichi rétroactivement : les deux401 rapportés ne permettent toujours pas de qualifier le token. Sans traces complètes associées, API/repli et état du token restent **inconnus** pour ces deux tentatives historiques.

## Tests / livraison

Tests ciblés : snapshots partiels/finaux, séparation des tentatives, valeurs absentes/malformées, absence de secrets, consommateur diagnostic défaillant, fonctions réelles de récupération token avec réponses synthétiques400/403, succès200/cache et erreur réseau ; vérification des requêtes inchangées. Résultats finaux et lien de l’unique build126 à compléter après exécution.

Pas de nouveau build de matrice/instrumentation : une seule construction Preview126 est autorisée. Les tests locaux ne constituent pas une validation ART, d’authentification Spotify ou de pixels réels.

Pour le test utilisateur : installer126 par-dessus125 sans désinstallation/clear-data, relancer, attendre l’état affiché, toucher Réessayer une fois, puis ouvrir les détails et copier le diagnostic. Comparer les deux lignes (HTTP, fin et alias) ; ne pas effacer la session pour obtenir ces observations.
