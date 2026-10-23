# Melodix — brief agent (ne pas reconstruire de zéro)

> **Protocole CI et synchronisation automatique à jour** : voir prioritairement [`AGENTS.md`](../AGENTS.md) à la racine du dépôt ainsi que `./scripts/verify-and-sync.sh`.
>
> - Branche de travail courante : branche active de la session (actuellement `arena/7142700d-melodix`, PR ouverte : [#7](https://github.com/Souxch06/Melodix/pull/7) ; PR historique [#6](https://github.com/Souxch06/Melodix/pull/6) non fusionnée). Ne jamais modifier `main`, ne pas merger sans demande explicite, jamais de force-push.
> - **Séparation stricte Dev / Releases** : chaque `push` compile et teste automatiquement l'APK Preview (`Melodix-Preview-<SHA40>`) et l'émulateur Android 15 (`Melodix-Emulator-Verification-<SHA40>`) **uniquement dans les artefacts GitHub Actions**, **sans modifier ni publier aucune GitHub Release**.
> - Indiquer toujours le SHA complet à 40 caractères (`source_ref`), le libellé `Melodix Preview <sha7>` et les liens GitHub vérifiés. Image `docs/previews/melodix-phone-ui-concept.png` **non suivie — ne pas y toucher** (ne jamais lancer `git add -A`).

## Ce que c’est

APK Spotify WebView (Smali/XML, pas de bascule de stack). Shell **natif Android** (Home / Recherche / Bibliothèque / détail / Mini+Full player / paramètres Spotify) **par-dessus** la WebView, qui reste le moteur session / auth / lecture.

Inspiré de `Souxch06/Melodix-version1` + app mobile Spotify. Toutes les pages, pas seulement Home.

## Contraintes utilisateur (ne pas ré-interpréter)

- WebView, lecteur, auth, UA : ne pas casser sans preuve.
- Signature **active même en preview** (empreinte SHA-256 = certificat signataire, déjà vérifié / exonéré).
- Pas de secrets, cookies, tokens, Base64.
- Diagnostic **sans adb/logcat** côté téléphone.
- Ne pas affirmer une cause sans preuve ; ne pas dire « crash résolu » sans trace émulateur.
- Playlist ouvrable même sans bridge de lecture (`__sfOpenCollection`).
- Paramètres = Spotify, pas Spotiduck.

## Architecture utile

| Pièce | Rôle |
|---|---|
| `MainActivity.smali` | UI native, `showNativeUi`, `setNativeScreen`, `renderNativeRows`, clics |
| `AndBridge.smali` | JS interface (`onNativeUiReady/Route/Data`, `onNativeDiag`) |
| `assets/native_ui_shell.js` | Collecte DOM Spotify → lignes natives. **Pas** dans le hotfix remote |
| `smali/c91.smali` | `onPageFinished` injecte `native_ui_shell.js` puis `maybeRevealNativeUi` |
| `NativeHomeShelfRenderer` | Accueil = étagères horizontales |
| `NativeHomeCache` | `SharedPreferences` `melodix_native` / `home_feed` + seed Titres likés |
| `NativeCrashGuard` | toasts/jalons `last_stage`, `showLaunchMarker` |
| `.github/workflows/preview-apk.yml` | build preview |

IDs : `nativeRoot` `0x7f09022f`, titre `0230`, back `0231`, search `0233`, chips `0234`, content `0235`, rows scroll `0239`, player `023a`, mini `0243`, tabs `0246–0248`, avatar `0249`.

Package preview : `com.melodix.music.preview`.

## Smali — pièges déjà payés cash

`if-eqz` = sauter si **0 / null**. `if-nez` = sauter si **non nul**.  
**Or** : `if-nez conteneur, :done` ignore tout le rendu dès que la vue existe.

- **Ne jamais** inliner de l’UI dans `onCreate` (VerifyError registres, `v2`/`v3`).
- Helpers statiques à `.locals` propres.
- `invoke-virtual` registres v0–v15 ; `move-exception` en tête de catch ; pas de `;` après primitif.
- `grep -q` sous `pipefail` = faux négatif CI.
- Ne pas réintroduire `MainActivity.onBackPressed` (LinkageError : méthode `final` de `androidx.activity.a`). Callback `Lr70` aussi `final`.
- Ne pas toucher `openNativeRow` / `onNativeLibraryCategoryClick` / `updateNativePlayer` sans besoin.
- `git add -A docs` stage l’image interdite.

Gold standard null-check : `AndBridge` / `showNativeUi` → `if-eqz v, :skip`.

## Crash lancement (diag) — historique

1. **diag-6** `LinkageError` `onBackPressed` overrides `final` — avant `Application.onCreate`. Fix : supprimer l’override (`31dcf28`).
2. **diag-7** `VerifyError` marqueur inliné dans `onCreate` (`v2` = `SDK_INT`). Fix : `NativeCrashGuard.showLaunchMarker`.
3. Preload `onCreate` → encore VerifyError (`v3` String). **Ne plus rien ajouter dans `onCreate`.**
4. Trace OK type : `GrantPermissionsActivity`, **aucune** `FATAL EXCEPTION` Melodix. SIGABRT `droid.bluetooth` = émulateur, ignorer.
5. Historique émulateur : `GrantPermissionsActivity` au premier plan n’est pas un crash Melodix. SIGABRT `droid.bluetooth` = hôte émulateur.

Porte signature **exonérée** (empreinte = certificat, présente dans `resources.arsc`).

## UI — état et bugs déjà vus

- Shell doit **couvrir** la WebView (`nativeRoot` visible, elevation 15, splash 20). Sinon = « ancien affichage Spotify ».
- Affichage forcé : XML `visible` + `postNativeUiReady` après `content-view` + `maybeRevealNativeUi` (sauf `/login`, `/signup`, `accounts.spotify`).
- Accueil vide « Loading your music… » : placeholder XML **retiré** (il bloquait le cache, `childCount>0`).
- Accueil **toujours noir** malgré seed : `NativeHomeShelfRenderer` `if-nez v13, :shelf_done` sautait si le conteneur existait. Corrigé `if-eqz` (+ JSON `v5`, étagère `v3`, quick-grid `v4`) dans `ef1666b`.
- Onglet Accueil ne doit **pas** `renderNativeRows(..., "[]")` (ça efface). → `NativeHomeCache.restore` + `__sfNativeRequestHome`.
- Paramètres : NPE `setNativeScreen` `null.equals` si clic avant écran courant. `if-eqz` avant `equals` + try/catch `openNativeSettings`.
- Icône paramètres = `ImageView` 40 dp `centerInside`, pas `drawableTop`.
- Collecte JS : types `collection|mix|radio|station|genre|user` ; ne **pas** envoyer un home `[]` qui écrase un feed déjà peint ; retry 160 ms ; `document.body` pas seulement `#main-view`.
- Retour système : dispatcher androidx obfusqué + callback `final` → pas réimplémenté. Bouton UI `onNativeBackClick` OK.

Tests auto : `tests/app_audit.test.js` + `smali_sanity` + `native_ui`. Attendu ~97 pass / **16 fail préexistants** `runtime_state` (ne pas « corriger » en cassant l’auth).

## Priorité si l’utilisateur se plaint encore

1. Accueil vide → `NativeHomeShelfRenderer` / cache / JS `sendNativeUiData('home')`, pas un nouveau crash gate.
2. Lecteur web plein écran → `nativeRoot` gone ou `showNativeUi` pas appelé.
3. Crash lancement → traces logcat / annotations CI, **pas** une hypothèse.
4. Pas de nouvelles features tant qu’un écran métier (accueil) est vide.

CI locale : pas de apktool. Preuve = GitHub Actions. Outils `/tmp` non persistants.

## Phrase de livraison type

```
release_tag = v1.2.2-test.1-preview
source_ref  = <40 hex>
libellé     = Melodix Preview <7 hex>
```
