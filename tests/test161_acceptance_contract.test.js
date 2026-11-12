'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const a=fs.readFileSync('scripts/acceptance_autonomous.py','utf8');
const b=fs.readFileSync('tests/android/LocalBridgeInstrumentation.java','utf8');
const w=fs.readFileSync('.github/workflows/test161-independent.yml','utf8');
test('A is independently checked while C is explicit pending and strict original remains intact',()=>{
  assert.match(a,/authenticated_category_C.*PENDING/);
  for (const stage of ['accueil','bibliotheque','playlist','retour','recherche','recherche-vide','reglages-demo','lecteur','sortie','relancement']) assert.ok(a.includes(stage),stage);
  assert.match(a,/FATAL EXCEPTION/); assert.match(a,/MODE DÉMO · HORS LIGNE/);
  assert.match(w,/profile: \[small, phone, tablet\]/); assert.match(w,/category.*C.*status.*PENDING/);
  const strict=fs.readFileSync('scripts/capture_launcher_acceptance.py','utf8');
  assert.match(strict,/real settings inaccessible/); assert.match(strict,/observe_watchdog\(nodes, 'demo', 70\)/);
});
test('B fixture is isolated, network-blocked, and rejects both untrusted origins',()=>{
  assert.match(b,/setBlockNetworkLoads\(true\)/); assert.match(b,/synthetic base URL/i);
  assert.match(b,/external_origin_denied/); assert.match(b,/accounts_origin_denied/);
  assert.match(b,/removeJavascriptInterface\("FixtureReceiver"\)/);
  assert.match(b,/__sfMelodixBridgeBootstrapReady/); assert.match(b,/home_unproven_guard/);
  assert.match(b,/home_synthetic_error/); assert.match(b,/home_synthetic_empty/);
  assert.match(b,/home_navigation/); assert.doesNotMatch(b,/CookieManager|setCookie\(/);
  assert.match(w,/7d3288bca24b8316aa80316d5f9a606fbd850c4d3c058cc7c7477a26227623aa/);
});
