# Retour 1022131 — suivi partiel, 1022134

Retour utilisateur : temps/barre régressés, ouverture de bibliothèque/playlist interrompt la musique, titres likés vides, recherche lente. Ce sont des observations sur téléphone ; ne pas les contredire par les tests simulés.

## Modifications réalisées

- Lecture de la valeur **courante** de l'input range (`value`) au lieu de son attribut initial, tout en conservant la validation stricte en millisecondes. Cela corrige un cas concret où le DOM évolue par propriété sans changer l'attribut ; cela ne démontre pas que ce soit l'unique cause sur téléphone.
- Si le fallback recherche s'est installé avant le pont, la touche de validation interroge désormais le pont actif au lieu de recharger la page ; elle annule sa navigation différée. L'IME annule également la recherche différée encore en attente avant de soumettre, pour éviter deux recherches concurrentes. Ces changements ne garantissent pas la latence Spotify réelle. Si le pont est absent, le fallback conserve sa navigation historique.
- Le correctif VerifyError du Runnable de l'accueil identifié dans la 1022132 reste inclus, de même que la refonte Glass.

## Non résolu

Le retour sur la 1022131 montre que l'absence de rechargement dans les chemins synthétiques bibliothèque/playlist n'a pas suffi à garantir la continuité audio. La cause réelle de la pause n'est pas identifiée. Les appels likés et playlists du bridge protégé peuvent retourner une liste vide ou échouer sans distinguer la cause ; on ne sait pas si le problème est jeton, API, données de réponse ou autre. Aucune correction prouvée ni affichage inventé. Les sept actifs protégés sont inchangés.

## Artefact et validation

[1022134 signée](https://github.com/Souxch06/Melodix/actions/runs/43735553302/artifacts/14170387728), package `com.melodix.music.preview`, source `0d6ecc7ed6e7f5752ad36371028cbc9623e89beb`, SHA-256 APK `fdb87e94403139891030c10a57b03f19042fb51e63197b922f85d09c256d3c87`. Build signé et comparaison des sept actifs réussis. Tests DOM simulés sur l'APK redécodée, reconstruction, tests de structure et JVM. [Smoke Android](https://github.com/Souxch06/Melodix/actions/runs/43735744230) : Android 11 réussi ; Android 15 échoue avant toute annotation de phase applicative, y compris après relance, logs inaccessibles (`EOF`), cause inconnue. Ces tests ne valident ni Spotify, ni son, ni titres réels, ni latence. Ce n'est pas une livraison de tous les correctifs demandés.
