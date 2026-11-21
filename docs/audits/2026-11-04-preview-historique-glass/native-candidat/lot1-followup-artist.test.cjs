'use strict';
// Real bundled shell in a synthetic DOM. No network, Spotify session, Android or ART.
const test=require('node:test'),assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
function fixture(html){
 const dom=new JSDOM('<!doctype html><body><main id="main-view"></main>'+html+'</body>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[],intervals=[];
 w.fetch=()=>{throw Error('unexpected network')};
 w.AndBridge={onNativeUiData:(kind,json)=>{if(kind==='player')events.push(JSON.parse(json))},onNativeUiReady(){},onNativeUiRoute(){}};
 w.setInterval=(fn,ms)=>{intervals.push({fn,ms});return intervals.length};w.clearInterval=()=>{};w.setTimeout=()=>1;w.clearTimeout=()=>{};
 w.MutationObserver=class{observe(){}disconnect(){}};
 w.eval(shell);assert.equal(w.__sfNativeUiShellCompleted,true);
 return {w,events,tick:()=>intervals.find(x=>x.ms===1000).fn(),close:()=>dom.window.close()};
}
test('artist link already in now-playing bar is shown without requests',()=>{
 const x=fixture('<div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/one">Song</a><a href="/artist/one">YXMI</a></div>');
 try{assert.equal(x.events.at(-1).track,'Song');assert.equal(x.events.at(-1).artist,'YXMI')}finally{x.close()}
});
test('late artist arrives and transient DOM removal retains only the same identified track',()=>{
 const x=fixture('<div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/one">Song</a></div>');
 try{
  assert.equal(x.events.at(-1).artist,'');const bar=x.w.document.querySelector('[data-testid="now-playing-bar"]');
  const a=x.w.document.createElement('a');a.href='/artist/one';a.textContent='YXMI';bar.appendChild(a);x.tick();assert.equal(x.events.at(-1).artist,'YXMI');
  a.remove();x.tick();assert.equal(x.events.at(-1).artist,'YXMI');
  const track=bar.querySelector('[data-testid="context-item-link"]');track.href='/track/two';track.textContent='Other';x.tick();
  assert.equal(x.events.at(-1).track,'Other');assert.equal(x.events.at(-1).artist,'');
 }finally{x.close()}
});
test('no bar or unidentifiable track never borrows an unrelated playlist artist',()=>{
 let x=fixture('<div><a data-testid="context-item-link">Song</a><a href="/artist/wrong">Wrong</a></div>');
 try{assert.equal(x.events.at(-1).artist,'')}finally{x.close()}
 x=fixture('<div data-testid="now-playing-bar"><a data-testid="context-item-link">Song</a><a href="/artist/one">One</a></div>');
 try{const a=x.w.document.querySelector('a[href*="/artist/"]');a.remove();x.tick();assert.equal(x.events.at(-1).artist,'')}finally{x.close()}
});
