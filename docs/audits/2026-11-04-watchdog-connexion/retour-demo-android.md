# Retour de la démo test157 — diagnostic Android

## Périmètre et conclusion

L'APK expérimentale test157 (`377eb0aae8f2b824e3c6d68def15e7d80122dd2f`,
SHA-256 `00ce34bf864e0678d88906eab43b4f529398cc63624394edc4b80aefde880fec`)
a été rejouée **à l'identique**, sur un émulateur Android vierge hors ligne.
Le contrôle SHA-256 a réussi avant les rejeux ; aucun APK de l'application n'a
été reconstruit pour ce diagnostic.

La cause précise du message « real surface after demo exit not observed » dans
ce scénario est un **défaut du test**, pas une preuve que la surface manque.
L'expression Python `find_id(..., 'sessionTitle') or find_id(...,
'nativeSettingsButton')` traite un élément XML sans enfant comme faux.
Or le `TextView sessionTitle` observé par Android a zéro enfant, donc le `or`
jette ce résultat même s'il est présent. Si le bouton de réglages n'est pas
présent, le prédicat renvoie `None` et attend jusqu'à l'échec. Le test recherche
une vue **native Android**, pas `#sf-melodix-home` dans le DOM.

Le correctif teste explicitement `is not None` pour les deux mêmes identifiants.
Il n'accepte ni le texte de connexion seul ni un écran démo, ne change pas les
70 secondes, les 10 secondes stables, ni l'exigence de réglages réels. Un test
unitaire vérifie les deux éléments sans enfant et le rejet des vues absentes.

## Avant / après — résultats observés

- Avant : [run 43081971900](https://github.com/Souxch06/Melodix/actions/runs/43081971900),
  job 130736562468. Dès `host_ms=133985`, Android rapporte `sessionTitle`,
  `children=0`, `element_truth=false`, `demo_entry=true`, et
  `legacy_predicate_matches=false` ; l'ancien test échoue à la surface. Les
  mêmes constats restent présents dans les échantillons suivants.
- Après, sans sonde intrusive : [run 43083632247](https://github.com/Souxch06/Melodix/actions/runs/43083632247),
  job 130742282933. `sessionTitle` et l'entrée démo sont présents,
  `legacy_predicate_matches=false` mais `intended_predicate_matches=true` ;
  l'étape « real surface after demo exit; no content diagnostic for 10s » a
  réussi. Le test **complet reste rouge** à l'étape suivante : session visible,
  pas de session authentifiée et donc réglages réels inaccessibles.
- Après, avec instrumentation Android de lecture seule :
  [run 43086146525](https://github.com/Souxch06/Melodix/actions/runs/43086146525),
  job 130750946678. Le retour et les 10 secondes réussissent aussi ; le même
  blocage des réglages réels maintient l'échec global.

Les captures réelles avant sont dans
[artefact 13885801713](https://github.com/Souxch06/Melodix/actions/runs/43081971900/artifacts/13885801713)
(échec observé) ; celles après sont dans
[artefact 13886385355](https://github.com/Souxch06/Melodix/actions/runs/43083632247/artifacts/13886385355)
(dont `06-apres-sortie.png`) et celles avec sonde dans
[artefact 13887925569](https://github.com/Souxch06/Melodix/actions/runs/43086146525/artifacts/13887925569).
Ces fichiers sont générés sur l'émulateur, mais n'ont pas pu être téléchargés ou
visualisés depuis cet environnement ; les étapes annotées et artefacts ont été
vérifiés par l'API GitHub. Les annotations expurgées d'origine sont conservées
sous `preuves/test157-{avant,apres,webview}-annotations.json`.

## WebView, bridge et navigation

La sonde CI est une instrumentation Android temporaire signée par la même clé,
démarrée uniquement sur l'émulateur vierge. Elle lit `MainActivity.G`, son
progrès et des valeurs DOM bornées, sans lire ni écrire cookies, stockage,
identifiants ou jetons. Elle ne modifie pas les octets de test157. La sonde
influe sur le lancement et constitue donc un rejeu instrumenté distinct.

Extraits vérifiables du run 43086146525 :

```text
session-state from=verifying state=no-session reason=cookie-absent
navigation source=factory route=accounts
stage bridge-prepared-other
DOM progress=100 nativehost=accounts host=accounts ready=complete started=undefined bootstrap=undefined home=false interface=false
MARK before-exit
DOM activity=resumed
MARK after-exit
DOM progress=100 nativehost=accounts host=accounts ready=complete started=undefined bootstrap=undefined home=false interface=false
```

Avant le retour, les traces rapportent aussi `navigation source=start`,
`history-change`, `history-reload`, `finish`, tous classés `accounts`, et
`perf page-loaded`. Après le clic, l'activité reprend ; aucun nouvel événement
de navigation n'a été observé dans cette fenêtre. `bridge-asset-loaded` signifie
que l'asset a été lu, non qu'il a été exécuté. Le code
`NativeBridgeNavigation.prepare` détache volontairement `AndBridge` hors de
l'origine autorisée du lecteur ; sur la page de connexion, les marqueurs
`__sfMelodixBridgeStarted` et `__sfMelodixBridgeBootstrapReady` sont `undefined`,
`#sf-melodix-home` est absent, et l'interface JS `AndBridge` absente. Ce sont des
mesures sur **accounts**, pas un diagnostic de l'exécution du bridge sur une
page lecteur authentifiée. `progress=100`/`ready=complete` signifie fin de
chargement de ce document, pas que Spotify accepte une connexion.

Aucun événement `FATAL EXCEPTION` Android ni erreur JS de type capturé n'a été
observé dans les filtres logcat utilisés. L'absence d'événement n'exclut pas
une erreur non journalisée ou une classe hors filtre. Le refus de jeton sur le
téléphone reste non expliqué ; aucune conclusion de réparation Spotify.

## État de livraison

Test157 reste expérimentale, non validée ; aucun bundle validé, tag, release ou
merge. L'APK expérimentale déjà autorisée est dans
[artefact test157](https://github.com/Souxch06/Melodix/actions/runs/43074770471/artifacts/13880157777).
La suite locale complète sur le code final a passé 1214/1214 tests, sans skip.
La sonde a aussi passé la compilation Java isolée ; le rejeu Android ci-dessus
l’a exécutée. Le checkout partagé et son index sont restés inchangés.
