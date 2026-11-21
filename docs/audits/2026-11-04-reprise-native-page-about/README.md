# Reprise native lorsque la page sondée est `about`

## Constat et défaut reproduit

Le diagnostic utilisateur après attente rapporte une WebView à 10 %, une origine Android classée Spotify, mais un document interrogé de type `about`, sans shell ni pont observés. Le panneau 429 reste attaché ; ces instantanés sont indépendants et ne prouvent pas un nouveau 429 ou la raison du blocage. On ne sait pas si ce document `about` est transitoire, définitivement bloqué, ni quelle est la cause côté réseau ou WebView.

Le bouton introduit au candidat précédent appelait `window.__sfNativeRetryLibrary` dans le document courant. Un test reproduit qu’avec un document `about:blank`, où ce symbole n’existe pas, cette expression est un no-op : un panneau 429 encore visible ne peut alors pas relancer la page. C’est un défaut possible dans cette situation, pas une preuve que c’est l’unique cause sur le téléphone.

## Correction

L’état 429 de la page transmet maintenant l’action dédiée `melodix:action:retry-page`. Son bouton est routé par `NativeRowClickListener` puis `MainActivity` vers `NativePageRetry`, qui utilise directement la WebView de l’Activity et une destination fixe `https://open.spotify.com/`, sans nécessiter de JavaScript dans le document courant. Lors du rendu du panneau, une échéance monotone est créée ; un appui après cinq minutes lance au maximum une navigation, puis impose à nouveau cinq minutes. Aucun timer ne déclenche de navigation automatique, aucune donnée ni cookie n’est effacé, et aucune preuve de session n’est fabriquée. Une exception ou WebView absente n’entraîne pas de boucle de relance.

Le délai est une précaution locale, **pas un Retry-After fourni par Spotify**. Le compteur est en mémoire dans le processus Android : une destruction de processus le réinitialise et le nouveau panneau recrée le délai. Une nouvelle présentation du panneau après expiration peut aussi redémarrer ce délai. Les autres chemins explicitement ouverts par l’utilisateur ne sont pas prétendus soumis à ce compteur. Spotify peut continuer à répondre 429 ou le chargement rester bloqué indépendamment de la correction.

## Validation

**697/697 tests Node et 4/4 tests Python passent.** Le modèle exécute les instructions Smali du rendu, du listener, du dispatch et du limiteur natif avec horloge et WebView simulées : échec de l’ancien appel JS sur `about:blank`, demande native après délai, clics répétés, exception, absence de WebView et absence de délai initial. Les tests source/compilé couvrent le panneau 429 et une reprise sur document 200 simulé. L’APK a été reconstruit ; l’inspection du DEX désassemblé confirme la présence des appels et du limiteur compilés. L’alignement, l’intégrité ZIP, trois assets compilés, les signatures v2/v3 API 24–36 et la garde de certificat ont été vérifiés. Shell compilé : 108107 octets.

APK `1.2.2-glass-reprise-native-test.apk` SHA-256 `eaf0fbfd93a8779cdaccb86b31716b23714c88a8d51a5293ceda940ee2a1fe25` ; certificat de test SHA-256 `725327d287615b9c22ab8f050b7d586e8b50c34e277081ac0cbba62994eb8eed`. Patch complet appliqué sur `44902d9b8d1d1d70bc72acbd66f7c0c2d4b41e0d`, 78 fichiers comparés au candidat ; SHA-256 `4398cf3a7a4f136bd77bd84e7e578d9cfe3697bd1e8e079f1373efc3e4805782`.

Aucun appareil, émulateur ou exécution ART n’est disponible ici. Les tests ne prouvent pas que `loadUrl` aboutira sur le téléphone, ni que Spotify lèvera la limitation, ni que les playlists s’afficheront. Aucune réponse réelle de bibliothèque n’a été observée.
