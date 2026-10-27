// Bridge startup diagnostics: the emulator test engine reads logcat
// MDXTRACE:I. These tests pin that every decisive startup-chain event is
// mirrored there (bounded, secret-free), so the run can tell apart:
//   - bridge not executed   (bridge-asset served/miss + js-shell begin absent)
//   - blocked callback      (lib-push blocked no-bridge|no-method, js-cb no-bridge)
//   - transmission error    (lib-push err / libdiag drop epoch while JS pushed ok)
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('DiagCounters.event mirrors bounded lines to logcat MDXTRACE:I', () => {
    const src = read('smali/com/melodix/music/DiagCounters.smali');
    const m = src.indexOf('.method public static declared-synchronized event');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /const-string v2, "MDXTRACE"/);
    assert.match(body, /Landroid\/util\/Log;->i\(Ljava\/lang\/String;Ljava\/lang\/String;\)I/);
    // The mirror happens for every event, before the in-app RAM cap can drop it.
    const mirror = body.indexOf('Landroid/util/Log;->i');
    const ramCap = body.indexOf('logLines:I');
    assert.ok(mirror > 0 && ramCap > mirror,
        'the logcat mirror must run before the in-app buffer cap returns early');
    // Same bounded shape as the in-app buffer: normalized + 128-char clip.
    assert.match(body, /const\/16 v2, 0x80/);
    assert.match(body, /clip\(Ljava\/lang\/String;I\)Ljava\/lang\/String;/);
});

test('libState journals a count-only summary, never the payload', () => {
    const src = read('smali/com/melodix/music/DiagCounters.smali');
    const m = src.indexOf('.method public static libState');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /"lib-state n="/, 'the summary carries the call count');
    assert.match(body, /" len="/, 'the summary carries the received length');
    assert.match(body, /Landroid\/util\/Log;->i\(Ljava\/lang\/String;Ljava\/lang\/String;\)I/);
    // The payload (p0) must never reach Log.i: only the StringBuilder summary.
    assert.ok(!/Log;->i[^;]*p0/.test(body), 'the payload is never logged');
});

test('onLibDiagState journals epoch/empty drops instead of failing silently', () => {
    const src = read('smali/com/melodix/music/AndBridge.smali');
    const m = src.indexOf('.method public final onLibDiagState');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /"libdiag drop epoch"/,
        'a rejected call must be journaled so calls=0 is distinguishable from a blocked callback');
    assert.match(body, /"libdiag drop empty"/);
    // The drop traces must run through the MDXTRACE mirror (DiagCounters.event).
    assert.match(body, /DiagCounters;->event\(Ljava\/lang\/String;\)V/);
});

test('responseForUrl journals served/miss outcomes of the bridge asset', () => {
    const src = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const m = src.indexOf('.method public static responseForUrl');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /"bridge-asset served"/, 'a served asset is the first executable link');
    assert.match(body, /"bridge-asset-miss"/, 'a failed asset read must not fail silently');
    assert.match(body, /"bridge-asset-miss exc"/);
});

test('the shell already distinguishes the three failure families on the journal', () => {
    const src = read('assets/native_ui_shell.js');
    // Blocked callback family.
    assert.match(src, /logDiagEvent\('lib-push blocked ' \+ next\)/);
    assert.match(src, /markLibPushBlocked\(!bridge \? 'no-bridge' : 'no-method'\)/);
    // Healthy transmission.
    assert.match(src, /logDiagEvent\('lib-push ok'\)/);
    // Transmission error family.
    assert.match(src, /logDiagEvent\('lib-push err ' \+ n\.slice\(0, 40\)\)/);
    // Not-executed family: stage-only failure reports (no error text).
    assert.match(src, /logDiagEvent\('js-bridge err ' \+ String\(stage \|\| 'unknown'\)\)/);
    // The shell start marker proves the shell itself executed.
    assert.match(src, /logDiagEvent\('js-shell begin'\)/);
});

test('startup trace labels carry no secret-shaped content', () => {
    const files = [
        'smali/com/melodix/music/DiagCounters.smali',
        'smali/com/melodix/music/AndBridge.smali',
        'smali/com/melodix/music/NativeBridgeAsset.smali'
    ];
    const secret = /token|cookie|authorization|bearer|sp_dc|sessionid|password/i;
    const labels = [];
    for (const file of files) {
        const src = read(file);
        // Every string literal fed to DiagCounters.event in these files.
        const re = /const-string [vp]\d+, "([^"]+)"[\s\S]{0,240}?DiagCounters;->event/g;
        let match;
        while ((match = re.exec(src)) !== null) labels.push([file, match[1]]);
    }
    assert.ok(labels.length >= 6, `expected the known startup labels, found ${labels.length}`);
    for (const [file, label] of labels) {
        assert.ok(!secret.test(label), `secret-shaped label in ${file}: ${label}`);
    }
    // The shell never sends error text over the journal channel (stage only).
    const shell = read('assets/native_ui_shell.js');
    assert.ok(!/logDiagEvent\('js-bridge err ' \+ message/.test(shell),
        'recordBridgeFailure announces the stage only, never the message');
});

test('the emulator engine reads exactly the tag these traces use', () => {
    const wf = read('.github/workflows/test-preview-emulator.yml');
    assert.match(wf, /logcat -d -s MDXTRACE:I/, 'the engine polls MDXTRACE:I');
    assert.match(wf, /stages=/, 'the polled trace feed is reported to the run');
});
