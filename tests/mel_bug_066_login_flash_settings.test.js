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
  const main = read('smali/com/melodix/music/MainActivity.smali');
  assert.ok(main.includes('.field private nativeLoginPageCommitted:Z'), 'field declared');
  // set false when a login is requested
  for (const name of ['openSpotifyLogin', 'revealLoginWebUi']) {
    const m = method(main, '.method public final ' + name + '(');
    assert.match(m, /iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginWebRequested:Z\s*\n\s*(?:#[^\n]*\n\s*)*const\/4 v0, 0x0\s*\n\s*iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginPageCommitted:Z/,
      name + ' resets the committed marker when requesting login');
  }
  // set true when a login-path page commits
  const fin = method(main, '.method public final onWebViewPageFinished(');
  assert.match(fin, /const\/4 v0, 0x1\s*\n\s*iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginPageCommitted:Z[\s\S]*?applyLoginWebUi/,
    'page-finished on a login path marks it committed and stays on the web UI');
});

test('MEL-BUG-066a: JS-driven callbacks cannot close the login surface before it commits', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  for (const name of ['postNativeUiReady', 'postNativeUiRoute']) {
    const m = method(main, '.method public final ' + name + '(');
    assert.match(m, /iget-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginPageCommitted:Z\s*\n\s*if-eqz v0, :native_login_gate_done_keep\s*\n\s*const\/4 v0, 0x0\s*\n\s*iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginWebRequested:Z/,
      name + ' clears the login flag only after the login page committed');
  }
  // page-finished still closes the surface on a real non-login page (post-login redirect)
  const fin = method(main, '.method public final onWebViewPageFinished(');
  assert.match(fin, /isLoginWebPath\(\)Z[\s\S]*?nativeLoginWebRequested:Z[\s\S]*?showNativeUiFrom/,
    'a real non-login page still returns to the native shell');
});

test('MEL-BUG-066b: settings icon slot is a soft glow circle with accent ring', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const create = method(f, '.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;');
  assert.match(create, /setShape\(I\)V[\s\S]{0,120}?MelColors;->glow:I[\s\S]{0,80}?setColor\(I\)V/, 'oval glow fill');
  assert.match(create, /MelColors;->strokeAccent:I[\s\S]{0,80}?setStroke\(II\)V/, 'accent hairline ring kept');
  assert.ok(!create.includes('0x40000000'), 'no more loud 25%-alpha solid square');
});

test('MEL-BUG-066b: ON/OFF switch renders a real two-state track', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const at = f.indexOf('\n    :native_settings_switch_build\n');
  assert.ok(at >= 0);
  const sw = f.slice(at, f.indexOf('\n    :native_settings_pill_text\n', at));
  assert.match(sw, /const v13, 0x101009c/, 'state_checked in the state list');
  assert.doesNotMatch(sw, /const v2, |new-instance v2, |aput [^,]+, v2,/, 'the row register v2 is never clobbered (crash fix)');
  assert.match(sw, /MelColors;->accent:I[\s\S]*?MelColors;->surfaceBtn:I[\s\S]*?ColorStateList;-><init>\(\[\[I\[I\)V/,
    'track colors = [checked: accent, default: surfaceBtn]');
  assert.match(sw, /setTrackTintList/, 'track tinted from the state list');
  assert.match(sw, /MelColors;->textPrimary:I[\s\S]*?setThumbTintList/, 'thumb white for contrast');
  assert.match(sw, /Switch;->setChecked\(Z\)V/, 'checked state still driven by ON/OFF');
});

test('MEL-BUG-067a: login page zoom is 180% and reset stays 100% on the native shell', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const login = method(main, '.method private final applyLoginWebUi(');
  assert.match(login, /const\/16 v1, 0xb4\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'login zoom 180%');
  const show = method(main, '.method public final showNativeUiFrom(');
  assert.match(show, /const\/16 v1, 0x64\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'native shell still resets zoom to 100%');
});

test('MEL-BUG-067b: missing sp_dc cookie forces the login screen first, even with a persisted marker', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const at = main.indexOf('sget-boolean v1, Lcom/melodix/music/MainActivity;->l0:Z');
  const block = main.slice(at, main.indexOf(':have_url', at));
  assert.match(block, /invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->hasProvenSessionCookie\(\)Z\s*\n\s*move-result v1\s*\n\s*if-eqz v1, :login_url/,
    'no proven cookie -> login URL + revealLoginWebUi, regardless of persisted markers');
  assert.match(block, /const-string v1, "https:\/\/open\.spotify\.com\/"/, 'cookie present -> player URL as before');
  const helper = method(main, '.method private final hasProvenSessionCookie()Z');
  assert.match(helper, /CookieManager;->getInstance\(\)Landroid\/webkit\/CookieManager;/);
  assert.match(helper, /const-string v1, "sp_dc="\s*\n\s*invoke-virtual \{v0, v1\}, Ljava\/lang\/String;->contains\(Ljava\/lang\/CharSequence;\)Z/,
    'only the presence of the sp_dc cookie is tested');
  assert.doesNotMatch(helper, /getAllCookies|getCookie\("[^"]*sp_dc|Log\.|println/,
    'the cookie value is never read, logged or stored');
});
