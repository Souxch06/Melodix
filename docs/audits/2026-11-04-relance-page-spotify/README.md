# Retour appareil et relance manuelle Spotify

La capture du candidat précédent montre : largeur 990, hauteur 1846, `visible=true`, progression 100 %, code `110111000`. Cela indique que la WebView est affichée et dimensionnée, que l'origine détectée est Spotify et que le corps, le runtime, le shell et le pont existent. Aucun des trois sélecteurs testés pour le conteneur principal, ni les marqueurs de profil et lecteur, n'est présent. Le diagnostic ne prouve pas que le DOM est totalement vide, que le téléchargement a réussi, ni que l'utilisateur est déconnecté.

La récupération du shell automatique a une faiblesse : l'affichage de l'état natif peut déclencher `__sfNativeUiReadyNotified` avant la fin du délai de récupération, et ce drapeau empêche alors `maybeNavigateToPlayer` de s'exécuter. On ignore si c'est la cause du problème de cet appareil. Le vieux `AndBridgeProbe.run()` contient en outre un test de nullité inversé ; réactiver son ancien comportement serait risqué car il tentait notamment d'accepter automatiquement des dialogues de consentement.

## Candidat

Dans le dialogue Spotify, le bouton **Réessayer Spotify** lance manuellement, à chaque appui, l'une des trois destinations HTTPS fixes `open.spotify.com/app`, `/search`, puis `/` en boucle. Aucun délai ni redirection automatique supplémentaire ; les données de session, cookies et stockage ne sont pas effacés. La relance ne constitue pas une preuve que Spotify chargera, ni que la bibliothèque native fonctionnera.

Le diagnostic a été étendu à 17 bits fixes : origine, corps, sélecteur de contenu principal, runtime, shell, pont, profil, lecteur, état connecté, iframe, plusieurs enfants du corps, script externe déclaré, notification native, route collection, formulaire ou bouton de connexion, racine alternative, CTA lecteur. Aucun texte de page, cookie, URL, titre ou identifiant n'est affiché ; la réponse est limitée par une validation à 17 chiffres binaires. Les bits indiquent simplement des présences et ne permettent pas d'expliquer à eux seuls l'origine d'une page noire.

## Vérifications

591/591 tests Node et 4/4 tests Python du contrôle de signature ; nouveaux tests DOM simulés et contrôles statiques du bouton, pas de test Android. Compilation et décompilation apktool, intégrité ZIP, signatures v2/v3 API 24–36 et concordance du certificat avec la ressource compilée vérifiées. `com.melodix.music`, version 1.2.2 code 27, même certificat que l'APK précédent (`725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`). SHA-256 APK `50687c3be12998034e734d03ce7cdf225b4a64a588ede7e02c96c0b98d0bf449`.

Le patch complet `correctif-complet-sur-base-44902.patch` s'applique sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d` et les fichiers modifiés ont été vérifiés. SHA-256 `a95b057429483ccc69979d04a2a1cd8686cb61104770fdc657d402a4cefda6ad`. Aucune clé incluse. Lecture de playlists et complétude sur appareil restent à confirmer.
