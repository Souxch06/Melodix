const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

// MEL-BUG-025: on the native search screen, a query submitted while the
// session is NOT proven used to leave an empty "Résultats de recherche" list
// with no explanation and no action. The :search_render branch of
// applyNativeUiData must now render the real state card (login action) via
// NativeHomeShelfRenderer when isNativeSessionUnproven() is true, and keep the
// normal row rendering when the session IS proven.
function searchRenderBlock() {
  const at = activity.indexOf('\n    :search_render\n');
  assert.ok(at > 0, ':search_render label must exist in applyNativeUiData');
  const end = activity.indexOf('.end method', at);
  return activity.slice(at, end);
}

function provenBranch(block) {
  const at = block.indexOf('\n    :search_render_rows\n');
  assert.ok(at > 0, ':search_render_rows label definition must exist');
  return block.slice(at);
}

test('MEL-BUG-025: search screen without proven session renders a state card, not an empty list', () => {
  const block = searchRenderBlock();
  // The unproven branch consults the PERSISTENT flag (same accessor MEL-BUG-024
  // introduced for Library/detail — no home-scoped flag here).
  assert.match(block,
    /invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->isNativeSessionUnproven\(\)Z\s+move-result v\d+\s+if-eqz v\d+, :search_render_rows/,
    'isNativeSessionUnproven() must gate the unproven branch before row rendering');
  // The state card is rendered through the same shelf renderer the Library
  // unproven state uses, and the method returns without rendering rows.
  const card = block.match(
    /const-string v\d+, "(\[\{[\s\S]*?\}\])"\s*\n\s*invoke-static \{p0, v\d+\}, Lcom\/melodix\/music\/NativeHomeShelfRenderer;->render/);
  assert.ok(card, 'a kind=state JSON must be rendered via NativeHomeShelfRenderer on the unproven branch');
  const payload = JSON.parse(card[1].replace(/\\"/g, '"'));
  assert.equal(payload[0].kind, 'state');
  assert.equal(payload[0].state, 'error');
  assert.equal(payload[0].sessionUnproven, true);
  assert.equal(payload[0].uri, 'melodix:action:open-login', 'the card must offer the real login action');
  assert.match(payload[0].title + ' ' + payload[0].subtitle, /session/i);
  assert.match(payload[0].subtitle, /recherche/i, 'the subtitle must explain that search needs a confirmed session');
  // The proven-session path is preserved: normal rows still render under the
  // :search_render_rows label with the usual title.
  assert.match(block, /:search_render_rows\s+const-string v\d+, "Résultats de recherche"\s+invoke-virtual \{p0, v\d+, p2\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows/);
  // The unproven branch must RETURN before renderNativeRows, so the empty/stale
  // payload can never overwrite the state card.
  const unprovenPart = block.slice(0, block.indexOf('\n    :search_render_rows\n'));
  assert.match(unprovenPart, /NativeHomeShelfRenderer;->render[\s\S]*?return-void/,
    'unproven branch must return immediately after rendering the card');
});

test('MEL-BUG-025: initial-search deep link without proven session shows the state card, not "[]"', () => {
  const at = activity.indexOf('\n    :check_initial_search\n');
  assert.ok(at > 0, ':check_initial_search must exist');
  const block = activity.slice(at, activity.indexOf('.end method', at));
  assert.match(block,
    /:native_initial_search_submit(?:\s+#[^\n]*\n)*\s+invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->isNativeSessionUnproven\(\)Z\s+move-result v2\s+if-nez v2, :initial_search_unproven/,
    'initial-search must branch on the persistent unproven flag');
  const unproven = block.slice(block.indexOf('\n    :initial_search_unproven\n'));
  const card = unproven.match(/const-string v2, "(\[\{[\s\S]*?\}\])"\s*\n\s*invoke-static \{p0, v2\}, Lcom\/melodix\/music\/NativeHomeShelfRenderer;->render/);
  assert.ok(card, 'unproven initial-search must render the state card via the shelf renderer');
  const payload = JSON.parse(card[1].replace(/\\"/g, '"'));
  assert.equal(payload[0].sessionUnproven, true);
  assert.equal(payload[0].uri, 'melodix:action:open-login');
  // The proven path still renders the empty list placeholder and still kicks
  // the WebView search; the unproven path must NOT render "[]".
  assert.match(block, /const-string v3, "\[\]"/);
  assert.doesNotMatch(unproven, /"\[\]"/, 'unproven branch must never render the empty list');
  assert.match(block, /:initial_search_kick\s+const-string v2, "window\.searchMediaItems"/,
    'both branches still trigger the WebView search fallback');
});

test('MEL-BUG-025: the unproven card never leaks into the proven-session path', () => {
  const block = searchRenderBlock();
  const provenPart = provenBranch(block);
  assert.doesNotMatch(provenPart, /NativeHomeShelfRenderer;->render/,
    'proven sessions must keep the plain row renderer');
});
