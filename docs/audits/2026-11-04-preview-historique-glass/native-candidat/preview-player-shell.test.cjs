'use strict';
// Synthetic DOM/bridge only: no Spotify, Android, network or real audio.
const {test}=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'),path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
function fixture(){
 const html='<main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/abc123">Song</a></div><span data-testid="playback-position">0:00</span><span data-testid="playback-duration">2:00</span><button data-testid="control-button-playpause" aria-label="Pause"></button>';
 const dom=new JSDOM('<!doctype html><body>'+html+'</body>',{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[],intervals=[],commands=[];let t=0;
 w.fetch=()=>{throw Error('unexpected network')};
 w.AndBridge={onNativeUiData:(kind,json)=>events.push({kind,json}),onNativeUiReady(){},onNativeUiRoute(){}};
 w.actPlayPause=value=>commands.push(value);
 w.setInterval=(fn,ms)=>{intervals.push({fn,ms});return intervals.length};w.clearInterval=()=>{};
 w.setTimeout=()=>1;w.clearTimeout=()=>{};w.MutationObserver=class{observe(){}disconnect(){}};
 Object.defineProperty(w.performance,'now',{value:()=>t});
 w.eval(shell);
 return {w,events,commands,step(ms){t+=ms;intervals.find(i=>i.ms===1000).fn()},payload(){return JSON.parse(events.filter(e=>e.kind==='player').at(-1).json)},close(){dom.window.close()}};
}
test('real shell publishes only observed identity and movement; freezes on unchanged position',()=>{
 const x=fixture();try{
  let p=x.payload();assert.equal(p.previewTrackUri,'spotify:track:abc123');assert.equal(p.previewProgressValid,true);assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('[data-testid="playback-position"]').textContent='0:01';x.step(1000);p=x.payload();assert.equal(p.previewPositionMs,1000);assert.equal(p.previewAdvancing,true);
  x.step(1000);p=x.payload();assert.equal(p.previewAdvancing,false);
  x.w.document.querySelector('[data-testid="now-playing-bar"] a').removeAttribute('href');x.step(1000);p=x.payload();assert.equal(p.previewProgressValid,false);
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
