'use strict';
// Regression tests for the explicitly forbidden private-player-token path.
// Responses and playlist names are test fixtures, never Spotify network data.
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const src = fs.readFileSync('tests/p0_library_fetch.test.js', 'utf8');
const prefix = src.slice(0, src.indexOf('// A successful fixture verifies'));
const context = {require, __dirname:path.resolve('tests'), console, setTimeout, clearTimeout, AbortController};
vm.createContext(context);
vm.runInContext(prefix + '\nglobalThis.f={loadBridge,libraryPage,libraryItem,jsonResponse};', context);
const f = context.f;

test('the generated and source bridges contain no private player token access or forwarding', () => {
  for (const file of ['scripts/spotify_bridge.source.js', 'assets/spotify_bridge.js']) {
    const code = fs.readFileSync(file, 'utf8');
    assert.doesNotMatch(code, /open\.spotify\.com\/(?:api\/token|get_access_token)|spot_auth_token|spot_cli_token|accessTokenExpirationTimestampMs|webPlayerTokenCache|fetchWebPlayerToken/);
    assert.doesNotMatch(code, /['"]Authorization['"]\s*:|Authorization\s*:/i);
    assert.doesNotMatch(code, /window\.fetch\s*=/);
  }
});

test('only the browser-cookie library request is made and a response is needed for proof', async () => {
  for (const status of [200, 400, 401, 403]) {
    const requests = [], results = [];
    const w = f.loadBridge({fetchImpl:async (url, init) => {
      requests.push({url, init});
      return status === 200 ? f.libraryPage([f.libraryItem({uri:'spotify:playlist:fixture',name:'Fixture'})]) : f.jsonResponse(status, {});
    }});
    w.AndBridge.getSessionGeneration = () => 1;
    w.AndBridge.onSessionVerification = x => results.push(JSON.parse(x));
    await w.checkMediaLib(true);
    assert.equal(w.__testTokenRequests.length, 0);
    assert.equal(requests.length, 1);
    assert.equal(requests[0].init.credentials, 'include');
    assert.equal(requests[0].init.headers.Authorization, undefined);
    assert.equal(results.at(-1).token, false);
    assert.equal(results.at(-1).tokenApiHttp, 0);
    assert.equal(results.at(-1).tokenFallbackHttp, 0);
    assert.equal(results.at(-1).libraryHttp, status);
    assert.equal(results.at(-1).libraryOk, status === 200);
    assert.equal(w.__sfMediaLibSessionProven, status === 200);
  }
});

test('manual native retry acknowledges the library transport only after invocation', async () => {
  const events = [];
  const w = f.loadBridge({fetchImpl: async () => {events.push('transport'); return f.jsonResponse(401, {});}});
  w.AndBridge.getSessionGeneration = () => 8;
  w.AndBridge.isSessionRetryActive = n => n === 8;
  w.AndBridge.onSessionAttemptStarted = () => events.push('acknowledgement');
  await w.__sfRequestSessionVerification(8);
  assert.deepEqual(events, ['transport', 'acknowledgement']);
  assert.equal(w.__testTokenRequests.length, 0);
  assert.equal(w.__sfMediaLibError, 'http-401');
});

test('real bridge no-op falls back to Spotify track navigation without claiming playback', async () => {
  const loaded = [];
  const w = f.loadBridge();
  const query = w.document.querySelector.bind(w.document);
  w.document.querySelector = s => s === '#main-view' ? {querySelectorAll:()=>[]} : query(s);
  w.AndBridge.onNativeUiReady = () => {};
  w.AndBridge.onNativeUiRoute = () => {};
  w.AndBridge.onNativeUiData = () => {};
  w.AndBridge.loadWebPlayerUrl = url => loaded.push(url);
  w.__sfUserRequestedPause = true;
  const shell = fs.readFileSync('scripts/native_ui_shell.source.js', 'utf8');
  vm.runInNewContext(shell, {window:w, document:w.document, URL, Date});
  assert.equal(w.playFromUri('spotify:track:fixture123'), false);
  assert.equal(w.__sfUserRequestedPause, true, 'a no-op cannot claim play or release pause');
  assert.equal(w.__sfNativeOpenUri('spotify:track:fixture123'), true);
  assert.deepEqual(loaded, ['https://open.spotify.com/track/fixture123']);
  assert.equal(w.__sfUserRequestedPause, true);
});
