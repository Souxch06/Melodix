const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('phone layout adds a safe-area-aware bottom dock and compact player', () => {
    const css = read('assets/css_hacks.css');

    assert.match(css, /@media screen and \(max-width: 640px\) and \(orientation: portrait\)/);
    assert.match(css, /#sf-mobile-nav\s*\{[\s\S]*?height: calc\(72px \+ env\(safe-area-inset-bottom\)\)/);
    assert.match(css, /#sf-mobile-nav \.sf-mobile-nav__item\s*\{[\s\S]*?min-width: 44px/);
    assert.match(css, /#sf-mobile-nav \.sf-mobile-nav__item\[aria-current="page"\]/);
    assert.match(css, /aside\[data-testid="now-playing-bar"\]\s*\{[\s\S]*?height: 68px/);
    assert.match(css, /body\.sf-library-open #Desktop_LeftSidebar_Id/);
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
    assert.match(bridge, /document\.body\.classList\.add\('sf-library-open'\)/);
    assert.match(bridge, /document\.body\.classList\.remove\('sf-library-open'\)/);
    assert.match(bridge, /installMobileNavigation\(\);/);
});
