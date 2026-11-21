'use strict';
// Simulated page: checks the silent warm-up flow. Not a Spotify benchmark.
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const src=fs.readFileSync(path.join(__dirname,'preview-prewarm.js'),'utf8');
function setup(opts={}){
 const timers=[],media=[{muted:false},{muted:false}],calls=[];let playing=false;
 const doc={querySelectorAll:()=>media,querySelector:s=>opts.remote&&/connect-bar/.test(s)?{}:null,addEventListener(){},removeEventListener(){}};
 const w={setTimeout:(f,ms)=>{timers.push({f,ms});return timers.length},clearTimeout(){},
  actPlayPause:t=>{calls.push(t?'play':'pause');playing=!!t},actSeek:p=>calls.push('seek:'+p),
  __sfTogglePlayback:()=>{calls.push('toggle');return true},actSkipForward:()=>calls.push('next'),playFromUri:()=>calls.push('uri'),__sfMarkUserPlaybackIntent:()=>{}};
 if(opts.intentOnPause){const ap=w.actPlayPause;w.actPlayPause=t=>{w.__sfMarkUserPlaybackIntent();ap(t);};}
 if(opts.detached){function M(){this.muted=false;this.paused=true;}M.prototype.play=function(){this.paused=false;return 1;};w.HTMLMediaElement=M;w.detached=new M();const ap=w.actPlayPause;w.actPlayPause=t=>{ap(t);if(t)w.detached.play();else w.detached.paused=true;};}
 const env={playPauseButton:()=>({}),readNowPlaying:()=>({title:opts.title?opts.title():'T'}),previewPlaybackState:()=>w.__sfPrewarmActive?'paused':(playing?'playing':'paused'),
  previewRealText:s=>s||'',previewSeekObservation:()=>42000,publishPlayerState:()=>calls.push('publish')};
 new Function('window','document',...Object.keys(env),src)(w,doc,...Object.values(env));
 const run=()=>{const t=timers.shift();t.f();};
 return {w,media,calls,timers,run};
}
// Runs the pending settle checks: sound returns only after 4 paused readings in a row.
function calm(x,n=4){for(let k=0;k<n;k++){const t=x.timers.filter(t=>t.ms===400||t.ms===250).pop();x.timers.splice(x.timers.indexOf(t),1);t.f();}}
test('warm-up: muted play, pause after 3 s, position restored; sound back only on the user\'s own action (1022321)',()=>{
 const x=setup();x.run();
 assert.deepEqual(x.calls,['play']);assert.ok(x.media.every(m=>m.muted));assert.equal(x.w.__sfPrewarmActive,true);
 x.timers.find(t=>t.ms===3000).f();
 assert.deepEqual(x.calls,['play','pause','seek:42000']);assert.equal(x.w.__sfPrewarmActive,true,'still paused until the pause lands');assert.ok(x.media.every(m=>m.muted));
 calm(x,1);assert.ok(x.media.every(m=>m.muted),'one paused reading is not enough');calm(x,3);assert.equal(x.w.__sfPrewarmActive,false,'pause reported');
 assert.ok(x.media.every(m=>m.muted),'no automatic unmute: Spotify may resume by itself');
 x.w.actSkipForward();assert.ok(x.media.every(m=>!m.muted),'user action brings sound back');
});
test('the warm-up\'s own pause does not count as a user action',()=>{
 const x=setup({intentOnPause:true});x.run();x.timers.find(t=>t.ms===3000).f();calm(x);assert.ok(x.media.every(m=>m.muted));
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
 calm(x,1);assert.ok(x.media.every(m=>m.muted),'one paused reading is not enough');calm(x,3);assert.equal(x.w.__sfPrewarmActive,false);assert.ok(x.media.every(m=>!m.muted));
});
test('sound comes back only once the page media is really paused (user report 1022302)',()=>{
 const x=setup();x.run();x.media.forEach(m=>{m.paused=false;});
 x.timers.find(t=>t.ms===3000).f();x.timers.find(t=>t.ms===400).f();
 assert.ok(x.media.every(m=>m.muted),'still playing: stays muted');assert.deepEqual(x.calls.filter(c=>c==='pause').length,2,'pause asked again');
 x.media.forEach(m=>{m.paused=true;});calm(x);
 assert.equal(x.w.__sfPrewarmActive,false);assert.ok(x.media.every(m=>m.muted));x.w.__sfTogglePlayback(true);assert.ok(x.media.every(m=>!m.muted));
});
test('page refuses to pause: stays muted until the user taps Play/Pause',()=>{
 const x=setup();x.run();x.media.forEach(m=>{m.paused=false;});
 x.timers.find(t=>t.ms===3000).f();x.timers.find(t=>t.ms===400).f();
 for(let k=0;k<12;k++){const t=x.timers.filter(t=>t.ms===250).pop();if(t)t.f();}
 assert.ok(x.media.every(m=>m.muted));x.w.__sfTogglePlayback(false);assert.ok(x.media.every(m=>!m.muted));
});
test('audio element outside the DOM is muted too (user report 1022305)',()=>{
 const x=setup({detached:true});x.run();
 assert.equal(x.w.detached.muted,true,'detached element muted before it plays');
 x.timers.find(t=>t.ms===3000).f();calm(x);
 assert.equal(x.w.__sfPrewarmActive,false);x.w.playFromUri('spotify:track:x');assert.equal(x.w.detached.muted,false,'sound back on the user\'s action');
});
