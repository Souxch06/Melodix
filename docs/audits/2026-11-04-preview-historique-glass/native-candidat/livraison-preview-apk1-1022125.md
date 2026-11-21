# Preview 1022125 — correctif candidat après retour téléphone

- [Télécharger l'archive CI](https://github.com/Souxch06/Melodix/actions/runs/43721989660/artifacts/14165155502) : archive `Melodix-Preview-lot1`, APK `Melodix-Preview-historique-glass.apk`, package `com.melodix.music.preview`, versionCode **1022125**.
- SHA-256 APK : `86372d085ff02bf35e544c0492f6a36fc2161fdb68f1bf413cbb22f71cf2581c` ; SHA-256 ZIP GitHub : `7f22158ce5cdc6e6cecfda5f34c368de5c8f19ee02523cd5384b937c4ed87b4f` ; source `d0bec345c63dc26bc3baa0723ec137388c101b61`.
- [Construction signée et comparaison bloquante](https://github.com/Souxch06/Melodix/actions/runs/43721989660) : sept actifs protégés strictement identiques à 9016 signée. [Démarrage de l'APK signée exacte](https://github.com/Souxch06/Melodix/actions/runs/43722202781) : Android 11 et Android 15, sans réseau ni compte, lancement et rotations ; ne vérifie ni Spotify ni audio.

## Ce qui change

Le compilateur relit maintenant le Java en UTF-8 et les tests vérifient l'absence de caractères de remplacement dans le Smali de l'APK reconstruite. Le shell lit passivement la barre de progression existante, utilisée par le bridge inchangé, et gère les échantillons valides dont l'URI du titre n'est pas visible, sans extrapoler leur progression. Une paire position/durée ne provient que d'une seule source ; un changement de source ne compte pas comme une preuve de mouvement. Aucune requête supplémentaire, modification du bridge protégé, ou stratégie de pagination nouvelle.

Le diagnostic indique la source (`range`, `media`, `clock` ou `none`) et si une identité de titre a été trouvée, sans titre ni URI. Une source inconnue, ou une identité absente, peut encore limiter la fluidité ou l'affichage. Le test réel est indispensable avant de conclure que la barre fonctionne.

## Essai téléphone

1. Installer l'APK 1022125 par-dessus la Preview existante ; lancer une piste et vérifier les deux barres, le temps écoulé, la durée et le temps restant pendant au moins une minute.
2. Tester pause, reprise, changement de piste et retour à l'écran, sans supposer qu'un mouvement continu est possible si le diagnostic indique l'absence d'identité.
3. Vérifier que les accents et tirets du diagnostic sont lisibles. En cas d'échec, envoyer le texte copié et une capture, en vérifiant qu'aucune information privée n'y figure.
4. Ouvrir plusieurs playlists et noter les délais. La mesure « appui → prochaine frame avec titres » est un repère de préparation, pas une mesure de présentation écran. La correction ne revendique pas de gain playlist ; voir [analyse](retour-telephone-1022124.md).
