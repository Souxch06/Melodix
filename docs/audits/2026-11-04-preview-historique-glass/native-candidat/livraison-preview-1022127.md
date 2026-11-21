# Preview 1022127 — suivi partiel audio, bibliothèque et Glass

[Archive signée](https://github.com/Souxch06/Melodix/actions/runs/43726920675/artifacts/14166357321) ; APK `Melodix-Preview-historique-glass.apk`, package `com.melodix.music.preview`, versionCode 1022127, SHA-256 `53ad9f65397781f92fd48654dd9586ef0759e00e1e62501a0685e8e59ec01063` ; source `f8f96de9257e6658a8d8db28792b10a28ebffd82` ; SHA-256 de l'archive ZIP `ca63715d738a4a0b9a022ebfa2b5c7ee80d800a6b25ad9f684eef11e0fc9ced0`.

[Build et comparaison signée 7/7 avec 9016](https://github.com/Souxch06/Melodix/actions/runs/43726920675), puis [démarrages de l'APK signée exacte sur Android 11/15](https://github.com/Souxch06/Melodix/actions/runs/43727096816), hors ligne, avec rotation. Ces essais ne prouvent pas que Spotify, l'audio ou le rendu fonctionnent sur le téléphone. Les nouvelles couleurs n'ont pas fait l'objet d'une validation visuelle réelle.

[Changements et limites](suivi-audio-bibliotheque-glass.md). En particulier, la protection traite un rechargement qui **peut** couper le son, sans identifier ni résoudre nécessairement toutes les causes ; elle peut laisser un message d'attente plutôt que recharger en pleine lecture. La bibliothèque affiche plus vite les pages déjà disponibles et dont la session est vérifiée, pas les données encore absentes. Le temps de première ouverture des playlists n'a pas été établi comme réduit. Le grand bouton de lecture et la refonte complète des playlists restent à faire : la disponibilité du premier titre et les contraintes de lecture ne sont pas prouvées.

## Essai téléphone

1. Écouter une piste, puis ouvrir la bibliothèque et plusieurs playlists, revenir et vérifier si le son continue ; noter si un message d'attente apparaît et s'il est remplacé par les titres.
2. Mesurer plusieurs premières ouvertures et réouvertures de playlists et de bibliothèque ; préciser à quel moment les titres sont réellement visibles. Une frame préparée n'est pas une présentation écran.
3. Vérifier l'apparence et les actions des paramètres, le nouveau titre de playlist et les barres mini/full, puis transmettre captures et diagnostic copiables sans données privées si un défaut persiste.
