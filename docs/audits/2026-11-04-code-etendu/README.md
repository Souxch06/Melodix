# Analyse du diagnostic étendu de la WebView

## Observation transmise par l'utilisateur

Capture du 14 novembre à 14:40 : la page Spotify reste noire, WebView visible 990 × 1711, progression 100 %, code `11011100001010000`. La capture ne permet pas d'identifier de manière certaine le fichier APK installé ; elle n'est pas publiée dans le dépôt. L'utilisateur confirme que le problème persiste. Les données personnelles, cookies et stockage ne sont pas demandés ni effacés pour cette analyse.

Les 17 indicateurs, dans l'ordre du code natif :

| Indicateur | Valeur | Lecture limitée |
|---|---:|---|
| origine | 1 | document courant détecté comme HTTPS open.spotify.com |
| document | 1 | body présent |
| contenu | 0 | aucun des sélecteurs de contenu testé dans le document principal |
| runtime, shell, pont | 1, 1, 1 | scripts Melodix injectés et initialisés, pas preuve que Spotify est initialisé |
| profil, lecteur, connexion | 0, 0, 0 | signaux UI de profil et lecteur non trouvés ; ce n'est pas une preuve de déconnexion |
| iframe | 0 | aucun iframe présent au moment de la mesure |
| enfants | 1 | body contient plus d'un enfant élément ; ces enfants peuvent notamment être injectés |
| scripts | 0 | aucun élément `script[src]` présent au moment de la mesure ; n'exclut ni scripts inline, ni scripts retirés, ni ressources précédemment chargées ou bloquées |
| natif prêt | 1 | notification de disponibilité du shell envoyée, y compris pour un simple état d'attente ; aucune preuve de lecteur fonctionnel |
| collection, login, root, bouton lecteur | 0, 0, 0, 0 | route collection et les sélecteurs limités de login, racine alternative et bouton non observés |

La progression 100 % et l'origine ne prouvent pas une réponse HTTP réussie. Ce code ne contient ni statut HTTP, ni erreur réseau, ni indication de réponse serveur. Dans `c91.onReceivedHttpError`, un code d'erreur HTTP du document principal est lu mais non stocké ni affiché ; aucun code ne peut être déduit de la capture. `shouldInterceptRequest` ne substitue pas le contenu de la page. Le mécanisme automatique de relance est empêché par le drapeau « natif prêt » dans une reproduction DOM synthétique antérieure ; des relances manuelles des mêmes destinations ayant déjà échoué, il ne serait pas rigoureux de présenter une relance automatique comme un correctif de cet écran.

## Reproductions locales

`reproduction.test.cjs` extrait et évalue l'expression de diagnostic exacte de `WebPageDiagnostic.smali`, et exécute les assets runtime, shell et pont réels :

```sh
p="$(cat /tmp/melodix-library-isolation-dir)/project"
NODE_PATH="$p/node_modules" node docs/audits/2026-11-04-code-etendu/reproduction.test.cjs "$p"
```

3/3 tests passent. Un document vide synthétique, un document avec message synthétique et un document contenant un script inline donnent le même code : le diagnostic est donc insuffisant pour départager ces situations. Ces documents ne sont pas des réponses réelles de Spotify et aucun statut HTTP n'a été simulé comme preuve. Un test statique vérifie que la sonde et le traitement d'erreur HTTP ne conservent pas l'information nécessaire. Aucun test sur Android ou Spotify réel n'est possible dans l'environnement actuel.

## Conclusion

La nouvelle capture exclut la présence d'une iframe au moment du diagnostic et confirme la disponibilité du shell natif, mais pas la cause de l'écran noir. Les corrections antérieures de collecte et de sélecteurs ne peuvent pas produire une bibliothèque si le lecteur ne fournit pas ses éléments DOM. Pas de nouveau correctif APK présenté comme résolu en l'absence d'une cause ou d'une validation pertinente.
