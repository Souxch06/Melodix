// Tablet layout: res/layout-sw600dp/activity_main.xml is a real second layout,
// not a scaled phone. Two layouts can drift, so parity is asserted here rather
// than trusted.
//
// The tablet variant is generated from the phone layout and then restructured,
// which means every id, click handler, content description and browse tag must
// still match. If someone edits one layout and forgets the other, this fails.
//
// Structural intent is asserted too: a two-column player and a four-column
// browse grid are the whole point of having a tablet layout at all.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { JSDOM } = require('jsdom');

const { loadDimens, PHONE } = require('./helpers/mel_dimens');

const root = path.join(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const phoneFile = 'res/layout/activity_main.xml';
const tabletFile = 'res/layout-sw600dp/activity_main.xml';
const landFile = 'res/layout-land/activity_main.xml';

const phoneXml = read(phoneFile);
const tabletXml = read(tabletFile);
const landXml = read(landFile);

const doc = (xml) => new JSDOM(xml, { contentType: 'text/xml' }).window.document;

const all = (xml, re) => [...xml.matchAll(re)].map((m) => m[1]);
const ids = (xml) => all(xml, /android:id="@(?:\+)?id\/(\w+)"/g).sort();
const handlers = (xml) => all(xml, /android:onClick="(\w+)"/g).sort();
const descriptions = (xml) => all(xml, /android:contentDescription="([^"]+)"/g).sort();
const tags = (xml) => all(xml, /android:tag="([^"]+)"/g);

function byId(document, id) {
  const node = document.querySelector(`[android\\:id="@id/${id}"]`);
  assert.ok(node, `${id} must exist`);
  return node;
}

test('the tablet variant is a valid layout with the same contract as the phone', () => {
  assert.ok(fs.existsSync(path.join(root, tabletFile)), 'a tablet layout must exist');
  assert.deepEqual(ids(tabletXml), ids(phoneXml), 'the tablet must expose exactly the phone ids');
  assert.deepEqual(handlers(tabletXml), handlers(phoneXml),
    'every phone click handler must still be wired on tablet');
  assert.deepEqual(descriptions(tabletXml), descriptions(phoneXml),
    'accessibility labels must not be lost on tablet');
  assert.deepEqual(tags(tabletXml), tags(phoneXml),
    'browse tiles keep their identity and order, so the same search runs');
});

test('the landscape variant is a valid layout with the same contract as the phone', () => {
  // MEL-BUG-033: landscape devices (phones in landscape, tablets) must get the
  // same id/handler contract as portrait; two layouts can drift, so parity is
  // asserted here rather than trusted.
  assert.ok(fs.existsSync(path.join(root, landFile)), 'a landscape layout must exist');
  assert.deepEqual(ids(landXml), ids(phoneXml), 'landscape must expose exactly the phone ids');
  assert.deepEqual(handlers(landXml), handlers(phoneXml), 'every phone click handler must still be wired in landscape');
  assert.deepEqual(descriptions(landXml), descriptions(phoneXml), 'accessibility labels must not be lost in landscape');
  assert.deepEqual(tags(landXml), tags(phoneXml), 'browse tiles keep their identity and order in landscape');
  const host = landXml.indexOf('@id/hScrollView');
  const shell = landXml.indexOf('@id/nativeRoot');
  assert.ok(host >= 0 && shell > host, 'land: nativeRoot must follow the WebView host');
});

test('the tablet keeps the native shell above the WebView host', () => {
  // Same draw-order invariant the phone is held to: the shell must be a later
  // sibling than the WebView container or it renders underneath it.
  for (const [name, xml] of [['phone', phoneXml], ['tablet', tabletXml]]) {
    const host = xml.indexOf('@id/hScrollView');
    const shell = xml.indexOf('@id/nativeRoot');
    assert.ok(host >= 0 && shell > host, `${name}: nativeRoot must follow the WebView host`);
  }
});

test('the tablet player is two columns, the phone player stays stacked', () => {
  const tablet = doc(tabletXml);
  const phone = doc(phoneXml);

  const tabletRow = byId(tablet, 'nativePlayerPanel').firstElementChild;
  assert.equal(tabletRow.getAttribute('android:orientation'), 'horizontal',
    'the tablet player puts the cover beside the metadata');
  assert.equal(tabletRow.getAttribute('android:baselineAligned'), 'false',
    'a cover column and a text column must not be baseline-aligned');

  const [artColumn, infoColumn] = [...tabletRow.children];
  assert.equal(artColumn.getAttribute('android:layout_width'), 'wrap_content',
    'the cover column hugs the artwork');
  assert.equal(infoColumn.getAttribute('android:layout_width'), '0.0dip');
  assert.equal(infoColumn.getAttribute('android:layout_weight'), '1.0',
    'the metadata column takes the remaining width');
  assert.ok(artColumn.querySelector('[android\\:id="@id/nativePlayerLargeArtwork"]'),
    'the cover lives in the left column');
  for (const id of ['nativePlayerLargeTitle', 'nativePlayerLargeArtist', 'nativePlayerProgress',
    'nativePlayerPositionText', 'nativePlayerDurationText', 'nativePlayerLargePlayPauseButton',
    'nativePlayerShuffleButton', 'nativePlayerRepeatButton', 'nativePlayerPreviousButton',
    'nativePlayerNextButton']) {
    assert.ok(infoColumn.querySelector(`[android\\:id="@id/${id}"]`),
      `${id} belongs to the tablet metadata column`);
  }

  const phoneStack = byId(phone, 'nativePlayerPanel').firstElementChild;
  assert.equal(phoneStack.getAttribute('android:orientation'), 'vertical',
    'the phone keeps the cover above the metadata');
});

test('tablet metadata reads left-aligned beside the cover', () => {
  const tablet = doc(tabletXml);
  for (const id of ['nativePlayerLargeTitle', 'nativePlayerLargeArtist']) {
    assert.equal(byId(tablet, id).getAttribute('android:gravity'), 'left',
      `${id} is left-aligned in a side column, not centred under a cover`);
  }
});

function browseRows(xml) {
  const document = doc(xml);
  const grid = byId(document, 'nativeGenreScroll');
  return [...grid.querySelectorAll('LinearLayout')]
    .filter((row) => row.getAttribute('android:orientation') === 'horizontal');
}

test('the browse grid is four columns on tablet and two on the phone', () => {
  const phoneRows = browseRows(phoneXml);
  const tabletRows = browseRows(tabletXml);
  assert.equal(phoneRows.length, 4, 'phone browse is four rows');
  assert.equal(tabletRows.length, 2, 'tablet browse is two rows');
  for (const row of phoneRows) assert.equal(row.children.length, 2, 'two tiles per phone row');
  for (const row of tabletRows) assert.equal(row.children.length, 4, 'four tiles per tablet row');

  // Only the last tile in a row drops its trailing gap, on both form factors.
  for (const rows of [phoneRows, tabletRows]) {
    for (const row of rows) {
      const tiles = [...row.children];
      tiles.forEach((tile, index) => {
        const gap = tile.getAttribute('android:layout_marginRight');
        if (index === tiles.length - 1) {
          assert.equal(gap, null, 'the last tile in a row has no trailing gap');
        } else {
          assert.equal(gap, '@dimen/mel_tile_row_gap', 'tiles are separated by the row gap token');
        }
      });
    }
  }
});

test('the tablet layout is fully tokenised and every token resolves', () => {
  const at = tabletXml.indexOf('@id/nativeRoot');
  const shell = tabletXml.slice(tabletXml.lastIndexOf('<', at));
  const literals = [...shell.matchAll(/(?:android|app):([A-Za-z_]+)="([0-9.]+(?:dip|sp))"/g)]
    .filter((m) => Number.parseFloat(m[2]) !== 0)
    .map((m) => `${m[1]}=${m[2]}`);
  assert.deepEqual(literals, [], 'the tablet layout must not reintroduce hardcoded sizes');

  const dimens = loadDimens(PHONE);
  const missing = [...new Set(all(tabletXml, /@dimen\/([A-Za-z0-9_]+)/g))]
    .filter((name) => dimens[name] === undefined);
  assert.deepEqual(missing, [], 'every tablet token must be defined');
});

test('the native shell and the loading bar use only the mel_* palette', () => {
  for (const [name, xml] of [['phone', phoneXml], ['tablet', tabletXml]]) {
    const at = xml.indexOf('@id/nativeRoot');
    const shell = xml.slice(xml.lastIndexOf('<', at));
    const offenders = [...new Set(all(shell, /@color\/([A-Za-z0-9_]+)/g))]
      .filter((colour) => !colour.startsWith('mel_') && colour !== 'session_accent_start');
    assert.deepEqual(offenders, [], `${name}: shell chrome must use the Melodix palette`);

    const hex = [...shell.matchAll(/(?:android|app):(?:text)?[Cc]olor="(#[0-9a-fA-F]{3,8})"/g)];
    assert.deepEqual(hex.map((m) => m[1]), [], `${name}: no inline hex colour in the shell`);
  }
});

test('the startup loading bar is Melodix green, not a template colour', () => {
  // teal_200 happened to hold the same green, but it is a Material template
  // name: the accent must be referenced as mel_accent so a palette change
  // reaches the loading state too.
  for (const [name, xml] of [['phone', phoneXml], ['tablet', tabletXml]]) {
    const at = xml.indexOf('@id/progressBar');
    const bar = xml.slice(xml.lastIndexOf('<', at), xml.indexOf('/>', at));
    assert.match(bar, /android:indeterminateTint="@color\/mel_accent"/,
      `${name}: the loading bar tints with the palette accent`);
    assert.doesNotMatch(xml, /@color\/teal_200/, `${name}: no Material template colour left`);
  }
});

test('the WebView host keeps its own backdrop on both form factors', () => {
  // The WebView sits under the shell and must not flash a different colour
  // before the shell draws, so its backdrop is deliberately not a shell token.
  for (const [name, xml] of [['phone', phoneXml], ['tablet', tabletXml]]) {
    const at = xml.indexOf('@id/webViewContainer');
    const host = xml.slice(xml.lastIndexOf('<', at), xml.indexOf('>', at));
    assert.match(host, /android:background="@color\/spotify_black"/,
      `${name}: the WebView host backdrop is unchanged`);
  }
});
