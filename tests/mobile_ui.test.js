const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('touch layout keeps the bottom dock, mini-player, and drawer on one inset-aware stack', () => {
    const css = read('assets/css_hacks.css');
    const shell = css.slice(css.indexOf('SECTION 10: TOUCH APP SHELL'));

    assert.match(shell, /#sf-mobile-nav\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)[\s\S]*?height: var\(--sf-dock-h, 68px\)/);
    assert.match(shell, /#sf-mobile-nav \.sf-mobile-nav__item\s*\{[\s\S]*?min-width: 44px/);
    assert.match(shell, /#sf-mobile-nav \.sf-mobile-nav__item\[aria-current="page"\]/);
    assert.match(shell, /aside\[data-testid="now-playing-bar"\]\s*\{[\s\S]*?height: var\(--sf-mini-h, 68px\)/);
    assert.match(shell, /body\.sf-library-open #Desktop_LeftSidebar_Id/);
    assert.match(shell, /body\.sf-library-open #Desktop_LeftSidebar_Id\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-mini-h, 68px\) \+ var\(--sf-stack-gap, 4px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)[\s\S]*?z-index: 10005/);
    assert.match(shell, /body\.sf-library-open aside\[data-testid="now-playing-bar"\]\s*\{\s*bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\) !important;/,
        'the mini-player stays above the dock while the library drawer is open');
    assert.doesNotMatch(shell, /@media screen and \(min-width: 640px\)/,
        'phones, tablets, and touch foldables share the same bottom-dock geometry');
    assert.match(shell, /body\.sf-mobile-shell\.sf-fs-open #sf-mobile-nav\s*\{\s*display: grid/);
    assert.match(shell, /body\.sf-mobile-shell\.sf-fs-open #sf-fs-player\s*\{\s*padding-bottom: calc\(92px \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/,
        'the expanded Web player reserves content above the dock instead of hiding navigation');
    assert.doesNotMatch(shell, /body\.sf-library-open #sf-mobile-nav/);
    assert.doesNotMatch(shell, /body\.sf-expanded #sf-mobile-nav/);
    assert.match(shell, /body:not\(\.sf-fs-open\) aside\[data-testid="now-playing-bar"\]/);
    assert.match(css, /\.sf-mobile-library-close/);
    assert.match(shell, /scroll-padding-bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-mini-h, 68px\) \+ var\(--sf-stack-gap, 4px\) \+ 6px \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
});

test('Android system-bar bottom inset is forwarded to CSS and reserved by both dock stylesheets', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const insets = activity.slice(activity.indexOf('.method public final updateNativeWebInsets(II)V'));
    const listener = read('smali/fj.smali');
    const callback = listener.slice(listener.indexOf('.method public c(Landroid/view/View;Lkk1;)Lkk1;'), listener.indexOf('.end method', listener.indexOf('.method public c(Landroid/view/View;Lkk1;)Lkk1;')));
    const css = read('assets/css_hacks.css');
    const bridge = read('scripts/spotify_bridge.source.js');

    assert.match(callback, /Lne0;->d:I[\s\S]*?updateNativeWebInsets\(II\)V/,
        'the WindowInsets listener forwards the real bottom system-bar inset');
    assert.match(activity, /nativeSafeAreaBottom:I/);
    assert.match(insets, /setProperty\('--sf-safe-area-bottom','max\([\s\S]*?env\(safe-area-inset-bottom\)\)/);
    assert.match(css, /var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)/);
    assert.match(bridge, /var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)/);
});

test('mobile dock reuses Spotify home, search, and library controls', () => {
    const bridge = read('scripts/spotify_bridge.source.js');

    assert.match(bridge, /function installMobileNavigation\(\)/);
    assert.match(bridge, /document\.body\.classList\.add\('sf-mobile-shell'\)/);
    assert.match(bridge, /childList: true/);
    assert.match(bridge, /data-sf-mobile-action="home"/);
    assert.match(bridge, /data-sf-mobile-action="search"/);
    assert.match(bridge, /data-sf-mobile-action="library"/);
    assert.match(bridge, /button\[data-testid="home-button"\]/);
    assert.match(bridge, /classList\.contains\('sf-fs-open'\)[\s\S]*?closeFullscreenPlayer\(\)[\s\S]*?if \(action === 'home'\)/,
        'the dock dismisses its own expanded-player overlay before changing routes');
    assert.match(bridge, /url\.pathname === '\/search'/);
    assert.match(bridge, /function mobileLibraryButton\(\)/);
    assert.match(bridge, /classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /const drawerTop = 48;[\s\S]*?const stack = 'var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\)/,
        'the drawer bottom offset comes from the dock tokens, not from a literal');
    assert.match(bridge, /calc\(100vh - \$\{drawerTop\}px - \(\$\{stack\}\)/);
    assert.match(bridge, /var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)/);
    assert.match(bridge, /bottom', `calc\(\$\{stack\} \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)`/);
    assert.match(bridge, /z-index', '10005'/);
    assert.match(bridge, /installMobileNavigation\(\);/);
});

test('touch tablets receive the mobile shell even when the viewport is wider than a phone', () => {
    const bridge = read('scripts/spotify_bridge.source.js');
    const fallback = bridge.match(/function ensureMobileShellFallbackStyles\(\) \{[\s\S]*?style\.textContent = `([\s\S]*?)`;/);

    assert.match(bridge, /function hasTouchInput\(\)/);
    assert.match(bridge, /typeof config\.touchInput === 'boolean'\) return config\.touchInput/);
    assert.match(bridge, /maxTouchPoints \|\| navigatorInfo\.msMaxTouchPoints/);
    assert.match(bridge, /'ontouchstart' in window/);
    assert.match(bridge, /any-pointer: coarse/);
    assert.match(bridge, /\.matches \|\| touchInput/);
    assert.match(bridge, /config\.guiMode === "bigwindow" && !isCompactWindow && !hasTouch/);
    assert.ok(fallback, 'touch fallback stylesheet should be available');
    assert.match(fallback[1], /body\.sf-mobile-shell #sf-mobile-nav\s*\{[\s\S]*?display: grid !important/);
    assert.match(fallback[1], /body\.sf-library-open #Desktop_LeftSidebar_Id\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-mini-h, 68px\) \+ var\(--sf-stack-gap, 4px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
    assert.match(fallback[1], /body\.sf-library-open aside\[data-testid="now-playing-bar"\]\s*\{\s*bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
    assert.doesNotMatch(fallback[1], /@media screen and \(max-width: 820px\)/);
    assert.doesNotMatch(fallback[1], /@media screen and \(min-width: 640px\)/);
    assert.match(bridge, /body\.sf-mobile-shell #global-nav-bar/);
});

test('native touchscreen capability survives a desktop UA while Leanback TV remains non-touch UI', () => {
    const bridge = read('scripts/spotify_bridge.source.js');
    const touchHelper = bridge.match(/function hasTouchInput\(\) \{[\s\S]*?\n    \}/);
    assert.ok(touchHelper, 'touch capability helper should exist');

    const tabletTouch = vm.runInNewContext(
        `${touchHelper[0]}; hasTouchInput();`,
        { window: { SF_CONFIG: { touchInput: true }, navigator: { maxTouchPoints: 0 } } }
    );
    const leanbackTvTouch = vm.runInNewContext(
        `${touchHelper[0]}; hasTouchInput();`,
        {
            window: {
                SF_CONFIG: { touchInput: false },
                navigator: { maxTouchPoints: 10 },
                ontouchstart: null
            }
        }
    );

    assert.equal(tabletTouch, true);
    assert.equal(leanbackTvTouch, false);
});

test('phone-sized windows keep the login WebView on the device width', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const webViewSizing = activity.match(/\.method public final C\(\)V([\s\S]*?)\.end method/);
    assert.ok(webViewSizing, 'responsive WebView sizing method should exist');
    assert.match(
        webViewSizing[1],
        /Configuration;->smallestScreenWidthDp:I[\s\S]*?const\/16 v0, 0x258[\s\S]*?if-lt v4, v0, :cond_4[\s\S]*?const\/16 v0, 0x640/
    );

    const bridge = read('scripts/spotify_bridge.source.js');
    assert.match(bridge, /const isCompactWindow = shortestScreenSide > 0 && shortestScreenSide < 600/);
    assert.match(bridge, /\(\(isBigWindow && isLandscape\) \|\| isCompactWindow\)/);
});

test('Premium trial upsells are dismissed without hiding unrelated dialogs or error alerts', () => {
    const bridge = read('scripts/spotify_bridge.source.js');

    assert.match(bridge, /function premiumOfferText\(text\)/);
    assert.match(bridge, /mentionsPremium = \/\\bpremium\\b\/i\.test\(normalized\)/);
    assert.match(bridge, /hasTwoMonthFreeOffer =/);
    assert.match(bridge, /hasExplicitFreeTrial =/);
    assert.match(bridge, /button\[aria-label\*="fermer" i\]/);
    assert.match(bridge, /data-melodix-premium-dismissed/);
    assert.match(bridge, /window\._sfPremiumPromoObserver = new MutationObserver/);
    assert.match(bridge, /initializeMobileShell\(\);\s*installPremiumPromotionCleanup\(\);\s*firstFuck\(\);/);
    assert.doesNotMatch(bridge, /initializeMelodixHome\(\)/,
        'the CSS-backed Home renderer has its own small, independently loaded asset');
    const home = read('scripts/melodix_home.source.js');
    const client = read('smali/c91.smali');
    assert.match(home, /initializeMelodixHome\(\);/);
    assert.match(client, /const-string v5, "melodix_home\.js"[\s\S]*?evaluateJavascript/,
        'the Web Home renderer is injected independently of the core bridge');
    assert.doesNotMatch(bridge, /\[role="dialog"\]\s*\{\s*display:\s*none/);

    const helper = bridge.match(/function premiumOfferText\(text\) \{[\s\S]*?\n    \}/);
    assert.ok(helper, 'Premium offer text filter should be available');
    const context = {};
    vm.runInNewContext(`${helper[0]}; globalThis.isPremiumOffer = premiumOfferText;`, context);
    assert.equal(
        context.isPremiumOffer('Votre musique sans limites. Essayez Premium Personnel pendant 2 mois pour 0 €.'),
        true
    );
    assert.equal(context.isPremiumOffer('Network Error — tap to retry'), false);
    assert.equal(context.isPremiumOffer('Premium settings'), false);
    assert.equal(context.isPremiumOffer('Connectez-vous à votre compte Premium'), false);
});

test('phone dock is mounted outside CSS+JS mode and stale fullscreen state cannot hide it', () => {
    const bridge = read('scripts/spotify_bridge.source.js');

    assert.match(bridge, /function isMobileNavigationViewport\(\)/);
    assert.match(bridge, /const isMobileViewport = isMobileNavigationViewport\(\)/);
    assert.match(bridge, /guiMode !== 'csshack' && !isMobileViewport/);
    assert.match(bridge, /if \(isMobileViewport\) ensureMobileShellFallbackStyles\(\)/);
    assert.match(bridge, /function ensureMobileShellFallbackStyles\(\)/);
    assert.match(bridge, /sf-mobile-shell-fallback-style/);
    assert.match(bridge, /#sf-mobile-nav\s*\{[\s\S]*?position: fixed !important;[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)[\s\S]*?display: grid !important;[\s\S]*?height: var\(--sf-dock-h, 68px\)/);
    assert.match(
        bridge,
        /classList\.contains\('sf-fs-open'\)[\s\S]*?getElementById\('sf-fs-player'\)[\s\S]*?classList\.remove\('sf-fs-open'\)/
    );
    assert.match(bridge, /window\.SF_CONFIG\?\.guiMode === 'csshack' \|\| isMobileNavigationViewport\(\)/);
    assert.match(bridge, /typeof window\.switchLs !== 'function'[\s\S]*?classList\.toggle\('sf-library-open', shouldOpen\)/);
    assert.match(bridge, /body\.sf-library-open #Desktop_LeftSidebar_Id \.sf-mobile-library-close/);
});

test('mobile shell initializes before playback and library state can be forced open or closed', () => {
    const bridge = read('scripts/spotify_bridge.source.js');

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


// ---------------------------------------------------------------------------
// Phones, tablets, and unfolded foldables share one bottom-dock layout
// ---------------------------------------------------------------------------

test('all touch widths keep the dock at the bottom and reserve player/content space', () => {
    const css = read('assets/css_hacks.css');
    const shell = css.slice(css.indexOf('SECTION 10: TOUCH APP SHELL'));
    assert.match(shell, /#sf-mobile-nav\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)[\s\S]*?height: var\(--sf-dock-h, 68px\)/);
    assert.match(shell, /body:not\(\.sf-fs-open\) aside\[data-testid="now-playing-bar"\]\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
    assert.match(shell, /#main-view[\s\S]*?padding-bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-mini-h, 68px\) \+ var\(--sf-stack-gap, 4px\) \+ 6px \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
    assert.doesNotMatch(shell, /@media screen and \(min-width: 640px\)/,
        'tablet width cannot move the dock to the top or detach the player');
});

test('the injected fallback matches the bottom-dock geometry at every touch width', () => {
    const bridge = read('scripts/spotify_bridge.source.js');
    const i = bridge.indexOf('style.textContent = `', bridge.indexOf('function ensureMobileShellFallbackStyles'));
    const j = bridge.indexOf('`;', i);
    const fallback = bridge.slice(i, j);
    assert.match(fallback, /body\.sf-mobile-shell #sf-mobile-nav\s*\{[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)[\s\S]*?height: var\(--sf-dock-h, 68px\)/);
    assert.match(fallback, /body\.sf-library-open #Desktop_LeftSidebar_Id[\s\S]*?bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-mini-h, 68px\) \+ var\(--sf-stack-gap, 4px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\)/);
    assert.doesNotMatch(fallback, /@media screen and \(min-width: 640px\)/);
    assert.doesNotMatch(fallback, /@media screen and \(max-width: 820px\)/,
        'touch capability, not a phone-only width, controls the fallback shell');
});

test('the dock highlights localized Home, Search, and Library routes correctly', () => {
    const bridge = read('scripts/spotify_bridge.source.js');
    const sync = bridge.slice(bridge.indexOf('function syncMobileNavigation()'), bridge.indexOf('function hasTouchInput()'));
    assert.match(sync, /replace\([\s\S]*?\/\^\\\/intl-/,
        'the locale prefix is removed before active-route matching');
    assert.match(sync, /pathname === '\/collection' \|\| pathname\.startsWith\('\/collection\/'\)/);
    assert.match(sync, /pathname === '\/search' \|\| pathname\.startsWith\('\/search\/'\)/);
    assert.match(sync, /nav\.querySelectorAll\('\[data-sf-mobile-action\]'\)/);
});

test('the pill geometry holds on phone portrait, phone landscape and both tablets', () => {
    const { JSDOM } = require('jsdom');
    const fs = require('node:fs');
    const path = require('node:path');
    const css = fs.readFileSync(path.join(__dirname, '..', 'assets', 'css_hacks.css'), 'utf8');
    const dom = new JSDOM(`<style>${css}</style>`, { pretendToBeVisual: true });
    const sheet = dom.window.document.styleSheets[0];

    // Collect the media conditions that style the dock. Every one of them must
    // keep the pill centred and capped; none may hide it on a touch device.
    const dockRules = [];
    const hidden = [];
    (function walk(rules, media) {
        for (const rule of rules) {
            if (rule.media) { walk(rule.cssRules, rule.conditionText || rule.media.mediaText); continue; }
            if (!rule.selectorText || !rule.selectorText.includes('#sf-mobile-nav')) continue;
            if (rule.style.getPropertyValue('display') === 'none') {
                // The only legitimate hide is the keyboard guard; the base
                // `#sf-mobile-nav { display:none }` parks the element before
                // the shell exists and is not inside a media query.
                hidden.push({ media: media || '(base)', selector: rule.selectorText });
            }
            if (rule.style.getPropertyValue('position') === 'fixed') dockRules.push({ media, rule });
        }
    })(sheet.cssRules, null);

    assert.ok(dockRules.length >= 1, 'the fixed pill rule exists');
    // jsdom only exposes declarations through getPropertyValue (camelCase
    // accessors come back undefined), so read them by property name.
    for (const { media, rule } of dockRules) {
        const get = (name) => rule.style.getPropertyValue(name);
        assert.match(get('transform'), /translateX\(-50%\)/, `centred (${media})`);
        assert.match(get('max-width'), /560px/, `capped on a wide window (${media})`);
        // The width must SUBTRACT the two insets. `100vw` alone is the old
        // full-bleed rail; `calc(100vw - 2 * inset)` is the pill.
        assert.match(get('width'), /calc\(100vw - \(?2 \* var\(--sf-dock-inset/,
            `the two side margins come from the single inset token (${media})`);
        assert.doesNotMatch(get('width'), /^\s*100vw\s*$/,
            `never a full-bleed rail (${media})`);
        assert.match(get('border-radius'), /34px/, `a pill, not a rectangle (${media})`);
    }

    const touchHides = hidden.filter((h) => h.media !== '(base)' && !/sf-keyboard-open/.test(h.selector));
    assert.deepEqual(touchHides, [],
        'no media query may hide the dock on a touch device: it is the primary navigation');
    dom.window.close();
});
