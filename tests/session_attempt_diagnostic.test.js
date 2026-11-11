'use strict';
const {test}=require('node:test');const assert=require('node:assert/strict');const fs=require('node:fs');const vm=require('node:vm');const cp=require('node:child_process');
const src=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
const baseline=f=>cp.execFileSync('git',['show','70429cb8:'+f],{encoding:'utf8'});
function fn(source,name){const a=source.indexOf('    function '+name+'(');assert.ok(a>=0);return source.slice(a,source.indexOf('\n    }',a)+6);}
function harness(){const sent=[];const c={window:{AndBridge:{onSessionAttemptDiagnostic:s=>sent.push(JSON.parse(s))}},boundedMediaLibraryCount:(n,max)=>Math.max(0,Math.min(max,Number(n)||0)),safeMediaLibraryCheckSource:v=>['shell-update','native-retry','web-home-retry'].includes(v)?v:'unspecified'};
 vm.createContext(c);vm.runInContext(fn(src,'reportSessionDiagnosticFailure')+'\n'+fn(src,'publishSessionAttemptDiagnostic')+'\n'+fn(src,'observeSessionAttempt'),c);return {c,sent};}
test('diagnostic starts incomplete and unknown, then retains observations for the correct attempt',()=>{
 const {c,sent}=harness();const d={nativeGeneration:4,attempt:1,source:'shell-update',sessionObservation:{tokenResult:'not-attempted'}};
 c.publishSessionAttemptDiagnostic(d,false);assert.equal(sent[0].completed,false);assert.equal(sent[0].apiHttp,null);assert.equal(sent[0].libraryHttp,null);
 c.observeSessionAttempt(d,'apiHttp',400);c.observeSessionAttempt(d,'fallbackHttp',403);c.observeSessionAttempt(d,'libraryHttp',401);c.observeSessionAttempt(d,'tokenResult','refused');c.publishSessionAttemptDiagnostic(d,true);
 assert.deepEqual(sent.at(-1),{generation:4,attempt:1,source:'shell-update',apiHttp:400,fallbackHttp:403,libraryHttp:401,completed:true,tokenResult:'refused',reason:''});
 const next={nativeGeneration:5,attempt:2,source:'native-retry',sessionObservation:{tokenResult:'unknown'}};c.publishSessionAttemptDiagnostic(next,false);
 assert.equal(sent.at(-1).apiHttp,null,'never reuse global status from preceding attempt');assert.equal(sent.at(-1).tokenResult,'unknown');
});
test('diagnostic payload is closed and sanitizes unknown/malformed metadata without credential access',()=>{
 const {c,sent}=harness();c.publishSessionAttemptDiagnostic({nativeGeneration:1,attempt:2,source:'https://private',sessionObservation:{apiHttp:-1,fallbackHttp:999,libraryHttp:'401',tokenResult:'Bearer SECRET',cookie:'PRIVATE',accessToken:'SECRET'}},false);
 assert.equal(sent[0].source,'unspecified');assert.equal(sent[0].tokenResult,'unknown');assert.equal(sent[0].apiHttp,null);assert.equal(sent[0].libraryHttp,null);assert.doesNotMatch(JSON.stringify(sent),/SECRET|PRIVATE|private/);
 assert.doesNotMatch(fn(src,'publishSessionAttemptDiagnostic'),/document\.cookie|onSessionVerification|fetch\(/);
});
test('a broken native diagnostic consumer cannot affect requests or auth results',()=>{
 const {c}=harness();c.window.AndBridge.onSessionAttemptDiagnostic=()=>{throw Error('consumer');};assert.doesNotThrow(()=>c.publishSessionAttemptDiagnostic({sessionObservation:{}},true));
});
test('proof publication and unrelated gates remain unchanged from Preview125',()=>{
 const gate=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8'),old=baseline('smali/com/melodix/music/NativeSessionGate.smali');
 for(const name of ['canReconnect','begin','requestLogin']){const extract=s=>{const a=s.indexOf('.method public static '+name+'(');return s.slice(a,s.indexOf('.end method',a)).replace(/    invoke-static \{\}, Lcom\/melodix\/music\/NativeSessionVerificationFlight;->start\(\)V\n/g,'').replace(/if-ne v1, v2, :rejected_generation/g,'if-ne v1, v2, :done').replace(/if-le v1, v2, :rejected_attempt/g,'if-le v1, v2, :done').replace(/    goto :done\n    :rejected_generation[\s\S]*?(?=    :done\n    :try_end)/,'');};assert.equal(extract(gate),extract(old),name);}
 assert.equal(fn(src,'publishSessionVerification'),fn(baseline('scripts/spotify_bridge.source.js'),'publishSessionVerification'));
 const evidence=fs.readFileSync('smali/com/melodix/music/NativeSessionEvidence.smali','utf8');
 assert.match(evidence,/canClear\(\)Z[\s\S]*?const\/4 v1, 0x1[\s\S]*?->current\(\)Ljava\/lang\/String;[\s\S]*?->equals/);
 assert.equal(fs.readFileSync('smali/com/melodix/music/NativeSessionGateTask.smali','utf8').replace('    invoke-static {v1}, Lcom/melodix/music/NativeSessionVerificationFlight;->finish(Ljava/lang/String;)V\n',''),baseline('smali/com/melodix/music/NativeSessionGateTask.smali').replace('NativeSessionEvidence;->reset()V','NativeSessionEvidence;->retainIfCurrent()Z'));
});
test('native channel only records, closes values, bounds history and exports aliases rather than digests',()=>{
 const s=fs.readFileSync('smali/com/melodix/music/NativeSessionAttemptDiagnostic.smali','utf8');
 assert.match(s,/const\/16 v2, 0x10/);assert.match(s,/Iterator;->remove/);assert.match(s,/or-int\/2addr/);assert.match(s,/const-string v2, "c"/);
 assert.match(s,/const-string v0, "inconnu"/);assert.doesNotMatch(s,/->transition|->verify\(|loadUrl|removeAllCookies|NativeSessionEvidence|SharedPreferences|FileOutputStream|Log;/);
 const render=s.slice(s.indexOf('.method public static record('));assert.doesNotMatch(render,/->current\(/);assert.match(s,/->alias\(/);
});
function tokenHarness(responses,cache){const {c,sent}=harness();const a=src.indexOf('    async function fetchWebPlayerToken('),b=src.indexOf('    function dropWebPlayerToken',a);c.responses=responses;c.requests=[];c.webPlayerTokenCache=cache||null;c.mediaLibraryNow=()=>100;c.traceTokenEndpoint=()=>{};c.traceLibraryEvent=()=>{};c.safeTokenFetchStatus=v=>v;c.oriFetch=async(url,init)=>{c.requests.push({url,init});const response=c.responses.shift();if(response instanceof Error)throw response;return response;};
 vm.runInContext('let lastTokenFetchStatus="none",tokenApiHttp=0,tokenFallbackHttp=0;\n'+src.slice(a,b),c);return {c,sent};}
test('actual token function records API/fallback refusals without adding or altering a request',async()=>{
 const {c,sent}=tokenHarness([{status:400,ok:false},{status:403,ok:false}]);const d={nativeGeneration:1,attempt:1,sessionObservation:{}};assert.equal(await c.fetchWebPlayerToken(d),null);
 assert.equal(d.sessionObservation.apiHttp,400);assert.equal(d.sessionObservation.fallbackHttp,403);assert.equal(c.requests.length,2);
 assert.equal(c.requests[0].url,'https://open.spotify.com/api/token');assert.equal(c.requests[1].url,'https://open.spotify.com/get_access_token?reason=transport&productType=web_player');
 for(const r of c.requests)assert.deepEqual(JSON.parse(JSON.stringify(r.init)),{method:'GET',credentials:'include',headers:{Accept:'application/json','app-platform':'WebPlayer','spotify-app-version':'1.2.40.0'}});
 assert.ok(sent.every(r=>!JSON.stringify(r).includes('accessToken')));
});
test('actual token success/cache does not claim an unobserved fallback or inherited HTTP status',async()=>{
 const {c}=tokenHarness([{status:200,ok:true,json:async()=>({accessToken:'SYNTHETIC-SECRET',accessTokenExpirationTimestampMs:Date.now()+3600000})}]);
 const first={attempt:1,sessionObservation:{}};assert.equal(await c.fetchWebPlayerToken(first),'SYNTHETIC-SECRET');assert.equal(first.sessionObservation.apiHttp,200);assert.equal(first.sessionObservation.fallbackHttp,undefined);
 const next={attempt:2,sessionObservation:{}};assert.equal(await c.fetchWebPlayerToken(next),'SYNTHETIC-SECRET');assert.equal(next.sessionObservation.tokenResult,'obtained');assert.equal(next.sessionObservation.apiHttp,undefined);assert.equal(next.sessionObservation.fallbackHttp,undefined);assert.equal(c.requests.length,1);
});
test('actual network failure never invents an HTTP refusal or a fallback attempt',async()=>{
 const {c,sent}=tokenHarness([new Error('synthetic network failure')]);const d={attempt:1,sessionObservation:{}};assert.equal(await c.fetchWebPlayerToken(d),null);assert.equal(c.requests.length,1);assert.equal(d.sessionObservation.apiHttp,undefined);assert.equal(d.sessionObservation.fallbackHttp,undefined);assert.ok(sent.every(x=>x.tokenResult==='unknown'));
});

test('expired synthetic primary token is rejected and a valid synthetic fallback is used without changing requests',async()=>{
 const {c}=tokenHarness([
  {status:200,ok:true,json:async()=>({accessToken:'EXPIRED_FIXTURE',accessTokenExpirationTimestampMs:Date.now()-1})},
  {status:200,ok:true,json:async()=>({accessToken:'VALID_FALLBACK_FIXTURE',accessTokenExpirationTimestampMs:Date.now()+3600000})}
 ]);
 const d={attempt:1,sessionObservation:{}};
 assert.equal(await c.fetchWebPlayerToken(d),'VALID_FALLBACK_FIXTURE');
 assert.equal(d.sessionObservation.apiHttp,200);assert.equal(d.sessionObservation.fallbackHttp,200);
 assert.equal(c.requests.length,2);assert.equal(c.requests[0].url,'https://open.spotify.com/api/token');
 assert.equal(c.requests[1].url,'https://open.spotify.com/get_access_token?reason=transport&productType=web_player');
});
