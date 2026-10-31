// P0 - the WebView factory must never trade the whole engine for one failed
// step, and a device without an engine must never show a silent black screen.
//
// Real-device evidence (Lenovo TB125FU, api 33, build 1.2.2-536437c): the
// native shell appeared, the splash faded, and nothing else ever did. The
// report read "web: url=<webview absente>" plus "chargement=true erreur=1".
// Those two flags are only written by MainActivity.D(Z), whose only caller in
// C() is the "the factory returned null" branch: the app really had no
// WebView. m9.g() builds it, then a catchall covering the settings, the bridge,
// the first loadUrl and the proxy override did:
//
//     sput-object p0, AppSingleton;->w:Ll9   # with p0 = null
//
// so one failing configuration step threw away a WebView that was fully
// constructed. C() then reported a missing engine and the splash faded to
// black, for ever.

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

// Method body by signature, bounded by the next .end method (never by
// indexOf(':label'): the same label text exists in several methods).
const methodBody = (source, signature) => {
    const start = source.indexOf(signature);
    assert.ok(start > 0, `methode absente: ${signature}`);
    const end = source.indexOf('\n.end method', start);
    return source.slice(start, end);
};

test('a failed configuration step keeps the WebView instead of discarding it', () => {
    const factory = read('smali/m9.smali');
    const body = methodBody(factory, '.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;');

    // The historic bug: the catchall nulls the singleton before returning null.
    // The label DEFINITION, not a .catchall reference to it.
    const handler = body.slice(body.indexOf('\n    :catchall_1\n'));
    const handlerBody = handler.slice(0, handler.indexOf('goto :goto_4'));
    assert.doesNotMatch(
        handlerBody,
        /sput-object [vp]\d+, Lcom\/melodix\/music\/AppSingleton;->w:Ll9;/,
        'le WebView deja construit ne doit plus etre jete'
    );

    // The reason is recorded. A retry is allowed only when getUrl is null or
    // about:blank; a real URL must take the keep path (branch polarity matters).
    assert.match(handlerBody, /NativeCrashGuard;->recordWebViewConfigFailure\(Ljava\/lang\/Throwable;\)V/);
    assert.match(handlerBody, /Landroid\/webkit\/WebView;->getUrl\(\)Ljava\/lang\/String;/);
    assert.match(handlerBody, /if-eqz v2, :retry_without_page/);
    assert.match(handlerBody, /invoke-virtual \{v3, v2\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z/);
    assert.match(handlerBody, /if-eqz v3, :keep_webview/);
    assert.match(handlerBody, /Landroid\/webkit\/WebView;->loadUrl\(Ljava\/lang\/String;\)V/);

    // The WebView constructor failure keeps its own handler: nothing to keep.
    assert.match(body, /:webview_create_failure/);
    assert.match(body, /sput-object p0, Lcom\/melodix\/music\/AppSingleton;->w:Ll9;/,
        'aucune creation reussie: le singleton doit rester nul');
});

test('the configuration failure is recorded with its own prefix', () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const body = methodBody(guard, '.method public static recordWebViewConfigFailure(Ljava/lang/Throwable;)V');
    assert.match(body, /recordWebViewFailure\(Ljava\/lang\/Throwable;\)V/);
    assert.match(body, /const-string v0, "config apres creation/);
    assert.match(body, /sput-object v0, Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;/);
});

test('a device without a WebView gets an explanation, never a black screen', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const body = methodBody(activity, '.method public final C()V');
    const branch = body.slice(body.indexOf('if-nez v0, :cond_1'));

    // The splash already reserves a slot for this text; frameStatusText is
    // covered by the splash, which is why the message was invisible.
    assert.match(branch, /const v2, 0x7f090213/, 'txtSplashError doit etre rempli');
    assert.match(branch, /Moteur web indisponible/);
    assert.match(branch, /const v2, 0x7f090187/, 'le spinner infini doit etre masque');
    assert.match(branch, /const-string v0, "webview-null"/, 'la branche doit etre nommee dans la trace');

    // D(true) fades the splash away: calling it here is what produced the
    // black screen, so the branch must not depend on it any more.
    const nullBranch = branch.slice(0, branch.indexOf(':cond_1'));
    assert.doesNotMatch(nullBranch, /MainActivity;->D\(Z\)V/,
        'D(true) efface le splash et laisse un ecran noir sans moteur');
});

// Follow-up device report (same tablet, test.85 / 4a4c05a) still showed
// url=null, progress=100, CONTENT STUCK, and JS running on about:blank. Review
// of the actual control flow found three inverted null/empty branches: the
// factory skipped the first request, ensure dereferenced null and swallowed
// the exception, and the watchdog skipped its retry. Tests below assert the
// branch polarity, not merely the presence of URL strings or labels.

test('a fresh WebView always requests its first page (no inverted null guard)', () => {
    const factory = read('smali/m9.smali');
    const body = methodBody(factory, '.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;');
    const creationPath = body.slice(body.indexOf('setWebViewClient'), body.indexOf('\n    :catchall_1\n'));
    const instructions = creationPath.split('\n').filter((line) => !line.trimStart().startsWith('#')).join('\n');

    // This branch only runs for a newly constructed WebView. It must not gate
    // the one initial request on either the native-shell flag or a null URL.
    assert.doesNotMatch(instructions, /AppSingleton;->l:Z/);
    assert.doesNotMatch(instructions, /getOriginalUrl/,
        'un WebView neuf est vide par definition: null ne doit pas sauter loadUrl');
    assert.match(instructions, /:load_first_page[\s\S]*WebView;->loadUrl\(Ljava\/lang\/String;\)V/);
    assert.equal((instructions.match(/const-string v1, "factory-load"/g) || []).length, 2,
        'les deux routes legitimes (connexion ou lecteur) doivent confirmer la demande native');
});

test('C() guarantees a page load right after the WebView is stored', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const body = methodBody(activity, '.method public final C()V');
    const stored = body.indexOf('iput-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;');
    const ensured = body.indexOf('MainActivity;->ensureWebPageLoaded()V');
    const armed = body.indexOf('StartupLoadWatchdog;->armAfterResume(Landroid/webkit/WebView;)V');
    assert.ok(stored > 0, 'le WebView est affecte a G');
    assert.ok(ensured > stored, 'ensureWebPageLoaded est appelee juste apres');
    assert.ok(armed > ensured, 'un filet de 8 s est arme meme si onPageStarted ne survient jamais');
});

test('ensureWebPageLoaded is idempotent, uses the same target and never hides a failure', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const body = methodBody(activity, '.method public final ensureWebPageLoaded()V');

    // Idempotent: a real page on screen returns immediately, so onResume can
    // never reload the player while the user is listening. A null URL or an
    // empty document is repaired.
    assert.match(body, /const-string v1, "ensure-check"/);
    assert.match(body, /getUrl\(\)Ljava\/lang\/String;/);
    assert.match(body, /if-eqz v1, :do_load/,
        'getUrl()==null doit aller directement au chargement, pas dereferencer null');
    assert.match(body, /const-string v2, "about:blank"[\s\S]*invoke-virtual \{v2, v1\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z[\s\S]*move-result v1[\s\S]*if-eqz v1, :done/,
        'about:blank se charge, une URL reelle ne se recharge pas');
    assert.doesNotMatch(body, /if-nez v1, :do_load/,
        'une URL reelle ne doit pas provoquer un rechargement');
    assert.doesNotMatch(body, /invoke-virtual \{v1, v2\}, Ljava\/lang\/String;->equals/,
        'le code ne doit jamais invoquer equals sur une URL potentiellement nulle');
    assert.match(body, /:do_load/);

    // Same URLs as the factory, so the login flow is not altered.
    assert.match(body, /https:\/\/open\.spotify\.com\//);
    assert.match(body, /accounts\.spotify\.com\/en\/login/);

    // Failures are recorded, never swallowed, and the branch names itself.
    assert.match(body, /recordWebViewConfigFailure\(Ljava\/lang\/Throwable;\)V/);
    assert.match(body, /const-string v1, "ensure-load"/);
    assert.match(body, /const-string v1, "ensure-load-failed"/);

    // No cookie, cache or session manipulation: this only asks for a page.
    assert.doesNotMatch(body, /CookieManager|clearCache|clearHistory|evaluateJavascript/);
});

test('the load watchdog retries a WebView that never requested a page', () => {
    const watchdog = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
    const body = methodBody(watchdog, '.method public final run()V');
    const decision = body.slice(body.indexOf('WebView;->getUrl'), body.indexOf('const-string v2, "load-retry"'));
    assert.match(decision, /if-eqz v2, :load_retry/,
        'une URL nulle doit prendre la branche de relance');
    assert.match(decision, /const-string v3, "about:blank"[\s\S]*invoke-virtual \{v3, v2\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z[\s\S]*if-eqz v3, :webview_has_page/,
        'une URL reelle saute la relance, about:blank y entre');
    assert.match(body, /const-string v2, "load-retry"/);
    assert.match(body, /MainActivity;->ensureWebPageLoaded\(\)V/);
    // The retry is guarded by the WebView's own state, not by a timer alone.
    assert.match(body, /:webview_has_page/);
});

test('the latest report failure mode cannot silently take the blank-page fast path', () => {
    const watchdog = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
    const body = methodBody(watchdog, '.method public final run()V');
    const decision = body.slice(body.indexOf('WebView;->getUrl'), body.indexOf('const-string v2, "load-retry"'));
    assert.doesNotMatch(decision, /if-eqz v2, :webview_has_page/,
        'la polarite du branchement precedent sautait la relance quand getUrl() etait null');
    assert.match(decision, /if-eqz v2, :load_retry/);
});
