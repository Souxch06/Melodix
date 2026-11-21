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
// handler records only a redacted failure type through the diagnostic channel.
test('the WebView creation catch records the failure type without page details', () => {
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

// CONTRACT 1b: the recorder keeps only the exception class. Messages may
// contain a URL or request detail, so they must never enter the diagnostic.
test('the recorder stores only the WebView exception class', () => {
    const body = methodBody(read(GUARD), '.method public static recordWebViewFailure(Ljava/lang/Throwable;)V');
    assert.match(body, /Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;/,
        'the failure type goes to the existing diagnostic sink');
    assert.match(body, /Class;->getSimpleName\(\)Ljava\/lang\/String;/);
    assert.doesNotMatch(body, /Throwable;->getMessage|String;->substring|access_token|refresh_token|Bearer /,
        'exception messages, URLs, tokens, and arbitrary text are excluded');
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

// The diagnostic reports only a host category and coarse failure type; it must
// never reveal a full URL, path, query, or exception message.
test('the WebView report redacts URL details and keeps the missing-engine action', () => {
    const web = methodBody(read(OVERLAY),
        '.method public static webState(Lcom/melodix/music/MainActivity;)Ljava/lang/String;');
    assert.match(web, /WebView;->getUrl\(\)Ljava\/lang\/String;/);
    assert.match(web, /Uri;->parse\(Ljava\/lang\/String;\)Landroid\/net\/Uri;/);
    assert.match(web, /Uri;->getHost\(\)Ljava\/lang\/String;/);
    assert.match(web, /const-string v3, "accounts"[\s\S]*?const-string v3, "spotify"[\s\S]*?const-string v3, "other"/);
    assert.match(web, /erreur WebView : /, 'the failure type is labelled on screen');
    assert.match(web, /aucune erreur enregistrée/, 'the empty case is stated explicitly');
    assert.ok(web.includes("Le moteur web de l'appareil est indisponible."),
        'the missing-WebView case shows the action message');
    assert.ok(web.includes("relance l'application"), 'the action message tells the user what to do');
    assert.doesNotMatch(web, /append\(Ljava\/lang\/StringBuilder;\)Ljava\/lang\/StringBuilder;[\s\S]{0,80}getUrl/,
        'the raw WebView URL is not appended to the report');
});

test('the Spotify bridge error trace excludes exception messages and permits only error classes', () => {
    const bridge = read('scripts/spotify_bridge.source.js');
    const start = bridge.indexOf("window.addEventListener('error'");
    const end = bridge.indexOf('// Global flags injected by Android:', start);
    assert.ok(start >= 0 && end > start, 'the global error handler is present');
    const handler = bridge.slice(start, end);
    assert.match(bridge, /function __sfBridgeErrorClass\(value\)/);
    assert.match(handler, /__sfBridgeErrorClass\(ev && ev\.error && ev\.error\.name\)/);
    assert.doesNotMatch(handler, /ev\s*&&\s*ev\.message|\.message/,
        'browser-provided exception text can contain URLs or page content');
});
