'use strict';
// Run with NODE_PATH pointing at project/node_modules and argv[2] pointing at
// a decoded candidate project. Fixtures simulate DOM only, never Spotify/HTTP.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { JSDOM } = require('jsdom');
const project = process.argv[2];
const read = f => fs.readFileSync(path.join(project, f), 'utf8');
const smali = read('smali/com/melodix/music/WebPageDiagnostic.smali');
const expression = smali.match(/const-string v2, "(\(function\(\)\{try\{var o=location\.protocol[^\n]*)"/);
assert.ok(expression, 'the packaged 17-bit probe must be present');
const probe = JSON.parse('"' + expression[1] + '"');
const runtime = read('assets/runtime_state.js');
const shell = read('assets/native_ui_shell.js');
const bridge = read('assets/spotify_bridge.js');
const expected = '11011100001010000';

function sample(body, head='') {
  const dom = new JSDOM(`<!doctype html><html><head>${head}</head><body>${body}</body></html>`,
    { url:'https://open.spotify.com/', runScripts:'outside-only' });
  const w = dom.window;
  w.MutationObserver = class {observe() {} disconnect() {}};
  w.setInterval=()=>0; w.setTimeout=()=>0; w.SF_CONFIG={};
  w.fetch=()=>Promise.reject(new Error('no network in fixture'));
  w.AndBridge={onNativeUiRoute(){},onNativeUiReady(){},onNativeUiData(){},
    logDiagEvent(){},getDiagnosticSessionId:()=>'',onSpotifyLoginRequired(){},loadWebPlayerUrl(){}};
  w.eval(runtime); w.eval(shell); w.eval(bridge);
  return {dom,w,code:w.eval(probe)};
}

test('real injected scripts can reproduce the full 17-bit diagnostic on blank simulated content', () => {
  const x=sample('<div></div><div></div>');
  try {assert.equal(x.code, expected);} finally {x.dom.window.close();}
});

test('same fingerprint does not distinguish very different documents', () => {
  const a=sample('<div></div><div></div>');
  const b=sample('<div>Simulated server error</div><div>different fixture</div>');
  const c=sample('<div></div><div></div>', '<script>/* inline script node is not an external script */</script>');
  try {
    assert.equal(a.code, expected); assert.equal(b.code, expected); assert.equal(c.code, expected);
    assert.notEqual(a.w.document.body.textContent,b.w.document.body.textContent);
    assert.equal(c.w.document.querySelectorAll('script').length,1);
    assert.equal(c.w.document.querySelectorAll('script[src]').length,0);
  } finally {[a,b,c].forEach(x=>x.dom.window.close());}
});

test('probe does not measure a page HTTP response or WebView error', () => {
  // The probe is executed by evaluateJavascript after loading, and its source
  // is exactly the native implementation. It reads DOM/flags only.
  assert.doesNotMatch(probe,/performance\.getEntries|responseStatus|statusCode|WebResourceResponse/);
  const client=read('smali/c91.smali');
  const method=client.match(/\.method public final onReceivedHttpError\([\s\S]*?\.end method/)[0];
  assert.match(method,/WebResourceResponse;->getStatusCode\(\)I/);
  assert.doesNotMatch(method,/iput|sput|logDiagEvent|diagLine|setText/,
    'current client neither stores nor displays the HTTP result');
});
