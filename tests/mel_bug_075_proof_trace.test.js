const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' existe');
  return src.slice(at, src.indexOf('.end method', at));
};

const bridge = read('smali/com/melodix/music/AndBridge.smali');
const webClient = read('smali/c91.smali');
const main = read('smali/com/melodix/music/MainActivity.smali');

// The device report that drove MEL-BUG-075:
//   ecran=home auth=false cookie_sp_dc=true gates=0/0/0 loginN=1 root=1
//   journal=ensure warm proof | route home | data native-payload ...
// `ensure warm proof` only runs when AppSingleton.B is TRUE, and B was FALSE at
// copy time (auth=false). So the proof flipped between the two. Grepping the
// DEX shows B = true has exactly ONE writer — AndBridge.loginDetected() — and
// that writer could only be reached from the injected player-CTA probe.

test('MEL-BUG-075a: the single writer of the session proof journals every flip', () => {
  const login = method(bridge, '.method public final loginDetected()V');
  // The journal line must come BEFORE the flag is set, otherwise a crash between
  // the two would leave an unexplained proof again.
  const journalAt = login.indexOf('const-string v1, "bridge-login"');
  const setAt = login.indexOf('sput-boolean p0, Lcom/melodix/music/AppSingleton;->B:Z');
  assert.ok(journalAt > 0, 'le flip de preuve est journalise');
  assert.ok(setAt > journalAt, 'le journal precede l ecriture du drapeau');
  assert.match(login, /noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'le flip part dans le journal que l utilisateur copie');
});

test('MEL-BUG-075b: the proof is only asserted from a POSITIVE auth signal', () => {
  // The probe used to call loginDetected() as soon as the public "open the web
  // player" CTA was on screen — a control that also exists on logged-out pages.
  // Anchored on the line itself: the probe is one very long smali string, and
  // the surrounding `.line` comments shift whenever the method is edited.
  const line = webClient.split('\n').find((l) => l.includes('__sfPlayerCtaObserved') && l.includes('loginDetected'));
  const script = line || '';
  assert.ok(script, 'le probe injecte existe toujours');
  assert.match(script, /user-widget-link/, 'un marqueur de compte connecte est exige');
  assert.match(script, /if\(s!=='connected'\)return;/, 'sans signal positif, aucune preuve');
  // loginDetected() must be reached only AFTER that guard.
  const guard = script.indexOf("if(s!=='connected')return;");
  const call = script.indexOf('AndBridge.loginDetected()');
  assert.ok(call > guard, 'loginDetected est garde par le signal positif');
  // And the observed state is reported either way, so a false proof names itself.
  assert.ok(script.indexOf('AndBridge.authUiSignal(s)') < guard,
    'l etat observe est journalise meme quand il n y a pas de preuve');
});

test('MEL-BUG-075c: the observed auth state is journaled with fixed words only', () => {
  const signal = method(bridge, '.method public final authUiSignal(Ljava/lang/String;)V');
  assert.match(signal, /\.annotation runtime Landroid\/webkit\/JavascriptInterface;/);
  // Whitelist: exactly the three allowed states.
  assert.match(signal, /const-string v1, "connected"/);
  assert.match(signal, /const-string v1, "required"/);
  assert.match(signal, /const-string v1, "unknown"/);
  assert.match(signal, /const-string v2, "auth-ui"/);
  // Reporting must never change the proof: no writer here.
  assert.doesNotMatch(signal, /sput-boolean[^\n]*AppSingleton;->B:Z/,
    'observer: aucun effet de bord sur la preuve');
  // Security contract: no page text, URL or cookie value is journaled.
  assert.doesNotMatch(signal, /getCookie|CookieManager|getUrl|https?:\/\//,
    'aucune URL ni valeur de cookie dans le journal');
});

test('MEL-BUG-075d: a refused gate clears the stale persisted marker', () => {
  for (const sig of ['.method public final showNativeUiFrom(', '.method public final activateNativeUiRoute(']) {
    const body = method(main, sig);
    const gate = sig.includes('showNative') ? 'diagShowDropped:I' : 'diagRouteDropped:I';
    const at = body.indexOf(gate);
    assert.ok(at > 0, gate + ' compte le refus');
    const tail = body.slice(at);
    assert.match(tail, /const-string v4, "LoggedIn"[\s\S]*?putBoolean\(Ljava\/lang\/String;Z\)/,
      'le marqueur persistant perime est efface apres un refus');
    assert.match(tail, /invoke-interface \{v2\}, Landroid\/content\/SharedPreferences\$Editor;->apply\(\)V/);
  }
});

test('MEL-BUG-075e: the proof writer set is documented and still single', () => {
  // If another B = true writer appears, the trace above no longer covers every
  // flip, and this test is the alarm.
  const all = ['smali/com/melodix/music/AndBridge.smali', 'smali/com/melodix/music/AppSingleton.smali',
    'smali/com/melodix/music/MainActivity.smali', 'smali/c91.smali', 'smali/y51.smali'];
  let trueWriters = 0;
  for (const rel of all) {
    const src = read(rel);
    const lines = src.split('\n');
    for (let i = 0; i < lines.length; i++) {
      if (!/sput-boolean .*, Lcom\/melodix\/music\/AppSingleton;->B:Z/.test(lines[i])) continue;
      // Walk back to the nearest constant/definition of the stored register.
      const reg = (lines[i].match(/sput-boolean ([^,]+),/) || [])[1];
      let value = null;
      for (let j = i - 1; j >= Math.max(0, i - 40); j--) {
        const c = lines[j].match(new RegExp('const/(?:4|16) ' + reg + ', (0x[0-9a-f]+)'));
        if (c) { value = c[1]; break; }
      }
      if (value === '0x1') trueWriters += 1;
    }
  }
  assert.equal(trueWriters, 1, 'un seul ecrivain de B = true, et il est journalise');
});
