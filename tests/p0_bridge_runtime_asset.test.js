'use strict';

const assert = require('node:assert/strict');
const crypto = require('node:crypto');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const historicalSuccessfulPayloadBytes = 108867; // pre-change native_ui_shell.js single-evaluation size
const maxRangedBridgeBytes = 3 * 48 * 1024; // the bridge loader reads at most three full ranges for this asset

function verifyGeneratedAsset(name) {
  const source = fs.readFileSync(path.join(root, 'scripts', `${name}.source.js`), 'utf8');
  const runtime = fs.readFileSync(path.join(root, 'assets', `${name}.js`), 'utf8');
  const header = runtime.match(new RegExp(
    `^/\\* generated from scripts/${name}\\.source\\.js; sha256=([0-9a-f]{64}); terser=5\\.51\\.2; no-compress,no-mangle \\*/\\n`
  ));
  assert.ok(header, `${name}.js carries the pinned generator and source hash`);
  const actualHash = crypto.createHash('sha256').update(source).digest('hex');
  assert.equal(header[1], actualHash, `${name}.js must be regenerated after source changes`);
  const maxBytes = name === 'spotify_bridge' ? maxRangedBridgeBytes : historicalSuccessfulPayloadBytes;
  assert.ok(Buffer.byteLength(runtime, 'utf8') < maxBytes,
    name === 'spotify_bridge'
      ? `${name}.js must remain below three 48 KiB native asset ranges`
      : `${name}.js must remain smaller than the 108867-byte shell already executed on-device`);
  assert.doesNotThrow(() => new vm.Script(runtime, { filename: `assets/${name}.js` }));
  assert.doesNotThrow(() => new vm.Script(source, { filename: `scripts/${name}.source.js` }));
  return { source, runtime };
}

test('production bridge and shell assets are reproducible, parseable, and payload-bounded', () => {
  const bridge = verifyGeneratedAsset('spotify_bridge');
  const shell = verifyGeneratedAsset('native_ui_shell');
  const home = verifyGeneratedAsset('melodix_home');
  assert.ok(bridge.runtime.includes('__sfMelodixBridgeStarted'));
  assert.ok(bridge.runtime.includes('__sfMelodixBridgeCompleted'));
  assert.ok(shell.runtime.includes('__sfLoadBundledBridge'));
  assert.ok(shell.runtime.includes('bundledAssetLength'));
  assert.ok(home.runtime.includes('SF_MELODIX_HOME_STYLES_V1'));
  assert.ok(home.runtime.includes('sf-melodix-home-active'));
  assert.ok(!bridge.runtime.includes('updateMelodixHome'),
    'the large optional renderer stays in its own executable asset');

  const client = fs.readFileSync(path.join(root, 'smali/c91.smali'), 'utf8');
  const shellAt = client.indexOf('const-string v5, "native_ui_shell.js"');
  const bridgeAt = client.indexOf("(window.__sfLoadBundledBridge||function(){})(\\'spotify_bridge.js\\');");
  const homeAt = client.indexOf('const-string v5, "melodix_home.js"');
  const probeAt = client.indexOf('AndBridge;->runProbe(Landroid/webkit/WebView;)V', homeAt);
  assert.ok(shellAt >= 0 && bridgeAt > shellAt && homeAt > bridgeAt && probeAt > homeAt,
    'the shell, bounded bridge, independent Home renderer and native probe are queued in order');
  assert.match(client.slice(homeAt, probeAt), /Lm9;->d\(Ljava\/lang\/String;\)Ljava\/lang\/String;[\s\S]*?evaluateJavascript/);
  assert.match(client.slice(homeAt, probeAt), /"home-renderer-queued"[\s\S]*?NativeCrashGuard;->stage/,
    'the native chain distinguishes queuing the independent renderer from its JS init trace');
});
