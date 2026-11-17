'use strict';
// Characterizes the existing decoded Preview; fake responses only. These
// tests document defects, not acceptance criteria for a corrected bridge.
const {test}=require('node:test'),assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path'),{JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const bridge=fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8');
function fixture(fetch) {
 const dom=new JSDOM('<!doctype html><main></main>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,calls=[],requests=[];
 w.fetch=(url,opts)=>{requests.push({url,opts});return fetch(url,opts)};
 w.setInterval=()=>1;w.clearInterval=()=>{};w.setTimeout=()=>1;w.clearTimeout=()=>{};
 w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};
 w.AndBridge={onMediaItemsLoaded:(id,data)=>calls.push({id,rows:JSON.parse(data)}),onNativeUiData(){},onNativeUiReady(){}};
 w.eval(bridge);w.spotAuthToken='Bearer fixtureA';
 return {w,calls,requests,close:()=>dom.window.close()};
}
function item(i) {return {track:{data:{uri:'spotify:track:T'+i,name:'Title '+i,artists:{items:[]}}}}}
function response(items,total=items.length){return {ok:true,status:200,json:async()=>({data:{me:{library:{tracks:{items,totalCount:total}}}}})}}
function open(f,id=1){f.w.__sfNativeCollectionRequest=id;return f.w.fetchMediaItems('spotify:collection:tracks',id,'spotify:collection:tracks')}
test('current bridge asks only the first 50 even when the fixture advertises 120',async()=>{
 const f=fixture(()=>Promise.resolve(response(Array.from({length:50},(_,i)=>item(i)),120)));try{
  await open(f);assert.equal(f.requests.length,1);let req=JSON.parse(f.requests[0].opts.body);
  assert.equal(req.operationName,'fetchLibraryTracks');assert.deepEqual(req.variables,{offset:0,limit:50});
  assert.equal(f.calls.at(-1).rows.length,50);
 }finally{f.close()}
});
test('current bridge reuses cached rows after reopen and account-token change',async()=>{
 const f=fixture(()=>Promise.resolve(response([item(1)])));try{
  await open(f,1);f.w.spotAuthToken='Bearer fixtureB';await open(f,2);
  assert.equal(f.requests.length,1);assert.equal(f.calls.length,2);
  assert.equal(f.calls[1].rows[0].id,'spotify:track:T1');
 }finally{f.close()}
});
test('current bridge blocks a stale native callback but still fills the shared cache',async()=>{
 let resolve;const f=fixture(()=>new Promise(r=>{resolve=r}));try{
  const pending=open(f,1);await Promise.resolve();await Promise.resolve();
  assert.equal(typeof resolve,'function');f.w.__sfNativeCollectionRequest=2;
  resolve(response([item(9)]));await pending;
  assert.equal(f.calls.length,0);assert.equal(f.w.likedSongsCache[0].id,'spotify:track:T9');
 }finally{f.close()}
});
test('an empty or refused response is not proof that the library is empty',async()=>{
 for(const r of [{ok:false,status:403},response([])]) {
  const f=fixture(()=>Promise.resolve(r));try{await open(f);assert.deepEqual(f.calls.at(-1).rows,[])}finally{f.close()}
 }
});
