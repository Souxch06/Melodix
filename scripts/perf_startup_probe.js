#!/usr/bin/env node
/**
 * Offline startup probe for the native Home pipeline.
 *
 * WHY THIS EXISTS
 * ---------------
 * The optimisation question is "what takes the time between opening Home and
 * seeing playlists with their covers?" That breaks into two parts:
 *
 *   1. WALL-CLOCK stages on a real device (activity-create, WebView, page load,
 *      token, library request/response, first native paint). Only a device can
 *      measure those; `scripts/startup_timing_journal.py` extracts them from
 *      the app's own journal.
 *   2. PURE work the shell does in JavaScript, which is deterministic given a
 *      DOM and a payload: transforming rows, serialising the bridge payload,
 *      and how many times that payload is rebuilt. That can be measured here,
 *      on every commit, with no device and no Spotify account.
 *
 * This probe measures (2) only, and it says so. Its job is to quantify the
 * repeated-render symptom the reviewer saw in the journal ("several
 * `data native-payload` / `render native-rows` cycles") and to give the
 * cache/single-render work a number to improve.
 *
 * It runs the real `scripts/native_ui_shell.source.js` inside a `vm` context
 * with a synthetic, clearly-labelled fixture DOM (no account data), counts the
 * bridge payloads, and times the row transformation.
 *
 * Usage:
 *   node scripts/perf_startup_probe.js            # human table
 *   node scripts/perf_startup_probe.js --json f   # machine readable
 */
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const { performance } = require('node:perf_hooks');

const root = path.join(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

// --- fixture ---------------------------------------------------------------
// Synthetic cards only: fixed titles, no account data, no network.
function makeFixture(count) {
  const cards = [];
  for (let i = 0; i < count; i += 1) {
    cards.push({
      href: `https://open.spotify.com/playlist/fixture${i}`,
      title: `Fixture playlist ${i}`,
      subtitle: `Fixture owner ${i}`,
      image: `https://i.scdn.co/image/fixture${i}`
    });
  }
  return cards;
}

function makeDom(cards) {
  const anchors = cards.map((card) => {
    const img = {
      getAttribute: (name) => (name === 'src' ? card.image : name === 'alt' ? card.title : null),
      src: card.image
    };
    const textNode = (text) => ({
      textContent: text,
      innerText: text,
      getAttribute: () => null,
      querySelector: () => null,
      querySelectorAll: () => []
    });
    const cardNode = {
      matches: () => false,
      getAttribute: (name) => (name === 'aria-label' ? `${card.title} ${card.subtitle}` : null),
      querySelector: (selector) => (selector === 'img' ? img : null),
      querySelectorAll: (selector) => (selector === 'img' ? [img] : []),
      parentElement: null,
      children: [],
      textContent: card.title
    };
    const anchor = {
      href: card.href,
      getAttribute: (name) => (name === 'href' ? card.href : null),
      matches: (selector) => selector === 'a[href]' || selector === '[role="link"][href]',
      querySelector: (selector) => (selector === 'img' ? img : textNode(card.title)),
      querySelectorAll: (selector) => (selector === 'img' ? [img] : selector.indexOf('span') === 0
        ? [textNode(card.title), textNode(card.subtitle)] : []),
      closest: () => null,
      parentElement: cardNode,
      textContent: card.title
    };
    cardNode.parentElement = null;
    return anchor;
  });

  const mainView = {
    querySelectorAll: (selector) => {
      if (selector.indexOf('[data-testid="card"]') === 0) return anchors;
      if (selector === 'a[href]') return anchors;
      return [];
    },
    querySelector: () => null
  };

  return {
    readyState: 'complete',
    documentElement: {},
    querySelector: (selector) => (selector === '#main-view' ? mainView
      : selector.indexOf('user-widget-link') >= 0 ? {} : null),
    addEventListener: () => {},
    querySelectorAll: () => []
  };
}

function runShell({ cards }) {
  const observers = [];
  let clock = Date.now();
  class ProbeDate extends Date { static now() { return clock; } }
  const calls = [];
  const document = makeDom(cards);
  class TestMutationObserver {
    constructor(callback) { this.callback = callback; observers.push(this); }
    observe() { this.observed = true; }
    disconnect() {}
  }
  const timers = [];
  const window = {
    __sfMediaLibSessionProofKnown: true,
    __sfMediaLibSessionProven: true,
    location: {
      hostname: 'open.spotify.com',
      pathname: '/',
      href: 'https://open.spotify.com/',
      assign: () => {}
    },
    AndBridge: {
      onNativeUiReady: () => {},
      onNativeUiData: (screen, data) => calls.push({ screen, data, at: performance.now() })
    },
    MutationObserver: TestMutationObserver,
    addEventListener: () => {},
    setTimeout: (fn) => { timers.push(fn); return timers.length; },
    clearTimeout: () => {},
    setInterval: () => 0,
    clearInterval: () => {}
  };
  const context = vm.createContext({
    window,
    document,
    URL,
    Date: ProbeDate,
    JSON,
    Math,
    Promise,
    console,
    performance: undefined
  });
  const started = performance.now();
  vm.runInContext(read('scripts/native_ui_shell.source.js'), context);
  const installMs = performance.now() - started;
  if (!window.__sfNativeUiShellCompleted) throw new Error('probe shell install failed');
  const mutate = () => {
    clock += 200; // Cross the scheduler's 150ms throttle, without wall-clock waits.
    for (const observer of observers) if (observer.observed) observer.callback([]);
  };
  return { window, document, calls, installMs, mutate };
}

function main() {
  const cards = makeFixture(24);
  // Independent installs are NOT hydration passes of a single page.
  // Separately exercise repeated observer notifications in the same context.
  const installs = 3;
  const results = [];
  for (const pass of [1, 2, 3]) {
    const { calls, installMs } = runShell({ cards });
    const payloads = calls.filter((call) => call.screen === 'home');
    const sizes = payloads.map((call) => call.data.length);
    results.push({ pass, installMs, payloads: payloads.length, sizes });
  }

  const repeated = runShell({ cards });
  const stableCounts = [repeated.calls.filter(call => call.screen === 'home').length];
  for (let i = 0; i < 3; i++) {
    repeated.mutate();
    stableCounts.push(repeated.calls.filter(call => call.screen === 'home').length);
  }
  const totalPayloads = results.reduce((sum, row) => sum + row.payloads, 0);
  const report = {
    fixture: { cards: cards.length, independent_installs: installs },
    stable_dom: { observer_notifications: 3, cumulative_home_payloads: stableCounts },
    install_ms: results.map((row) => Number(row.installMs.toFixed(2))),
    payloads_per_pass: results.map((row) => row.payloads),
    payload_sizes: results.map((row) => row.sizes),
    total_payloads: totalPayloads,
    note: 'Measures JavaScript work only (shell install, row transform, payload build). '
      + 'Device wall-clock stages are NOT measured here; use startup_timing_journal.py.'
  };
  console.log(JSON.stringify(report, null, 2));
  if (process.argv.includes('--json')) {
    const out = process.argv[process.argv.indexOf('--json') + 1];
    fs.writeFileSync(out, JSON.stringify(report, null, 2));
    console.log('\nJSON: ' + out);
  }
}

main();
