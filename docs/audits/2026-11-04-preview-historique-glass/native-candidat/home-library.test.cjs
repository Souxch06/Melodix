// Real candidate JS plus interpreted Smali guards with synthetic DOM/data only.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
const smali=process.env.MELODIX_SMALI_ROOT || root;
if(!root) throw new Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const scrape=fs.readFileSync(path.join(root,'assets/native_home_scrape.js'),'utf8');
function boot(route, html, extra={}) {
 const dom=new JSDOM(`<!doctype html><html><body>${html}</body></html>`,{url:'https://open.spotify.com'+route});
 const calls=[],timers=[];
 dom.window.document.addEventListener=()=>{}; // prevent unrelated JSDOM lifecycle events
 const w={location:{hostname:'open.spotify.com',pathname:route,href:'https://open.spotify.com'+route,assign(){}},
  AndBridge:{onNativeUiData:(screen,json)=>calls.push({screen,rows:JSON.parse(json)}),onNativeUiReady(){},onNativeUiRoute(){}},
  addEventListener(){},setTimeout(fn,ms){timers.push({fn,ms});return timers.length},clearTimeout(){},MutationObserver:class{observe(){}},...extra};
 vm.runInNewContext(shell,{window:w,document:dom.window.document,URL,console,Promise});
 assert.equal(w.__sfNativeUiShellCompleted,true);
 return {w,calls,timers,close:()=>dom.window.close()};
}
function latest(b,id){return b.calls.filter(x=>x.screen===id).at(-1)?.rows;}
function flushInitialUpdates(b){const initial=b.timers.filter(t=>t.ms===120);for(const t of initial)t.fn();b.timers.length=0;}
test('Liked Songs route never emits tracks as playlists',()=>{
 const b=boot('/collection/tracks','<main id="main-view"><a href="/track/a">Song A</a><a href="/artist/a">Artist</a></main>');
 try{assert.equal(latest(b,'media:playlists'),undefined);}finally{b.close()}
});
test('playlist DOM fallback excludes track, artist and album links',()=>{
 const b=boot('/collection/playlists','<main id="main-view"><a href="/playlist/p1">Playlist A</a><a href="/track/t1">Song A</a><a href="/album/a1">Album A</a><a href="/artist/r1">Artist A</a></main>');
 try{const rows=latest(b,'media:playlists');assert.equal(rows.length,1);assert.equal(rows[0].uri,'spotify:playlist:p1');}finally{b.close()}
});
test('album category includes albums only',()=>{
 const b=boot('/collection/albums','<main id="main-view"><a href="/playlist/p1">Playlist A</a><a href="/album/a1">Album A</a><a href="/track/t1">Song A</a></main>');
 try{const rows=latest(b,'media:albums');assert.equal(rows.length,1);assert.equal(rows[0].uri,'spotify:album:a1');}finally{b.close()}
});
test('unrecognised collection path does not impersonate playlists',()=>{
 const b=boot('/collection/unknown','<main id="main-view"><a href="/playlist/p1">Playlist A</a></main>');
 try{assert.equal(latest(b,'media:playlists'),undefined)}finally{b.close()}
});
test('Home schedules refresh immediately when async library warmup resolves',async()=>{
 let resolve;const waiting=new Promise(r=>{resolve=r});let b;
 b=boot('/','<main id="main-view"></main>',{checkMediaLib(){return waiting;}});
 try {
  assert.equal(latest(b,'home')?.length,0);
  flushInitialUpdates(b);
  b.w.mediaLib={playlists:[{id:'spotify:playlist:fake',name:'Fictive'}]};resolve();
  await Promise.resolve();await Promise.resolve();
  const update=b.timers.find(t=>t.ms===120);assert.ok(update,'completed warmup schedules UI refresh');
  update.fn();assert.equal(latest(b,'home')[0].uri,'spotify:playlist:fake');
 }finally{b.close()}
});
test('Home warmup stays silent on another route after resolution',async()=>{
 let resolve;const waiting=new Promise(r=>{resolve=r});const b=boot('/','<main id="main-view"></main>',{checkMediaLib(){return waiting;}});
 try{flushInitialUpdates(b);b.w.location.pathname='/collection/tracks';b.w.location.href='https://open.spotify.com/collection/tracks';b.w.mediaLib={playlists:[{id:'spotify:playlist:fake',name:'Fictive'}]};resolve();await Promise.resolve();await Promise.resolve();assert.ok(!b.timers.some(t=>t.ms===120));}finally{b.close()}
});
test('scrape ignores non-Home routes even if cached rows exist',()=>{
 const dom=new JSDOM('<a href="/track/t1">Track</a>',{url:'https://open.spotify.com/collection/tracks',runScripts:'outside-only'});
 try{dom.window.__sfNativeHomeRowsJson='[{"title":"cached"}]';assert.equal(JSON.stringify(dom.window.eval(scrape)),'[]')}finally{dom.window.close()}
});
test('scrape keeps real Home cache on locale Home route',()=>{
 const dom=new JSDOM('',{url:'https://open.spotify.com/intl-fr/home',runScripts:'outside-only'});
 try{dom.window.__sfNativeHomeRowsJson='[{"title":"cached","uri":"spotify:playlist:a"}]';assert.equal(dom.window.eval(scrape)[0].title,'cached')}finally{dom.window.close()}
});
test('decoded Home callback accepts a JSON value and rejects literal null',()=>{
 const s=fs.readFileSync(path.join(smali,'smali/com/melodix/music/NativeHomeJsonCallback.smali'),'utf8');
 const m=s.match(/const-string (v\d+), "null"\s+invoke-virtual \{\1, (v\d+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z\s+move-result (v\d+)\s+if-(eqz|nez) \3, :([\w]+)/);
 assert.ok(m);assert.equal(m[4],'nez');assert.match(s,new RegExp(':'+m[5]+'(?:\\s+:[\\w]+)*\\s+return-void'));
});
