'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(ROOT, file), 'utf8');
const SCRIPT = read('assets/native_home_fallback.js');

function makeAnchor({ href, title, subtitle = '', image = '', inNav = false, shown = true, aria = '', roleLink = false, cardKind = 'article' }) {
  const titleNode = { innerText: title, textContent: title };
  const subtitleNode = { innerText: subtitle, textContent: subtitle };
  const imageNode = {
    alt: title,
    currentSrc: image,
    src: image,
    getAttribute(name) { return name === 'src' ? image : null; }
  };
  const card = {
    tagName: cardKind.toUpperCase(),
    parentElement: null,
    innerText: [title, subtitle].filter(Boolean).join('\n'),
    textContent: [title, subtitle].filter(Boolean).join(' '),
    matches(selector) { return cardKind === 'article' && selector.includes('article'); },
    querySelector(selector) {
      if (selector.includes('subtitle')) return subtitleNode;
      if (selector.includes('card-title') || selector.includes('data-encore-id')) return titleNode;
      if (selector.includes('img')) return imageNode;
      return null;
    }
  };
  const anchor = {
    href,
    parentElement: card,
    innerText: [title, subtitle].filter(Boolean).join('\n'),
    textContent: [title, subtitle].filter(Boolean).join(' '),
    getClientRects() { return shown ? [{}] : []; },
    getAttribute(name) {
      if (name === 'href') return href;
      if (name === 'aria-label') return aria;
      if (name === 'role') return roleLink ? 'link' : null;
      return null;
    },
    matches(selector) { return roleLink && selector.includes('[role="link"][href]'); },
    closest(selector) { return inNav && selector.includes('nav') ? {} : null; },
    querySelector(selector) { return card.querySelector(selector); }
  };
  return anchor;
}

function run({ anchors = [], hostname = 'open.spotify.com', pathname = '/intl-fr/',
  nativeDataSent = false, shellRows = 0, root = 'none', mainView = false } = {}) {
  const document = {
    querySelector(selector) { return selector === '#main-view' && mainView ? {} : null; },
    querySelectorAll(selector) {
      return selector === 'a[href], [role="link"][href]' ? anchors : [];
    }
  };
  const window = {
    location: { hostname, pathname, href: `https://${hostname}${pathname}` },
    getComputedStyle() { return { display: 'block', visibility: 'visible', opacity: '1' }; },
    __sfNativeUiShellStarted: false,
    __sfNativeUiShellCompleted: false,
    __sfNativeUiHomeDataSent: nativeDataSent,
    __sfNativeUiHomeRowsCount: shellRows,
    __sfNativeUiContentRootSelector: root
  };
  const result = vm.runInNewContext(SCRIPT, { window, document, URL });
  return { result, window };
}

test('Home fallback collects only visible real Spotify cards when #main-view is absent', () => {
  const playlistId = '37i9dQZF1DXcBWIGoYBM5M';
  const albumId = '2noRn2Aes5aoNVsU6iWThc';
  const anchors = [
    makeAnchor({
      href: `https://open.spotify.com/intl-fr/playlist/${playlistId}?si=private-query`,
      title: 'Daily Mix 1', subtitle: 'Made for you',
      image: 'https://i.scdn.co/image/ab67616d00001e02example'
    }),
    makeAnchor({
      href: `https://open.spotify.com/album/${albumId}`,
      title: 'Real album', subtitle: 'Real artist',
      image: 'https://image-cdn-fa.spotifycdn.com/image/example'
    }),
    makeAnchor({ href: `https://open.spotify.com/playlist/${playlistId}`, title: 'Sidebar playlist', inNav: true }),
    makeAnchor({ href: 'https://spotify.attacker.example/playlist/37i9dQZF1DXcBWIGoYBM5M', title: 'Wrong host' }),
    makeAnchor({ href: 'https://open.spotify.com/track/not-a-real-id', title: 'Invalid resource' }),
    makeAnchor({ href: `https://open.spotify.com/playlist/${playlistId}`, title: 'Hidden card', shown: false })
  ];

  const { result } = run({ anchors });
  assert.equal(result.hostOK, true);
  assert.equal(result.homeRoute, true);
  assert.equal(result.mainView, false);
  assert.equal(result.mode, 'fallback');
  assert.equal(result.rows.length, 2);
  assert.deepEqual(JSON.parse(JSON.stringify(result.rows.map((row) => [row.title, row.uri]))), [
    ['Daily Mix 1', `spotify:playlist:${playlistId}`],
    ['Real album', `spotify:album:${albumId}`]
  ]);
  assert.ok(result.rows[0].image.startsWith('https://i.scdn.co/'));
  assert.ok(result.rows[1].image.startsWith('https://image-cdn-fa.spotifycdn.com/'));
  assert.equal(result.rows[0].subtitle, 'Made for you');
  assert.equal(JSON.stringify(result).includes('private-query'), false, 'tracking query is not forwarded');
});

test('fallback diagnostics expose only root presence, never a DOM selector or Spotify resource id', () => {
  const privateSelector = '[data-testid="private-home-root-37i9dQZF1DXsecret"]';
  const { result } = run({ root: privateSelector });
  assert.equal(result.root, true);
  assert.equal(JSON.stringify(result).includes(privateSelector), false);

  const callback = read('smali/com/melodix/music/NativeHomeFallback$Callback.smali');
  const rootDiagnostic = callback.slice(
    callback.indexOf('const-string v5, "root"'),
    callback.indexOf('const-string v7, "anchors"')
  );
  assert.match(rootDiagnostic, /JSONObject;->optBoolean\(Ljava\/lang\/String;Z\)Z/);
  assert.match(rootDiagnostic, /StringBuilder;->append\(Z\)Ljava\/lang\/StringBuilder;/,
    'the native persistence path also accepts and records only the boolean');
  assert.doesNotMatch(rootDiagnostic, /optString/,
    'a DOM selector cannot be logged from the callback payload');
});

test('role=link cards and image-bearing ancestors are harvested with split titles', () => {
  const { result } = run({ anchors: [makeAnchor({
    href: 'https://open.spotify.com/artist/4Z8W4fKeB5YxbusRsdQVPb',
    title: 'Radio ecstasy Avec SUICIDAL-IDOL',
    image: 'https://i.scdn.co/image/real-artwork',
    roleLink: true,
    cardKind: 'div'
  })] });
  assert.equal(result.mode, 'fallback');
  assert.equal(result.anchors, 1);
  assert.equal(result.validLinks, 1);
  assert.equal(result.rows.length, 1);
  assert.equal(result.rows[0].title, 'Radio ecstasy');
  assert.equal(result.rows[0].subtitle, 'SUICIDAL-IDOL');
  assert.equal(result.rows[0].uri, 'spotify:artist:4Z8W4fKeB5YxbusRsdQVPb');
  assert.equal(result.rows[0].image, 'https://i.scdn.co/image/real-artwork');
  assert.ok(SCRIPT.includes("document.querySelectorAll('a[href], [role=\"link\"][href]')"),
    'the collector includes Spotify role=link variants as well as anchors');
});

test('the native recovery probe’s localized /app player entry is recognized as Home', () => {
  const { result } = run({
    pathname: '/intl-fr/app',
    anchors: [makeAnchor({
      href: 'https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M',
      title: 'Real Home playlist'
    })]
  });
  assert.equal(result.homeRoute, true);
  assert.equal(result.mode, 'fallback');
  assert.equal(result.rows.length, 1);
  assert.equal(result.rows[0].title, 'Real Home playlist');
});

test('fallback refuses account/login and non-Home Spotify routes', () => {
  const anchor = makeAnchor({
    href: 'https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M',
    title: 'Real playlist'
  });
  const { result: login } = run({ hostname: 'accounts.spotify.com', pathname: '/en/login', anchors: [anchor] });
  assert.equal(login.mode, 'not-spotify');
  assert.equal(login.rows.length, 0);
  const { result: detail } = run({ pathname: '/intl-fr/playlist/37i9dQZF1DXcBWIGoYBM5M', anchors: [anchor] });
  assert.equal(detail.mode, 'not-home');
  assert.equal(detail.rows.length, 0);
});

test('a successful shell Home payload is diagnosed but not duplicated', () => {
  const id = '37i9dQZF1DXcBWIGoYBM5M';
  const { result, window } = run({
    nativeDataSent: true,
    shellRows: 4,
    root: '#main-view',
    anchors: [makeAnchor({ href: `https://open.spotify.com/playlist/${id}`, title: 'Real recommendation' })]
  });
  assert.equal(result.mode, 'home-data-sent');
  assert.equal(result.rows.length, 1, 'the diagnostic scrape still counts a real visible DOM card');
  assert.equal(result.anchors, 1);
  assert.equal(result.validLinks, 1);
  assert.equal(window.__sfNativeHomeFallbackRows, 1);
});

test('an empty shell payload does not suppress fallback rows from the live Spotify DOM', () => {
  const id = '37i9dQZF1DXcBWIGoYBM5M';
  const { result, window } = run({
    nativeDataSent: true,
    shellRows: 0,
    anchors: [makeAnchor({ href: `https://open.spotify.com/playlist/${id}`, title: 'Real recommendation' })]
  });
  assert.equal(result.mode, 'fallback');
  assert.equal(result.rows.length, 1);
  assert.equal(window.__sfNativeHomeFallbackRows, 1);
});

test('empty or title-less Spotify DOM produces no synthetic card', () => {
  const anchors = [
    makeAnchor({ href: 'https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', title: '' }),
    makeAnchor({ href: 'https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M', title: 'Play' })
  ];
  const { result } = run({ anchors });
  assert.equal(result.mode, 'empty');
  assert.deepEqual(JSON.parse(JSON.stringify(result.rows)), []);
});

test('the recovery probe is read-only: no auth, navigation, storage, or page hiding', () => {
  assert.doesNotMatch(SCRIPT, /document\.cookie|localStorage|sessionStorage|fetch\s*\(|XMLHttpRequest|\.click\s*\(|loadUrl|removeChild|innerHTML|\.style\s*\./i);
  assert.doesNotMatch(SCRIPT, /access_token|refresh_token|Bearer\s/i);
  assert.match(SCRIPT, /getClientRects/);
  assert.match(SCRIPT, /open\.spotify\.com/);
  assert.match(SCRIPT, /__sfNativeHomeFallbackRows = rows\.length/,
    'the queued native probe can tell it not to navigate over verified Home cards');
  const nativeProbe = read('smali/com/melodix/music/AndBridge.smali');
  assert.match(nativeProbe, /probe yield native home rows=/,
    'the navigation safety net yields after the fallback has found real Home rows');
  assert.match(SCRIPT, /spotify:\s*' \+ resource\.type/);
});

test('page-finished and the CONTENT STUCK watchdog both request native Home recovery', () => {
  const client = read('smali/c91.smali');
  const finished = client.indexOf('.method public final onPageFinished(');
  const homeScript = client.indexOf('const-string v5, "melodix_home.js"', finished);
  const capture = client.indexOf('NativeHomeFallback;->capture(Landroid/webkit/WebView;)V', homeScript);
  const probe = client.indexOf('AndBridge;->runProbe(Landroid/webkit/WebView;)V', capture);
  assert.ok(finished >= 0 && homeScript > finished && capture > homeScript && probe > capture,
    'the first capture follows all normal shell/Home injections and precedes navigation probes');

  const unstick = read('smali/com/melodix/music/StartupUnstickRunnable.smali');
  const delayedCapture = unstick.indexOf('NativeHomeFallback;->capture(Landroid/webkit/WebView;)V');
  const delayedProbe = unstick.indexOf('AndBridge;->runProbe(Landroid/webkit/WebView;)V');
  assert.ok(delayedCapture >= 0 && delayedCapture < delayedProbe,
    'the watchdog retries the scrape against the still-visible Spotify page first');
});

test('native callback requires a Home route and real rows; the renderer remains the visibility gate', () => {
  const callback = read('smali/com/melodix/music/NativeHomeFallback$Callback.smali');
  for (const key of ['hostOK', 'homeRoute', 'mainView', 'shellCompleted', 'nativeDataSent', 'shellRows']) {
    assert.ok(SCRIPT.includes(key + ':'), `fallback result includes ${key}`);
    assert.ok(callback.includes(`"${key}"`), `native callback reads the exact ${key} field`);
  }
  assert.match(callback, /const-string v7, "hostOK"[\s\S]*?if-eqz v7, :skip_not_host/);
  assert.match(callback, /const-string v8, "homeRoute"[\s\S]*?if-eqz v8, :skip_not_home/);
  assert.match(callback, /if-lez v3, :skip_no_rows/);
  assert.match(callback, /const-string v7, "anchors"[\s\S]*?const-string v7, "validLinks"/);
  assert.ok(callback.includes('native-home-fallback dispatch=queued rows='));
  assert.ok(callback.includes('rendered=pending'));
  assert.match(callback, /StartupDiagnosticOverlay;->appendDiagnosticLine/);
  assert.match(callback, /hasNativeHomeCardsAttached\(\)Z[\s\S]*?if-nez v8, :skip_native_ready/,
    'an already attached card prevents duplicate dispatch while pixel visibility remains a separate gate');
  assert.ok(callback.includes('reason=native-home-cards-attached'));
  assert.match(callback, /postNativeHomeFallbackData\(Ljava\/lang\/String;\)V/);
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method public final hasNativeHomeContent\(\)Z[\s\S]*?nativeCurrentScreen[\s\S]*?nativeHomeContentReady/);
  assert.match(activity, /\.method public final postNativeHomeFallbackData\(Ljava\/lang\/String;\)V[\s\S]*?const\/4 v2, 0x3[\s\S]*?runOnUiThread/);
  const updateRunnable = read('smali/com/melodix/music/NativeUiUpdateRunnable.smali');
  assert.match(updateRunnable, /const\/4 v2, 0x3[\s\S]*?ui=render-start[\s\S]*?setNativeScreen\(Ljava\/lang\/String;\)V[\s\S]*?renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V[\s\S]*?ui=render-returned/);
  assert.doesNotMatch(callback, /showNativeUi\(\)V|setVisibility\(I\)V|revealWebUi\(\)V/,
    'the fallback never hides Spotify itself; NativeHomeShelfRenderer must attach a real card first');
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  assert.match(renderer, /startsWith\(Ljava\/lang\/String;\)Z[\s\S]*?if-eqz v7, :shelf_next/);
  assert.match(renderer, /:shelf_finish[\s\S]*?hasNativeHomeCardsAttached\(\)Z[\s\S]*?if-eqz v5, :shelf_no_cards[\s\S]*?showNativeUi\(\)V/);
  assert.ok(renderer.includes('native-home-render cards-attached=true'));
  assert.ok(renderer.includes('native-home-render rendered=false reason=no-real-cards'));
  assert.doesNotMatch(renderer, /"home-rendered"|nativeHomeContentReady:Z/,
    'the renderer does not claim global visibility or screen pixels');
  const overlay = read('smali/com/melodix/music/StartupDiagnosticOverlay.smali');
  assert.ok(overlay.includes('.field private static reportTextView:Landroid/widget/TextView;'));
  assert.ok(overlay.includes('.method public static appendDiagnosticLine(Ljava/lang/String;)V'));
  assert.ok(overlay.includes('TextView;->setText(Ljava/lang/CharSequence;)V'));
});

test('the no-cards Home fallback offers authentication first when the session is unproven', () => {
  // Incident P0: after a sign-in that never produced data, Home showed a bare
  // "Réessayer". When the session is explicitly unproven, the card must offer
  // "Se connecter" (primary) + "Réessayer" (secondary); otherwise keep retry.
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  // Anchor on the label DEFINITION (a jump reference earlier in the file would
  // truncate the window -- same trap as a label mention in a branch).
  const at = renderer.indexOf('\n    :shelf_no_cards\n');
  assert.ok(at !== -1, 'the :shelf_no_cards label definition exists');
  const block = renderer.slice(at, renderer.indexOf(':shelf_done', at));
  const code = block.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
  assert.match(code, /isNativeSessionUnproven\(\)Z/, 'the branch must read the real unproven flag');
  const unprovenAt = code.indexOf('Connexion Spotify requise');
  const retryAt = code.indexOf('Votre accueil n’a pas pu être chargé');
  assert.ok(unprovenAt !== -1 && retryAt !== -1, 'both variants exist');
  const unprovenPayload = code.slice(code.lastIndexOf('const-string', unprovenAt), code.indexOf('"]', unprovenAt));
  assert.ok(unprovenPayload.includes('melodix:action:open-login'), 'primary action = real login');
  assert.ok(unprovenPayload.includes('melodix:action:retry-library'), 'secondary action = retry');
  assert.ok(unprovenPayload.includes('sessionUnproven'), 'the state row re-marks the session unproven');
  // Order: the unproven branch is taken when the flag is TRUE (if-eqz -> retry).
  const flagAt = code.indexOf('isNativeSessionUnproven()Z');
  assert.match(code.slice(flagAt), /if-eqz v\d+, :shelf_no_cards_retry/,
    'flag true must lead to the login variant, not the retry variant');
  // The renderer maps open-login to a real label and renders secondaryUri.
  assert.match(renderer, /"melodix:action:open-login"[\s\S]*?"Se connecter"/);
  // The action row receives the secondary URI as its own parameter (the literal
  // "secondaryUri" is read BEFORE the call in the file, so assert both sides).
  assert.match(renderer, /const-string v\d+, "secondaryUri"/);
  assert.match(renderer, /addHomeStatusActions\(Lcom\/melodix\/music\/MainActivity;Landroid\/widget\/LinearLayout;Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'primary + secondary actions are both wired');
});

test('the Home status card shows a real indeterminate spinner when state=loading', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const at = renderer.indexOf('.method private static renderHomeStatus');
  const body = renderer.slice(at, renderer.indexOf('.end method', at));
  const code = body.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
  assert.match(code, /optString\(Ljava\/lang\/String;Ljava\/lang\/String;\)Ljava\/lang\/String;\s*\n\s*move-result-object v\d+\s*\n\s*const-string v\d+, "loading"/,
    'the state field is read and compared to "loading"');
  assert.match(code, /new-instance v\d+, Landroid\/widget\/ProgressBar;/);
  assert.match(code, /setIndeterminate\(Z\)V/, 'a real loading indicator, not a fake progress');
  // Only on the loading branch: the label guards the spinner.
  const loadingAt = code.indexOf('"loading"');
  assert.match(code.slice(loadingAt), /if-eqz v\d+, :home_status_no_spinner/);
  assert.match(code, /mel_splash_spinner/, 'sized from a real dimen token');
});
