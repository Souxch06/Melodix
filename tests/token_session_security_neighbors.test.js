'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const source=fs.readFileSync('tests/session_gate.test.js','utf8');
const ctx={require,__dirname:path.resolve('tests'),console};vm.createContext(ctx);
vm.runInContext(source.slice(0,source.indexOf("test('case 1:"))+'\nglobalThis.machine=machine;',ctx);

test('repeated token refusals, stale and incomplete callbacks cannot unlock or establish expiry',()=>{
 const m=ctx.machine();
 for(const payload of [{attempt:1},{attempt:1},{attempt:2,completed:false},{attempt:3},{generation:0,attempt:4}]){
  m.send({...payload,token:false,tokenRefused:true,libraryHttp:0});
  assert.notEqual(m.fields.state,3);assert.notEqual(m.fields.state,2);
  assert.equal(m.fields.expiredEvidence,0);assert.equal(m.evidence.fields.count,0);
  assert.ok(!m.calls.includes('showNativeUi'));assert.ok(!m.calls.includes('login'));
 }
 assert.equal(m.fields.lastAttempt,3);
});

test('unproven states do not authenticate; real library 200 and token are both required',()=>{
 for(const payload of [
  {token:false,libraryOk:true,libraryHttp:200},
  {token:true,libraryOk:false,libraryHttp:401},
  {token:true,libraryOk:false,libraryHttp:403},
  {token:true,libraryOk:true,libraryHttp:0},
 ]){
  const m=ctx.machine();m.send(payload);assert.notEqual(m.fields.state,3);
  assert.ok(!m.calls.includes('showNativeUi'));assert.equal(m.fields.expiredEvidence,0);
 }
 const valid=ctx.machine();valid.send({token:true,libraryOk:true,libraryHttp:200});
 assert.equal(valid.fields.state,3);assert.ok(valid.calls.includes('showNativeUi'));
});

test('explicit reconnect remains guarded, confirmed and unavailable during active login',()=>{
 const gate=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8');
 const reconnect=fs.readFileSync('smali/com/melodix/music/NativeSessionReconnect.smali','utf8');
 const action=fs.readFileSync('smali/com/melodix/music/NativeSessionSurfaceAction.smali','utf8');
 const recovery=fs.readFileSync('smali/com/melodix/music/NativeSessionRecovery.smali','utf8');
 const allowed=reconnect.slice(reconnect.indexOf('.method public static allowed()Z'),reconnect.indexOf('.end method',reconnect.indexOf('.method public static allowed()Z')));
 assert.match(allowed,/loginActive:Z[\s\S]*?if-nez v0, :no/);
 assert.match(reconnect,/allowed\(\)Z[\s\S]*?if-eqz v0, :done[\s\S]*?deleteAllData[\s\S]*?removeAllCookies/);
 assert.match(action,/Effacer et se reconnecter/);
 assert.match(action,/DialogInterface;I\)V[\s\S]*?if-ne p2, v0, :done[\s\S]*?generation:I[\s\S]*?if-ne v0, v1, :done[\s\S]*?NativeSessionReconnect;->start/);
 assert.doesNotMatch(recovery,/removeAllCookies|deleteAllData/);
 assert.doesNotMatch(gate,/removeAllCookies|deleteAllData/);
});

test('new timing grammar rejects malformed missing-token claims and private text',()=>{
 const p=require('node:child_process').spawnSync('python3',['-c',String.raw`
import sys
sys.path.insert(0,'scripts')
from startup_timing_journal import allowed_entry
prefix='sid=1234abcd t=1 '
good='library-fetch phase=request http=0 mime=missing duration=3 error=token-missing auth=webview-session refresh=unsupported'
assert allowed_entry(prefix+good)
assert not allowed_entry(prefix+good.replace('http=0','http=401'))
assert not allowed_entry(prefix+good.replace('phase=request','phase=response'))
assert not allowed_entry(prefix+good+' secret=fixture')
for reason in ('token-unavailable','library-http-401','library-http-403'):
 assert allowed_entry(prefix+'session-state from=verifying state=error reason='+reason)
`],{encoding:'utf8'});
 assert.equal(p.status,0,p.stderr);
});

test('request changes are limited to the reviewed fail-closed guard and diagnostic enum',()=>{
 const cp=require('node:child_process');
 const old=cp.execFileSync('git',['show','9e55740c:scripts/spotify_bridge.source.js'],{encoding:'utf8'});
 let now=require('./helpers/token_expiry_normalize')(fs.readFileSync('scripts/spotify_bridge.source.js','utf8'));
 now=require('./helpers/token_page_expiry_normalize')(now);
 const start=now.indexOf('        // Never turn a failed token request');
 const end=now.indexOf('        while (hasMore',start);
 assert.ok(start>0 && end>start);
 const guard=now.slice(start,end);
 assert.match(guard,/if \(!bearerToken\)/);assert.match(guard,/return \[\]/);
 assert.doesNotMatch(guard,/fetch\(|CookieManager|removeAllCookies|deleteAllData/);
 now=now.slice(0,start)+now.slice(end);
 now=now.replace("'none', 'empty', 'token-missing', 'http-401'", "'none', 'empty', 'http-401'");
 now=now.replace("        if (value === 'token-missing') return 'token-missing';\n",'');
 assert.equal(now,old,'all other fetch, endpoints, parameters, proof publication and telemetry remain byte-identical');
 const before=cp.execFileSync('git',['show','9e55740c:smali/com/melodix/music/NativeSessionGate.smali'],{encoding:'utf8'});
 const after=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8');
 const cut=s=>[s.slice(0,s.indexOf('    :not_valid\n',s.indexOf('.method public static result('))),s.slice(s.indexOf('    :failed\n',s.indexOf('    :not_valid\n',s.indexOf('.method public static result('))))];
 assert.deepEqual(cut(after),cut(before),'outside the refusal classification, gate instructions stay byte-identical');
});
