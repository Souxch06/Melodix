'use strict';
// End-to-end JavaScript contract only: real bridge + real shell, simulated DOM,
// native callback and HTTP. This does not exercise Android or Spotify servers.
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync('tests/p0_library_fetch.test.js', 'utf8');
const prefix = source.slice(0, source.indexOf('// A successful fixture verifies'));
const context = {require, __dirname:path.resolve('tests'), console, setTimeout, clearTimeout, AbortController};
vm.createContext(context);
vm.runInContext(prefix + '\nglobalThis.fixtures={loadBridge,libraryPage,libraryItem,jsonResponse};', context);
const f = context.fixtures;
const shell = fs.readFileSync('scripts/native_ui_shell.source.js', 'utf8');

async function exercise(status) {
  let resolveResponse;
  const calls = [], requests = [];
  const w = f.loadBridge({tokenResponse:null, tokenStatus:400, fallbackTokenStatus:403,
    fetchImpl: (url, init) => { requests.push({url, init}); return new Promise(resolve => { resolveResponse = resolve; }); }});
  const query = w.document.querySelector.bind(w.document);
  const main = {querySelectorAll:()=>[]};
  w.document.querySelector = selector => selector === '#main-view' ? main : query(selector);
  w.AndBridge.onNativeUiReady = () => {};
  w.AndBridge.onNativeUiRoute = () => {};
  w.AndBridge.onNativeUiData = (screen, data) => calls.push({screen, rows:JSON.parse(data)});
  // Keep shell timers inert: completion notification itself must deliver rows.
  const realSetTimeout = w.setTimeout;
  w.setTimeout = (fn, delay) => Number(delay) >= 15000 ? realSetTimeout(fn, delay) : 1;
  vm.runInNewContext(shell, {window:w, document:w.document, URL, Date});
  const pending = w.checkMediaLib(true);
  await new Promise(resolve => setImmediate(resolve));
  assert.equal(requests.length, 1);
  assert.equal(requests[0].init.headers.Authorization, undefined);
  const response = status === 200
    ? f.libraryPage([f.libraryItem({uri:'spotify:playlist:fixture-flow', name:'Fixture flow', image:'https://i.scdn.co/image/test'})])
    : f.jsonResponse(status, {});
  resolveResponse(response);
  await pending;
  return {w,calls};
}

test('cookie-only synthetic 200 flows from bridge to native home callback', async () => {
  const {w,calls} = await exercise(200);
  assert.equal(w.__sfMediaLibStatus, 'ready');
  const home = calls.filter(c => c.screen === 'home');
  assert.ok(home.length > 0, 'home callback reached');
  assert.ok(home.at(-1).rows.some(row => row.title === 'Fixture flow' && row.uri === 'spotify:playlist:fixture-flow'));
});

test('synthetic library refusals do not publish playlist data to native home', async () => {
  for (const status of [400,401,403]) {
    const {w,calls} = await exercise(status);
    assert.notEqual(w.__sfMediaLibStatus, 'ready');
    assert.equal(w.__sfMediaLibSessionProven, false);
    assert.ok(!calls.some(call => call.rows.some(row => row.uri === 'spotify:playlist:fixture-flow')));
  }
});
