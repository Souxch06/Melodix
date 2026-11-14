const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

// MEL-BUG-026: the generic empty-state branch of renderNativeRows used to show
// an eternal "Chargement de votre bibliothèque…" / "Chargement de la playlist…"
// when no rows could ever arrive (session unproven). Both screens must now
// render the real state card (login action) via NativeHomeShelfRenderer.
function renderNativeRowsBody() {
  const at = activity.indexOf('.method public final renderNativeRows(');
  assert.ok(at > 0, 'renderNativeRows must exist');
  return activity.slice(at, activity.indexOf('.end method', at));
}

for (const [label, screenLabel, loadingText, subtitleHint] of [
  ['library', ':native_rows_library_empty', 'Chargement de votre bibliothèque…', 'playlists restent masquées'],
  ['detail', ':native_rows_detail_empty', 'Chargement de la playlist…', 'session Spotify confirmée'],
]) {
  test(`MEL-BUG-026: ${screenLabel} empty state without proven session renders the state card`, () => {
    const body = renderNativeRowsBody();
    const at = body.indexOf(`\n    ${screenLabel}\n`);
    assert.ok(at > 0, `${screenLabel} must exist`);
    const branch = body.slice(at, at + 1400);
    // Unproven branch consults the PERSISTENT flag and renders the card.
    assert.match(branch,
      /invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->isNativeSessionUnproven\(\)Z\s+move-result v1\s+if-nez v1, :\w+/,
      `${screenLabel} must branch on isNativeSessionUnproven()`);
    const ifAt = branch.search(/if-nez v1, :(\w+)/);
    const unprovenLabel = branch.match(/if-nez v1, :(\w+)/)[1];
    // Proven path: between the branch and the unproven label, the loading text stays.
    const labelAt = branch.indexOf(`\n    :${unprovenLabel}\n`);
    assert.ok(labelAt > 0, 'unproven label must be defined');
    const proven = branch.slice(ifAt, labelAt);
    assert.ok(proven.includes(loadingText), `${screenLabel} proven branch must keep "${loadingText}"`);
    // Unproven branch: from its label onward, a state card is rendered and the
    // method returns without ever showing the loading text.
    const unproven = branch.slice(labelAt);
    const card = unproven.match(/const-string v1, "(\[\{[\s\S]*?\}\])"\s*\n\s*invoke-static \{p0, v1\}, Lcom\/melodix\/music\/NativeHomeShelfRenderer;->render/);
    assert.ok(card, `${screenLabel} unproven branch must render a state card via NativeHomeShelfRenderer`);
    const payload = JSON.parse(card[1].replace(/\\"/g, '"'));
    assert.equal(payload[0].kind, 'state');
    assert.equal(payload[0].sessionUnproven, true);
    assert.equal(payload[0].uri, 'melodix:action:open-login');
    assert.match(payload[0].subtitle, new RegExp(subtitleHint));
    assert.match(unproven, /render[\s\S]*?return-void/, `${screenLabel} unproven branch must return without the loading text`);
    assert.ok(!unproven.slice(0, unproven.indexOf('invoke-static')).includes(loadingText),
      `${screenLabel} unproven branch must not contain the loading text`);
  });
}

test('MEL-BUG-026: native search submit without proven session shows the state card, not "[]"', () => {
  const at = activity.indexOf('.method public final onNativeSearchSubmit(');
  assert.ok(at > 0, 'onNativeSearchSubmit must exist');
  const body = activity.slice(at, activity.indexOf('.end method', at));
  assert.match(body,
    /isNativeSessionUnproven\(\)Z\s+move-result v2\s+if-nez v2, :native_search_submit_unproven/,
    'submit must branch on the persistent unproven flag');
  const labelAt = body.indexOf('\n    :native_search_submit_unproven\n');
  assert.ok(labelAt > 0, 'unproven label must be defined');
  const unproven = body.slice(labelAt);
  const card = unproven.match(/const-string v2, "(\[\{[\s\S]*?\}\])"\s*\n\s*invoke-static \{p0, v2\}, Lcom\/melodix\/music\/NativeHomeShelfRenderer;->render/);
  assert.ok(card, 'unproven submit must render the state card');
  const payload = JSON.parse(card[1].replace(/\\"/g, '"'));
  assert.equal(payload[0].sessionUnproven, true);
  assert.equal(payload[0].uri, 'melodix:action:open-login');
  assert.ok(!unproven.includes('"[]"'), 'unproven submit must never render the empty list');
  const proven = body.slice(body.search(/if-nez v2, :native_search_submit_unproven/), labelAt);
  assert.ok(proven.includes('const-string v3, "[]"'), 'proven submit keeps the empty-list placeholder');
  assert.match(body, /:native_search_submit_kick(?:\s+#[^\n]*\n)*\s+const-string v2, "\(window\.__sfSubmitSearch\|\|window\.searchMediaItems\)"/,
    'both branches still kick the WebView search');
});

test('MEL-BUG-026/028: search empty keeps the hint only for an empty query', () => {
  const body = renderNativeRowsBody();
  const at = body.indexOf('\n    :native_rows_search_empty\n');
  assert.ok(at > 0, ':native_rows_search_empty must exist');
  // MEL-BUG-028: with a submitted query, the hint is replaced by the
  // zero-result message; the hint remains reachable via :native_rows_search_hint.
  assert.match(body.slice(at), /:native_rows_search_hint\s+const-string v0, "Recherchez un artiste, un titre, un album ou une playlist ci-dessus"/);
});

test('MEL-BUG-026: genre-tile live search without proven session renders the login card', () => {
  const at = activity.indexOf('.method public final performNativeLiveSearch(');
  assert.ok(at > 0, 'performNativeLiveSearch must exist');
  const body = activity.slice(at, activity.indexOf('.end method', at));
  // The WebView search is still kicked, THEN the card is rendered when unproven.
  assert.ok(body.indexOf('window.searchMediaItems') < body.indexOf('isNativeSessionUnproven()Z'),
    'the WebView search fallback must still be kicked before the card');
  const card = body.match(/const-string v1, "(\[\{[\s\S]*?\}\])"\s*\n\s*invoke-static \{p0, v1\}, Lcom\/melodix\/music\/NativeHomeShelfRenderer;->render/);
  assert.ok(card, 'unproven live search must render the state card');
  const payload = JSON.parse(card[1].replace(/\\"/g, '"'));
  assert.equal(payload[0].sessionUnproven, true);
  assert.equal(payload[0].uri, 'melodix:action:open-login');
  assert.match(body, /if-eqz v1, :live_search_done/, 'proven sessions skip the card');
});
