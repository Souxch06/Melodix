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

test('Web Home visibility callbacks never steal the native foreground', () => {
  const source = read('scripts/melodix_home.source.js');
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const runnable = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  const owner = activity.slice(activity.indexOf('.method public final setMelodixHomeVisibility(ZZ)V'));
  const ownerBody = owner.slice(0, owner.indexOf('.end method'));
  const showAt = activity.indexOf('.method public final showNativeUiFrom(');
  const show = activity.slice(showAt, activity.indexOf('.end method', showAt));
  assert.match(source, /route === 'home' && session === '1' && home/,
    'the Web renderer still applies its own route, session and geometry guard');
  assert.match(source, /rect\.width > 0 && rect\.height > 0/,
    'Web Home state remains based on measured non-empty bounds');
  assert.match(source, /onMelodixHomeVisibility\(value, session\)/,
    'only two booleans cross the bridge');
  assert.match(bridge, /\.method public final onMelodixHomeVisibility\(ZZ\)V[\s\S]*?postMelodixHomeVisibility\(ZZ\)V/);
  assert.match(ownerBody, /if-eqz p2, :melodix_home_session_unproven[\s\S]*?NativeHomeShelfRenderer;->render/,
    'session loss unconditionally replaces Home content with the native safe status renderer');
  assert.doesNotMatch(ownerBody, /melodix_home_unproven_no_private_rows|hasNativeHomeContentAttached/,
    'stale native rows are not retained based on a previous Web-Home visibility flag');
  assert.doesNotMatch(ownerBody, /revealWebUi\(\)V/,
    'a late renderer callback cannot make Spotify Web the foreground');
  assert.match(show, /nativeCurrentScreen[\s\S]*?hasNativeHomeContentAttached\(\)Z[\s\S]*?state.*loading/s,
    'missing Home content becomes an explicit native status while the WebView remains mounted');
  assert.doesNotMatch(show, /revealWebUi\(\)V/,
    'a missing card/status does not transfer ownership to Spotify Web');
  assert.doesNotMatch(runnable, /isMelodixWebHomeActive\(\)Z/,
    'the watchdog does not skip native visibility checks just because the Web renderer reported active');
  assert.match(runnable, /:native_layout_give_up[\s\S]*?visibility-timeout[\s\S]*?native-shell-visibility-pending/);
  assert.doesNotMatch(runnable, /revealWebUi\(\)V/,
    'a late watchdog timeout is diagnostic only');
  assert.match(activity, /window\.__sfMelodixHomeSyncNativeOwner && window\.__sfMelodixHomeSyncNativeOwner\(\)/,
    'the Home route still re-synchronizes the Web renderer after native routing');
});

test('native display ownership transitions are sanitized, route-aware and time-correlated', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const traceStart = activity.indexOf('.method public final traceNativeDisplayOwner(');
  const trace = activity.slice(traceStart, activity.indexOf('.end method', traceStart));
  const sanitizeStart = activity.indexOf('.method public final sanitizeNativeDisplayLabel(');
  const sanitize = activity.slice(sanitizeStart, activity.indexOf('.end method', sanitizeStart));
  const routeStart = activity.indexOf('.method public final nativeDisplayRoute()');
  const route = activity.slice(routeStart, activity.indexOf('.end method', routeStart));
  assert.match(trace, /sanitizeNativeDisplayLabel\(Ljava\/lang\/String;I\)Ljava\/lang\/String;/);
  assert.match(trace, /nativeDisplayOwner:Ljava\/lang\/String;[\s\S]*?nativeDisplayRoute\(\)Ljava\/lang\/String;/);
  for (const field of ['nativeHomeCardsAttached:Z', 'nativeHomeStatusAttached:Z']) {
    assert.ok(trace.includes(field), `ownership trace includes ${field}`);
  }
  for (const label of ['previous=', ' next=', ' route=', ' reason=', ' card=', ' status=', 'visibility=root:', ',web:', 'webview-mounted=', ',measure=', ' origin=', ' t=', 'ms']) {
    assert.ok(trace.includes(label), `ownership trace includes ${label}`);
  }
  assert.match(trace, /SystemClock;->elapsedRealtime\(\)J[\s\S]*?nativeDisplayOwnerStartElapsed:J[\s\S]*?sub-long\/2addr/,
    'the transition time is relative to the process launch, not a wall-clock timestamp');
  assert.match(trace, /NativeCrashGuard;->diagLine[\s\S]*?Log;->i/);
  assert.doesNotMatch(trace, /getUrl\(\)|getText\(\)|Cookie|token|spotifySession|MediaLibSession|access_token/i,
    'no URL, cookies, session proof, tokens or page text enter persistent owner diagnostics');
  assert.match(route, /const-string v1, "home"[\s\S]*?const-string v1, "search"[\s\S]*?const-string v1, "library"[\s\S]*?const-string v1, "detail"[\s\S]*?const-string v1, "player"/,
    'logical routes are emitted only from the fixed native screen vocabulary');
  assert.match(sanitize, /const-string v0, "callback"[\s\S]*?const-string v0, "event"[\s\S]*?const-string v0, "watchdog"[\s\S]*?const-string v0, "renderer"/,
    'callback, event, watchdog, and renderer origins are separately allowlisted');
});
