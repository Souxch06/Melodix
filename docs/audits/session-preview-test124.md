# Preview test124 — login avant accueil

## Candidat à installer

**Uniquement le build 42597941924** : les APK test124 plus anciens étaient intermédiaires et certains précédaient la correction du dispatcher Retour final.

| Champ | Valeur |
|---|---|
| APK | Melodix-Preview-v1.3.2-test124.apk |
| Package | com.melodix.music.preview |
| versionCode | **1021459** |
| versionName interne | 1.2.2-5acef50 |
| Source applicative | `5acef50b23f1c8d5968a43bea6995e28343d6790` |
| SHA256 | `cd7483fb5082df5ed778072a77628e1a64db92525c488bc1066e80060b05191c` |

- [APK signé — artifact 13663563700](https://github.com/Souxch06/Melodix/actions/runs/42597941924/artifacts/13663563700)
- [Build réussi](https://github.com/Souxch06/Melodix/actions/runs/42597941924)
- [PR8](https://github.com/Souxch06/Melodix/pull/8)

Mettre à jour la preview existante **sans désinstallation ni clear-data** afin de conserver sa session. Le numéro de version interne et le nom du fichier sont distincts ; vérifier surtout versionCode et SHA ci-dessus.

## Cause et correction

Cartographie détaillée : [login-first-routing.md](login-first-routing.md), avec les lignes de la source d’origine `bd04561b`.

- Ancien `MainActivity.smali:8961` : l’entrée `showNativeUiFrom` pouvait laisser passer une page http avec `B=false` et afficher l’accueil avant preuve.
- Ancien `MainActivity.smali:7507–7570` : page-finished pouvait libérer le login sur une page player sans validation de bibliothèque.
- Ancien `MainActivity.smali:11479–11489` : `openSpotifyLogin` se limitait à relancer verify dès qu’un cookie existait ; un cookie refusé ne menait donc pas au login.
- `loginN` comptait des assertions de surface, pas des navigations ni des connexions réussies. `clear-accounts` invalidait la preuve locale, sans suppression de cookie. Le diagnostic test120 ne valide pas cette preview.

La décision est maintenant centralisée dans **NativeSessionGate** : verifying / no-session / session-expired / valid / error. La présence d’un cookie route uniquement la vérification ; elle n’autorise pas les playlists. Une tentative courante terminée doit fournir jeton + bibliothèque validée pour passer valid. L’expiration exige jeton refusé aux deux endpoints + library401, corrélés à la même tentative, hors login frais.

Une seule redirection automatique de login par lancement ; pas de purge automatique. Le budget initial de ~3 s ne prouve jamais une expiration : il conduit à une erreur réessayable, et une preuve tardive courante reste recevable. Les callbacks périmés sont ignorés. La reconnexion destructive reste conditionnée à une expiration prouvée, un tap et l’absence de navigation login en cours.

Le natif masque réellement les vues privées et leur accessibilité avant validation. Le fond de vérification et le bandeau login sont glass violet/magenta ; la page Spotify n’est pas restylée. Après validation, le shell réémet les payloads qu’il avait pu considérer comme envoyés pendant le blocage natif. Retour utilise l’adaptateur existant du dispatcher final, sans modifier ses payloads fullscreen/history.

## Fichiers principaux

- `MainActivity.smali`, `m9.smali`, `c91.smali` : raccordement des décisions et callbacks.
- `NativeSessionGate*.smali`, `NativeSessionSurface*.smali` : états, délai, surfaces et protection des vues.
- `NativeSessionRecovery`, `NativeSessionReconnect`, `NativeAccessRefusal`, `NativeSessionTimeout` : récupération non destructive et garde de suppression.
- `AndBridge.smali`, `NativeStartupTiming.smali` : métadonnées corrélées et MDXPERF à raisons fixes.
- Sources JS bridge/shell et assets générés : observation de fin de tentative et resynchronisation après preuve, sans changer les requêtes.
- `res/layout/native_session_surface.xml`, drawables `session_glass_*`, tests et workflows dédiés.

Spoof, configuration des requêtes/en-têtes/version Spotify et `adblock_hosts.txt` inchangés. Aucun token, cookie, URL ou contenu privé ajouté au journal de transitions.

## Preuves et limites

- Suite finale : **1024 tests, 1020 réussis, 0 échec, 4 ignorés**.
- Registres : **0 problème sur les 10 helpers NativeSession** ; test supplémentaire contre toute redéfinition d’une méthode finale des superclasses empaquetées.
- [CI Android 42597934736](https://github.com/Souxch06/Melodix/actions/runs/42597934736), source **5acef50b** : succès du runner synthétique, dont démarrage sans session, deadline, succès/refus simulés, callback périmé, rotation, recréation et Retour.
- [CI Android 42598072180](https://github.com/Souxch06/Melodix/actions/runs/42598072180), source **8552a917** : succès également ; aucun changement applicatif par rapport au candidat, seulement collecte CI et documentation.
- [CI Android 42599038997](https://github.com/Souxch06/Melodix/actions/runs/42599038997), source **f0bf0325** : **succès**, avec vrai passage de la tâche en arrière-plan puis retour premier plan sans clear-task/data. Depuis le candidat 5acef50b, seuls le runner de test, le workflow de collecte et la documentation ont changé ; aucun fichier applicatif.

Les résultats de jeton/bibliothèque du harness sont **simulés**. Ils ne prouvent ni une authentification Spotify réelle, ni la validité du cookie du téléphone, ni ses playlists/pixels. L’APK instrumenté est un build debuggable du même code, distinct du candidat signé non debuggable ci-dessus. L’ancienne CI images n’est pas reclassée en réussite.

Sur téléphone : suivre les six cas du protocole de `login-first-routing.md`, notamment session conservée, refus après login frais, hors ligne, Retour et reprise. La rotation/recréation automatisée porte sur la surface native d’erreur et le budget de navigation, pas sur les pixels du formulaire Spotify. Restent à mesurer : SSO réel, latence >3 s, rotation/grande police/clavier sur le bandeau login et affichage des playlists privées. Ne pas contourner un refus Spotify ni effacer une session pour obtenir un test vert.
