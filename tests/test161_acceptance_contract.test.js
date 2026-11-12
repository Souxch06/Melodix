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
test('A retries failed dumps without accepting stale XML and handles the fresh-device permission dialog',()=>{
  const cp=require('node:child_process');
  const py=String.raw`
import ast,pathlib,subprocess,xml.etree.ElementTree as ET
src=pathlib.Path('scripts/acceptance_autonomous.py').read_text(); tree=ast.parse(src)
funcs=[f for f in tree.body if isinstance(f,ast.FunctionDef) and f.name in ('nodes','handle_permission')]
class FakeTime:
 def sleep(self, v): pass
calls=[]
def adb(*args):
 calls.append(args)
 if args[2]=='dump': return b'ERROR: could not get idle state'
 raise AssertionError('stale XML was read')
ns={'adb':adb,'subprocess':subprocess,'ET':ET,'time':FakeTime()};exec(compile(ast.Module(body=funcs,type_ignores=[]),'fixture','exec'),ns)
try: ns['nodes']()
except RuntimeError: pass
else: raise AssertionError('failed dumps accepted')
assert len(calls)==3
calls=[]
def adb2(*args):
 calls.append(args)
 if args[2]=='dump': return b'UI hierarchy dumped to: /sdcard/melodix-a.xml'
 return b'<?xml version="1.0"?><hierarchy><node package="test"/></hierarchy>'
ns['adb']=adb2
assert ns['nodes']()[0].get('package')=='test'
taps=[];ns['tap']=lambda x:taps.append(x)
allow=ET.Element('node',{'resource-id':'com.google.android.permissioncontroller:id/permission_allow_button'})
other=ET.Element('node',{'resource-id':'com.google.android.permissioncontroller:id/permission_deny_button'})
assert ns['handle_permission']([other]) is False and taps==[]
assert ns['handle_permission']([allow]) is True and taps==[allow]
`;
  const r=cp.spawnSync('python3',['-c',py],{encoding:'utf8'}); assert.equal(r.status,0,r.stderr||r.stdout);
});
test('ephemeral signing experiment cannot sign the real or preview app',()=>{
 const s=fs.readFileSync('scripts/run_ephemeral_signing_fixture.sh','utf8');
 assert.match(s,/package="com\.melodix\.ci\.ephemeralfixture"/);
 assert.match(s,/targetPackage="com\.melodix\.ci\.ephemeralfixture"/);
 assert.match(s,/rm -f "\$dir\/fixture\.jks"/); assert.match(s,/trap cleanup EXIT/);
 assert.doesNotMatch(s,/MELODIX_(?:TEST|PREVIEW)_KEYSTORE|target-apk|com\.melodix\.music\.preview\.test/);
 assert.match(s,/persisten(?:ce|t).*not tested/);
});
