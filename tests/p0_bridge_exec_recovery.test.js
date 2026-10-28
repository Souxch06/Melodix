'use strict';
// P0 v37: bridge execution and recovery, tested against the v36 device trace.
//
// Phone trace (v36): bridgeBytes 146452, bridgeExecMode "blob", bridgeStarted
// false, bridgeCspViolation "script-src-elem inline". The bridge source is
// 204584 UTF-16 units and a perfect ranged read yields [49152, 49152, 49152,
// 49152, 7976]; 146452 = [49152, 49152, 48148] exactly: the third ranged
// return came back SHORT (48148 of 49152) and the old loop's
// "if (part.length < chunkSize) break" silently dropped the remaining 58132
// units. Every execution strategy then failed on the incomplete script.
// These tests drive the REAL shell code in a VM with a bridge stub that
// returns short windows, and assert the loop, the per-strategy journal, the
// blob onerror hook, the non-overwriting CSP journal, the start signal rule,
// and the recovery/double-init guards.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.join(__dirname, '..');
const shellPath = path.join(root, 'assets', 'native_ui_shell.js');
const shellSrc = fs.readFileSync(shellPath, 'utf8');
const bridgeSrc = fs.readFileSync(path.join(root, 'assets', 'spotify_bridge.js'), 'utf8');
const bridgeSmali = fs.readFileSync(
  path.join(root, 'smali', 'com', 'melodix', 'music', 'AndBridge.smali'),
  'utf8',
);

const TOTAL = bridgeSrc.length; // 204584 units on the real asset

// A ranged reader that behaves like the device bridge: full windows except
// the third call, which comes back at 48148 units (the observed value).
function shortThirdCallReader(content) {
  let call = 0;
  return (name, start, end) => {
    call += 1;
    let windowEnd = end;
    if (call === 3) windowEnd = Math.min(end, start + 48148);
    return content.slice(start, Math.min(windowEnd, content.length));
  };
}

// The old v35/v36 loop, kept here as living documentation of the bug.
function oldLoop(reader, chunkSize) {
  const parts = [];
  let offset = 0;
  for (;;) {
    const part = String(reader('spotify_bridge.js', offset, offset + chunkSize) || '');
    if (!part) break;
    parts.push(part);
    offset += part.length;
    if (part.length < chunkSize) break;
  }
  return parts.join('');
}

function runShell(overrides) {
  const pendingTimers = [];
  const createdScripts = [];
  const AndBridge = Object.assign({
    onNativeUiReady: () => {},
    onNativeUiData: () => {},
    bundledAssetLength: () => TOTAL,
    readBundledAssetRange: shortThirdCallReader(bridgeSrc),
    readBundledAsset: () => '', // legacy path stays empty: ranges must win
  }, (overrides && overrides.AndBridge) || {});
  const document = {
    readyState: 'complete',
    documentElement: {},
    querySelector: () => null,
    getElementById: () => null,
    addEventListener: (type, handler) => {
      if (type === 'securitypolicyviolation') document._cspHandler = handler;
    },
    createElement: (tag) => {
      const node = {
        tagName: tag,
        textContent: '',
        src: '',
        parentNode: null,
        onerror: null,
        onload: null,
      };
      if (overrides && overrides.onCreateElement) overrides.onCreateElement(node);
      createdScripts.push(node);
      return node;
    },
    head: {
      appendChild(node) {
        node.parentNode = this;
        if (overrides && overrides.onAppend) overrides.onAppend(node);
      },
      removeChild() {},
    },
  };
  const window = {
    location: {
      hostname: 'open.spotify.com',
      pathname: '/',
      href: 'https://open.spotify.com/',
      assign: () => {},
    },
    AndBridge,
    addEventListener: () => {},
    setTimeout: (fn) => { pendingTimers.push(fn); return pendingTimers.length; },
    clearTimeout: () => {},
  };
  const URL = {
    createObjectURL: () => 'blob:mock-url',
    revokeObjectURL: () => {},
  };
  class Blob { constructor(parts) { this.parts = parts; } }
  vm.runInNewContext(shellSrc, { window, document, URL, Blob, console });
  return { window, document, pendingTimers, createdScripts, runAttempts: () => {
    // Run one generation of timers: a scheduled retry that re-arms itself is
    // NOT run again until the next call.
    const batch = pendingTimers.splice(0, pendingTimers.length);
    batch.forEach((fn) => fn());
  } };
}

test('repro: the v36 short third return truncates to 146452 with the old loop', () => {
  const truncated = oldLoop(shortThirdCallReader(bridgeSrc), 48 * 1024);
  assert.equal(truncated.length, 146452, 'old loop reproduces the exact device trace');
  assert.equal(bridgeSrc.length, 204584, 'full source length unchanged');
});

test('ranged reads reach the full length despite short returns', () => {
  const env = runShell();
  env.runAttempts(); // 1.2s recovery attempt -> loadBundledBridge
  assert.equal(env.window.__sfBridgeReadLog.total, TOTAL);
  assert.equal(env.window.__sfBridgeReadLog.got, TOTAL, 'no unit is lost');
  assert.equal(env.window.__sfBridgeBytes, TOTAL, 'executeBridgeSource saw the full source');
  // The legacy reader returned '' on purpose: only ranges may provide it.
  assert.ok(env.window.__sfBridgeExecSteps.some((s) => s.step === 'inline-script'));
});

test('every CSP violation is journaled with its fields and never overwritten', () => {
  const env = runShell();
  env.runAttempts();
  assert.ok(env.document._cspHandler, 'securitypolicyviolation listener installed');
  env.document._cspHandler({
    effectiveDirective: 'script-src-elem',
    violatedDirective: 'script-src-elem',
    blockedURI: 'inline',
  });
  env.document._cspHandler({
    effectiveDirective: 'script-src-elem',
    violatedDirective: 'script-src-elem',
    blockedURI: 'blob',
  });
  const journal = env.window.__sfBridgeCspViolations;
  assert.equal(journal.length, 2, 'both violations kept');
  assert.equal(journal[0].blockedURI, 'inline');
  assert.equal(journal[1].blockedURI, 'blob');
  assert.equal(journal[0].effectiveDirective, 'script-src-elem');
  assert.equal(journal[1].violatedDirective, 'script-src-elem');
});

test('blob script load errors are journaled through onerror', () => {
  // Force every strategy to fail: create/append throw for the inline node,
  // eval/Function reject the source, then the blob node fires onerror.
  const env = runShell({
    AndBridge: {
      bundledAssetLength: () => 6,
      readBundledAssetRange: () => 'window.x', // valid syntax, never starts the bridge
      readBundledAsset: () => '',
    },
    onAppend(node) {
      if (node.src) {
        // The browser reports a blocked/unloadable blob script.
        if (node.onerror) node.onerror(new Error('load failed'));
      }
    },
  });
  env.runAttempts();
  const steps = env.window.__sfBridgeExecSteps;
  const blobFailure = steps.find((s) => s.step === 'blob' && s.status === 'failed');
  assert.ok(blobFailure, 'blob failure journaled');
  assert.equal(blobFailure.detail, 'script-load-error');
});

test('success is only declared by the bridge start signal, not by DOM insertion', () => {
  // The source starts the bridge when executed (eval path). The inline node
  // is appended successfully but never runs the code in this mock, so the
  // inline injection alone must NOT be declared successful.
  const env = runShell({
    AndBridge: {
      bundledAssetLength: () => 40,
      readBundledAssetRange: () => 'window.__sfMelodixBridgeStarted = true;',
      readBundledAsset: () => '',
    },
    onCreateElement(node) {
      // node.textContent is never executed by the mock DOM: DOM insertion
      // must not count as a start even when it succeeds.
      node.parentNode = null;
    },
  });
  env.runAttempts();
  assert.equal(env.window.__sfMelodixBridgeStarted, true, 'bridge really started via eval');
  assert.equal(env.window.__sfBridgeExecMode, 'eval', 'the executing strategy is reported');
  const inline = env.window.__sfBridgeExecSteps.find((s) => s.step === 'inline-script');
  assert.equal(inline.status, 'injected', 'inline was injected...');
  assert.notEqual(env.window.__sfBridgeExecMode, 'inline-script', '...but not credited');
});

test('recovery stops once the bridge starts and never reloads it', () => {
  let rangeReads = 0;
  const env = runShell({
    AndBridge: {
      bundledAssetLength: () => 2,
      readBundledAssetRange: () => { rangeReads += 1; return ''; },
      readBundledAsset: () => '',
    },
  });
  env.runAttempts(); // attempt 1: empty read, schedules attempt 2
  assert.equal(rangeReads, 1);
  assert.equal(env.window.__sfNativeUiBridgeRecoveryAttempts, 1);
  // The bridge starts between attempts (e.g. the pending blob finally ran).
  env.window.__sfMelodixBridgeStarted = true;
  env.runAttempts(); // attempt 2: must short-circuit
  assert.equal(rangeReads, 1, 'no reload after the start signal');
  assert.equal(env.window.__sfNativeUiBridgeRecovered, true);
});

test('the bridge itself refuses double initialisation', () => {
  const head = bridgeSrc.slice(0, 200);
  assert.match(head, /if \(window\.__sfMelodixBridgeCompleted\)/, 'guard at the very top');
  // loadBundledBridge also refuses to run once started.
  const fnAt = shellSrc.indexOf('function loadBundledBridge(name)');
  const fn = shellSrc.slice(fnAt, shellSrc.indexOf('window.__sfLoadBundledBridge', fnAt));
  assert.match(fn, /if \(bridgeHasStarted\(\)\) return true;/);
});

test('bundledAssetLength smali is whitelisted and returns the UTF-16 length', () => {
  const methodAt = bridgeSmali.indexOf('bundledAssetLength(Ljava/lang/String;)I');
  assert.ok(methodAt > -1);
  const method = bridgeSmali.slice(methodAt, bridgeSmali.indexOf('.end method', methodAt));
  assert.match(method, /Landroid\/webkit\/JavascriptInterface;/);
  assert.match(method, /const-string v0, "spotify_bridge\.js"/);
  assert.match(method, /if-eqz v0, :length_done/);
  assert.match(method, /Lm9;->d\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
  assert.match(method, /Ljava\/lang\/String;->length\(\)I/);
  // A null name returns 0 without reading.
  assert.match(method, /if-eqz p1, :length_done/);
});

test('diagnostic surfaces the v37 fields needed to verify on device', () => {
  // The JSON sample format (runtime_diagnostic.js) must expose the read log,
  // the per-strategy exec journal and the CSP journal, otherwise a phone
  // capture can never prove the fix ran.
  const diag = fs.readFileSync(path.join(root, 'assets', 'runtime_diagnostic.js'), 'utf8');
  for (const field of ['bridgeReadLog', 'bridgeExecSteps', 'bridgeCspViolations', 'bridgeAssetInfo']) {
    assert.ok(diag.includes(field + ':'), `runtime_diagnostic exposes ${field}`);
  }
  assert.match(diag, /__sfBridgeReadLog\.total/);
  assert.match(diag, /__sfBridgeReadLog\.source/);
  assert.match(diag, /__sfBridgeExecSteps/);
  assert.match(diag, /__sfBridgeCspViolations/);
  // The in-app report carries the same evidence.
  for (const field of ['bridgeBytes', 'bridgeExecMode', 'bridgeLastError', 'bridgeReadLine', 'bridgeExecSteps', 'bridgeCspCount']) {
    assert.ok(shellSrc.includes(field + ':'), `__sfDiagReport exposes ${field}`);
  }
  // The native panel formats them (NativeDiagCallback).
  const callback = fs.readFileSync(
    path.join(root, 'smali', 'com', 'melodix', 'music', 'NativeDiagCallback.smali'),
    'utf8',
  );
  for (const key of ['bridgeExecMode', 'bridgeReadLine', 'bridgeExecSteps', 'bridgeLastError', 'bridgeCspCount']) {
    assert.ok(callback.includes(`"${key}"`), `NativeDiagCallback formats ${key}`);
  }
});

test('the APK asset is the authoritative bridge source, served content is fallback', () => {
  // A stale filesDir/hotfixes/spotify_bridge.js was served instead of the
  // bundled asset (146452 vs 204584 units). The shell must read the APK
  // asset first and record which source it used.
  const apkContent = 'window.__sfMelodixBridgeStarted = true; // apk version';
  const env = runShell({
    AndBridge: {
      apkAssetInfo: () => 'apk=' + TOTAL + ',served=146452,hotfix=1',
      readApkAssetRange: (name, start, end) => apkContent.slice(start, Math.min(end, apkContent.length)),
      bundledAssetLength: () => 146452,
      readBundledAssetRange: () => { throw new Error('served reader must not be used'); },
      readBundledAsset: () => '',
    },
  });
  env.runAttempts();
  assert.equal(env.window.__sfBridgeReadLog.source, 'apk', 'APK asset chosen');
  assert.equal(env.window.__sfBridgeReadLog.total, TOTAL);
  assert.equal(env.window.__sfBridgeAssetInfo, 'apk=' + TOTAL + ',served=146452,hotfix=1');
  assert.equal(env.window.__sfMelodixBridgeStarted, true, 'the APK bridge version executed');
  assert.equal(env.window.__sfBridgeBytes, apkContent.length);
});

test('served-content fallback still works when no APK reader exists', () => {
  const env = runShell();
  env.runAttempts();
  assert.equal(env.window.__sfBridgeReadLog.source, 'served', 'fallback engaged');
  assert.equal(env.window.__sfBridgeReadLog.got, TOTAL);
});

test('readApkAssetRange smali reads AssetManager directly, never the hotfix cache', () => {
  const methodAt = bridgeSmali.indexOf('readApkAssetRange(Ljava/lang/String;II)');
  assert.ok(methodAt > -1);
  const method = bridgeSmali.slice(methodAt, bridgeSmali.indexOf('.end method', methodAt));
  assert.match(method, /Landroid\/webkit\/JavascriptInterface;/);
  assert.match(method, /const-string v0, "spotify_bridge\.js"/);
  assert.match(method, /if-eqz v0, :apk_range_done/);
  // Bounds enforced exactly like the served reader.
  assert.match(method, /if-ltz p2, :apk_range_done/);
  assert.match(method, /if-ge p2, v3, :apk_range_done/);
  assert.match(method, /if-le p3, p2, :apk_range_done/);
  assert.match(method, /Ljava\/lang\/String;->substring\(II\)Ljava\/lang\/String;/);
  // The shared helper must use AssetManager and must NOT go through m9.d
  // (the cache/hotfix layer that served the stale file).
  const helperAt = bridgeSmali.indexOf('.method private static readApkAsset(');
  assert.ok(helperAt > -1, 'private readApkAsset helper exists');
  const helper = bridgeSmali.slice(helperAt, bridgeSmali.indexOf('.end method', helperAt));
  assert.match(helper, /AssetManager;->open\(Ljava\/lang\/String;\)Ljava\/io\/InputStream;/);
  assert.ok(!helper.includes('Lm9;->d('), 'helper never touches the hotfix/cache loader');
  // apkAssetInfo documents both lengths and hotfix presence.
  const infoAt = bridgeSmali.indexOf('apkAssetInfo(Ljava/lang/String;)');
  const info = bridgeSmali.slice(infoAt, bridgeSmali.indexOf('.end method', infoAt));
  assert.match(info, /"apk="/);
  assert.match(info, /,served=/);
  assert.match(info, /hotfixes\/spotify_bridge\.js/);
});
