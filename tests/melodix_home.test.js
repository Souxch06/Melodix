const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('custom home is limited to connected mobile CSS+JS mode and the Spotify home route', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /const homePath = window\.location\.pathname\.replace\(/);
    assert.match(bridge, /window\.location\.hostname === 'open\.spotify\.com'/);
    assert.match(bridge, /homePath === '\/' \|\| homePath === '\/home'/);
    assert.match(bridge, /window\.SF_CONFIG\?\.guiMode === 'csshack' && isMobileNavigationViewport\(\)/);
    assert.match(bridge, /if \(!isSpotifyHome \|\| !isCustomMobileMode\)/);
    assert.match(bridge, /document\.body\.classList\.contains\('sf-fs-open'\)/);
    assert.match(bridge, /function initializeMelodixHome\(\)/);
    assert.match(bridge, /window\.addEventListener\('popstate', scheduleMelodixHomeUpdate\)/);
});

test('custom home only renders real Spotify cards and leaves original navigation actions intact', () => {
    const bridge = read('assets/spotify_bridge.js');
    const css = read('assets/css_hacks.css');

    assert.match(bridge, /querySelectorAll\('\[data-testid="card"\]'\)/);
    assert.match(bridge, /function collectMelodixHomeSections\(mainView\)/);
    assert.match(bridge, /const itemCount = sections\.reduce/);
    assert.match(bridge, /if \(itemCount < 2\) \{\s*deactivateMelodixHome\(false\);\s*return;/);
    assert.match(bridge, /card\.sourceAnchor\.click\(\)/);
    assert.match(bridge, /window\.location\.assign\(card\.href\)/);
    assert.match(bridge, /body\.classList\.add\('sf-melodix-home-active'\)/);
    assert.match(css, /body\.sf-melodix-home-active #main-view\s*\{\s*display: none !important/);
    assert.match(css, /#sf-melodix-home\s*\{[\s\S]*?position: fixed !important/);
    assert.match(css, /env\(safe-area-inset-bottom\)/);
});

test('home card URLs must stay on Spotify and point to a real content route', () => {
    const bridge = read('assets/spotify_bridge.js');
    const helper = bridge.match(/function melodixHomeResourcePath\(href\) \{[\s\S]*?\n    \}/);
    assert.ok(helper, 'Spotify resource path guard should exist');

    const context = {
        URL,
        window: { location: { href: 'https://open.spotify.com/', origin: 'https://open.spotify.com' } }
    };
    vm.runInNewContext(`${helper[0]}; globalThis.isSpotifyResource = melodixHomeResourcePath;`, context);

    assert.equal(context.isSpotifyResource('/playlist/abc123'), true);
    assert.equal(context.isSpotifyResource('https://open.spotify.com/album/xyz789'), true);
    assert.equal(context.isSpotifyResource('/search'), false);
    assert.equal(context.isSpotifyResource('https://example.org/playlist/abc123'), false);
});
