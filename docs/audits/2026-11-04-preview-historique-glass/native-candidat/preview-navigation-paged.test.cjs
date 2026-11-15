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
        onNativeUiData:(id,json)=>calls.push(id==='list-text' || id==='screen-title' || id==='preview-load' || id==='preview-phase' ? {event:'native-text',id,text:json} : {event:'native',id,rows:JSON.parse(json)}),
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
function init(respond){const x=bootstrap(req=>req.body?.operationName==='fetchPlaylist' && req.body?.variables?.offset>0 ? response(null) : respond?.(req));x.w.eval(bridge);x.w.__sfMelodixBridgeStarted=true;x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);x.w.__sfCancelPendingCollection();return true};return x}
function fire(x){for(const t of x.timers.filter(t=>t.ms===6000&&!t.cleared)){t.cleared=true;t.fn()}}
function media(x,id){return x.calls.filter(c=>c.event==='media'&&c.id===id)}
test('cached success cancels pre-armed fallback even when synchronous',async()=>{const x=init();try{const id='spotify:playlist:cache';x.w.__sfMediaItemsCache.set(id,[{id:'spotify:track:one',name:'one'}]);x.w.__sfCompleteNativePlaylistTokens.set(id,x.w.spotAuthToken);x.w.__sfOpenCollection(id);assert.equal(media(x,id).length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('nonempty response cancels timeout; empty and error never navigate',async()=>{for(const scenario of ['ok','empty','error']){const x=init(()=>scenario==='error'?Promise.reject(new Error('fixture')):response(scenario==='ok'?'one':null));try{const id='spotify:playlist:'+scenario;x.w.__sfOpenCollection(id);await wait();assert.equal(media(x,id).length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}}});
test('a return or a new screen cancels late responses and navigation',async()=>{const d=deferred(),x=init(()=>d.promise);try{const id='spotify:playlist:old';x.w.__sfOpenCollection(id);await wait();x.w.__sfCancelPendingCollection();d.resolve(response('old'));await wait();fire(x);assert.equal(media(x,id).length,0);assert.equal(x.nav.length,0);assert.equal(x.w.__sfCurrentContextUri,undefined);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('two overlapping requests for the same URI reject the earlier response',async()=>{let n=0;const first=deferred(),second=deferred(),x=init(()=>++n===1?first.promise:second.promise);try{const id='spotify:playlist:same';x.w.__sfOpenCollection(id);await wait();x.w.__sfOpenCollection(id);await wait();second.resolve(response('fresh'));await wait();first.resolve(response('old'));await wait();assert.equal(media(x,id).length,1);assert.equal(media(x,id)[0].rows[0].id,'spotify:track:fresh');assert.equal(x.w.__sfCurrentTrackUris[0],'spotify:track:fresh');assert.equal(x.w.__sfMediaItemsCache.get(id)[0].id,'spotify:track:fresh');fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('two different requests do not navigate or publish the earlier result',async()=>{let n=0;const first=deferred(),second=deferred(),x=init(()=>++n===1?first.promise:second.promise);try{x.w.__sfOpenCollection('spotify:playlist:a');await wait();x.w.__sfOpenCollection('spotify:playlist:b');await wait();first.resolve(response('old'));second.resolve(response('new'));await wait();assert.equal(media(x,'spotify:playlist:a').length,0);assert.equal(media(x,'spotify:playlist:b').length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('changing the account while a detail is loading drops its late response',async()=>{const d=deferred(),x=init(()=>d.promise);try{const id='spotify:playlist:old';x.w.__sfOpenCollection(id);await wait();x.w.spotAuthToken='Bearer other';d.resolve(response('old'));await wait();assert.equal(media(x,id).length,0);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('ordinary external media request keeps its callback',async()=>{const x=init(()=>response('one'));try{await x.w.fetchMediaItems('spotify:playlist:external');assert.equal(media(x,'spotify:playlist:external').length,1)}finally{x.close()}});
test('settings never advertise unsupported legacy switches as working',()=>{const x=bootstrap();try{x.w.__sfRequestSpotifySettings();const rows=x.calls.find(c=>c.event==='native'&&c.id==='settings').rows;const unavailable=rows.filter(r=>r.settingValue==='Indisponible');assert.equal(unavailable.length,10);assert.ok(unavailable.every(r=>r.uri===''&&r.subtitle.includes('non disponible')));assert.ok(rows.some(r=>r.uri==='spotify:settings:resync'))}finally{x.close()}});
test('native detail contains renderer fields and preserves media browser fields',async()=>{const x=init(()=>response('one'));try{const id='spotify:playlist:detail';x.w.__sfOpenCollection(id);await wait();const row=media(x,id)[0].rows[0];assert.equal(row.name,'one');assert.equal(row.title,'one');assert.equal(row.id,'spotify:track:one');assert.equal(row.uri,'spotify:track:one')}finally{x.close()}});
test('canonical fetch of an open.spotify.com URL returns under the originally selected native ID',async()=>{const x=init(()=>response('one'));try{const url='https://open.spotify.com/playlist/abc';x.w.__sfOpenCollection(url);await wait();assert.equal(media(x,url).length,1);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('when bridge is absent collection navigation fails closed without reload',()=>{const x=bootstrap();try{x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);return true};x.w.__sfOpenCollection('spotify:playlist:abc');assert.deepEqual(x.nav,[])}finally{x.close()}});
test('the old Spotify detail DOM cannot replace the newly selected collection or cancel its fallback',async()=>{const d=deferred(),x=init(()=>d.promise);try{x.w.history.replaceState({},'', '/playlist/old');x.w.document.querySelector('#main-view').innerHTML='<h1>Old</h1><a href="/track/oldtrack">Old Track</a>';x.w.__sfOpenCollection('spotify:playlist:new');await wait();x.calls.length=0;x.w.__sfNativeUiRefresh();assert.ok(!x.calls.some(c=>c.event==='native'&&(c.id==='detail'||c.id==='screen-title')));fire(x);assert.deepEqual(x.nav,[]);d.resolve(response('late'));await wait();assert.equal(media(x,'spotify:playlist:new').length,1)}finally{x.close()}});

test('active playback prevents the delayed collection page reload, while late bridge data remains eligible',async()=>{
 const d=deferred(),x=init(()=>d.promise);try{
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  const id='spotify:playlist:playing';x.w.__sfOpenCollection(id);await wait();fire(x);assert.equal(x.nav.length,0);
  assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='detail'&&c.rows[0]?.title==='Titres indisponibles'));
  d.resolve(response('late'));await wait();assert.equal(media(x,id).length,1);assert.equal(media(x,id)[0].rows[0].id,'spotify:track:late');
 }finally{x.close()}
});
test('active playback prevents collection reload even if the bridge has not started',()=>{
 const x=bootstrap();try{x.nav=[];x.w.__sfNativeOpenUri=u=>{x.nav.push(u);return true};
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  assert.equal(x.w.__sfOpenCollection('spotify:playlist:abc'),true);fire(x);assert.deepEqual(x.nav,[]);
  assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='detail'&&c.rows[0]?.title==='Titres indisponibles'));
 }finally{x.close()}
});

test('active playback prevents library fallback from reloading the web player',()=>{
 const x=bootstrap();try{
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  assert.equal(x.w.__sfOpenLibrary(),false);
  assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:playlists'&&c.rows[0]?.title==='Bibliothèque momentanément indisponible'));
  assert.equal(x.w.location.pathname,'/search');assert.equal(x.requests.length,0);
 }finally{x.close()}
});
test('a cancelled collection never posts the delayed playback-safe message',async()=>{
 const d=deferred(),x=init(()=>d.promise);try{
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  x.w.__sfOpenCollection('spotify:playlist:abc');await wait();x.w.__sfCancelPendingCollection();fire(x);
  assert.ok(!x.calls.some(c=>c.event==='native'&&c.id==='detail'&&c.rows[0]?.title==='Titres indisponibles'));assert.deepEqual(x.nav,[]);
 }finally{x.close()}
});

test('library can show verified in-memory entries synchronously without a request',()=>{
 const x=bootstrap();try{
  x.w.mediaLib={playlists:[{name:'Existing',id:'spotify:playlist:abc'}]};x.w.__sfNativeMediaTokenMatches=()=>true;
  assert.equal(x.w.__sfOpenLibrary(),true);
  const call=x.calls.filter(c=>c.event==='native'&&c.id==='media:playlists').at(-1);
  assert.equal(call.rows[0].title,'Existing');assert.equal(call.rows[0].uri,'spotify:playlist:abc');assert.equal(x.requests.length,0);
 }finally{x.close()}
});
test('library refuses in-memory entries when account provenance is missing or mismatched',()=>{
 for (const proof of [undefined,()=>false]) {const x=bootstrap();try{
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  x.w.mediaLib={playlists:[{name:'Other account',id:'spotify:playlist:other'}]};x.w.__sfNativeMediaTokenMatches=proof;
  x.w.__sfOpenLibrary();const data=x.calls.filter(c=>c.event==='native'&&c.id==='media:playlists');
  assert.ok(data.length);assert.ok(data.every(c=>c.rows.every(r=>r.title!=='Other account')));assert.equal(x.requests.length,0);
 }finally{x.close()}}
});

// Full shell and synthetic bridge/timers only: not Spotify or Android audio.
function fireNext(x,ms){const t=x.timers.find(t=>t.kind==='timeout'&&t.ms===ms&&!t.cleared);assert.ok(t,'missing timer '+ms);t.cleared=true;t.fn()}
function stages(x){return x.calls.filter(c=>c.event==='native-text'&&c.id==='preview-load').map(c=>c.text)}
test('bridge startup invokes the exposed function once without waiting for unrelated completion',async()=>{
 const x=bootstrap();try{
  const requests=[];x.w.__sfOpenCollection('spotify:album:secret');
  assert.equal(stages(x).at(-1),'waiting-bridge:unknown');
  x.w.__sfMelodixBridgeStarted=true;x.w.fetchMediaItems=(uri,id)=>{requests.push(uri);x.w.__sfNativeCollectionLoaded(uri,id);return Promise.resolve()};
  fireNext(x,250);await wait();
  x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;
  assert.deepEqual(requests,['spotify:album:secret']);assert.equal(stages(x).at(-1),'data:unknown');
  fire(x);assert.equal(requests.length,1);
 }finally{x.close()}
});
test('failed request is never automatically repeated',async()=>{
 const x=bootstrap();try{
  x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  let count=0;x.w.fetchMediaItems=()=>{count++;return Promise.resolve()};
  x.w.__sfOpenCollection('spotify:album:first');await wait();assert.equal(count,1);
  assert.equal(stages(x).at(-1),'no-data:unknown');fire(x);assert.equal(count,1);
  const rows=x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows;
  assert.equal(rows[0].title,'Titres indisponibles');assert.equal(rows[1].title,'Réessayer');
  assert.equal(rows[1].uri,'melodix:retry-collection');
  x.w.__sfRetryCollection();await wait();assert.equal(count,2);fire(x);assert.equal(count,2);
 }finally{x.close()}
});
test('bridge readiness polling is bounded without inspecting a token',()=>{
 const x=bootstrap();try{
  const before=x.w.location.href;x.w.__sfOpenCollection('spotify:album:secret');
  for(let i=0;i<20;i++)fireNext(x,250);
  assert.equal(stages(x).at(-1),'waiting-bridge:unknown');assert.equal(x.w.location.href,before);
  assert.ok(!x.timers.some(t=>t.kind==='timeout'&&t.ms===250&&!t.cleared));assert.equal(x.requests.length,0);
 }finally{x.close()}
});

for(const uri of ['spotify:playlist:abc123','spotify:collection:tracks']) {
 test('paused failure uses the historical navigation once: '+uri,async()=>{
  const x=bootstrap();try{
   x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Play"></button>');
   x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;let count=0;x.nav=[];
   x.w.fetchMediaItems=()=>{count++;return Promise.resolve()};
   x.w.__sfNativeOpenUri=u=>{x.nav.push(u);x.w.__sfCancelPendingCollection();return true};
   x.w.__sfOpenCollection(uri);await wait();fire(x);
   assert.equal(count,1);assert.deepEqual(x.nav,[uri]);assert.equal(x.requests.length,0);
  }finally{x.close()}
 });
 test('playing failure offers one manual retry and never auto-reloads: '+uri,async()=>{
  const x=bootstrap();try{
   x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
   x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;let count=0;const first=deferred();x.nav=[];
   x.w.fetchMediaItems=()=>{count++;return count===1?first.promise:Promise.resolve()};
   x.w.__sfNativeOpenUri=u=>{x.nav.push(u);return true};
   Object.defineProperty(x.w,'spotAuthToken',{configurable:true,get(){throw Error('new code read credential')}});
   x.w.__sfOpenCollection(uri);fire(x);assert.equal(count,1);assert.deepEqual(x.nav,[]);
   let rows=x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows;
   assert.equal(rows[0].title,uri==='spotify:collection:tracks'?'Titres likés indisponibles':'Titres indisponibles');assert.equal(rows[1].title,'Réessayer');
   // A late empty resolution must not navigate even after pausing; it belongs
   // to the already failed attempt, not a fresh user request.
   x.w.document.querySelector('button').setAttribute('aria-label','Play');first.resolve();await wait();
   assert.deepEqual(x.nav,[]);assert.equal(count,1);
   x.w.document.querySelector('button').setAttribute('aria-label','Pause');
   x.w.__sfRetryCollection();await wait();assert.equal(count,2);assert.deepEqual(x.nav,[]);
   assert.equal(x.requests.length,0);
  }finally{x.close()}
 });
}
test('native retry row is intercepted before Spotify URI handling',()=>{
 const a=fs.readFileSync(path.join(root,'smali/com/melodix/music/MainActivity.smali'),'utf8');
 const m=a.split('.method public final openNativeRow(')[1].split('.end method')[0];
 assert.ok(m.indexOf('melodix:retry-collection')>=0);
 assert.ok(m.indexOf('window.__sfRetryCollection')<m.indexOf('window.__sfNativeOpenUri'));
 const rows=fs.readFileSync(path.join(root,'smali/com/melodix/music/NativeUiRowFactory.smali'),'utf8');
 assert.ok(rows.includes('new-instance v1, Landroid/widget/Button;'));
 assert.ok(rows.includes('melodix:retry-collection'));
 const flow=shell.slice(shell.indexOf('    var openCollectionTimer = null;'),shell.indexOf('    // Search normally goes through the bridge.'));
 for(const forbidden of ['spotAuthToken','spotCliToken','localStorage','api.spotify.com','window.fetch(']) assert.ok(!flow.includes(forbidden));
});

test('the existing Liked Songs page publishes real DOM track rows to detail',()=>{
 const dom=new JSDOM('<!doctype html><button data-testid="user-widget-link"></button><main id="main-view"><h1>Liked Songs</h1><div data-testid="tracklist-row"><a href="/track/example">Real title</a><a href="/artist/exampleartist">Artist</a></div></main>',{url:'https://open.spotify.com/collection/tracks',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,calls=[],routes=[];
 try{
  w.AndBridge={onNativeUiData:(id,data)=>calls.push({id,data}),onNativeUiReady(){},onNativeUiRoute:r=>routes.push(r)};
  w.fetch=()=>{throw Error('unexpected network')};w.setTimeout=()=>1;w.clearTimeout=()=>{};w.setInterval=()=>1;w.clearInterval=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
  w.eval(shell);w.__sfNativeUiRefresh();
  const rows=JSON.parse(calls.filter(c=>c.id==='detail').at(-1).data);
  assert.equal(routes[0],'detail');assert.equal(rows[0].title,'Real title');assert.equal(rows[0].uri,'spotify:track:example');
  assert.equal(rows[0].subtitle,'Artist');assert.equal(rows[1].title,'Aperçu Spotify');
 }finally{dom.window.close()}
});

test('recent play request blocks navigation even if the pause button is stale',async()=>{
 const x=bootstrap();try {
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Play"></button>');
  x.w.__sfLastPlayRequestAt=Date.now();x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;x.w.fetchMediaItems=()=>Promise.resolve();x.nav=[];
  x.w.__sfNativeOpenUri=u=>{x.nav.push(u);return true};
  x.w.__sfOpenCollection('spotify:playlist:abc');await wait();assert.deepEqual(x.nav,[]);
  assert.equal(x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows[1].title,'Réessayer');
 }finally{x.close()}
});

// Real pending route gate: unlike a direct-page-only fixture, opening the
// native detail sets a pending URI before the DOM scrape runs.
test('visible liked page is published with a pending collection URI',async()=>{
 const x=bootstrap();try {
  x.w.history.replaceState({},'', '/collection/tracks');
  x.w.document.querySelector('#main-view').innerHTML='<h1>Liked</h1><div data-testid="tracklist-row"><a href="/track/real1">Real title</a><a href="/artist/real2">Artist</a></div>';
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  x.w.__sfMelodixBridgeStarted=true;x.w.__sfMelodixBridgeCompleted=true;let requests=0;
  x.w.fetchMediaItems=()=>{requests++;return Promise.resolve()};
  x.w.__sfOpenCollection('spotify:collection:tracks');await wait();
  const rows=x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows;
  assert.equal(rows[0].title,'Real title');assert.equal(rows[0].uri,'spotify:track:real1');
  assert.equal(x.w.__sfNativeCollectionDomReady,true);assert.equal(stages(x).at(-1),'data:unknown');
  assert.equal(requests,1);assert.equal(x.requests.length,0);
 }finally{x.close()}
});

test('visible liked DOM survives an empty protected bridge response',async()=>{
 const x=init(req=>{throw Error('simulated bridge response failure')});try {
  x.w.history.replaceState({},'', '/collection/tracks');
  x.w.document.querySelector('#main-view').innerHTML='<div data-testid="tracklist-row"><a href="/track/visible">Shown</a></div>';
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="control-button-playpause" aria-label="Pause"></button>');
  x.w.__sfOpenCollection('spotify:collection:tracks');await wait();
  const details=x.calls.filter(c=>c.event==='native'&&c.id==='detail');
  assert.equal(details.at(-1).rows[0].title,'Shown');
  assert.equal(media(x,'spotify:collection:tracks').length,0);
  assert.equal(stages(x).at(-1),'data:unknown');
 }finally{x.close()}
});

test('ready empty liked page exposes retry and replaces it when DOM rows appear',async()=>{
 const x=bootstrap();try {
  x.w.history.replaceState({},'', '/collection/tracks');x.w.document.querySelector('#main-view').innerHTML='<h1>Liked</h1>';
  x.w.document.body.insertAdjacentHTML('beforeend','<button data-testid="user-widget-link"></button><button data-testid="control-button-playpause" aria-label="Pause"></button>');
  x.w.__sfNativeUiRefresh();let details=x.calls.filter(c=>c.event==='native'&&c.id==='detail');
  assert.equal(details.at(-1).rows[0].title,'Titres likés indisponibles');assert.equal(details.at(-1).rows[1].title,'Réessayer');
  x.w.document.querySelector('#main-view').insertAdjacentHTML('beforeend','<div data-testid="tracklist-row"><a href="/track/new">Appeared</a></div>');
  x.w.__sfNativeUiRefresh();details=x.calls.filter(c=>c.event==='native'&&c.id==='detail');assert.equal(details.at(-1).rows[0].title,'Appeared');
  let requests=0;x.w.__sfMelodixBridgeStarted=true;x.w.fetchMediaItems=()=>{requests++;return Promise.resolve()};
  x.w.__sfRetryCollection();await wait();assert.equal(requests,1);
 }finally{x.close()}
});
