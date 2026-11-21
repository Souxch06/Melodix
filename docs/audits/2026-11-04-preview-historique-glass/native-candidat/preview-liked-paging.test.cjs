'use strict';
// Real patched Preview shell; fake Spotify HTTP and native bridge only.
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const mode=fs.readFileSync(path.join(__dirname,'preview-extras/mode-job.js'),'utf8');
const tick=()=>new Promise(r=>setImmediate(r));
function item(n,more={}) {return {track:{data:{uri:'spotify:track:T'+n,name:'Title '+n,artists:{items:[{profile:{name:'Artist'}}]},...more}}}}
function resp(items,total) {return {ok:true,json:async()=>({data:{me:{library:{tracks:{items,...(total === undefined?{}:{totalCount:total})}}}}})}}
function setup(fetch,route='/search') {
 const dom=new JSDOM('<!doctype html><main id="main-view"></main><button data-testid="control-button-playpause" aria-label="Pause"></button>',{url:'https://open.spotify.com'+route,runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[],calls=[];let commands=0;
 w.AndBridge={onNativeUiData:(id,data)=>events.push({id,data}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.fetch=(url,opts)=>{calls.push({url,opts});return fetch(url,opts)};
 w.setInterval=()=>1;w.clearInterval=()=>{};w.setTimeout=()=>1;w.clearTimeout=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 w.eval(shell);w.spotAuthToken='Bearer synthetic';w.__sfMelodixBridgeCompleted=true;w.fetchMediaItems=()=>{commands++;return Promise.resolve()};
 w.playFromUri=()=>commands++;w.actPlayPause=()=>commands++;w.__sfNativeOpenUri=()=>{commands++;return true};
 return {w,events,calls,commands:()=>commands,open:()=>w.__sfOpenCollection('spotify:collection:tracks'),rows:()=>events.filter(e=>e.id==='media:spotify:collection:tracks').map(e=>JSON.parse(e.data)),detail:()=>events.filter(e=>e.id==='detail').map(e=>JSON.parse(e.data)),close:()=>dom.window.close()};
}
test('loads 120 fresh likes in three ordered pages, keeps the playback cache aligned with observed rows',async()=>{
 const f=setup((url,o)=>{let x=JSON.parse(o.body).variables.offset;assert.equal(url,'https://api-partner.spotify.com/pathfinder/v2/query');return Promise.resolve(resp(Array.from({length:Math.min(50,120-x)},(_,i)=>item(x+i)),120))});try{
  f.w.likedSongsCache=[{id:'spotify:track:OLD'}];f.open();for(let i=0;i<10;i++)await tick();
  assert.deepEqual(f.calls.map(c=>JSON.parse(c.opts.body).variables.offset),[0,50,100]);
  assert.equal(f.rows().at(-1).length,120);assert.equal(f.rows().at(-1)[119].uri,'spotify:track:T119');assert.equal(f.w.likedSongsCache.length,120);assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('reopening after a simulated Like obtains fresh data rather than old cache',async()=>{
 let n=0;const f=setup(()=>Promise.resolve(resp([item(++n)],1)));try{f.open();for(let i=0;i<4;i++)await tick();f.open();for(let i=0;i<4;i++)await tick();assert.equal(f.calls.length,2);assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T2');assert.equal(f.w.likedSongsCache[0].id,'spotify:track:T2')}finally{f.close()}
});
test('refusals and malformed replies never pretend the library is empty or overwrite cache',async()=>{
 for(const reply of [{ok:false,status:401},{ok:false,status:403},{ok:false,status:429},{ok:true,json:async()=>({errors:[{}]})},resp([],1),resp([item(1)],0)]){
  const f=setup(()=>Promise.resolve(reply));try{f.w.likedSongsCache=[{id:'spotify:track:OLD'}];f.open();for(let i=0;i<4;i++)await tick();assert.equal(f.w.likedSongsCache[0].id,'spotify:track:OLD');assert.equal(f.rows().some(x=>x.some(y=>/Aucun titre/.test(y.title))),false);assert.match(f.detail().at(-1)[0].title,/indisponibles/i);assert.equal(f.commands(),0)}finally{f.close()}
 }
});
test('zero total is a confirmed empty list; missing total is disclosed',async()=>{
 for(const [response,message] of [[resp([],0),'Aucun titre'],[resp([item(1)]),'possiblement incomplète']]){const f=setup(()=>Promise.resolve(response));try{f.open();for(let i=0;i<4;i++)await tick();assert.match(f.rows().at(-1).at(-1).title,new RegExp(message));}finally{f.close()}}
});
test('partial page failures and changing totals keep only observed current-session tracks',async()=>{
 for(const second of [{ok:false,status:403},resp([item(50)],52),resp([item(50)],50)]){
  let n=0;const f=setup(()=>Promise.resolve(++n===1?resp(Array.from({length:50},(_,i)=>item(i)),51):second));try{f.w.likedSongsCache=[{id:'spotify:track:OLD'}];f.open();for(let i=0;i<6;i++)await tick();assert.match(f.rows().at(-1).at(-2).title,/partiellement/);assert.equal(f.rows().at(-1).at(-1).uri,'melodix:retry-collection');assert.equal(f.w.likedSongsCache[0].id,'spotify:track:T0');assert.equal(f.w.likedSongsCache.length,50)}finally{f.close()}
 }
});
test('repeated page is detected, bounded, and reported as partial',async()=>{
 const rows=Array.from({length:50},(_,i)=>item(i));const f=setup(()=>Promise.resolve(resp(rows,150)));try{f.open();for(let i=0;i<6;i++)await tick();assert.equal(f.calls.length,2);assert.match(f.rows().at(-1).at(-2).title,/partiellement/);assert.equal(f.rows().at(-1).at(-1).uri,'melodix:retry-collection')}finally{f.close()}
});
test('changing token, leaving the collection, or another open blocks old results and cache',async()=>{
 for(const cancel of [w=>{w.spotAuthToken='Bearer another'},w=>w.__sfCancelPendingCollection(),w=>w.__sfLikedMutationAttempted()]){
  let resolve;const f=setup(()=>new Promise(r=>{resolve=r}));try{f.w.likedSongsCache=[{id:'spotify:track:OLD'}];f.open();await tick();cancel(f.w);resolve(resp([item(1)],1));for(let i=0;i<4;i++)await tick();assert.equal(f.rows().length,0);assert.equal(f.w.likedSongsCache[0].id,'spotify:track:OLD');}finally{f.close()}
 }
});
test('disabled and malformed tracks are not presented as playable; untrusted image is rejected',async()=>{
 const f=setup(()=>Promise.resolve(resp([item(1,{is_playable:false,album:{images:[{url:'https://evil.test/image'}]}}),{track:{data:{uri:'spotify:track:oops'}}}],2)));try{f.open();for(let i=0;i<4;i++)await tick();const rows=f.rows().at(-1);assert.equal(rows[0].uri,'');assert.equal(rows[0].settingValue,'Indisponible');assert.equal(rows[0].image,undefined);assert.match(rows.at(-1).title,/indisponibles/);assert.equal(f.w.likedSongsCache.length,0)}finally{f.close()}
});
test('a real Like job invalidates an in-flight read before clicking, and cannot cache the old result',async()=>{
 let resolve;const f=setup(()=>new Promise(r=>{resolve=r}));try{
  f.w.document.body.insertAdjacentHTML('beforeend','<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a><button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false"></button></aside>');
  let clicks=0;const b=f.w.document.querySelector('[data-testid=add-button]');b.addEventListener('click',()=>{clicks++;b.setAttribute('aria-checked','true');b.setAttribute('aria-label','Retirer des titres likés')});
  f.open();await tick();f.w.eval('('+mode+')("like","run","false","Titre","track:x")');await tick();resolve(resp([item(1)],1));for(let i=0;i<4;i++)await tick();assert.equal(clicks,1);assert.equal(f.rows().length,0);assert.equal(f.w.likedSongsCache,undefined);
 }finally{f.close()}
});
test('patched shell uses the protected bridge fetch interceptor without consuming its old liked cache',async()=>{
 const f=setup((url,o)=>{const body=JSON.parse(o.body);assert.equal(body.operationName,'fetchLibraryTracks');return Promise.resolve(resp([item(3)],1))});try{
  f.w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};f.w.AndBridge.onMediaItemsLoaded=()=>{throw Error('old bridge path must not serve native liked list')};
  f.w.likedSongsCache=[{id:'spotify:track:OLD'}];f.w.eval(fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8'));
  assert.equal(f.w.__sfMelodixBridgeCompleted,true);f.open();for(let i=0;i<8;i++)await tick();
  assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T3');assert.equal(f.w.likedSongsCache[0].id,'spotify:track:T3');assert.equal(f.calls.length,1);
 }finally{f.close()}
});
test('a valid live session allows liked pagination when bridge bootstrap has not completed',async()=>{
 const f=setup(()=>Promise.resolve(resp([item(7)],1)));try{
  f.w.__sfMelodixBridgeStarted=true;f.w.__sfMelodixBridgeCompleted=false;delete f.w.fetchMediaItems;
  f.open();for(let i=0;i<5;i++)await tick();assert.equal(f.calls.length,1);assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T7');assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('no ready bridge and no live session remains waiting and sends no network request',async()=>{
 const f=setup(()=>{throw Error('must not request')});try{
  f.w.__sfMelodixBridgeStarted=true;f.w.__sfMelodixBridgeCompleted=false;f.w.spotAuthToken=null;delete f.w.fetchMediaItems;
  f.open();await tick();assert.equal(f.calls.length,0);assert.equal(f.rows().length,0);assert.equal(f.commands(),0);
  assert.equal(f.events.filter(e=>e.id==='preview-load').at(-1).data,'waiting-bridge:no-token');
 }finally{f.close()}
});
test('a partial bridge does not change ordinary playlist routing',async()=>{
 const f=setup(()=>{throw Error('must not request')});try{
  f.w.__sfMelodixBridgeCompleted=false;f.w.spotAuthToken='Bearer synthetic';
  f.w.__sfOpenCollection('spotify:playlist:abc');await tick();assert.equal(f.calls.length,0);assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('delayed token unblocks exactly one liked query without completing the bridge',async()=>{
 const f=setup(()=>Promise.resolve(resp([item(12)],1)));try{
  f.w.__sfMelodixBridgeCompleted=false;f.w.spotAuthToken=null;let pending=[];let serial=0;
  f.w.setTimeout=(fn,ms)=>{pending.push({fn,ms,id:++serial});return serial};f.w.clearTimeout=id=>{pending=pending.filter(t=>t.id!==id)};
  f.open();assert.equal(f.calls.length,0);f.w.spotAuthToken='Bearer synthetic';let wait=pending.find(t=>t.ms===250);assert.ok(wait);wait.fn();for(let i=0;i<5;i++)await tick();
  assert.equal(f.calls.length,1);assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T12');assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('session absent at deadline reports unavailable without navigation while playing',async()=>{
 const f=setup(()=>{throw Error('must not fetch')});try{
  f.w.__sfMelodixBridgeCompleted=false;f.w.spotAuthToken=null;let pending=[];let serial=0;
  f.w.setTimeout=(fn,ms)=>{pending.push({fn,ms,id:++serial});return serial};f.w.clearTimeout=id=>{pending=pending.filter(t=>t.id!==id)};
  f.open();for(let i=0;i<20;i++){let t=pending.find(t=>t.ms===250);assert.ok(t);pending=pending.filter(x=>x!==t);t.fn()}
  assert.equal(f.calls.length,0);assert.equal(f.commands(),0);assert.match(f.detail().at(-1)[0].title,/indisponibles/);
  assert.equal(f.events.filter(e=>e.id==='preview-load').at(-1).data,'waiting-bridge:no-token');
 }finally{f.close()}
});

test('liked reopening displays a labelled same-session snapshot synchronously and still refreshes',async()=>{
 let resolve, n=0;const f=setup(()=>++n===1?Promise.resolve(resp([item(1)],1)):new Promise(r=>{resolve=r}));try{
  f.open();for(let i=0;i<4;i++)await tick();const before=f.rows().length;
  f.open();assert.equal(f.rows().length,before+1);assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T1');
  assert.match(f.rows().at(-1).at(-1).title,/Actualisation/);assert.equal(f.calls.length,2);
  resolve(resp([item(2)],1));for(let i=0;i<4;i++)await tick();assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T2');assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('like attempt or token change prevents snapshot reuse',async()=>{
 for(const invalidate of [w=>w.__sfLikedMutationAttempted(),w=>{w.spotAuthToken='Bearer other'}]){
  let n=0;const f=setup(()=>++n===1?Promise.resolve(resp([item(1)],1)):new Promise(()=>{}));try{
   f.open();for(let i=0;i<4;i++)await tick();invalidate(f.w);const before=f.rows().length;f.open();
   assert.equal(f.rows().length,before);assert.equal(f.calls.length,2);
  }finally{f.close()}
 }
});
test('snapshot expiration and backwards clock reject the cache',async()=>{
 for(const elapsed of [90001,-1]){
  let n=0,now=200000;const f=setup(()=>++n===1?Promise.resolve(resp([item(1)],1)):new Promise(()=>{}));try{
   f.w.Date.now=()=>now;f.open();for(let i=0;i<4;i++)await tick();now+=elapsed;const before=f.rows().length;f.open();assert.equal(f.rows().length,before);
  }finally{f.close()}
 }
});
test('failed refresh discloses old data and offers retry, without playback navigation',async()=>{
 let n=0;const f=setup(()=>Promise.resolve(++n===1?resp([item(1)],1):{ok:false,status:403}));try{
  f.open();for(let i=0;i<4;i++)await tick();f.open();for(let i=0;i<4;i++)await tick();
  assert.equal(f.rows().at(-1)[0].uri,'spotify:track:T1');assert.match(f.rows().at(-1).at(-2).title,/Actualisation indisponible/);
  assert.equal(f.rows().at(-1).at(-1).uri,'melodix:retry-collection');assert.equal(f.commands(),0);
 }finally{f.close()}
});
test('liked artwork selects a real trusted larger source instead of first tiny thumbnail',async()=>{
 const f=setup(()=>Promise.resolve(resp([item(1,{album:{images:[{url:'https://i.scdn.co/64',width:64},{url:'https://i.scdn.co/300',width:300},{url:'https://evil.test/640',width:640}]}})],1)));try{
  f.open();for(let i=0;i<4;i++)await tick();assert.equal(f.rows().at(-1)[0].image,'https://i.scdn.co/300');
 }finally{f.close()}
});
test('only the matching visible playlist DOM may appear immediately while bridge is unavailable',()=>{
 const f=setup(()=>{throw Error('no network')},'/playlist/abc');try{
  f.w.__sfMelodixBridgeCompleted=false;f.w.document.querySelector('main').innerHTML='<div data-testid="tracklist-row"><a href="/track/id">Observed</a></div>';
  f.w.__sfOpenCollection('spotify:playlist:wrong');assert.equal(f.detail().length,0);
  f.w.__sfOpenCollection('spotify:playlist:abc');assert.equal(f.detail().at(-1)[0].title,'Observed');assert.match(f.detail().at(-1).at(-1).title,/Aperçu/);assert.equal(f.commands(),0);
 }finally{f.close()}
});

test('only the bridge complete playlist cache permits early delivery before bootstrap finishes',async()=>{
 for (const valid of [true,false]) {
  const f=setup(()=>{throw Error('no network')});try{
   f.w.__sfMelodixBridgeStarted=true;f.w.__sfMelodixBridgeCompleted=false;
   f.w.__sfMediaItemsCache=new f.w.Map([['spotify:playlist:abc',[{id:'spotify:track:one'}]]]);
   f.w.__sfCompleteNativePlaylistTokens=new f.w.Map([['spotify:playlist:abc',valid?'Bearer synthetic':'Bearer other']]);
   f.w.__sfOpenCollection('spotify:playlist:abc');await tick();assert.equal(f.commands(),valid?1:0);assert.equal(f.calls.length,0);
  }finally{f.close()}
 }
});
test('liked snapshot is bounded to its visible eighty rows and playback context',async()=>{
 const f=setup((url,o)=>{let offset=JSON.parse(o.body).variables.offset;
  return Promise.resolve(resp(Array.from({length:Math.min(50,120-offset)},(_,i)=>item(offset+i,offset+i===1?{is_playable:false}:{})),120));
 });try{
  f.open();for(let i=0;i<12;i++)await tick();f.open();let snapshot=f.rows().at(-1);
  assert.equal(snapshot.length,81);assert.equal(snapshot.at(-1).title,'Actualisation des titres');
  assert.equal(f.w.__sfCurrentTrackUris.length,79);assert.equal(f.w.__sfCurrentTrackUris.at(-1),'spotify:track:T79');
 }finally{f.close()}
});

test('long liked collections render first page immediately and coalesce later rebuilds',async()=>{
 const f=setup((url,o)=>{const offset=JSON.parse(o.body).variables.offset;return Promise.resolve(resp(Array.from({length:Math.min(50,320-offset)},(_,i)=>item(offset+i)),320));});try{
  f.open();for(let i=0;i<20;i++)await tick();
  const lengths=f.rows().map(a=>a.filter(r=>r.uri&&r.uri.startsWith('spotify:track:')).length);
  assert.deepEqual(lengths,[50,200,320]);assert.equal(f.calls.length,7);
 }finally{f.close()}
});

test('a freshly confirmed empty collection removes the earlier snapshot',async()=>{
 let n=0;const f=setup(()=>++n===1?Promise.resolve(resp([item(1)],1)):n===2?Promise.resolve(resp([],0)):new Promise(()=>{}));try{
  f.open();for(let i=0;i<4;i++)await tick();f.open();for(let i=0;i<4;i++)await tick();assert.match(f.rows().at(-1)[0].title,/Aucun titre/);
  const count=f.rows().length;f.open();assert.equal(f.rows().length,count);
 }finally{f.close()}
});

test('actual protected bridge delivers a completed same-session playlist cache before bootstrap',()=>{
 const f=setup(()=>{throw Error('cache must not access network')});try{
  const received=[];f.w.AndBridge.onMediaItemsLoaded=(id,data)=>received.push({id,rows:JSON.parse(data)});
  f.w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};f.w.__sfMelodixBridgeCompleted=false;f.w.eval(fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8'));
  f.w.__sfMediaItemsCache.set('spotify:playlist:abc',[{id:'spotify:track:cached',name:'Observed'}]);
  f.w.__sfCompleteNativePlaylistTokens.set('spotify:playlist:abc','Bearer synthetic');f.w.__sfMelodixBridgeCompleted=false;
  f.w.__sfOpenCollection('spotify:playlist:abc');assert.equal(received.length,1);assert.equal(received[0].rows[0].uri,'spotify:track:cached');assert.equal(f.calls.length,0);
 }finally{f.close()}
});
