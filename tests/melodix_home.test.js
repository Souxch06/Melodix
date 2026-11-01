// Behavioural tests for the real Web Home renderer in a realistic jsdom page.
// They verify the source renderer and actual injected CSS together; these are
// not a substitute for a physical WebView/device render.
'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const { JSDOM } = require('jsdom');
const test = require('node:test');

const ROOT = path.resolve(__dirname, '..');
const rendererSource = fs.readFileSync(path.join(ROOT, 'scripts/melodix_home.source.js'), 'utf8');
const cssSource = fs.readFileSync(path.join(ROOT, 'assets/css_hacks.css'), 'utf8');

function cardMarkup({ type = 'playlist', id, href: customHref = '', title, subtitle = '', variant = 'testid', image = true }) {
    const href = customHref || `/${type}/${id}`;
    const artwork = image ? `<img src="https://i.scdn.co/image/${id}" alt="${title} artwork">` : '';
    if (variant === 'encore') {
        return `<article data-encore-id="card">
            <a href="${href}" aria-label="${title}">
                ${artwork}<span data-encore-id="cardTitle">${title}</span>
                ${subtitle ? `<span data-encore-id="cardSubtitle">${subtitle}</span>` : ''}
            </a>
        </article>`;
    }
    if (variant === 'article') {
        return `<li role="listitem"><article>
            <a href="${href}">${artwork}<h3 role="heading">${title}</h3>
                ${subtitle ? `<span>${subtitle}</span>` : ''}
            </a>
        </article></li>`;
    }
    return `<div data-testid="card"><a href="${href}">
        ${artwork}<span data-testid="card-title">${title}</span>
        ${subtitle ? `<span data-testid="card-subtitle">${subtitle}</span>` : ''}
    </a></div>`;
}

function makePage({
    path: pathname = '/',
    host = 'open.spotify.com',
    guiMode = 'csshack',
    cards = [],
    includeCss = true,
    marker = true,
    initialize = true,
    rootVariant = 'main-view',
    sessionProven = true,
    libraryStatus = 'pending',
    libraryError = '',
    rawItemCount = 0,
    mediaLibSessionProofKnown = false,
    mediaLibSessionProven = false,
    mediaLib
} = {}) {
    const sectionBody = cards.map((card) => cardMarkup(card)).join('\n');
    const content = `<section data-testid="shelf"><h2>Vos recommandations</h2>${sectionBody}</section>`;
    const original = rootVariant === 'semantic-main'
        ? `<main id="spotify-home-content" data-testid="home-page">${content}</main>`
        : rootVariant === 'bounded-fallback'
            ? `<div id="app-shell"><div id="spotify-home-content">${content}</div></div>`
            : rootVariant === 'no-root' ? '' : `<main id="main-view">${content}</main>`;
    let css = cssSource;
    if (!marker) css = css.replace('SF_MELODIX_HOME_STYLES_V1', 'SF_MELODIX_HOME_STYLES_REMOVED');
    const style = includeCss ? `<style id="sf-custom-style">${css}</style>` : '';
    const dom = new JSDOM(`<!doctype html><html lang="fr"><head>${style}</head><body>${original}</body></html>`, {
        url: `https://${host}${pathname}`,
        runScripts: 'outside-only',
        pretendToBeVisual: true
    });
    const { window } = dom;
    const traces = [];
    window.SF_CONFIG = { guiMode };
    // Renderer fixtures explicitly model the native shell's authenticated
    // session proof. Tests for the unauthenticated gate set this false.
    window.__sfNativeUiSessionProven = sessionProven;
    window.__sfMediaLibSessionProofKnown = mediaLibSessionProofKnown;
    window.__sfMediaLibSessionProven = mediaLibSessionProven;
    window.__sfMediaLibStatus = libraryStatus;
    window.__sfMediaLibError = libraryError;
    window.__sfMediaLibRawItemCount = rawItemCount;
    if (mediaLib !== undefined) window.mediaLib = mediaLib;
    window.__sfMelodixHomeTestMode = true;
    window.__sfBridgeTrace = (line) => traces.push(String(line));
    if (initialize) vm.runInContext(rendererSource, dom.getInternalVMContext(), { timeout: 5000 });
    return { dom, window, document: window.document, traces };
}

function close(page) {
    page.dom.window.close();
}

function homeElement(page) {
    return page.document.getElementById('sf-melodix-home');
}

function assertWebHomeVisible(page, expectedCards, sourceSelector = '#main-view') {
    const home = homeElement(page);
    const main = page.document.querySelector(sourceSelector);
    assert.ok(home, 'custom Home root exists');
    assert.equal(home.querySelectorAll('.sf-melodix-home__card').length, expectedCards);
    assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), true);
    const homeStyle = page.window.getComputedStyle(home);
    const mainStyle = page.window.getComputedStyle(main);
    assert.equal(homeStyle.display, 'flex', 'Home is laid out, not merely present in the DOM');
    assert.equal(homeStyle.position, 'fixed', 'Home covers the intended viewport');
    assert.equal(homeStyle.visibility, 'visible');
    assert.notEqual(homeStyle.opacity, '0');
    assert.ok(Number.parseInt(homeStyle.zIndex, 10) >= 1000, 'Home wins the page stacking order');
    assert.equal(mainStyle.display, 'none', 'the original Spotify main view is hidden only after Home is visible');
}

test('csshack and bigwindow render real cards on every Spotify Home entry route with verified computed styles', () => {
    for (const guiMode of ['csshack', 'bigwindow']) {
        for (const pathname of ['/', '/home', '/app']) {
            const page = makePage({
                path: pathname,
                guiMode,
                cards: [
                    { id: `a-${guiMode}-${pathname.length}`, title: 'Mix réel A', subtitle: 'Artiste A' },
                    { id: `b-${guiMode}-${pathname.length}`, type: 'album', title: 'Album réel B', subtitle: 'Artiste B' }
                ]
            });
            try {
                assertWebHomeVisible(page, 2);
                assert.equal(page.window.__sfMelodixHomeDecision, 'rendered');
                assert.equal(page.window.__sfMelodixHomeGuiMode, guiMode);
                assert.equal(page.window.__sfMelodixHomeStylesReady, true);
                assert.equal(page.window.__sfMelodixHomeSourceCardCount, 2);
                assert.equal(page.window.__sfMelodixHomeRoute, 'home');
                assert.ok(page.traces.some((line) => line.includes(`mode=${guiMode}`) && line.includes('styles=1')));
                assert.deepEqual(
                    Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
                    ['Mix réel A', 'Album réel B'],
                    'titles come from Spotify card text, not generated content'
                );
            } finally {
                close(page);
            }
        }
    }
});

test('Home renderer waits for the native CSS injection and activates when its style-ready event arrives', async () => {
    const page = makePage({
        path: '/app',
        guiMode: 'csshack',
        includeCss: false,
        cards: [
            { id: 'late-css-1', title: 'Vraie playlist après CSS' },
            { id: 'late-css-2', type: 'album', title: 'Vrai album après CSS' }
        ]
    });
    try {
        assert.equal(page.window.__sfMelodixHomeDecision, 'styles-not-ready');
        assert.equal(homeElement(page), null, 'the missing stylesheet must not hide Spotify');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);

        const style = page.document.createElement('style');
        style.id = 'sf-custom-style';
        style.textContent = cssSource;
        page.document.head.appendChild(style);
        page.window.dispatchEvent(new page.window.Event('sf-melodix-home-styles-ready'));
        await new Promise((resolve) => page.window.setTimeout(resolve, 180));

        assertWebHomeVisible(page, 2);
        assert.ok(['rendered', 'visible'].includes(page.window.__sfMelodixHomeDecision));
        assert.equal(page.window.__sfMelodixHomeStylesReady, true);
    } finally {
        close(page);
    }
});

test('semantic Home roots without #main-view render real cards and hide only the verified source root', () => {
    const page = makePage({
        rootVariant: 'semantic-main',
        cards: [
            { id: 'semantic-1', title: 'Vraie recommandation A' },
            { id: 'semantic-2', type: 'album', title: 'Vrai album B' }
        ]
    });
    try {
        assert.equal(page.document.getElementById('main-view'), null, 'the fixture has no legacy root ID');
        assertWebHomeVisible(page, 2, '[data-testid="home-page"]');
        assert.equal(page.window.__sfMelodixHomeRootSelector, '[data-testid="home-page"]');
        assert.equal(page.document.querySelector('[data-sf-melodix-source-root]'),
            page.document.getElementById('spotify-home-content'));
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered');
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Vraie recommandation A', 'Vrai album B'],
            'the replacement is collected from Spotify links and visible card text'
        );
    } finally {
        close(page);
    }
});

test('bounded real-link fallback finds Home shelves, and one real card is enough to render', () => {
    const page = makePage({
        rootVariant: 'bounded-fallback',
        cards: [
            { id: 'fallback-1', title: 'Vraie playlist fallback A' },
            { id: 'fallback-2', type: 'artist', title: 'Vrai artiste fallback B', image: false }
        ]
    });
    try {
        assert.equal(page.document.getElementById('main-view'), null);
        assert.equal(page.document.querySelector('[role="main"], [data-testid="home-page"]'), null,
            'the fixture has no semantic content root');
        assertWebHomeVisible(page, 2, '[data-sf-melodix-source-root]');
        assert.match(page.window.__sfMelodixHomeRootSelector, /^fallback:/);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered');
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Vraie playlist fallback A', 'Vrai artiste fallback B']
        );
    } finally {
        close(page);
    }

    const oneCard = makePage({
        rootVariant: 'bounded-fallback',
        cards: [{ id: 'fallback-only', title: 'Une seule vraie carte' }]
    });
    try {
        assertWebHomeVisible(oneCard, 1, '[data-sf-melodix-source-root]');
        assert.equal(oneCard.window.__sfMelodixHomeDecision, 'rendered');
        assert.equal(oneCard.window.__sfMelodixHomeSourceCardCount, 1);
        assert.deepEqual(
            Array.from(homeElement(oneCard).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Une seule vraie carte']
        );
    } finally {
        close(oneCard);
    }
});

test('authenticated account-library entries supplement Home using only real Spotify URIs', () => {
    const page = makePage({
        cards: [],
        libraryStatus: 'ready',
        mediaLib: {
            playlists: [{ id: 'spotify:playlist:real-playlist-id', name: 'Playlist du compte', image: 'https://i.scdn.co/image/playlist' }],
            albums: [{ id: 'spotify:album:real-album-id', name: 'Album du compte', artists: ['Artiste réel'] }],
            artists: [],
            podcasts: []
        }
    });
    try {
        assertWebHomeVisible(page, 2);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered');
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Playlist du compte', 'Album du compte']
        );
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__section-title'), (node) => node.textContent),
            ['Vos playlists', 'Albums enregistrés']
        );
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__status'), null,
            'real account content is shown without a false empty/loading panel');
        assert.equal(page.window.__sfMelodixHomeSourceCardCount, 2);
    } finally {
        close(page);
    }
});

test('authenticated empty, loading and failed collection states stay inside a visible Melodix Home', () => {
    const loading = makePage({ cards: [], libraryStatus: 'pending' });
    try {
        assertWebHomeVisible(loading, 0);
        assert.equal(loading.window.__sfMelodixHomeDecision, 'rendered-status-loading');
        assert.equal(homeElement(loading).querySelector('.sf-melodix-home__status').dataset.state, 'loading');
        assert.ok(homeElement(loading).querySelector('.sf-melodix-home__retry'),
            'a stalled pending collection exposes a manual retry');
    } finally {
        close(loading);
    }

    const empty = makePage({
        cards: [],
        sessionProven: false,
        libraryStatus: 'ready',
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true,
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] }
    });
    try {
        assertWebHomeVisible(empty, 0);
        assert.equal(empty.window.__sfMelodixHomeDecision, 'rendered-status-empty');
        assert.equal(homeElement(empty).querySelector('.sf-melodix-home__status').dataset.state, 'empty');
        assert.equal(homeElement(empty).querySelector('.sf-melodix-home__retry'), null,
            'an honestly empty settled library is not presented as an error');
    } finally {
        close(empty);
    }

    const unparsed = makePage({
        cards: [],
        libraryStatus: 'ready',
        rawItemCount: 1,
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] }
    });
    try {
        assertWebHomeVisible(unparsed, 0);
        const status = homeElement(unparsed).querySelector('.sf-melodix-home__status');
        assert.equal(status.dataset.state, 'error',
            'a non-empty API response that did not parse into real resources is not mislabeled empty');
        assert.notEqual(status.querySelector('.sf-melodix-home__status-title').textContent, 'Aucun contenu enregistré');
        assert.ok(status.querySelector('.sf-melodix-home__retry'));
    } finally {
        close(unparsed);
    }

    const failed = makePage({ cards: [], libraryStatus: 'error', libraryError: 'http-503' });
    let retryCount = 0;
    failed.window.__sfNativeRetryLibrary = () => { retryCount += 1; };
    try {
        assertWebHomeVisible(failed, 0);
        const status = homeElement(failed).querySelector('.sf-melodix-home__status');
        assert.equal(failed.window.__sfMelodixHomeDecision, 'rendered-status-error');
        assert.equal(status.dataset.state, 'error');
        assert.match(status.textContent, /indisponible/i);
        status.querySelector('.sf-melodix-home__retry').click();
        assert.equal(retryCount, 1, 'the Melodix error state invokes the real retry hook');
        assert.equal(failed.document.body.classList.contains('sf-melodix-home-active'), true,
            'a failed fetch does not hand the authenticated Home back to Spotify');
    } finally {
        close(failed);
    }

    const sessionFailure = makePage({
        cards: [],
        // The native shell has an independent profile-control proof here; the
        // API's 401 changes library state but does not silently revoke that proof.
        sessionProven: true,
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryStatus: 'error',
        libraryError: 'token-missing'
    });
    try {
        assertWebHomeVisible(sessionFailure, 0);
        const status = homeElement(sessionFailure).querySelector('.sf-melodix-home__status');
        const action = status.querySelector('.sf-melodix-home__retry');
        assert.equal(status.dataset.state, 'error');
        assert.equal(action.dataset.action, 'spotify-sign-in');
        assert.equal(action.textContent, 'Se reconnecter');
        assert.match(status.textContent, /session Spotify doit être rétablie/i);
    } finally {
        close(sessionFailure);
    }
});

test('a verified private library response can open Home and render the real account data', async () => {
    const page = makePage({ cards: [], sessionProven: false, libraryStatus: 'pending' });
    try {
        assert.equal(homeElement(page), null,
            'without a prior session proof the renderer leaves Spotify visible while the request is pending');
        assert.equal(page.window.__sfMelodixHomeDecision, 'session-unproven');
        page.window.mediaLib = {
            playlists: [{ uri: 'spotify:playlist:late-real-id', name: 'Playlist arrivée après le chargement' }],
            albums: [], artists: [], podcasts: []
        };
        page.window.__sfMediaLibStatus = 'ready';
        page.window.__sfMediaLibSessionProofKnown = true;
        page.window.__sfMediaLibSessionProven = true;
        page.window.dispatchEvent(new page.window.Event('sf-media-library-state-changed'));
        await new Promise((resolve) => page.window.setTimeout(resolve, 120));
        assert.equal(homeElement(page).querySelectorAll('.sf-melodix-home__card').length, 1);
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__title').textContent,
            'Playlist arrivée après le chargement');
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__status'), null);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered',
            'the first valid response opens the renderer rather than updating a previously active shell');
    } finally {
        close(page);
    }
});

test('partial library errors preserve real cards and show a recoverable warning', () => {
    const page = makePage({
        cards: [],
        libraryStatus: 'error',
        libraryError: 'http-429',
        mediaLib: {
            playlists: [{ uri: 'spotify:playlist:real-partial-id', name: 'Playlist reçue' }],
            albums: [], artists: [], podcasts: []
        }
    });
    try {
        assertWebHomeVisible(page, 1);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered-partial');
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__title').textContent, 'Playlist reçue');
        const status = homeElement(page).querySelector('.sf-melodix-home__status');
        assert.equal(status.dataset.state, 'error');
        assert.match(status.querySelector('.sf-melodix-home__status-title').textContent, /Certaines données/);
        assert.match(status.textContent, /limite temporairement/i);
        assert.ok(status.querySelector('.sf-melodix-home__retry'));
        assert.equal(page.window.__sfMelodixHomeSourceCardCount, 1);
    } finally {
        close(page);
    }
});

test('a proven session can render an actionable status even if Spotify replaced its main root', () => {
    const page = makePage({
        rootVariant: 'no-root',
        cards: [],
        libraryStatus: 'error',
        libraryError: 'fetch-parse-error'
    });
    try {
        const home = homeElement(page);
        assert.ok(home);
        assert.equal(page.window.__sfMelodixHomeRootSelector, 'none');
        assert.equal(page.window.__sfMelodixHomeSourceCardCount, 0);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered-status-error');
        assert.equal(home.querySelector('.sf-melodix-home__status').dataset.state, 'error');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), true);
        const style = page.window.getComputedStyle(home);
        assert.equal(style.display, 'flex');
        assert.equal(style.position, 'fixed');
        assert.equal(style.visibility, 'visible');
    } finally {
        close(page);
    }
});

test('locale routes and real alternative Encore/article/listitem card structures are collected', () => {
    const page = makePage({
        path: '/intl-fr/home',
        guiMode: 'csshack',
        cards: [
            { id: 'encore-1', title: 'Daily Mix réel', subtitle: 'Choisi pour vous', variant: 'encore' },
            { id: 'article-2', type: 'artist', title: 'Artiste réel', variant: 'article', image: false },
            { id: 'testid-3', type: 'album', title: 'Album réel C' },
            { id: 'track-4', type: 'track', title: 'Piste réelle D' },
            { id: 'show-5', type: 'show', title: 'Émission réelle E' },
            { id: 'episode-6', type: 'episode', href: '/intl-fr/episode/episode-6', title: 'Épisode réel F' },
            { id: 'audiobook-7', type: 'audiobook', title: 'Livre audio réel G' },
            { id: 'tracks', type: 'collection', title: 'Titres likés réels' }
        ]
    });
    try {
        assertWebHomeVisible(page, 8);
        assert.equal(page.window.__sfHomeTest.melodixHomeRoutePath(), '/home');
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Daily Mix réel', 'Artiste réel', 'Album réel C', 'Piste réelle D',
                'Émission réelle E', 'Épisode réel F', 'Livre audio réel G', 'Titres likés réels']
        );
        const sourceSections = page.window.__sfHomeTest.collectMelodixHomeSections(
            page.document.getElementById('main-view'), new Set()
        );
        const sourceCards = Array.from(sourceSections.flatMap((section) => section.cards));
        assert.deepEqual(
            sourceCards.map((card) => card.resourcePath),
            ['/playlist/encore-1', '/artist/article-2', '/album/testid-3', '/track/track-4',
                '/show/show-5', '/episode/episode-6', '/audiobook/audiobook-7', '/collection/tracks'],
            'true resource types and the real Liked Songs collection are normalized without inventing ids'
        );
        assert.deepEqual(sourceCards.map((card) => card.href), [
            'https://open.spotify.com/playlist/encore-1',
            'https://open.spotify.com/artist/article-2',
            'https://open.spotify.com/album/testid-3',
            'https://open.spotify.com/track/track-4',
            'https://open.spotify.com/show/show-5',
            'https://open.spotify.com/intl-fr/episode/episode-6',
            'https://open.spotify.com/audiobook/audiobook-7',
            'https://open.spotify.com/collection/tracks'
        ]);
        assert.equal(homeElement(page).querySelectorAll('img.sf-melodix-home__artwork').length, 7,
            'cards without real artwork still render their real text and URI');
        assert.equal(page.window.__sfNativeUiHomeRowsCount, undefined,
            'the Web renderer does not depend on native row state');
    } finally {
        close(page);
    }
});

test('the Web card tap activates Spotify’s original real link rather than inventing navigation', () => {
    const page = makePage({
        cards: [
            { id: 'click-1', title: 'Vraie playlist 1' },
            { id: 'click-2', type: 'album', title: 'Vrai album 2' }
        ]
    });
    try {
        assertWebHomeVisible(page, 2);
        const source = page.document.querySelector('#main-view a[href="/playlist/click-1"]');
        let sourceClicks = 0;
        source.addEventListener('click', (event) => {
            sourceClicks += 1;
            event.preventDefault();
        });
        homeElement(page).querySelector('.sf-melodix-home__card').click();
        assert.equal(sourceClicks, 1, 'the existing Spotify anchor receives the activation');
    } finally {
        close(page);
    }
});

test('an empty mediaLib object or generic ready state cannot prove an authenticated session', () => {
    const page = makePage({
        cards: [],
        sessionProven: false,
        libraryStatus: 'ready',
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] }
    });
    try {
        assert.equal(homeElement(page), null);
        assert.equal(page.window.__sfMelodixHomeDecision, 'session-unproven');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.equal(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'block');
    } finally {
        close(page);
    }
});

test('unproven sessions, non-Home routes and unsupported GUI modes never hide Spotify', () => {
    const cases = [
        { path: '/', cards: [], guiMode: 'csshack', sessionProven: false, decision: 'session-unproven' },
        { path: '/home', cards: [{ id: 'only-one', title: 'Une vraie carte' }], guiMode: 'bigwindow', sessionProven: false, decision: 'session-unproven' },
        { path: '/playlist/real-id', cards: [{ id: 'p1', title: 'Titre A' }, { id: 'p2', title: 'Titre B' }], guiMode: 'csshack', decision: 'route-not-home' },
        { path: '/', cards: [{ id: 'p1', title: 'Titre A' }, { id: 'p2', title: 'Titre B' }], guiMode: 'compact', decision: 'gui-mode-unsupported' }
    ];
    for (const entry of cases) {
        const page = makePage(entry);
        try {
            assert.equal(homeElement(page), null);
            assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
            assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
            assert.equal(page.window.__sfMelodixHomeDecision, entry.decision);
            assert.equal(page.window.__sfMelodixHomeGuiMode,
                ['csshack', 'bigwindow'].includes(entry.guiMode) ? entry.guiMode : 'other');
            if (entry.decision === 'session-unproven') {
                assert.equal(page.window.__sfMelodixHomeSessionProven, false);
                assert.equal(page.document.querySelector('[data-sf-melodix-source-root]'), null,
                    'neither a zero-card nor one-card unauthenticated page is marked for hiding');
            }
        } finally {
            close(page);
        }
    }
});

test('the Web Home waits for the native shell proof and updates when that proof arrives', async () => {
    const page = makePage({ cards: [], sessionProven: false, libraryStatus: 'pending' });
    try {
        assert.equal(homeElement(page), null);
        assert.equal(page.window.__sfMelodixHomeDecision, 'session-unproven');
        page.window.__sfNativeUiSessionProven = true;
        page.window.dispatchEvent(new page.window.Event('sf-native-ui-session-proof-changed'));
        await new Promise((resolve) => page.window.setTimeout(resolve, 120));
        assert.ok(homeElement(page));
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered-status-loading');
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__status').dataset.state, 'loading');
        assert.equal(page.window.__sfMelodixHomeSessionProven, true);
    } finally {
        close(page);
    }
});

test('the Home renderer works without AndBridge and cannot fail closed on trace-callback errors', () => {
    const page = makePage({
        cards: [{ id: 'no-bridge-1', title: 'Vraie playlist A' }, { id: 'no-bridge-2', type: 'album', title: 'Vrai album B' }]
    });
    try {
        assert.equal(page.window.AndBridge, undefined, 'the Web Home renderer is independently executable');
        const nativeTrace = [];
        page.window.AndBridge = {
            onNativeUiData: null,
            onNativeUiReady: null,
            logDiagEvent: (line) => nativeTrace.push(String(line))
        };
        page.window.__sfBridgeTrace = () => { throw new Error('diagnostic callback failed'); };
        page.window.__sfHomeTest.updateMelodixHome();
        assertWebHomeVisible(page, 2);
        assert.equal(page.window.__sfMelodixHomeDecision, 'visible');
        assert.ok(nativeTrace.some((line) => line.includes('home-web visible')),
            'a direct native trace is used when the bridge trace callback fails');
    } finally {
        close(page);
    }
});

test('an initialization error is bounded and leaves the original Spotify page untouched', () => {
    const page = makePage({
        initialize: false,
        cards: [{ id: 'error-1', title: 'Vraie playlist A' }, { id: 'error-2', title: 'Vrai album B', type: 'album' }]
    });
    try {
        page.window.addEventListener = () => { throw new Error('simulated policy/CSP hook failure'); };
        vm.runInContext(rendererSource, page.dom.getInternalVMContext(), { timeout: 5000 });
        assert.equal(homeElement(page), null);
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
        assert.equal(page.window.__sfMelodixHomeInitErrors, 1);
        assert.ok(page.traces.some((line) => line.includes('home-web bootstrap-error Error')));
    } finally {
        close(page);
    }
});

test('missing/incomplete injected CSS and a failed style probe leave the original page visible', () => {
    for (const config of [
        { includeCss: false, marker: true },
        { includeCss: true, marker: false }
    ]) {
        const page = makePage({
            ...config,
            cards: [{ id: 'style-a', title: 'Playlist A' }, { id: 'style-b', title: 'Album B', type: 'album' }]
        });
        try {
            assert.equal(homeElement(page), null);
            assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
            assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
            assert.equal(page.window.__sfMelodixHomeDecision, 'styles-not-ready');
            assert.equal(page.window.__sfMelodixHomeStylesReady, false);
        } finally {
            close(page);
        }
    }

    const brokenProbe = makePage({
        cards: [{ id: 'probe-a', title: 'Playlist A' }, { id: 'probe-b', title: 'Album B', type: 'album' }]
    });
    try {
        const originalGetComputedStyle = brokenProbe.window.getComputedStyle.bind(brokenProbe.window);
        brokenProbe.window.getComputedStyle = () => { throw new Error('CSP/style probe failure'); };
        brokenProbe.window.__sfHomeTest.updateMelodixHome();
        assert.equal(homeElement(brokenProbe), null);
        assert.equal(brokenProbe.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.notEqual(originalGetComputedStyle(brokenProbe.document.getElementById('main-view')).display, 'none');
        assert.equal(brokenProbe.window.__sfMelodixHomeDecision, 'styles-not-ready');
    } finally {
        close(brokenProbe);
    }
});

test('live computed-style declarations are snapshotted before the style-probe class is removed', () => {
    const page = makePage({
        path: '/app',
        initialize: false,
        cards: [{ id: 'snapshot-a', title: 'Vraie playlist A' }, { id: 'snapshot-b', type: 'album', title: 'Vrai album B' }]
    });
    const originalGetComputedStyle = page.window.getComputedStyle.bind(page.window);
    const body = page.document.body;
    let liveProbeReads = 0;
    page.window.MutationObserver = undefined;
    page.window.getComputedStyle = (element) => {
        const probing = body.classList.contains('sf-melodix-home-style-probe');
        if (!probing || !element || !['sf-melodix-home', 'main-view'].includes(element.id)) {
            return originalGetComputedStyle(element);
        }
        liveProbeReads += 1;
        if (element.id === 'sf-melodix-home') {
            return {
                get display() { return body.classList.contains('sf-melodix-home-style-probe') ? 'flex' : 'block'; },
                get position() { return 'fixed'; },
                get visibility() { return 'visible'; },
                get opacity() { return '1'; },
                get zIndex() { return '10001'; }
            };
        }
        return {
            get display() { return body.classList.contains('sf-melodix-home-style-probe') ? 'none' : 'block'; }
        };
    };
    try {
        vm.runInContext(rendererSource, page.dom.getInternalVMContext(), { timeout: 5000 });

        assert.equal(liveProbeReads, 2, 'both computed declarations are read while the probe class is active');
        assertWebHomeVisible(page, 2);
        assert.equal(page.window.__sfMelodixHomeDecision, 'rendered');
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.home_display_flex, true);
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.main_hidden, true);
    } finally {
        close(page);
    }
});

test('late-mounted Spotify cards replace the explicit loading state when real data arrives', async () => {
    const page = makePage({ cards: [], libraryStatus: 'pending' });
    try {
        assert.equal(homeElement(page).querySelector('.sf-melodix-home__status').dataset.state, 'loading');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), true);
        const main = page.document.getElementById('main-view');
        const shelf = main.querySelector('section');
        shelf.insertAdjacentHTML('beforeend',
            cardMarkup({ id: 'late-1', title: 'Chargement tardif A' }) +
            cardMarkup({ id: 'late-2', title: 'Chargement tardif B', type: 'album' }));
        page.window.__sfHomeTest.updateMelodixHome();
        assertWebHomeVisible(page, 2);
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Chargement tardif A', 'Chargement tardif B']
        );
    } finally {
        close(page);
    }
});

test('SPA search/library/detail transitions and browser back preserve the Spotify page and restore Home', async () => {
    const page = makePage({
        path: '/app',
        cards: [{ id: 'route-1', title: 'Playlist A' }, { id: 'route-2', type: 'album', title: 'Album B' }]
    });
    try {
        assertWebHomeVisible(page, 2);

        for (const route of ['/search', '/collection/playlists']) {
            page.window.history.pushState({}, '', route);
            await new Promise((resolve) => page.window.setTimeout(resolve, 100));
            assert.equal(homeElement(page), null, `${route}: Web Home does not cover a non-Home route`);
            assert.equal(page.window.__sfMelodixHomeDecision, 'route-not-home');
            assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
        }

        page.window.history.back();
        await new Promise((resolve) => page.window.setTimeout(resolve, 120));
        assert.equal(page.window.location.pathname, '/search');
        assert.equal(homeElement(page), null, 'back to search leaves the Spotify page visible');

        page.window.history.back();
        await new Promise((resolve) => page.window.setTimeout(resolve, 120));
        assert.equal(page.window.location.pathname, '/app');
        assertWebHomeVisible(page, 2);

        page.window.history.pushState({}, '', '/playlist/route-2');
        await new Promise((resolve) => page.window.setTimeout(resolve, 100));
        assert.equal(homeElement(page), null, 'detail routes also restore Spotify content');
        assert.equal(page.window.document.body.classList.contains('sf-melodix-home-active'), false);

        page.window.history.pushState({}, '', '/intl-fr/home');
        await new Promise((resolve) => page.window.setTimeout(resolve, 100));
        assertWebHomeVisible(page, 2);
        assert.equal(page.window.__sfMelodixHomeRoute, 'home');
    } finally {
        close(page);
    }
});

test('bounded decisions expose only screen category, safe mode, styles and counts without masking the page', () => {
    const page = makePage({
        guiMode: 'unknown-mode',
        cards: [{ id: 'diag-1', title: 'Playlist A' }, { id: 'diag-2', title: 'Album B', type: 'album' }]
    });
    try {
        page.window.__sfHomeTest.updateMelodixHome();
        page.window.__sfHomeTest.updateMelodixHome();
        const matching = page.traces.filter((line) => line.includes('home-web gui-mode-unsupported'));
        assert.equal(matching.length, 1, 'identical decisions are throttled');
        assert.match(matching[0], /mode=other screen=home styles=0 session=[?] library=pending cards=0 sections=0 root=[?]/);
        assert.doesNotMatch(matching[0], /route=|#main-view|data-testid|selector/i,
            'diagnostics never retain a route or DOM selector');
        assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
    } finally {
        close(page);
    }
});
