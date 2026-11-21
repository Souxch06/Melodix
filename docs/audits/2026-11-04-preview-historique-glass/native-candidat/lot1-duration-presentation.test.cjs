'use strict';
// Synthetic DOM only; no real Spotify service or Android WebView.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
function fixture(){
 const dom=new JSDOM('<!doctype html><body><main id="main-view"></main></body>',{url:'https://open.spotify.com/playlist/demo',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,calls=[];
 w.AndBridge={onNativeUiData:(kind,json)=>{let data;try{data=JSON.parse(json)}catch{data=json}calls.push({kind,data})},onNativeUiReady(){},onNativeUiRoute(){}};
 w.setTimeout=()=>1;w.setInterval=()=>1;w.clearTimeout=w.clearInterval=()=>{};
 w.eval(shell);assert.equal(w.__sfNativeUiShellCompleted,true);
 return {dom,w,calls,close:()=>dom.window.close()};
}
const cases=[['0:05','0:05'],['0:59','0:59'],['1:00','1:00'],['9:59','9:59'],['10:00','10:00'],['59:59','59:59'],['60:00','1:00:00'],['61:01','1:01:01']];
for(const [raw,want] of cases){
 test(`visible DOM playlist duration ${raw} → ${want}`,()=>{
  const x=fixture();try{
   x.w.document.querySelector('main').innerHTML=`<div data-testid="tracklist-row"><a href="/track/one">One</a><a href="/artist/a">Artist</a><span data-testid="tracklist-row-duration">${raw}</span></div>`;
   x.calls.length=0;x.w.__sfNativeUiRefresh();
   const result=x.calls.filter(c=>c.kind==='detail').at(-1).data;
   assert.equal(result[0].uri,'spotify:track:one');assert.equal(result[0].subtitle,`Artist • ${want}`);
  }finally{x.close()}
 });
 test(`legacy player presentation ${raw} → ${want}`,async()=>{
  const x=fixture();try{
   const player=x.w.document.createElement('div');player.innerHTML=`<span id="sf-fs-pos">${raw}</span><span id="sf-fs-dur">${raw}</span>`;
   x.w.document.body.appendChild(player);await Promise.resolve();
   assert.equal(x.w.document.querySelector('#sf-fs-pos').textContent,want);
   assert.equal(x.w.document.querySelector('#sf-fs-dur').textContent,want);
   player.firstElementChild.textContent='61:01';await Promise.resolve();
   assert.equal(player.firstElementChild.textContent,'1:01:01');
  }finally{x.close()}
 });
}
test('no fabricated durations, no row reordering, repeated tracks retained',()=>{
 const x=fixture();try{
  x.w.document.querySelector('main').innerHTML=`
   <div data-testid="tracklist-row"><a href="/track/repeat">First</a><a href="/artist/a">A</a><span>1999</span></div>
   <div data-testid="tracklist-row"><a href="/track/repeat">Second</a><span data-testid="track-duration">3:99</span></div>
   <div data-testid="tracklist-row"><a href="/track/last">Third</a><span data-testid="track-duration">61:01</span></div>`;
  x.calls.length=0;x.w.__sfNativeUiRefresh();const rows=x.calls.filter(c=>c.kind==='detail').at(-1).data.filter(r=>r.uri);
  assert.deepEqual(rows.map(r=>r.uri),['spotify:track:repeat','spotify:track:repeat','spotify:track:last']);
  assert.deepEqual(rows.map(r=>r.subtitle),['A','','1:01:01']);
 }finally{x.close()}
});
test('loaded bridge data still blocks partial DOM replacement',()=>{
 const x=fixture();try{
  x.w.document.querySelector('main').innerHTML='<div data-testid="tracklist-row"><a href="/track/one">One</a><span data-testid="track-duration">60:00</span></div>';
  x.w.__sfNativeCollectionHasData=true;x.calls.length=0;x.w.__sfNativeUiRefresh();
  assert.equal(x.calls.some(c=>c.kind==='detail'),false);
 }finally{x.close()}
});
test('unrelated clocks and invalid values are untouched',async()=>{
 const x=fixture();try{
  const wrap=x.w.document.createElement('div');wrap.innerHTML='<span id="other">60:00</span><span id="sf-fs-pos">99:99</span><span id="sf-fs-dur">live</span>';
  x.w.document.body.appendChild(wrap);await Promise.resolve();
  assert.equal(wrap.children[0].textContent,'60:00');assert.equal(wrap.children[1].textContent,'99:99');assert.equal(wrap.children[2].textContent,'live');
 }finally{x.close()}
});
