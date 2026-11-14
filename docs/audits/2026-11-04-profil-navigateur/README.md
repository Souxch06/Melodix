# Vérification de l’identité navigateur du dernier APK de test

## Sources effectivement vérifiées

L’analyse porte sur le candidat de l’APK `1.2.2-glass-reprise-sans-delai-test.apk` (`a1221cbf7e72a8d3254f294395c8ec43ac05815c`, SHA-256 `7134f7873ff2740e7d2afdbb3332a02e8e216f1d2a0cb26e1c8641b4e073f015`). L’asset `desktop_spoof.js` de cet APK est identique à la source inspectée (SHA-256 `c8bfa3667638855e806983bfc0db466cad7c15fdf1fccca71cec8ba0000e8068`) ; le DEX a été désassemblé pour vérifier `BrowserProfile`, `m9` et `c91`. Une autre version ou application peut avoir un comportement différent.

- Dans ce candidat, `BrowserProfile.desktopUserAgent` lit `WebSettings.getDefaultUserAgent`, extrait le jeton `Chrome/…` et construit un UA de forme Windows avec cette version ; sans jeton, il conserve l’UA de la plateforme. Le profil est configuré avant le chargement initial de Spotify ou du compte ; il existe aussi un réglage à la navigation Google.
- Dans ce même candidat, `desktop_spoof.js` lit `navigator.userAgent`, extrait le numéro `Chrome/…` et utilise cette valeur dans `brands`, `uaFullVersion` et `fullVersionList`. Il simule bien une plateforme Windows, mais **ne fige pas la version à 134**. Si le WebView installé rapporte 134, ces chemins peuvent naturellement rapporter 134 ; sa version réelle sur le téléphone n’a pas été mesurée ici.
- Une chaîne `Chrome/134.0.0.0` demeure dans `si0.smali`, dans une connexion `HttpURLConnection` liée à `LinkHandler`, distincte de la configuration d’UA de la WebView décrite ci-dessus. On ne dispose pas de preuve que cette connexion soit celle du document principal ou de `libraryV3` du diagnostic ; elle n’a pas été modifiée.
- L’alignement des valeurs **JavaScript simulées** sur le numéro de l’UA configuré ne démontre pas la valeur des en-têtes `Sec-CH-UA` effectivement envoyés, leur cohérence de plateforme, l’état du fournisseur WebView sur le téléphone, ni le traitement côté Spotify. La modification JS ne modifie pas à elle seule les en-têtes HTTP ; l’injection via callbacks WebView ne prouve pas une influence sur la requête principale déjà en cours.

## Vérifications synthétiques

`profile.test.cjs` interprète les instructions Smali concernées de `BrowserProfile` avec une implémentation factice de WebSettings et exécute l’asset JS réel dans JSDOM. Pour les versions **fictives** `134.0.0.0`, `142.0.1.7` et `150.2.3.4`, la version du profil natif est propagée aux valeurs JavaScript attendues ; l’absence de jeton Chrome conserve les valeurs de plateforme prévues. **4/4 tests passent**. Les tests existants `tests/runtime_state.test.js` passent également **23/23**. Ces chiffres de version ne sont pas une affirmation sur la version actuelle de Chrome ou sur l’appareil.

Avec les dépendances du projet : `node --test docs/audits/2026-11-04-profil-navigateur/profile.test.cjs`.

## Limites et suite

La précédente réponse 429 du document principal et le document `about` ultérieur ne permettent pas d’identifier une cause. Aucun appareil, émulateur ou KVM n’est disponible ici. L’accès GitHub Actions retourne HTTP 403 ; la clé de la Preview existante est un secret CI. Aucun APK Preview, changement de version, modification d’en-tête, de connexion, de cookie ou de signature n’a été produit. Il serait hasardeux de remplacer une version déjà dynamique par un numéro inventé.

Le contraste Chrome sur le même téléphone en Wi-Fi puis en données mobiles peut apporter des indices, sans prouver à lui seul la cause. La comparaison native/JS et l’observation des requêtes exigent une Preview instrumentée sur appareil ; ne pas partager de cookies, jetons, en-têtes sensibles ou contenu de playlists. Un statut 200 seul ne prouve pas que le corps contient les éléments attendus ni que le rendu est visible. Le commentaire sur un service worker et IndexedDB est une hypothèse de code, pas une preuve de corruption sur ce téléphone ; éviter d’effacer les données de l’application qui fonctionne.
