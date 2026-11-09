'use strict';
const {test}=require('node:test');const assert=require('node:assert/strict');const fs=require('node:fs');
const src=fs.readFileSync('smali/com/melodix/music/NativeSessionEvidence.smali','utf8');
// Actual pure smali accumulator, with only String.equals faked.
function tracker(){const fields={fingerprint:null,count:0};function run(name,p0){
 const at=src.indexOf('.method '+(name==='retain'?'private':'public')+' static '+name+'('),code=src.slice(at,src.indexOf('.end method',at)).split('\n').map(x=>x.trim());
 const labels=Object.fromEntries(code.map((s,i)=>[s,i])),r={p0};let result;
 for(let pc=0,steps=0;pc<code.length&&steps++<100;pc++) {const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
 if((m=l.match(/^sget(?:-object)? (\w+), .*->(\w+):/))) {r[m[1]]=fields[m[2]];continue;}
 if((m=l.match(/^sput(?:-object)? (\w+), .*->(\w+):/))) {fields[m[2]]=r[m[1]];continue;}
 if((m=l.match(/^const\/4 (\w+), (.*)$/))) {r[m[1]]=Number(m[2]);continue;}
 if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (.*)$/))) {r[m[1]]=r[m[2]]+Number(m[3]);continue;}
 if((m=l.match(/^if-lez (\w+), (:\w+)$/))) {if(r[m[1]]<=0)pc=labels[m[2]];continue;}
 if((m=l.match(/^if-eqz (\w+), (:\w+)$/))) {if(!r[m[1]])pc=labels[m[2]];continue;}
 if((m=l.match(/^if-ge (\w+), (\w+), (:\w+)$/))) {if(r[m[1]]>=r[m[2]])pc=labels[m[3]];continue;}
 if(l.includes('String;->equals')){const regs=l.match(/\{([^}]+)\}/)[1].split(', ');result=r[regs[0]]===r[regs[1]];continue;}
 if(l.includes('->reset()')){fields.count=0;fields.fingerprint=null;continue;}
 if((m=l.match(/^move-result (\w+)$/))) {r[m[1]]=result;continue;}
 if((m=l.match(/^goto (:\w+)$/))) {pc=labels[m[1]];continue;}
 if((m=l.match(/^return (\w+)$/)))return r[m[1]];
 assert.fail(l);
 }assert.fail('no return');
}return {fields,record:p=>run("record",p),retain:p=>run("retain",p)};}
test('two completed observations must refer to the same ephemeral cookie identity',()=>{
 const t=tracker();assert.equal(t.record('digest-A'),1);assert.equal(t.record('digest-A'),2);assert.equal(t.record('digest-A'),2);
 assert.equal(t.record('digest-B'),1);assert.equal(t.record(null),0);assert.equal(t.fields.fingerprint,null);
 assert.equal(t.record('digest-B'),1);
});
test('fingerprint is scoped to sp_dc and never logged or persisted; changed-cookie tap is denied',()=>{
 assert.match(src,/sp_dc=\(\[\^;\]\+\)/);assert.match(src,/SHA-256/);
 assert.doesNotMatch(src,/noteDiag|diagLine|SharedPreferences|Log;|FileOutputStream|JavascriptInterface/);
 const can=src.slice(src.indexOf('.method public static canClear'),src.indexOf('.method public static count'));
 assert.match(can,/->current\(\)Ljava\/lang\/String;[\s\S]*?->equals/);
 const clear=fs.readFileSync('smali/com/melodix/music/NativeSessionReconnect.smali','utf8');
 assert.ok(clear.indexOf('NativeSessionEvidence;->canClear')<clear.indexOf('navigateLogin('));
 assert.doesNotMatch(clear,/removeAllCookies|removeSessionCookies|deleteAllData/);
});

test('deadline preserves a single completed refusal for unchanged identity, without increment',()=>{
 const t=tracker();assert.equal(t.record('synthetic-A'),1);
 for(let i=0;i<5;i++){assert.equal(t.retain('synthetic-A'),1);assert.equal(t.fields.count,1);}
 assert.equal(t.record('synthetic-A'),2);
 assert.equal(t.retain('synthetic-A'),1);assert.equal(t.fields.count,2);
});
test('deadline fails closed for replaced, absent or unreadable cookie, and cannot invent a refusal',()=>{
 for(const now of ['synthetic-B',null]){const t=tracker();t.record('synthetic-A');assert.equal(t.retain(now),0);assert.equal(t.fields.count,0);assert.equal(t.fields.fingerprint,null);}
 const empty=tracker();assert.equal(empty.retain('synthetic-A'),0);assert.equal(empty.fields.count,0);
 const current=src.slice(src.indexOf('.method private static current('),src.indexOf('.method public static recordCurrentCookie'));
 assert.match(current,/catch Ljava\/lang\/Exception/);assert.match(current,/:none[\s\S]*?const\/4 v0, 0x0/);
 const task=fs.readFileSync('smali/com/melodix/music/NativeSessionGateTask.smali','utf8');assert.match(task,/retainIfCurrent\(\)Z/);assert.doesNotMatch(task,/recordCurrentCookie|Evidence;->reset|navigateLogin/);
});
