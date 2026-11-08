const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const main = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

const method = (sig) => {
  const at = main.indexOf(sig);
  assert.ok(at >= 0, sig + ' existe');
  return main.slice(at, main.indexOf('.end method', at));
};
// Comments carry the explanation; only the instructions are asserted.
const code = (body) => body.split('\n').map((l) => l.replace(/^\s*#.*$/, '')).join('\n');

// Every device report so far: `ecran=home auth=false cookie_sp_dc=true` with
// `gates=0/0/0` and `loginN>=1`. loginN>0 proves the login surface WAS asserted;
// gates=0/0/0 with a painted home proves the refusal branches never ran. The
// reason: both gates were written with the sense inverted.
//   if-eqz v0, :gate_done   ==  "if B is FALSE, go paint"
// so an unproven session was handed the foreground, and the login surface was
// shown only when the session was ALREADY proven.

test('MEL-BUG-076a: showNativeUiFrom paints only a PROVEN session', () => {
  const gate = code(method('.method public final showNativeUiFrom('));
  assert.match(gate, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z\s*\n\s*if-nez v0, :native_show_gate_done/,
    'session non prouvee -> etiquettes de refus, jamais la peinture');
  assert.doesNotMatch(gate, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z\s*\n\s*if-eqz v0, :native_show_gate_done/,
    'if-eqz inversait la garde : la peinture etait autorisee sans preuve');
});

test('MEL-BUG-076b: activateNativeUiRoute refuses an unproven session', () => {
  const gate = code(method('.method public final activateNativeUiRoute('));
  assert.match(gate, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z\s*\n\s*if-nez v0, :native_route_activation_gate_done/,
    'meme sens que showNativeUiFrom');
  assert.doesNotMatch(gate, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z\s*\n\s*if-eqz v0, :native_route_activation_gate_done/,
    'if-eqz inversait la garde');
});

test('MEL-BUG-076c: the local shell asset keeps the foreground (CI measures it)', () => {
  // The native UI is made of the file:///android_asset page, and the UI metric
  // CI measures exactly that page. Only a REMOTE page may be refused.
  for (const sig of ['.method public final showNativeUiFrom(', '.method public final activateNativeUiRoute(']) {
    const body = code(method(sig));
    assert.match(body, /const-string v[24], "file:\/\/"/, sig + ' : exception page locale');
    assert.match(body, /startsWith\(Ljava\/lang\/String;\)Z\s*\n\s*move-result v[12]\s*\n\s*if-nez v[12], :native_(show|route)_gate_refuse/,
      sig + ' : une page locale n est pas refusee');
    // The WebView is read, never written, in the gate.
    assert.doesNotMatch(body.slice(0, body.indexOf('gate_refuse')), /iput-object/,
      sig + ' : la garde ne modifie pas la WebView');
  }
});

test('MEL-BUG-076d: no refusal path can paint the native shell', () => {
  // After the refusal label the method must leave without reaching the paint
  // code: a `return-void` must sit between the label and :native_show_gate_done.
  const show = code(method('.method public final showNativeUiFrom('));
  // Labels must be found by their DEFINITION: a plain indexOf would land on the
  // branch reference (`if-eqz v3, :native_show_gate_refuse`).
  const labelAt = (body, name) => body.search(new RegExp('^\\s*:' + name + '\\s*$', 'm'));
  const refuseAt = labelAt(show, 'native_show_gate_refuse');
  const paintAt = labelAt(show, 'native_show_gate_done');
  assert.ok(refuseAt > 0 && paintAt > refuseAt, 'les deux etiquettes existent dans cet ordre');
  const between = show.slice(refuseAt, paintAt);
  assert.match(between, /return-void/, 'le refus sort avant la peinture');
  assert.match(between, /applyLoginWebUi/, 'le refus reaffirme la surface login');

  const route = code(method('.method public final activateNativeUiRoute('));
  const routeRefuse = labelAt(route, 'native_route_gate_refuse');
  const routePaint = labelAt(route, 'native_route_activation_gate_done');
  assert.ok(routeRefuse > 0 && routePaint > routeRefuse, 'etiquettes de route presentes');
  assert.match(route.slice(routeRefuse, routePaint), /return-void/,
    'le refus de route sort avant toute activation');
});
