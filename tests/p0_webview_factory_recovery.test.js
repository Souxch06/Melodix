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

    // The reason is recorded, and a load that never started is retried once.
    assert.match(handlerBody, /NativeCrashGuard;->recordWebViewConfigFailure\(Ljava\/lang\/Throwable;\)V/);
    assert.match(handlerBody, /Landroid\/webkit\/WebView;->getOriginalUrl\(\)/,
        'le rechargement ne doit pas doubler une page deja lancee');
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

// Second device report (same tablet, build 1b1e533): the engine now EXISTS
// (url=null instead of "<webview absente>") but no page was ever requested -
// progress=100, chargement=false, and not a single page-finished stage. The
// splash stayed, the watchdog declared CONTENT STUCK 60 s later. Two separate
// ways of reaching that state had to be closed.

test('the first load no longer depends on the native shell being hidden', () => {
    const factory = read('smali/m9.smali');
    const body = methodBody(factory, '.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;');
    const beforeLoad = body.slice(body.indexOf('setWebViewClient'), body.indexOf('loadUrl'));

    // AppSingleton.l ("shell displayed") skipped the only load: when the startup
    // safety net showed the shell before the engine existed, nothing ever loaded.
    assert.doesNotMatch(beforeLoad, /AppSingleton;->l:Z/,
        'le premier chargement ne doit plus dependre de la coque affichee');
    assert.match(beforeLoad, /Landroid\/webkit\/WebView;->getOriginalUrl\(\)Ljava\/lang\/String;/,
        'la decision doit venir de l\'etat du WebView lui-meme');
    assert.match(body, /:load_first_page/);
});

test('C() guarantees a page load right after the WebView is stored', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const body = methodBody(activity, '.method public final C()V');
    const stored = body.indexOf('iput-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;');
    const ensured = body.indexOf('MainActivity;->ensureWebPageLoaded()V');
    assert.ok(stored > 0, 'le WebView est affecte a G');
    assert.ok(ensured > stored, 'ensureWebPageLoaded est appelee juste apres');
});

test('ensureWebPageLoaded is idempotent, uses the same target and never hides a failure', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const body = methodBody(activity, '.method public final ensureWebPageLoaded()V');

    // Idempotent: an already requested page returns immediately, so onResume
    // can never reload the player while the user is listening.
    assert.match(body, /getOriginalUrl\(\)Ljava\/lang\/String;/);
    assert.match(body, /getUrl\(\)Ljava\/lang\/String;/);

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
    assert.match(body, /const-string v2, "load-retry"/);
    assert.match(body, /MainActivity;->ensureWebPageLoaded\(\)V/);
    // The retry is guarded by the WebView's own state, not by a timer alone.
    assert.match(body, /:webview_has_page/);
});
