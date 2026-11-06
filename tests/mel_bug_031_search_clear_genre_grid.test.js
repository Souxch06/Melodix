const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');

// MEL-BUG-031: clearing the native search field (< 2 chars) used to do nothing,
// leaving stale result rows on screen instead of the genre browse grid.
test('MEL-BUG-031: the TextWatcher notifies the activity on a short/cleared query', () => {
  const watcher = read('smali/com/melodix/music/NativeSearchWatcher.smali');
  const m = watcher.match(/\.method public final afterTextChanged\(Landroid\/text\/Editable;\)V([\s\S]*?)\.end method/);
  assert.ok(m, 'afterTextChanged exists');
  assert.match(m[1], /if-lt v2, v3, :query_short/, 'a query shorter than 2 chars branches to :query_short');
  assert.match(m[1], /:query_short[\s\S]*?iput-object v3, p0, Lcom\/melodix\/music\/NativeSearchWatcher;->pendingQuery:Ljava\/lang\/String;/,
    'the pending query is cancelled so no stale search fires');
  assert.match(m[1], /:query_short[\s\S]*?invoke-virtual \{v0\}, Lcom\/melodix\/music\/MainActivity;->onNativeSearchQueryCleared\(\)V/,
    'the activity is told the query was cleared');
});

test('MEL-BUG-031: onNativeSearchQueryCleared shows the genre grid and hides result rows', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const m = activity.match(/\.method public final onNativeSearchQueryCleared\(\)V([\s\S]*?)\.end method/);
  assert.ok(m, 'onNativeSearchQueryCleared exists');
  assert.match(m[1], /iput-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeExpectedSearch:Ljava\/lang\/String;/,
    'any expected search query is forgotten');
  assert.match(m[1], /const v0, 0x7f09024f[\s\S]*?const\/4 v0, 0x0[\s\S]*?setVisibility\(I\)V/,
    'nativeGenreScroll (0x7f09024f) becomes VISIBLE');
  assert.match(m[1], /const v0, 0x7f090239[\s\S]*?const\/16 v0, 0x8[\s\S]*?setVisibility\(I\)V/,
    'nativeRowsScroll (0x7f090239) becomes GONE');
});

test('MEL-BUG-031: live search still requires >= 2 chars and a non-empty trimmed query', () => {
  const watcher = read('smali/com/melodix/music/NativeSearchWatcher.smali');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(watcher, /const\/4 v3, 0x2[\s\S]*?postDelayed/);
  const ls = activity.match(/\.method public final performNativeLiveSearch\(Ljava\/lang\/String;\)V([\s\S]*?)\.end method/);
  assert.ok(ls);
  assert.match(ls[1], /isEmpty\(\)Z/);
});

test('MEL-BUG-031: submitting an empty query also returns to the genre grid', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const m = activity.match(/\.method public final onNativeSearchSubmit\(Landroid\/view\/View;\)V([\s\S]*?)\.end method/);
  assert.ok(m, 'onNativeSearchSubmit exists');
  assert.match(m[1], /if-eqz v2, :native_search_submit_empty/,
    'an empty submitted query branches to the clear handler');
  assert.match(m[1], /:native_search_submit_empty[\s\S]*?invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->onNativeSearchQueryCleared\(\)V/,
    'empty submit calls onNativeSearchQueryCleared (genre grid back, rows hidden)');
});
