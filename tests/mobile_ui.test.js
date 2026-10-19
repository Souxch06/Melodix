const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

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
    assert.match(css, /body\.sf-library-open #Desktop_LeftSidebar_Id\s*\{[\s\S]*?bottom: calc\(72px \+ env\(safe-area-inset-bottom\)\)[\s\S]*?z-index: 10005/);
    assert.match(css, /body\.sf-fs-open #sf-mobile-nav\s*\{\s*display: none/);
    assert.doesNotMatch(css, /body\.sf-library-open #sf-mobile-nav/);
    assert.doesNotMatch(css, /body\.sf-expanded #sf-mobile-nav/);
    assert.match(css, /body:not\(\.sf-fs-open\) aside\[data-testid="now-playing-bar"\]/);
    assert.match(css, /\.sf-mobile-library-close/);
    assert.match(css, /scroll-padding-bottom: calc\(160px \+ env\(safe-area-inset-bottom\)\)/);
});

test('mobile dock reuses Spotify home, search, and library controls', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /function installMobileNavigation\(\)/);
    assert.match(bridge, /document\.body\.classList\.add\('sf-mobile-shell'\)/);
    assert.match(bridge, /childList: true/);
    assert.match(bridge, /data-sf-mobile-action="home"/);
    assert.match(bridge, /data-sf-mobile-action="search"/);
    assert.match(bridge, /data-sf-mobile-action="library"/);
    assert.match(bridge, /button\[data-testid="home-button"\]/);
    assert.match(bridge, /url\.pathname === '\/search'/);
    assert.match(bridge, /function mobileLibraryButton\(\)/);
    assert.match(bridge, /classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /height', 'calc\(100vh - 48px - 72px/);
    assert.match(bridge, /bottom', 'calc\(72px \+ env\(safe-area-inset-bottom\)\)/);
    assert.match(bridge, /z-index', '10005'/);
    assert.match(bridge, /installMobileNavigation\(\);/);
});

test('phone-sized windows keep the login WebView on the device width', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const webViewSizing = activity.match(/\.method public final C\(\)V([\s\S]*?)\.end method/);
    assert.ok(webViewSizing, 'responsive WebView sizing method should exist');
    assert.match(
        webViewSizing[1],
        /Configuration;->smallestScreenWidthDp:I[\s\S]*?const\/16 v0, 0x258[\s\S]*?if-lt v4, v0, :cond_4[\s\S]*?const\/16 v0, 0x640/
    );

    const bridge = read('assets/spotify_bridge.js');
    assert.match(bridge, /const isCompactWindow = shortestScreenSide > 0 && shortestScreenSide < 600/);
    assert.match(bridge, /\(\(isBigWindow && isLandscape\) \|\| isCompactWindow\)/);
});

test('phone dock is mounted outside CSS+JS mode and stale fullscreen state cannot hide it', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /function isMobileNavigationViewport\(\)/);
    assert.match(bridge, /const isMobileViewport = isMobileNavigationViewport\(\)/);
    assert.match(bridge, /guiMode !== 'csshack' && !isMobileViewport/);
    assert.match(bridge, /if \(isMobileViewport\) ensureMobileShellFallbackStyles\(\)/);
    assert.match(bridge, /function ensureMobileShellFallbackStyles\(\)/);
    assert.match(bridge, /sf-mobile-shell-fallback-style/);
    assert.match(bridge, /#sf-mobile-nav\s*\{[\s\S]*?display: grid !important;[\s\S]*?height: calc\(72px \+ env\(safe-area-inset-bottom\)\)/);
    assert.match(
        bridge,
        /classList\.contains\('sf-fs-open'\)[\s\S]*?getElementById\('sf-fs-player'\)[\s\S]*?classList\.remove\('sf-fs-open'\)/
    );
    assert.match(bridge, /window\.SF_CONFIG\?\.guiMode === 'csshack' \|\| isMobileNavigationViewport\(\)/);
    assert.match(bridge, /typeof window\.switchLs !== 'function'[\s\S]*?classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /body\.sf-library-open #Desktop_LeftSidebar_Id \.sf-mobile-library-close/);
});

test('mobile shell initializes before playback and library state can be forced open or closed', () => {
    const bridge = read('assets/spotify_bridge.js');

    assert.match(bridge, /function initializeMobileShell\(\)/);
    assert.match(bridge, /const maxRetries = 40/);
    assert.match(bridge, /document\.addEventListener\('DOMContentLoaded', ensure/);
    assert.match(bridge, /window\.addEventListener\('load', ensure/);
    assert.match(bridge, /window\.__sfEnsureMobileShell = ensure/);
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
