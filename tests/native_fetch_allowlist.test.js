const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');

function loadAllowlist() {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function isAllowedNativeFetchUrl(raw) {');
    const stop = src.indexOf('\n    function wrapNativeFetchBridge()', start);
    assert.ok(start >= 0 && stop > start, 'isAllowedNativeFetchUrl must exist in the playback bridge');
    return vm.runInNewContext(src.slice(start, stop) + '\nisAllowedNativeFetchUrl;', { URL });
}

test('nativeFetch JS allowlist accepts only the hosts the bridge actually calls', () => {
    const allow = loadAllowlist();
    assert.equal(allow('https://gew4-spclient.spotify.com/connect-state/v1/player/command/from/x/to/x'), true);
    assert.equal(allow('https://api-partner.spotify.com/pathfinder/v2/query'), true);
    assert.equal(allow('https://api.spotify.com/v1/shows/abc/episodes'), true);
    assert.equal(allow('https://open.spotify.com/melody/v1/msg'), true);
    assert.equal(allow('https://misc.scdn.co/liked-songs/liked-songs-640.png'), true);
});

test('nativeFetch JS allowlist rejects lookalike hosts, HTTP, ports, userinfo and IPs', () => {
    const allow = loadAllowlist();
    assert.equal(allow('https://evil.com/?spotify.com'), false);
    assert.equal(allow('https://evil-spotify.com/'), false);
    assert.equal(allow('https://open.spotify.com.evil.com/connect-state'), false);
    assert.equal(allow('http://open.spotify.com/'), false);
    assert.equal(allow('https://open.spotify.com:8080/'), false);
    assert.equal(allow('https://user:pass@open.spotify.com/'), false);
    assert.equal(allow('https://127.0.0.1/connect-state'), false);
    assert.equal(allow('https://8.8.8.8/'), false);
    assert.equal(allow('not a url'), false);
    assert.equal(allow(''), false);
});

test('JS allowlist is not a native allowlist: smali still opens URL before host checks', () => {
    const smali = fs.readFileSync(path.join(root, 'smali/com/melodix/music/AndBridge.smali'), 'utf8');
    const method = smali.slice(
        smali.indexOf('.method public final nativeFetch'),
        smali.indexOf('.end method', smali.indexOf('.method public final nativeFetch'))
    );
    const openAt = method.indexOf('Ljava/net/URL;->openConnection');
    const spotifyAt = method.indexOf('spclient.spotify.com');
    assert.ok(openAt >= 0, 'nativeFetch still opens a connection');
    assert.ok(spotifyAt > openAt, 'smali host string still appears after openConnection — APK not hardened');
});

test('JS wraps AndBridge.nativeFetch so direct JS calls also hit the allowlist', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    assert.match(src, /function wrapNativeFetchBridge\(/);
    assert.match(src, /bridge\.nativeFetch = guarded/);
    assert.match(src, /_sfAllowlisted/);

    const start = src.indexOf('    function sanitizeDiagnostic(value) {');
    const stop = src.indexOf('\n    // >>> sf-pause-intent', start);
    const calls = [];
    const window = {
        AndBridge: {
            nativeFetch: (url, method) => {
                calls.push({ url, method });
                return JSON.stringify({ status: 200, body: '{}' });
            }
        }
    };
    const logs = [];
    vm.runInNewContext(
        src.slice(start, stop) + '\nwrapNativeFetchBridge;',
        {
            URL,
            window,
            console: { error: (...args) => logs.push(args.join(' ')) }
        }
    );
    assert.equal(typeof window.AndBridge.nativeFetch, 'function');
    const denied = JSON.parse(window.AndBridge.nativeFetch('https://evil.com/?spotify.com', 'GET', '{}', null));
    assert.equal(denied.status, 403);
    assert.equal(calls.length, 0);
    const ok = JSON.parse(window.AndBridge.nativeFetch('https://gew4-spclient.spotify.com/connect-state', 'GET', '{}', null));
    assert.equal(ok.status, 200);
    assert.equal(calls.length, 1);
});

test('when AndBridge.nativeFetch is not assignable, wrap does not pretend to intercept direct calls', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function sanitizeDiagnostic(value) {');
    const stop = src.indexOf('\n    // >>> sf-pause-intent', start);
    const calls = [];
    const original = (url) => {
        calls.push(url);
        return JSON.stringify({ status: 200, body: '{}' });
    };
    const window = { AndBridge: {} };
    Object.defineProperty(window.AndBridge, 'nativeFetch', {
        value: original,
        writable: false,
        configurable: false
    });
    vm.runInNewContext(src.slice(start, stop), {
        URL,
        window,
        console: { error() {} }
    });
    assert.equal(window.AndBridge.nativeFetch, original);
    JSON.parse(window.AndBridge.nativeFetch('https://evil.com/?spotify.com', 'GET', '{}', null));
    assert.equal(calls.length, 1, 'direct nativeFetch still reaches the original method');
});

test('fetch wrapper resolves Request.url instead of calling includes on a Request', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function resolveFetchUrl(input) {');
    const stop = src.indexOf('\n    const oriFetch = window.fetch;', start);
    const resolveFetchUrl = vm.runInNewContext(src.slice(start, stop) + '\nresolveFetchUrl;');
    assert.equal(resolveFetchUrl('https://open.spotify.com/connect-state'), 'https://open.spotify.com/connect-state');
    assert.equal(resolveFetchUrl({ url: 'https://gew4-spclient.spotify.com/melody/v1/msg' }), 'https://gew4-spclient.spotify.com/melody/v1/msg');
    assert.equal(resolveFetchUrl(null), '');
    assert.equal(resolveFetchUrl({}), '');
});

test('playback skip trace is registered once and playFromUri does not log device ids', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const skipTraces = src.split("tracePlayback('dom-skip'").length - 1;
    assert.equal(skipTraces, 1);
    assert.doesNotMatch(src, /playFromUri sending command for uri=/);
    assert.doesNotMatch(src, /devId=\$\{devId\}/);
});

// Spec nativeFetch (smali/com/melodix/music/AndBridge.smali) — not implemented here (no Java/apktool):
// 1. Parse URL; reject non-https, userinfo, non-443, IPv4/IPv6 literals, hosts other than
//    [*.]spotify.com / [*.]scdn.co — before URL.openConnection.
// 2. Follow redirects only to the same allowlist; cap hops.
// 3. Do not copy Cookie/Authorization from JS unless origin is already on that allowlist
//    (JS allowlist + wrapNativeFetchBridge are defense in depth only).
