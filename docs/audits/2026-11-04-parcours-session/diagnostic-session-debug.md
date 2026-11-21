# Diagnostic session — journal débogable et répétitions WebView

## Démontré

Sur la branche de la PR #8, le journal ajouté est uniquement actif si le flag
Android `FLAG_DEBUGGABLE` est présent. Il reste en mémoire, est borné et le
canal natif refuse les chaînes qui ne correspondent pas à un vocabulaire fermé.
Les deux getters produisent une observation de thread natif (`main`,
`javascript-interface` si le nom système est `JavaBridge`, ou `other`). Les
appels contrôlés côté JS enregistrent le `typeof` et un indicateur `null`
séparé (`typeof null` vaut `object`), l'origine connue ou `other`, la route
`root/app/search/other`, l'état `readyState` et `top/child`. Les chemins libres,
query strings, fragments et noms de thread arbitraires ne sont pas copiés.

Le hook JS refuse un cadre ou une origine différente du lecteur. Le poller
natif garde sa vérification de génération et son callback explicite lorsqu'il
n'y a pas d'interface. Un sondage débogable indépendant utilise aussi le
callback `evaluateJavascript` pour observer les deux types, même si le pont ne
peut pas envoyer de diagnostic ; il ne fabrique aucune génération et n'ouvre
pas la session. Cette mesure supplémentaire peut elle-même arriver avant
l'injection et décrit alors ce moment précis, pas forcément tous les sondages
ultérieurs. Si WebView ne répond pas au callback, aucune valeur n'est inventée.
Les appels directement effectués par du JS tiers hors des deux sites contrôlés
ne permettent pas de connaître leur type de retour côté JS ; les appels natifs,
eux, sont observés dans les getters.

Pour les réponses bibliothèque 400/401/403, le journal indique POST,
`https://api-partner.spotify.com/pathfinder/v2/query`, statut et provenance
`api`, `fallback`, `cache-api`, `cache-fallback` ou `unknown` du jeton. La
réponse est clonée, sans toucher au corps consommé par l'application. Au maximum
les 1024 premiers octets du premier fragment du clone sont examinés ; seuls
les codes d'erreur exacts d'une liste fermée peuvent être reproduits comme
extrait. Tout autre contenu devient `redacted` (ou `unknown`/`empty`), même s'il
était plus court que la limite. **Ce n'est pas un extrait libre de la réponse** :
une troncature ou une expurgation par expressions régulières ne garantit pas
l'absence de jeton, cookie ou donnée personnelle. La capture d'un corps plus
riche nécessiterait une revue de confidentialité et de nouveaux formats
explicitement autorisés. Pas de corps, header, cookie ou jeton brut n'est
stocké dans ce nouveau journal.

Le journal est affiché par « Détails techniques » et inclus dans « Copier le
diagnostic » ; rouvrir les détails les actualise. Les tests unitaires ciblés
vérifient les types, origines, garde de cadre, refus des secrets synthétiques,
corps non consommé, statut et provenance. Le build et l'exécution Android
synthétique de [43254637810](https://github.com/Souxch06/Melodix/actions/runs/43254637810)
passent sur le code `d73c84cb`. Ils ne vérifient pas une réponse Spotify réelle
ni la lisibilité sur le téléphone de l'utilisateur.

## Taux de la sonde `generation-null`

Cinq runs indépendants sur `b8a44196` (ancienne version) ont réussi la sonde
WebView 133 : [1](https://github.com/Souxch06/Melodix/actions/runs/43252914793),
[2](https://github.com/Souxch06/Melodix/actions/runs/43252920611),
[3](https://github.com/Souxch06/Melodix/actions/runs/43252926499),
[4](https://github.com/Souxch06/Melodix/actions/runs/43252932951),
[5](https://github.com/Souxch06/Melodix/actions/runs/43252938709) : 0/5 échec.

Cinq runs indépendants de la version instrumentée `ca7a4c40` ont également
réussi la même sonde WebView 133 :
[1](https://github.com/Souxch06/Melodix/actions/runs/43254139252),
[2](https://github.com/Souxch06/Melodix/actions/runs/43254145307),
[3](https://github.com/Souxch06/Melodix/actions/runs/43254152105),
[4](https://github.com/Souxch06/Melodix/actions/runs/43254158803),
[5](https://github.com/Souxch06/Melodix/actions/runs/43254165231) : **0/5,
soit 0 % observé**. Après ajustement de la garde d'origine JS, un sixième run
sur `d73c84cb` a aussi réussi, mais ce n'est pas le même commit : ne pas le
mélanger artificiellement au taux 0/5. L'échec antérieur
`synthetic_valid_restore_null_null` du premier essai de
[43250106265](https://github.com/Souxch06/Melodix/actions/runs/43250106265)
reste réel ; sa relance verte ne l'annule pas. Un échantillon de cinq réussites
ne prouve pas un taux réel nul ni une correction, et le proxy qui provoque ce
cas est synthétique.

## Supposé / inconnu

La disponibilité du pont et le timing d'injection sont des pistes, pas une cause
démontrée du `generation-null` téléphone. Les refus 400/403 précédents
concernent les endpoints de jeton ; faute de bearer la bibliothèque n'est pas
appelée : ne pas inventer un 401 bibliothèque. Leurs corps et la raison des
refus restent inconnus. Le mode Developer Spotify officiel et son exigence
Premium ne démontrent pas la cause des refus d'endpoints Web internes. Pas de
validation de connexion Spotify réelle ni d'identité.

La suite locale complète sur le code instrumenté a 1300 réussites, 3 échecs et
5 skips. Les trois échecs sont des comparaisons historiques à l'octet qui
interdisent précisément les ajouts diagnostiques aux fonctions de requête et
au store de jeton ; les anciens tests et fixtures n'ont pas été modifiés. Ne
pas présenter cette suite comme verte. Le job UI distinct exige toujours le
secret de signature de test manquant ; aucun secret ne doit être envoyé.

## Une action ultérieure sur téléphone

Avec un APK **débogable** de cette révision, sur l'écran de session ouvrir
« Détails techniques » puis utiliser **« Copier le diagnostic »** et transmettre
le texte copié. Ne rien faire tant qu'un tel APK n'a pas été livré ; les champs
du journal apparaissent sous « Diagnostic debug (données expurgées) ».

## Actualisation des références

Les trois comparaisons historiques ont été mises à jour avec des blocs debug
épinglés et des tests anti-mutation, sans suppression ni skip. La suite complète
est maintenant verte : 1309 réussites, 0 échec, 0 ignoré. Les détails, limites
et lien de l'APK se trouvent dans `references-et-apk-debug.md`.
