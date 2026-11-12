'use strict';
// Interprets the production transition prefix; synthetic owner only. This is
// a contract test, not proof of Android threading or WebView invalidation.
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const gate=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8');
const first=gate.indexOf('.method public static transition(ILjava/lang/String;)V');
const end=gate.indexOf('.end method',first);
assert.ok(first>=0 && end>first);
const lines=gate.slice(first,end).split('\n').map(x=>x.split('#')[0].trim());
const labels=new Map(lines.map((x,i)=>[x,i]));
function transition(to, {owner={marker:'synthetic'}, epoch=100}={}) {
 const fields={state:3,privateUiEpoch:epoch,owner:owner===null?null:{referent:owner}};
 const r={p0:to,p1:'synthetic-reason'};let value;const effects=[];
 for(let pc=0,steps=0; pc<lines.length && steps++<200; pc++) {
  const l=lines[pc];let m;
  if(!l || /^[.#:]/.test(l))continue;
  if(l.startsWith('sput-object p1,')) return {fields,effects}; // diagnostics follow
  if((m=l.match(/^sget(?:-object)? (\w+), .*->(\w+):/))) {r[m[1]]=fields[m[2]];continue;}
  if((m=l.match(/^sput (\w+), .*->(\w+):/))) {fields[m[2]]=r[m[1]];effects.push(m[2]+':'+r[m[1]]);continue;}
  if((m=l.match(/^const\/4 (\w+), (\S+)/))) {r[m[1]]=Number(m[2]);continue;}
  if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (\S+)/))) {r[m[1]]=r[m[2]]+Number(m[3]);continue;}
  if((m=l.match(/^if-eq (\w+), (\w+), (:\w+)/))) {if(r[m[1]]===r[m[2]])pc=labels.get(m[3]);continue;}
  if((m=l.match(/^if-eqz (\w+), (:\w+)/))) {if(!r[m[1]])pc=labels.get(m[2]);continue;}
  if((m=l.match(/^invoke-virtual \{(\w+)\}, Ljava\/lang\/ref\/Reference;->get/))) {value=r[m[1]].referent;continue;}
  if((m=l.match(/^move-result-object (\w+)/))) {r[m[1]]=value;continue;}
  if(/^check-cast /.test(l))continue;
  if((m=l.match(/^invoke-virtual \{(\w+)\}, .*->invalidateNativePrivateUi/))) {assert.equal(r[m[1]],owner);effects.push('reset');continue;}
  assert.fail('unexpected transition instruction '+l);
 }
 assert.fail('transition did not reach diagnostic suffix');
}
test('each non-valid gate state closes first, advances epoch, and invalidates the bound synthetic owner',()=>{
 for(const state of [0,1,2,4]) {
  const result=transition(state);
  assert.deepEqual(result.effects,[`state:${state}`,'privateUiEpoch:101','reset']);
  assert.equal(result.fields.state,state);
 }
});
test('valid gate state does not invalidate the current synthetic owner',()=>{
 const result=transition(3);assert.deepEqual(result.effects,['state:3']);assert.equal(result.fields.privateUiEpoch,100);
});
test('an absent or collected owner still advances epoch without dereferencing a view',()=>{
 for(const owner of [null,0]) {
  const result=transition(1,{owner});assert.deepEqual(result.effects,['state:1','privateUiEpoch:101']);
 }
});
