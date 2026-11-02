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
  assert.match(source, /function traceHomeFinal\(forceOwnerSync\)/,
    'the final-owner report no longer receives or logs account-card counts');
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

test('WebView, Spotify route and Home handoff diagnostics stay redacted and bounded', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const bridgeSource = read('scripts/spotify_bridge.source.js');
  assert.match(shell, /function traceWebViewState\(\)/);
  assert.match(shell, /webview-state ready=' \+ ready \+ ' host=' \+ host/);
  assert.match(shell, /route=' \+ spotifyRouteCategory\(\) \+\s*' bridge=' \+ \(callbacks \? '1' : '0'\)/);
  assert.match(shell, /diagTrace\('spotify-route route=' \+ routeCategory\)/);
  assert.match(shell, /home-data stage=web-to-android result=/);
  const renderer = read('scripts/melodix_home.source.js');
  assert.match(renderer, /home-data stage=web-rendered/);
  assert.match(shell, /home-state sent/);
  assert.match(shell, /home-rows sent/);
  assert.match(shell, /bridge-load phase=read-start strategy=none result=pending bytes=0/);
  assert.match(shell, /bridge-load phase=read-end strategy=none result=' \+ readResult/);
  assert.match(shell, /bridge-load phase=' \+ phase \+ ' strategy=' \+ strategy/);
  assert.doesNotMatch(shell, /webview-state[^\n]*(?:session=|proof=|page=)/,
    'Home UI proof and account signals are not copied into the WebView event');
  assert.doesNotMatch(shell, /diagTrace\('spotify-route[^\n]*(?:session|spotifyRoutePath\(\)|location\.href)/);
  assert.doesNotMatch(shell, /home-data stage=(?:web-to-android|web-rendered)[^\n]*(?:rows=|cards=|session=|proof=)/,
    'Home transfer diagnostics contain no card, playlist, session, or proof counts');
  assert.match(bridgeSource, /library-fetch phase=' \+ safePhase \+ ' http=' \+ safeHttp/);
  assert.match(bridgeSource, /mime=' \+ mime \+ ' duration=' \+ duration \+ ' error=' \+ error/);
  assert.doesNotMatch(bridgeSource, /received=|transformed=|proof=|page=/,
    'library diagnostics export only response type, HTTP status, phase, duration and sanitized error');
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
    'webview-state ready=', 'library-fetch phase=', 'spotify-route route=', 'home-guard guard=', 'home-css marker=',
    'home-node exists=', 'home-web decision=', 'home-data stage=web-to-android',
    'home-data stage=web-rendered', 'home-data stage=android-received',
    'home-data stage=android-rendered', 'home-state sent', 'home-final owner=', 'bridge-load phase='
  ]) assert.ok(structured.includes(event), `missing strict grammar for ${event}`);
  assert.match(structured,
    /library-fetch phase=response http=401 mime=\(json\|html\|other\|missing\) duration=\[0-9\]\{1,6\} error=http-401/,
    'the accepted 401 event must include a matching response status and response phase');
  assert.match(structured,
    /library-fetch phase=response http=403 mime=\(json\|html\|other\|missing\) duration=\[0-9\]\{1,6\} error=http-403/);
  assert.match(structured, /library-fetch phase=\(request\|response\|parse\|transform\|settle\) http=/);
  assert.match(structured, /mime=\(json\|html\|other\|missing\).*error=\(none\|empty\|http-other/);
  assert.doesNotMatch(structured, /library-proof|proof=|page=|received=|transformed=/,
    'persistent grammar excludes session proof, profile signals and account-content counts');
  assert.match(structured, /width=\[0-9\]\{1,5\}/);
  assert.match(structured, /bridge-load phase=\(read-start\|read-end\|exec-start\|exec-end\)/);
  assert.doesNotMatch(structured, /playlist-name|account-id|cookie|access_token|refresh_token|selector|spotifyRoutePath/i);
});

test('Android native renderer records stage outcomes without logging playlist/card counts', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  assert.match(renderer, /traceHomeReceipt\(I\)V/);
  assert.match(renderer, /traceHomeRendered\(IILjava\/lang\/String;\)V/);
  assert.match(renderer, /home-data stage=android-received result=received/);
  assert.match(renderer, /home-data stage=android-rendered result=/);
  assert.match(renderer, /add-int\/lit8 p1, p1, 0x1/,
    'rendered card count is still internal to view construction');
  assert.match(renderer, /NativeCrashGuard;->diagLine\(Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(renderer, /home-data stage=android-(?:received|rendered)[^\n]*(?:rows=|cards=|session=|proof=)/,
    'native diagnostics contain only stage outcomes, not account counts or proof flags');
  assert.doesNotMatch(renderer, /diagLine\([^\n]*(?:title|subtitle|uri|image)/i,
    'native diagnostics never contain playlist metadata or URIs');
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
