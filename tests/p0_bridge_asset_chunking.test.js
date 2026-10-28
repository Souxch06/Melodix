'use strict';
// P0 v35: chunked bridge asset transfer.
//
// Device traces (runtime diagnostic v2, phone) proved that a single transfer
// of the ~200 KB spotify_bridge.js is silently dropped end to end: the direct
// evaluateJavascript injection never starts the bridge and the Javascript-
// Interface fallback returns an empty string ("read-asset: empty"), leaving
// the home screen stuck on "Chargement des playlists...". The repair re-reads
// the asset in fixed-size ranges (AndBridge.readBundledAssetRange) and runs
// the reassembled source locally. These tests assert that repair exists and
// keeps every guard of the old path; they do not claim device verification.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.join(__dirname, '..');
const bridgePath = path.join(root, 'assets', 'spotify_bridge.js');
const shellPath = path.join(root, 'assets', 'native_ui_shell.js');
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
  // Reads through the shared asset cache/loader.
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
});

test('shell reassembles the bridge from ranges before the legacy reader', () => {
  const shell = fs.readFileSync(shellPath, 'utf8');
  const fnAt = shell.indexOf('function loadBundledBridge(name)');
  assert.ok(fnAt > -1, 'loadBundledBridge present');
  const fn = shell.slice(fnAt, shell.indexOf('window.__sfLoadBundledBridge', fnAt));
  // Ranged read is the preferred path.
  assert.match(fn, /readBundledAssetRange\(name, offset, offset \+ chunkSize\)/);
  assert.ok(
    fn.indexOf('readBundledAssetRange') < fn.indexOf('readBundledAsset(name)'),
    'range reader runs before the legacy single-call reader',
  );
  // Chunks are bounded and concatenated before execution.
  assert.match(fn, /parts\.join\(''\)/);
  assert.match(fn, /var chunkSize = \d+ \* 1024;/);
  // The loop runs until the known total length (short returns must not
  // truncate the source; see p0_bridge_exec_recovery.test.js).
  assert.match(fn, /totalLength > 0 \? offset >= totalLength : part\.length < chunkSize/);
  assert.match(fn, /window\.AndBridge\.bundledAssetLength/);
  // The reassembled source is executed by the multi-strategy runner.
  assert.match(fn, /if \(source\) return executeBridgeSource\(source\);/);
  // Empty asset is still reported exactly as before.
  assert.match(fn, /recordBridgeFailure\('read-asset', 'empty'\);/);
});

test('shell and bridge still parse after the ranged-reader change', () => {
  for (const file of [bridgePath, shellPath]) {
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
