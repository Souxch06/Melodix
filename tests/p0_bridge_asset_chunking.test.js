'use strict';
// P0 bridge delivery regression tests.
//
// Historical phone traces showed that a single ~205 KB evaluateJavascript
// payload could be silently dropped. The current runtime asset is whitespace- and
// comment-minified to 104 KB, range reads are verified against the APK length,
// and native evaluation is only marked successful after __sfMelodixBridgeStarted
// is observed. These tests do not claim device verification.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.join(__dirname, '..');
const bridgePath = path.join(root, 'assets', 'spotify_bridge.js');
const bridgeSourcePath = path.join(root, 'scripts', 'spotify_bridge.source.js');
const shellPath = path.join(root, 'scripts', 'native_ui_shell.source.js');
const shellRuntimePath = path.join(root, 'assets', 'native_ui_shell.js');
const bridgeSmaliPath = path.join(root, 'smali', 'com', 'melodix', 'music', 'AndBridge.smali');

test('AndBridge exposes a whitelisted ranged reader for the bundled bridge', () => {
  const smali = fs.readFileSync(bridgeSmaliPath, 'utf8');
  assert.match(
    smali,
    /\.method public final readBundledAssetRange\(Ljava\/lang\/String;II\)Ljava\/lang\/String;/,
  );
  const methodAt = smali.indexOf('readBundledAssetRange(Ljava/lang/String;II)');
  const method = smali.slice(methodAt, smali.indexOf('.end method', methodAt));
  assert.match(method, /Landroid\/webkit\/JavascriptInterface;/);
  // Same strict whitelist as the full reader: only the bridge asset.
  assert.match(method, /const-string v0, "spotify_bridge\.js"/);
  // Reads through the shared asset reader (bridge bypasses the hotfix inside m9.d).
  assert.match(method, /Lm9;->d\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
  // Bounds are enforced before substring: empty for out-of-range windows.
  assert.match(method, /if-ltz p2, :range_done/);
  assert.match(method, /if-ge p2, v3, :range_done/);
  assert.match(method, /if-le p3, p2, :range_done/);
  assert.match(method, /Ljava\/lang\/String;->substring\(II\)Ljava\/lang\/String;/);
  // The full single-call reader is kept (legacy fallback + existing tests).
  assert.match(
    smali,
    /\.method public final readBundledAsset\(Ljava\/lang\/String;\)Ljava\/lang\/String;/,
  );

  const lengthAt = smali.indexOf('.method public final bundledAssetLength(Ljava/lang/String;)I');
  assert.ok(lengthAt > -1, 'the expected source length is exposed');
  const lengthMethod = smali.slice(lengthAt, smali.indexOf('.end method', lengthAt));
  assert.match(lengthMethod, /Landroid\/webkit\/JavascriptInterface;/);
  assert.match(lengthMethod, /const-string v0, "spotify_bridge\.js"/);
  assert.match(lengthMethod, /Lm9;->d\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
  assert.match(lengthMethod, /String;->length\(\)I/);
});

test('shell reassembles the bridge from ranges before the legacy reader', () => {
  const shell = fs.readFileSync(shellPath, 'utf8');
  const fnAt = shell.indexOf('function loadBundledBridge(name)');
  assert.ok(fnAt > -1, 'loadBundledBridge present');
  const fn = shell.slice(fnAt, shell.indexOf('window.__sfLoadBundledBridge', fnAt));
  // Expected total length and range read are both obtained through the bridge.
  assert.match(fn, /bundledAssetLength\(name\)/);
  assert.match(fn, /readBundledAssetRange\(name, offset, end\)/);
  assert.ok(
    fn.indexOf('readBundledAssetRange') < fn.indexOf('readBundledAsset(name)'),
    'range reader runs before the legacy single-call reader',
  );
  // A short but non-empty response advances by the received amount and keeps
  // reading until the expected total; it is not treated as EOF.
  assert.match(fn, /while \(calls < maxCalls && \(!expected \|\| offset < expected\)\)/);
  assert.match(fn, /offset \+= part\.length;/);
  assert.match(fn, /complete = expected > 0 \? received === expected/);
  assert.match(fn, /parts\.join\(''\)/);
  assert.match(fn, /var chunkSize = 48 \* 1024;/);
  assert.doesNotMatch(fn, /if \(part\.length < chunkSize\) break;/);
  // Only a complete source reaches the execution strategies.
  assert.match(fn, /if \(source && complete\) return executeBridgeSource\(source, name\);/);
  assert.match(fn, /bridge-read expected=/);
  assert.match(fn, /recordBridgeFailure\('read-asset', 'empty'\)/);
});

test('source bridge, compact runtime bridge and shell all parse after delivery changes', () => {
  for (const file of [bridgeSourcePath, bridgePath, shellPath, shellRuntimePath]) {
    const source = fs.readFileSync(file, 'utf8');
    assert.doesNotThrow(
      () => new vm.Script(source, { filename: path.basename(file) }),
      `${path.basename(file)} must stay valid JavaScript`,
    );
  }
  // Smoke-run the shell the way native_ui.test.js does: it must complete
  // without throwing in a plain VM context.
  const document = {
    readyState: 'complete',
    documentElement: {},
    querySelector: () => null,
    addEventListener: () => {}
  };
  const window = {
    location: {
      hostname: 'open.spotify.com',
      pathname: '/',
      href: 'https://open.spotify.com/',
      assign: () => {}
    },
    AndBridge: { onNativeUiReady: () => {}, onNativeUiData: () => {} },
    addEventListener: () => {},
    setTimeout: () => 1,
    clearTimeout: () => {}
  };
  assert.doesNotThrow(() => vm.runInNewContext(fs.readFileSync(shellPath, 'utf8'), { window, document, URL }));
});
