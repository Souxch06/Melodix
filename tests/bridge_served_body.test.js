const assert = require('assert');
const fs = require('fs');
const path = require('path');
const vm = require('vm');
const { test } = require('node:test');
const { spawnSync } = require('child_process');

function read(rel) {
    return fs.readFileSync(path.join(__dirname, '..', rel), 'utf8');
}

function servedBody() {
    const flags = "window.__sfBridgeIntercepted=true;window.__sfBridgeAssetServed=true;window.__sfBridgePrefixExec=true;window.__sfBridgeLoadStage='asset-response-created';";
    const core = flags + read('assets/spotify_bridge.js');
    const header = (n) => `window.__sfBridgeServedBytes=${n};`;
    const len0 = Buffer.from(core, 'utf8').length;
    let digits = String(len0).length;
    let total = len0 + 29 + digits;
    if (String(total).length !== digits) total += 1;
    let body = header(total) + core;
    let bytes = Buffer.from(body, 'utf8');
    if (bytes.length !== total) {
        total = bytes.length;
        body = header(total) + core;
        bytes = Buffer.from(body, 'utf8');
    }
    return { body, bytes, total };
}

test('the exact intercepted body is valid JavaScript and matches Content-Length', () => {
    const { body, bytes, total } = servedBody();
    assert.equal(bytes.length, total);
    assert.equal(Number(body.match(/__sfBridgeServedBytes=(\d+)/)[1]), bytes.length);
    const tmp = path.join(__dirname, '..', 'build', 'served_spotify_bridge.js');
    fs.mkdirSync(path.dirname(tmp), { recursive: true });
    fs.writeFileSync(tmp, bytes);
    const check = spawnSync(process.execPath, ['--check', tmp], { encoding: 'utf8' });
    assert.equal(check.status, 0, check.stderr);
    assert.doesNotThrow(() => new Function(body));
});

test('evaluating the served body runs prefix then the IIFE head', () => {
    const { body } = servedBody();
    const window = {};
    const document = {
        readyState: 'complete',
        querySelector() { return null; },
        querySelectorAll() { return []; },
        getElementById() { return null; },
        createElement() { return { style: {}, setAttribute() {}, appendChild() {} }; },
        addEventListener() {},
        documentElement: { appendChild() {} },
        head: { appendChild() {} },
        body: { classList: { add() {}, contains() { return false; }, remove() {} }, style: { setProperty() {} }, appendChild() {} }
    };
    const sandbox = {
        window,
        document,
        Date,
        Math,
        String,
        Number,
        JSON,
        Array,
        Object,
        parseInt,
        setTimeout() { return 0; },
        clearTimeout() {},
        URL,
        Event: function Event() {},
        console
    };
    sandbox.window = sandbox;
    sandbox.globalThis = sandbox;
    vm.runInNewContext(body, sandbox);
    assert.equal(sandbox.__sfBridgeIntercepted, true);
    assert.equal(sandbox.__sfBridgeAssetServed, true);
    assert.equal(sandbox.__sfBridgePrefixExec, true);
    assert.equal(sandbox.__sfBridgeFileHeadExec, true);
    assert.equal(sandbox.__sfBridgeEntered, true);
    assert.equal(sandbox.__sfBridgeEntered, true);
    assert.ok(
        typeof sandbox.__sfBridgeLoadStage === 'string' && sandbox.__sfBridgeLoadStage.length > 0,
        'stage=' + sandbox.__sfBridgeLoadStage + ' err=' + sandbox.__sfBridgeLastError
    );
});

test('loader sets src after type/async and does not clobber an entered bridge', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const loaderAt = asset.indexOf('loaderJavascript');
    const loader = asset.slice(loaderAt, asset.indexOf('.end method', loaderAt));
    const srcIdx = loader.indexOf("s.src=");
    const typeIdx = loader.indexOf("s.type=");
    const asyncIdx = loader.indexOf("s.async=false");
    assert.ok(asyncIdx > 0 && typeIdx > 0 && srcIdx > typeIdx && srcIdx > asyncIdx);
    assert.match(loader, /prefix-only/);
    assert.match(loader, /exec-error:/);
    assert.match(read('smali/com/melodix/music/NativeBridgeAsset.smali'), /readAssetUtf8/);
    assert.doesNotMatch(
        asset.slice(asset.indexOf('responseForUrl'), asset.indexOf('readAssetUtf8')),
        /Lm9;->d/
    );
});
