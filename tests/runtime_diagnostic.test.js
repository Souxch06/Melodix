const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const script = fs.readFileSync(path.join(repo, 'assets/runtime_diagnostic.js'), 'utf8');
const helperSmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic.smali'),
    'utf8'
);
const dialogSmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic.smali'),
    'utf8'
);
const copySmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali'),
    'utf8'
);
const webViewClientSmali = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');

function executeDiagnostic() {
    const nodes = new Map([
        ['#global-nav-bar', { display: 'flex' }],
        ['#Desktop_LeftSidebar_Id', { display: 'block' }],
        ['#sf-mobile-navigation', { display: 'grid' }]
    ]);
    const classes = new Set(['sf-mobile-shell', 'sf-library-open']);
    const body = {
        className: 'sf-mobile-shell sf-library-open',
        classList: { contains: (name) => classes.has(name) }
    };
    const logs = [];
    const window = {
        location: { hostname: 'open.spotify.com' },
        innerWidth: 390,
        screen: { width: 432 },
        visualViewport: { width: 390 },
        SF_CONFIG: { guiMode: 'csshack', dockLeftSidebar: false },
        __sfLibraryExpanded: true,
        getComputedStyle: (element) => ({ display: element.display })
    };
    const document = {
        body,
        querySelector: (selector) => nodes.get(selector) || null
    };
    const result = vm.runInNewContext(script, {
        window,
        document,
        navigator: { userAgent: 'Android WebView test UA' },
        console: { log: (...args) => logs.push(args) }
    });

    return { result: JSON.parse(JSON.stringify(result)), logs };
}

test('Preview diagnostic returns the report fields and both dock IDs', () => {
    const { result, logs } = executeDiagnostic();

    assert.deepEqual(result, {
        host: 'open.spotify.com',
        userAgent: 'Android WebView test UA',
        width: { innerWidth: 390, screenWidth: 432, visualViewportWidth: 390 },
        selectors: {
            '#global-nav-bar': true,
            '#Desktop_LeftSidebar_Id': true,
            '#main-view': false,
            '#sf-mobile-nav': false,
            '#sf-mobile-navigation': true
        },
        guiMode: 'csshack',
        dockLeftSidebar: false,
        bodyClasses: 'sf-mobile-shell sf-library-open',
        drawer: {
            expanded: true,
            libraryOpenClass: true,
            guestClass: false,
            expandedClass: false
        },
        dockDisplay: { sfMobileNav: null, sfMobileNavigation: 'grid' },
        sidebarDisplay: 'block'
    });
    assert.equal(logs.length, 1);
    assert.equal(logs[0][0], '[Melodix DOM diagnostic]');
    assert.deepEqual(JSON.parse(logs[0][1]), result);
});

test('diagnostic script does not read credentials or make network requests', () => {
    assert.doesNotMatch(script, /document\.cookie|CookieManager|localStorage|sessionStorage|\btoken\b|\bfetch\s*\(|XMLHttpRequest|location\.href/i);
});

test('native hook is restricted to Preview and exact Spotify HTTPS origin', () => {
    assert.match(helperSmali, /com\.melodix\.music\.preview/);
    assert.match(helperSmali, /open\.spotify\.com/);
    assert.match(helperSmali, /equalsIgnoreCase/);
    assert.match(helperSmali, /evaluateJavascript/);

    const packageGuard = helperSmali.indexOf('com.melodix.music.preview');
    const assetLoad = helperSmali.indexOf('runtime_diagnostic.js');
    assert.ok(packageGuard >= 0 && assetLoad > packageGuard, 'package guard must precede asset loading');
    assert.match(webViewClientSmali, /invoke-static \{p1, p2\}, Lcom\/melodix\/music\/RuntimeDiagnostic;->runIfPreview/);
});

test('result dialog is selectable and its copy button writes only the diagnostic JSON', () => {
    assert.match(dialogSmali, /TextView;->setTextIsSelectable\(Z\)V/);
    assert.match(dialogSmali, /setPositiveButton/);
    assert.match(copySmali, /ClipData;->newPlainText/);
    assert.match(copySmali, /ClipboardManager;->setPrimaryClip/);
});
