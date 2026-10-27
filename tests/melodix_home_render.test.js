// Home DOM rendering chain regression suite.
//
// The visible playlist grid (#sf-melodix-home) is populated by
// updateMelodixHome -> collectMelodixHomeSections (scrape of #main-view),
// independently of the native rows the shell sends. The old runtime symptoms
// were exactly this split: nativeHomeRowsCount:33 while homeRootPresent:false.
//
// Demonstrated defects (absent from origin/arena/7142700d-melodix @ 7e2a590):
//   1. melodixHomeResourcePath required the resource type to be the FIRST path
//      segment, so locale-prefixed Spotify hrefs (/intl-fr/playlist/...) - which
//      the shell's spotifyResourceUri explicitly supports - were all rejected;
//   2. the anchor fallback dropped every card without an <img>, which the shell
//      keeps.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const bridge = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');

function extractFunction(name) {
    const start = bridge.indexOf(`function ${name}(`);
    assert.ok(start > 0, `function ${name} must exist`);
    let depth = 0;
    for (let i = bridge.indexOf('{', start); i < bridge.length; i += 1) {
        if (bridge[i] === '{') depth += 1;
        if (bridge[i] === '}') {
            depth -= 1;
            if (depth === 0) return bridge.slice(start, i + 1);
        }
    }
    throw new Error(`unterminated function ${name}`);
}

// ---------------------------------------------------------------------------
// Minimal DOM good enough for the real collectMelodixHomeSections/updateMelodixHome
// ---------------------------------------------------------------------------

function matchesSelector(node, selector) {
    return selector.split(',').some((raw) => {
        const sel = raw.trim();
        if (sel.startsWith('.')) {
            const wanted = sel.slice(1);
            return (node.className || '').split(' ').includes(wanted) ||
                (node.classList && node.classList.contains(wanted));
        }
        const attrMatch = sel.match(/^([a-z0-9]*)\[([a-z0-9-]+)(?:="([^"]*)")?\]$/i);
        if (attrMatch) {
            const [, tag, attr, value] = attrMatch;
            if (tag && node.tagName !== tag.toUpperCase()) return false;
            const actual = node.attrs[attr];
            if (actual === undefined) return false;
            return value === undefined ? true : actual === value;
        }
        if (sel.startsWith('#')) return node.attrs.id === sel.slice(1);
        return node.tagName === sel.toUpperCase();
    });
}

function makeNode(tag, attrs = {}, children = [], text = '') {
    const node = {
        tagName: tag.toUpperCase(),
        attrs: { ...attrs },
        children: [],
        parent: null,
        textContent: text,
        innerText: text,
        style: { setProperty() {}, },
        classList: {
            set: new Set((attrs.class || '').split(' ').filter(Boolean)),
            add(c) { this.set.add(c); },
            contains(c) { return this.set.has(c); }
        },
        type: undefined,
        className: '',
        src: undefined,
        alt: undefined,
        loading: undefined,
        getAttribute(name) { return name in node.attrs ? node.attrs[name] : null; },
        setAttribute(name, value) { node.attrs[name] = String(value); },
        addEventListener() {},
        matches(sel) { return matchesSelector(node, sel); },
        querySelector(sel) { return node.querySelectorAll(sel)[0] || null; },
        querySelectorAll(sel) {
            const out = [];
            const walk = (n) => {
                for (const child of n.children) {
                    if (matchesSelector(child, sel)) out.push(child);
                    walk(child);
                }
            };
            walk(node);
            return out;
        },
        closest(sel) {
            let current = node;
            while (current) {
                if (matchesSelector(current, sel)) return current;
                current = current.parent;
            }
            return null;
        },
        appendChild(child) { child.parent = node; node.children.push(child); return child; },
        append(...nodes) { nodes.forEach((child) => node.appendChild(child)); },
        replaceChildren(...nodes) {
            node.children.forEach((child) => { child.parent = null; });
            node.children = [];
            nodes.forEach((child) => node.appendChild(child));
        }
    };
    children.forEach((child) => node.appendChild(child));
    Object.defineProperty(node, 'id', {
        get() { return node.attrs.id; },
        set(value) { node.attrs.id = String(value); }
    });
    return node;
}

function buildSandbox({ pathname = '/', cards = [] } = {}) {
    const body = makeNode('body');
    const documentElement = makeNode('html', {}, [body]);
    const document = {
        body,
        documentElement,
        createElement: (tag) => makeNode(tag),
        getElementById(id) {
            const found = body.querySelectorAll(`#${id}`);
            return found[0] || null;
        },
        querySelector(sel) {
            if (matchesSelector(body, sel)) return body;
            return body.querySelectorAll(sel)[0] || null;
        },
        querySelectorAll(sel) { return body.querySelectorAll(sel); },
        addEventListener() {}
    };
    const mainView = makeNode('div', { id: 'main-view' }, cards);
    body.appendChild(mainView);

    const journal = [];
    const sandbox = {
        console,
        URL,
        Map,
        Set,
        Array,
        String,
        Number,
        Math,
        document,
        getComputedStyle: () => ({ display: 'none' }),
        window: {
            location: {
                href: 'https://open.spotify.com' + pathname,
                origin: 'https://open.spotify.com',
                hostname: 'open.spotify.com',
                pathname
            },
            SF_CONFIG: { guiMode: 'csshack' },
            AndBridge: { logDiagEvent: (line) => journal.push(line) }
        }
    };
    sandbox.globalThis = sandbox;
    vm.runInNewContext(
        'var deactivateMelodixHome = function(){};' +
        'var observeMelodixHomeDocument = function(){};' +
        'var observeMelodixHomeView = function(){};' +
        'var melodixHomeCopy = function(){ return { greeting: "Hello", discover: "Discover" }; };' +
        extractFunction('melodixHomeResourcePath') +
        extractFunction('renderMelodixHomeCard') +
        extractFunction('collectMelodixHomeSections') +
        extractFunction('updateMelodixHome') +
        '; api = { melodixHomeResourcePath, collectMelodixHomeSections, updateMelodixHome };',
        sandbox
    );
    return { ...sandbox.api, sandbox, journal, body };
}

function card(anchor) {
    return anchor;
}

function anchor(href, title, withImage) {
    const img = withImage ? makeNode('img', { src: 'https://i.scdn.co/img' }) : null;
    const node = makeNode('a', { href, 'aria-label': title }, img ? [img] : [], title);
    node.href = 'https://open.spotify.com' + href;
    return node;
}

// ---------------------------------------------------------------------------
// 1. Route filter (the demonstrated defect)
// ---------------------------------------------------------------------------

test('resource filter accepts plain and locale-prefixed Spotify hrefs', () => {
    const { melodixHomeResourcePath } = buildSandbox();
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M'), true);
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/intl-fr/playlist/37i9dQZF1DXcBWIGoYBM5M'), true,
        'locale-prefixed playlist hrefs must reach the home grid');
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/intl-en/album/1DFixLWuPkv3KT3TnV35m3'), true);
});

test('resource filter accepts every supported resource type, and only those', () => {
    const { melodixHomeResourcePath } = buildSandbox();
    for (const type of ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook']) {
        assert.equal(melodixHomeResourcePath(`https://open.spotify.com/${type}/abc123`), true, `${type} must pass`);
        assert.equal(melodixHomeResourcePath(`https://open.spotify.com/intl-fr/${type}/abc123`), true,
            `locale-prefixed ${type} must pass`);
    }
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/intl-fr/collection/tracks'), false,
        'non-resource pages stay excluded');
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/playlist/'), false,
        'resource hrefs without an identifier stay excluded');
    assert.equal(melodixHomeResourcePath('https://open.spotify.com/search/x'), false);
});

test('resource filter rejects external and non-HTTP(S) hrefs', () => {
    const { melodixHomeResourcePath } = buildSandbox();
    assert.equal(melodixHomeResourcePath('https://evil.example/playlist/x'), false);
    assert.equal(melodixHomeResourcePath('javascript:alert(1)'), false);
    assert.equal(melodixHomeResourcePath('https://open.spotify.com.evil.example/playlist/x'), false);
});

// ---------------------------------------------------------------------------
// 2. Card collection: image-less cards, dedupe, external links
// ---------------------------------------------------------------------------

test('collectMelodixHomeSections keeps image-less cards with title and href', () => {
    const withImg = anchor('/playlist/one', 'Liste une', true);
    const noImg = anchor('/intl-fr/playlist/deux', 'Liste deux', false);
    const { collectMelodixHomeSections } = buildSandbox({ cards: [card(withImg), card(noImg)] });
    const sections = collectMelodixHomeSections(
        makeNode('div', {}, [card(withImg), card(noImg)])
    );
    const flat = sections.flatMap((section) => section.cards);
    assert.equal(flat.length, 2, 'both cards are collected');
    const imageLess = flat.find((entry) => entry.title === 'Liste deux');
    assert.ok(imageLess, 'the image-less card is kept');
    assert.equal(imageLess.image, '', 'a missing image degrades to an empty string');
    assert.equal(imageLess.href, 'https://open.spotify.com/intl-fr/playlist/deux', 'the href is kept');
});

test('collectMelodixHomeSections dedupes repeated hrefs and skips unrelated links', () => {
    const dupA = anchor('/playlist/one', 'Liste une', true);
    const dupB = anchor('/playlist/one', 'Liste une (copie)', true);
    const external = makeNode('a', { href: 'https://evil.example/x', 'aria-label': 'Externe' }, [], 'Externe');
    external.href = 'https://evil.example/x';
    const unrelated = anchor('/intl-fr/collection/tracks', 'Ma bibliotheque', true);
    const root = makeNode('div', {}, [card(dupA), card(dupB), external, unrelated]);
    const { collectMelodixHomeSections } = buildSandbox();
    const sections = collectMelodixHomeSections(root);
    const flat = sections.flatMap((section) => section.cards);
    assert.equal(flat.length, 1, 'one card per href; external and non-resource links dropped');
    assert.equal(flat[0].title, 'Liste une');
});

// ---------------------------------------------------------------------------
// 3. Component lifecycle: no render on sparse data, full render with valid data
// ---------------------------------------------------------------------------

test('updateMelodixHome creates no component when fewer than 2 valid cards exist', () => {
    const lonely = anchor('/playlist/one', 'Liste une', true);
    const mainView = makeNode('div', {}, [card(lonely)]);
    const { updateMelodixHome, sandbox } = buildSandbox();
    sandbox.document.body.querySelector('#main-view').replaceChildren(card(lonely));
    updateMelodixHome();
    assert.equal(sandbox.document.getElementById('sf-melodix-home'), null,
        'the grid component must not appear on sparse data');
    assert.equal(sandbox.window.__sfMelodixHomeRenderedCards, undefined);
});

test('updateMelodixHome leaves the real Spotify home (#main-view) in place', () => {
    // Home display restoration (historical proven implementation, Preview
    // test.19 / commit 552da05): the home screen shows the real Spotify web
    // player. The custom replacement grid must never take over the home
    // surface - that replacement is the layout change after which the user
    // reports missing playlists. The collector helpers stay as the proven
    // fallback source but updateMelodixHome is disarmed on purpose.
    const a = anchor('/playlist/one', 'Liste une', true);
    const b = anchor('/intl-fr/playlist/deux', 'Liste deux', false);
    const dup = anchor('/playlist/one', 'Liste une (copie)', true);
    const { updateMelodixHome, sandbox } = buildSandbox();
    sandbox.document.body.querySelector('#main-view').replaceChildren(card(a), card(b), card(dup));
    updateMelodixHome();
    assert.equal(sandbox.document.getElementById('sf-melodix-home'), null,
        'the replacement grid is never created over the real home');
    assert.ok(!sandbox.document.body.classList.contains('sf-melodix-home-active'),
        '#main-view is never hidden by the replacement grid');
    assert.equal(sandbox.window.__sfMelodixHomeRenderedCards, undefined,
        'no synthetic render state is claimed');
});

test('updateMelodixHome stays inactive outside the Spotify home route', () => {
    const a = anchor('/playlist/one', 'Liste une', true);
    const b = anchor('/playlist/deux', 'Liste deux', true);
    const { updateMelodixHome, sandbox } = buildSandbox({ pathname: '/search/truc' });
    sandbox.document.body.querySelector('#main-view').replaceChildren(card(a), card(b));
    updateMelodixHome();
    assert.equal(sandbox.document.getElementById('sf-melodix-home'), null,
        'no Melodix home outside / and /home');
});

// ---------------------------------------------------------------------------
// 4. Static pins: observable states, bounded journal, collector shape
// ---------------------------------------------------------------------------

test('render state distinguishes data-received from rendered', () => {
    const start = bridge.indexOf('function updateMelodixHome');
    const body = bridge.slice(start, bridge.indexOf('function initializeMelodixHome'));
    assert.match(body, /__sfMelodixHomeRenderedCards/);
    assert.match(body, /home-render cards=/);
    const shell = fs.readFileSync(path.join(root, 'assets/native_ui_shell.js'), 'utf8');
    assert.match(shell, /__sfNativeUiHomeRowsCount/);
    assert.match(shell, /__sfNativeUiHomeDataSent/);
});

test('render journal events are bounded (no log spam)', () => {
    const start = bridge.indexOf('function updateMelodixHome');
    const body = bridge.slice(start, bridge.indexOf('function initializeMelodixHome'));
    const sig = body.indexOf('window._sfMelodixHomeSignature === signature');
    const log = body.indexOf('home-render cards=');
    assert.ok(sig > 0 && log > sig, 'the render journal follows the signature short-circuit');
});

test('the anchor fallback no longer requires an <img>', () => {
    const start = bridge.indexOf('function collectMelodixHomeSections');
    const body = bridge.slice(start, bridge.indexOf('function updateMelodixHome'));
    assert.ok(!/filter\(\(anchor\) => anchor\.querySelector\('img'\)\)/.test(body),
        'cards rendered without an <img> must not be dropped');
    assert.match(body, /querySelectorAll\('\[data-testid="card"\]'\)/);
    assert.match(body, /querySelectorAll\('a\[href\]'\)/);
});
