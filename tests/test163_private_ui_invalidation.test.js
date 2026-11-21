'use strict';
// Test-only interpreter executes the production Smali instruction paths. Its
// views/payloads are synthetic; it is not evidence of a Spotify session.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const read = f => fs.readFileSync('smali/com/melodix/music/'+f+'.smali','utf8');
const activity = read('MainActivity'), gate = read('NativeSessionGate');
const runnable = read('NativeUiUpdateRunnable'), reset = read('NativePrivateUiReset');
function body(src, signature) {
  const a=src.indexOf(signature); assert.ok(a>=0,signature);
  return src.slice(a,src.indexOf('.end method',a)).split('\n').map(x=>x.split('#')[0].trim());
}
function executeInvalidation(initial) {
  const target={...initial}, r={p0:target}, calls=[];
  for(const l of body(activity,'.method public final invalidateNativePrivateUi()V')) {
    let m; if(!l || /^[.#:]/.test(l)) continue;
    if((m=l.match(/^const\/4 (\w+), (\S+)/))) {r[m[1]]=Number(m[2]);continue;}
    if((m=l.match(/^iput(?:-object|-boolean)? (\w+), p0, .*->(\w+):/))) {target[m[2]]=r[m[1]];continue;}
    if((m=l.match(/^iget (\w+), p0, .*->(\w+):/))) {r[m[1]]=target[m[2]];continue;}
    if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (\S+)/))) {r[m[1]]=r[m[2]]+Number(m[3]);continue;}
    if(l.startsWith('invoke-virtual {p0},') && l.includes('beginNativeHomeRender')) {calls.push('home-reset');continue;}
    if(l.startsWith('invoke-static {p0},') && l.includes('NativePrivateUiReset;->reset')) {calls.push('view-reset');continue;}
    if(l==='return-void') return {target,calls};
    assert.fail('unexpected invalidator opcode '+l);
  }
  assert.fail('invalidator did not return');
}
function executeDelivery({action,receiptState,receiptEpoch,receiptGeneration,state,epoch,generation}) {
  const lines=body(runnable,'.method public final run()V'), labels=new Map(lines.map((x,i)=>[x,i]));
  const object={action,sessionAtReceipt:receiptState,privateUiEpoch:receiptEpoch,sessionGeneration:receiptGeneration,
    activity:{},screen:'fixture',data:'SYNTHETIC-PRIVATE-SENTINEL'};
  const r={p0:object}, calls=[];
  for(let pc=0,steps=0;pc<lines.length && steps++<100;pc++) {
    const l=lines[pc];let m; if(!l||/^[.#:]/.test(l))continue;
    if((m=l.match(/^iget-object (\w+), p0, .*->(\w+):/))) {r[m[1]]=object[m[2]];continue;}
    if((m=l.match(/^iget (\w+), p0, .*->(\w+):/))) {r[m[1]]=object[m[2]];continue;}
    if((m=l.match(/^sget (\w+), .*->(state|generation|privateUiEpoch):I/))) {r[m[1]]={state,generation,privateUiEpoch:epoch}[m[2]];continue;}
    if((m=l.match(/^const\/4 (\w+), (\S+)/))) {r[m[1]]=Number(m[2]);continue;}
    if((m=l.match(/^const-string (\w+), (.*)$/))) {r[m[1]]=JSON.parse(m[2]);continue;}
    if((m=l.match(/^if-ne (\w+), (\w+), (:\w+)/))) {if(r[m[1]]!==r[m[2]])pc=labels.get(m[3]);continue;}
    if((m=l.match(/^if-eqz (\w+), (:\w+)/))) {if(!r[m[1]])pc=labels.get(m[2]);continue;}
    if((m=l.match(/^goto (:\w+)/))) {pc=labels.get(m[1]);continue;}
    if(l.startsWith('invoke-')) {const method=l.match(/->([^ (]+)\(/); assert.ok(method,l);calls.push(method[1]);continue;}
    if(l==='return-void')return calls;
    assert.fail('unexpected delivery opcode '+l);
  }
  assert.fail('delivery did not return');
}

test('native invalidation clears current and return private fields before view reset, without touching preferences',()=>{
  const keys=['nativeCurrentScreen','nativeCurrentTitle','nativeCurrentJson','nativeExpectedId','nativeExpectedSearch',
    'nativeReturnScreen','nativeReturnTitle','nativeReturnJson','nativeReturnExpectedId','nativeReturnSearch'];
  const initial=Object.fromEntries(keys.map(k=>[k,'SYNTHETIC PRIVATE SENTINEL']));
  Object.assign(initial,{nativeHasTrack:1,melodixWebHomeActive:1,nativeSettingsLoading:1,nativeSettingsReadyGeneration:7,nativeSettingsGeneration:7,privatePreference:'KEEP'});
  const {target,calls}=executeInvalidation(initial);
  for(const k of keys) assert.equal(target[k],0,k);
  assert.equal(target.nativeHasTrack,0); assert.equal(target.melodixWebHomeActive,0);
  assert.equal(target.nativeSettingsLoading,0);assert.equal(target.nativeSettingsReadyGeneration,0);
  assert.equal(target.nativeSettingsGeneration,8);assert.equal(target.nativeSessionUnproven,1);
  assert.equal(target.privatePreference,'KEEP');assert.deepEqual(calls,['home-reset','view-reset']);
});

test('real payload dispatcher rejects queued old and unproven-generation data',()=>{
  const valid={receiptState:3,receiptEpoch:20,receiptGeneration:11,state:3,epoch:20,generation:11};
  for(const action of [1,3]) {
    const method=action===1?'applyNativeUiData':'renderNativeRows';
    assert.ok(executeDelivery({...valid,action}).includes(method));
    for(const change of [{state:0},{receiptState:0},{epoch:21},{generation:12}])
      assert.deepEqual(executeDelivery({...valid,action,...change}),[],JSON.stringify(change));
  }
});

test('gate invalidates on every non-valid transition and logout before old routine',()=>{
  const transition=body(gate,'.method public static transition(').join('\n');
  assert.match(transition,/sput p0, .*->state:I[\s\S]*?if-eq p0, v1, :private_ui_reset_done[\s\S]*?privateUiEpoch:I[\s\S]*?invalidateNativePrivateUi/);
  const logout=body(activity,'.method public final A()V').join('\n');
  assert.match(logout,/->state:I[\s\S]*?->privateUiEpoch:I[\s\S]*?NativeSessionStore;->advance\(Landroid\/content\/Context;\)I[\s\S]*?invalidateNativePrivateUi/);
  assert.match(runnable,/->privateUiEpoch:I[\s\S]*?->state:I[\s\S]*?->privateUiEpoch:I[\s\S]*?if-eq v0, v1, :stable_receipt/);
  assert.match(reset,/cancelRequest\(Landroid\/widget\/ImageView;\)V/);
  assert.match(reset,/getChildCount\(\)I[\s\S]*?cancelImages\(Landroid\/view\/View;\)V/);
  assert.match(reset,/removeAllViews\(\)V/);
  assert.doesNotMatch(reset,/SharedPreferences|removeAllCookies|deleteAllData|clearCache/);
});
