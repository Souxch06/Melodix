'use strict';
// These execute the actual production controller functions in isolated JS
// contexts with a synthetic player. They are not an Android or Spotify test.
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(root, 'scripts/native_ui_shell.source.js'), 'utf8');
const bridge = fs.readFileSync(path.join(root, 'scripts/spotify_bridge.source.js'), 'utf8');
function between(s, a, b) {
  const start=s.indexOf(a), end=s.indexOf(b,start);
  assert.ok(start>=0 && end>start, `${a} / ${b}`);
  return s.slice(start,end);
}
const shellHelpers=between(shell,'    var PLAYER_SEND_INTERVAL_MS', '    function clockSeconds(');
const shellControls=between(shell,'    var wait = null;', '    function installPlayerFeed()');
const bridgeHelpers=between(bridge,'    // >>> sf-pause-intent','    // <<< sf-pause-intent');
const bridgeControls=between(bridge,'    window.actPlayPause = function(play, e)', '    window.actRepeat = function(e)');
function fixture(order, options={}) {
  const active=new Map(); let next=0, now=100000; const clicks=[],listeners=[];
  const button={label:'Pause', getAttribute:()=>button.label, click(){clicks.push(button.label);if(!options.deferButton)button.label=button.label==='Pause'?'Play':'Pause';}};
  const media={tagName:'AUDIO',src:'https://open.spotify.com/media',paused:true,ended:false,muted:false,currentTime:0};
  const doc={visibilityState:'visible',querySelector(s){return String(s).includes('control-button-playpause')?button:null;},querySelectorAll(){return [media];},addEventListener(type,fn){if(type==='click')listeners.push(fn);}};
  const storage=new Map();
  const win={playing:true,localStorage:{getItem:k=>storage.get(k)||null,setItem:(k,v)=>storage.set(k,String(v)),removeItem:k=>storage.delete(k)},
    setInterval(fn,ms){const id=++next;active.set(id,{fn,ms});return id;},clearInterval(id){active.delete(id);},setTimeout(){return ++next;},clearTimeout(){}};
  const context=vm.createContext({window:win,document:doc,Date:{now:()=>now},console,Number,String,Boolean,Array,Math,JSON,setTimeout:win.setTimeout,clearTimeout:win.clearTimeout});
  function loadShell(){vm.runInContext(`(function(){ ${shellHelpers} function refreshPlayerSoon(){} ${shellControls} })()`,context);}
  function loadBridge(){vm.runInContext(`(function(){ let reqPause=false,ulFlag=false;function manageWake(){} ${bridgeHelpers} window.__sfMelodixBridgeStarted=true; ${bridgeControls} })()`,context);}
  for(const s of order) s==='shell'?loadShell():loadBridge();
  return {win,button,media,clicks,active,loadBridge,loadShell,listeners,advance(n){now+=n;},ticks(){for(const t of Array.from(active.values()))t.fn();},holds(){return [...active.values()].filter(x=>x.ms===300).length;}};
}
test('native pause uses exactly one watchdog when the bridge is installed',()=>{
  const f=fixture(['shell','bridge']);f.win.__sfTogglePlayback();
  assert.deepEqual(f.clicks,['Pause']);assert.equal(f.holds(),1);
  assert.equal(f.win.__sfUserRequestedPause,true);
});
test('late bridge takes ownership and stops the shell fallback watchdog',()=>{
  const f=fixture(['shell']);f.win.__sfTogglePlayback();assert.equal(f.holds(),1);
  f.loadBridge();assert.equal(f.holds(),1); // single watcher transferred without a click
  assert.deepEqual(f.clicks,['Pause']);
});
test('shell loaded after bridge does not replace its playback owner',()=>{
  const f=fixture(['bridge']);const owner=f.win.__sfMarkUserPlaybackIntent;
  f.loadShell();assert.equal(f.win.__sfMarkUserPlaybackIntent,owner);
  f.win.__sfTogglePlayback();assert.equal(f.holds(),1);assert.deepEqual(f.clicks,['Pause']);
});
test('fallback shell still pauses and explicitly resumes without a bridge',()=>{
  const f=fixture(['shell']);f.win.__sfTogglePlayback();assert.equal(f.holds(),1);
  f.win.__sfTogglePlayback();assert.equal(f.holds(),0);assert.deepEqual(f.clicks,['Pause','Play']);
});
test('skipping clears the active bridge watchdog without another pause',()=>{
  const f=fixture(['shell','bridge']);f.win.__sfTogglePlayback();assert.equal(f.holds(),1);
  f.win.__sfSkip('forward');assert.equal(f.holds(),0);assert.equal(f.win.__sfUserRequestedPause,false);
});

test('a player skip activation produces one privacy-safe trace entry',()=>{
  const f=fixture(['bridge']);
  const skip={getAttribute:()=> 'control-button-skip-forward'};
  for(const listener of f.listeners) listener({target:{closest:()=>skip}});
  assert.equal(f.win.__sfGetPlaybackTrace().filter(x=>x.event==='dom-skip').length,1);
});

test('rapid duplicate taps do not blindly toggle twice before state confirmation',()=>{
  const f=fixture(['shell','bridge'],{deferButton:true});
  f.win.__sfTogglePlayback();f.win.__sfTogglePlayback();
  assert.deepEqual(f.clicks,['Pause']);
  f.button.label='Play'; // the real player now reports paused
  f.win.__sfTogglePlayback();
  assert.deepEqual(f.clicks,['Pause','Play']);
});

test('a delayed button update cannot make two watchdogs send two pause clicks',()=>{
  const f=fixture(['shell','bridge'],{deferButton:true});f.win.__sfTogglePlayback();
  f.media.paused=false;f.media.currentTime=10;f.advance(2000);f.ticks();
  f.media.currentTime=11;f.advance(300);f.ticks();
  assert.deepEqual(f.clicks,['Pause','Pause']); // user pause + one re-pause only
});

test('an unconfirmed command may be retried explicitly after the bounded wait',()=>{
  const f=fixture(['shell','bridge'],{deferButton:true});
  f.win.__sfTogglePlayback();f.advance(1499);f.win.__sfTogglePlayback();assert.equal(f.clicks.length,1);
  f.advance(1);f.win.__sfTogglePlayback();assert.equal(f.clicks.length,2);
});
