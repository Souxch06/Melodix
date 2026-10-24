const assert = require('assert');
const fs = require('fs');
const path = require('path');
const { test } = require('node:test');

function read(rel) {
    return fs.readFileSync(path.join(__dirname, '..', rel), 'utf8');
}

function readAssetMethod() {
    const smali = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const at = smali.indexOf('.method private static readAssetUtf8');
    return smali.slice(at, smali.indexOf('.end method', at));
}

test('readAssetUtf8 continues when a Context exists and only fails when it is null', () => {
    const method = readAssetMethod();
    assert.match(method, /if-eqz v1, :read_fail/);
    assert.doesNotMatch(method, /if-nez v1, :done/);
    assert.doesNotMatch(method, /if-nez v1, :read_fail/);
});

test('readAssetUtf8 keeps reading 4096-byte chunks until EOF (-1)', () => {
    const method = readAssetMethod();
    assert.match(method, /const\/16 v3, 0x1000/);
    assert.match(method, /if-ltz v4, :read_done/);
    assert.doesNotMatch(method, /if-gez v4, :read_done/);
    assert.match(method, /ByteArrayOutputStream;->write\(\[BII\)V/);
    assert.match(method, /goto :read_loop/);
    assert.match(method, /toString\(Ljava\/lang\/String;\)/);
    assert.match(method, /UTF-8/);
    assert.match(method, /move-exception v6/);
    assert.match(method, /NativeCrashGuard;->record/);
});

test('the smali read loop copies every chunk of a payload larger than 4096 bytes', () => {
    // Mirrors readAssetUtf8: write while n >= 0 is wrong; write while n >= 0
    // after if-ltz (stop only on n < 0) is the corrected control flow.
    function readLoop(bytes, chunk, opcode) {
        const out = [];
        let offset = 0;
        for (;;) {
            const remaining = bytes.length - offset;
            const n = remaining <= 0 ? -1 : Math.min(chunk, remaining);
            const stop = opcode === 'if-gez' ? n >= 0 : n < 0;
            if (stop) break;
            out.push(...bytes.slice(offset, offset + n));
            offset += n;
        }
        return Buffer.from(out);
    }

    const payload = Buffer.from('é'.repeat(5000) + 'fin', 'utf8');
    assert.ok(payload.length > 4096, 'fixture must span several 4KiB blocks');
    const broken = readLoop(payload, 4096, 'if-gez');
    const fixed = readLoop(payload, 4096, 'if-ltz');
    assert.ok(broken.length < payload.length, 'if-gez stops on the first successful read');
    assert.equal(fixed.length, payload.length);
    assert.equal(fixed.toString('utf8'), payload.toString('utf8'));
    assert.ok(fixed.toString('utf8').endsWith('fin'));
});

test('responseForUrl still prefixes the asset and advertises the UTF-8 byte length', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const method = asset.slice(asset.indexOf('.method public static responseForUrl'), asset.indexOf('.method private static readAssetUtf8'));
    assert.match(method, /readAssetUtf8/);
    assert.match(method, /__sfBridgePrefixExec=true/);
    assert.match(method, /Content-Length/);
    assert.match(method, /getBytes\(Ljava\/lang\/String;\)\[B/);
    assert.match(method, /array-length v4/);
    assert.doesNotMatch(method, /Lm9;->d/);
});
