const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

const main = read('smali/com/melodix/music/MainActivity.smali');
const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' existe');
  return src.slice(at, src.indexOf('.end method', at));
};

test('MEL-BUG-068a: onStop flushes the session cookies to disk (quit must not log out)', () => {
  const onStop = method(main, '.method public final onStop()V');
  assert.match(onStop, /CookieManager;->getInstance\(\)Landroid\/webkit\/CookieManager;[\s\S]*setAcceptCookie\(Z\)V[\s\S]*CookieManager;->flush\(\)V/,
    'setAcceptCookie(true) + flush() dans onStop');
  assert.match(onStop, /\.catch Ljava\/lang\/Throwable; \{:try_start_flush \.\. :try_end_flush\}/,
    'le flush est protégé par un catch (jamais de crash au stop)');
});

test('session gate: resume preserves navigation instead of forcing repeated login', () => {
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const body = method(main, '.method public final ensureWebPageLoaded()V');
  assert.match(body, /getUrl\(\)Ljava\/lang\/String;\s+move-result-object v1\s+if-nez v1, :done/);
  assert.doesNotMatch(body, /revealLoginWebUi|accounts.spotify.com|AppSingleton;->B/);
  assert.match(gate, /autoUsed:Z[\s\S]*?already/);
  assert.match(method(main, '.method public final showNativeUiFrom('), /NativeSessionGate;->blocked/);
});

test('MEL-BUG-068c: a copyable full diagnostic exists (header chip + bridge branch)', () => {
  const layout = read('res/layout/activity_main.xml');
  assert.match(layout, /android:id="@id\/nativeDiagButton"[\s\S]*android:onClick="onNativeDiagCopyClick"/,
    'bouton diag dans le header avec onClick dédié');
  assert.match(read('res/values/public.xml'), /name="nativeDiagButton" id="0x7f090251"/);
  const click = method(main, '.method public final onNativeDiagCopyClick(Landroid/view/View;)V');
  assert.match(click, /buildDiagnosticText\(\)Ljava\/lang\/String;[\s\S]*copyTextToClipboard\(Ljava\/lang\/String;\)V[\s\S]*Toast;->makeText/,
    'le chip copie le diagnostic et confirme par un Toast');
  const diag = method(main, '.method private final buildDiagnosticText()Ljava/lang/String;');
  for (const field of ['ecran=', 'url=', 'auth=', 'cookie_sp_dc=', 'journal=']) {
    assert.ok(diag.includes(field), 'champ ' + field + ' présent');
  }
  assert.doesNotMatch(diag, /getAllCookies|Log\.|println/,
    'aucune valeur de cookie, clé ou token n\'est lue ou loggée');
  const apply = method(main, '.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(apply, /const-string v0, "copy-diagnostic"[\s\S]*copyTextToClipboard\(Ljava\/lang\/String;\)V/,
    'branche copy-diagnostic côté pont JS -> natif');
});

test('MEL-BUG-068d: settings rows never clobber the row register v2 (the test.99 crash cause)', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const at = f.indexOf('\n    :native_settings_switch_build\n');
  const sw = f.slice(at, f.indexOf('\n    :native_settings_pill_text\n', at));
  assert.doesNotMatch(sw, /const v2, |new-instance v2, |aput [^,]+, v2, |move-result-object v2/,
    'the row register v2 is never written in the switch block (VerifyError fix, kept)');
  const rows = method(main, '.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(rows, /NativeSettingsRowFactory;->create\(Lcom\/melodix\/music\/MainActivity;Lorg\/json\/JSONObject;\)Landroid\/widget\/LinearLayout;/,
    'settings rows still go through the hardened factory');
});

test('MEL-BUG-068e: greeting fallback when not connected (home title shows the state)', () => {
  const home = read('scripts/melodix_home.source.js');
  assert.match(home, /home-greeting[\s\S]*invité — non connecté/,
    'salutation de repli envoyée quand auth != connected');
  assert.match(home, /auth === 'connected'[\s\S]*__sfHomeFallbackGreetingSent = false/,
    'le vrai "Bonjour, <pseudo>" du shell prend le relais dès que la session est prouvée');
  assert.doesNotMatch(home.slice(home.indexOf('MEL-BUG-068')), /getToken|sp_dc=|cookie/i,
    'aucun token/cookie lu dans le fallback');
});

test('MEL-BUG-068f: visual polish added without touching pinned design tokens', () => {
  const css = read('assets/css_hacks.css');
  assert.match(css, /MEL-BUG-068: polish pass/);
  assert.match(css, /border-radius: 999px/);
  assert.match(css, /prefers-reduced-motion: reduce/);
  const colors = read('res/values/colors.xml');
  // MELODIX GLASS: the accent is no longer pinned to the old green. The
  // invariant that matters is that the token EXISTS and stays a single source
  // of truth — its value is asserted against the CSS root elsewhere.
  assert.match(colors, /<color name="mel_accent">#[0-9a-fA-F]{6}<\/color>/,
    'mel_accent reste la source unique de l accent');
});

test('MEL-BUG-068e: private diag helpers are only called via invoke-direct (VerifyError fix)', () => {
  const m = read('smali/com/melodix/music/MainActivity.smali');
  assert.doesNotMatch(m, /invoke-virtual \{[^}]*\}, Lcom\/melodix\/music\/MainActivity;->(buildDiagnosticText|copyTextToClipboard)\(/,
    'invoke-virtual sur méthode privée = VerifyError (vu CI 42472421314)');
  assert.match(m, /invoke-direct \{p0, p2\}, Lcom\/melodix\/music\/MainActivity;->copyTextToClipboard\(Ljava\/lang\/String;\)V/,
    'branche copy-diagnostic -> invoke-direct');
});
