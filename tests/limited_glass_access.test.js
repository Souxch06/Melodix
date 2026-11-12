'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const read = f => fs.readFileSync(f, 'utf8');
const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
const main = read('smali/com/melodix/music/MainActivity.smali');
const limited = read('smali/com/melodix/music/NativeLimitedGlass.smali');
const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
const runnable = read('smali/com/melodix/music/NativeUiUpdateRunnable.smali');
function method(s, marker) { const start=s.indexOf(marker); assert.notEqual(start,-1,marker); return s.slice(start,s.indexOf('.end method',start)); }

test('limited Glass is mounted independently of library proof, but never over an active login', () => {
  const available=method(limited,'.method public static available()Z');
  assert.match(available,/state:I[\s\S]*?if-eq v0, v1, :no[\s\S]*?loginActive:Z[\s\S]*?if-nez v0, :no/);
  const paint=method(gate,'.method public static paint(');
  assert.match(paint,/available\(\)Z[\s\S]*?removeOverlay[\s\S]*?NativeLimitedGlass;->repaint/);
  assert.match(paint,/:regular_surface[\s\S]*?NativeSessionSurface;->paint/);
  assert.match(limited,/0x7f09022f[\s\S]*?setVisibility\(I\)V[\s\S]*?bringToFront/);
});

test('limited presentation uses fixed native strings and actions, not untrusted JSON or playlist data', () => {
  assert.doesNotMatch(limited,/JSONObject|JSONArray|WebView;->evaluateJavascript|->loadUrl/);
  assert.match(limited,/Bibliothèque Spotify indisponible/);
  assert.match(limited,/Vérification de la bibliothèque/);
  assert.match(limited,/playlists restent masquées/);
  assert.doesNotMatch(limited,/Aucune playlist|spotify:playlist/);
  assert.match(renderer,/state:I[\s\S]*?if-eq v0, v1, :private_render_proven\s+return-void/);
  assert.match(runnable,/sessionAtReceipt:I[\s\S]*?sessionGeneration:I[\s\S]*?privateUiEpoch:I/);
  assert.match(gate,/privateUiEpoch:I[\s\S]*?invalidateNativePrivateUi/);
});

test('native navigation and explicit retry/login remain separate in limited mode', () => {
  for (const [name, route] of [['onNativeHomeClick','home'],['onNativeSearchClick','search'],['onNativeLibraryClick','library'],['onNativeSettingsClick','settings']]) {
    const m=method(main,`.method public final ${name}(`);
    assert.match(m,new RegExp(`NativeLimitedGlass;->available[\\s\\S]*?"${route}"[\\s\\S]*?NativeLimitedGlass;->show`));
  }
  for (const uri of ['melodix:action:retry-library','melodix:action:open-login','melodix:action:open-notifications']) assert.ok(limited.includes(uri));
  assert.match(method(main,'.method public final openSpotifyLogin()'),/NativeSessionGate;->navigateLogin/);
  assert.match(method(main,'.method public final openNativeRow('),/retry-library[\s\S]*?NativeSessionRecovery;->verify/);
  assert.doesNotMatch(method(gate,'.method public static navigateLogin('),/removeAllCookies|deleteAllData/);
});

test('limited back returns to home and login delegates to WebView history',()=>{
 const main=read('smali/com/melodix/music/MainActivity.smali');
 const handler=main.slice(main.indexOf('.method public final handleNativeSystemBack()Z'),main.indexOf('.end method',main.indexOf('.method public final handleNativeSystemBack()Z')));
 assert.match(handler,/loginActive:Z[\s\S]*?if-eqz v0, :limited_back[\s\S]*?return v0/);
 assert.match(handler,/NativeLimitedGlass;->back/);
 const limited=read('smali/com/melodix/music/NativeLimitedGlass.smali');
 assert.match(limited,/back\(Lcom\/melodix\/music\/MainActivity;\)Z[\s\S]*?"home"[\s\S]*?->show/);
});

test('first paint hides the inflated splash even before Activity fields are initialized',()=>{
 const show=method(limited,'.method public static show(');
 assert.match(show,/const v0, 0x7f0901c6[\s\S]*?NativeLimitedGlass;->visibility/);
 assert.doesNotMatch(show,/->H:Landroidx\/constraintlayout/);
});

 test('limited status and independently actionable controls use native Glass without private content',()=>{
  const card=method(limited,'.method private static card(');
  const action=method(limited,'.method private static action(');
  assert.match(card,/native_glass_surface/);
  assert.match(card,/screenWidthDp:I/);
  assert.match(action,/native_button_green[\s\S]*?native_button_dark|native_button_dark[\s\S]*?native_button_green/);
  assert.match(action,/setAllCaps\(Z\)V/);
  assert.match(action,/48dp minimum touch target[\s\S]*?setMinHeight\(I\)V/);
  assert.match(method(limited,'.method public static show('),/->card[\s\S]*?Bibliothèque Spotify indisponible[\s\S]*?retry-library[\s\S]*?open-login/);
 });
