const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const client = fs.readFileSync(path.join(root, 'smali/c91.smali'), 'utf8');
const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
const policy = fs.readFileSync(path.join(root, 'smali/com/melodix/music/SpotifyNavigationPolicy.smali'), 'utf8');
const bridge = fs.readFileSync(path.join(root, 'smali/com/melodix/music/AndBridge.smali'), 'utf8');
const nativeNavigation = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeWebPlayerNavigationRunnable.smali'), 'utf8');

function method(source, signature) {
  const start = source.indexOf(signature);
  assert.notEqual(start, -1, `missing Smali method: ${signature}`);
  const end = source.indexOf('.end method', start);
  assert.notEqual(end, -1, `unterminated Smali method: ${signature}`);
  return source.slice(start, end);
}

test('both WebView navigation callback signatures run the Spotify policy before fallback handling', () => {
  const request = method(client, '.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z');
  const legacy = method(client, '.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z');

  for (const [name, body] of [['request', request], ['legacy', legacy]]) {
    const policyCall = body.indexOf('SpotifyNavigationPolicy;->handle(');
    const fallback = body.indexOf('WebViewClient;->shouldOverrideUrlLoading(');
    assert.ok(policyCall >= 0, `${name} callback must pass navigation through the policy`);
    assert.ok(fallback > policyCall, `${name} callback must consume Spotify app links before the platform fallback`);
  }
  assert.ok(request.indexOf('WebResourceRequest;->isForMainFrame()Z') < request.indexOf('SpotifyNavigationPolicy;->handle('));
  assert.match(legacy, /const\/4 v1, 0x1[\s\S]*?SpotifyNavigationPolicy;->handle\(Landroid\/webkit\/WebView;Landroid\/net\/Uri;Z\)Z/);
});

test('the Activity boundary consumes Spotify ACTION_VIEW intents before Android can launch an app', () => {
  const interceptor = method(policy, '.method public static interceptActivityIntent(Landroid/webkit/WebView;Landroid/content/Intent;)Z');
  assert.match(interceptor, /android\.intent\.action\.VIEW/);
  assert.match(interceptor, /getData\(\)Landroid\/net\/Uri;/);
  assert.match(interceptor, /com\.spotify\.music/);
  assert.match(interceptor, /accounts\.spotify\.com/);
  assert.doesNotMatch(interceptor, /invoke-.*startActivity\(/);

  for (const signature of [
    '.method public startActivity(Landroid/content/Intent;)V',
    '.method public startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V',
  ]) {
    const body = method(activity, signature);
    const policyCall = body.indexOf('SpotifyNavigationPolicy;->interceptActivityIntent(');
    const fallback = body.indexOf('invoke-super');
    assert.ok(policyCall >= 0 && policyCall < fallback,
      `${signature} must give the Spotify policy first refusal before the superclass`);
  }
});

test('Spotify app hand-offs load a same-origin HTTPS route in the existing WebView and are consumed', () => {
  const handle = method(policy, '.method public static handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z');
  assert.match(handle, /equalsIgnoreCase\(Ljava\/lang\/String;\)Z/);
  assert.match(handle, /SpotifyNavigationPolicy;->isSpotifyUri\(Landroid\/net\/Uri;\)Z/);
  assert.match(handle, /spotify-web-link-contained/);
  assert.match(handle, /Uri;->toString\(\)Ljava\/lang\/String;/);
  assert.match(handle, /SpotifyNavigationPolicy;->toWebUrl\(Landroid\/net\/Uri;\)Ljava\/lang\/String;/);
  assert.match(handle, /Landroid\/webkit\/WebView;->loadUrl\(Ljava\/lang\/String;\)V/);
  assert.match(handle, /spotify-app-link-contained/);
  assert.match(handle, /spotify-app-link-contained-subframe/);
  assert.match(handle, /if-eqz p2, :consume_subframe/);
  assert.match(handle, /spotify-app-link-blocked/);
  assert.match(handle, /const\/4 v0, 0x1[\s\S]*?return v0/);
  assert.doesNotMatch(handle, /startActivity|ACTION_VIEW/);
});

test('Spotify URI conversion keeps supported content routes on the Spotify HTTPS origin', () => {
  const route = method(policy, '.method private static toWebUrl(Landroid/net/Uri;)Ljava/lang/String;');
  const routeType = method(policy, '.method private static isRouteType(Ljava/lang/String;)Z');

  for (const type of ['track', 'playlist', 'album', 'artist', 'show', 'episode', 'user', 'search', 'app', 'home']) {
    assert.ok(routeType.includes(`"${type}"`), `supported Spotify route missing: ${type}`);
  }
  assert.match(route, /getSchemeSpecificPart\(\)Ljava\/lang\/String;/);
  assert.match(route, /String;->replace\(Ljava\/lang\/CharSequence;Ljava\/lang\/CharSequence;\)Ljava\/lang\/String;/);
  assert.match(route, /https:\/\/open\.spotify\.com\//);
  assert.match(route, /:home[\s\S]*?https:\/\/open\.spotify\.com\//);
  assert.doesNotMatch(route, /https:\/\/accounts\.spotify\.com/);
});

test('intent:// containment is limited to Spotify hosts, Spotify scheme, or the official app package', () => {
  const intent = method(policy, '.method private static isSpotifyIntent(Landroid/net/Uri;)Z');
  for (const value of [
    'package=com.spotify.music',
    'scheme=spotify',
  ]) {
    assert.ok(intent.includes(`"${value}"`), `missing explicit Spotify intent indicator: ${value}`);
  }
  assert.doesNotMatch(intent, /contains\(Ljava\/lang\/CharSequence;\)Z[\s\S]{0,80}const-string v1, "spotify"/);
  assert.doesNotMatch(intent, /accounts\.spotify\.com/);

  const hostPolicy = method(policy, '.method private static isSpotifyWebHost(Ljava/lang/String;)Z');
  for (const host of ['open.spotify.com', 'spotify.link', 'spoti.fi', 'spotify.app.link', 'spotify-alternate.app.link', 'spotify-alternative.app.link', 'link.tospotify.com']) {
    assert.ok(hostPolicy.includes(`"${host}"`), `missing Spotify app-link host: ${host}`);
  }

  const uriPolicy = method(policy, '.method private static isSpotifyUri(Landroid/net/Uri;)Z');
  const accountExclusion = uriPolicy.indexOf('accounts.spotify.com');
  const schemeDispatch = uriPolicy.indexOf('Uri;->getScheme()Ljava/lang/String;');
  assert.ok(accountExclusion >= 0 && accountExclusion < schemeDispatch,
    'Spotify account navigation must be excluded before custom-scheme interception');
});

test('the native shell loader accepts only canonical Spotify HTTPS URLs and posts loadUrl to the UI thread', () => {
  const loader = method(bridge, '.method public final loadWebPlayerUrl(Ljava/lang/String;)V');
  const runnable = method(nativeNavigation, '.method public final run()V');
  assert.match(loader, /JavascriptInterface/);

  const validation = [
    'Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;',
    'Uri;->getScheme()Ljava/lang/String;',
    'const-string v2, "https"',
    'Uri;->getHost()Ljava/lang/String;',
    'const-string v2, "open.spotify.com"',
    'Uri;->getUserInfo()Ljava/lang/String;',
    'Uri;->getPort()I',
    'const/16 v2, 0x1bb',
  ];
  const scheduleAt = loader.indexOf('new-instance v1, Lcom/melodix/music/NativeWebPlayerNavigationRunnable;');
  assert.ok(scheduleAt >= 0, 'only validated URLs reach the UI-thread navigation runnable');
  for (const check of validation) {
    const at = loader.indexOf(check);
    assert.ok(at >= 0 && at < scheduleAt, `URL check must precede navigation: ${check}`);
  }
  assert.match(loader, /Landroid\/view\/View;->post\(Ljava\/lang\/Runnable;\)Z/);
  assert.doesNotMatch(loader, /startActivity|ACTION_VIEW/);

  assert.match(runnable, /Landroid\/webkit\/WebView;->loadUrl\(Ljava\/lang\/String;\)V/);
  assert.match(runnable, /player-nav native-load/);
  assert.match(runnable, /player-nav native-load failed/);
});

test('the guard does not launch Spotify, rewrite account state, or capture login data', () => {
  assert.doesNotMatch(policy, /invoke-.*->startActivity\(/);
  assert.doesNotMatch(policy, /CookieManager|setCookie|password|credential/i);
  assert.match(client, /invoke-static \{v1\}, Ldl1;->l\(Ljava\/lang\/String;\)Z/);
  assert.match(client, /"\/oauth"/);
  assert.match(client, /"\/v2\/auth"/);
  assert.match(client, /"\/signin"/);
});
