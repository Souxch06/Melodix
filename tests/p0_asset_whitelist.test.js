'use strict';
// P0 v36: executable tests for the AndBridge bundled-asset whitelist.
//
// The v35 whitelist was inverted: String.equals() returns 1 for the exact
// name "spotify_bridge.js", and the following `if-nez` jumped to the exit on
// that non-zero value, so the ONLY accepted name was rejected and arbitrary
// names reached the asset loader. A regex "the instruction exists" test cannot
// catch this; these tests parse the real smali of each method and execute its
// control flow in a minimal interpreter (const-string, if-*, move*,
// invoke-virtual/static on String and m9.d, return-*), then assert the
// observable behaviour: what is read, what is returned, what is never touched.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const bridgeSmaliPath = path.join(root, 'smali', 'com', 'melodix', 'music', 'AndBridge.smali');
const shellPath = path.join(root, 'assets', 'native_ui_shell.js');
const smali = fs.readFileSync(bridgeSmaliPath, 'utf8');

// ---------------------------------------------------------------------------
// Minimal smali control-flow interpreter. It executes the real instruction
// list of one method, so an inverted branch shows up as wrong behaviour.
// ---------------------------------------------------------------------------

function extractMethod(source, signatureFragment) {
  const at = source.indexOf(signatureFragment);
  assert.ok(at > -1, `method containing ${signatureFragment} exists`);
  const start = source.indexOf('\n', source.lastIndexOf('.method', at)) + 1;
  const end = source.indexOf('.end method', at);
  return source.slice(start, end);
}

function runSmaliMethod(methodSource, registers, env) {
  const regs = Object.assign({}, registers);
  const labels = {};
  const lines = methodSource.split('\n')
    .map((l) => l.trim())
    .filter((l) => l && !l.startsWith('#') && !l.startsWith('.'))
    .filter(Boolean);
  lines.forEach((line, index) => {
    if (line.startsWith(':')) labels[line.slice(1)] = index;
  });

  let lastResult = null;
  let pc = 0;
  const invoke = (line) => {
    const argsMatch = line.match(/invoke-(?:virtual|static|direct) \{([^}]*)\}, (.+)$/);
    const argRegs = argsMatch[1].split(',').map((s) => s.trim());
    const sig = argsMatch[2];
    const args = argRegs.map((r) => regs[r]);
    if (sig.includes('NativeAssetRunner') || sig.includes('runOnUiThread')) {
      env.runnerInvoked = true;
    } else if (sig.includes('->equals(')) {
      lastResult = args[0] === args[1] ? 1 : 0; // String.equals(null) -> false
    } else if (sig.includes('Ljava/lang/String;->length()')) {
      lastResult = args[0].length;
    } else if (sig.includes('Ljava/lang/String;->isEmpty()')) {
      lastResult = args[0].length === 0 ? 1 : 0;
    } else if (sig.includes('Ljava/lang/String;->substring(')) {
      const [s, startIdx, endIdx] = args;
      if (startIdx < 0 || endIdx > s.length || startIdx > endIdx) {
        throw new RangeError('StringIndexOutOfBoundsException');
      }
      lastResult = s.slice(startIdx, endIdx); // same semantics as Java substring
    } else if (sig.includes('Lm9;->d(')) {
      env.assetReads.push(args[0]);
      lastResult = env.assetProvider(args[0]);
    } else if (sig.includes('Ljava/lang/ref/Reference;->get()')) {
      lastResult = env.activity || null;
    } else if (sig.includes('-><init>(') || sig.includes('runOnUiThread') || sig.includes('NativeAssetRunner')) {
      env.runnerInvoked = true;
    } else {
      throw new Error(`invoke not simulated: ${sig}`);
    }
  };

  while (pc < lines.length) {
    const line = lines[pc];
    if (line.startsWith(':')) { pc += 1; continue; }
    if (line === 'return-object v1' || /^return-object /.test(line)) {
      return regs[line.split(/\s+/)[1]];
    }
    if (line === 'return-void') return undefined;

    let m;
    if ((m = line.match(/^const-string (\S+), "(.*)"$/))) {
      regs[m[1]] = m[2];
    } else if ((m = line.match(/^move-result(?:-object)? (\S+)$/))) {
      regs[m[1]] = lastResult;
    } else if ((m = line.match(/^move-object (\S+), (\S+)$/)) || (m = line.match(/^move (\S+), (\S+)$/))) {
      regs[m[1]] = regs[m[2]];
    } else if ((m = line.match(/^if-eqz (\S+), :(\S+)$/))) {
      if (regs[m[1]] === 0 || regs[m[1]] === null || regs[m[1]] === undefined) pc = labels[m[2]], (pc += 1), (pc -= 1);
    } else if ((m = line.match(/^if-nez (\S+), :(\S+)$/))) {
      if (!(regs[m[1]] === 0 || regs[m[1]] === null || regs[m[1]] === undefined)) pc = labels[m[2]], (pc += 1), (pc -= 1);
    } else if ((m = line.match(/^if-ltz (\S+), :(\S+)$/))) {
      if (regs[m[1]] < 0) pc = labels[m[2]], (pc += 1), (pc -= 1);
    } else if ((m = line.match(/^if-ge (\S+), (\S+), :(\S+)$/))) {
      if (regs[m[1]] >= regs[m[2]]) pc = labels[m[3]], (pc += 1), (pc -= 1);
    } else if ((m = line.match(/^if-le (\S+), (\S+), :(\S+)$/))) {
      if (regs[m[1]] <= regs[m[2]]) pc = labels[m[3]], (pc += 1), (pc -= 1);
    } else if (/^if-(eq|ne|lt|ge|le)\s/.test(line)) {
      throw new Error(`if form not simulated: ${line}`);
    } else if (/^invoke-/.test(line)) {
      invoke(line);
    } else if (/^(check-cast|new-instance|sget-object)/.test(line)) {
      if (/sget-object/.test(line)) {
        const mm = line.match(/^sget-object ([vp]\d+)/);
        regs[mm[1]] = env.appSingletonField || null;
      }
      // check-cast and new-instance carry no behaviour in these methods.
    } else {
      throw new Error(`instruction not simulated: ${line}`);
    }
    pc += 1;
  }
  return undefined;
}

function makeEnv(assetContents) {
  return {
    assetProvider: (name) => {
      if (!(name in assetContents)) throw new Error(`AssetManager.open would fail for ${name}`);
      return assetContents[name];
    },
    assetReads: [],
    runnerInvoked: false
  };
}

const CONTENT = '0123456789'.repeat(20); // 200 chars, easy substring checks
const readRangeMethod = extractMethod(smali, 'readBundledAssetRange(Ljava/lang/String;II)');
const readFullMethod = extractMethod(smali, 'readBundledAsset(Ljava/lang/String;)Ljava/lang/String;');
const injectMethod = extractMethod(smali, 'injectBundledAsset(Ljava/lang/String;)V');

function runRange(name, start, end, env) {
  return runSmaliMethod(readRangeMethod, { p0: 'AndBridge', p1: name, p2: start, p3: end }, env);
}
function runFull(name, env) {
  return runSmaliMethod(readFullMethod, { p0: 'AndBridge', p1: name }, env);
}

// ---------------------------------------------------------------------------
// 1. The exact name reaches the asset reader.
// ---------------------------------------------------------------------------

test('whitelist: "spotify_bridge.js" reaches the asset reader', () => {
  const env = makeEnv({ 'spotify_bridge.js': CONTENT });
  assert.equal(runFull('spotify_bridge.js', env), CONTENT);
  assert.deepEqual(env.assetReads, ['spotify_bridge.js']);
  const env2 = makeEnv({ 'spotify_bridge.js': CONTENT });
  assert.equal(runRange('spotify_bridge.js', 0, 5, env2), '01234');
  assert.deepEqual(env2.assetReads, ['spotify_bridge.js']);
});

// ---------------------------------------------------------------------------
// 2. Any other name returns empty without reading an arbitrary asset.
// ---------------------------------------------------------------------------

test('whitelist: other names return "" and never reach the asset reader', () => {
  for (const name of ['other.js', 'assets/spotify_bridge.js', 'SPOTIFY_BRIDGE.JS', 'spotify_bridge.js.bak', '']) {
    const env = makeEnv({ 'spotify_bridge.js': CONTENT, 'other.js': 'SECRET' });
    assert.equal(runFull(name, env), '', `readBundledAsset(${JSON.stringify(name)})`);
    assert.deepEqual(env.assetReads, [], `no asset read for ${JSON.stringify(name)}`);
    const env2 = makeEnv({ 'spotify_bridge.js': CONTENT, 'other.js': 'SECRET' });
    assert.equal(runRange(name, 0, 5, env2), '', `readBundledAssetRange(${JSON.stringify(name)})`);
    assert.deepEqual(env2.assetReads, [], `no asset read for ${JSON.stringify(name)}`);
  }
  const env = makeEnv({ 'spotify_bridge.js': CONTENT });
  assert.equal(runFull(null, env), '', 'null name refused');
  assert.equal(runRange(null, 0, 5, env), '', 'null name refused');
  assert.deepEqual(env.assetReads, []);
});

// ---------------------------------------------------------------------------
// 3. A valid range returns exactly the right characters.
// ---------------------------------------------------------------------------

test('range: a valid window returns exactly the right characters', () => {
  const env = makeEnv({ 'spotify_bridge.js': CONTENT });
  assert.equal(runRange('spotify_bridge.js', 7, 13, env), CONTENT.slice(7, 13));
  assert.equal(runRange('spotify_bridge.js', 0, CONTENT.length, env), CONTENT);
  assert.equal(runRange('spotify_bridge.js', 199, 200, env), '9');
});

// ---------------------------------------------------------------------------
// 4. Out-of-range windows return "" without throwing; oversized ends clamp.
// ---------------------------------------------------------------------------

test('range: out-of-bounds windows return "" without exception', () => {
  const env = makeEnv({ 'spotify_bridge.js': CONTENT });
  assert.equal(runRange('spotify_bridge.js', -5, 10, env), '', 'negative start');
  assert.equal(runRange('spotify_bridge.js', CONTENT.length, CONTENT.length + 5, env), '', 'start past end');
  assert.equal(runRange('spotify_bridge.js', 10, 10, env), '', 'empty window');
  assert.equal(runRange('spotify_bridge.js', 10, 5, env), '', 'inverted window');
  // An oversized end must clamp to the content end, not throw and not lose data.
  assert.equal(runRange('spotify_bridge.js', 195, 9999, env), CONTENT.slice(195));
});

// ---------------------------------------------------------------------------
// 5. Successive windows rebuild the source exactly (no loss, no duplication).
// ---------------------------------------------------------------------------

test('range: successive windows rebuild the source exactly', () => {
  const big = 'X'.repeat(48 * 1024 * 2) + 'END'; // two full chunks + tail
  const env = makeEnv({ 'spotify_bridge.js': big });
  const chunkSize = 48 * 1024;
  const parts = [];
  let offset = 0;
  for (;;) {
    const part = runRange('spotify_bridge.js', offset, offset + chunkSize, env);
    assert.equal(typeof part, 'string');
    if (!part) break;
    parts.push(part);
    offset += part.length;
    if (part.length < chunkSize) break;
  }
  assert.equal(parts.join(''), big, 'reassembled content identical to source');
  assert.equal(parts.length, 3, 'two full chunks plus the tail');
});

// ---------------------------------------------------------------------------
// 6. The shell reads by ranges BEFORE the legacy single-call reader.
// ---------------------------------------------------------------------------

test('shell: ranged reader is used before the legacy single-call reader', () => {
  const shell = fs.readFileSync(shellPath, 'utf8');
  const fnAt = shell.indexOf('function loadBundledBridge(name)');
  assert.ok(fnAt > -1, 'loadBundledBridge present');
  const fn = shell.slice(fnAt, shell.indexOf('window.__sfLoadBundledBridge', fnAt));
  assert.ok(
    fn.indexOf('readBundledAssetRange') > -1 && fn.indexOf('readBundledAssetRange') < fn.indexOf('readBundledAsset(name)'),
    'range reader runs before the legacy reader',
  );
});

// ---------------------------------------------------------------------------
// Bonus: injectBundledAsset carries the same whitelist and must agree.
// ---------------------------------------------------------------------------

test('whitelist: injectBundledAsset accepts only "spotify_bridge.js"', () => {
  const env = makeEnv({ 'spotify_bridge.js': CONTENT, 'other.js': 'SECRET' });
  env.appSingletonField = {}; // AppSingleton.t reference, non-null
  env.activity = {};          // Reference.get() returns the activity
  runSmaliMethod(injectMethod, { p0: 'AndBridge', p1: 'other.js' }, env);
  assert.deepEqual(env.assetReads, [], 'foreign name never reaches m9.d');
  assert.equal(env.runnerInvoked, false);
  runSmaliMethod(injectMethod, { p0: 'AndBridge', p1: 'spotify_bridge.js' }, env);
  assert.deepEqual(env.assetReads, ['spotify_bridge.js']);
  assert.equal(env.runnerInvoked, true, 'bridge name reaches the native runner');
});
