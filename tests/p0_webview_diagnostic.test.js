const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.resolve(__dirname, '..');
const read = (rel) => fs.readFileSync(path.join(repo, rel), 'utf8');
const OVERLAY = 'smali/com/melodix/music/StartupDiagnosticOverlay.smali';
const GUARD = 'smali/com/melodix/music/NativeCrashGuard.smali';

// Body of a method, from its .method line to its .end method.
function methodBody(source, signature) {
    const start = source.indexOf(signature);
    assert.ok(start >= 0, `method not found: ${signature}`);
    const end = source.indexOf('.end method', start);
    return source.slice(start, end);
}

// Body of a smali label up to the next label.
function labelBody(text, label) {
    const start = text.indexOf(`\n    :${label}\n`);
    assert.ok(start >= 0, `label not found: :${label}`);
    const rest = text.slice(start + 1);
    const next = rest.slice(1).search(/\n    :[\w_]+\n/);
    return next >= 0 ? rest.slice(0, next + 1) : rest;
}

function smaliFiles(dir) {
    const out = [];
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) out.push(...smaliFiles(full));
        else if (entry.name.endsWith('.smali')) out.push(full);
    }
    return out;
}

// CONTRACT 1: the WebView creation try block has its own handler, and that
// handler records the throwable through the diagnostic channel.
test('the WebView creation catch records the failure class and message', () => {
    const factory = methodBody(read('smali/m9.smali'),
        '.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;');
    const creationCatch = factory.match(/\.catchall \{:try_start_1 \.\. :try_end_1\} :([\w_]+)/);
    assert.ok(creationCatch, 'the creation block keeps a catchall handler');
    assert.notEqual(creationCatch[1], 'catchall_1',
        'creation failure must not share the silent handler that only nulls the singleton');

    const handler = labelBody(factory, creationCatch[1]);
    assert.match(handler, /move-exception v\d+/,
        'the handler captures the throwable instead of discarding it');
    assert.match(handler, /Lcom\/melodix\/music\/NativeCrashGuard;->recordWebViewFailure\(Ljava\/lang\/Throwable;\)V/,
        'the handler records the failure on the diagnostic channel');
});

// CONTRACT 1b: the recorder keeps the class name plus the message, capped at
// 160 characters, and never stores page content, cookies or tokens.
test('the recorder stores "<class> - <message>" truncated to 160 characters', () => {
    const body = methodBody(read(GUARD), '.method public static recordWebViewFailure(Ljava/lang/Throwable;)V');
    assert.match(body, /Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;|NativeCrashGuard;->write/,
        'the failure goes to an existing diagnostic sink');
    assert.match(body, /Throwable;->getMessage\(\)Ljava\/lang\/String;/);
    assert.match(body, /Class;->getSimpleName\(\)Ljava\/lang\/String;|Class;->getName\(\)Ljava\/lang\/String;/);
    assert.match(body, /const\/16 v\d+, 0xa0/, 'the cap is 160 characters');
    assert.match(body, /String;->substring\(II\)Ljava\/lang\/String;/, 'long messages are truncated');
    assert.ok(!/CookieManager|cookie|access_token|refresh_token|Bearer /.test(body),
        'no page content, cookie or token is recorded');
});

// CONTRACT 2: the misleading interpretation is gone from the whole smali tree.
test('the misleading "thread principal (le blocage)" label no longer exists', () => {
    const offenders = smaliFiles(path.join(repo, 'smali'))
        .filter((file) => fs.readFileSync(file, 'utf8').includes('thread principal (le blocage)'))
        .map((file) => path.relative(repo, file));
    assert.deepEqual(offenders, [], `label still present in: ${offenders.join(', ')}`);
});

// CONTRACT 3: the diagnostic header names the tested build (versionName + code).
test('the diagnostic header carries the app version name and version code', () => {
    const overlay = read(OVERLAY);
    assert.match(overlay, /Landroid\/content\/pm\/PackageInfo;->versionName:Ljava\/lang\/String;/);
    assert.match(overlay, /Landroid\/content\/pm\/PackageInfo;->versionCode:I/);

    const report = methodBody(overlay, '.method public static buildReport(Ljava/lang/String;)Ljava/lang/String;');
    assert.match(report, /Lcom\/melodix\/music\/StartupDiagnosticOverlay;->versionLine\(\)Ljava\/lang\/String;/,
        'buildReport() prints the version line');
});

// The absent-WebView case shows an action message instead of a silent wait,
// and the report exposes the recorded creation error verbatim.
test('the report shows the WebView error and an action message when it is missing', () => {
    const web = methodBody(read(OVERLAY),
        '.method public static webState(Lcom/melodix/music/MainActivity;)Ljava/lang/String;');
    assert.match(web, /erreur WebView : /, 'the recorded error is labelled on screen');
    assert.match(web, /aucune erreur enregistrée/, 'the empty case is stated explicitly');
    assert.ok(web.includes("Le moteur web de l'appareil est indisponible."),
        'the missing-WebView case shows the action message');
    assert.ok(web.includes("relance l'application"), 'the action message tells the user what to do');
});
