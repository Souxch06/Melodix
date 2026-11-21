'use strict';
// Synthetic DOM only, no Spotify, Android or playback.
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('fs'),path=require('path');
const {JSDOM,VirtualConsole}=require('jsdom');
const shell=fs.readFileSync(path.join(process.env.MELODIX_CANDIDATE_ROOT,'assets/native_ui_shell.js'),'utf8');
function boot(route,content,label='Pause') {
 const dom=new JSDOM('<!doctype html><button data-testid="user-widget-link"></button><button data-testid="control-button-playpause" aria-label="'+label+'"></button><main id="main-view">'+content+'</main>',{url:'https://open.spotify.com'+route,runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[],navigation=[],requests=[];let resolve;
 w.fetch=()=>{throw Error('network forbidden')};w.setTimeout=()=>1;w.clearTimeout=()=>{};w.setInterval=()=>1;w.clearInterval=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 w.AndBridge={onNativeUiData:(id,data)=>events.push({id,data}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.eval(shell);w.__sfMelodixBridgeStarted=true;w.__sfMelodixBridgeCompleted=true;
 w.__sfNativeOpenUri=u=>{navigation.push(u);return true};w.fetchMediaItems=(u,id)=>{requests.push([u,id]);return new Promise(r=>{resolve=r})};
 return {w,events,navigation,requests,resolve:()=>resolve(),close:()=>dom.window.close(),detail:()=>events.filter(e=>e.id==='detail').map(e=>JSON.parse(e.data)).at(-1)};
}
const tick=async()=>{for(let i=0;i<10;i++)await Promise.resolve()};
const row='<div data-testid="tracklist-row"><a href="/track/abc">Titre réel</a><a href="/artist/def">Artiste</a></div>';
test('pending liked URL is canonicalized and empty bridge cannot erase its observed DOM rows',async()=>{
 const x=boot('/collection/tracks','<h1>Likés</h1>'+row);try{
  x.w.__sfOpenCollection('spotify:collection:tracks');x.w.__sfNativeUiRefresh();
  assert.equal(x.detail()[0].title,'Titre réel');assert.equal(x.detail()[0].uri,'spotify:track:abc');
  assert.equal(x.w.__sfNativeCollectionDomReady,true);assert.equal(x.requests.length,1);
  x.resolve();await tick();assert.equal(x.detail()[0].title,'Titre réel');assert.deepEqual(x.navigation,[]);assert.equal(x.requests.length,1);
 }finally{x.close()}
});
test('other visible route cannot satisfy a pending liked request',()=>{
 const x=boot('/playlist/old','<h1>Ancien</h1>'+row);try{
  x.w.__sfOpenCollection('spotify:collection:tracks');x.events.length=0;x.w.__sfNativeUiRefresh();
  assert.equal(x.events.some(e=>e.id==='detail'),false);assert.ok(x.events.some(e=>e.id==='preview-phase'&&e.data==='liked-route-other'));
 }finally{x.close()}
});
test('ready empty liked page offers manual retry, then shows rows that appear',async()=>{
 const x=boot('/collection/tracks','<h1>Likés</h1>');try{
  x.w.__sfNativeUiRefresh();assert.equal(x.detail()[0].title,'Titres likés indisponibles');assert.equal(x.detail()[1].uri,'melodix:retry-collection');
  assert.equal(x.requests.length,0);assert.equal(x.w.__sfRetryCollection(),true);assert.equal(x.requests.length,1);
  x.w.document.querySelector('main').insertAdjacentHTML('beforeend',row);x.w.__sfNativeUiRefresh();
  assert.equal(x.detail()[0].title,'Titre réel');x.resolve();await tick();assert.equal(x.detail()[0].title,'Titre réel');assert.equal(x.requests.length,1);assert.deepEqual(x.navigation,[]);
 }finally{x.close()}
});
test('playing empty liked response shows unavailable and retry without navigation or auto retry',async()=>{
 const x=boot('/search','');try{
  x.w.__sfOpenCollection('spotify:collection:tracks');x.resolve();await tick();
  assert.equal(x.detail()[0].title,'Titres indisponibles');assert.match(x.detail()[0].subtitle,/Titres likés indisponibles/);assert.equal(x.detail()[1].title,'Réessayer');assert.deepEqual(x.navigation,[]);assert.equal(x.requests.length,1);
  x.w.__sfRetryCollection();assert.equal(x.requests.length,2);assert.deepEqual(x.navigation,[]);
 }finally{x.close()}
});
test('paused empty liked response can use the historical navigation once',async()=>{
 const x=boot('/search','','Play');try{
  x.w.__sfOpenCollection('spotify:collection:tracks');x.resolve();await tick();assert.deepEqual(x.navigation,['spotify:collection:tracks']);assert.equal(x.requests.length,1);
 }finally{x.close()}
});
