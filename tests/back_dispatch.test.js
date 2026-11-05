// MEL-BUG-002 — system Back key on native screens.
//
// Established by measurement (run 42002228908): MainActivity.onKeyDown is never
// reached for BACK. fm.dispatchKeyEvent returns superDispatchKeyEvent directly,
// so the framework calls onBackPressed(), which is FINAL in androidx.activity.a
// and delegates to androidx/activity/b;->b().
//
// b() had been patched by Melodix: its default branch injects WebView JavaScript
// to close the fullscreen player, and the fallback r70.a() navigates WebView
// history. Neither knows about native screens, so Back did nothing on Settings.
//
// The fix is an ADDITIVE guard at the head of that default branch. Everything
// below it must stay byte-for-byte identical: these tests pin the protected
// payloads by hash so a future edit cannot silently alter player behaviour.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');

const root = path.join(__dirname, '..');
const read = (rel) => fs.readFileSync(path.join(root, rel), 'utf8');
const dispatcher = read('smali/androidx/activity/b.smali');
const activity = read('smali/com/melodix/music/MainActivity.smali');
const pinned = JSON.parse(read('tests/fixtures/back-dispatch-preserved.json'));

function method(source, signature) {
  const start = source.indexOf(signature);
  assert.ok(start >= 0, `${signature} must exist`);
  return source.slice(start, source.indexOf('.end method', start));
}
const sha = (s) => crypto.createHash('sha256').update(s).digest('hex');
const dispatch = method(dispatcher, '.method public final b()V');

test('the fullscreen-player JavaScript is untouched', () => {
  const js = dispatch.match(/const-string v1, ("(?:[^"\\]|\\.)*")/)[1];
  assert.equal(sha(js), pinned.fullscreen_js_sha256,
    'closing the fullscreen player is protected: this payload must not change');
  assert.equal(js.length, pinned.fullscreen_js_len);
  for (const hook of ['closeFullscreenPlayer', 'sf-fs-player', 'sf-expanded',
    'sf-show-nowplaying', 'sf-show-library']) {
    assert.ok(js.includes(hook), `${hook} must still be handled by the WebView branch`);
  }
});

test('the WebView back fallback and its result callback are untouched', () => {
  const r70 = read('smali/r70.smali');
  const aBody = r70.slice(r70.indexOf('.method public a()V'),
    r70.indexOf('.end method', r70.indexOf('.method public a()V')) + '.end method'.length);
  assert.equal(sha(aBody), pinned.r70_a_sha256,
    'r70.a() drives WebView history and finish(): protected');
  assert.equal(sha(read('smali/al0.smali')), pinned.al0_sha256,
    'al0 decides what happens when the JS closes nothing: protected');
});

test('the native guard runs BEFORE any WebView branch', () => {
  const guard = dispatch.indexOf('handleNativeSystemBack()Z');
  const js = dispatch.indexOf('evaluateJavascript');
  const fallback = dispatch.indexOf('invoke-virtual {v1}, Lr70;->a()V');
  const runnable = dispatch.indexOf('Ljava/lang/Runnable;->run()V');
  assert.ok(guard > 0, 'the guard must exist');
  assert.ok(guard < js, 'a native screen must win over the fullscreen-player JS');
  assert.ok(guard < fallback, 'and over the WebView history fallback');
  assert.ok(guard < runnable, 'and over the finish() fallback');
});

test('the guard only diverts when the handler reports it handled the key', () => {
  const at = dispatch.indexOf('handleNativeSystemBack()Z');
  const block = dispatch.slice(at, dispatch.indexOf('\n    :mel_dispatcher_continue\n', at));
  assert.match(block, /move-result v0/, 'the boolean result must be read');
  assert.match(block, /if-eqz v0, :mel_dispatcher_continue/,
    'false must fall through to the original chain, never swallow the key');
  assert.match(block, /return-void/, 'true means the native screen consumed the key');
});

test('a non-MainActivity owner is delegated, not cast blindly', () => {
  const at = dispatch.indexOf('instance-of v0, p0, Lcom/melodix/music/MainActivity;');
  assert.ok(at > 0, 'the owner type must be checked');
  const block = dispatch.slice(at, dispatch.indexOf('handleNativeSystemBack()Z'));
  assert.match(block, /if-eqz v0, :mel_dispatcher_continue/,
    'another owner must reach the original code instead of throwing ClassCastException');
});

test('the callback register survives the guard', () => {
  // v1 holds the resolved callback and is used by every original branch below.
  const start = dispatch.indexOf('iget-object p0, v1, Lr70;->e:Ljava/lang/Object;');
  const end = dispatch.indexOf('\n    :mel_dispatcher_continue\n', start);
  const block = dispatch.slice(start, end);
  assert.ok(!/(?:move-result-object|const-string|iget-object) v1,/.test(block),
    'clobbering v1 would break the fullscreen player and the fallbacks');
  assert.match(dispatch, /\.locals 4\b/, 'register budget unchanged');
});

test('the handler decides from the back arrow the shell itself shows', () => {
  const h = method(activity, '.method public final handleNativeSystemBack()Z');
  assert.match(h, /0x7f090231/, 'nativeBackButton identifies a pushed native screen');
  assert.match(h, /View;->isShown\(\)Z/, 'isShown accounts for hidden ancestors');
  assert.match(h, /onNativeBackClick\(Landroid\/view\/View;\)V/, 'reuse the internal back');
  const no = h.indexOf(':mel_sysback_not_native');
  assert.match(h.slice(no), /const\/4 v0, 0x0\n\s*return v0/,
    'no native screen must return false so the original chain runs');
});

test('the View register is never reused for another type before its use', () => {
  // Guards the P0 regression recorded as MEL-BUG-007.
  const h = method(activity, '.method public final handleNativeSystemBack()Z');
  const use = h.indexOf('invoke-virtual {v0}, Landroid/view/View;->isShown()Z');
  assert.ok(use > 0);
  assert.ok(!/const-string v0,/.test(h.slice(0, use)),
    'a string in the View register fails class verification and stops the app');
});

test('the dead onKeyDown interception was removed', () => {
  const k = method(activity, '.method public final onKeyDown(ILandroid/view/KeyEvent;)Z');
  assert.match(k, /\.locals 1\b/, 'restored to its original register budget');
  assert.ok(!/mel_back_delegate|handleNativeSystemBack/.test(k),
    'proven unreachable for BACK: keeping it would risk a second navigation path');
  assert.match(k, /const\/16 v0, 0x52/, 'the original MENU handling is intact');
});

test('the standard AndroidX callback branch is untouched', () => {
  const at = dispatch.indexOf(':pswitch_0');
  const block = dispatch.slice(at, dispatch.indexOf(':cond_4', at));
  assert.match(block, /Lz70;->y\(Z\)Z/);
  assert.match(block, /Lz70;->M\(\)Z/);
  assert.match(block, /Landroidx\/activity\/b;->b\(\)V/, 'the recursive dispatch is preserved');
  const guard = dispatch.indexOf('handleNativeSystemBack()Z');
  assert.ok(guard < at, 'the guard sits in the default branch only, not in case 0');
});

// --- the walk must actually exercise the fix -------------------------------

const walk = read('scripts/ui_qa_walk.sh');
const trace = read('scripts/ui_qa_trace.py');

test('the walk presses Back twice in separate scenarios and settles between', () => {
  assert.ok(walk.includes('capture settings-again'), 'a second Settings visit is needed');
  assert.ok(walk.includes('capture back-once'), 'the single-press result must be captured');
  assert.ok(walk.includes('capture back-settled'),
    'a delayed second navigation would only show up after settling');
  const once = walk.indexOf('capture back-once');
  const settled = walk.indexOf('capture back-settled');
  assert.ok(settled > once);
  assert.match(walk.slice(once, settled), /sleep [5-9]|sleep \d{2,}/,
    'the settle must be long enough for a stray second navigation to appear');
});

test('Back from a tab screen is recorded, not asserted as a native back', () => {
  for (const step of ['back-from-library', 'back-from-search']) {
    assert.ok(walk.includes(`capture ${step}`), `${step} must be exercised`);
    const at = trace.indexOf(`"${step}"`);
    const block = trace.slice(at, trace.indexOf('},', at));
    assert.ok(!block.includes('"forbidden"'),
      `${step} has no back arrow: asserting a native back there would be a false defect`);
    assert.match(block, /WebView chain owns this key/);
  }
});

test('the lifecycle resume is checked for stale content too', () => {
  assert.ok(walk.includes('KEYCODE_HOME'), 'the app must actually be backgrounded');
  assert.ok(walk.includes('capture background-resume'));
  const at = trace.indexOf('"background-resume"');
  const block = trace.slice(at, trace.indexOf('},', at));
  assert.match(block, /forbidden_chrome/, 'resume must not restore another screen content');
  assert.match(block, /title_is/, 'and must land on a coherent screen');
});

test('the foreground activity is recorded so an unexpected exit cannot pass', () => {
  assert.ok(walk.includes('mResumedActivity'), 'the resumed activity must be captured');
  assert.ok(walk.includes('foreground.txt'));
  const raw = read('.github/workflows/ui-qa.yml');
  assert.ok(raw.includes('foreground.txt'), 'and published as evidence');
});

test('the new back-once step cannot pass on a generic view', () => {
  const at = trace.indexOf('"back-once"');
  const block = trace.slice(at, trace.indexOf('},', at));
  assert.match(block, /forbidden/, 'the back arrow must be gone');
  assert.match(block, /title_is/, 'the title must be the expected one');
  assert.match(block, /forbidden_chrome/, 'and no foreign content may remain');
});
