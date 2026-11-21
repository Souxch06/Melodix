// Regression guard for a defect demonstrated on the QA captures of run
// 41986397958, on both phone and tablet:
//
//   * `settings` and `back-from-settings` produced byte-identical screenshots;
//   * after tapping Home, the header and tab said "Accueil" but the content
//     still showed the Settings row "Paramètres indisponibles".
//
// Cause: renderNativeRows() empties the shared content container, but the Home
// attachment flags were only reset by beginNativeHomeRender(), which is reached
// exclusively from the Home renderer. Rendering another screen therefore left
// nativeHomeStatusAttached true, so returning Home believed its status card was
// still attached and never rebuilt it.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
const renderer = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeHomeShelfRenderer.smali'), 'utf8');

function method(source, signature) {
  const start = source.indexOf(signature);
  assert.ok(start >= 0, `${signature} must exist`);
  const end = source.indexOf('.end method', start);
  return source.slice(start, end);
}

// A label name also appears inside the branch that targets it, so indexOf
// would land on the first jump rather than on the label definition.
function labelAt(body, label) {
  const at = body.indexOf(`\n    :${label}\n`);
  assert.ok(at >= 0, `label :${label} must be defined`);
  return at;
}

const renderRows = method(activity,
  '.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');

test('emptying the shared container restores the Home attachment invariant', () => {
  const cleared = renderRows.indexOf('removeAllViews()V');
  const reset = renderRows.indexOf('beginNativeHomeRender()V');
  assert.ok(cleared >= 0, 'renderNativeRows empties the shared container');
  assert.ok(reset > cleared,
    'the Home attachment state must be reset AFTER the container is emptied');
});

test('the reset happens on the non-Home branch, before any row is built', () => {
  const branch = renderRows.indexOf(':native_rows_list');
  const reset = renderRows.indexOf('beginNativeHomeRender()V');
  const tryStart = renderRows.indexOf(':try_start_native_rows');
  assert.ok(branch >= 0 && reset > branch,
    'the non-Home branch is the one that used to skip the reset');
  assert.ok(reset < tryStart, 'reset before building rows, outside the try block');
});

test('the fix reuses the existing reset method and adds no new state', () => {
  const reset = method(activity, '.method public final beginNativeHomeRender()V');
  for (const flag of ['nativeHomeCardsAttached', 'nativeHomeStatusAttached',
    'nativeHomeContentReady', 'nativeHomeStatusView', 'nativeHomeFirstCard']) {
    assert.ok(reset.includes(flag), `${flag} must be cleared by the shared reset`);
  }
  // The Home renderer must keep calling it too: both paths restore the invariant.
  assert.match(renderer, /beginNativeHomeRender\(\)V/);
});

test('register budget is untouched', () => {
  // Adding a register would renumber pN above v15 and silently corrupt params.
  assert.match(renderRows, /\.locals 10\b/);
  const reset = renderRows.slice(renderRows.indexOf('beginNativeHomeRender') - 120,
    renderRows.indexOf('beginNativeHomeRender'));
  assert.ok(!/const\/4 v\d+, 0x0/.test(reset),
    'the invoke needs no scratch register, so none should be introduced');
});

test('the trace can actually detect this class of defect', () => {
  const trace = fs.readFileSync(path.join(root, 'scripts', 'ui_qa_trace.py'), 'utf8');
  assert.match(trace, /forbidden_chrome/, 'stale content from another screen must be detectable');
  assert.match(trace, /wrong_screen/, 'and must produce a distinct failing verdict');
  const homeAgain = trace.slice(trace.indexOf('"home-again"'), trace.indexOf('"player"'));
  assert.ok(homeAgain.includes('nativeBackButton'),
    'the tab bar alone cannot discriminate: it is visible on every screen');
});

// --- MEL-BUG-003: a route change left foreign content on screen -------------
// Root cause: onNativeBackClick re-renders, a plain route change did not. The
// fix belongs to the ROUTE CHANGE, not to the Home refresh handler: an existing
// test forbids the Home handler from ever blanking a real shelf, and that guard
// is correct. Placing the cleanup in setNativeScreen respects it and also covers
// every other path that switches to Home.

const setScreen = method(activity, '.method public final setNativeScreen(Ljava/lang/String;)V');

test('a genuine route change to Home replaces the foreign rows', () => {
  const at = labelAt(setScreen, 'mel_route_home_clean_done');
  const block = setScreen.slice(setScreen.indexOf('iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen'), at);
  assert.match(block, /renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'switching to Home must actually re-render, not only request data');
});

test('the cleanup is guarded by the route-change flag, not run on every Home entry', () => {
  const at = labelAt(setScreen, 'mel_route_home_clean_done');
  const start = setScreen.indexOf('iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen');
  const block = setScreen.slice(start, at);
  assert.match(block, /if-eqz v0, :mel_route_home_clean_done/,
    'v0 is the changed flag: a repeated Home route must not blank a real shelf');
  assert.match(block, /const-string v2, "home"[\s\S]*?if-eqz v2, :mel_route_home_clean_done/,
    'only the Home route is cleaned here');
});

test('the Home refresh handler is still untouched, as its own guard requires', () => {
  const homeClick = method(activity, '.method public final onNativeHomeClick(Landroid/view/View;)V');
  assert.match(homeClick, /__sfNativeRequestHome/);
  assert.ok(!/renderNativeRows|nativeCurrentScreen/.test(homeClick),
    'the Home refresh must keep reusing the existing shelf');
  assert.match(homeClick, /\.locals 2\b/, 'unchanged from the original');
});

test('the renderer cannot recurse back into the route setter', () => {
  assert.ok(!/setNativeScreen/.test(renderer),
    'renderNativeRows -> render -> setNativeScreen would loop forever');
});
