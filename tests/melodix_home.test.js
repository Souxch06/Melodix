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
    initialize = true
} = {}) {
    const sectionBody = cards.map((card) => cardMarkup(card)).join('\n');
    const original = `<main id="main-view"><section data-testid="shelf">
        <h2>Vos recommandations</h2>${sectionBody}
    </section></main>`;
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

function assertWebHomeVisible(page, expectedCards) {
    const home = homeElement(page);
    const main = page.document.getElementById('main-view');
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

test('csshack and bigwindow render real cards on / and /home with verified computed styles', () => {
    for (const guiMode of ['csshack', 'bigwindow']) {
        for (const pathname of ['/', '/home']) {
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
                assert.equal(page.window.__sfMelodixHomeRoute, pathname);
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
            assert.equal(page.window.__sfMelodixHomeGuiMode, entry.guiMode);
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
        brokenProbe.window.getComputedStyle = () => { throw new Error('CSP/style probe failure'); };
        brokenProbe.window.__sfHomeTest.updateMelodixHome();
        assert.equal(homeElement(brokenProbe), null);
        assert.equal(brokenProbe.document.body.classList.contains('sf-melodix-home-active'), false);
        assert.equal(brokenProbe.window.__sfMelodixHomeDecision, 'styles-not-ready');
    } finally {
        close(brokenProbe);
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
        assert.equal(page.window.__sfMelodixHomeRoute, '/home');
    } finally {
        close(page);
    }
});

test('bounded decisions identify mode, route, styles and real-card count without masking the page', () => {
    const page = makePage({
        guiMode: 'unknown-mode',
        cards: [{ id: 'diag-1', title: 'Playlist A' }, { id: 'diag-2', title: 'Album B', type: 'album' }]
    });
    try {
        page.window.__sfHomeTest.updateMelodixHome();
        page.window.__sfHomeTest.updateMelodixHome();
        const matching = page.traces.filter((line) => line.includes('home-web gui-mode-unsupported'));
        assert.equal(matching.length, 1, 'identical decisions are throttled');
        assert.match(matching[0], /mode=unknown-mode route=\/ styles=0 cards=0 sections=0/);
        assert.notEqual(page.window.getComputedStyle(page.document.getElementById('main-view')).display, 'none');
    } finally {
        close(page);
    }
});
