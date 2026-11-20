'use strict';
// Simulated page: checks the silent warm-up flow. Not a Spotify benchmark.
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const src=fs.readFileSync(path.join(__dirname,'preview-prewarm.js'),'utf8');
function setup(opts={}){
 const timers=[],media=[{muted:false},{muted:false}],calls=[];let playing=false;
 const doc={querySelectorAll:()=>media,querySelector:s=>opts.remote&&/connect-bar/.test(s)?{}:null,addEventListener(){},removeEventListener(){}};
 const w={setTimeout:(f,ms)=>{timers.push({f,ms});return timers.length},clearTimeout(){},
  actPlayPause:t=>{calls.push(t?'play':'pause');playing=!!t},actSeek:p=>calls.push('seek:'+p),
  __sfTogglePlayback:()=>{calls.push('toggle');return true}};
 const env={playPauseButton:()=>({}),readNowPlaying:()=>({title:opts.title?opts.title():'T'}),previewPlaybackState:()=>w.__sfPrewarmActive?'paused':(playing?'playing':'paused'),
  previewRealText:s=>s||'',previewSeekObservation:()=>42000,publishPlayerState:()=>calls.push('publish')};
 new Function('window','document',...Object.keys(env),src)(w,doc,...Object.values(env));
 const run=()=>{const t=timers.shift();t.f();};
 return {w,media,calls,timers,run};
}
test('warm-up: muted play, pause after 3 s, position restored, then unmuted',()=>{
 const x=setup();x.run();
 assert.deepEqual(x.calls,['play']);assert.ok(x.media.every(m=>m.muted));assert.equal(x.w.__sfPrewarmActive,true);
 x.timers.find(t=>t.ms===3000).f();
 assert.deepEqual(x.calls,['play','pause','seek:42000']);assert.equal(x.w.__sfPrewarmActive,true,'still paused until the pause lands');assert.ok(x.media.every(m=>m.muted));
 x.timers.find(t=>t.ms===400).f();assert.equal(x.w.__sfPrewarmActive,false);assert.ok(x.media.every(m=>!m.muted));
});
test('a play tap during the warm-up keeps playing and unmutes at once',()=>{
 const x=setup();x.run();assert.equal(x.w.__sfTogglePlayback(true),true);
 assert.deepEqual(x.calls,['play','publish']);x.timers.find(t=>t.ms===0).f();assert.ok(x.media.every(m=>!m.muted));
 x.timers.filter(t=>t.ms===3000).forEach(t=>t.f());assert.deepEqual(x.calls,['play','publish'],'no late pause');
});
test('playback on another device: no warm-up',()=>{
 const x=setup({remote:true});x.run();assert.deepEqual(x.calls,[]);assert.ok(x.media.every(m=>!m.muted));
});
test('an ad (title gone) during the warm-up stops it at once and restores sound',()=>{
 let title='T';const x=setup({title:()=>title});x.run();assert.deepEqual(x.calls,['play']);
 title='';x.timers.find(t=>t.ms===250).f();
 assert.deepEqual(x.calls,['play','pause','seek:42000']);
 x.timers.find(t=>t.ms===400).f();assert.equal(x.w.__sfPrewarmActive,false);assert.ok(x.media.every(m=>!m.muted));
});
test('sound comes back only once the page media is really paused (user report 1022302)',()=>{
 const x=setup();x.run();x.media.forEach(m=>{m.paused=false;});
 x.timers.find(t=>t.ms===3000).f();x.timers.find(t=>t.ms===400).f();
 assert.ok(x.media.every(m=>m.muted),'still playing: stays muted');assert.deepEqual(x.calls.filter(c=>c==='pause').length,2,'pause asked again');
 x.media.forEach(m=>{m.paused=true;});x.timers.filter(t=>t.ms===250).pop().f();
 assert.ok(x.media.every(m=>!m.muted));assert.equal(x.w.__sfPrewarmActive,false);
});
test('page refuses to pause: stays muted until the user taps Play/Pause',()=>{
 const x=setup();x.run();x.media.forEach(m=>{m.paused=false;});
 x.timers.find(t=>t.ms===3000).f();x.timers.find(t=>t.ms===400).f();
 for(let k=0;k<12;k++){const t=x.timers.filter(t=>t.ms===250).pop();if(t)t.f();}
 assert.ok(x.media.every(m=>m.muted));x.w.__sfTogglePlayback(false);assert.ok(x.media.every(m=>!m.muted));
});
