# Preview127 — correctif deadline et diagnostics, phase 1

## État et sécurité

Source126 `250efda32b8669fe078be5897bfa22acce48b126`, complétée par le commit documentaire `e59b6e728f5613563643758ad47c9056d5997e4c`. `git show --stat e59b6e7` et la liste des chemins confirment un seul fichier : `docs/audits/session-preview-test126.md`. Intégration fast-forward dans le worktree séparé `/home/user/Melodix-preview127`, sur la branche imposée `arena/6b935c3e-melodix`, sans conflit ; les rapports126 et127 sont conservés séparément.

L'utilisateur autorise désormais le commit et le push du seul correctif (15 fichiers), sans force, après contrôle de la tête distante. La sauvegarde et les26WIP restent exclus. Au moment de cette rédaction pré-commit, aucun build127 n'est lancé et aucun APK127 n'est revendiqué. Un unique build signé Preview127, versionCode1021463, sera déclenché après le push ; second essai uniquement en cas de panne d'infrastructure. Le résultat et le lien seront consignés dans le rapport externe de livraison. Java/SDK/ADB absents ici ; le scénario Android synthétique n'a pas été exécuté. Les workflows Android existants construisent d'autres APK et ne seront pas déclenchés pour contourner le budget d'un build.

La nouvelle sauvegarde est **distincte** de l'originale `00c743af` et du bundle historique, toujours absents ici. Archive `/home/user/melodix-backups/new-backup-26-before-preview127/nouvelle-sauvegarde-26-fichiers.tar`, SHA256 `7625061346d9b81c8e082fe08951bd05ec8da5577870198de704c4387a886589`. Relecture avant travail puis finale : 26/26 fichiers conformes (taille et SHA). Inventaire, liste SHA et checksum d'archive adjacents. Les 26 fichiers et les octets de l'index du principal `/home/user/Melodix` sont inchangés à la vérification finale. Aucun WIP réintroduit. Attention : les références Git sont partagées entre worktrees ; l'installation sur la branche imposée a déplacé sa référence commune (désormais àe59b6e7 avant le commit correctif), sans modifier les fichiers ni l'index du principal. Le principal n'est donc pas un checkout propre de cette référence ; ne pas y exécuter de restauration/reset automatique.

## Décisions et fichiers

- `NativeSessionEvidence.smali` : `retainIfCurrent()` conserve uniquement un compteur positif si l'identité courante est vérifiable et correspond. Sinon remise à zéro de la **preuve**, jamais suppression de cookie. Aucun incrément et aucun appel à `recordCurrentCookie` dans la deadline.
- `NativeSessionGateTask.smali` : deadline conserve conditionnellement cette preuve, reste en état de présentation indéterminé, sans conclure à l'expiration.
- `NativeSessionGate.smali` : motifs fixes sur génération périmée et tentative déjà traitée/ancienne ; classification et seuil de preuve inchangés.
- `NativeSessionAttemptDiagnostic.smali` : fusion des observations sans effacer HTTP/completion connus lors d'un ajout de motif ; valeurs non observées `inconnu`. Historique borné à16 lignes, motifs whitelistés et dédupliqués. Relance `attempt=0`, distincte d'une tentative réseau. Un blocage tardif ne retire pas un démarrage déjà observé. Alias uniquement éphémères ; un motif seul ne prélève pas le cookie courant pour l'attribuer rétroactivement à une tentative historique.
- `NativeSessionRecovery.smali`, nouveau `NativeSessionRetryDiagnosticCallback.smali` : observation de relance et disponibilité JS ; callback capture la génération et enrichit seulement le diagnostic, sans changer preuve/état ni relancer.
- `scripts/spotify_bridge.source.js`, asset régénéré `assets/spotify_bridge.js` : cache explicite, blocages DOM/429 avant création de tentative, abandons requête/contexte obsolètes. Aucun changement aux endpoints, requêtes, en-têtes, version Spotify, publicité ou adblock. Publication de preuve et gardes d'obsolescence conservées.
- Tests adaptés `session_attempt_diagnostic`, `session_evidence`, `session_gate` ; nouveaux `session_phase127`, helper VM et harness Android synthétique `tests/android/SessionPhase127Instrumentation.java`.

## Revue adversariale et résultats réellement obtenus

- Suite finale `npm test` : **1050 tests, 1046 passés, 0 échec, 4 ignorés** (journal final après intégration e59b6e7 : `/tmp/preview127-full-e59.log`).
- Ciblés Gate/Evidence/Phase127 : **34/34 passés** avant le dernier ajustement de rendu `source=inconnu`, couvert ensuite par la suite complète.
- `python3 scripts/smali_register_check.py smali/com/melodix/music/NativeSession*.smali` : **0 problème sur15 fichiers**.
- `git diff --check` : propre. Assets régénérés avec `bash scripts/build_runtime_assets.sh`.
- Tests intégrés exécutant les corps smali Evidence/Gate via interpréteurs de test : refus complet1 → retry/deadline conserve1 → second refus distinct complet même cookie donne2 → callback dupliqué ne recompte pas → cookie remplacé remet à0. Deadlines seules ne créent jamais de preuve.
- Tests Diagnostic sur smali réel interprété : ajouts reason-only et messages partiels ne détruisent pas HTTP/source/completion ; relance sans tentative ; blocage tardif observationnel ; historique16 ; alias inconnus pour motif seul et absence de secrets exportés.
- Exécution JS isolée : refus de lancer en attente429 ; motifs d'abandon avant sortie obsolète, sans publication de preuve ; motif DOM/429 `attempt=0`. Tests existants de cache et instrumentation inclus dans la suite complète.
- Revue des chemins callback, doublon, génération obsolète, cookie absent/changé/invérifiable : aucune purge ajoutée ; seuil de deux refus complets distincts conservé. HTTP400/403 sans401 bibliothèque ne suffit pas ; timeout et deadline ne prouvent pas l'expiration.

## Limites et inconnus

Les interpréteurs exécutent du smali mais ne sont pas ART. Les assertions structurelles du callback ne remplacent pas une exécution WebView. **Aucune compilation smali/APK, signature, exécution Android, capture téléphone/tablette ou authentification Spotify réelle validée pour127.** Le harness Android est préparé, non compilé/non exécuté, non intégré à une CI déclenchée. Il est réservé à un émulateur neuf isolé avec cookies synthétiques, jamais au téléphone utilisateur.

L'alias décrit le cookie observé au reçu initial, pas une capture atomique du cookie envoyé. Une relance sans observation de démarrage reste `inconnu`, sauf blocage explicite ; les diagnostics ne constituent pas une preuve serveur.

Investigation en lecture seule : `window-js` avec `inline` ne désigne pas le script responsable ; absence de filename et répétitions possibles. `renderer-inactive` correspond à une garde de preuve Home, pas à une preuve de crash. Le lien causal entre ces deux signaux sur le téléphone reste **inconnu**. Aucune correction hors phase1 engagée.

## Reprise contrôlée et checklist utilisateur

Autorisation de push accordée pour le correctif uniquement. Contrôler de nouveau que le distant est àe59b6e7 avant push ; arrêter si un nouveau commit apparaît. Push fast-forward uniquement. Le workflow Preview a actuellement582 exécutions ; le prochain dispatch build-only donne `1020880 + 583 = 1021463`. Vérifier ce compteur avant dispatch et les métadonnées produites ensuite. Aucun workflow Android supplémentaire bâtissant un autre APK ne doit être lancé. Aucun changement de workflow dans ce correctif.

Après disponibilité d'un véritable APK127 : installer **par-dessus126**, sans désinstallation/clear-data ; ouvrir, appuyer **Réessayer**, attendre10s ; relever l'écran et utiliser **Copier le diagnostic**. Ne jamais effacer un cookie valide ; **Se reconnecter** uniquement au tap explicite autorisé après preuve répétée. Validation Android isolée à exécuter : premier refus complet, retry lent/deadline conserve1, deuxième refus complet même cookie → probablement expirée, remplacement cookie →0. S'arrêter ensuite pour validation utilisateur ; aucune phase2.
