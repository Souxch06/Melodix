// MEL-BUG-066 (2026-11-08, captures 07:11/07:12) :
//  a) the login Web UI flashed for one frame then the native home came back
//     while still not connected — JS "ready" callbacks fired by the PREVIOUS
//     page during the login navigation read a real non-login getUrl() and
//     cleared nativeLoginWebRequested. Fix: a new nativeLoginPageCommitted
//     marker is set only when a login-path page actually commits
//     (onWebViewPageFinished); the JS-driven callbacks (postNativeUiReady /
//     postNativeUiRoute) may clear the login flag only after that commit.
//  b) settings screen finished look: icon slots are soft glow circles (not
//     solid green squares) and the ON/OFF switch has a real state-list track
//     (accent when ON, neutral when OFF) with a white thumb.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.join(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');
const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' exists');
  return src.slice(at, src.indexOf('.end method', at));
};

test('MEL-BUG-066a: nativeLoginPageCommitted marker exists and is managed', () => {
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const main = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(main, /\.field public nativeLoginPageCommitted:Z/);
  const nav = method(gate, '.method public static navigateLogin(');
  assert.match(nav, /const\/4 v0, 0x0\s+iput-boolean v0, p0, .*->nativeLoginPageCommitted:Z/);
  const fin = method(gate, '.method public static pageFinished(');
  assert.match(fin, /isLoginWebPath\(\)Z[\s\S]*?const\/4 v0, 0x1[\s\S]*?nativeLoginPageCommitted:Z[\s\S]*?applySessionLoginSurface/);
  assert.match(fin, /nativeLoginPageCommitted:Z[\s\S]*?open.spotify.com[\s\S]*?->verify/);
});

test('MEL-BUG-066a: JS-driven callbacks cannot close the login surface before it commits', () => {
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const main = read('smali/com/melodix/music/MainActivity.smali');
  for (const name of ['showNativeUiFrom', 'activateNativeUiRoute', 'applyNativeUiData', 'renderNativeRows']) {
    const m = method(main, '.method public final '+name+'(');
    assert.match(m, /NativeSessionGate;->blocked[\s\S]*?return-void/);
  }
  assert.match(method(gate, '.method public static pageFinished('), /nativeLoginWebRequested:Z[\s\S]*?NativeSessionRecovery;->verify/);
  assert.doesNotMatch(method(gate, '.method public static pageFinished('), /showNativeUi|loadUrl|removeAllCookies/);
});

test('MEL-BUG-066b: settings icon slot is a soft glow circle with accent ring', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const create = method(f, '.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;');
  assert.match(create, /setShape\(I\)V[\s\S]{0,120}?MelColors;->glow:I[\s\S]{0,80}?setColor\(I\)V/, 'oval glow fill');
  assert.match(create, /sget v11, Lcom\/melodix\/music\/MelColors;->strokeAccent:I\s*\n\s*invoke-virtual \{v1, v3, v11\}, Landroid\/graphics\/drawable\/GradientDrawable;->setStroke\(II\)V/, 'icon accent ring kept');
  assert.ok(!create.includes('0x40000000'), 'no more loud 25%-alpha solid square');
});

test('MEL-BUG-066b: ON/OFF switch renders a real two-state track', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const at = f.indexOf('\n    :native_settings_switch_build\n');
  assert.ok(at >= 0);
  const sw = f.slice(at, f.indexOf('\n    :native_settings_pill_text\n', at));
  const track = read('res/drawable/native_settings_switch_track.xml');
  assert.match(track, /state_checked="true"[\s\S]*?mel_gradient_start[\s\S]*?mel_gradient_end[\s\S]*?mel_switch_off/, 'gradient when checked, translucent neutral otherwise');
  assert.doesNotMatch(sw, /const v2, |new-instance v2, |aput [^,]+, v2,/, 'row register v2 is never clobbered');
  assert.match(sw, /"native_settings_switch_track"[\s\S]*?setTrackResource[\s\S]*?const\/4 v0, 0x0[\s\S]*?setTrackTintList/, 'selector with tint cleared');
  assert.match(sw, /MelColors;->textPrimary:I[\s\S]*?setThumbTintList/, 'thumb white for contrast');
  assert.match(sw, /Switch;->setChecked\(Z\)V/, 'checked state still driven by ON/OFF');
});

test('MEL-BUG-067a: login page zoom is mobile-sized and reset stays 100% on the native shell', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const login = method(main, '.method private final applyLoginWebUi(');
  // MEL-BUG-069: the login surface now uses a mobile viewport with a light
  // 125% text zoom instead of the 180% blow-up on a desktop-width column.
  assert.match(login, /const\/16 v1, 0x7d\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'login zoom 125% + viewport mobile');
  const show = method(main, '.method public final showNativeUiFrom(');
  assert.match(show, /const\/16 v1, 0x64\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'native shell still resets zoom to 100%');
});

test('MEL-BUG-067b: missing cookie does not validate a session or force automatic login', () => {
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const initial = method(gate, '.method public static initialUrl(');
  assert.ok(initial.includes('https://open.spotify.com/'));
  assert.doesNotMatch(initial, /accounts\.spotify\.com|loginActive:Z/);
  assert.doesNotMatch(initial, /LoggedIn|AppSingleton;->B/);
  const recovery = read('smali/com/melodix/music/NativeSessionRecovery.smali');
  assert.match(recovery, /Pattern;->compile/);
  assert.doesNotMatch(gate, /getAllCookies|Log\.|println|removeAllCookies/);
});
