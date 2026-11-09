const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');
const src = read('smali/com/melodix/music/NativeStateView.smali');
const methodBody = (name) => {
  const at = src.indexOf(`.method public static ${name}(`) >= 0
    ? src.indexOf(`.method public static ${name}(`)
    : src.indexOf(`.method private static ${name}(`);
  assert.ok(at > 0, `${name} must exist`);
  return src.slice(at, src.indexOf('.end method', at));
};
const linesOf = (body) => body.split('\n').map((l) => l.split('#')[0].trim()).filter(Boolean);

// A tiny interpreter: enough to follow the const/branch dispatch these methods
// use. Grepping for strings would not catch an inverted branch, which is exactly
// the bug family this chantier keeps hitting.
function interpret(body, { params = {}, calls = {} } = {}) {
  const lines = linesOf(body);
  const v = { ...params };
  let last = null;
  for (let i = 0; i < lines.length; i += 1) {
    const l = lines[i];
    let m = /^const(?:\/4|\/16)? (v\d+|p\d+), (0x[0-9a-f]+|-?\d+)$/.exec(l);
    if (m) { v[m[1]] = parseInt(m[2], m[2].startsWith('0x') || m[2].startsWith('-0x') ? 16 : 10); continue; }
    m = /^const-string (v\d+|p\d+), "(.*)"$/.exec(l);
    if (m) { v[m[1]] = m[2]; continue; }
    m = /^invoke-virtual \{(v\d+|p\d+), (v\d+|p\d+)\}, Ljava\/lang\/String;->equals/.exec(l);
    if (m) { last = v[m[1]] === v[m[2]] ? 1 : 0; continue; }
    m = /^invoke-virtual \{(v\d+|p\d+)\}, Lcom\/melodix\/music\/MainActivity;->(\w+)\(\)Z$/.exec(l);
    if (m) { last = calls[m[2]] ? 1 : 0; continue; }
    m = /^invoke-virtual \{(v\d+|p\d+)\}, Ljava\/lang\/String;->isEmpty/.exec(l);
    if (m) { last = v[m[1]] === '' ? 1 : 0; continue; }
    m = /^move-result (v\d+|p\d+)$/.exec(l);
    if (m) { v[m[1]] = last; continue; }
    m = /^if-(eqz|nez) (v\d+|p\d+), (:\S+)$/.exec(l);
    if (m) {
      const taken = m[1] === 'eqz' ? v[m[2]] === 0 : v[m[2]] !== 0;
      if (taken) i = lines.indexOf(m[3]);
      continue;
    }
    m = /^if-(eq|ne) (v\d+|p\d+), (v\d+|p\d+), (:\S+)$/.exec(l);
    if (m) {
      const taken = m[1] === 'eq' ? v[m[2]] === v[m[3]] : v[m[2]] !== v[m[3]];
      if (taken) i = lines.indexOf(m[4]);
      continue;
    }
    m = /^goto (:\S+)$/.exec(l);
    if (m) { i = lines.indexOf(m[1]); continue; }
    m = /^invoke-static \{([^}]*)\}, Lcom\/melodix\/music\/NativeStateView;->create/.exec(l);
    if (m) {
      const a = m[1].split(',').map((x) => x.trim());
      return { title: v[a[1]], subtitle: v[a[2]], icon: v[a[3]], action: v[a[4]] };
    }
    m = /^return-object (v\d+|p\d+)$/.exec(l);
    if (m) return { returned: v[m[1]] };
  }
  throw new Error('interpretation reached no return');
}

const KINDS = ['loading', 'slow', 'no_results', 'lib_empty', 'network', 'session',
  'denied', 'unavailable', 'prompt', 'set_error', 'lib_error'];

test('every state kind has its own icon, title and description', () => {
  const body = methodBody('forKind');
  const seen = KINDS.map((_, i) => interpret(body, { params: { p1: i } }));
  for (const [i, k] of seen.entries()) {
    assert.ok(k.title && k.title.length > 0, `${KINDS[i]} needs a title`);
    assert.ok(k.subtitle && k.subtitle.length > 0, `${KINDS[i]} needs a description`);
    assert.ok(k.icon && k.icon.startsWith('native_'), `${KINDS[i]} needs an icon`);
    assert.ok(fs.existsSync(path.join(root, `res/drawable/${k.icon}.xml`)), `${k.icon} must exist`);
  }
  assert.equal(new Set(seen.map((k) => k.title)).size, KINDS.length, 'no two states share a title');
});

test('a session problem, a network failure and an empty library never look alike', () => {
  const body = methodBody('forKind');
  const get = (name) => interpret(body, { params: { p1: KINDS.indexOf(name) } });
  const [session, network, empty, denied] = ['session', 'network', 'lib_empty', 'denied'].map(get);
  assert.equal(new Set([session.icon, network.icon, empty.icon, denied.icon]).size, 4,
    'four distinct icons, so the user can tell the causes apart');
  assert.match(session.subtitle, /Reconnectez/, 'a session problem asks to reconnect');
  assert.match(network.subtitle, /réseau/, 'a network problem talks about the network');
  assert.doesNotMatch(network.subtitle, /Reconnectez|session/, 'a network failure is not a sign-out');
  assert.doesNotMatch(empty.subtitle, /erreur|réseau|session|Refusé/i, 'an empty library is not an error');
  assert.equal(empty.action, '', 'an empty library offers no reconnect');
});

test('only actions with a real dispatcher get a button', () => {
  const body = methodBody('forKind');
  const allowed = {
    session: 'melodix:action:open-login',
    set_error: 'melodix:action:retry-settings',
    lib_error: 'melodix:action:retry-library',
  };
  for (const name of KINDS) {
    const k = interpret(body, { params: { p1: KINDS.indexOf(name) } });
    assert.equal(k.action, allowed[name] || '', `${name} must not invent an action`);
  }
  // Every offered URI must be handled by the existing native dispatcher.
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const at = activity.indexOf('.method public final openNativeRow(');
  const dispatcher = activity.slice(at, activity.indexOf('.end method', at));
  for (const uri of Object.values(allowed)) assert.ok(dispatcher.includes(`"${uri}"`), `${uri} must be dispatched`);
  // Each real URI must yield its own label, and an unknown URI no label at all.
  const labelOf = (uri) => interpret(methodBody('actionLabel'), { params: { p0: uri } }).returned;
  assert.equal(labelOf('melodix:action:open-login'), 'Se connecter');
  assert.equal(labelOf('melodix:action:open-settings'), 'Réglages');
  assert.equal(labelOf('melodix:action:retry-settings'), 'Réessayer');
  assert.equal(labelOf('melodix:action:retry-library'), 'Réessayer');
  assert.equal(labelOf('melodix:action:whatever'), 0, 'an unknown action gets no button');
  assert.equal(labelOf(''), 0, 'an empty action gets no button');
});

test('the surface mapping keeps the real message and never calls a session problem a load', () => {
  const body = methodBody('forSurfaceMessage');
  const run = (message, unproven) => interpret(body, {
    params: { p1: message }, calls: { isNativeSessionUnproven: unproven },
  });
  const loading = 'Chargement de votre bibliothèque…';
  const plain = run(loading, false);
  assert.equal(plain.title, loading, 'the real message stays the title');
  assert.equal(plain.icon, 'native_state_loading');
  assert.equal(plain.action, '');
  const unproven = run(loading, true);
  assert.equal(unproven.icon, 'native_state_session', 'an unproven session is not a slow load');
  assert.equal(unproven.action, 'melodix:action:open-login', 'and it offers the real login');
  const prompt = run('Recherchez un artiste, un titre, un album ou une playlist ci-dessus', false);
  assert.equal(prompt.icon, 'native_nav_search');
  const other = run('Votre bibliothèque est vide', false);
  assert.equal(other.icon, 'native_nav_library');
  assert.ok(other.subtitle.length > 0);
  for (const m of ['Chargement de la playlist…', 'Chargement de votre musique…']) {
    assert.equal(run(m, false).icon, 'native_state_loading', `${m} is a loading message`);
  }
});

test('the state system is really wired into the screen, and reuses the real listener', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /NativeStateView;->forSurfaceMessage/, 'the empty-row path must use the state system');
  assert.doesNotMatch(activity, /NativeEmptyState;->forMessage/, 'the superseded entry point is gone');
  assert.match(activity, /\.method public final isNativeSessionUnproven\(\)Z/, 'read-only accessor exists');
  const accessor = activity.slice(activity.indexOf('.method public final isNativeSessionUnproven()Z'));
  const accBody = accessor.slice(0, accessor.indexOf('.end method'));
  assert.match(accBody, /iget-boolean/, 'it only reads');
  assert.doesNotMatch(accBody, /iput|invoke/, 'it must not mutate or trigger anything');
  assert.match(src, /NativeRowClickListener;-><init>/, 'reuses the existing action dispatcher');
  assert.match(src, /"MelState"/, 'a swallowed failure leaves a trace');
  assert.doesNotMatch(src, /openSpotifyLogin|runNativeJavascript|openNativeRow/, 'never bypasses the dispatcher');
});

test('MEL-BUG-024: isNativeSessionUnproven reads a PERSISTENT flag that survives screen changes', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  // The persistent field exists exactly once.
  assert.equal((activity.match(/\.field public nativeSessionUnproven:Z/g) || []).length, 1);
  // The accessor reads the persistent flag, not the home-scoped one.
  const at = activity.indexOf('.method public final isNativeSessionUnproven()Z');
  const acc = activity.slice(at, activity.indexOf('.end method', at));
  assert.match(acc, /iget-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeSessionUnproven:Z/);
  assert.doesNotMatch(acc, /nativeHomeSessionUnprovenStatusAttached/);
  // Writers: unproven status attached -> true, real cards attached -> false, login -> true.
  const card = activity.slice(activity.indexOf('.method public final noteNativeHomeCardAttached'),
    activity.indexOf('.end method', activity.indexOf('.method public final noteNativeHomeCardAttached')));
  assert.match(card, /const\/4 v0, 0x0\s+iput-boolean v0, p0, .*->nativeSessionUnproven:Z/);
  const unproven = activity.slice(activity.indexOf('.method public final noteNativeHomeSessionUnprovenStatusAttached'),
    activity.indexOf('.end method', activity.indexOf('.method public final noteNativeHomeSessionUnprovenStatusAttached')));
  assert.match(unproven, /iput-boolean v0, p0, .*->nativeSessionUnproven:Z/);
  const login = activity.slice(activity.indexOf('.method public final openSpotifyLogin'),
    activity.indexOf('.end method', activity.indexOf('.method public final openSpotifyLogin')));
  assert.match(login, /NativeSessionGate;->requestLogin/);
  const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
  assert.match(gate, /const\/4 v1, 0x1\s+iput-boolean v1, p0, .*->nativeSessionUnproven:Z/);
  // Screen changes and home re-renders must NOT reset the persistent flag.
  for (const m of ['beginNativeHomeRender', 'setNativeScreen']) {
    const i = activity.indexOf(`.method public final ${m}(`);
    assert.ok(i >= 0, m);
    const body = activity.slice(i, activity.indexOf('.end method', i));
    assert.doesNotMatch(body.replace(/nativeHomeSessionUnprovenStatusAttached:Z/g, ''), /nativeSessionUnproven:Z/,
      `${m} must leave the persistent session flag alone`);
  }
  // The library/detail empty path still funnels through forSurfaceMessage, which
  // maps an unproven session to the real login action instead of eternal loading.
  const sv = read('smali/com/melodix/music/NativeStateView.smali');
  const fsm = sv.slice(sv.indexOf('.method public static forSurfaceMessage'), sv.indexOf('.end method', sv.indexOf('.method public static forSurfaceMessage')));
  assert.match(fsm, /isNativeSessionUnproven\(\)Z/);
  assert.match(fsm, /native_state_session/);
  assert.match(fsm, /melodix:action:open-login/);
});
