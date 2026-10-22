const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function loadSanitize() {
    const src = read('assets/native_ui_shell.js');
    const start = src.indexOf('function sanitizeDiagnostic');
    const end = src.indexOf('\n    function recordShellError');
    assert.ok(start >= 0 && end > start, 'sanitizeDiagnostic must be present in the shell');
    return vm.runInNewContext(src.slice(start, end) + '\nsanitizeDiagnostic;');
}

test('shell and bridge redact diagnostics with the same cookie and token patterns', () => {
    const shell = read('assets/native_ui_shell.js');
    const bridge = read('assets/spotify_bridge.js');
    [
        'Set-Cookie:[redacted]',
        'Cookie:[redacted]',
        'Authorization:[redacted]',
        'Bearer [redacted]',
        'access_token|refresh_token|id_token|client_secret|code|sp_dc|sp_key|sessionid',
        '[redacted-jwt]'
    ].forEach((needle) => {
        assert.ok(shell.includes(needle), 'shell missing ' + needle);
        assert.ok(bridge.includes(needle), 'bridge missing ' + needle);
    });
    assert.match(bridge, /iife-throw:/);
    assert.doesNotMatch(bridge, /__sfBridgeLastError = \('iife-throw:' \+ String\(e/);
});

test('sanitizeDiagnostic redacts mixed secrets and keeps a secret-free message', () => {
    const sanitize = loadSanitize();
    const cookieHeader = sanitize('Cookie: sp_dc=fictif-dc-aaa; sessionid=fictif-session');
    assert.match(cookieHeader, /Cookie:\[redacted\]/);
    assert.doesNotMatch(cookieHeader, /fictif-/);
    const setCookie = sanitize('Set-Cookie: sp_key=fictif-key-bbb');
    assert.match(setCookie, /Set-Cookie:\[redacted\]/);
    assert.doesNotMatch(setCookie, /fictif-/);

    const headers = sanitize('Authorization: Basic fictif-basic Bearer aaa.bbb.ccc');
    assert.match(headers, /Authorization:\[redacted\]/);
    assert.match(headers, /Bearer \[redacted\]/);
    assert.doesNotMatch(headers, /fictif-basic|aaa\.bbb\.ccc/);

    const oauth = sanitize(
        'access_token=fictif-access refresh_token=fictif-refresh ' +
        'id_token=fictif-id client_secret=fictif-secret code=fictif-code'
    );
    assert.match(oauth, /access_token=\[redacted\]/);
    assert.match(oauth, /refresh_token=\[redacted\]/);
    assert.match(oauth, /id_token=\[redacted\]/);
    assert.match(oauth, /client_secret=\[redacted\]/);
    assert.match(oauth, /code=\[redacted\]/);
    assert.doesNotMatch(oauth, /fictif-/);
    const cookiesParams = sanitize('sp_dc=fictif-dc sp_key=fictif-key sessionid=fictif-session');
    assert.match(cookiesParams, /sp_dc=\[redacted\]/);
    assert.match(cookiesParams, /sp_key=\[redacted\]/);
    assert.match(cookiesParams, /sessionid=\[redacted\]/);
    assert.doesNotMatch(cookiesParams, /fictif-/);

    const mixed = sanitize(
        'load-failed Cookie: sp_dc=fictif-dc Authorization: Bearer fictif.jwt.val access_token=fictif-access'
    );
    assert.doesNotMatch(mixed, /fictif/);
    assert.match(mixed, /load-failed/);

    const jwt = sanitize('token=headerfake.payloadfake.signfakevalue');
    assert.match(jwt, /\[redacted-jwt\]/);
    assert.doesNotMatch(jwt, /payloadfake/);

    const plain = sanitize('script-error: load-failed');
    assert.equal(plain, 'script-error: load-failed');
});
