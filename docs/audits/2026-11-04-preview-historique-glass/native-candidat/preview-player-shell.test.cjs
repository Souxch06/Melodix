'use strict';
// Synthetic DOM/bridge only: no Spotify, Android, network or real audio.
const {test}=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
function fixture(customHtml){
 const html=customHtml || '<main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/abc123">Song</a></div><span data-testid="playback-position">0:00</span><span data-testid="playback-duration">2:00</span><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const errors=[], vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e.message));
 const dom=new JSDOM('<!doctype html><body>'+html+'</body>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:vc});
 const w=dom.window,events=[],intervals=[],commands=[];let t=0;
 w.fetch=()=>{throw Error('unexpected network')};
 w.AndBridge={onNativeUiData:(kind,json)=>events.push({kind,json}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.actPlayPause=value=>commands.push(value);
 w.setInterval=(fn,ms)=>{intervals.push({fn,ms});return intervals.length};w.clearInterval=()=>{};
 w.setTimeout=()=>1;w.clearTimeout=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 Object.defineProperty(w.performance,'now',{value:()=>t});
 w.eval(shell);
 return {w,events,commands,errors,step(ms){t+=ms;intervals.find(i=>i.ms===1000).fn()},payload(){return JSON.parse(events.filter(e=>e.kind==='player').at(-1).json)},close(){dom.window.close()}};
}
test('real shell publishes only observed identity and movement; freezes on unchanged position',()=>{
 const x=fixture();try{
  let p=x.payload();assert.equal(p.previewTrackUri,'spotify:track:abc123');assert.equal(p.previewProgressValid,true);assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('[data-testid="playback-position"]').textContent='0:01';x.step(1000);p=x.payload();assert.equal(p.previewPositionMs,1000);assert.equal(p.previewAdvancing,true);
  x.step(1000);p=x.payload();assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('[data-testid="now-playing-bar"] a').removeAttribute('href');x.step(1000);p=x.payload();
  assert.equal(p.previewTrackUri,'');assert.equal(p.previewProgressValid,true);assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('[data-testid="playback-duration"]').textContent='';x.step(1000);p=x.payload();assert.equal(p.previewProgressValid,false);
 }finally{x.close()}
});
test('explicit playback target invokes the simulated existing command once without a scheduled retry',()=>{
 const x=fixture();try{
  x.events.length=0;x.w.__sfTogglePlayback(false);
  assert.deepEqual(x.commands,[false]);assert.equal(x.events.filter(e=>e.kind==='preview-command').length,1);
  x.step(1000);x.step(1000);assert.deepEqual(x.commands,[false]);
  assert.ok(x.events.filter(e=>e.kind==='preview-command').every(e=>e.json===''));
 }finally{x.close()}
});

test('reads the existing player slider in milliseconds without network or a second command',()=>{
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/abc123">Song</a></div><div data-testid="playback-progressbar"><input type="range" min="0" max="141000" value="38000"></div><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const x=fixture(html);try{
  let p=x.payload();assert.equal(p.previewProgressSource,'range');assert.equal(p.previewPositionMs,38000);assert.equal(p.previewDurationMs,141000);
  x.w.document.querySelector('input').setAttribute('value','39000');x.step(1000);p=x.payload();assert.equal(p.previewPositionMs,39000);assert.equal(p.previewAdvancing,true);assert.deepEqual(x.commands,[]);
 }finally{x.close()}
});
test('anonymous slider samples stay directly observed and never animate across an unknown track',()=>{
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><span data-testid="context-item-link">Song</span></div><div data-testid="playback-progressbar"><input type="range" min="0" max="120000" value="22000"></div><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const x=fixture(html);try{
  let p=x.payload();assert.equal(p.previewTrackUri,'');assert.equal(p.previewProgressValid,true);assert.equal(p.previewPositionMs,22000);assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('input').setAttribute('value','23000');x.step(1000);p=x.payload();assert.equal(p.previewPositionMs,23000);assert.equal(p.previewAdvancing,false);
 }finally{x.close()}
});
test('percent and incomplete sliders are not invented as millisecond durations',()=>{
 for(const attrs of ['max="100" value="38"','max="120000"','value="38000"','min="20" max="120000" value="38000"','max="120000" value=""','max="120000" value="999999"']) {
  const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/abc123">Song</a></div><div data-testid="playback-progressbar"><input type="range" '+attrs+'></div><button data-testid="control-button-playpause" aria-label="Pause"></button>';
  const x=fixture(html);try{const p=x.payload();assert.equal(p.previewProgressValid,false);assert.equal(p.previewProgressSource,'none');}finally{x.close()}
 }
});

test('position and duration are accepted only from one complete source',()=>{
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a href="/track/abc123">Song</a></div><span data-testid="playback-position">0:20</span><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const x=fixture(html);try{
  const p=x.payload();assert.equal(p.previewProgressValid,false);assert.equal(p.previewProgressSource,'none');
 }finally{x.close()}
});
test('switching sources cannot count as observed movement',()=>{
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a href="/track/abc123">Song</a></div><span data-testid="playback-position">0:20</span><span data-testid="playback-duration">2:00</span><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const x=fixture(html);try{
  assert.equal(x.payload().previewProgressSource,'clock');
  const n=x.w.document.createElement('div');n.setAttribute('data-testid','playback-progressbar');n.innerHTML='<input type="range" max="120000" value="21000">';x.w.document.body.append(n);
  x.step(1000);assert.equal(x.payload().previewProgressSource,'range');assert.equal(x.payload().previewAdvancing,false);
 }finally{x.close()}
});

test('library and playlist browsing never reload or issue playback when playing is false or unknown',()=>{
 for (const label of ['Play','', 'Pause']) {
  const html='<main id="main-view"></main><button data-testid="control-button-playpause" aria-label="'+label+'"></button>';
  const x=fixture(html);try{
   let navigation=0;x.w.__sfNativeOpenUri=()=>{navigation++;return true};
   const before=x.w.location.href;
   assert.equal(x.w.__sfOpenLibrary(),false);
   assert.equal(x.w.__sfOpenCollection('spotify:playlist:abc123'),true);
   assert.equal(x.w.location.href,before);assert.equal(navigation,0);assert.deepEqual(x.commands,[]);assert.ok(!x.errors.some(e=>/navigation/i.test(e)));
   const lib=x.events.filter(e=>e.kind==='media:playlists').at(-1);
   const detail=x.events.filter(e=>e.kind==='detail').at(-1);
   assert.match(JSON.parse(lib.json)[0].title,/indisponible/);
   assert.equal(detail,undefined);assert.ok(x.events.some(e=>e.kind==='preview-load' && e.json==='waiting-bridge:no-token'));
  }finally{x.close()}
 }
});

test('late playlist response remains eligible after the non-destructive timeout',()=>{
 const x=fixture();try{
  let timer, navigation=0, request;
  x.w.setTimeout=(fn,ms)=>{if(ms===6000)timer=fn;return 1};
  x.w.__sfMelodixBridgeStarted=true;
  x.w.fetchMediaItems=(uri,id)=>{request={uri,id};return new Promise(()=>{})};
  x.w.__sfNativeOpenUri=()=>{navigation++;return true};
  assert.equal(x.w.__sfOpenCollection('spotify:playlist:abc123'),true);
  assert.ok(timer);timer();assert.equal(navigation,0);assert.deepEqual(x.commands,[]);
  x.w.__sfNativeCollectionLoaded(request.uri,request.id);
  assert.equal(x.w.__sfNativeCollectionHasData,true);
 }finally{x.close()}
});

test('live slider property updates are read even if its initial value attribute is stale',()=>{
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/abc123">Song</a></div><div data-testid="playback-progressbar"><input type="range" min="0" max="141000" value="38000"></div><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const x=fixture(html);try {
  const slider=x.w.document.querySelector('input');
  assert.equal(x.payload().previewPositionMs,38000);
  slider.value='39000';assert.equal(slider.getAttribute('value'),'38000');
  x.step(1000);assert.equal(x.payload().previewPositionMs,39000);assert.equal(x.payload().previewAdvancing,true);
 }finally{x.close()}
});
test('search submitted after a late bridge start uses the bridge without page navigation',()=>{
 const x=fixture();try {
  assert.equal(typeof x.w.__sfSubmitSearch,'function');
  let queries=[];x.w.__sfMelodixBridgeStarted=true;x.w.searchMediaItems=q=>queries.push(q);
  let href=x.w.location.href;assert.equal(x.w.__sfSubmitSearch('  Nina  '),true);
  assert.deepEqual(queries,['Nina']);assert.equal(x.w.location.href,href);assert.deepEqual(x.commands,[]);
  assert.ok(!x.errors.some(e=>/navigation/i.test(e)));
 }finally{x.close()}
});
