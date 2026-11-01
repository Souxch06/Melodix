'use strict';

// Structured P0 trace contracts. These tests verify that the instrumentation
// reports only bounded state and that native layout evidence is session-linked;
// they do not claim an authenticated Spotify/device run.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('Web Home emits normalized guard, CSS, node and final-owner diagnostics only', () => {
  const source = read('scripts/melodix_home.source.js');
  assert.match(source, /function safeMelodixHomeRoute\(\)/);
  assert.match(source, /function traceHomeGuard\(guard, passed\)/);
  assert.match(source, /home-guard guard=' \+ name \+ ' result=/);
  assert.match(source, /function traceHomeCss\(result, passed\)/);
  assert.match(source, /home-css ' \+ values\.map/);
  assert.match(source, /function traceHomeNode\(home, created, action\)/);
  assert.match(source, /home-node exists=' \+ \(exists \? '1' : '0'\)/);
  assert.match(source, /function traceHomeFinal\(cardCount, forceOwnerSync\)/);
  assert.match(source, /home-final owner=' \+ owner \+ ' route=' \+ route/);
  assert.match(source, /window\.__sfMelodixHomeTraceFinal = traceHomeFinal/);
  assert.match(source, /signatures\[name\] === signature/,
    'guard de-duplication is tracked independently for each named guard');
  assert.doesNotMatch(source, /traceMelodixHome\([^\n]*(?:location\.href|location\.pathname|cookie|access_token|refresh_token)/i,
    'diagnostic event call sites never emit raw route, cookie, or token values');
  assert.match(source, /route: routeCategory/);
  assert.doesNotMatch(source, /traceMelodixHome\('home-web decision='[\s\S]{0,300}rootSelector/,
    'the compact Home decision omits raw selectors');
});

test('WebView, Spotify route, bridge phases and Home transfer use safe state enums and counts', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  assert.match(shell, /function traceWebViewState\(\)/);
  assert.match(shell, /webview-state ready=' \+ ready \+ ' host=' \+ host/);
  assert.match(shell, /route=' \+ spotifyRouteCategory\(\) \+ ' session=' \+ session/);
  assert.match(shell, /diagTrace\('spotify-route route=' \+ routeCategory \+ ' session=' \+ sessionBit\)/);
  assert.match(shell, /home-data stage=web-to-android rows=/);
  const renderer = read('scripts/melodix_home.source.js');
  assert.match(renderer, /home-data stage=web-rendered rows=/);
  assert.match(shell, /bridge-load phase=read-start strategy=none result=pending bytes=0/);
  assert.match(shell, /bridge-load phase=read-end strategy=none result=' \+ readResult/);
  assert.match(shell, /bridge-load phase=' \+ phase \+ ' strategy=' \+ strategy/);
  assert.doesNotMatch(shell, /diagTrace\('spotify-route[^\n]*(?:spotifyRoutePath\(\)|location\.href)/);
});

test('Android accepts structured JS diagnostics only through a strict bounded grammar', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const sanitizer = bridge.slice(
    bridge.indexOf('.method private final safeDiagnosticEvent('),
    bridge.indexOf('.end method', bridge.indexOf('.method private final safeDiagnosticEvent('))
  );
  const structured = bridge.slice(
    bridge.indexOf('.method private final safeStructuredDiagnosticEvent('),
    bridge.indexOf('.end method', bridge.indexOf('.method private final safeStructuredDiagnosticEvent('))
  );
  assert.match(sanitizer, /safeStructuredDiagnosticEvent\(Ljava\/lang\/String;\)Z/,
    'structured traces are checked before any legacy event-family label');
  for (const event of [
    'webview-state ready=', 'spotify-route route=', 'home-guard guard=', 'home-css marker=',
    'home-node exists=', 'home-web decision=', 'home-data stage=(web-to-android|web-rendered)',
    'home-data stage=android-received', 'home-data stage=android-rendered',
    'home-final owner=', 'bridge-load phase='
  ]) assert.ok(structured.includes(event), `missing strict grammar for ${event}`);
  assert.match(structured, /session=\(0\|1\)/);
  assert.match(structured, /cards=\[0-9\]\{1,3\}/);
  assert.match(structured, /width=\[0-9\]\{1,5\}/);
  assert.match(structured, /bridge-load phase=\(read-start\|read-end\|exec-start\|exec-end\)/);
  assert.doesNotMatch(structured, /playlist-name|account-id|cookie|access_token|refresh_token|selector|spotifyRoutePath/i);
});

test('Android native renderer records received/rendered counts without logging card content', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  assert.match(renderer, /traceHomeReceipt\(I\)V/);
  assert.match(renderer, /traceHomeRendered\(IILjava\/lang\/String;\)V/);
  assert.match(renderer, /home-data stage=android-received rows=/);
  assert.match(renderer, /home-data stage=android-rendered rows=/);
  assert.match(renderer, /add-int\/lit8 p1, p1, 0x1/,
    'rendered card count increments only after a real card is attached');
  assert.match(renderer, /NativeCrashGuard;->diagLine\(Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(renderer, /diagLine\([^\n]*(?:title|subtitle|uri|image)/i,
    'native diagnostics contain counts and states, not playlist metadata or URIs');
});

test('nativeRoot/WebView/host dimensions and stacking are correlated by the NativeCrashGuard SID', () => {
  const trace = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  const crashGuard = read('smali/com/melodix/music/NativeCrashGuard.smali');
  assert.match(trace, /native-layout route=/);
  assert.match(trace, /root-index=/);
  assert.match(trace, /host-index=/);
  assert.match(trace, /webview-width=/);
  assert.match(trace, /webview-height=/);
  assert.match(trace, /host-width=/);
  assert.match(trace, /host-height=/);
  assert.match(trace, /NativeCrashGuard;->diagLine\(Ljava\/lang\/String;\)V/);
  assert.match(trace, /__sfNativeUiRootVisibilityKnown=true/);
  assert.match(trace, /__sfMelodixHomeTraceFinal/);
  assert.match(crashGuard, /invoke-static \{\}, Lcom\/melodix\/music\/NativeCrashGuard;->diagnosticSessionId\(\)Ljava\/lang\/String;/);
  assert.match(crashGuard, /const-string v1, "sid="/);
});

test('visible authenticated Web Home owns Home and prevents nativeRoot from covering it', () => {
  const source = read('scripts/melodix_home.source.js');
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const runnable = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  const shell = activity.slice(activity.indexOf('.method public final showNativeUi()V'),
    activity.indexOf('.end method', activity.indexOf('.method public final showNativeUi()V')));
  const owner = activity.slice(activity.indexOf('.method public final setMelodixHomeVisibility(ZZ)V'),
    activity.indexOf('.end method', activity.indexOf('.method public final setMelodixHomeVisibility(ZZ)V')));
  assert.match(source, /route === 'home' && session === '1' && home/,
    'ownership requires the already-passed route and session guards');
  assert.match(source, /rect\.width > 0 && rect\.height > 0/,
    'ownership requires measured non-empty Web Home bounds');
  assert.match(source, /onMelodixHomeVisibility\(value, session\)/,
    'only two redacted booleans cross the bridge');
  assert.match(bridge, /\.method public final onMelodixHomeVisibility\(ZZ\)V[\s\S]*?postMelodixHomeVisibility\(ZZ\)V/);
  assert.match(owner, /if-eqz p2, :melodix_home_owner_reveal_web[\s\S]*?showNativeUi\(\)V/,
    'native Home can resume only while session proof remains true');
  assert.match(shell, /iget-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->melodixWebHomeActive:Z[\s\S]*?return-void[\s\S]*?findViewById/,
    'the owner guard exits before nativeRoot is made visible');
  assert.match(runnable, /isMelodixWebHomeActive\(\)Z[\s\S]*?goto :native_layout_publish[\s\S]*?completeNativeUiVisibility\(Z\)Z/,
    'intentional native suppression is measured, not reported as a visibility timeout');
  assert.match(activity, /window\.__sfMelodixHomeSyncNativeOwner && window\.__sfMelodixHomeSyncNativeOwner\(\)/,
    'a route-order race is re-synchronized after Android applies Home');
});
