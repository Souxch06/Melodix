'use strict';

const assert = require('node:assert/strict');
const crypto = require('node:crypto');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const historicalSuccessfulPayloadBytes = 108867; // pre-change native_ui_shell.js

function verifyGeneratedAsset(name) {
  const source = fs.readFileSync(path.join(root, 'scripts', `${name}.source.js`), 'utf8');
  const runtime = fs.readFileSync(path.join(root, 'assets', `${name}.js`), 'utf8');
  const header = runtime.match(new RegExp(
    `^/\\* generated from scripts/${name}\\.source\\.js; sha256=([0-9a-f]{64}); terser=5\\.51\\.2; no-compress,no-mangle \\*/\\n`
  ));
  assert.ok(header, `${name}.js carries the pinned generator and source hash`);
  const actualHash = crypto.createHash('sha256').update(source).digest('hex');
  assert.equal(header[1], actualHash, `${name}.js must be regenerated after source changes`);
  assert.ok(Buffer.byteLength(runtime, 'utf8') < historicalSuccessfulPayloadBytes,
    `${name}.js must remain smaller than the 108867-byte shell already executed on-device`);
  assert.doesNotThrow(() => new vm.Script(runtime, { filename: `assets/${name}.js` }));
  assert.doesNotThrow(() => new vm.Script(source, { filename: `scripts/${name}.source.js` }));
  return { source, runtime };
}

test('production bridge and shell assets are reproducible, parseable, and payload-bounded', () => {
  const bridge = verifyGeneratedAsset('spotify_bridge');
  const shell = verifyGeneratedAsset('native_ui_shell');
  assert.ok(bridge.runtime.includes('__sfMelodixBridgeStarted'));
  assert.ok(bridge.runtime.includes('__sfMelodixBridgeCompleted'));
  assert.ok(bridge.runtime.includes('initializeMelodixHome'));
  assert.ok(shell.runtime.includes('__sfLoadBundledBridge'));
  assert.ok(shell.runtime.includes('bundledAssetLength'));
});
