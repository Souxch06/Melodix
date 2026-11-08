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
const code = (body) => body.split('\n').map((l) => l.replace(/^\s*#.*$/, '')).join('\n');
const labelAt = (body, name) => body.search(new RegExp('^\\s*:' + name + '\\s*$', 'm'));

// Device journal, 9th report (test.111 or test.112 — the report itself could not
// say): `route home` is the FIRST line of every launch, before any payload, with
// gates=0/0/0. So a painter was running with no gate at all, and setNativeScreen
// was the only one left: it stores nativeCurrentScreen and renders rows
// unconditionally, and applyNativeUiData calls it from the payload path.

test('MEL-BUG-077a: setNativeScreen refuses to paint without a session proof', () => {
  const screen = code(method('.method public final setNativeScreen('));
  assert.match(screen, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z\s*\n\s*if-nez v0, :native_screen_proven/,
    'session prouvee -> peinture autorisee');
  assert.ok(labelAt(screen, 'native_screen_refuse') > 0, 'branche de refus presente');
  const refuse = labelAt(screen, 'native_screen_refuse');
  const proven = labelAt(screen, 'native_screen_proven');
  assert.ok(refuse < proven, 'le refus est atteint avant la peinture');
  const between = screen.slice(refuse, proven);
  assert.match(between, /const-string v3, "dropped-unproven"/, 'refus journalise');
  assert.match(between, /noteDiag\(/, 'le refus part dans le journal que l utilisateur copie');
  assert.match(between, /revealLoginWebUi\(\)V/, 'le refus reaffirme la surface login');
  assert.match(between, /return-void/, 'le refus sort sans rien peindre');
  // The stored route must NOT be touched by the refusal.
  assert.doesNotMatch(between, /iput-object[^\n]*nativeCurrentScreen/,
    'un refus ne change pas l ecran courant');
});

test('MEL-BUG-077b: the local shell asset still paints (CI measures it)', () => {
  const screen = code(method('.method public final setNativeScreen('));
  // MEL-BUG-079: only a REMOTE page is refused. An empty WebView (no url yet) is
  // the launch state and must paint: refusing it broke both UI-metric jobs.
  assert.match(screen, /const-string v4, "http"/, 'seule une page distante est refusee');
  assert.match(screen, /startsWith\(Ljava\/lang\/String;\)Z\s*\n\s*move-result v2\s*\n\s*if-eqz v2, :native_screen_refuse/,
    'une page non distante (vide ou locale) n est pas refusee');
});

test('MEL-BUG-077c: every painter now tests the proof, with the same sense', () => {
  // Three painters: showNativeUiFrom, activateNativeUiRoute, setNativeScreen.
  const painters = [
    ['.method public final showNativeUiFrom(', ':native_show_gate_done'],
    ['.method public final activateNativeUiRoute(', ':native_route_activation_gate_done'],
    ['.method public final setNativeScreen(', ':native_screen_proven']
  ];
  for (const [sig, done] of painters) {
    const body = code(method(sig));
    assert.match(body, new RegExp('sget-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z\\s*\\n\\s*if-nez v0, ' + done),
      sig + ' : la preuve autorise la peinture (if-nez)');
  }
});

test('MEL-BUG-077d: the diagnostic identifies the build that produced it', () => {
  // Three "still broken" reports could not be told apart from reports produced
  // by an older APK, because the text carried no identity at all.
  const diag = code(method('.method private final buildDiagnosticText()'));
  assert.match(diag, /const-string v1, " vC="/, 'le rapport porte le versionCode');
  assert.match(diag, /PackageInfo;->versionCode:I/, 'lu depuis PackageManager');
  // A failure must not cost the whole report.
  assert.match(diag, /:catch_vc[\s\S]*?const-string v1, "\?"/, 'echec -> ?, jamais de crash');
  // The version code is inserted before the auth flag, in the stable header.
  assert.ok(diag.indexOf(' vC=') < diag.indexOf('" auth="'), 'en-tete stable');
});
