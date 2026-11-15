'use strict';
// Synthetic DOM, fake Spotify responses; never contacts the network.
const {test}=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path'),{JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const tick=()=>new Promise(resolve=>setImmediate(resolve));
function fixture(fetch,pathname='/') {
 const errors=[], vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e.message));
 const dom=new JSDOM('<!doctype html><body><main id="main-view"></main><button data-testid="control-button-playpause" aria-label="Pause"></button></body>',{url:'https://open.spotify.com'+pathname,runScripts:'outside-only',virtualconsole:vc,virtualConsole:vc});
 const w=dom.window,calls=[],requests=[];
 w.AndBridge={onNativeUiData:(kind,data)=>calls.push({kind,data}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.fetch=(url,opts)=>{requests.push({url,opts});return fetch(url,opts)};
 w.setInterval=()=>1;w.clearInterval=()=>{};w.setTimeout=()=>1;w.clearTimeout=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 w.eval(shell);w.spotAuthToken='Bearer synthetic';w.__sfMelodixBridgeStarted=true;
 w.fetchMediaItems=()=>Promise.resolve();
 return {w,requests,calls,errors,close:()=>dom.window.close(),open:()=>w.__sfOpenCollection('spotify:collection:tracks'),media(){return calls.filter(c=>c.kind==='media:spotify:collection:tracks').map(c=>JSON.parse(c.data))}};
}
function track(id, extra={}) {return {track:{uri:'spotify:track:'+id,name:'Title '+id,artists:[{name:'Example'}],album:{images:[{url:'https://i.scdn.co/image/example'}]},...extra}}}
function response(offset,total,items){return {ok:true,json:async()=>({offset,total,items})}}

test('fallback loads bounded pages in order and never controls the player',async()=>{
 let commands=0;
 const f=fixture((url,opts)=>{
  assert.match(url,/^https:\/\/api\.spotify\.com\/v1\/me\/tracks\?limit=50&offset=(0|50)$/);
  assert.equal(opts.method,'GET');assert.equal(opts.headers.Authorization,'Bearer synthetic');assert.equal(opts.credentials,'omit');assert.equal(opts.redirect,'error');
  return Promise.resolve(url.endsWith('offset=0') ? response(0,51,Array.from({length:50},(_,i)=>track('id'+i))) : response(50,51,[track('last',{is_playable:false})]));
 });try {
  f.w.playFromUri=()=>commands++;f.w.actPlayPause=()=>commands++;let before=f.w.location.href;
  assert.equal(f.open(),true);await tick();await tick();
  assert.equal(f.requests.length,2);let batches=f.media();assert.equal(batches.length,2);
  assert.equal(batches[0][0].uri,'spotify:track:id0');assert.match(batches[0].at(-1).title,/Chargement/);
  assert.equal(batches[1].length,51);assert.equal(batches[1][50].uri,'');assert.equal(batches[1][50].settingValue,'Indisponible');
  assert.equal(f.w.location.href,before);assert.equal(commands,0);
 }finally{f.close()}
});
test('refusal and malformed response are unavailable, not fabricated empty',async()=>{
 for(const fake of [{ok:false,status:403},response(2,0,[])]){
  const f=fixture(()=>Promise.resolve(fake));try{f.open();await tick();await tick();assert.equal(f.requests.length,1);assert.match(f.media().at(-1)[0].title,/indisponibles/i)}finally{f.close()}
 }
});
test('confirmed zero items displays a genuinely empty state',async()=>{
 const f=fixture(()=>Promise.resolve(response(0,0,[])));try{f.open();await tick();await tick();assert.match(f.media().at(-1)[0].title,/Aucun titre/)}finally{f.close()}
});
test('closing or changing session prevents stale fallback results',async()=>{
 for(const invalidate of [w=>w.__sfCancelPendingCollection(),w=>{w.spotAuthToken='Bearer new'}]){
  let resolve;const f=fixture(()=>new Promise(r=>{resolve=r}));try{
   f.open();await tick();assert.equal(f.requests.length,1);invalidate(f.w);resolve(response(0,1,[track('old')]));await tick();await tick();assert.equal(f.media().length,0);
  }finally{f.close()}
 }
});
test('fallback is not called for other collections or when bridge has provided data',async()=>{
 for(const liked of [false,true]){
  const f=fixture(()=>{throw Error('should not fetch')});try{
   f.w.fetchMediaItems=(uri,id)=>{if(liked)f.w.__sfNativeCollectionLoaded(uri,id);return Promise.resolve()};
   f.w.__sfOpenCollection(liked?'spotify:collection:tracks':'spotify:album:abc');await tick();await tick();assert.equal(f.requests.length,0);
  }finally{f.close()}
 }
});
test('full protected bridge empty liked result triggers the shell fallback once',async()=>{
 const f=fixture((url,opts)=>{
  if(url.includes('api-partner.spotify.com'))return Promise.resolve({ok:false,status:403});
  if(url.includes('api.spotify.com/v1/me/tracks'))return Promise.resolve(response(0,1,[track('realisticFixture')]));
  throw Error('unexpected synthetic endpoint');
 });try{
  f.w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};f.w.AndBridge.onMediaItemsLoaded=(id,data)=>f.calls.push({kind:'bridge:'+id,data});
  f.w.eval(fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8'));
  assert.equal(f.w.__sfMelodixBridgeCompleted,true);f.open();await tick();await tick();await tick();
  assert.equal(f.requests.filter(r=>r.url.includes('api.spotify.com/v1/me/tracks')).length,1);
  assert.equal(f.media().at(-1)[0].uri,'spotify:track:realisticFixture');
  assert.equal(f.media().at(-1)[0].subtitle,'Example');
 }finally{f.close()}
});

test('partial pages preserve observed rows after a refusal and reject untrusted image hosts',async()=>{
 const f=fixture(url=>Promise.resolve(url.endsWith('offset=0') ? response(0,51,Array.from({length:50},(_,i)=>track('t'+i,{album:{images:[{url:'https://example.test/cover'}]}}))) : {ok:false,status:429}));try{
  f.open();await tick();await tick();let last=f.media().at(-1);assert.equal(last.length,51);
  assert.equal(last[0].uri,'spotify:track:t0');assert.equal(last[0].image,undefined);assert.match(last.at(-1).title,/partiellement/);
  assert.equal(f.requests.length,2);
 }finally{f.close()}
});
test('invalid bearer is never sent to the fallback endpoint',async()=>{
 const f=fixture(()=>{throw Error('should not fetch')});try{
  f.w.spotAuthToken='invalid token';f.open();await tick();await tick();assert.equal(f.requests.length,0);
 }finally{f.close()}
});

test('liked rows do not overwrite Home text or emit Home text callbacks',async()=>{
 const f=fixture(()=>Promise.resolve(response(0,1,[track('single')])));try{
  let homeCallbacks=0;f.w.AndBridge.onNativeListText=()=>homeCallbacks++;f.w.__sfNativeHomeListText='home-fixture';
  const before=f.calls.filter(c=>c.kind==='list-text').length;
  f.open();await tick();await tick();
  assert.equal(f.w.__sfNativeHomeListText,'home-fixture');assert.equal(homeCallbacks,0);
  assert.equal(f.calls.filter(c=>c.kind==='list-text').length,before);
 }finally{f.close()}
});

test('playlist fallback accepts Spotify item and legacy track envelopes without pausing or navigating',async()=>{
 let playback=0;
 const f=fixture((url,opts)=>{
  assert.equal(url,'https://api.spotify.com/v1/playlists/abc123/items?limit=50&offset=0');
  assert.equal(opts.method,'GET');return Promise.resolve(response(0,2,[{item:track('new').track},track('old')]));
 });try {
  f.w.actPlayPause=()=>playback++;f.w.playFromUri=()=>playback++;let before=f.w.location.href;
  f.w.__sfOpenCollection('spotify:playlist:abc123');await tick();await tick();
  let data=JSON.parse(f.calls.filter(c=>c.kind==='media:spotify:playlist:abc123').at(-1).data);
  assert.equal(data.length,2);assert.equal(data[0].uri,'spotify:track:new');assert.equal(data[1].uri,'spotify:track:old');
  assert.equal(f.w.location.href,before);assert.equal(playback,0);
 }finally{f.close()}
});
test('a valid token allows a fallback when the bridge has not started',async()=>{
 const f=fixture(()=>Promise.resolve(response(0,1,[track('song')])));try{
  f.w.__sfMelodixBridgeStarted=false;f.open();await tick();await tick();
  assert.equal(f.requests.length,1);assert.equal(f.media().at(-1)[0].uri,'spotify:track:song');
 }finally{f.close()}
});

test('full bridge failure falls back for a normal playlist without playback commands',async()=>{
 let playback=0;
 const f=fixture((url)=>{
  if(url.includes('api-partner.spotify.com'))return Promise.resolve({ok:false,status:403});
  if(url.includes('/v1/playlists/abc123/items'))return Promise.resolve(response(0,1,[{item:track('fixture').track}]));
  throw Error('unexpected synthetic endpoint');
 });try{
  f.w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};f.w.AndBridge.onMediaItemsLoaded=(id,data)=>f.calls.push({kind:'bridge:'+id,data});
  f.w.eval(fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8'));
  f.w.actPlayPause=()=>playback++;f.w.playFromUri=()=>playback++;
  f.w.__sfOpenCollection('spotify:playlist:abc123');await tick();await tick();await tick();
  const data=JSON.parse(f.calls.filter(c=>c.kind==='media:spotify:playlist:abc123').at(-1).data);
  assert.equal(data[0].uri,'spotify:track:fixture');assert.equal(playback,0);
 }finally{f.close()}
});

test('a refusal cancels the generic six-second placeholder',async()=>{
 const f=fixture(()=>Promise.resolve({ok:false,status:403}));try{
  let timeout;let active=true;
  f.w.setTimeout=(fn,ms)=>{if(ms===6000)timeout=fn;return 27};
  f.w.clearTimeout=id=>{if(id===27)active=false};
  f.open();await tick();await tick();assert.ok(timeout);assert.equal(active,false);
  assert.match(f.media().at(-1)[0].title,/likés indisponibles/);
 }finally{f.close()}
});
