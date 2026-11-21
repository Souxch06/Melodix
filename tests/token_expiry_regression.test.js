'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs'),vm=require('node:vm'),path=require('node:path');
// These are exclusively synthetic responses, never a real Spotify session.
const source=fs.readFileSync('tests/p0_library_fetch.test.js','utf8');
const ctx={require,__dirname:path.resolve('tests'),console,setTimeout,clearTimeout,AbortController};
vm.createContext(ctx);
vm.runInContext(source.slice(0,source.indexOf('// A successful fixture verifies'))+'\nglobalThis.fixtures={loadBridge,libraryPage};',ctx);

test('known expired or unverifiable bearer is never sent; cookie-only request may succeed',async()=>{
 for (const tokenResponse of [
  {accessToken:'EXPIRED_FIXTURE',accessTokenExpirationTimestampMs:Date.now()-60000},
  {accessToken:'MISSING_EXPIRY_FIXTURE'},
  {accessToken:'INVALID_EXPIRY_FIXTURE',accessTokenExpirationTimestampMs:'bad'},
  {accessToken:'  ',accessTokenExpirationTimestampMs:Date.now()+3600000},
  {accessToken:{fake:'object'},accessTokenExpirationTimestampMs:Date.now()+3600000}
 ]) {
  let count=0; const w=ctx.fixtures.loadBridge({tokenResponse,fetchImpl:async(url,init)=>{count++;assert.equal(init.headers.Authorization,undefined);return ctx.fixtures.libraryPage([]);}});
  await w.checkMediaLib(true);
  assert.equal(count,1,'unusable bearer falls back to a cookie-only request');
  assert.equal(w.__sfMediaLibError,'');
  assert.equal(w.__sfMediaLibLastDiagnostic.http,200);
  assert.equal(w.__sfMediaLibSessionProven,true);
  assert.doesNotMatch(w.__testDiagnostics.join('\n'),/EXPIRED_FIXTURE|MISSING_EXPIRY_FIXTURE|INVALID_EXPIRY_FIXTURE/);
 }
});

test('token expiry during pagination stops further requests and invalidates partial fixture proof',async()=>{
 const initial=Date.now(), expires=initial+120000;let clock=initial,requests=0;
 const tokenResponse={accessToken:'SHORT_LIVED_FIXTURE',accessTokenExpirationTimestampMs:expires};
 const items=Array.from({length:50},(_,i)=>({item:{data:{__typename:'Playlist',uri:'spotify:playlist:synthetic'+i,name:'Fixture '+i}}}));
 const w=ctx.fixtures.loadBridge({tokenResponse,fetchImpl:async()=>{requests++;clock=expires+1;return ctx.fixtures.libraryPage(items);}});
 w.Date=class extends Date {static now(){return clock;}};
 const proofs=[];w.AndBridge.onSessionVerification=s=>proofs.push(JSON.parse(s));w.AndBridge.getSessionGeneration=()=>1;
 await w.checkMediaLib(true);
 assert.equal(requests,1,'the expired bearer must never be sent on the next page');
 assert.equal(w.__sfMediaLibError,'token-missing');assert.equal(w.__sfMediaLibSessionProven,false);
 assert.equal(w.mediaLib,null);assert.equal(w.__sfMediaLibLastDiagnostic.http,0);
 assert.equal(proofs.at(-1).token,false);assert.equal(proofs.at(-1).libraryOk,false);
 assert.doesNotMatch(w.__testDiagnostics.join('\n'),/SHORT_LIVED_FIXTURE|http=401/);
});
