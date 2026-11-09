'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const read = p => fs.readFileSync(path.join(__dirname,'..',p),'utf8');
const src = read('smali/com/melodix/music/NativeSessionReconnect.smali');

// Execute the actual Smali control flow; Android calls are fakes, not a device test.
function run(name, obj, state, value) {
  const start = src.indexOf('.method public ' + (name==='onReceiveValue'?'final ':'static ') + name + '(');
  assert.ok(start>=0);
  const code=src.slice(start,src.indexOf('.end method',start)).split('\n').map(x=>x.trim());
  const labels=Object.fromEntries(code.map((l,i)=>[l,i]));
  const r={p0:obj,p1:value}; let result;
  for(let pc=0,steps=0;pc<code.length && steps++<400;pc++) {
    const l=code[pc]; let m;
    if(!l || /^[.#:]/.test(l)) continue;
    if((m=l.match(/^const-string (\w+), (.*)$/))) {r[m[1]]=JSON.parse(m[2]);continue;}
    if((m=l.match(/^const(?:-wide)?\/(?:4|16) (\w+), (.*)$/))) {r[m[1]]=Number(m[2]);continue;}
    if((m=l.match(/^new-instance (\w+), (.*)$/))) {r[m[1]]={type:m[2]};continue;}
    if((m=l.match(/^iget(?:-boolean|-object) (\w+), (\w+), .*;->(\w+):/))) {r[m[1]]=r[m[2]][m[3]];continue;}
    if((m=l.match(/^iput(?:-boolean|-wide) (\w+), (\w+), .*;->(\w+):/))) {r[m[2]][m[3]]=r[m[1]];continue;}
    if((m=l.match(/^sput-boolean (\w+), .*;->B:Z/))) {state.proof=!!r[m[1]];continue;}
    if((m=l.match(/^move-result(?:-object)? (\w+)/))) {r[m[1]]=result;continue;}
    if((m=l.match(/^check-cast /))) continue;
    if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)/))) {if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]]) pc=labels[m[3]];continue;}
    if(l==='return-void') return;
    if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
      const a=m[1]?m[1].split(', ').map(x=>r[x]):[], c=m[2];
      if(c.includes('NativeSessionReconnect;-><init>')) a[0].activity={referent:a[1]};
      else if(c.includes('Reference;->get()')) result=a[0].referent;
      else if(c.includes('->isFinishing()')) result=!!a[0].finishing;
      else if(c.includes('->isDestroyed()')) result=!!a[0].destroyed;
      else if(c.includes('->stopLoading()')) state.events.push('stop');
      else if(c.includes('->loadUrl(')) state.events.push(a[1]);
      else if(c.includes('->render(')) state.rows.push(JSON.parse(a[1]));
      else if(c.includes('CookieManager;->getInstance')) result={};
      else if(c.includes('->removeAllCookies(')) {state.events.push('clear-request');state.callback=a[1];}
      else if(c.includes('->flush()')) state.events.push('flush');
      else if(c.includes('->hasCookie()')) result=state.cookie;
      else if(c.includes('WebStorage;->getInstance')) result={};
      else if(c.includes('->deleteAllData()')) state.events.push('storage-clear');
      else if(c.includes('->proofClearLogout')) state.events.push('proof-clear');
      else if(c.includes('Lm9;->f()')) result={};
      else if(c.includes('->putBoolean(')) state.loggedIn=!!a[2];
      else if(c.includes('->apply()')) {}
      else if(c.includes('->openSpotifyLogin()')) state.events.push('login');
      else if(c.includes('NativeSessionReconnect;->failed')) run('failed',a[0],state);
      else assert.fail('unsupported call '+c);
      continue;
    }
    assert.fail('unsupported instruction '+l);
  }
  assert.fail('no return');
}
function fixture() {return {activity:{G:{},nativeVerificationStart:123},state:{cookie:true,proof:true,events:[],rows:[]}};}

test('explicit reconnect waits for deletion callback, checks cookie absence, then opens existing login',()=>{
  const {activity,state}=fixture();
  run('start',activity,state);
  assert.deepEqual(state.events,['stop','about:blank','clear-request']);
  assert.equal(activity.nativeVerificationStart,0);
  run('start',activity,state);
  assert.equal(state.events.filter(x=>x==='clear-request').length,1,'double tap does not race clears');
  state.cookie=false;
  run('onReceiveValue',state.callback,state,true);
  assert.deepEqual(state.events.slice(3),['flush','storage-clear','proof-clear','login']);
  assert.equal(state.proof,false);
  assert.equal(state.loggedIn,false);
  assert.equal(activity.nativeReconnectPending,0);
});

test('remaining cookie or dead activity never opens login after reconnect',()=>{
  for(const mode of ['cookie','destroyed','finishing','collected']) {
    const {activity,state}=fixture(); run('start',activity,state);
    if(mode==='destroyed') activity.destroyed=true;
    if(mode==='finishing') activity.finishing=true;
    if(mode==='collected') state.callback.activity.referent=null;
    run('onReceiveValue',state.callback,state,false);
    assert.ok(!state.events.includes('login'),mode);
    assert.ok(!state.events.includes('storage-clear'),mode);
    if(mode==='cookie') assert.equal(state.rows.at(-1)[0].title,'Reconnexion interrompue');
  }
});

test('actual shell preserves only numeric token codes across the Home bridge payload',()=>{
  const shell=read('scripts/native_ui_shell.source.js');
  const begin=shell.indexOf('function sendNativeUiData(');
  const fn=shell.slice(begin,shell.indexOf('\n    function ',begin+10));
  let payload;
  const context={window:{AndBridge:{onNativeUiData:(_s,json)=>{payload=JSON.parse(json);}}},
    safeHomeTraceCount:(n,max)=>Math.max(0,Math.min(max,Math.floor(Number(n)||0))),
    diagTrace(){},traceHomePipeline(){}};
  const send=vm.runInNewContext('('+fn+'\n)',context);
  assert.equal(send('home',[{kind:'state',state:'error',sessionUnproven:true,title:'Fixture',
    subtitle:'Fixture',tokenApiHttp:400,tokenFallbackHttp:403,uri:'melodix:action:retry-library'}]),true);
  assert.equal(payload[0].tokenApiHttp,400); assert.equal(payload[0].tokenFallbackHttp,403);
  send('home',[{kind:'state',state:'error',title:'Fixture',tokenApiHttp:'SECRET',tokenFallbackHttp:9000}]);
  assert.equal(payload[0].tokenApiHttp,0); assert.equal(payload[0].tokenFallbackHttp,599);
  assert.doesNotMatch(JSON.stringify(payload),/SECRET/);
});
