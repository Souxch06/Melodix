'use strict';
// Actual patched shell, simulated network and timers: not a Spotify/device benchmark.
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs'), path=require('node:path'), {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const tick=()=>new Promise(r=>setImmediate(r));
const response=(id='one')=>({ok:true,json:async()=>({data:{playlistV2:{content:{items:[{itemV2:{data:{uri:'spotify:track:'+id,name:'Titre '+id,artists:{items:[{profile:{name:'Artiste'}}]}}}}]}}}})});
function setup(fetcher,token='Bearer A'){
 const dom=new JSDOM('<main id="main-view"><section><a href="/playlist/a">Liste A</a><a href="/playlist/b">Liste B</a></section></main><button data-testid="control-button-playpause" aria-label="Pause"></button>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[],timers=[],calls=[],commands=[];let seq=0;
 w.spotAuthToken=token;w.__sfMelodixBridgeCompleted=true;w.fetchMediaItems=()=>new Promise(()=>{});
 w.AndBridge={onNativeUiData:(id,data)=>events.push({id,data}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.fetch=(u,o)=>{calls.push({u,o});return fetcher(u,o)};w.actPlayPause=(...a)=>commands.push(a);w.playFromUri=(...a)=>commands.push(a);
 w.setTimeout=(fn,ms)=>{const t={id:++seq,fn,ms,cleared:false};timers.push(t);return t.id};w.clearTimeout=id=>{const t=timers.find(t=>t.id===id);if(t)t.cleared=true};
 w.setInterval=()=>1;w.clearInterval=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 w.eval(shell);
 return {w,events,timers,calls,commands,run(ms){const t=timers.find(t=>t.ms===ms&&!t.cleared);assert.ok(t,'timer '+ms);t.cleared=true;t.fn()},rows(id){return events.filter(e=>e.id===id).map(e=>JSON.parse(e.data))},close(){dom.window.close()}};
}
test('preloads a visible playlist, shows labelled snapshot immediately, refreshes in foreground and never plays',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{
  f.run(2500);for(let i=0;i<6;i++)await tick();assert.equal(f.calls.length,1);assert.equal(JSON.parse(f.calls[0].o.body).variables.uri,'spotify:playlist:a');
  f.w.__sfOpenCollection('spotify:playlist:a');const rows=f.rows('media:spotify:playlist:a').at(-1);assert.equal(rows[0].uri,'spotify:track:one');assert.match(rows.at(-1).title,/Aperçu préchargé/);assert.equal(f.commands.length,0);
 }finally{f.close()}
});
test('token changes reject snapshots, and another playlist never uses it',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{f.run(2500);for(let i=0;i<6;i++)await tick();f.w.spotAuthToken='Bearer B';f.w.__sfOpenCollection('spotify:playlist:a');assert.equal(f.rows('media:spotify:playlist:a').length,0);f.w.__sfOpenCollection('spotify:playlist:b');assert.equal(f.rows('media:spotify:playlist:b').length,0);}finally{f.close()}
});
test('opening a collection before the fetch microtask prevents background request',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{f.run(2500);f.w.__sfOpenCollection('spotify:playlist:b');for(let i=0;i<5;i++)await tick();assert.equal(f.calls.length,0);assert.equal(f.commands.length,0);}finally{f.close()}
});
test('late in-flight prefetch cannot publish across account change or a foreground open',async()=>{
 for(const change of [f=>{f.w.spotAuthToken='Bearer B'},f=>f.w.__sfOpenCollection('spotify:playlist:b')]){
  let resolve;const f=setup(()=>new Promise(r=>resolve=r));try{f.run(2500);await tick();change(f);resolve(response());for(let i=0;i<5;i++)await tick();f.w.__sfOpenCollection('spotify:playlist:a');assert.equal(f.rows('media:spotify:playlist:a').length,0);}finally{f.close()}
 }
});
test('rejected malformed and empty responses do not manufacture playlists',async()=>{
 for(const value of [{ok:false,status:403},{ok:true,json:async()=>({errors:[{}]})},{ok:true,json:async()=>({data:{playlistV2:{content:{items:[]}}}})}]){
  const f=setup(()=>Promise.resolve(value));try{f.run(2500);for(let i=0;i<5;i++)await tick();f.w.__sfOpenCollection('spotify:playlist:a');assert.equal(f.rows('media:spotify:playlist:a').length,0);}finally{f.close()}
 }
});

test('stale snapshot expires after two minutes and on a backwards clock',async()=>{
 for(const delta of [120001,-1]){const f=setup(()=>Promise.resolve(response()));try{
  let now=1000000;f.w.Date.now=()=>now;f.run(2500);for(let i=0;i<6;i++)await tick();now+=delta;f.w.__sfOpenCollection('spotify:playlist:a');assert.equal(f.rows('media:spotify:playlist:a').length,0);
 }finally{f.close()}}
});
test('a failed refresh preserves labelled stale preview and offers retry',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{
  f.run(2500);for(let i=0;i<6;i++)await tick();f.w.fetchMediaItems=()=>Promise.reject(Error('failed'));f.w.__sfOpenCollection('spotify:playlist:a');for(let i=0;i<6;i++)await tick();
  const rows=f.rows('media:spotify:playlist:a').at(-1);assert.match(rows.at(-2).title,/Actualisation indisponible/);assert.equal(rows.at(-1).uri,'melodix:retry-collection');
 }finally{f.close()}
});
test('prefetch is serial and capped at six first pages per account',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{
  const section=f.w.document.querySelector('section');for(let i=0;i<10;i++){const a=f.w.document.createElement('a');a.href='/playlist/p'+i;a.textContent='List '+i;section.append(a)}
  f.w.__sfNativeUiRefresh();
  for(let i=0;i<6;i++){f.run(2500);for(let j=0;j<5;j++)await tick()}
  const before=f.calls.length;for(const t of f.timers.filter(t=>t.ms===2500&&!t.cleared)){t.cleared=true;t.fn();for(let j=0;j<3;j++)await tick()}
  assert.equal(before,6);assert.equal(f.calls.length,6);assert.ok(f.calls.every(c=>JSON.parse(c.o.body).variables.limit===50));assert.equal(f.commands.length,0);
 }finally{f.close()}
});

test('waits for bridge completion before prefetch without blocking Home',async()=>{
 const f=setup(()=>Promise.resolve(response()));try{
  f.w.__sfMelodixBridgeCompleted=false;f.run(2500);await tick();assert.equal(f.calls.length,0);
  f.w.__sfMelodixBridgeCompleted=true;f.run(2500);for(let i=0;i<5;i++)await tick();assert.equal(f.calls.length,1);
 }finally{f.close()}
});
test('foreground bridge publishes full playlist after snapshot without merging stale pages',async()=>{
 const f=setup(()=>Promise.resolve(response('old')));try{
  f.run(2500);for(let i=0;i<6;i++)await tick();
  f.w.fetchMediaItems=(id,requestId)=>{f.w.AndBridge.onNativeUiData('media:'+id,JSON.stringify([{title:'Nouveau',uri:'spotify:track:new'},{title:'Deux',uri:'spotify:track:two'}]));f.w.__sfNativeCollectionLoaded(id,requestId);return Promise.resolve()};
  f.w.__sfOpenCollection('spotify:playlist:a');for(let i=0;i<5;i++)await tick();
  const all=f.rows('media:spotify:playlist:a');assert.equal(all[0][0].uri,'spotify:track:old');assert.deepEqual(all.at(-1).map(r=>r.uri),['spotify:track:new','spotify:track:two']);
 }finally{f.close()}
});
