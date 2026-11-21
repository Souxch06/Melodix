'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path'),vm=require('node:vm');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const {run}=require('../native-routing-characterization.test.cjs');
function boot({html='<main id="main-view"></main>',token='Bearer A',mediaLib=null,extra={}}={}) {
 const dom=new JSDOM('<!doctype html><body><button data-testid="user-widget-link"></button>'+html+'</body>',{url:'https://open.spotify.com/'});dom.window.document.addEventListener=()=>{};
 let now=100000,next=0;const timers=[],calls=[],navigations=[];
 class Clock extends Date{static now(){return now}}
 const w={location:{hostname:'open.spotify.com',pathname:'/',href:'https://open.spotify.com/',assign:x=>navigations.push(x)},spotAuthToken:token,mediaLib,
  AndBridge:{onNativeUiData:(screen,data)=>calls.push({screen,data}),onNativeHomeRows:data=>calls.push({screen:'dedicated-home',data}),onNativeUiReady(){},onNativeUiRoute(){}},addEventListener(){},
  setTimeout(fn,ms){const t={id:++next,fn,ms,cancelled:false};timers.push(t);return t.id},clearTimeout(id){let t=timers.find(t=>t.id===id);if(t)t.cancelled=true},MutationObserver:class{observe(){}disconnect(){}},...extra};
 vm.runInNewContext(shell,{window:w,document:dom.window.document,URL,console,Promise,Date:Clock});assert.equal(w.__sfNativeUiShellCompleted,true);
 return {w,document:dom.window.document,calls,timers,navigations,advance(ms){now+=ms},close:()=>dom.window.close()};
}
function latest(b,id){const x=b.calls.filter(c=>c.screen===id).at(-1);return x?JSON.parse(x.data):null}
const album=(n,id)=>({name:n,id:'spotify:album:'+id});
const play=(n,id)=>({name:n,id:'spotify:playlist:'+id,image:'https://i.scdn.co/image/'+id});
const lib={playlists:[{name:'Titres likés',id:'spotify:collection:tracks',image:'https://misc.scdn.co/liked-songs/liked-songs-640.png'},play('Flex','flex')],albums:[album('Saved album','album1')]};
const html='<main id="main-view"><section><h2>Mix public</h2><a href="/playlist/public"><img src="https://i.scdn.co/image/p">Public</a><a href="/track/t">Track public</a></section></main>';
test('real personal Home data reaches library even without sidebar or bridge',()=>{
 const b=boot({html,mediaLib:lib});try{
  assert.deepEqual(latest(b,'home').filter(r=>r.section==='Vos playlists').map(r=>r.uri),['spotify:collection:tracks','spotify:playlist:flex']);
  b.w.__sfOpenLibrary();const result=latest(b,'media:playlists');assert.deepEqual(result.map(r=>r.uri),['spotify:collection:tracks','spotify:playlist:flex']);
  assert.ok(!result.some(r=>r.uri==='spotify:playlist:public'||r.uri==='spotify:track:t'));assert.equal(b.navigations.length,0);
  const native=run('media:playlists',JSON.stringify(result),{nativeCurrentScreen:'library',nativeExpectedId:'playlists'});assert.equal(native.renders.length,1);assert.equal(native.renders[0].payload,JSON.stringify(result));
 }finally{b.close()}
});
test('playlist filter includes exact Liked Songs URL but not individual tracks or other collection paths',()=>{
 const b=boot({html:'<main id="main-view"></main><nav id="Desktop_LeftSidebar_Id"><a href="/collection/tracks">Liked</a><a href="/playlist/a">A</a><a href="/track/x">X</a><a href="/collection/albums">Albums</a></nav>',token:null});try{b.w.__sfOpenLibrary();assert.deepEqual(latest(b,'media:playlists').map(r=>r.uri),['spotify:collection:tracks','spotify:playlist:a'])}finally{b.close()}
});
test('different category uses only corresponding Home section and native expected ID guard',()=>{
 const b=boot({mediaLib:lib});try{b.w.__sfOpenLibraryCategory('albums');const rows=latest(b,'media:albums');assert.deepEqual(rows.map(r=>r.uri),['spotify:album:album1']);assert.equal(run('media:albums',JSON.stringify(rows),{nativeCurrentScreen:'library',nativeExpectedId:'playlists'}).renders.length,0)}finally{b.close()}
});
test('short-lived source disappearance retains original Home rows without false additions',()=>{
 const b=boot({html,mediaLib:lib});try{let before=latest(b,'home');b.document.querySelector('#main-view').replaceChildren();b.w.mediaLib={playlists:[],albums:[]};b.advance(2000);b.w.__sfNativeUiRefresh();assert.deepEqual(latest(b,'home'),before);assert.ok(b.timers.some(t=>t.ms===13000&&!t.cancelled));}finally{b.close()}
});
test('missing rows expire after 15 seconds rather than remaining stale forever',()=>{
 const b=boot({html,mediaLib:lib});try{b.document.querySelector('#main-view').replaceChildren();b.w.mediaLib={playlists:[],albums:[]};b.advance(2000);b.w.__sfNativeUiRefresh();b.advance(13001);b.w.__sfNativeUiRefresh();assert.deepEqual(latest(b,'home'),[])}finally{b.close()}
});
test('partial changes do not duplicate rows and preserve section order',()=>{
 const b=boot({html,mediaLib:lib});try{b.document.querySelector('a[href="/track/t"]').remove();const n=b.document.createElement('a');n.href='/playlist/new';n.textContent='New';b.document.querySelector('section').appendChild(n);b.advance(1000);b.w.__sfNativeUiRefresh();const rows=latest(b,'home');assert.equal(new Set(rows.map(r=>r.uri)).size,rows.length);assert.ok(rows.some(r=>r.uri==='spotify:track:t'));assert.ok(rows.some(r=>r.uri==='spotify:playlist:new'));assert.deepEqual(rows.map(r=>r.section).filter((v,i,a)=>a.indexOf(v)===i),['Vos playlists','Albums enregistrés','Mix public'])}finally{b.close()}
});
test('token change removes the old in-memory cache and old-token mediaLib from Home and Library',()=>{
 const b=boot({mediaLib:lib,extra:{__sfNativeMediaTokenMatches(){return b.w.spotAuthToken==='Bearer A'}}});
 try{b.w.spotAuthToken='Bearer B';b.w.__sfNativeUiRefresh();assert.deepEqual(latest(b,'home'),[]);b.w.__sfOpenLibrary();assert.equal(latest(b,'media:playlists'),null)}finally{b.close()}
});
test('without a bearer token Home snapshots are not reused',()=>{
 const b=boot({mediaLib:lib,token:null});try{b.w.mediaLib={playlists:[],albums:[]};b.w.__sfNativeUiRefresh();assert.deepEqual(latest(b,'home'),[]);b.w.__sfOpenLibrary();assert.equal(latest(b,'media:playlists'),null)}finally{b.close()}
});
test('late empty bridge result restores real fallback, and does not make up data',async()=>{
 let finish;const gate=new Promise(r=>finish=r);const b=boot({mediaLib:lib});
 try{b.w.__sfMelodixBridgeStarted=true;b.w.fetchMediaItems=()=>gate;b.w.__sfOpenLibrary();assert.equal(latest(b,'media:playlists').length,2);b.w.mediaLib={playlists:[]};b.w.AndBridge.onNativeUiData('media:playlists','[]');finish();await Promise.resolve();await Promise.resolve();assert.equal(latest(b,'media:playlists').length,2)}finally{b.close()}
});
test('a late fallback cannot replace a different selected library category',async()=>{
 let finish;const gate=new Promise(r=>finish=r);const b=boot({mediaLib:lib});
 try{b.w.__sfMelodixBridgeStarted=true;b.w.fetchMediaItems=id=>id==='playlists'?gate:Promise.resolve();b.w.__sfOpenLibrary();b.w.__sfOpenLibraryCategory('albums');const n=b.calls.filter(x=>x.screen==='media:playlists').length;b.w.mediaLib={playlists:[],albums:[]};finish();await Promise.resolve();await Promise.resolve();assert.equal(b.calls.filter(x=>x.screen==='media:playlists').length,n)}finally{b.close()}
});
test('sidebar loaded after opening Library is emitted once without unrelated recommendations',()=>{
 const b=boot({html:'<main id="main-view"><a href="/playlist/recommendation">Recommended</a></main><nav id="Desktop_LeftSidebar_Id"></nav>',mediaLib:null});
 try{b.w.__sfMelodixBridgeStarted=true;b.w.fetchMediaItems=()=>new Promise(()=>{});b.w.__sfOpenLibrary();assert.equal(latest(b,'media:playlists'),null);b.document.querySelector('nav').innerHTML='<a href="/playlist/mine">Mine</a>';b.w.__sfNativeUiRefresh();assert.deepEqual(latest(b,'media:playlists').map(r=>r.uri),['spotify:playlist:mine']);const n=b.calls.filter(c=>c.screen==='media:playlists').length;b.w.__sfNativeUiRefresh();assert.equal(b.calls.filter(c=>c.screen==='media:playlists').length,n)}finally{b.close()}
});
test('Library copies currently observed Home personal rows even before a token is intercepted',()=>{
 const b=boot({html,mediaLib:lib,token:null});try{b.w.__sfOpenLibrary();assert.deepEqual(latest(b,'media:playlists').map(r=>r.uri),['spotify:collection:tracks','spotify:playlist:flex']);assert.ok(!latest(b,'media:playlists').some(r=>r.uri==='spotify:playlist:public'))}finally{b.close()}
});
test('Home sends one native callback per update rather than duplicate painters',()=>{
 const b=boot({html,mediaLib:lib});try{const frames=b.calls.filter(c=>c.screen==='home');assert.equal(frames.length,1);assert.equal(b.calls.filter(c=>c.screen==='dedicated-home').length,0);const native=run('home',frames[0].data,{nativeCurrentScreen:'home'});assert.equal(native.renders.length,1);assert.equal(JSON.parse(native.renders[0].payload).length,latest(b,'home').length)}finally{b.close()}
});
