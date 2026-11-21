'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const vm=require('node:vm');

// Execute the exact token implementation, with controlled transport responses.
// These inputs are synthetic; this is not an authenticated Spotify test.
function tokenContext(responses) {
  const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
  const a=s.indexOf('    function safeTokenFetchStatus('),b=s.indexOf('    function dropWebPlayerToken()',a);
  assert.ok(a>=0 && b>a);
  const events=[],calls=[],observation={};
  const ctx={Date,Number,Promise,events,calls,observation,
    boundedMediaLibraryCount:(v,max)=>Math.max(0,Math.min(max,Number(v)||0)),
    mediaLibraryNow:()=>100,
    mediaLibraryResponseMime:r=>{const v=(r&&r.headers&&r.headers.get('content-type')||'').split(';')[0].trim().toLowerCase();return !v?'missing':v==='application/json'?'json':v==='text/html'?'html':'other';},
    observeSessionAttempt:(o,k,v)=>{o[k]=v;},
    traceLibraryEvent:s=>events.push(s),
    oriFetch:async(url,init)=>{calls.push({url,init});const r=responses.shift();if(r instanceof Error)throw r;assert.ok(r,'unexpected request');return r;}};
  vm.createContext(ctx);
  vm.runInContext('let webPlayerTokenCache=null,lastTokenFetchStatus="none",tokenApiHttp=0,tokenFallbackHttp=0;\n'+s.slice(a,b)+
    '\nthis.run=()=>fetchWebPlayerToken(observation); this.status=()=>lastTokenFetchStatus;',ctx);
  return ctx;
}
const resp=(status,data)=>({status,ok:status>=200&&status<300,json:async()=>{if(data instanceof Error)throw data;return data;}});
const valid=()=>({accessToken:'SENSITIVE_FIXTURE_TOKEN',accessTokenExpirationTimestampMs:Date.now()+3600000});

test('HTTP 400 then HTTP 403 stay distinct and never create a token or read error bodies',async()=>{
  const forbidden=()=>{throw Error('error response body must not be read');};
  const c=tokenContext([{status:400,ok:false,json:forbidden},{status:403,ok:false,json:forbidden}]);
  assert.equal(await c.run(),null);assert.equal(c.observation.apiHttp,400);assert.equal(c.observation.fallbackHttp,403);
  assert.equal(c.status(),'ko-http403');assert.equal(c.calls.length,2);
  assert.doesNotMatch(JSON.stringify(c.events),/SENSITIVE|body|accessToken/);
});

test('a non-JSON successful primary response falls back without inventing a network failure',async()=>{
  const c=tokenContext([resp(200,new SyntaxError('SENSITIVE_BODY')),resp(200,valid())]);
  assert.equal(await c.run(),'SENSITIVE_FIXTURE_TOKEN');assert.equal(c.status(),'ok');assert.equal(c.calls.length,2);
  assert.deepEqual([c.observation.apiHttp,c.observation.fallbackHttp],[200,200]);
  assert.doesNotMatch(JSON.stringify(c.events),/SENSITIVE_BODY|SENSITIVE_FIXTURE_TOKEN/);
});

test('invalid, non-JSON and explicitly expired responses remain distinct from network errors',async()=>{
  for (const [body,want] of [[new SyntaxError('secret-text'),'ko-non-json'],[{},'ko-invalid'],
    [{accessToken:'PRIVATE',accessTokenExpirationTimestampMs:null},'ko-invalid'],
    [{accessToken:'PRIVATE',accessTokenExpirationTimestampMs:Date.now()-1000},'ko-expired']]) {
    const c=tokenContext([resp(400,{}),resp(200,body)]);
    assert.equal(await c.run(),null,want);assert.equal(c.status(),want);
    assert.doesNotMatch(JSON.stringify(c.events),/secret-text|PRIVATE/);
  }
  for (const response of [new Error('SENSITIVE_NETWORK_ERROR'), resp(200,new TypeError('SENSITIVE_NETWORK_ERROR'))]) {
    const c=tokenContext([response]);
    assert.equal(await c.run(),null);assert.equal(c.status(),'ko-network');
    assert.equal(c.calls.length,1,'network and body-read failures retain the existing no-fallback behavior');
    assert.doesNotMatch(JSON.stringify(c.events),/SENSITIVE_NETWORK_ERROR/);
  }
});

test('valid cached token and expired-token fallback use no fabricated expiry or identity',async()=>{
  const c=tokenContext([resp(200,{accessToken:'EXPIRED_PRIVATE',accessTokenExpirationTimestampMs:Date.now()-1}),resp(200,valid())]);
  assert.equal(await c.run(),'SENSITIVE_FIXTURE_TOKEN');assert.equal(c.calls.length,2);
  assert.equal(await c.run(),'SENSITIVE_FIXTURE_TOKEN');assert.equal(c.calls.length,2,'valid cached token is reused');
  assert.equal(c.status(),'ok');assert.doesNotMatch(JSON.stringify(c.events),/EXPIRED_PRIVATE|SENSITIVE_FIXTURE_TOKEN/);
});

test('UI and both native log gates admit only the closed token-status categories',()=>{
  const shell=fs.readFileSync('scripts/native_ui_shell.source.js','utf8');
  const a=shell.indexOf('    function safeDiagToken('),b=shell.indexOf('\n    }',a)+6;
  const c={};vm.createContext(c);vm.runInContext(shell.slice(a,b),c);
  const bridge=fs.readFileSync('smali/com/melodix/music/AndBridge.smali','utf8');
  const timing=fs.readFileSync('smali/com/melodix/music/NativeStartupTiming.smali','utf8');
  const br=new RegExp(bridge.match(/const-string v0, "(\^token-result status=.*?\$)"/)[1]);
  const category=timing.match(/token-result status=\(([^)]+)\) duration=/)[1];
  const timeRe=new RegExp('^token-result status=('+category+') duration=[0-9]{1,6}$');
  for(const status of ['ok','none','ko-network','ko-non-json','ko-invalid','ko-expired','ko-http400','ko-http403','unknown']){
    assert.equal(c.safeDiagToken(status),status);assert.ok(br.test('token-result status='+status+' duration=1'));assert.ok(timeRe.test('token-result status='+status+' duration=1'));
  }
  for(const status of ['SECRET','ko-http999','ko-network secret','ko-private']){
    assert.equal(c.safeDiagToken(status),'-');assert.equal(br.test('token-result status='+status+' duration=1'),false);assert.equal(timeRe.test('token-result status='+status+' duration=1'),false);
  }
});

test('network-start acknowledgement follows a transport call and is absent on synchronous dispatch failure',async()=>{
  const c=tokenContext([resp(400,{}),resp(403,{})]);let ack=0;
  c.observation.source='native-retry';
  c.acknowledgeSessionAttemptStart=()=>{ack++;assert.equal(c.calls.length,1);};
  assert.equal(await c.run(),null);assert.equal(ack,1);assert.equal(c.calls.length,2);
  const broken=tokenContext([]);let brokenAck=0;broken.observation.source='native-retry';
  broken.acknowledgeSessionAttemptStart=()=>brokenAck++;
  broken.oriFetch=()=>{throw Error('PRIVATE_NETWORK_FAILURE');};
  assert.equal(await broken.run(),null);assert.equal(broken.status(),'ko-network');assert.equal(brokenAck,0);
  assert.doesNotMatch(JSON.stringify(broken.events),/PRIVATE_NETWORK_FAILURE/);
});

test('400 and 403 response metadata is correlated, bounded, and never contains raw header values',async()=>{
  const response=(status,type)=>({status,ok:false,headers:{get:()=>type}});
  const c=tokenContext([response(400,'application/json; charset=utf-8'),response(403,'PRIVATE_HEADER_VALUE')]);
  c.observation.nativeGeneration=17;c.observation.attempt=4;
  assert.equal(await c.run(),null);
  assert.ok(c.events.includes('token-response endpoint=api generation=17 attempt=4 http=400 mime=json'));
  assert.ok(c.events.includes('token-response endpoint=fallback generation=17 attempt=4 http=403 mime=other'));
  assert.doesNotMatch(JSON.stringify(c.events),/PRIVATE_HEADER_VALUE|charset|application\/json/);
  const smali=fs.readFileSync('smali/com/melodix/music/AndBridge.smali','utf8');
  const literal=smali.match(/const-string v0, "(\^token-response endpoint=.*?\$)"/)[1];
  const grammar=new RegExp(literal);
  for(const line of c.events.filter(s=>s.startsWith('token-response'))) assert.ok(grammar.test(line));
  assert.equal(grammar.test('token-response endpoint=api generation=17 attempt=4 http=400 mime=SECRET'),false);
  assert.equal(grammar.test('token-response endpoint=api generation=17 attempt=4 http=400 mime=json cookie=SECRET'),false);
});
