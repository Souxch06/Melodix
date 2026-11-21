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
        url:'https://open.spotify.com/search',runScripts:'outside-only',virtualConsole:new VirtualConsole()
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
    w.clearInterval=w.clearTimeout=id=>{if(timers[id-1])timers[id-1].cleared=true;};
    w.MutationObserver=class{observe(){}disconnect(){}};
    w.eval(shell);
    return {w,dom,calls,requests,timers,close:()=>dom.window.close()};
}

const flush=async()=>{for(let i=0;i<20;i++)await Promise.resolve()};
const item=name=>({item:{data:{__typename:'Playlist',uri:'spotify:playlist:'+name,name}}});
const good=name=>({ok:true,json:async()=>({data:{me:{libraryV3:{items:[item(name)]}}}})});
function deferred(){let resolve;const promise=new Promise(r=>resolve=r);return {resolve,promise}}
const operation=(op,hash)=>({method:'POST',body:JSON.stringify({operationName:op,extensions:{persistedQuery:{sha256Hash:hash}}})});
// Synthetic web environment and network only; no Android runtime.
const wait=async()=>{for(let i=0;i<40;i++)await Promise.resolve()};
function response(track){return {ok:true,json:async()=>({data:{playlistV2:{content:{items:track?[{itemV2:{data:{uri:'spotify:track:'+track,name:track,artists:{items:[]}}}}]:[]}}}})}}
function init(respond){const x=bootstrap(respond);x.w.eval(bridge);x.w.__sfMelodixBridgeStarted=true;x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);x.w.__sfCancelPendingCollection();return true};return x}
function fire(x){for(const t of x.timers.filter(t=>t.ms===6000&&!t.cleared)){t.cleared=true;t.fn()}}
function media(x,id){return x.calls.filter(c=>c.event==='media'&&c.id===id)}
test('cached success cancels pre-armed fallback even when synchronous',async()=>{const x=init();try{const id='spotify:playlist:cache';x.w.__sfMediaItemsCache.set(id,[{id:'spotify:track:one',name:'one'}]);x.w.__sfOpenCollection(id);assert.equal(media(x,id).length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('nonempty response cancels navigation, empty and error keep bounded fallback',async()=>{for(const scenario of ['ok','empty','error']){const x=init(()=>scenario==='error'?Promise.reject(new Error('fixture')):response(scenario==='ok'?'one':null));try{const id='spotify:playlist:'+scenario;x.w.__sfOpenCollection(id);await wait();assert.equal(media(x,id).length,1);fire(x);assert.equal(x.nav.length,scenario==='ok'?0:1)}finally{x.close()}}});
test('a return or a new screen cancels late responses and navigation',async()=>{const d=deferred(),x=init(()=>d.promise);try{const id='spotify:playlist:old';x.w.__sfOpenCollection(id);await wait();x.w.__sfCancelPendingCollection();d.resolve(response('old'));await wait();fire(x);assert.equal(media(x,id).length,0);assert.equal(x.nav.length,0);assert.equal(x.w.__sfCurrentContextUri,undefined);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('two overlapping requests for the same URI reject the earlier response',async()=>{let n=0;const first=deferred(),second=deferred(),x=init(()=>++n===1?first.promise:second.promise);try{const id='spotify:playlist:same';x.w.__sfOpenCollection(id);await wait();x.w.__sfOpenCollection(id);await wait();second.resolve(response('fresh'));await wait();first.resolve(response('old'));await wait();assert.equal(media(x,id).length,1);assert.equal(media(x,id)[0].rows[0].id,'spotify:track:fresh');assert.equal(x.w.__sfCurrentTrackUris[0],'spotify:track:fresh');assert.equal(x.w.__sfMediaItemsCache.get(id)[0].id,'spotify:track:fresh');fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('two different requests do not navigate or publish the earlier result',async()=>{let n=0;const first=deferred(),second=deferred(),x=init(()=>++n===1?first.promise:second.promise);try{x.w.__sfOpenCollection('spotify:playlist:a');await wait();x.w.__sfOpenCollection('spotify:playlist:b');await wait();first.resolve(response('old'));second.resolve(response('new'));await wait();assert.equal(media(x,'spotify:playlist:a').length,0);assert.equal(media(x,'spotify:playlist:b').length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('changing the account while a detail is loading drops its late response',async()=>{const d=deferred(),x=init(()=>d.promise);try{const id='spotify:playlist:old';x.w.__sfOpenCollection(id);await wait();x.w.spotAuthToken='Bearer other';d.resolve(response('old'));await wait();assert.equal(media(x,id).length,0);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('ordinary external media request keeps its callback',async()=>{const x=init(()=>response('one'));try{await x.w.fetchMediaItems('spotify:playlist:external');assert.equal(media(x,'spotify:playlist:external').length,1)}finally{x.close()}});
test('settings never advertise unsupported legacy switches as working',()=>{const x=bootstrap();try{x.w.__sfRequestSpotifySettings();const rows=x.calls.find(c=>c.event==='native'&&c.id==='settings').rows;const unavailable=rows.filter(r=>r.settingValue==='Indisponible');assert.equal(unavailable.length,10);assert.ok(unavailable.every(r=>r.uri===''&&r.subtitle.includes('non disponible')));assert.ok(rows.some(r=>r.uri==='spotify:settings:resync'))}finally{x.close()}});
test('native detail contains renderer fields and preserves media browser fields',async()=>{const x=init(()=>response('one'));try{const id='spotify:playlist:detail';x.w.__sfOpenCollection(id);await wait();const row=media(x,id)[0].rows[0];assert.equal(row.name,'one');assert.equal(row.title,'one');assert.equal(row.id,'spotify:track:one');assert.equal(row.uri,'spotify:track:one')}finally{x.close()}});
test('canonical fetch of an open.spotify.com URL returns under the originally selected native ID',async()=>{const x=init(()=>response('one'));try{const url='https://open.spotify.com/playlist/abc';x.w.__sfOpenCollection(url);await wait();assert.equal(media(x,url).length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('when bridge is absent it navigates immediately to the real collection',()=>{const x=bootstrap();try{x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);return true};x.w.__sfOpenCollection('spotify:playlist:abc');assert.deepEqual(x.nav,['spotify:playlist:abc'])}finally{x.close()}});
test('the old Spotify detail DOM cannot replace the newly selected collection or cancel its fallback',async()=>{const d=deferred(),x=init(()=>d.promise);try{x.w.history.replaceState({},'', '/playlist/old');x.w.document.querySelector('#main-view').innerHTML='<h1>Old</h1><a href="/track/oldtrack">Old Track</a>';x.w.__sfOpenCollection('spotify:playlist:new');await wait();x.calls.length=0;x.w.__sfNativeUiRefresh();assert.ok(!x.calls.some(c=>c.event==='native'&&(c.id==='detail'||c.id==='screen-title')));fire(x);assert.deepEqual(x.nav,['spotify:playlist:new']);d.resolve(response('late'));await wait();assert.equal(media(x,'spotify:playlist:new').length,0)}finally{x.close()}});
