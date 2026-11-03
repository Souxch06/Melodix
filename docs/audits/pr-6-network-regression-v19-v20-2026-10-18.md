# Audit rétrospectif — régression réseau entre Preview test.19 et test.20

- **Date :** 18 octobre 2026
- **Branche de travail :** `arena/dbf2d44f-melodix`
- **PR :** #6, laissée ouverte.
- **Périmètre :** comparaison du code source réellement compilé pour les Previews test.19 et test.20, puis des correctifs V21/V22 portant sur l’erreur réseau.
- **État :** rapport local seulement. Aucun code applicatif, workflow, release ou historique Git n’a été modifié par cette passe; aucun commit, push, build ni APK n’a été fait.

## Conclusion courte

La fenêtre de régression est maintenant précisément localisée : **V19 (`552da05`) → V20 (`f3e7a17`)**, où `f3e7a17` est l’enfant direct de `552da05`. Le changement le plus directement susceptible d’altérer le démarrage du lecteur est le remplacement du profil Chrome desktop par l’agent utilisateur Android WebView par défaut, accompagné du retrait de l’injection `desktop_spoof.js` au démarrage du document. V20 durcit également le traitement du contenu mixte.

C’est la meilleure piste issue du diff, **pas encore une cause runtime prouvée** : aucun code d’erreur WebView issu de l’appareil n’est disponible dans les éléments vérifiés. Le changement du grand intercepteur `shouldInterceptRequest` est réel, mais il est moins directement suspect pour la navigation principale Spotify qu’on pourrait le croire : le chemin historique excluait les domaines Spotify du proxy générique.

## Provenance exacte des APK

Le champ `targetCommitish` de la release V19 indique `main`, ce qui ne suffit pas à prouver le commit compilé. Les exécutions GitHub Actions donnent la provenance exacte :

| Preview | Exécution de build | SHA compilé | Résultat |
|---|---:|---|---|
| test.19 | `39118711086` | `552da05dcf9c9a50c530ee4f692d5d3f07081e39` | succès |
| test.20 | `39125298632` | `f3e7a174e157ebb9ee52b026c3cb4ea295aec583` | succès |
| test.21 | `39126741648` | `5496fe2de313ccfdcbac078cc0ca3669ccd1bc13` | succès |
| test.22 | `39128699894` | `0d2d09cb81493eff00274070a04474b992d77925` | succès |

Le fait qu’un workflow ait réussi prouve seulement que la Preview a été produite, pas qu’elle fonctionne sur téléphone. V20 correspond au commit V96; V21 est le commit V97.

## Changements réseau/chargement introduits dans V20

### 1. Identité et bootstrap du navigateur — piste prioritaire

Dans V19, `smali/m9.smali` définit l’agent utilisateur Windows/Chrome 134. `smali/c91.smali` le redéfinit aussi lors de la navigation et injecte `desktop_spoof.js`; `m9.g()` tente en plus son exécution au *document start* avec la règle d’origine `*`. Cet asset modifiait plusieurs API/indices du navigateur et empêchait notamment l’inscription des service workers Spotify.

Dans V20, les deux définitions de l’UA desktop et les deux chemins d’injection de `desktop_spoof.js` sont retirés. WebView garde alors son UA de plateforme Android et les scripts du lecteur voient davantage les API et l’identité natives de WebView. Cela change le profil présenté au serveur et le bootstrap JavaScript de Spotify. C’est le suspect le plus fort pour un changement de réponse ou de comportement au premier chargement, mais le diff seul ne permet pas de dire quelle réponse Spotify a renvoyée.

Le script supprimé contenait aussi des ajustements d’interface/lecture sans rapport direct avec le chargement initial, ainsi qu’une réécriture de données de capacité du lecteur. **Il ne faut pas restaurer l’ancien script complet comme “correctif réseau”** : cela réintroduirait des modifications globales, non ciblées et non nécessaires pour établir la cause.

### 2. Contenu mixte et accès local — changement confirmé, causalité faible à moyenne

Une correction importante par rapport à la note d’audit précédente : **`MIXED_CONTENT_ALWAYS_ALLOW = 0` et `MIXED_CONTENT_NEVER_ALLOW = 1`** dans `WebSettings` (source Android : [`WebSettings.java`](https://github.com/aosp-mirror/platform_frameworks_base/blob/master/core/java/android/webkit/WebSettings.java#L238-L261)).

- V19 passe `0` à `setMixedContentMode` : contenu HTTP mixte autorisé.
- V20 passe `1` : contenu mixte interdit, conformément au commentaire V20.
- V19 autorise aussi l’accès fichier/contenu; V20 les désactive.

Il s’agit donc d’un **durcissement**, pas d’une valeur incohérente. Une ressource HTTP secondaire pourrait être bloquée; cela explique moins facilement l’échec du document principal HTTPS `open.spotify.com`. JavaScript, stockage DOM, base WebView et acceptation des cookies restent activés; l’acceptation des cookies et des cookies tiers ne change pas entre ces versions.

### 3. Interception des ressources WebView — gros changement, mais pas un proxy général de Spotify

V20 remplace le corps de `c91.shouldInterceptRequest()` (plus de 4 000 lignes Smali dans V19) par une délégation à `WebViewClient`. V19 y avait des traitements spécifiques : réponses audio locales/range, ressources Canvas, filtres publicitaires, et un proxy de repli pour certaines requêtes externes.

La lecture des conditions nuance toutefois l’hypothèse initiale d’un proxy de toute la page Spotify :

- le premier chemin `Ldl1.l(url)` vise les URL Google (`accounts.google.com`, `google.com/o/oauth2`, `accounts.youtube.com`), pas `open.spotify.com` ni `accounts.spotify.com`;
- le proxy générique `c91.b()` exclut explicitement les hôtes contenant `spotify.com`, `scdn.co` ou `spotifycdn.com`, ainsi que plusieurs domaines tiers;
- la navigation principale Spotify et ses domaines usuels n’étaient donc pas simplement « proxifiés par l’app » dans V19 avant d’être remis à WebView en V20.

La suppression de ces interceptions peut encore affecter certaines ressources tierces ou les traitements média, mais elle est **moins convaincante comme cause directe du chargement de la page principale**.

### 4. Proxy natif de certaines commandes Connect — piste surtout post-bootstrap

V19 avait une autre route distincte : `spotify_bridge.js` détournait certains appels `fetch` liés à Connect et les envoyait à `AndBridge.nativeFetch()`. En V20, le script ne fait plus cet appel et `nativeFetch()` devient un stub 403. Cela peut expliquer une régression de certaines commandes ou fonctions Connect après le chargement; c’est moins susceptible d’expliquer l’échec initial du document Spotify. Cette route ne doit pas être réactivée sans analyse de sécurité séparée.

Les autres changements V20 dans `spotify_bridge.js`, `runtime_state.js`, `AndBridge` et les scripts d’interface réduisent/réorganisent des fonctions post-chargement. Ils méritent des tests fonctionnels, mais ne ressortent pas comme cause directe du premier échange HTTP de la page.

## Le libellé « Network Error » n’identifie pas à lui seul la panne

Le traitement `onReceivedError(WebResourceRequest, WebResourceError)` de V19 et V20 est essentiellement identique : il ignore `ERR_ABORTED` (`-3`) et marque hors-ligne une erreur du frame principal. Ce n’est donc **pas une nouvelle règle V20**.

En revanche, `onReceivedHttpError()` dans V19 **et** V20 transforme aussi une réponse HTTP principale `>= 400` en état hors-ligne. Un rejet serveur (par exemple après le changement d’identité UA) pouvait donc être affiché comme « Network Error » au lieu de rester une réponse HTTP de Spotify. V21/V97 retire ce chemin et le callback historique ambigu; le correctif change le diagnostic UI, mais ne restaure pas les réglages V19.

Le rapport de suivi existant indique que le message persistait après V21, ce qui rend insuffisante l’explication « c’était seulement un statut HTTP 4xx/5xx ». V22 ajoute ensuite une mitigation ciblée du service worker Spotify. Son efficacité n’a pas été confirmée par un résultat d’essai Android dans les éléments consultés.

## Classement des hypothèses

| Piste | Priorité | Ce que le diff établit / ce qu’il n’établit pas |
|---|---|---|
| UA desktop + injection de bootstrap supprimés en V20 | **Forte** | Changement directement avant le démarrage du site; peut modifier le chemin/initialisation Spotify. Aucun code d’erreur ni réponse serveur observée. |
| Contenu mixte `ALLOW → NEVER_ALLOW` | **Moyenne-faible** | Changement réel; peut bloquer des sous-ressources HTTP. Aucun appel HTTP mixte critique identifié. |
| Service worker désormais autorisé en V20 | **Moyenne** | L’ancien script le bloquait; V22 tente une désinscription ciblée. Aucun état de worker observé; l’opération V22 est asynchrone. |
| Proxy de `shouldInterceptRequest` retiré | **Faible pour le document Spotify, plus élevée pour certaines ressources** | Le code V19 exclut les domaines Spotify du proxy générique; les traitements spécialisés ont toutefois disparu. |
| Proxy natif Connect désactivé | **Faible pour le premier chargement; pertinente après ouverture** | Affecte des appels Connect post-bootstrap, pas la navigation HTML initiale en elle-même. |
| « Network Error » causé par le callback HTTP | **Possible pour V20, insuffisant seul ensuite** | V20 confondait les réponses principales `>=400` avec hors-ligne; V21 a retiré cette voie. Le message persistant après V21 pointe vers une vraie erreur WebView ou un autre état. |

## Ce qui permettrait de trancher sans exposer de données

La modification déclenchante est localisée à V20; pour identifier **le mécanisme exact**, il faut le nombre `WebResourceError.errorCode` observé sur l’appareil, et, si disponible, seulement le statut HTTP du frame principal. Ne pas collecter ni partager URL complète, paramètres, en-têtes, cookies, corps de réponse ou jetons. Le correctif de diagnostic local existant conserve/affiche uniquement le code numérique; il reste local et n’a pas été publié.

Le test comparatif doit garder le même téléphone Android 16 et le même fournisseur/version WebView, dans l’application Preview isolée (`com.melodix.music.preview`), sans toucher à SpotiDuck. Un test contrôlé des changements V20 un par un (UA/bootstrap, puis réglage de contenu mixte si le code pointe vers une ressource bloquée) permettrait ensuite de confirmer lequel fait disparaître l’erreur. Aucun de ces essais n’a été réalisé pendant cet audit.

## Limites et état des fichiers

Analyse statique Git/Smali/JavaScript et provenance GitHub Actions uniquement. Pas d’APK assemblé, pas de WebView instrumentée, pas de Logcat, pas de connexion Spotify réelle et pas de lecture testée. Aucun code, build ou release n’a été modifié/publié pendant cette passe. Le présent rapport est le seul fichier créé par cette passe.
