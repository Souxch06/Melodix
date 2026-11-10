'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
function method(s,sig){const a=s.indexOf(sig);assert.ok(a>=0,sig);return s.slice(a,s.indexOf('.end method',a));}
test('top-level requests prepare the interface before the policy, but subframes never do',()=>{
 const s=method(read('smali/c91.smali'),'.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z');
 assert.match(s,/isForMainFrame\(\)Z[\s\S]*?if-eqz v3, :bridge_nav_prepared[\s\S]*?NativeBridgeNavigation;->prepare[\s\S]*?:bridge_nav_prepared[\s\S]*?SpotifyNavigationPolicy;->handle/);
 const start=method(read('smali/c91.smali'),'.method public onPageStarted(');assert.match(start,/getScheme\(\)Ljava\/lang\/String;[\s\S]*?"https"[\s\S]*?if-eqz v1, :bridge_detach/);
});
test('prepare uses the exact HTTPS player predicate and detaches for every other origin',()=>{
 const nav=method(read('smali/com/melodix/music/NativeBridgeNavigation.smali'),'.method public static prepare('),origin=method(read('smali/com/melodix/music/NativeSessionTrace.smali'),'.method public static playerOrigin(');
 for(const check of ['"https"','"open.spotify.com"','getPort()I','0x1bb'])assert.ok(origin.includes(check));
 assert.match(nav,/playerOrigin\(Ljava\/lang\/String;\)Z[\s\S]*?if-eqz v0, :detach[\s\S]*?addJavascriptInterface[\s\S]*?:detach[\s\S]*?removeJavascriptInterface/);
 assert.doesNotMatch(nav,/getCookie|removeAllCookies|deleteAllData|loadUrl|evaluateJavascript|setUserAgent|header/i);
});
test('every direct production loadUrl prepares the destination before loading',()=>{
 for(const path of ['smali/m9.smali','smali/ml.smali','smali/c2.smali','smali/yi1.smali','smali/com/melodix/music/AndBridgeProbe.smali','smali/com/melodix/music/MainActivity.smali','smali/com/melodix/music/NativeSessionGate.smali','smali/com/melodix/music/NativeSessionRecovery.smali','smali/com/melodix/music/NativeWebPlayerNavigationRunnable.smali','smali/com/melodix/music/SpotifyNavigationPolicy.smali']){
  const s=read(path),loads=[...s.matchAll(/invoke-virtual \{(\w+), (\w+)\}, Landroid\/webkit\/WebView;->loadUrl\(Ljava\/lang\/String;\)V/g)];assert.ok(loads.length,path);
  for(const m of loads){const before=s.slice(Math.max(0,m.index-200),m.index);assert.ok(before.includes(`NativeBridgeNavigation;->prepare(Landroid/webkit/WebView;Ljava/lang/String;)V`),path);assert.ok(before.includes(`invoke-static {${m[1]}, ${m[2]}}`),path);}
 }
});
test('existing WebView API remains not origin isolated for subframes; no new credential access added',()=>{
 const runtime=read('tests/runtime_state.test.js');assert.match(runtime,/frame-origin risk remains explicit/);assert.doesNotMatch(read('smali/com/melodix/music/NativeBridgeNavigation.smali'),/CookieManager|Authorization|token|password/i);
});
test('Android fixture covers offline account to player and back with the real preparation helper and policy',()=>{
 const f=read('tests/android/BridgeNavigationInstrumentation.java'),s=read('scripts/bridge_navigation_emulator.sh'),w=read('.github/workflows/test-session-gate.yml');
 for(const token of ['shouldInterceptRequest','NativeBridgeNavigation','SpotifyNavigationPolicy','login_bridge_absent','player_bridge_visible','return_login_bridge_absent','retry_first_generation','retry_next_generation','retry_stale_generation','repeat_attach_active_document_generation','repeat_attach_gc','native_flight_guard','native_flight_expired','queued_real_retry_invalidation','queued_real_retry_current','bundled_generation_delayed','bundled_retry_dispatch','webview_major','synthetic_grid_baseline','synthetic_grid_scoped_width'])assert.ok(f.includes(token),token);
 assert.doesNotMatch(f,/CookieManager|setCookie|sp_dc|authorization/i);assert.match(s,/overall=passed/);assert.match(s,/svc wifi disable/);assert.match(s,/svc data disable/);assert.match(w,/bridge-navigation:[\s\S]*?bridge_navigation_emulator\.sh/);
});

test('GC experiment observes actual collection after replacement and includes a strong-reference control',()=>{
 const f=read('tests/android/BridgeNavigationInstrumentation.java');
 for(const token of ['replacementGcProbe(outcome,false)','replacementGcProbe(outcome,true)','java.lang.ref.WeakReference','gc_replaced','gc_retained','getSessionGeneration()','old[0].get()==null'])assert.ok(f.includes(token),token);
 assert.doesNotMatch(f,/CookieManager|setCookie|sp_dc|authorization/i);
});
test('GC probe publishes only fixed categories and fails if no result is available',()=>{
 const s=read('scripts/bridge_navigation_emulator.sh');assert.match(s,/gc_replaced_collected gc_replaced_result gc_retained_collected gc_retained_result/);assert.match(s,/yes\|no\|number\|null\|undefined\|exception\|boolean\|string\|object/);assert.match(s,/missing \$key/);
});
