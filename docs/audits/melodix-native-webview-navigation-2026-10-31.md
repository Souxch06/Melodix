# Diagnostic — navigation du lecteur dans la WebView Melodix

- **Date :** 31 octobre 2026
- **Branche :** `arena/7142700d-melodix` (PR #7 laissée ouverte)
- **Commit de la préversion :** `702cdd948f402fdd31d211c9c3f851c27e5b8514`
- **Préversion publiée :** [v1.2.2-test.91-preview](https://github.com/Souxch06/Melodix/releases/tag/v1.2.2-test.91-preview)
- **APK :** [Melodix-Preview-v1.2.2-test91.apk](https://github.com/Souxch06/Melodix/releases/download/v1.2.2-test.91-preview/Melodix-Preview-v1.2.2-test91.apk)
- **Run de build/signature/publication :** [41212690150](https://github.com/Souxch06/Melodix/actions/runs/41212690150), réussi.
- **État utilisateur :** l’utilisateur dit toujours ne pas voir l’interface Melodix. La version réellement installée n’a pas été confirmée et aucune capture récente n’a été fournie.
- **Conclusion :** cette version corrige un chemin plausible de sortie de la WebView; elle n’est pas déclarée comme résolution tant qu’elle n’a pas été essayée sur l’appareil concerné.

## Hypothèse ciblée

La récupération du lecteur et plusieurs actions du shell passaient par `window.location.assign()` vers `open.spotify.com`. Malgré les gardes de navigation déjà présentes, une URL HTTPS vérifiée comme App Link peut être transmise au système Android et ouvrir Spotify au lieu de rester dans le WebView de Melodix. Les éléments statiques rendent cette hypothèse crédible; ils ne prouvent pas qu’elle explique à elle seule l’écran vu sur le téléphone.

## Correctif

- Le shell utilise maintenant une fonction unique `navigateWebPlayer()` pour sa récupération, l’ouverture d’une URI Spotify, les actions Accueil/Bibliothèque et la recherche. Elle refuse les destinations non HTTPS ou hors de l’hôte exact `open.spotify.com` et ne retombe pas sur `location.assign()` si le bridge est absent.
- `AndBridge.loadWebPlayerUrl()` répète cette validation côté Android (schéma HTTPS, hôte exact, aucun user-info, port absent ou 443), puis poste un `Runnable` sur le thread UI. Celui-ci appelle `WebView.loadUrl()` sur la WebView Melodix existante.
- Le probe Android de secours emploie ce même callback pour ses routes `/app`, `/search` et ses sources d’iframe; il n’envoie plus les navigations de récupération au résolveur externe d’Android.
- Le chemin de déconnexion `accounts.spotify.com/logout` et le système de connexion/authentification n’ont pas été modifiés. Aucune playlist fictive ni faux message de succès n’a été ajouté.

## Vérifications

- Tests ciblés shell, probe, politique Spotify, références Smali et structure Smali : **140/140 réussis**.
- `node --check` sur les scripts/tests modifiés et `git diff --check` : réussis.
- Suite Node complète : **327/329 réussis**. Les deux échecs connus restent `auth and WebView code do not capture credentials or proxy Spotify requests` (liste statique de scripts obsolète dans `c91.smali`) et `JavascriptInterface annotations are limited to bridge methods used by active JavaScript` (inventaire figé qui ne couvre pas tous les appels natifs/JS). Ils échouaient déjà avant ce correctif; le test d’annotations inclut maintenant le nouveau callback actif `loadWebPlayerUrl`.
- GitHub Actions a assemblé, signé et publié l’APK : succès, asset de **3 355 400 octets**. C’est une preuve de compilation, pas d’exécution sur le téléphone.
- Conformément à la consigne de ne garder qu’une release, l’ancienne release test.90 a été supprimée après publication de test.91; son tag Git est conservé. **test.91 est la seule release publiée restante.**

## Validation encore requise

La Preview est une application séparée (`com.melodix.music.preview`) : installer et lancer **Melodix Preview**, pas l’application Spotify ni l’installation standard de Melodix. Le build attendu dans l’application est `Melodix Preview 702cdd9` (version `1.2.2-702cdd9`). Vérifier ensuite si l’interface Melodix apparaît et si l’application reste au premier plan. Si l’écran est encore identique, une capture et le rapport de démarrage Melodix permettront de voir si le callback natif a été appelé (`player-nav native-load requested`) et où le démarrage s’arrête. Aucun essai sur appareil n’a encore confirmé le résultat.
