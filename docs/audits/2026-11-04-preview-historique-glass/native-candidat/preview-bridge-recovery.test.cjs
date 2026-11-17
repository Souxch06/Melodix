'use strict';
// Actual assembled Preview shell + bridge in JSDOM. Resource-load failures and
// timing are simulated; this is not Android WebView or a live Spotify session.
const test=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root) throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const bridge=fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8');
function setup(){
 const dom=new JSDOM('<!doctype html><main id="main-view"></main>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,timers=[];let readCount=0;
 w.setTimeout=(fn,ms)=>{timers.push({fn,ms});return timers.length};w.clearTimeout=()=>{};w.setInterval=()=>1;w.clearInterval=()=>{};
 w.MutationObserver=class{observe(){}disconnect(){}};w.SF_CONFIG={guiMode:'csshack'};
 w.fetch=async()=>{throw Error('synthetic network blocked')};
 w.AndBridge=new Proxy({readBundledAsset:()=>{readCount++;return bridge}},{get:(t,k)=>k in t?t[k]:()=>{}});
 w.eval(shell);w.__sfLoadBundledBridge('spotify_bridge.js');
 return {w,timers,reads:()=>readCount,close:()=>dom.window.close()};
}
function fire(x,ms,index=0){const t=x.timers.filter(t=>t.ms===ms)[index];assert.ok(t,'missing timer '+ms);t.fn()}
function tag(x){return x.w.document.querySelector('script[data-sf-melodix-bridge="1"]')}
test('resource error permits bounded replacement; pending retry is not duplicated',()=>{
 const x=setup();try{const old=tag(x);old.onerror();assert.equal(x.w.__sfBridgeLoadStage,'script-error');fire(x,1200);
 const next=tag(x);assert.ok(next);assert.notEqual(next,old);assert.equal(x.w.document.querySelectorAll('script[data-sf-melodix-bridge="1"]').length,1);
 fire(x,2500);assert.equal(tag(x),next,'pending tag must remain');assert.equal(x.w.__sfNativeUiBridgeRecoveryAttempts,2);
 next.onerror();fire(x,2500,1);assert.notEqual(tag(x),next);assert.equal(x.w.document.querySelectorAll('script[data-sf-melodix-bridge="1"]').length,1);
 }finally{x.close()}
});
test('pending and entered bridges are never replaced',()=>{for(const entered of [false,true]){const x=setup();try{const old=tag(x);if(entered){old.onerror();x.w.__sfBridgeEntered=true;}fire(x,1200);assert.equal(tag(x),old)}finally{x.close()}}});
test('started bridge is never retried after a previous resource error',()=>{const x=setup();try{const old=tag(x);old.onerror();x.w.__sfMelodixBridgeStarted=true;fire(x,1200);assert.equal(tag(x),old);assert.equal(x.w.__sfNativeUiBridgeRecoveryAttempts,undefined)}finally{x.close()}});
test('a recovered tag can execute the real embedded bridge without duplicate start',()=>{const x=setup();try{tag(x).onerror();fire(x,1200);const retry=tag(x);x.w.eval(bridge);assert.equal(x.w.__sfMelodixBridgeCompleted,true);const wrapped=x.w.fetch;fire(x,2500);assert.equal(tag(x),retry);assert.equal(x.w.fetch,wrapped)}finally{x.close()}});
test('late callback on old tag cannot discard a pending new tag',()=>{const x=setup();try{const old=tag(x);old.onerror();fire(x,1200);const next=tag(x);old.onerror();fire(x,2500);assert.equal(tag(x),next)}finally{x.close()}});
test('a pre-existing native loader tag receives an error observer',()=>{
 const x=setup();try{const existing=tag(x);existing.remove();const n=x.w.document.createElement('script');n.dataset.sfMelodixBridge='1';n.onload=()=>{};n.onerror=()=>{};x.w.document.head.appendChild(n);x.w.__sfLoadBundledBridge('spotify_bridge.js');n.dispatchEvent(new x.w.Event('error'));fire(x,1200);assert.notEqual(tag(x),n)}finally{x.close()}
});
test('a waiting playlist receives real bridge callbacks after simulated recovery',async()=>{
 const x=setup();try{
  x.w.history.replaceState({},'', '/search');x.w.spotAuthToken='Bearer fixture';x.w.spotCliToken='fixture';
  const calls=[],req=[];x.w.AndBridge.onMediaItemsLoaded=(id,json)=>calls.push({id,rows:JSON.parse(json)});
  x.w.fetch=async(url,init)=>{const body=JSON.parse(init.body);req.push(body.operationName);return {ok:true,json:async()=>({data:{playlistV2:{content:{totalCount:1,items:[{itemV2:{data:{uri:'spotify:track:fixture',name:'Fixture',artists:{items:[]}}}}]}}}})}};
  const id='spotify:playlist:fixture';x.w.__sfOpenCollection(id);assert.equal(req.length,0);
  tag(x).onerror();fire(x,1200);x.w.eval(bridge);fire(x,250);
  for(let i=0;i<50;i++)await Promise.resolve();
  assert.deepEqual(req,['fetchPlaylist']);assert.ok(calls.some(c=>c.id===id&&c.rows[0]?.id==='spotify:track:fixture'));
 }finally{x.close()}
});

test('same-origin bridge loading does not copy the full bridge through the native interface',()=>{
 const x=setup();try{assert.equal(x.reads(),0);let reads=0;x.w.AndBridge.readBundledAsset=()=>{reads++;throw Error('copy must not be requested')};x.w.__sfLoadBundledBridge('spotify_bridge.js');tag(x).onerror();fire(x,1200);assert.equal(reads,0);assert.equal(x.w.__sfPreviewBridgeCopyAvoided,true);assert.ok(tag(x));x.w.eval(bridge);assert.equal(x.w.__sfMelodixBridgeCompleted,true)}finally{x.close()}
});
