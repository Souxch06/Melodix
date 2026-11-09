'use strict';
const {test}=require('node:test');const assert=require('node:assert/strict');const fs=require('node:fs');
const src=fs.readFileSync('smali/com/melodix/music/NativeSessionEvidence.smali','utf8');
// Actual pure smali accumulator, with only String.equals faked.
function tracker(){const fields={fingerprint:null,count:0};return {fields,record(p0){
 const at=src.indexOf('.method public static record('),code=src.slice(at,src.indexOf('.end method',at)).split('\n').map(x=>x.trim());
 const labels=Object.fromEntries(code.map((s,i)=>[s,i])),r={p0};let result;
 for(let pc=0,steps=0;pc<code.length&&steps++<100;pc++) {const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
 if((m=l.match(/^sget(?:-object)? (\w+), .*->(\w+):/))) {r[m[1]]=fields[m[2]];continue;}
 if((m=l.match(/^sput(?:-object)? (\w+), .*->(\w+):/))) {fields[m[2]]=r[m[1]];continue;}
 if((m=l.match(/^const\/4 (\w+), (.*)$/))) {r[m[1]]=Number(m[2]);continue;}
 if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (.*)$/))) {r[m[1]]=r[m[2]]+Number(m[3]);continue;}
 if((m=l.match(/^if-eqz (\w+), (:\w+)$/))) {if(!r[m[1]])pc=labels[m[2]];continue;}
 if((m=l.match(/^if-ge (\w+), (\w+), (:\w+)$/))) {if(r[m[1]]>=r[m[2]])pc=labels[m[3]];continue;}
 if(l.includes('String;->equals')){result=r.p0===r.v0;continue;}
 if(l.includes('->reset()')){fields.count=0;fields.fingerprint=null;continue;}
 if((m=l.match(/^move-result (\w+)$/))) {r[m[1]]=result;continue;}
 if((m=l.match(/^goto (:\w+)$/))) {pc=labels[m[1]];continue;}
 if((m=l.match(/^return (\w+)$/)))return r[m[1]];
 assert.fail(l);
 }assert.fail('no return');
}};}
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
 assert.ok(clear.indexOf('NativeSessionEvidence;->canClear')<clear.indexOf('removeAllCookies'));
});
