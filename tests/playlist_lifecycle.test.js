// Playlist lifecycle suite (mission "une seule session de test"): the real
// assets/spotify_bridge.js pipeline runs against a scripted network, covering
// the 15 mandated scenarios and the real Android-bridge callback contracts:
//   1.  normal loading           9.  concurrent requests
//   2.  truly empty library     10. out-of-order / stale responses
//   3.  pagination              11. logout + account change
//   4.  network error           12. playlists displayed on the home screen
//   5.  HTTP 401/403/429        13. loading indicator always resolves
//   6.  unavailable category    14. opening a playlist and its tracks
//   7.  unexpected empty shape  15. back + return to home
//   8.  request that never answers (bounded wait -> terminal error)
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

class MockHeaders {
    constructor(init = {}) {
        this._map = new Map();
        Object.entries(init || {}).forEach(([key, value]) => this.set(key, value));
    }
    set(k, v) { this._map.set(String(k).toLowerCase(), { origKey: String(k), value: String(v) }); }
    get(k) { const e = this._map.get(String(k).toLowerCase()); return e ? e.value : null; }
    has(k) { return this._map.has(String(k).toLowerCase()); }
    entries() { return this._map.values(); }
}

function createTimerHarness() {
    const timers = [];
    let nextId = 1;
    return {
        timers,
        setTimeout: (fn, delay) => {
            const handle = { id: nextId++, fn, delay: Number(delay) || 0, cleared: false };
            timers.push(handle);
            return handle.id;
        },
        clearTimeout: (id) => {
            timers.forEach((handle) => {
                if (handle.id === id) handle.cleared = true;
            });
        },
        setInterval: () => nextId++,
        clearInterval: () => {}
    };
}

async function flushTimers(timerHarness, rounds = 60) {
    for (let i = 0; i < rounds; i += 1) {
        await new Promise((resolve) => setImmediate(resolve));
        const pending = timerHarness.timers.splice(0);
        for (const handle of pending) {
            if (!handle.cleared) handle.fn();
        }
    }
}

function scriptFetch(behaviors) {
    const queue = behaviors.slice();
    const calls = [];
    const impl = (url, opts) => {
        calls.push({ url: String(url), opts });
        const behavior = queue.length
            ? queue.shift()
            : (() => { throw new Error('scriptFetch: unexpected extra fetch'); })();
        if (behavior.networkError) return Promise.reject(new TypeError('Failed to fetch'));
        if (behavior.hang) return new Promise(() => {});
        if (behavior.deferred) {
            return new Promise((resolve, reject) => {
                behavior.resolve = (resp) => resolve(resp);
                behavior.reject = reject;
            });
        }
        return Promise.resolve({
            ok: behavior.status >= 200 && behavior.status < 300,
            status: behavior.status,
            headers: new MockHeaders(),
            json: async () => behavior.body,
            text: async () => JSON.stringify(behavior.body || {})
        });
    };
    return { impl, calls };
}

function libraryPage(items) {
    return { status: 200, body: { data: { me: { libraryV3: { items } } } } };
}

function playlistItem(name, uri, wrap) {
    const payload = {
        __typename: 'Playlist',
        uri,
        name,
        images: { items: [{ sources: [{ url: 'https://i.scdn.co/image/' + uri.slice(-4) }] }] }
    };
    if (wrap === 'double') return { item: { data: { data: payload } } };
    return { item: { data: payload } };
}

function createBridgeVm(behaviors = []) {
    const timers = createTimerHarness();
    const scripted = scriptFetch(behaviors);
    const uiCalls = [];
    const mediaLoaded = [];

    class MockMutationObserver {
        observe() {}
        disconnect() {}
    }

    const store = new Map();
    const localStorage = {
        getItem: (key) => (store.has(key) ? store.get(key) : null),
        setItem: (key, value) => store.set(key, String(value)),
        removeItem: (key) => store.delete(key),
        clear: () => store.clear()
    };

    const classListStub = { add() {}, remove() {}, toggle() {}, contains: () => false };
    const nodeStub = () => ({
        style: {},
        classList: classListStub,
        setAttribute() {},
        getAttribute: () => null,
        appendChild() {},
        append() {},
        remove() {},
        removeChild() {},
        insertBefore() {},
        addEventListener() {},
        querySelectorAll: () => [],
        firstChild: null
    });
    const documentStub = {
        hidden: false,
        readyState: 'complete',
        documentElement: {},
        body: nodeStub(),
        head: { appendChild() {} },
        createElement: nodeStub,
        querySelector: () => null,
        querySelectorAll: () => [],
        getElementById: () => null,
        addEventListener() {},
        removeEventListener() {}
    };

    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        Headers: MockHeaders,
        URL,
        URLSearchParams,
        MutationObserver: MockMutationObserver,
        CustomEvent: function CustomEvent(type, detail) { this.type = type; this.detail = detail; },
        Event: function Event(type) { this.type = type; },
        navigator: { mediaSession: null, userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/',
            origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com',
            pathname: '/',
            search: '',
            assign() {},
            replace() {},
            reload() {}
        },
        history: { pushState() {}, replaceState() {}, back() {} },
        localStorage,
        sessionStorage: {
            getItem: () => null,
            setItem: () => {},
            removeItem: () => {},
            clear: () => {}
        },
        document: documentStub,
        fetch: scripted.impl,
        XMLHttpRequest: function XMLHttpRequest() {},
        WebSocket: function WebSocket() {},
        Audio: function Audio() {},
        HTMLMediaElement: { prototype: { play() { return Promise.resolve(); }, pause() {} } },
        Node: { ELEMENT_NODE: 1 },
        Element: function Element() {},
        HTMLElement: function HTMLElement() {},
        requestAnimationFrame: () => 1,
        cancelAnimationFrame: () => {},
        matchMedia: () => ({ matches: false, addEventListener() {} }),
        addEventListener() {},
        removeEventListener() {},
        dispatchEvent() {},
        AndBridge: {
            nativeFetch: () => JSON.stringify({ status: 200, body: '{}', headers: {} }),
            logBridgeError() {},
            onPlaybackStateChanged() {},
            onTrackMetadataChanged() {},
            onNativeUiData: (screen, data) => uiCalls.push({ screen, data }),
            onNativeListText: (text) => uiCalls.push({ screen: 'list-text-direct', data: text }),
            onMediaItemsLoaded: (reqId, json) => mediaLoaded.push({ reqId, items: JSON.parse(json) }),
            onNativeUiReady() {},
            setCanvasDisabled() {},
            manageTSleep() {},
            nativeLogout() {}
        },
        setTimeout: timers.setTimeout,
        clearTimeout: timers.clearTimeout,
        setInterval: timers.setInterval,
        clearInterval: timers.clearInterval
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;

    vm.runInNewContext(read('assets/spotify_bridge.js'), sandbox, { filename: 'assets/spotify_bridge.js' });
    return { sandbox, timers, calls: scripted.calls, uiCalls, mediaLoaded, behaviors };
}

function bootShellOn(windowObj, documentExtra = {}) {
    const document = Object.assign({
        readyState: 'complete',
        documentElement: {},
        hidden: false,
        querySelector: (selector) => (selector === '#main-view' ? { querySelectorAll: () => [] } : null),
        querySelectorAll: () => [],
        addEventListener: () => {}
    }, documentExtra);
    class TestMutationObserver {
        observe() {}
        disconnect() {}
    }
    windowObj.MutationObserver = TestMutationObserver;
    windowObj.document = windowObj.document || document;
    vm.runInNewContext(read('assets/native_ui_shell.js'), {
        window: windowObj,
        document: windowObj.document,
        URL,
        MutationObserver: TestMutationObserver
    });
    return windowObj;
}

function lastHomeRows(calls) {
    const list = calls.filter((call) => call.screen === 'home');
    assert.ok(list.length > 0, 'aucun envoi vers l\'écran home');
    return JSON.parse(list[list.length - 1].data);
}

const TOKEN = 'Bearer test-token-value';

async function runLibrary(bridge) {
    bridge.sandbox.spotAuthToken = TOKEN;
    bridge.sandbox.spotCliToken = 'client-token';
    const run = bridge.sandbox.checkMediaLib();
    await flushTimers(bridge.timers);
    await run;
}

// One failed attempt + MEDIA_LIB_MAX_RETRIES (5) bounded retries.
function failing(behavior) {
    return [behavior, behavior, behavior, behavior, behavior, behavior];
}

// ---------------------------------------------------------------------------

test('1. chargement normal: playlists livrées au pont, état ready, couvertures conservées', async () => {
    const page = libraryPage([
        playlistItem('Soirée', 'spotify:playlist:aaa1'),
        playlistItem('Été', 'spotify:playlist:bbb2')
    ]);
    const bridge = createBridgeVm([
        page,
        { status: 200, body: { data: { me: { libraryV3: { items: [] } } } } }
    ]);
    // the native shell queues its category request before the library is ready
    bridge.sandbox.pendingMediaRequests.add('playlists');
    await runLibrary(bridge);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'ready');
    const delivered = bridge.mediaLoaded.filter((call) => call.reqId === 'playlists');
    assert.ok(delivered.length > 0, 'playlists livrées au pont Android');
    const titles = delivered[delivered.length - 1].items.map((item) => item.name);
    assert.deepEqual(titles, ['Soirée', 'Été']);
    const covers = delivered[delivered.length - 1].items.map((item) => item.image);
    assert.ok(covers.every((cover) => typeof cover === 'string' && cover.startsWith('https://i.scdn.co/')),
        'couvertures réelles uniquement');
});

test('2. bibliothèque réellement vide: état empty explicite, jamais un chargement figé', async () => {
    const bridge = createBridgeVm([libraryPage([])]);
    await runLibrary(bridge);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'empty');
    assert.notEqual(bridge.sandbox.__sfMediaLibState, 'pending');
});

test('3. pagination: deux pages agrégées, limit=50, arrêt au bon moment', async () => {
    const page1Items = [];
    for (let i = 0; i < 50; i += 1) page1Items.push(playlistItem('P' + i, 'spotify:playlist:page1-' + i));
    const page2Items = [];
    for (let i = 0; i < 20; i += 1) page2Items.push(playlistItem('Q' + i, 'spotify:playlist:page2-' + i));
    const bridge = createBridgeVm([libraryPage(page1Items), libraryPage(page2Items)]);
    await runLibrary(bridge);
    assert.equal(bridge.calls.length, 2, 'exactement deux requêtes de pagination');
    assert.match(bridge.calls[0].url, /pathfinder\/v2\/query/);
    assert.equal(bridge.sandbox.mediaLib.playlists.length, 70);
    assert.equal(bridge.sandbox.mediaLib.playlists[0].name, 'P0');
    assert.equal(bridge.sandbox.mediaLib.playlists[69].name, 'Q19');
});

test('4. erreur réseau: échec explicite, jamais une bibliothèque vide', async () => {
    const bridge = createBridgeVm(failing({ networkError: true }));
    await runLibrary(bridge);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'error');
    assert.ok(bridge.sandbox.__sfGetLibDiagReport().failureKind === 'network',
        'cause première enregistrée: ' + bridge.sandbox.__sfGetLibDiagReport().failureKind);
    assert.ok(!bridge.sandbox.mediaLib, 'aucune bibliothèque fabriquée après un échec');
});

test('5. HTTP 401/403: accès refusé ; 429 conservé comme erreur HTTP identifiable', async () => {
    for (const status of [401, 403]) {
        const bridge = createBridgeVm(failing({ status, body: {} }));
        await runLibrary(bridge);
        assert.equal(bridge.sandbox.__sfMediaLibState, 'error', 'status ' + status);
        assert.equal(bridge.sandbox.__sfGetLibDiagReport().failureKind, 'access-denied');
    }
    const bridge429 = createBridgeVm(failing({ status: 429, body: {} }));
    await runLibrary(bridge429);
    assert.equal(bridge429.sandbox.__sfMediaLibState, 'error');
    const report = bridge429.sandbox.__sfGetLibDiagReport();
    assert.ok(['network', 'http-error'].includes(report.failureKind), report.failureKind);
    const http = report.lastRun && report.lastRun.attempts.find((a) => a.httpStatus === 429);
    assert.ok(http, 'le code 429 doit rester visible dans le rapport');
});

test('6. requête hors catégories: le drain route vers le vrai chargeur, jamais un faux "aucun élément"', async () => {
    const likedSongs = {
        status: 200,
        body: {
            data: {
                me: {
                    library: {
                        tracks: {
                            items: [
                                { track: { data: { uri: 'spotify:track:like1', name: 'Titre liké 1', artists: { items: [{ profile: { name: 'A' } }] }, albumOfTrack: { coverArt: { sources: [{ url: 'https://i.scdn.co/image/l1' }] } } } } },
                                { track: { data: { uri: 'spotify:track:like2', name: 'Titre liké 2', artists: { items: [{ profile: { name: 'B' } }] }, albumOfTrack: { coverArt: { sources: [{ url: 'https://i.scdn.co/image/l2' }] } } } } }
                            ]
                        }
                    }
                }
            }
        }
    };
    const bridge = createBridgeVm([
        libraryPage([playlistItem('Solo', 'spotify:playlist:ccc3')]),
        likedSongs
    ]);
    // one category request and one collection request queued before readiness
    bridge.sandbox.pendingMediaRequests.add('playlists');
    bridge.sandbox.pendingMediaRequests.add('spotify:collection:tracks');
    await runLibrary(bridge);
    await flushTimers(bridge.timers);
    const playlists = bridge.mediaLoaded.filter((call) => call.reqId === 'playlists');
    assert.ok(playlists.length > 0 && playlists[playlists.length - 1].items.length === 1,
        'les vraies catégories répondent avec leurs vrais items');
    // the collection request is answered by the real Liked Songs loader
    const answered = bridge.mediaLoaded.filter((call) => call.reqId === 'spotify:collection:tracks');
    assert.ok(answered.length > 0, 'la requête collection doit être vraiment servie');
    const names = answered[answered.length - 1].items.map((item) => item.name);
    assert.deepEqual(names, ['Titre liké 1', 'Titre liké 2'],
        'le drain ne doit jamais inventer une liste vide pour une requête hors catégories');
});

test('7. forme inattendue: ShapeError explicite, jamais "empty"', async () => {
    const bridge = createBridgeVm(failing({ status: 200, body: { data: { me: null } } }));
    await runLibrary(bridge);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'error');
    assert.equal(bridge.sandbox.__sfGetLibDiagReport().failureKind, 'no-session');
    assert.ok(!bridge.sandbox.mediaLib);
});

test('8. requête qui ne répond pas: attente bornée (timeout) puis erreur terminale', async () => {
    const bridge = createBridgeVm(failing({ hang: true }));
    await runLibrary(bridge);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'error',
        'une requête bloquée ne peut pas laisser un chargement infini');
    const report = bridge.sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'network');
    const detail = JSON.stringify(report);
    assert.ok(/fetch-timeout|NetworkTimeout/.test(detail),
        'le timeout doit être nommé dans le rapport: ' + detail);
});

test('9. requêtes simultanées: un seul pipeline de bibliothèque à la fois', async () => {
    const bridge = createBridgeVm([
        libraryPage([playlistItem('Solo', 'spotify:playlist:ddd4')]),
        { status: 200, body: { data: { me: { libraryV3: { items: [] } } } } }
    ]);
    bridge.sandbox.spotAuthToken = TOKEN;
    const first = bridge.sandbox.checkMediaLib();
    const second = bridge.sandbox.checkMediaLib();
    await Promise.all([first, second]);
    await flushTimers(bridge.timers);
    assert.equal(bridge.calls.length, 1, 'la deuxième requête non forcée doit attendre la première');
    assert.equal(bridge.sandbox.__sfMediaLibState, 'ready');
});

test('10. réponses dans le désordre: une réponse tardive n\'écrase pas l\'état plus récent', async () => {
    const slow = { deferred: true };
    const bridge = createBridgeVm([
        slow,
        libraryPage([playlistItem('NEUF', 'spotify:playlist:new9')])
    ]);
    bridge.sandbox.spotAuthToken = TOKEN;
    // run A starts and stalls on the network
    const runA = bridge.sandbox.checkMediaLib(true);
    await new Promise((resolve) => setImmediate(resolve));
    // run B (forced) starts later and completes with the fresh account data
    const runB = bridge.sandbox.checkMediaLib(true);
    await runB;
    await flushTimers(bridge.timers);
    assert.equal(bridge.sandbox.__sfMediaLibState, 'ready');
    assert.equal(bridge.sandbox.mediaLib.playlists[0].name, 'NEUF');
    // now the stale first answer arrives: it must be dropped
    slow.resolve({
        ok: true,
        status: 200,
        headers: new MockHeaders(),
        json: async () => ({ data: { me: { libraryV3: { items: [playlistItem('PÉRIMÉ', 'spotify:playlist:old1')] } } } })
    });
    await runA;
    await flushTimers(bridge.timers);
    assert.equal(bridge.sandbox.mediaLib.playlists[0].name, 'NEUF',
        'la réponse périmée ne doit pas écraser la session la plus récente');
});

test('11. déconnexion: plus aucune donnée de la session précédente, réponses en vol ignorées', async () => {
    const slow = { deferred: true };
    const bridge = createBridgeVm([slow]);
    bridge.sandbox.spotAuthToken = TOKEN;
    const run = bridge.sandbox.checkMediaLib(true);
    await new Promise((resolve) => setImmediate(resolve));
    // the account disappears while the fetch is still in flight
    bridge.sandbox.__sfMarkLoggedOut();
    assert.ok(!bridge.sandbox.mediaLib, 'la bibliothèque de session est purgée');
    slow.resolve({
        ok: true,
        status: 200,
        headers: new MockHeaders(),
        json: async () => ({ data: { me: { libraryV3: { items: [playlistItem('Fantôme', 'spotify:playlist:ghost')] } } } })
    });
    await run;
    await flushTimers(bridge.timers);
    assert.ok(!bridge.sandbox.mediaLib, 'une réponse en vol ne survit pas à la déconnexion');
    const titles = JSON.stringify(bridge.mediaLoaded);
    assert.ok(!titles.includes('Fantôme'), 'aucune donnée de l\'ancien compte ne doit être envoyée');
});

test('12. accueil: les playlists réelles apparaissent dans "Vos playlists" avec titres et URIs', async () => {
    const bridge = createBridgeVm([
        libraryPage([playlistItem('Accueil', 'spotify:playlist:home1')]),
        { status: 200, body: { data: { me: { libraryV3: { items: [] } } } } }
    ]);
    await runLibrary(bridge);
    bootShellOn(bridge.sandbox);
    bridge.sandbox.__sfNotifyMediaLibReady();
    const rows = lastHomeRows(bridge.uiCalls);
    assert.ok(rows.some((row) => row.section === 'Vos playlists' && row.title === 'Accueil'
        && row.uri === 'spotify:playlist:home1'),
        'la vraie playlist doit être visible et ouvrable: ' + JSON.stringify(rows));
});

test('13. l\'indicateur de chargement disparaît sur TOUS les chemins de sortie', async () => {
    const terminalStates = ['ready', 'empty', 'error'];
    // ready
    const ok = createBridgeVm([
        libraryPage([playlistItem('X', 'spotify:playlist:x1')]),
        { status: 200, body: { data: { me: { libraryV3: { items: [] } } } } }
    ]);
    await runLibrary(ok);
    // empty
    const empty = createBridgeVm([libraryPage([])]);
    await runLibrary(empty);
    // error (network)
    const failed = createBridgeVm([{ networkError: true }]);
    await runLibrary(failed);
    // timeout -> terminal error
    const stuck = createBridgeVm([{ hang: true }]);
    await runLibrary(stuck);

    for (const [name, bridge] of [['ok', ok], ['empty', empty], ['failed', failed], ['stuck', stuck]]) {
        const state = bridge.sandbox.__sfMediaLibState;
        assert.ok(terminalStates.includes(state), name + ' → état non terminal: ' + state);
    }

    // home rows reflect the terminal state: no "Chargement des playlists…" left
    for (const [name, bridge] of [['ok', ok], ['empty', empty], ['failed', failed], ['stuck', stuck]]) {
        bootShellOn(bridge.sandbox);
        bridge.sandbox.__sfNotifyMediaLibReady();
        const rows = lastHomeRows(bridge.uiCalls);
        const texts = rows.map((row) => row.title || '').join(' | ');
        assert.ok(!texts.includes('Chargement des playlists'),
            name + ' → écran figé sur le chargement: ' + texts);
    }

    // and the retry budget itself becomes terminal instead of pending forever
    const exhausted = createBridgeVm(failing({ networkError: true }));
    exhausted.sandbox.spotAuthToken = TOKEN;
    const exhaustedRun = exhausted.sandbox.checkMediaLib();
    await flushTimers(exhausted.timers, 400);
    await exhaustedRun;
    assert.equal(exhausted.sandbox.__sfMediaLibState, 'error');
    assert.equal(exhausted.sandbox.__sfMediaLibRetryExhausted, true,
        'le budget d\'échecs doit finir en état terminal');
    // a fresh user-driven call re-opens the bounded retry budget (the reset
    // happens on entry, before the first await)
    let flagAfterReset = null;
    const fresh = exhausted.sandbox.checkMediaLib().then(() => {
        flagAfterReset = exhausted.sandbox.__sfMediaLibRetryExhausted;
    });
    await flushTimers(exhausted.timers, 10);
    await fresh;
    assert.equal(flagAfterReset, false);
});

test('14. ouverture d\'une playlist: les pistes réelles arrivent par le pont', async () => {
    const tracks = {
        status: 200,
        body: {
            data: {
                playlistV2: {
                    content: {
                        items: [
                            {
                                itemV2: {
                                    data: {
                                        uri: 'spotify:track:t1',
                                        name: 'Piste A',
                                        artists: { items: [{ profile: { name: 'Artiste 1' } }] },
                                        albumOfTrack: { coverArt: { sources: [{ url: 'https://i.scdn.co/image/t1' }] } }
                                    }
                                }
                            },
                            {
                                itemV2: {
                                    data: {
                                        uri: 'spotify:track:t2',
                                        name: 'Piste B',
                                        artists: { items: [{ profile: { name: 'Artiste 2' } }] },
                                        albumOfTrack: { coverArt: { sources: [{ url: 'https://i.scdn.co/image/t2' }] } }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }
    };
    const bridge = createBridgeVm([tracks]);
    bridge.sandbox.spotAuthToken = TOKEN;
    bridge.sandbox.pendingMediaRequests.add('spotify:playlist:abc');
    await bridge.sandbox.fetchMediaItems('spotify:playlist:abc');
    await flushTimers(bridge.timers);
    const delivered = bridge.mediaLoaded.filter((call) => call.reqId === 'spotify:playlist:abc');
    assert.ok(delivered.length > 0, 'aucune piste livrée');
    const names = delivered[delivered.length - 1].items.map((item) => item.name);
    assert.deepEqual(names, ['Piste A', 'Piste B']);
    assert.ok(delivered[delivered.length - 1].items.every((item) => item.id.includes(':track:')));
});

test('15. retour: demander l\'accueil renvoie la bibliothèque et ne laisse rien en chargement', async () => {
    const bridge = createBridgeVm([
        libraryPage([playlistItem('Retour', 'spotify:playlist:back1')]),
        { status: 200, body: { data: { me: { libraryV3: { items: [] } } } } }
    ]);
    await runLibrary(bridge);
    bootShellOn(bridge.sandbox);
    bridge.sandbox.__sfNotifyMediaLibReady();
    // simulate returning to the home screen (Back / bottom bar)
    bridge.sandbox.__sfNativeRequestHome();
    const rows = lastHomeRows(bridge.uiCalls);
    const texts = rows.map((row) => row.title || '').join(' | ');
    assert.ok(texts.includes('Retour'), 'la playlist doit rester visible au retour: ' + texts);
    assert.ok(!texts.includes('Chargement des playlists'), 'aucun chargement figé au retour: ' + texts);
});
