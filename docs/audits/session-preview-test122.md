# Test122 — message de refus et reconnexion explicite

## Décision utilisateur et preuve disponible

L'utilisateur a confirmé que les playlists **ne s'affichent pas non plus dans l'ancienne app verte sur le même téléphone**. La branche de travail retenue est donc le cas 2 : présentation et actions de récupération uniquement. Aucun essai de contournement, de nouveau paramètre, de nouvelle identité client ou de changement d'en-tête/version Spotify.

Rapport réel utilisateur sur test121, distinct des fixtures CI :

| Étape | Résultat rapporté |
|---|---|
| Garde | allowed, dom-unknown |
| Jeton `/api/token` | HTTP400, 248 ms |
| Jeton fallback `/get_access_token` | HTTP403, 60 ms |
| Résultat jeton | ko-http403 |
| Bibliothèque | HTTP401 |

Cela établit des réponses serveur négatives sur cette tentative. Cela ne prouve pas la raison du 400/403, ni l'expiration du cookie. Aucun horodatage absolu n'est fourni dans cet extrait ; les durées ne sont pas des dates de requête. La version exacte de l'ancienne app n'a pas été communiquée : aucune borne de bisect authentifiée n'en est déduite.

## Changements

### `9e9ae4c7` — présentation du refus

- Deux codes HTTP numériques de la même tentative sont transmis du bridge au payload Home. Métadonnées de présentation uniquement : ni cookie, ni jeton, ni corps de réponse.
- Le message **« Spotify refuse la demande d’accès (400/403) »** n'est affiché que pour un état erreur avec API400 et fallback403 constatés. Un seul `ko-http403` ne suffit pas à inventer le premier 400.
- Actions : **Réessayer**, non destructif ; **Se reconnecter**, explicitement destructif pour la session de cette application.
- Les détails techniques utilisent le suffixe existant ` [auth=…]`, donc restent dans **Détails techniques**, replié par défaut.
- Le délai de chargement précédent est invalidé pour ne pas remplacer le refus reçu par un générique timeout15s.

Fichiers : `scripts/spotify_bridge.source.js`, `scripts/native_ui_shell.source.js` et leurs assets générés ; `NativeAccessRefusal.smali`, `NativeSessionStatus.smali`, tests associés.

### `ab0c265c` — action explicite de reconnexion

- La seule nouvelle URI `melodix:action:reconnect` déclenche l'effacement. Les parcours existants `retry-library` et `open-login` ne sont pas transformés en purges.
- L'action arrête le chargement, demande `about:blank` pour quitter la page précédente, puis appelle `CookieManager.removeAllCookies` **avec callback**. Pas de temporisation arbitraire supposant la suppression terminée.
- Dans le callback : flush, vérification de l'absence de `sp_dc` ; si elle n'est pas confirmée, ne pas ouvrir le login. Sinon, demande de suppression WebStorage, remise à zéro de la preuve native et de `LoggedIn`, puis appel du **login existant inchangé**.
- La purge porte sur le magasin cookies/WebStorage de cette application, y compris d'éventuelles sessions web SSO qui y résident ; ni l'app normale depuis la preview, ni Chrome, ni les données applicatives Android complètes ne sont effacés. Le texte de la carte prévient avant le tap.
- Garde double tap et WeakReference : pas de deuxième suppression concurrente, pas d'ouverture du login pour une Activity détruite/terminée. Une erreur de suppression affiche un statut clair, sans prétendre que la session est effacée.

Fichiers : `MainActivity.smali`, `NativeHomeShelfRenderer.smali`, `NativeSessionReconnect.smali`, tests de dispatch et du callback.

Il s'agit de l'action de suppression explicitement demandée, pas d'une nouvelle logique de négociation/authentification avec Spotify. Aucun effacement automatique au chargement ou au simple refus.

## Cookie actuel : ce que l'on peut réellement affirmer

Les deux fetch conservent **`credentials: 'include'`**. Le navigateur/WebView choisit les cookies applicables de son magasin courant selon domaine, chemin et règles de cookies ; le code n'injecte pas un ancien cookie dans un en-tête `Cookie`.

Cependant :

1. Le champ natif `cookie_sp_dc=true`, lorsqu'il est présent dans une capture, prouve seulement la **présence** dans CookieManager au moment de cette capture. L'extrait HTTP ci-dessus ne contient pas cette mesure.
2. Il ne prouve pas que ce cookie a effectivement été attaché aux requêtes, qu'il est encore accepté, ni qu'il correspond à la dernière connexion attendue. Ni le 400 ni le 403 n'apportent cette preuve.
3. Le booléen JS `cookieSession` est basé sur `document.cookie`, qui ne voit pas un cookie HttpOnly. `false` ne suffit donc pas à conclure à une absence.
4. L'app normale et `.preview` ont des magasins distincts. Une connexion dans l'une n'actualise pas le cookie de l'autre.

**Conclusion : l'envoi du cookie de la session attendue n'est pas confirmé par ces seules traces.** Aucune valeur de cookie ni de jeton n'a été demandée, copiée ou journalisée. La reconnexion explicite élimine les cookies de ce paquet avant son nouveau login, sans prouver d'avance l'acceptation de cette nouvelle session.

## Pourquoi `/api/token` répond-il 400 ?

**Motif précis non établi.** Le code et le diagnostic enregistrent le statut, pas le motif applicatif du corps de cette réponse d'erreur. HTTP400 signifie que le serveur juge la requête non acceptable ; cela ne permet pas de choisir entre contexte/paramètres attendus, état de session ou autre validation serveur. Attribuer ici une cause à un cookie, une version ou un en-tête serait une supposition.

Aucun corps d'erreur brut ni en-tête sensible n'a été ajouté au diagnostic pour tenter d'y répondre. Le refus est rendu visible, puis le travail se limite aux actions UI demandées.

## Vérification du périmètre et tests

- Comparaison avec source test121 `91c74d48` : les deux blocs `oriFetch` jeton (URL, méthode, paramètres, options, en-têtes et credentials) sont **identiques octet par octet**. Aucun ordre de fallback, garde, politique de retry ou preuve privée changé.
- `desktop_spoof.js`, `google_spoof.js`, `runtime_state.js`, `BrowserProfile.smali`, `c91.smali` et `m9.smali` inchangés par rapport à test121. Pas de modification des pubs.
- Métadonnées uniquement ajoutées autour des réponses, puis au payload UI. Shell108822octets, sous le plafond108867 sans le relever.
- **997 tests : 993 réussis, 4 ignorés, aucun échec.** Vérificateurs registres et signatures Android : zéro problème sur les nouveaux helpers.
- Tests exécutent la garde et les requêtes du vrai bridge dans une VM, la normalisation du vrai payload shell et les instructions smali du statut/callback avec API Android simulées. Ils ne prouvent pas une reconnexion réelle sur compte ni la validation ART de toutes les branches.

## Protocole court

1. Installer la nouvelle preview par-dessus l'existante, sans désinstallation/clear-data. Un refus de signature doit interrompre l'installation.
2. Sur le refus400/403, vérifier le message et les détails fermés. **Réessayer** : nouvelle tentative, sans purge ni login automatique.
3. Seulement si souhaité, **Se reconnecter** : les cookies et données web de ce paquet sont supprimés, puis le login s'ouvre. Cela peut nécessiter de ressaisir la connexion SSO. Ne pas promettre que Spotify acceptera ensuite le jeton.

Une erreur réseau, un 403 seul, ou l'absence des codes numériques ne doivent pas être présentés comme la paire400/403. En cas de nouveau refus Spotify, conserver les codes/durées de la copie diagnostic et ne pas changer l'imitation du client ou ses en-têtes.


## Preview signée livrée

- **Melodix-Preview-v1.3.2-test122.apk**, package `com.melodix.music.preview`, **vC1021451**, versionName `1.2.2-ab0c265`.
- Source APK : `ab0c265c6839ddaed7290ae5a18834f287087e19`.
- Build/signature/assets réussi : https://github.com/Souxch06/Melodix/actions/runs/42588433194
- Téléchargement : https://github.com/Souxch06/Melodix/actions/runs/42588433194/artifacts/13659623652
- SHA256 APK vérifié/annoncé par CI : `0cf61fca0b868ea655a5cb78d32de459ef79adeb0eee05be15e805bb2d6da79f`.
- Pas de tag/release créé, pas de session authentifiée revendiquée depuis CI.

Relancer exactement ce build :

```sh
gh workflow run preview-apk.yml --ref arena/6b935c3e-melodix \
  -f release_tag=v1.3.2-test.122-preview \
  -f source_ref=ab0c265c6839ddaed7290ae5a18834f287087e19
```
