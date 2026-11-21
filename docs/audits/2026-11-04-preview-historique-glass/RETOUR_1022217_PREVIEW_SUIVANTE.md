# Preview suivante — limites du retour 1022217

Cette version est une Preview d'essai, pas une garantie de correction des problèmes signalés.

## Changements
- Le contrôleur Like, son job et ses diagnostics reconnaissent aussi le conteneur `now-playing-widget-v2` : la piste doit toujours être explicitement identifiée et revérifiée avant une action. Le diagnostic rapporté ne contenait pas cette identité : le bouton peut donc rester indisponible sur ce téléphone. Une structure Spotify issue d'un autre logiciel ne constitue pas une validation sur appareil.
- Les mêmes scripts sont présents et vérifiés dans les deux copies Smali (champ et constante intégrée à l'appel), puis vérifiés après décodage de l'APK. Cela répare un écart entre les sources JS/Java et le code réellement livré par le commit précédent.
- La pochette est ajoutée à la signature des mises à jour du lecteur. L'ancien code relançait le chargeur d'image à chaque mise à jour de position, et celui-ci annulait sa requête précédente. Une URL inchangée n'est plus relancée avant 15 s ; un changement d'URL l'est immédiatement ; une tentative périodique permet le rétablissement après échec. C'est une amélioration testable, pas une preuve que le flou était causé par ces annulations. Le cache restauré reste une miniature et peut être flou.
- Les playlists conservent le chargement progressif et les garde-fous de la Preview précédente. Aucune accélération supplémentaire n'est revendiquée : les phases rapportées ne suffisent pas à expliquer les 51 445 ms, et modifier la navigation à l'aveugle pourrait interrompre la lecture.

## Vérification
La chaîne locale reconstruit puis décode un APK non signé et vérifie sept actifs protégés ; les tests DOM/JVM et l'interpréteur Smali sont des simulations. Ils ne testent pas l'application Spotify connectée, le réseau réel, le rendu visuel ni la latence sur téléphone. La signature et l'identité de mise à jour sont vérifiées séparément par le workflow de livraison. Vérifier sur téléphone le Like sur un titre non aimé, une playlist vide et une grande playlist, ainsi que l'image après plusieurs secondes et après redémarrage.
