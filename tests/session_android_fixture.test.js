'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const src=fs.readFileSync('tests/android/SessionGateInstrumentation.java','utf8');
test('Android synthetic session harness exercises actual local WebView with network blocked',()=>{
 assert.match(src,/setBlockNetworkLoads\(true\)/);
 assert.match(src,/diagnostic_real_webview_fallback/);
 assert.match(src,/diagnostic_real_webview_rejects_stale/);
 assert.match(src,/NativeSessionDiagnosticPull/);
 assert.match(src,/library.*?http:401/s);
 assert.match(src,/terminée=inconnu · cookie=inconnu/);
 assert.match(src,/evidenceBefore\[0\]/);
 assert.doesNotMatch(src,/CookieManager|setCookie\(|removeAllCookies\(/);
});
test('Android synthetic clipboard check expects both details and the bounded timing trail',()=>{
 assert.match(src,/copied\.startsWith\(details\+"\\nMDXPERF-BEGIN v=1 dropped="\)/);
 assert.match(src,/copied\.endsWith\("MDXPERF-END"\)/);
});
