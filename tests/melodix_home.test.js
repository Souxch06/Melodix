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

function cardMarkup({ type = 'playlist', id, title, subtitle = '', variant = 'testid', image = true }) {
    const href = `/${type}/${id}`;
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
    rootVariant = 'main-view'
} = {}) {
    const sectionBody = cards.map((card) => cardMarkup(card)).join('\n');
    const content = `<section data-testid="shelf"><h2>Vos recommandations</h2>${sectionBody}</section>`;
    const original = rootVariant === 'semantic-main'
        ? `<main id="spotify-home-content" data-testid="home-page">${content}</main>`
        : rootVariant === 'bounded-fallback'
            ? `<div id="app-shell"><div id="spotify-home-content">${content}</div></div>`
            : `<main id="main-view">${content}</main>`;
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

test('bounded real-link fallback finds a Home shelf without semantic roots and never hides a one-card page', () => {
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
        assert.equal(homeElement(oneCard), null);
        assert.equal(oneCard.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.equal(oneCard.document.querySelector('[data-sf-melodix-source-root]'), null,
            'the source root is not marked hidden before the real-card gate is satisfied');
        assert.notEqual(oneCard.window.getComputedStyle(oneCard.document.querySelector('#spotify-home-content')).display, 'none');
    } finally {
        close(oneCard);
    }
});

test('locale routes and real alternative Encore/article/listitem card structures are collected', () => {
    const page = makePage({
        path: '/intl-fr/home',
        guiMode: 'csshack',
        cards: [
            { id: 'encore-1', title: 'Daily Mix réel', subtitle: 'Choisi pour vous', variant: 'encore' },
            { id: 'article-2', type: 'artist', title: 'Artiste réel', variant: 'article', image: false },
            { id: 'testid-3', type: 'album', title: 'Album réel C' }
        ]
    });
    try {
        assertWebHomeVisible(page, 3);
        assert.equal(page.window.__sfHomeTest.melodixHomeRoutePath(), '/home');
        assert.deepEqual(
            Array.from(homeElement(page).querySelectorAll('.sf-melodix-home__title'), (node) => node.textContent),
            ['Daily Mix réel', 'Artiste réel', 'Album réel C']
        );
        assert.equal(homeElement(page).querySelectorAll('img.sf-melodix-home__artwork').length, 2,
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

test('empty DOM, one card, non-home routes and unsupported GUI modes never hide Spotify', () => {
    const cases = [
        { path: '/', cards: [], guiMode: 'csshack', decision: 'insufficient-real-cards' },
        { path: '/home', cards: [{ id: 'only-one', title: 'Une vraie carte' }], guiMode: 'bigwindow', decision: 'insufficient-real-cards' },
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
        } finally {
            close(page);
        }
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
        assert.ok(homeElement(brokenProbe), 'the failed style check keeps only a hidden renderer root');
        assert.equal(homeElement(brokenProbe).style.display, 'none');
        assert.equal(brokenProbe.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.notEqual(originalGetComputedStyle(brokenProbe.document.getElementById('main-view')).display, 'none');
        assert.equal(brokenProbe.window.__sfMelodixHomeDecision, 'styles-not-ready');
    } finally {
        close(brokenProbe);
    }
});

test('a transient Android-style computed-CSS delay is retried before Home activation', async () => {
    const page = makePage({
        path: '/app',
        initialize: false,
        cards: [{ id: 'retry-a', title: 'Vraie playlist A' }, { id: 'retry-b', type: 'album', title: 'Vrai album B' }]
    });
    const originalGetComputedStyle = page.window.getComputedStyle.bind(page.window);
    let delayedHomeStyleReads = 0;
    page.window.MutationObserver = undefined;
    page.window.getComputedStyle = (element) => {
        const actual = originalGetComputedStyle(element);
        if (element && element.id === 'sf-melodix-home' &&
            page.document.body.classList.contains('sf-melodix-home-style-probe') && delayedHomeStyleReads === 0) {
            delayedHomeStyleReads += 1;
            return {
                display: 'block', position: actual.position, visibility: actual.visibility,
                opacity: actual.opacity, zIndex: actual.zIndex
            };
        }
        return actual;
    };
    try {
        vm.runInContext(rendererSource, page.dom.getInternalVMContext(), { timeout: 5000 });
        assert.equal(page.window.__sfMelodixHomeDecision, 'styles-not-ready');
        assert.equal(homeElement(page).style.display, 'none');
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.home_display_flex, false,
            'the first renderer-owned probe records the transient CSS mismatch');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);

        await new Promise((resolve) => page.window.setTimeout(resolve, 450));

        assert.equal(delayedHomeStyleReads, 1, 'the first computed-style read simulates late WebView CSS application');
        assertWebHomeVisible(page, 2);
        assert.ok(['rendered', 'updated', 'visible'].includes(page.window.__sfMelodixHomeDecision));
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.home_display_flex, true);
        assert.equal(page.window.__sfHomeTest.styleRetryCount(), 0, 'successful computed styles clear retry state');
    } finally {
        close(page);
    }
});

test('persistent CSS readiness failure is bounded and never hides the original Spotify root', async () => {
    const page = makePage({
        initialize: false,
        cards: [{ id: 'bounded-a', title: 'Playlist réelle A' }, { id: 'bounded-b', type: 'album', title: 'Album réel B' }]
    });
    const originalGetComputedStyle = page.window.getComputedStyle.bind(page.window);
    page.window.MutationObserver = undefined;
    page.document.getElementById('sf-custom-style').textContent +=
        '\nbody.sf-melodix-home-style-probe #sf-melodix-home { display: block !important; }';
    try {
        vm.runInContext(rendererSource, page.dom.getInternalVMContext(), { timeout: 5000 });
        assert.equal(page.window.__sfMelodixHomeDecision, 'styles-not-ready');
        assert.equal(homeElement(page).style.display, 'none');

        await new Promise((resolve) => page.window.setTimeout(resolve, 1050));

        assert.equal(page.window.__sfHomeTest.styleRetryCount(), 6, 'readiness retries stop at the configured bound');
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.marker_present, true);
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.home_display_flex, false);
        assert.equal(page.window.__sfMelodixHomeStyleProbeResult.probe_error, false);
        assert.equal(page.window.__sfMelodixHomeDecision, 'styles-not-ready');
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.equal(homeElement(page).style.display, 'none');
        assert.notEqual(originalGetComputedStyle(page.document.getElementById('main-view')).display, 'none');
    } finally {
        close(page);
    }
});

test('late-mounted Spotify cards activate only after real data arrives', async () => {
    const page = makePage({ cards: [] });
    try {
        assert.equal(homeElement(page), null);
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
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

test('SPA route changes hide the custom Home on detail and restore it on /home', async () => {
    const page = makePage({
        cards: [{ id: 'route-1', title: 'Playlist A' }, { id: 'route-2', type: 'album', title: 'Album B' }]
    });
    try {
        assertWebHomeVisible(page, 2);
        page.window.history.pushState({}, '', '/playlist/route-2');
        await new Promise((resolve) => page.window.setTimeout(resolve, 100));
        assert.equal(homeElement(page), null);
        assert.equal(page.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');

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
        assert.match(matching[0], /mode=other screen=home styles=0 cards=0 sections=0 root=1/);
        assert.doesNotMatch(matching[0], /route=|#main-view|data-testid|selector/i,
            'diagnostics never retain a route or DOM selector');
        assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
    } finally {
        close(page);
    }
});
