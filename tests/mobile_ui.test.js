const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('phone layout adds a safe-area-aware bottom dock and compact player', () => {
    const css = read('assets/css_hacks.css');

    assert.match(css, /@media screen and \(max-width: 820px\) and \(orientation: portrait\)/);
    assert.match(css, /#sf-mobile-nav\s*\{[\s\S]*?height: calc\(72px \+ env\(safe-area-inset-bottom\)\)/);
    assert.match(css, /#sf-mobile-nav \.sf-mobile-nav__item\s*\{[\s\S]*?min-width: 44px/);
    assert.match(css, /#sf-mobile-nav \.sf-mobile-nav__item\[aria-current="page"\]/);
    assert.match(css, /aside\[data-testid="now-playing-bar"\]\s*\{[\s\S]*?height: 68px/);
    assert.match(css, /body\.sf-library-open #Desktop_LeftSidebar_Id/);
    assert.doesNotMatch(css, /body\.sf-expanded #sf-mobile-nav/);
    assert.match(css, /body:not\(\.sf-fs-open\) aside\[data-testid="now-playing-bar"\]/);
    assert.match(css, /\.sf-mobile-library-close/);
    assert.match(css, /scroll-padding-bottom: calc\(160px \+ env\(safe-area-inset-bottom\)\)/);
});

test('mobile dock reuses Spotify home, search, and library controls', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /function installMobileNavigation\(\)/);
    assert.match(bridge, /data-sf-mobile-action="home"/);
    assert.match(bridge, /data-sf-mobile-action="search"/);
    assert.match(bridge, /data-sf-mobile-action="library"/);
    assert.match(bridge, /button\[data-testid="home-button"\]/);
    assert.match(bridge, /url\.pathname === '\/search'/);
    assert.match(bridge, /function mobileLibraryButton\(\)/);
    assert.match(bridge, /classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /installMobileNavigation\(\);/);
});

test('mobile shell retries initialization until the native CSS-hack config is ready', () => {
    const bridge = read('assets/spotify_bridge.js');
    const initializerStart = bridge.indexOf('    function initializeMobileShell() {');
    const initializerEnd = bridge.indexOf('\n    initializeMobileShell();', initializerStart);
    assert.ok(initializerStart >= 0 && initializerEnd > initializerStart);

    const initializer = bridge.slice(initializerStart, initializerEnd);
    const pendingTimers = new Map();
    let nextTimerId = 0;
    let addCssHackCalls = 0;
    const window = {
        setTimeout(callback, delay) {
            assert.equal(delay, 250);
            const timerId = ++nextTimerId;
            pendingTimers.set(timerId, callback);
            return timerId;
        },
        clearTimeout(timerId) {
            pendingTimers.delete(timerId);
        },
        addCSSJSHack() {
            addCssHackCalls += 1;
        }
    };
    const document = { readyState: 'complete', body: {} };

    vm.runInNewContext(`${initializer}\ninitializeMobileShell();`, { window, document });
    assert.equal(addCssHackCalls, 0);
    assert.equal(pendingTimers.size, 1);

    window.SF_CONFIG = { guiMode: 'csshack' };
    const [timerId, callback] = pendingTimers.entries().next().value;
    pendingTimers.delete(timerId);
    callback();

    assert.equal(addCssHackCalls, 1);
    assert.equal(pendingTimers.size, 0);
});

test('mobile shell initializes before playback and library state can be forced open or closed', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /function initializeMobileShell\(\)/);
    assert.match(bridge, /document\.addEventListener\('DOMContentLoaded', start/);
    assert.match(bridge, /window\.addCSSJSHack\(\)/);
    assert.match(bridge, /const shouldOpen = typeof forceOpen === 'boolean' \? forceOpen : !mobileLibraryOpen/);
    assert.match(bridge, /function setMobileLibraryOpen\(shouldOpen\)/);
    assert.match(bridge, /setMobileLibraryOpen\(shouldOpen\)/);
    assert.match(bridge, /classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /switchLs\(document\.body\.classList\.contains\('sf-library-open'\)\)/);
    assert.match(bridge, /ensureMobileLibraryCloseButton\(ls\)/);
    assert.match(bridge, /fr: 'Fermer la bibliothèque'/);
    assert.match(bridge, /closeButton\.setAttribute\('aria-label', closeLabels\[locale\] \|\| 'Close library'\)/);
});
