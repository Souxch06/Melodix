'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
// Reuse the unmodified existing fixture harness, not live Spotify.
const harnessText=fs.readFileSync('tests/p0_library_fetch.test.js','utf8');
const head=harnessText.slice(0,harnessText.indexOf('// A successful fixture verifies'));
const sandbox={require,__dirname: path.resolve('tests'),console,setTimeout,clearTimeout,AbortController};
vm.createContext(sandbox);
vm.runInContext(head+'\nglobalThis.fixtures={loadBridge,libraryPage,libraryItem,jsonResponse};',sandbox);
const f=sandbox.fixtures;

test('400/403 token refusal ends without library network call or false 401',async()=>{
 const calls=[]; const w=f.loadBridge({tokenResponse:null,tokenStatus:400,fallbackTokenStatus:403,fetchImpl:async(...x)=>{calls.push(x);return f.jsonResponse(401,{});}});
 const proofs=[], attempts=[];w.AndBridge.onSessionVerification=s=>proofs.push(JSON.parse(s));w.AndBridge.onSessionAttemptDiagnostic=s=>attempts.push(JSON.parse(s));w.AndBridge.getSessionGeneration=()=>1;
 w.mediaLib={playlists:[{name:'OLD PRIVATE FIXTURE'}]};w.__sfMediaLibSessionProven=true;
 await w.checkMediaLib(true);
 assert.equal(w.__testTokenRequests.length,2);assert.equal(calls.length,0);
 assert.equal(w.__sfMediaLibStatus,'error');assert.equal(w.__sfMediaLibError,'token-missing');
 assert.equal(w.mediaLib,null);assert.equal(w.__sfMediaLibSessionProven,false);
 assert.equal(proofs.at(-1).token,false);assert.equal(proofs.at(-1).libraryHttp,0);assert.equal(proofs.at(-1).libraryOk,false);
 assert.equal(attempts.at(-1).libraryHttp,null);assert.equal(attempts.at(-1).tokenResult,'refused');
 assert.equal(w.__sfMediaLibLastDiagnostic.error,'token-missing');
 assert.ok(!JSON.stringify(w.__testDiagnostics).includes('OLD PRIVATE FIXTURE'));
});

test('token success permits an authenticated library request and playlist parsing',async()=>{
 const calls=[];const w=f.loadBridge({tokenResponse:{accessToken:'fixture-secret',accessTokenExpirationTimestampMs:Date.now()+3600000},fetchImpl:async(url,init)=>{calls.push({url,init});return f.libraryPage([f.libraryItem({uri:'spotify:playlist:fixture',name:'Fixture'})]);}});
 await w.checkMediaLib(true);
 assert.equal(calls.length,1);assert.equal(calls[0].init.headers.Authorization,'Bearer fixture-secret');
 assert.equal(w.__sfMediaLibStatus,'ready');assert.equal(w.__sfMediaLibSessionProven,true);
 assert.equal(w.mediaLib.playlists[0].name,'Fixture');
 assert.doesNotMatch(JSON.stringify(w.__testDiagnostics),/fixture-secret/);
});

test('with a token, actual library 401 and 403 remain distinct authorization observations',async()=>{
 for(const code of [401,403]) {
  let called=0; const w=f.loadBridge({tokenResponse:{accessToken:'fixture-secret'},fetchImpl:async()=>{called++;return f.jsonResponse(code,{});}});
  await w.checkMediaLib(true);assert.equal(called,1);assert.equal(w.__sfMediaLibError,'http-'+code);
  assert.equal(w.__sfMediaLibSessionProven,false);assert.equal(w.__sfMediaLibLastDiagnostic.http,code);
 }
});

test('failed stale token attempt cannot erase newer state',async()=>{
 let resolve; // Test the real function in a context with a controlled token wait.
 const src=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
 const start=src.indexOf('    async function fetchAllLibrary('), end=src.indexOf('    window.fetchAllLibrary',start);
 const c={window:{__sfSpotifyAuthEpoch:1,mediaLib:{keep:true}},mediaLibraryRequestGeneration:1,boundedMediaLibraryCount:x=>Number(x)||0,mediaLibraryNow:()=>0,perfMarkBridge:()=>{},fetchWebPlayerToken:()=>new Promise(r=>resolve=r),lastTokenFetchStatus:'ko-network',safeTokenFetchStatus:x=>x,tokenApiHttp:0,tokenFallbackHttp:0,observeSessionAttempt:()=>{}};
 vm.createContext(c);vm.runInContext(src.slice(start,end),c);
 const d={sessionObservation:{}};const pending=c.fetchAllLibrary(d,1,1);c.mediaLibraryRequestGeneration=2;resolve(null);await pending;
 assert.equal(c.window.mediaLib.keep,true);assert.equal(c.window.__sfMediaLibError,undefined);
});


test('native gate executes missing-token result without marking the session expired',()=>{
 const raw=fs.readFileSync('tests/session_gate.test.js','utf8');
 const prefix=raw.slice(0,raw.indexOf("test('case 1:"));
 const ctx={require,__dirname:path.resolve('tests'),console};vm.createContext(ctx);
 vm.runInContext(prefix+'\nglobalThis.gateMachine=machine;',ctx);
 for(const libraryHttp of [0,401]) {
   const m=ctx.gateMachine();
   m.send({token:false,libraryOk:false,tokenRefused:true,libraryHttp});
   assert.equal(m.fields.state,4);assert.equal(m.fields.expiredEvidence,0);
   assert.equal(m.transitions.at(-1).reason,'token-unavailable');
   assert.ok(!m.calls.includes('showNativeUi'));
 }
});


test('native gate distinguishes observed library 401 and 403 after a token',()=>{
 const raw=fs.readFileSync('tests/session_gate.test.js','utf8');
 const prefix=raw.slice(0,raw.indexOf("test('case 1:"));
 const ctx={require,__dirname:path.resolve('tests'),console};vm.createContext(ctx);
 vm.runInContext(prefix+'\nglobalThis.gateMachine=machine;',ctx);
 for(const code of [401,403]) {
   const m=ctx.gateMachine();m.send({token:true,libraryOk:false,libraryHttp:code});
   assert.equal(m.fields.state,4);assert.equal(m.fields.expiredEvidence,0);
   assert.equal(m.transitions.at(-1).reason,'library-http-'+code);
   assert.ok(!m.calls.includes('showNativeUi'));
 }
});

test('concurrent attempts with no token coalesce and never issue protected requests',async()=>{
 let calls=0;const w=f.loadBridge({tokenResponse:null,tokenStatus:400,fallbackTokenStatus:403,
   fetchImpl:async()=>{calls++;return f.jsonResponse(401,{});}});
 const a=w.checkMediaLib(), b=w.checkMediaLib(true), c=w.checkMediaLib();
 assert.strictEqual(a,b);assert.strictEqual(a,c);
 await Promise.all([a,b,c]);
 assert.equal(w.__testTokenRequests.length,2);assert.equal(calls,0);
 assert.equal(w.__sfMediaLibError,'token-missing');assert.equal(w.__sfMediaLibLastDiagnostic.http,0);
 assert.doesNotMatch(w.__testDiagnostics.join('\n'),/library\.request\.(?:started|response).*http=401/);
 assert.equal(w.__sfMediaLibSessionProven,false);
});

test('200 responses without an accessToken still do not authorize library requests',async()=>{
 let calls=0;const w=f.loadBridge({tokenResponse:{},fetchImpl:async()=>{calls++;return f.libraryPage([]);}});
 await w.checkMediaLib(true);assert.equal(w.__testTokenRequests.length,2);
 assert.equal(calls,0);assert.equal(w.__sfMediaLibError,'token-missing');
 assert.equal(w.__sfMediaLibLastDiagnostic.http,0);assert.equal(w.__sfMediaLibSessionProven,false);
});
