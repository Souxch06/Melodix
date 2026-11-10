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
    if((m=l.match(/^iget(?:-boolean|-object)? (\w+), (\w+), .*;->(\w+):/))) {r[m[1]]=r[m[2]][m[3]];continue;}
    if((m=l.match(/^iput(?:-boolean|-wide) (\w+), (\w+), .*;->(\w+):/))) {r[m[2]][m[3]]=r[m[1]];continue;}
    if((m=l.match(/^sget(?:-boolean)? (\w+), .*NativeSessionGate;->(\w+):/))) {r[m[1]]=state[m[2]];continue;}
    if((m=l.match(/^sput(?:-boolean)? (\w+), .*NativeSessionGate;->(\w+):/))) {state[m[2]]=r[m[1]];continue;}
    if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (.*)$/))) {r[m[1]]=r[m[2]]+Number(m[3]);continue;}
    if((m=l.match(/^sput-boolean (\w+), .*;->B:Z/))) {state.proof=!!r[m[1]];continue;}
    if((m=l.match(/^move-result(?:-object)? (\w+)/))) {r[m[1]]=result;continue;}
    if((m=l.match(/^check-cast /))) continue;
    if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)/))) {if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]]) pc=labels[m[3]];continue;}
    if((m=l.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)/))) {if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
    if(l==='return-void') return;
    if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
      const a=m[1]?m[1].split(', ').map(x=>r[x]):[], c=m[2];
      if(c.includes('NativeSessionReconnect;->allowed')) result=!state.loginActive && [2,4].includes(state.gateState);
      else if(c.includes('NativeSessionEvidence;->canClear')) result=state.expired===true && state.canClear!==false;
      else if(c.includes('NativeSessionEvidence;->reset')) {}
      else if(c.includes('NativeSessionGate;->transition')) {state.phase=a[1];state.sessionState=a[0];}
      else if(c.includes('NativeSessionGate;->paint')) {}
      else if(c.includes('NativeSessionGate;->navigateLogin')) state.events.push('login');
      else if(c.includes('NativeSessionReconnect;-><init>')) {a[0].activity={referent:a[1]};a[0].generation=a[2];}
      else if(c.includes('Reference;->get()')) result=a[0].referent;
      else if(c.includes('->isFinishing()')) result=!!a[0].finishing;
      else if(c.includes('->isDestroyed()')) result=!!a[0].destroyed;
      else if(c.includes('NativeBridgeNavigation;->prepare')) { state.events.push('prepare:'+a[1]); }
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
function fixture() {return {activity:{G:{},nativeVerificationStart:123},state:{cookie:true,proof:true,generation:7,gateState:4,loginActive:false,events:[],rows:[]}};}

test('explicit reconnect invalidates the old generation and clears only after the tap',()=>{
  const {activity,state}=fixture();assert.deepEqual(state.events,[]);run('start',activity,state);
  assert.equal(state.generation,8);assert.equal(state.loginActive,1);assert.equal(activity.nativeReconnectPending,1);
  assert.deepEqual(state.events,['stop','prepare:about:blank','about:blank','clear-request']);
  run('start',activity,state);assert.equal(state.events.filter(e=>e==='clear-request').length,1);
  state.cookie=false;run('onReceiveValue',state.callback,state,true);
  assert.deepEqual(state.events,['stop','prepare:about:blank','about:blank','clear-request','flush','storage-clear','proof-clear','login']);
  assert.equal(activity.nativeReconnectPending,0);assert.equal(state.phase,'reconnect-user-confirmed');
});
test('interactive login, pending action or unrelated state never triggers destructive reconnect',()=>{
  for(const mode of ['login','pending','unrelated']){const {activity,state}=fixture();
    if(mode==='login')state.loginActive=true;if(mode==='pending')activity.nativeReconnectPending=true;if(mode==='unrelated')state.gateState=3;
    run('start',activity,state);assert.deepEqual(state.events,[],mode);
  }
});
test('stale callback cannot clear web storage or navigate and a retained cookie fails closed',()=>{
  {const {activity,state}=fixture();run('start',activity,state);state.generation++;run('onReceiveValue',state.callback,state,true);assert.ok(!state.events.includes('storage-clear'));assert.ok(!state.events.includes('login'));}
  {const {activity,state}=fixture();run('start',activity,state);run('onReceiveValue',state.callback,state,false);assert.ok(!state.events.includes('storage-clear'));assert.ok(!state.events.includes('login'));assert.equal(state.loginActive,0);assert.equal(state.phase,'reconnect-not-confirmed');}
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

test('explicit user action is available without expiry evidence, never triggered by retry or startup',()=>{
 for(const gateState of [2,4]){const {activity,state}=fixture();state.gateState=gateState;run('start',activity,state);assert.ok(state.events.includes('clear-request'));}
 const retry=read('smali/com/melodix/music/NativeSessionRecovery.smali');assert.doesNotMatch(retry,/removeAllCookies|removeSessionCookies|deleteAllData/);
 const ui=read('smali/com/melodix/music/NativeSessionSurfaceAction.smali');assert.match(ui,/:reconnect[\s\S]*?NativeSessionReconnect;->start/);
});

test('only the warned native reconnect button can reach destructive start',()=>{
 const main=read('smali/com/melodix/music/MainActivity.smali');
 const a=main.indexOf('const-string v2, "melodix:action:reconnect"'),b=main.indexOf('    :native_row_check_login',a);
 assert.match(main.slice(a,b),/NativeSessionGate;->paint/);assert.doesNotMatch(main.slice(a,b),/NativeSessionReconnect;->start/);
});
