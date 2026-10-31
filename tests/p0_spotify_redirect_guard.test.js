const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const client = fs.readFileSync(path.join(root, 'smali/c91.smali'), 'utf8');
const policy = fs.readFileSync(path.join(root, 'smali/com/melodix/music/SpotifyNavigationPolicy.smali'), 'utf8');

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

test('Spotify app hand-offs load a same-origin HTTPS route in the existing WebView and are consumed', () => {
  const handle = method(policy, '.method public static handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z');
  assert.match(handle, /equalsIgnoreCase\(Ljava\/lang\/String;\)Z/);
  assert.match(handle, /const-string v1, "spotify"/);
  assert.match(handle, /const-string v1, "intent"/);
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
    'open.spotify.com',
    'package=com.spotify.music',
    'scheme=spotify',
  ]) {
    assert.ok(intent.includes(`"${value}"`), `missing explicit Spotify intent indicator: ${value}`);
  }
  assert.doesNotMatch(intent, /contains\(Ljava\/lang\/CharSequence;\)Z[\s\S]{0,80}const-string v1, "spotify"/);
  assert.doesNotMatch(intent, /accounts\.spotify\.com/);

  const handle = method(policy, '.method public static handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z');
  const accountExclusion = handle.indexOf('accounts.spotify.com');
  const schemeDispatch = handle.indexOf('Uri;->getScheme()Ljava/lang/String;');
  assert.ok(accountExclusion >= 0 && accountExclusion < schemeDispatch,
    'Spotify account navigation must be excluded before custom-scheme interception');
});

test('the guard does not launch Spotify, rewrite account state, or capture login data', () => {
  assert.doesNotMatch(policy, /startActivity|ACTION_VIEW|CookieManager|setCookie|password|credential/i);
  assert.match(client, /invoke-static \{v1\}, Ldl1;->l\(Ljava\/lang\/String;\)Z/);
  assert.match(client, /"\/oauth"/);
  assert.match(client, /"\/v2\/auth"/);
  assert.match(client, /"\/signin"/);
});
