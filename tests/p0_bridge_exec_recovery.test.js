'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const shell = fs.readFileSync(path.join(__dirname, '..', 'scripts', 'native_ui_shell.source.js'), 'utf8');
const snippetStart = shell.indexOf('    var bridgeLoadAttempts = 0;');
const snippetEnd = shell.indexOf('    function install()', snippetStart);
assert.ok(snippetStart >= 0 && snippetEnd > snippetStart, 'bridge runner and recovery section are present');
const runnerSource = shell.slice(snippetStart, snippetEnd) +
  '\nwindow.__testExecuteBridgeSource = executeBridgeSource;' +
  '\nwindow.__testLoadBundledBridge = loadBundledBridge;' +
  '\nwindow.__testInstallBridgeRecovery = installBridgeRecovery;';

function makeHarness({ nativeStartDelay = null, blobAllowed = true } = {}) {
  let now = 0;
  let nextTimerId = 0;
  const timers = [];
  const nodes = [];
  const blobContents = new Map();
  const cspListeners = [];
  let nativeCalls = 0;
  let context;

  class FakeBlob {
    constructor(parts) {
      this.source = parts.join('');
    }
  }

  const window = {
    AndBridge: {
      injectBundledAsset(name) {
        nativeCalls += 1;
        assert.equal(name, 'spotify_bridge.js');
        // This mirrors the real JavascriptInterface contract: the Android call
        // posts work to the UI thread and returns no execution result.
        if (nativeStartDelay !== null) {
          window.setTimeout(() => { window.__sfMelodixBridgeStarted = true; }, nativeStartDelay);
        }
      }
    },
    setTimeout(callback, delay) {
      const id = ++nextTimerId;
      timers.push({ id, at: now + Number(delay || 0), callback });
      return id;
    },
    clearTimeout(id) {
      const at = timers.findIndex((timer) => timer.id === id);
      if (at >= 0) timers.splice(at, 1);
    }
  };

  const head = {
    appendChild(node) {
      node.parentNode = head;
      nodes.push(node);
      if (node.src) {
        if (!blobAllowed) {
          for (const listener of cspListeners) {
            listener({ effectiveDirective: 'script-src-elem', blockedURI: 'blob:' });
          }
          window.setTimeout(() => node.onerror && node.onerror(), 0);
          return node;
        }
        const blob = blobContents.get(node.src);
        assert.ok(blob, 'blob URL maps to the original bridge source');
        window.setTimeout(() => {
          vm.runInContext(blob.source, context, { filename: 'bridge-from-blob.js' });
          if (typeof node.onload === 'function') node.onload();
        }, 0);
      } else if (node.textContent) {
        // Simulate CSP rejecting an inline script without throwing from append.
        for (const listener of cspListeners) {
          listener({ effectiveDirective: 'script-src-elem', blockedURI: 'inline' });
        }
      }
      return node;
    },
    removeChild(node) {
      node.parentNode = null;
      return node;
    }
  };

  const document = {
    head,
    documentElement: head,
    createElement: (tagName) => ({ tagName }),
    addEventListener(type, callback) {
      if (type === 'securitypolicyviolation') cspListeners.push(callback);
    }
  };

  const URL = {
    createObjectURL(blob) {
      const url = `blob:melodix-test-${blobContents.size + 1}`;
      blobContents.set(url, blob);
      return url;
    },
    revokeObjectURL(url) { blobContents.delete(url); }
  };

  function blockedEval() {
    const error = new Error('blocked by CSP');
    error.name = 'EvalError';
    throw error;
  }
  function blockedFunction() {
    const error = new Error('blocked by CSP');
    error.name = 'EvalError';
    throw error;
  }

  context = vm.createContext({
    window,
    document,
    URL,
    Blob: FakeBlob,
    eval: blockedEval,
    Function: blockedFunction,
    diagTrace() {}
  });
  vm.runInContext(runnerSource, context, { filename: 'native_ui_shell.bridge-runner.js' });

  function runTimers() {
    let steps = 0;
    while (timers.length) {
      assert.ok(steps++ < 50, 'timer queue remains bounded');
      timers.sort((left, right) => left.at - right.at || left.id - right.id);
      const timer = timers.shift();
      now = timer.at;
      timer.callback();
    }
  }

  return {
    window,
    nodes,
    installRecovery() {
      window.__testInstallBridgeRecovery();
      // Remove only the recovery's initial 1200 ms timer; each test invokes the
      // real executeBridgeSource entry directly so timing stays deterministic.
      timers.length = 0;
    },
    run(source = 'window.__sfMelodixBridgeStarted = true;') {
      return window.__testExecuteBridgeSource(source, 'spotify_bridge.js');
    },
    load() {
      return window.__testLoadBundledBridge('spotify_bridge.js');
    },
    runTimers,
    get nativeCalls() { return nativeCalls; },
    get blobCount() { return nodes.filter((node) => Boolean(node.src)).length; }
  };
}

test('range reader continues after a short non-empty response and verifies the full source length', () => {
  const harness = makeHarness({ nativeStartDelay: null });
  const content = 'A'.repeat(49152) + 'B'.repeat(100);
  const requests = [];
  harness.window.AndBridge.bundledAssetLength = () => content.length;
  harness.window.AndBridge.readBundledAssetRange = (_name, start, end) => {
    requests.push([start, end]);
    // Emulate the reported WebView transport short-read at the first boundary.
    const actualEnd = start === 0 ? 48148 : end;
    return content.slice(start, actualEnd);
  };
  harness.installRecovery();
  harness.load();

  assert.deepEqual(requests, [[0, 49152], [48148, 49252]]);
  assert.deepEqual(JSON.parse(JSON.stringify(harness.window.__sfBridgeReadLog)), {
    expected: content.length,
    received: content.length,
    chunks: 2,
    complete: true,
    reader: 'range'
  });
  assert.equal(harness.window.__sfBridgeBytes, content.length);
  assert.equal(harness.window.__sfBridgeExecMode, 'native-inject-pending');
});

test('native evaluate request is pending until the bridge start marker arrives', () => {
  const harness = makeHarness({ nativeStartDelay: 25 });
  harness.installRecovery();
  const result = harness.run();

  assert.equal(result, false, 'a scheduled call is not synchronous execution success');
  assert.equal(harness.window.__sfBridgeExecMode, 'native-inject-pending');
  assert.equal(harness.window.__sfMelodixBridgeStarted, undefined);
  assert.equal(harness.nativeCalls, 1);

  harness.runTimers();
  assert.equal(harness.window.__sfMelodixBridgeStarted, true);
  assert.equal(harness.window.__sfBridgeExecMode, 'native-inject-started');
  assert.equal(harness.blobCount, 0, 'blob fallback is not raced against a successful native start');
});

test('a native request that returns without starting the bridge falls back and records real startup', () => {
  const harness = makeHarness({ nativeStartDelay: null, blobAllowed: true });
  harness.installRecovery();
  const result = harness.run();

  assert.equal(result, false);
  assert.equal(harness.window.__sfBridgeExecMode, 'native-inject-pending');
  assert.equal(harness.window.__sfMelodixBridgeStarted, undefined);

  harness.runTimers();
  assert.equal(harness.window.__sfMelodixBridgeStarted, true);
  assert.equal(harness.window.__sfBridgeExecMode, 'blob-started');
  assert.equal(harness.blobCount, 1);
  assert.ok(harness.window.__sfBridgeExecSteps.some((step) =>
    step.stage === 'native-inject' && step.status === 'failed-no-start'));
  assert.ok(harness.window.__sfBridgeExecSteps.some((step) =>
    step.stage === 'blob' && step.status === 'started'));
});

test('CSP telemetry keeps only the directive and blocked URI category', () => {
  const harness = makeHarness({ nativeStartDelay: null, blobAllowed: false });
  harness.installRecovery();
  harness.run();
  harness.runTimers();
  assert.equal(harness.window.__sfBridgeCspViolation, 'script-src-elem:blob');
  assert.doesNotMatch(JSON.stringify(harness.window.__sfBridgeExecSteps), /open\.spotify\.com|token|cookie/i);
});
