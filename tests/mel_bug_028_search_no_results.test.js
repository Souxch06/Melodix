const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

// MEL-BUG-028: on the search screen, an empty result list used to always show
// the "type something" hint. With a submitted query (nativeExpectedSearch set
// and non-empty) it must say "Aucun résultat pour « ... »" instead.
function searchEmptyBranch() {
  const body = activity.slice(
    activity.indexOf('.method public final renderNativeRows('),
    activity.indexOf('.end method', activity.indexOf('.method public final renderNativeRows(')));
  const at = body.indexOf('\n    :native_rows_search_empty\n');
  assert.ok(at > 0, ':native_rows_search_empty must exist');
  const end = body.indexOf('\n    :native_rows_library_empty\n');
  return body.slice(at, end > 0 ? end : at + 900);
}

test('MEL-BUG-028: zero-result search names the query instead of the hint', () => {
  const branch = searchEmptyBranch();
  // Branch on nativeExpectedSearch being set and non-empty.
  assert.match(branch,
    /iget-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeExpectedSearch:Ljava\/lang\/String;\s+if-eqz v0, :native_rows_search_hint\s+invoke-virtual \{v0\}, Ljava\/lang\/String;->trim\(\)Ljava\/lang\/String;\s+move-result-object v0\s+invoke-virtual \{v0\}, Ljava\/lang\/String;->isEmpty\(\)Z\s+move-result v1\s+if-nez v1, :native_rows_search_hint/,
    'must branch to the hint only when no query was submitted');
  // The zero-result message embeds the query via StringBuilder.
  assert.match(branch, /Aucun résultat pour « /, 'must name the zero-result state');
  assert.match(branch, /iget-object v1, p0, Lcom\/melodix\/music\/MainActivity;->nativeExpectedSearch:Ljava\/lang\/String;/,
    'the query must come from nativeExpectedSearch');
  // The hint is preserved for the empty-query case.
  assert.match(branch, /:native_rows_search_hint\s+const-string v0, "Recherchez un artiste, un titre, un album ou une playlist ci-dessus"/);
});

test('MEL-BUG-028: the zero-result text and the hint both reach the empty-state view', () => {
  const branch = searchEmptyBranch();
  const gotoSet = branch.match(/goto :native_rows_set_empty/g) || [];
  assert.ok(gotoSet.length >= 2, 'both messages must flow to :native_rows_set_empty');
});
