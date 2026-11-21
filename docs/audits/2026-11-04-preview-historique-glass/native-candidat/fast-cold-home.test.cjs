'use strict';
// Real historical scripts in JSDOM; fake native interface, timer queue and
// fake network only. There is no Android WebView or live Spotify request.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root) throw new Error('MELODIX_CANDIDATE_ROOT is required');
const asset=name=>fs.readFileSync(path.join(root,'assets',name),'utf8');
const bridge=asset('spotify_bridge.js'),shell=asset('native_ui_shell.js'),login=asset('classic_login.js');
function bootstrap(respond=null){
    const dom=new JSDOM('<!doctype html><html><head></head><body><main id="main-view"><a href="/playlist/fake1">Fictive</a></main></body></html>',{
        url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()
    });
    const w=dom.window,calls=[],requests=[],timers=[];
    w.fetch=async(url,init)=>{
        const body=init?.body ? JSON.parse(init.body) : null;
        requests.push({url:String(url),body});
        if(respond) return respond({url:String(url),body,signal:init?.signal});
        if(body?.operationName==='libraryV3') return {ok:true,status:200,json:async()=>({data:{me:{libraryV3:{items:[{item:{data:{__typename:'Playlist',uri:'spotify:playlist:fake1',name:'Fictive'}}}]}}}})};
        if(String(url).includes('connect-state')) return {ok:true,status:200};
        throw new Error('unhandled synthetic request');
    };
    w.XMLHttpRequest=class {open(){throw new Error('network blocked');}};
    w.WebSocket=class {constructor(){throw new Error('network blocked');}};
    w.Headers=Headers;w.Response=Response;w.TextEncoder=TextEncoder;
    w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};
    w.spotAuthToken='Bearer fixture';w.spotCliToken='client-fixture';w.spotDevId='device-fixture';
    const callbacks={readBundledAsset:()=>bridge,nativeFetch:()=>null,
        onMediaItemsLoaded:(id,json)=>calls.push({event:'media',id,rows:JSON.parse(json)}),
        onSearchCompleted:(query,json)=>calls.push({event:'search',query,rows:JSON.parse(json)}),
        onNativeUiData:(id,json)=>calls.push({event:'native',id,rows:JSON.parse(json)}),
        onNativeHomeRows:json=>calls.push({event:'home',rows:JSON.parse(json)}),
        onNativeUiReady(){},onNativeUiRoute(){}};
    w.AndBridge=new Proxy(callbacks,{get:(target,key)=>key in target?target[key]:()=>{}});
    w.setTimeout=(fn,ms)=>{timers.push({kind:'timeout',ms,fn});return timers.length;};
    w.setInterval=(fn,ms)=>{timers.push({kind:'interval',ms,fn});return timers.length;};
    w.clearInterval=w.clearTimeout=()=>{};
    w.MutationObserver=class{observe(){}disconnect(){}};
    w.eval(shell);
    return {w,dom,calls,requests,timers,close:()=>dom.window.close()};
}

const flush=async()=>{for(let i=0;i<20;i++)await Promise.resolve()};
const item=name=>({item:{data:{__typename:'Playlist',uri:'spotify:playlist:'+name,name}}});
const good=name=>({ok:true,json:async()=>({data:{me:{libraryV3:{items:[item(name)]}}}})});
function deferred(){let resolve;const promise=new Promise(r=>resolve=r);return {resolve,promise}}
const operation=(op,hash)=>({method:'POST',body:JSON.stringify({operationName:op,extensions:{persistedQuery:{sha256Hash:hash}}})});
test('cold start requests first personal page when bridge is ready without DOM mutation or retry timer',async()=>{
 const wait=deferred(),x=bootstrap(({body})=>body?.operationName==='libraryV3'?wait.promise:{ok:true});try{
 x.w.eval(bridge);await flush();assert.equal(x.requests.length,1);assert.equal(x.requests[0].body.operationName,'libraryV3');assert.equal(x.w.mediaLib,undefined);
 wait.resolve(good('personal'));await flush();assert.equal(x.w.mediaLib.playlists[0].name,'personal');const update=x.timers.find(t=>t.ms===120);assert.ok(update);update.fn();assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='home'&&c.rows.some(r=>r.uri==='spotify:playlist:personal')));
 x.w.__sfOpenLibrary();assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:playlists'&&c.rows.some(r=>r.uri==='spotify:playlist:personal')));
 }finally{x.close()}
});
test('absent token does not start an unauthenticated request; later capture starts one',async()=>{
 const x=bootstrap();try{x.w.spotAuthToken=null;x.w.eval(bridge);await flush();assert.equal(x.requests.length,0);await x.w.fetch('https://fixture.invalid/test',{headers:{Authorization:'Bearer late'}}).catch(()=>{});await flush();assert.equal(x.requests.filter(r=>r.body?.operationName==='libraryV3').length,1)}finally{x.close()}
});
test('bootstrap off Home does not proactively fetch',async()=>{
 const x=bootstrap();try{x.w.history.replaceState({},'', '/search');x.w.eval(bridge);await flush();assert.equal(x.requests.length,0)}finally{x.close()}
});
test('already in flight library startup is not restarted by Liked Songs or the same persisted library hash',async()=>{
 const pending=deferred(),x=bootstrap(({body})=>body?.operationName==='libraryV3'&&body?.variables?pending.promise:{ok:true});try{
 x.w.localStorage.setItem('sp_hash_libraryV3','same-hash');x.w.eval(bridge);await flush();assert.equal(x.requests.length,1);
 await x.w.fetch('https://api-partner.spotify.com/pathfinder/v2/query',operation('fetchLibraryTracks','liked-hash'));
 await x.w.fetch('https://api-partner.spotify.com/pathfinder/v2/query',operation('libraryV3','same-hash'));await flush();
 assert.equal(x.requests.filter(r=>r.body?.operationName==='libraryV3').length,2); // one proactive, one Spotify capture
 pending.resolve(good('real'));await flush();assert.equal(x.w.mediaLib.playlists[0].name,'real');
 }finally{x.close()}
});
test('a genuinely changed library hash replaces the in-flight startup and rejects its late page',async()=>{
 const old=deferred(),fresh=deferred();let count=0;const x=bootstrap(({body})=>{if(body?.operationName==='libraryV3'&&body?.variables)return (++count===1?old.promise:fresh.promise);return {ok:true}});try{
 x.w.localStorage.setItem('sp_hash_libraryV3','old-hash');x.w.eval(bridge);await flush();await x.w.fetch('https://api-partner.spotify.com/pathfinder/v2/query',operation('libraryV3','new-hash'));await flush();assert.equal(count,2);
 fresh.resolve(good('new'));await flush();old.resolve(good('old'));await flush();assert.equal(x.w.mediaLib.playlists[0].name,'new');
 }finally{x.close()}
});
test('token change during warmup cannot publish previous account data',async()=>{
 const old=deferred(),fresh=deferred();let count=0;const x=bootstrap(({body})=>body?.operationName==='libraryV3'?(++count===1?old.promise:fresh.promise):{ok:true});try{
 x.w.eval(bridge);await flush();await x.w.fetch('https://fixture.invalid/test',{headers:{Authorization:'Bearer other'}});await flush();assert.equal(count,2);fresh.resolve(good('new'));await flush();old.resolve(good('old'));await flush();assert.equal(x.w.mediaLib.playlists[0].name,'new');
 }finally{x.close()}
});
test('existing stored Bearer token is available for the proactive Home request',async()=>{
 const x=bootstrap();try{x.w.spotAuthToken=null;x.w.localStorage.setItem('spot_auth_token','Bearer stored');x.w.eval(bridge);await flush();assert.equal(x.requests.filter(r=>r.body?.operationName==='libraryV3').length,1);assert.equal(x.w.mediaLib.playlists[0].name,'Fictive')}finally{x.close()}
});
test('failed proactive request emits no fabricated library data',async()=>{
 const x=bootstrap(()=>({ok:false,status:401,statusText:'expired'}));try{x.w.eval(bridge);await flush();assert.equal(x.requests.length,1);assert.equal(x.w.mediaLib,undefined);assert.ok(!x.calls.some(c=>c.event==='media'))}finally{x.close()}
});
test('without native shell the bridge makes no unsolicited startup library request',async()=>{
 const x=bootstrap();try{x.w.__sfNativeUiShellReady=false;x.w.eval(bridge);await flush();assert.equal(x.requests.length,0)}finally{x.close()}
});
test('fallback built-in library hash does not restart identical startup fetch',async()=>{
 const pending=deferred(),x=bootstrap(({body})=>body?.operationName==='libraryV3'&&body?.variables?pending.promise:{ok:true});try{x.w.eval(bridge);await flush();await x.w.fetch('https://api-partner.spotify.com/pathfinder/v2/query',operation('libraryV3','0082bf82412db50128add72dbdb73e2961d59100b9cbf41fb25c568bd8bc358b'));await flush();assert.equal(x.requests.filter(r=>r.body?.operationName==='libraryV3'&&r.body?.variables).length,1);pending.resolve(good('first'));await flush();assert.equal(x.w.mediaLib.playlists[0].name,'first')}finally{x.close()}
});
