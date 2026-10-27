// Home playlists restoration chain — regression suite.
//
// The 2026-10-20 home (last version with playlists visibly on screen, proven by
// the user's own capture in docs/mobile-ui-redesign-2026-10-20.md) fed the
// "Vos playlists" section from the account's real playlists. Two regressions
// removed them again:
//   1. the 2026-10-24 "upgrade grid UI" switch made home paint through
//      createTile (two-column tiles) instead of the proven flat row factory;
//   2. the only data source left for the account's own playlists was the
//      libraryV3 GraphQL call, which fails on the user's device (reports show
//      no media: payload ever arrives) — leaving home without "Vos playlists".
//
// Restoration under test:
//   - home paints through the proven row factory again (useGrid stays false for
//     Accueil; the library browse grid keeps tiles);
//   - the real "Your Library" drawer links supplement home whenever libraryV3
//     did not deliver — real DOM links only, never invented rows.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function makeAnchor(href, text, imgSrc) {
    const img = imgSrc
        ? { getAttribute: (n) => (n === 'src' ? imgSrc : n === 'alt' ? text : null), src: imgSrc }
        : null;
    return {
        href,
        attrs: { href },
        innerText: text,
        textContent: text,
        getAttribute: (n) => (n === 'href' ? href : null),
        querySelector: (sel) => (sel === 'img' ? img : null),
        closest: (sel) => (sel === '#main-view' ? null : null)
    };
}

function runShell({ mediaLib, drawerAnchors = [], afterHooks } = {}) {
    const calls = [];
    const mainView = { querySelectorAll: () => [] };
    const drawer = {
        querySelectorAll: (sel) => (sel === 'a[href]' ? drawerAnchors : [])
    };
    const drawerSelectors = [
        '[data-testid="rootlist"]',
        '.Root__nav-bar',
        '[aria-label="Your Library"]',
        '[aria-label="Votre bibliothèque"]',
        '[aria-label="Library"]',
        '[aria-label="Bibliothèque"]',
        'nav[aria-label]'
    ];
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => {
            if (selector === '#main-view') return mainView;
            if (drawerSelectors.includes(selector)) return drawerAnchors.length ? drawer : null;
            return null;
        },
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            onNativeListText: (text) => calls.push({ screen: 'list-text-direct', data: text })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {},
        mediaLib
    });
    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });
    const hooks = Object.assign({
        home: window.__sfNativeRequestHome,
        notify: window.__sfNotifyMediaLibReady
    }, afterHooks || {});
    return { window, calls, hooks };
}

function homeRows(calls) {
    const home = calls.filter((c) => c.screen === 'home').pop();
    assert.ok(home, 'a home payload must be sent');
    return JSON.parse(home.data);
}

// ---------------------------------------------------------------------------
// 1. Real playlist data is received from the real drawer links
// ---------------------------------------------------------------------------

test('drawer playlists reach home as "Vos playlists" even when libraryV3 delivered nothing', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', 'Mes mix du jour'),
        makeAnchor('https://open.spotify.com/intl-fr/playlist/1a2B3c4D5e6F7g8H9i0J3K', 'Road Trip'),
        makeAnchor('https://open.spotify.com/collection/tracks', 'Titres likés'),
        makeAnchor('https://open.spotify.com/collection/playlists', 'Playlists'),
        makeAnchor('https://open.spotify.com/collection/albums', 'Albums'),
        makeAnchor('https://open.spotify.com/album/5QdFHhKpQ9Fv9gPZ9Z9Z9Z', 'Un album')
    ];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls);
    const mine = rows.filter((row) => row.section === 'Vos playlists');
    const byUri = (uri) => mine.find((row) => row.uri === uri);

    assert.ok(byUri('spotify:playlist:37i9dQZF1DXcBWIGoYBM5M'), 'real drawer playlist is kept');
    assert.ok(byUri('spotify:playlist:1a2B3c4D5e6F7g8H9i0J3K'), 'locale-prefixed drawer playlist is kept');
    assert.ok(mine.some((row) => /collection\/tracks/.test(row.uri)), 'liked songs entry is kept');
    // Sections and albums are navigation, not playlists.
    assert.ok(!mine.some((row) => /collection\/(playlists|albums)/.test(row.uri)), 'library sections are excluded');
    assert.ok(!rows.some((row) => row.uri === 'spotify:album:5QdFHhKpQ9Fv9gPZ9Z9Z9Z' && row.section === 'Vos playlists'), 'albums never pose as user playlists');
    assert.ok(mine.every((row) => row.title && row.title.length > 0), 'every row carries its real title');
});

test('drawer rows carry real cover URLs only', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/aaaa1111bbbb2222cccc3', 'Avec pochette', 'https://i.scdn.co/image/coverX'),
        makeAnchor('https://open.spotify.com/playlist/dddd4444eeee5555ffff6', 'Sans pochette')
    ];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls).filter((row) => row.section === 'Vos playlists');
    const withImg = rows.find((row) => row.title === 'Avec pochette');
    const withoutImg = rows.find((row) => row.title === 'Sans pochette');
    assert.equal(withImg.image, 'https://i.scdn.co/image/coverX', 'real cover URL is kept');
    assert.ok(!withoutImg.image, 'a missing cover stays missing — never a fake asset');
});

// ---------------------------------------------------------------------------
// 2. Data survives all the way to the home component
// ---------------------------------------------------------------------------

test('supplemented rows keep title, section and URI through JSON delivery', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/9Z9Z9Z9Z9Z9Z9Z9Z9Z9Z9Z', 'Playlist "test"')
    ];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls);
    const row = rows.find((r) => r.section === 'Vos playlists');
    assert.ok(row, 'the drawer row survives to the payload');
    assert.equal(row.title, 'Playlist "test"');
    assert.equal(row.uri, 'spotify:playlist:9Z9Z9Z9Z9Z9Z9Z9Z9Z9Z9Z');
});

test('drawer source supplements mediaLib instead of duplicating it', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', 'Mes mix du jour'),
        makeAnchor('https://open.spotify.com/playlist/onlyInDrawer1111111111', 'Uniquement dans le tiroir')
    ];
    const { window, calls } = runShell({
        mediaLib: {
            playlists: [{
                name: 'Mes mix du jour',
                uri: 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M',
                type: 'Playlist'
            }]
        },
        drawerAnchors
    });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls).filter((row) => row.section === 'Vos playlists');
    const dups = rows.filter((row) => row.uri === 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M');
    assert.equal(dups.length, 1, 'one URI is shown once');
    assert.ok(rows.some((row) => row.uri === 'spotify:playlist:onlyInDrawer1111111111'),
        'the drawer still adds playlists libraryV3 did not return');
});

// ---------------------------------------------------------------------------
// 3. Rows are really created (layout restoration contract)
// ---------------------------------------------------------------------------

test('home paints through the proven flat row factory, not the tile grid', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf(':native_content_ready');
    assert.ok(start > 0, 'renderNativeRows grid decision block must exist');
    const block = activity.slice(start, activity.indexOf(':check_lib_title_bis', start));

    // The home branches ("Accueil" title and nativeCurrentScreen "home") must
    // reach :native_screen_painted_track WITHOUT setting useGrid to 1: home rows
    // are restored to the proven row layout.
    const homeBranch = block.slice(0, block.indexOf(':check_lib_grid'));
    assert.ok(!/const\/4 v\d+, 0x1\s+sput-boolean v\d+, Lcom\/melodix\/music\/NativeHomeFeed;->useGrid:Z/.test(homeBranch),
        'the Accueil title branch must not enable the tile grid');
    const screenBranch = block.slice(block.indexOf(':check_lib_grid'));
    assert.ok(!/const\/4 v\d+, 0x1\s+sput-boolean v\d+, Lcom\/melodix\/music\/NativeHomeFeed;->useGrid:Z/.test(screenBranch),
        'the home-screen branch must not enable the tile grid');

    // The library browse screen keeps the tiles.
    const tail = activity.slice(activity.indexOf(':check_lib_title_bis'), activity.indexOf(':check_lib_title_bis', activity.indexOf(':check_lib_title_bis')) + 900);
    assert.ok(/const\/4 v\d+, 0x1\s+sput-boolean v\d+, Lcom\/melodix\/music\/NativeHomeFeed;->useGrid:Z/.test(tail),
        'the library grid is kept');
});

test('row factory falls back to the flat row when a card build fails', () => {
    const factory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    const create = factory.slice(factory.indexOf('.method public static create('), factory.indexOf('.end method'));
    assert.ok(create.includes(':native_row_list_mode'), 'the proven flat row path is kept');
    assert.ok(create.includes(':catch_tile'), 'a failing tile build never loses the row');
    const homeFeed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    assert.ok(homeFeed.includes('NativeUiRowFactory;->create('), 'paint really builds rows through the factory');
});

// ---------------------------------------------------------------------------
// 4. Real data is never replaced by an empty table
// ---------------------------------------------------------------------------

test('drawer data prevents both fake-empty and frozen-loading home states', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', 'Mes mix du jour')
    ];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls);
    assert.ok(rows.length > 0, 'home shows the real drawer rows');
    assert.ok(!rows.some((row) => /Aucune playlist dans ce compte/.test(row.title || '')),
        'a populated drawer can never paint the false empty state');
    assert.ok(!rows.some((row) => /Chargement des playlists/.test(row.title || '')),
        'a populated drawer can never paint the frozen loading state');
});

test('an empty mediaLib state does not wipe real drawer rows', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/aaaa1111bbbb2222cccc3', 'Survivante')
    ];
    const { window, calls } = runShell({
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] },
        drawerAnchors
    });
    window.__sfNativeRequestHome();
    const rows = homeRows(calls);
    assert.ok(rows.some((row) => row.title === 'Survivante' && row.section === 'Vos playlists'),
        'an empty library response never erases the real drawer playlists');
});

// ---------------------------------------------------------------------------
// 5. No CSS hiding / DOM selector incompatibility
// ---------------------------------------------------------------------------

test('drawer selectors cover the FR/EN web player drawer variants', () => {
    const shell = read('assets/native_ui_shell.js');
    for (const selector of [
        '[data-testid="rootlist"]',
        '[aria-label="Your Library"]',
        '[aria-label="Votre bibliothèque"]',
        '[aria-label="Bibliothèque"]',
        'nav[aria-label]'
    ]) {
        assert.ok(shell.includes(selector), `drawer selector ${selector} must be present`);
    }
    // The drawer scrape must never swallow home shelf cards.
    assert.ok(/anchor\.closest\('#main-view'\)/.test(shell), 'drawer links inside #main-view are excluded');
});

test('home rows carry no hidden CSS class or display-none marker', () => {
    const shell = read('assets/native_ui_shell.js');
    const section = shell.slice(shell.indexOf('function supplementHomeRowsWithLibrary'), shell.indexOf('function clearHomeRetry'));
    assert.ok(!/display\s*:\s*none|visibility\s*:\s*hidden/.test(section),
        'the supplement path never hides rows in CSS');
    assert.ok(!/\.style\.(display|visibility|opacity)/.test(section),
        'the supplement path never manipulates row visibility');
});

// ---------------------------------------------------------------------------
// 6. Data arriving before or after home initialisation
// ---------------------------------------------------------------------------

test('late mediaLib arrival repaints home with both sources', () => {
    const drawerAnchors = [
        makeAnchor('https://open.spotify.com/playlist/onlyInDrawer1111111111', 'Du tiroir')
    ];
    const { window, calls, hooks } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    assert.ok(homeRows(calls).some((row) => row.title === 'Du tiroir'), 'first paint uses the drawer');
    // libraryV3 answers late — the existing notify hook repaints home.
    window.mediaLib = { playlists: [{ name: 'Tardive', uri: 'spotify:playlist:late00000000000000000', type: 'Playlist' }] };
    hooks.notify();
    const rows = homeRows(calls);
    assert.ok(rows.some((row) => row.title === 'Tardive'), 'late mediaLib rows are painted');
    assert.ok(rows.some((row) => row.title === 'Du tiroir'), 'late mediaLib never wipes the drawer rows');
});

test('drawer arriving after first paint is picked up by the next update', () => {
    const shell = read('assets/native_ui_shell.js');
    // The web player populates its drawer after boot: the shell's
    // MutationObserver schedules an update on every relevant DOM mutation, so
    // a later pass reads the populated drawer (proven by the first contract)
    // and repaints home.
    assert.ok(/new window\.MutationObserver/.test(shell), 'a DOM mutation observer drives repaints');
    assert.ok(/mutationLooksRelevant\(mutations\)\)\s*scheduleUpdate\(\)/.test(shell),
        'relevant DOM mutations schedule an update');
    assert.ok(/function scheduleUpdate\(\)[\s\S]*?runUpdate\(\)/.test(shell),
        'the scheduled update really repaints (runUpdate)');
    // A second pass with a populated drawer delivers the rows (same chain).
    const drawerAnchors = [makeAnchor('https://open.spotify.com/playlist/lateDrawer00000000000', 'Tardive du tiroir')];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.__sfNativeRequestHome();
    assert.ok(homeRows(calls).some((row) => row.title === 'Tardive du tiroir'),
        'a later update reads the populated drawer');
});

// ---------------------------------------------------------------------------
// 7. Honesty: no secrets in delivered rows
// ---------------------------------------------------------------------------

test('home payloads never carry tokens, cookies or auth headers', () => {
    const drawerAnchors = [makeAnchor('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', 'Mes mix du jour')];
    const { window, calls } = runShell({ mediaLib: undefined, drawerAnchors });
    window.spotAuthToken = 'Bearer SECRET-TOKEN-VALUE';
    window.__sfNativeRequestHome();
    const home = calls.filter((c) => c.screen === 'home').pop();
    const raw = home ? home.data : '';
    assert.ok(!/document\.cookie|cookie\s*=|cookie:/i.test(raw), 'no cookie material');
    assert.ok(!/Bearer\s+[A-Za-z0-9]/.test(raw), 'no bearer token');
    assert.ok(!/SECRET-TOKEN-VALUE/.test(raw), 'the real token value never leaks');
});
