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
  assert.match(callback, /hasNativeHomeContent\(\)Z[\s\S]*?if-nez v8, :skip_native_ready/,
    'only a real card already attached to the active native Home can suppress redispatch');
  assert.ok(callback.includes('reason=native-home-rendered'));
  assert.match(callback, /postNativeUiRoute\(Ljava\/lang\/String;\)V[\s\S]*?postNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method public final hasNativeHomeContent\(\)Z[\s\S]*?nativeCurrentScreen[\s\S]*?nativeHomeContentReady/);
  assert.doesNotMatch(callback, /showNativeUi\(\)V|setVisibility\(I\)V|revealWebUi\(\)V/,
    'the fallback never hides Spotify itself; NativeHomeShelfRenderer must attach a real card first');
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  assert.match(renderer, /startsWith\(Ljava\/lang\/String;\)Z[\s\S]*?if-eqz v7, :shelf_next/);
  assert.match(renderer, /:shelf_finish[\s\S]*?if-eqz v5, :shelf_no_cards[\s\S]*?showNativeUi\(\)V/);
  assert.ok(renderer.includes('native-home-render rendered=true'));
  assert.ok(renderer.includes('native-home-render rendered=false reason=no-real-cards'));
  const overlay = read('smali/com/melodix/music/StartupDiagnosticOverlay.smali');
  assert.ok(overlay.includes('.field private static reportTextView:Landroid/widget/TextView;'));
  assert.ok(overlay.includes('.method public static appendDiagnosticLine(Ljava/lang/String;)V'));
  assert.ok(overlay.includes('TextView;->setText(Ljava/lang/CharSequence;)V'));
});
