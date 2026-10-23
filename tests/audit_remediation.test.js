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
    assert.match(mainSmali, /\.field public nativeSessionEpoch:I/);
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

test('[D7] Zero Dalvik wide-register clobbers, out-of-bounds locals, or unintended param-register aliases across entire smali/ tree', () => {
    function paramSlots(sig, isStatic) {
        const m = sig.match(/\(([^)]*)\)/);
        const desc = m ? m[1] : '';
        const slots = [];
        if (!isStatic) slots.push('this');
        let i = 0;
        while (i < desc.length) {
            if (desc[i] === '[') {
                while (i < desc.length && desc[i] === '[') i++;
                i = desc[i] === 'L' ? desc.indexOf(';', i) + 1 : i + 1;
                slots.push('ref');
            } else if (desc[i] === 'L') {
                i = desc.indexOf(';', i) + 1;
                slots.push('ref');
            } else if (desc[i] === 'J' || desc[i] === 'D') {
                slots.push('wide_lo', 'wide_hi');
                i++;
            } else {
                slots.push('prim');
                i++;
            }
        }
        return slots;
    }

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
        const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/);
        let inMethod = false;
        let sig = '';
        let isStatic = false;
        let nLocals = null;
        let total = 0;
        for (let idx = 0; idx < lines.length; idx++) {
            const s = lines[idx].trim();
            if (s.startsWith('.method ')) {
                inMethod = true;
                sig = s;
                isStatic = s.includes(' static ');
                nLocals = null;
            } else if (s === '.end method') {
                inMethod = false;
            } else if (inMethod) {
                const lm = s.match(/^\.locals\s+(\d+)$/);
                if (lm) {
                    nLocals = Number(lm[1]);
                    total = nLocals + paramSlots(sig, isStatic).length;
                    continue;
                }
                if (nLocals === null || !s || s.startsWith('.') || s.startsWith('#') || s.startsWith(':')) continue;
                const noStr = s.replace(/"(?:\\.|[^"])*"/g, '""');
                const head = noStr.split('->')[0].replace(/L[^;\s]+;/g, 'TYPE');
                for (const vm of head.matchAll(/\bv(\d+)\b/g)) {
                    const k = Number(vm[1]);
                    if (k >= total) bugs.push(`OOB_VREG ${rel}:${idx + 1} ${sig} -> ${s}`);
                    else if (k >= nLocals) bugs.push(`VREG_ALIASES_PARAM ${rel}:${idx + 1} ${sig} -> ${s}`);
                }
                const wm = s.match(/^(?:const-wide(?:\/16|\/32|\/high16)?|move-wide(?:\/from16|\/16)?|move-result-wide|aget-wide|[is]get-wide|(?:add|sub|mul|div|rem|and|or|xor|shl|shr|ushr|neg|not)-(?:long|double)(?:\/2addr)?|[a-z]+-to-(?:long|double))\s+([vp])(\d+)\b/);
                if (wm) {
                    const absReg = wm[1] === 'v' ? Number(wm[2]) : nLocals + Number(wm[2]);
                    if (absReg + 1 >= total) bugs.push(`WIDE_OOB ${rel}:${idx + 1} ${sig} -> ${s}`);
                    else if (wm[1] === 'v' && absReg + 1 >= nLocals) bugs.push(`WIDE_CLOBBERS_PARAM ${rel}:${idx + 1} ${sig} -> ${s}`);
                }
            }
        }
    }
    assert.deepEqual(bugs, [], `Dalvik register verifier found defects:\n${bugs.join('\n')}`);
});

test('[D5] RuntimeDiagnostic and StartupLoadWatchdog guard AlertDialog.show against destroyed activities', () => {
    const diag = readRepoFile('smali/com/melodix/music/RuntimeDiagnostic.smali');
    const watchdog = readRepoFile('smali/com/melodix/music/StartupLoadWatchdog.smali');

    assert.match(diag, /Landroid\/app\/Activity;->isDestroyed\(\)Z/, 'RuntimeDiagnostic must check Activity.isDestroyed()');
    assert.match(diag, /\.catch Ljava\/lang\/Throwable; \{:try_start_dialog[\s\S]*?:catch_dialog/, 'RuntimeDiagnostic.showDialog must catch BadTokenException around AlertDialog.show()');
    assert.match(watchdog, /Landroid\/app\/Activity;->isDestroyed\(\)Z/, 'StartupLoadWatchdog must check Activity.isDestroyed()');
});

test('[D6] preview-apk.yml builds & verifies artifacts on push without overwriting GitHub Release unless explicitly dispatched', () => {
    const workflow = readRepoFile('.github/workflows/preview-apk.yml');
    const publishBlock = workflow.slice(workflow.indexOf('- name: Create preview release and attach APK'));
    assert.ok(publishBlock.length > 0, 'Publish side-by-side preview release step must exist');
    assert.match(
        publishBlock,
        /if:\s*github\.event_name\s*==\s*'workflow_dispatch'/,
        'GitHub Release asset replacement must only run on explicit manual workflow_dispatch'
    );
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

