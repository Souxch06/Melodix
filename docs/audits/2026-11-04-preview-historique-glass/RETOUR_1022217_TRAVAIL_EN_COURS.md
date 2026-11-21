# Suite du retour Preview 1022217 — travail incomplet

## Observations établies
- Le diagnostic rapporté indique Like « non envoyé : identité ». Il ne permet pas d'identifier la piste active. Un titre, un album, une ligne hors lecteur ou un ancien clic ne sont pas des preuves suffisantes.
- Sur une mesure, l'appui à la frame des titres prend 51 445 ms, mais les sous-phases enregistrées ne couvrent pas ce temps et peuvent ne pas être séquentielles. La cause du délai non expliqué n'est pas établie. Le rendu natif rapporté prend 51 ms ; ne pas en déduire la cause des 51 secondes.
- Le cache de dernière piste enregistre actuellement la miniature (192 px), redimensionnée au plus à 384 px, puis la réaffiche aussi sur la grande vue. Ceci peut flouter la pochette restaurée, mais ne démontre pas que la capture montre ce cache. La grande vue en direct demande 720 px ; résolution source, mise à jour effective et éventuel écrasement restent à vérifier.

## Piste testée, pas une correction confirmée
Le sélecteur précis `now-playing-widget-v2` est ajouté au périmètre du lecteur dans les trois scripts Like et leurs versions embarquées. Une autre application rapporte ce DOM Spotify ([PR 143](https://github.com/GeeIHadAGoodTime/viola-oss/pull/143)), mais ce n'est pas une preuve que le téléphone utilise ce DOM. L'identité explicite et sa vérification restent obligatoires ; le changement ne répare donc pas le cas album seul du diagnostic actuel. Ce n'est pas une Preview prête à livrer.

Tests locaux : 353 tests Node passent sur les trois suites de contrôle, diagnostic et jobs, dont 240 fixtures paramétrées (six scénarios répétés avec 40 identifiants ; ce ne sont pas 240 scénarios fonctionnels indépendants) ; simulation JVM mode réussie ; cohérence scripts embarqués et `git diff --check` réussies. Ces tests ne simulent pas un appareil ou une session Spotify réelle et ne mesurent pas la latence.

## À poursuivre avant livraison
- Tracer les phases entre le tap natif, l'appel/accusé WebView, la requête, la réponse et la première frame, avec association à une même ouverture, sans exposer de données sensibles ; vérifier aussi timeout, navigation et changements de contexte.
- Trouver une source d'identité active vérifiable et tester les changements de piste avant/pendant l'action Like ; ne pas cliquer un contrôle générique sur la seule base du titre.
- Vérifier la provenance et la résolution de l'image affichée, les courses de chargement entre pistes et la restauration, avant de modifier le cache ; tests de non-régression puis validation sur appareil.
- Reconstruire et tester la chaîne complète et signer une nouvelle Preview seulement quand le lot est prêt ; validation réelle sur le téléphone toujours nécessaire.
