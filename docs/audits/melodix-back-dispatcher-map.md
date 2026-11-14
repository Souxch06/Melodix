# Cartographie du répartiteur de retour Android — MEL-BUG-002

Document établi **avant** modification, comme exigé par l'autorisation ciblée.
Fichier : `smali/androidx/activity/b.smali`, méthode `b()` (= `OnBackPressedDispatcher.onBackPressed()`).

## Chaîne complète de la touche Retour

```
touche BACK
  → fm.dispatchKeyEvent
      → zh1.c(decorView, event)        → 0 sur API ≥ 28
      → kn1.f(...) → eh0.b(event)      = superDispatchKeyEvent
        (ne repasse JAMAIS par Activity.onKeyDown / onKeyUp)
  → framework → Activity.onBackPressed()
  → androidx.activity.a.onBackPressed()   ← FINAL, non surchargeable
  → androidx/activity/b;->b()             ← patché par Melodix
```

**Mesure** (run `42002228908`, application démarrée, touche pressée) : le journal `MelBack` placé dans `MainActivity.onKeyDown` est **vide sur les deux profils**. `onKeyDown` n'est jamais atteint. Une interception à cet endroit est donc structurellement inopérante — elle a été retirée.

## Branches de `b()`

`.locals 4` — `v0..v3`, `p0 = v4`. `v1` porte le callback résolu et est utilisé par **toutes** les branches aval.

| # | Condition | Effet |
|---|---|---|
| 1 | parcours **à rebours** de `b` (`ArrayDeque`) | retient le dernier callback **activé** (`r70.a == true`) → `v1` |
| 2 | `v1 == null` → `:cond_5` | exécute le `Runnable` de repli `a.run()` (finit l'activité) |
| 3 | `packed-switch` sur `v1.d`, **cas 0** → `:pswitch_0` | chemin AndroidX standard : `z70.y(true)`, puis `z70.M()` si toujours activé, sinon rappel récursif `b()` |
| 4 | **défaut** (`d != 0`) — **patch Melodix** | voir ci-dessous |

### Branche par défaut, en détail

| Condition | Effet |
|---|---|
| `AppSingleton.B && WebService.r` **et** `((MainActivity) v1.e).G != null` | `evaluateJavascript(<JS lecteur>, al0(2, v1))` |
| WebView null (`:cond_4`) | `return-void` — touche avalée |
| sinon (`:cond_2`) | `v1.a()` directement |

**Le JavaScript injecté** ferme, dans l'ordre : `closeFullscreenPlayer` / `#sf-fs-player`, `body.sf-expanded` (bouton Minimize), `body.sf-show-nowplaying`, `body.sf-show-library`. Il renvoie `true` s'il a fermé quelque chose, `false` sinon.

**`al0.onReceiveValue`** (variante `a == 2`) : si le résultat n'est pas `"true"`, appelle `r70.a()`.

**`r70.a()`** — également patché : si `!WebService.r` → `Activity.finish()` ; sinon navigue dans l'historique de la WebView en comparant l'URL à `https://open.spotify.com/`.

## Pourquoi Retour ne faisait rien sur les Paramètres natifs

L'écran natif est une **surcouche** au-dessus de la WebView. Le JS ne trouve rien à fermer → `false` → `r70.a()` navigue dans l'historique WebView, **sans aucun effet visible sur la surcouche native**. Ni l'un ni l'autre ne connaît l'état `nativeCurrentScreen`.

## Correctif appliqué — additif, en tête de la branche par défaut

```
packed-switch p0, :pswitch_data_0
  ── garde MEL-BUG-002 ──
  p0 = v1.e
  si p0 n'est pas un MainActivity      → :mel_dispatcher_continue
  si MainActivity.handleNativeSystemBack() == false → :mel_dispatcher_continue
  sinon                                → return-void   (écran natif traité)
  :mel_dispatcher_continue
  ── code Melodix d'origine, inchangé ──
```

`handleNativeSystemBack()` (dans `MainActivity`, couche UI) renvoie `true` **uniquement** si `nativeBackButton` (`0x7f090231`) existe et `isShown()` — c'est-à-dire si le shell natif a lui-même décidé d'afficher une flèche de retour. Il réutilise alors `onNativeBackClick`, qui restaure route, titre et contenu.

**Registres** : seuls `p0` et `v0` sont utilisés, tous deux réaffectés immédiatement après par le code d'origine. `v1` est préservé. `.locals 4` inchangé.

## Préservation garantie et vérifiée par empreintes

| Élément protégé | Garantie |
|---|---|
| JS de fermeture du lecteur plein écran | **sha256 identique**, longueur 888 identique |
| `r70.a()` (historique WebView, `finish()`) | **sha256 identique** |
| `al0` (décision quand le JS ne ferme rien) | **sha256 identique** |
| Cas 0 AndroidX (`z70.y/M`, rappel récursif) | bloc inchangé, garde hors de ce cas |
| Bridge, MediaSession, commandes multimédias, lecture en arrière-plan | aucun fichier touché |

Les empreintes sont figées dans `tests/fixtures/back-dispatch-preserved.json` et vérifiées par `tests/back_dispatch.test.js`. **Toute modification de ces charges utiles fait échouer la suite.**

### Pourquoi le lecteur plein écran reste prioritaire quand il doit l'être

Le lecteur plein écran **web** est affiché dans la WebView, pendant que le shell natif est sur Accueil/Bibliothèque/Recherche : dans ces cas `nativeBackButton` n'est **pas** affiché, la garde renvoie `false`, et le JS de fermeture s'exécute exactement comme avant. La garde ne se déclenche que lorsqu'un écran natif poussé possède réellement la flèche de retour.

## Scénarios exercés sur appareil

`settings-again`, `back-once`, `back-settled` (double navigation différée), `back-from-library`, `back-from-search` (pas de flèche native → chaîne WebView), `background-resume` (cycle de vie), plus relevé de l'activité au premier plan dans `foreground.txt`.
