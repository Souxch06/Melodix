# Session : audit test120 → test121

## Conclusion et limites de preuve

**Un défaut client est reproduit et corrigé ; la cause complète sur le téléphone n'est pas encore établie.** La coquille pouvait demander une vérification avec un DOM `unknown`, mais le bridge la refusait tant que ce DOM n'était pas `connected`. Cela peut produire zéro requête token/library malgré un cookie présent. Le test exécute le vrai bridge dans une VM ; il ne simule pas une connexion Spotify réussie sur téléphone.

Après correction, `unknown` et `in_progress` permettent une **vérification serveur**, pas la livraison de données privées. `required` bloque toujours. Une réponse `libraryV3` valide reste nécessaire à la preuve privée du bridge. Le drapeau natif historique `AppSingleton.B` est distinct : son écrivain `AndBridge.loginDetected()` reste appelé par la sonde CTA + widget. Cette sonde, inchangée, ne doit pas être confondue avec la preuve serveur.

**Aucun refus Spotify réel n'est établi.** Les HTTP 403 token / 401 bibliothèque des tests sont des fixtures, pas des observations du compte. Il n'y a donc ni requête réelle refusée, ni horodatage téléphone à présenter à ce stade. Si la prochaine copie en établit un, arrêter les modifications de connexion et consigner endpoint/code/horodatage, sans tentative de contournement.

## 1. Tableau de provenance et limites du bisect

Méthodes : **A** = lecture du manifeste binaire/certificat des APK de `releases/` avec Androguard 4.1.4 ; **S** = lecture des sources du tag et comparaison octet par octet de `assets/spotify_bridge.js` avec l'APK ; **H** = résultat historique du registre des bugs, pas un nouvel essai ; **U** = rapport utilisateur ; **CI** = exécution sans compte.

| Build | Source / vC | Playlists authentifiées | Méthode / fait vérifié |
|---|---|---|---|
| test55 | `7fdca988` / 1055 | Inconnu | A+S : package normal, bridge identique au tag, garde `connected` déjà présente |
| test63 | `1f6d7f62` / 1063 | Inconnu | A+S : même garde ; autre certificat que test55 |
| test85 | `d818f53e` / 1085 | Inconnu | A+S : même garde ; autre certificat |
| test96 | `db909e91` / 1086 | Inconnu | A+S : même garde ; même certificat que test85 |
| test100 / 101 | vC1090 / 1091 | Non exploitable pour un bisect session | A+H : VerifyError historiques ; pas une mesure de bibliothèque |
| test102 | vC1092 | Inconnu | A+H : correctif inline du crash, pas de preuve de playlists authentifiées |
| test109 | vC1099 | Inconnu | A+H : build/UI, sans preuve de compte |
| test110 | `df341a84` / 1100 | Inconnu, **pas « bonne »** | A+S+H : CTA public seul appelle `loginDetected`, CI UI verte ; possible fausse preuve native |
| test111 | `c7bf50bb` / 1101 | Inconnu | A+S+H : CTA **et** widget requis ; certificat différent de 110 ; CI UI verte |
| test112 | `5e9a824d` / 1102 | Inconnu | A+S+H : sens des verrous corrigé ; CI UI, pas de compte |
| test113 | `107cdf60` / 1103 | Inconnu | A+S+H : garde écran/build-id ; CI UI, pas de compte |
| test118 | `242705f1` / 1108 | Inconnu | A+S+H : bridge identique au tag ; coquille CI ≠ bibliothèque privée |
| 1.3.0-glass | `bc35d5e5` / 1110 | Inconnu | A : package normal ; même certificat que 118 ; pas de test authentifié |
| 1.3.1-glass | `990f11a6` / 1110 | Inconnu | A+S : package normal ; garde `connected` et sonde CTA+widget toujours présentes ; pas de test authentifié |
| test120 preview | `593af9e6` / 1021449 | **Échec rapporté** | U : auth=false, cookie présent, 6 page-loaded/32s, zéro token/library/images/payload ; CI séparée sans compte, pas une reproduction authentifiée |
| test121 preview | `91c74d48` / 1021450 | **À tester sur compte** | Build/signature/assets CI réussis ; tests locaux de garde/retry/statut ; aucune connexion utilisateur revendiquée |

**Bisect authentifié non borné** : aucune ligne ne fournit une dernière build aux playlists authentifiées confirmées. Choisir 110 comme borne « bonne » parce que l'UI ou `authT` semblait fonctionner serait invalide : le CTA public pouvait lui-même produire ce marqueur. Les changements 110→111 (sonde et certificat) sont établis, leur causalité sur ce compte ne l'est pas. Ne pas installer en boucle les anciens APK avec certificats incompatibles : cela imposerait une suppression de données interdite ici.

### Comparaison injection / masquage login

Lecture des `c91.onPageFinished` des tags 55, 110, 111, 112, 113, 118, glass1.3.1 et de test120 : les noms d’assets et l’ordre de planification principal sont conservés. Le chemin assemble d’abord `runtime_state.js` puis `desktop_spoof.js` (l’ordre de lecture disque n’est pas l’ordre d’exécution), évalue le shell séparément, puis appelle son loader du bridge ; charger l’asset bridge n’est pas encore l’exécuter. Les traces `asset-loaded`, `injection-queued` et JS-ready distinguent ces étapes. Aucun changement de cet ordre dans test121 ; seul le retry nouveau réinstalle runtime→shell→loader sans réinjecter le spoof.

Le masquage natif dépend de `nativeLoginWebRequested`, de `AppSingleton.B`, de l’écran courant et des gardes du payload, pas du seul cookie. Le registre documente les changements de verrous en 112 et de garde écran en 113 ; cela n’en fait pas des validations de session. Une anomalie statique demeure dans le chemin initial `apply_home_initial_route` : le code saute vers drop si `isLoginWebRoute()==false` **ou** `B==true`, alors que son commentaire décrit le blocage login actif + session non prouvée. Ce chemin est distinct de l’accueil déjà sélectionné ; il n’a pas été démontré actif dans le rapport test120 et n’a pas été modifié silencieusement. À corréler avec les nouvelles traces `proof-native` et l’écran courant avant toute correction supplémentaire.

Données publiques complètes (hashes APK, certificats, packages, schemes, authorities) : `session-apk-identities.json`. Reproduction indépendante, sans compte :

```sh
python3 -m pip install --target /tmp/melodix-audit-libs androguard==4.1.4
PYTHONPATH=/tmp/melodix-audit-libs python3 scripts/audit_session_apks.py releases/*.apk
# Comparaison des assets à un tag : extraire assets/spotify_bridge.js de l'APK,
# puis comparer avec git show TAG:assets/spotify_bridge.js.
```

Ce script extrait les certificats ; il ne remplace pas la vérification cryptographique `apksigner verify` du workflow.

## 2. Audit spécifique du paquet `.preview`

- Les APK historiques audités ci-dessus sont `com.melodix.music`, **pas** `.preview`. Test120/121 sont `com.melodix.music.preview`. Android isole leurs données/WebView : le cookie de l'app normale n'est pas celui du paquet preview. Le navigateur Chrome n'est pas non plus le magasin CookieManager de ce WebView.
- Le workflow `preview-apk.yml` réécrit package, permission de receiver, authorities de providers et label dans une copie temporaire ; les noms de classes restent `com.melodix.music.*`. `MainActivity` reste exportée, `singleInstance`. Les intent-filters Spotify, HTTP et HTTPS sont conservés. Le paquet normal et la preview peuvent donc être candidats aux mêmes liens : le choix Android doit être observé, pas supposé.
- Signature : clé persistante des secrets preview ; empreinte exportée dans le build temporaire, contrôle de la ressource compilée et `apksigner verify --min-sdk-version 24`. Test121 est passé par ce workflow. Le téléchargement Azure des artifacts est bloqué depuis le sandbox : **pas de comparaison locale des certificats test120/121**. L'installation comme mise à jour par Android est le contrôle final ; en cas d'incompatibilité, arrêter, sans désinstaller ni effacer les données.
- Dans les anciens APK normaux, les certificats changent plusieurs fois : test110 `10c28302…`, test111 `812a0cde…`, test118/glass `4c79d7aa…`. Ce fait est extrait des binaires, non déduit des noms. L'ancienne recommandation historique de désinstaller n'est **pas** la procédure présente.
- Cookies : `m9.smali` active CookieManager et les cookies tiers sur le WebView ; pas de partage automatique avec l'app normale ou un navigateur externe. `sp_dc` lu côté natif est un indice ; `document.cookie` peut ne pas le voir (HttpOnly). Aucun cookie n'est exporté.
- Connexion : URL `accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1`. `shouldOverrideUrlLoading` laisse les routes web login/signin continuer ; `SpotifyNavigationPolicy` traite les handoffs Spotify/intent vers le lecteur web. La preview ne déclare pas un nouveau schéma OAuth Google propre à son package.
- Google/SSO : flux web et injections `google_spoof.js` préexistantes. Aucun nouveau client OAuth natif, enregistrement package/certificat Google ou partage AccountManager n'a été ajouté. L'existence du flux ne prouve pas son acceptation par Google dans ce paquet : **aller-retour SSO réel non testé**, retour vers le bon paquet à confirmer. Aucun changement de spoof/UA/version/en-têtes/pubs dans ces corrections.
- `clear-oncreate`, `clear-resume`, `clear-resume-2`, `clear-accounts`, `clear-left-player` : traces de mises à zéro de preuve native/`LoggedIn`, **pas** purges CookieManager. Elles sont conditionnelles, pas exécutées systématiquement à chaque callback. Le journal permettra de les compter. `clear-accounts` lit maintenant la valeur après l'écriture false ; le suffixe diagnostic T/F était lui-même inversé et a été corrigé.
- **App normale vC1110** : elle contient le même verrou bridge `connected` et la sonde CTA+widget, donc partage le défaut client potentiel ; elle n'a pas l'isolation `.preview`. Un symptôme identique peut ainsi avoir une autre cause. Aucune mesure de son compte ne permet de trancher.

## 3. Bouton : chemin exact, non destructif

Références au source `91c74d48` :

- `MainActivity.smali:11259` `openNativeRow` distribue les actions ; `:11469` `openSpotifyLogin` consulte maintenant `NativeSessionRecovery.hasCookie()`.
- Cookie présent → `NativeSessionRecovery.verify()` (`NativeSessionRecovery.smali:32`), vérification/reprise runtime→shell→loader, pas de navigation accounts ni de purge. Si l'on n'est pas sur le lecteur, navigation vers `open.spotify.com`.
- Cookie absent → ancien parcours accounts. Le bouton Réessayer utilise aussi `verify()`.
- Ancien parcours : arrivée accounts → `c91.smali:708` écrit `AppSingleton.B=false`, trace `:709`, puis préférence `LoggedIn=false`. C'est une perte de **preuve native**, pas l'effacement du cookie.
- La purge réelle est ailleurs : `MainActivity.A()` (`:243`), `removeSessionCookies`, **`removeAllCookies` à `:295`**, `WebStorage.deleteAllData`. Le bouton login/retry corrigé ne l'appelle pas. Aucune purge n'a été ajoutée.

`tests/session_recovery.test.js` vérifie le routage et l'absence de purge ; la VM exécute la garde réelle avec un résultat 401 et vérifie qu'aucune donnée/preuve privée n'est livrée. Le cookie n'est jamais promu en preuve.

## 4. Six page-loaded / 32 secondes

L'ancien compteur est un nombre d'appels `c91.onPageFinished`, **pas** six reloads prouvés, ni six vérifications prouvées. Sans catégories de navigation ni chronologie des écritures B, l'origine n'est pas reconstructible à partir de ce seul rapport.

La test121 ajoute, dans la même copie MDXPERF :

- `navigation source=start|finish` : callbacks WebView ; route `accounts|player|login|local|other` uniquement ;
- `source=factory|ensure|button|recovery|bridge` : demandes `loadUrl` des sites instrumentés ;
- `source=request|redirect` : requête main-frame et bit Android `isRedirect` ;
- `source=history-reload|history-change` : notification historique et bit `isReload` ;
- `proof clear-…=F` / `set-bridge-login=T`, `proof-guard …`, `token-http …`, `session-verify …` : comparer leur nombre et leur timestamp à chaque callback.

Un reload sans demande native proche suggère une origine page/utilisateur, **ne distingue pas à lui seul JS du site, action utilisateur et restauration WebView**. Les navigations SPA ne sont pas des `onPageFinished` systématiques. Ne pas attribuer arbitrairement les six callbacks à Spotify ou à Melodix. Les catégories volontairement sans URL ne reconstituent pas une chaîne OAuth complète.

Le journal n'est plus remis à zéro lors d'un resume (notamment retour SSO) ; il reste borné à 64 Kio. `dropped>0` invalide la capture pour une analyse complète : refaire un scénario plus court.

## 5. Une copie MDXPERF et statut UX

- Jeton : début/fin/erreur par endpoint `api` (`/api/token`), `fallback` (`/get_access_token`) ou cache ; HTTP et durée ; résultat enum sans valeur de jeton. HTTP 0 signifie absence de réponse HTTP/cache, pas un code serveur.
- Bibliothèque : traces existantes requête/réponse/parse/transform/settle, HTTP/durée ; aucune playlist ni URL privée copiée.
- Garde : raisons lisibles `auth-required`, `dom-unknown`, `dom-in-progress`, `in-flight` ; blocages natifs par site.
- Images : callbacks Picasso loaded/failed, maximum 32 par période de reprise, puis marqueur limit. Callback ≠ pixels affichés ni garantie que c'est une image Home.
- Injection : étapes runtime/shell/bridge et ready. Une étape absente reste « non mesurée », pas zéro milliseconde.
- Statut non prouvé : attente bornée à 15 secondes, sans invitation login simultanée ; expiration → erreur claire + Réessayer. « Se connecter » seulement sans cookie. Détails techniques restent repliés. WeakReference + génération empêchent une ancienne échéance d'écraser une tentative récente ou des cartes réussies.

Lecture du scénario avec retour SSO (par défaut, l'outil conserve l'ancre dernier resume pour les mesures warm historiques) :

```sh
python3 scripts/startup_timing_journal.py diagnostic.txt --from-launch --json /tmp/session.json
```

La copie a une grammaire fermée native/bridge, testée avec valeurs autorisées et rejets de secrets/URL. Ce mécanisme porte sur MDXPERF, **pas une garantie rétroactive sur tous les champs de l'ancien diagnostic** : relire la copie avant de la partager.

## 6. Livraison, tests, risques et reprise

Commits séparés :

1. `876e786d` : autoriser la vérification serveur pour DOM inconnu ;
2. `fcf952f5` : vérifier avant login si cookie présent, retry non destructif ;
3. `bc58e64e` : borne 15 s et actions cohérentes ;
4. `91c74d48` : journal token/garde/navigation/preuve/images et corrections de fidélité des traces.
5. `6487b506` : fractionner les annotations GitHub trop longues (outil hors APK), tester l’ancre lancement/SSO.

Fichiers principaux : `scripts/spotify_bridge.source.js` + asset régénéré ; `MainActivity`, `NativeSessionRecovery`, `NativeSessionStatus`, `NativeSessionTimeout`, `NativeHomeShelfRenderer` ; instrumentation `c91`, `m9`, `AndBridge`, `AppSingleton`, `NativeCrashGuard`, `NativeStartupTiming`, `NativeSessionTrace`, `NativeWebPlayerNavigationRunnable`, `NativeImageLoader$FirstImageMark` ; parseur et tests dédiés. La coquille JS, ses plafonds, le spoof, les en-têtes auth et les pubs n'ont pas été modifiés.

Validation avant build : **989 tests : 985 réussis, 4 ignorés**. Suite complète après ajout du test `--from-launch` : **990 tests, 986 réussis, 4 ignorés**. Suite finale avec correctif des annotations GitHub tronquées : **991 tests, 987 réussis, 4 ignorés, aucun échec** (14/14 ciblés parseur/instrumentation), aucun changement APK. Vérificateur de signatures Android : 0 problème sur 70 classes applicatives. Les nouveaux helpers passent le vérificateur registres. Son analyse globale ancienne n'est **pas verte** : 93 avertissements sur les 68 fichiers comparables, diagnostics strictement identiques à `8fbc57da` ; c'est une analyse linéaire limitée, pas une validation ART. Ne pas les masquer ni présenter l'assemblage APK comme une validation authentifiée.

Preview signée : **Melodix-Preview-v1.3.2-test121.apk**, source `91c74d4855ee56e03225118e930e919308093796`, package `com.melodix.music.preview`, **vC1021450** (supérieur à test120), versionName `1.2.2-91c74d4`.

- Build réussi : https://github.com/Souxch06/Melodix/actions/runs/42584610800
- Artifact : https://github.com/Souxch06/Melodix/actions/runs/42584610800/artifacts/13658875876
- SHA256 APK annoncé par le contrôle CI du binaire signé : `73ffd4ec0b175d5ed437eafccc8bef3b80548bcf374730c90aefac6baa184557` (distinct du digest ZIP de l'artifact).
- Pas de tag/release créé. Recompiler exactement : `gh workflow run preview-apk.yml --ref arena/6b935c3e-melodix -f release_tag=v1.3.2-test.121-preview -f source_ref=91c74d4855ee56e03225118e930e919308093796`.

### Mesure CI test121, sans compte : portée limitée

Run https://github.com/Souxch06/Melodix/actions/runs/42584612119 réussi, même source `91c74d48`, **binaire instrumentation distinct**, à ne pas installer à la place de la preview signée ci-dessus. Android émulé sans compte :

- Cold : vues 104 ms, WebView 2455 ms, premier pageFinished 8185 ms (4 callbacks), premier début de rendu 8190 ms (2 rendus), **0 payload Home / 0 requête bibliothèque** ; shell/jeton/images non mesurés.
- Le début de la trace établit ici `factory accounts` 2179 ms, `start accounts` 4111 ms, `finish accounts` 8119 ms et `clear-accounts=F` 8267 ms ; autre finish 8452 ms puis clear 8476 ms. **Sur cet émulateur seulement**, deux callbacks accounts répètent donc l’écriture false. Cela ne prouve ni le parcours du téléphone ni six reloads.
- Warm/background : PID2093 conservé, seulement un marqueur resume ; `observed_until_ms=0` = absence d’événement après l’ancre, pas reprise instantanée mesurée.
- Artifact mesures : https://github.com/Souxch06/Melodix/actions/runs/42584612119/artifacts/13658970823 . La longue annotation cold a été tronquée par GitHub à 4066 caractères ; ne pas la parser comme JSON complet ni extrapoler sa fin. Le fichier JSON dans l’artifact est la référence complète. Le correctif de fractionnement ci-dessus concerne les prochaines exécutions, pas rétroactivement ce run.

Risques restant à observer : classificateur DOM fragile, parcours SSO et sélection du paquet par Android, garde native/login initiale, cookie expiré qui reste présent (Réessayer ne le détruit pas et ne prouve rien), coût du journal, vérification ART réelle et navigation pendant une tentative. `AndBridge.authUiSignal` conserve par ailleurs un aiguillage historique inversé des mots du diagnostic : ne pas en tirer seul une conclusion d'authentification ; les nouveaux événements de décision bridge sont indépendants. Aucun changement opportuniste ajouté à ces autres chemins.

### Protocole compte : trois scénarios courts, sans effacement

Installer test121 **par-dessus la preview existante**, jamais par-dessus le paquet normal. Si Android refuse signature/version, arrêter et relever l'erreur ; ne pas désinstaller/clear-data.

1. **Cookie existant** : ouvrir preview, attendre ≤15 s. En cas d'erreur, Réessayer une seule fois ; attendre ≤15 s, copier le diagnostic. Vérifier token/library présents ou raison de garde ; aucune page accounts ni purge attendue au simple retry.
2. **Sans session** (uniquement si déjà dans cet état, ne pas effacer pour y arriver) : Se connecter, connexion/SSO normal, retour dans **la preview**, attendre ≤15 s puis une copie. Comparer navigation accounts→player, écritures de preuve et requêtes.
3. **Reprise** : retour Home 5 s puis réouverture preview ; attendre ≤15 s et copier. Vérifier que les preuves avant retour SSO restent présentes et qu'aucune ancienne échéance n'écrase des cartes.

Si aucun scénario sans session n'est naturellement disponible, le marquer non testé. Ne pas demander de jeton/cookie, identifiants ou diagnostic supplémentaire long. La prochaine décision doit partir de cette copie réelle, non des fixtures ni du CI sans compte.
