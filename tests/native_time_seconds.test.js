'use strict';
// Interpret the actual native player progress and formatter Smali. Values in
// the synthetic WebView payload are seconds; formatNativeTime remains in ms.
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const src = fs.readFileSync('smali/com/melodix/music/MainActivity.smali','utf8');
function linesOf(method, from, until) {
  const a=src.indexOf(method); assert.ok(a>=0,method);
  const b=src.indexOf('.end method',a); assert.ok(b>a);
  let text=src.slice(a,b);
  if(from) { const i=text.indexOf('\n    '+from+'\n'); assert.ok(i>=0); text=text.slice(i); }
  if(until) { const i=text.indexOf('\n    '+until+'\n'); assert.ok(i>=0); text=text.slice(0,i); }
  return text.split('\n').map(l=>l.split('#')[0].trim());
}
const player=linesOf('.method public final updateNativePlayer(Ljava/lang/String;)V',':native_player_progress',':native_player_play_state');
const formatter=linesOf('.method private static formatNativeTime(J)Ljava/lang/String;');
const ID={progress:0x7f09023d,mini:0x7f09024d,position:0x7f09024a,duration:0x7f09024b};
function execute(lines, regs, payload, views) {
 const labels=new Map(lines.map((l,i)=>[l,i]));let value;
 for(let pc=0, count=0;pc<lines.length && count++<300;pc++) {
  const l=lines[pc];let m;if(!l || /^[.#:]/.test(l))continue;
  if((m=l.match(/^const-string (\w+), (".*")$/))) {regs[m[1]]=JSON.parse(m[2]);continue;}
  if((m=l.match(/^const(?:\/4|\/16)? (\w+), (\S+)$/))) {regs[m[1]]=Number(m[2]);continue;}
  if((m=l.match(/^const-wide\/16 (\w+), (\S+)$/))) {regs[m[1]]=BigInt(m[2]);continue;}
  if((m=l.match(/^(mul|div|rem)-long (\w+), (\w+), (\w+)$/))) {
   const a=regs[m[3]],b=regs[m[4]];regs[m[2]]=BigInt.asIntN(64,m[1]==='mul'?a*b:m[1]==='div'?a/b:a%b);continue;
  }
  if((m=l.match(/^cmp-long (\w+), (\w+), (\w+)$/))) {regs[m[1]]=regs[m[2]]<regs[m[3]]?-1:regs[m[2]]>regs[m[3]]?1:0;continue;}
  if((m=l.match(/^if-(eqz|lez|gez|ltz) (\w+), (:\w+)$/))) {
   const n=regs[m[2]];if(m[1]==='eqz'?!n:m[1]==='lez'?n<=0:m[1]==='gez'?n>=0:n<0){assert.ok(labels.has(m[3]));pc=labels.get(m[3]);}continue;
  }
  if((m=l.match(/^goto (:\w+)$/))) {assert.ok(labels.has(m[1]));pc=labels.get(m[1]);continue;}
  if((m=l.match(/^long-to-int (\w+), (\w+)$/))) {regs[m[1]]=Number(BigInt.asIntN(32,regs[m[2]]));continue;}
  if((m=l.match(/^new-instance (\w+), Ljava\/lang\/StringBuilder;$/))) {regs[m[1]]={text:''};continue;}
  if(/^check-cast /.test(l))continue;
  if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
   const names=m[1].split(', '), a=names.map(n=>regs[n]), call=m[2];
   if(call.includes('JSONObject;->optLong')) value=BigInt(payload[a[1]] ?? a[2]);
   else if(call.includes('->formatNativeTime(J)')) value=execute(formatter,{p0:a[0]},null,null);
   else if(call.includes('->findViewById(I)')) value=views.get(a[1])||null;
   else if(call.includes('ProgressBar;->setMax')) a[0].max=a[1];
   else if(call.includes('ProgressBar;->setProgress')) a[0].progress=a[1];
   else if(call.includes('TextView;->setText')) a[0].text=a[1];
   else if(call.includes('StringBuilder;-><init>')) value=undefined;
   else if(call.includes('StringBuilder;->append')) {a[0].text+=String(a[1]);value=a[0];}
   else if(call.includes('StringBuilder;->toString')) value=a[0].text;
   else assert.fail('unexpected invoke: '+l);
   continue;
  }
  if((m=l.match(/^move-result(?:-wide|-object)? (\w+)$/))) {regs[m[1]]=value;continue;}
  if((m=l.match(/^return-object (\w+)$/))) return regs[m[1]];
  assert.fail('unexpected instruction: '+l);
 }
 return undefined;
}
function update(payload) {
 const views=new Map(Object.values(ID).map(id=>[id,{}]));
 execute(player,{p0:{},v0:payload},payload,views);
 return Object.fromEntries(Object.entries(ID).map(([name,id])=>[name,views.get(id)]));
}
test('84-second WebView position and 222-second duration reach native labels and progress correctly',()=>{
 const v=update({position:84,duration:222});
 assert.equal(v.position.text,'1:24');assert.equal(v.duration.text,'3:42');
 assert.equal(v.progress.max,1000);assert.equal(v.progress.progress,378);assert.equal(v.mini.progress,378);
});
test('second payload boundaries pad properly and invalid negative times never appear',()=>{
 for(const [seconds,expected] of [[0,'0:00'],[1,'0:01'],[9,'0:09'],[10,'0:10'],[59,'0:59'],[60,'1:00'],[64,'1:04'],[3607,'60:07'],[-1,'0:00']]) {
  const v=update({position:seconds,duration:seconds});
  assert.equal(v.position.text,expected,`position=${seconds}`);assert.equal(v.duration.text,expected,`duration=${seconds}`);
 }
 const v=update({});assert.equal(v.position.text,'0:00');assert.equal(v.duration.text,'0:00');assert.equal(v.progress.progress,0);
});
test('the JS producer publishes rounded seconds and does not pre-multiply by 1000',()=>{
 const js=fs.readFileSync('scripts/native_ui_shell.source.js','utf8');
 const a=js.indexOf('    function readNowPlaying()');const b=js.indexOf('\n    function textIn(',a);
 assert.ok(a>=0 && b>a);const block=js.slice(a,b);
 assert.match(block,/position: position > 0 \? Math\.round\(position\) : 0/);
 assert.match(block,/duration: duration > 0 \? Math\.round\(duration\) : 0/);
 const p=js.slice(js.indexOf('    function playerPayload()'),js.indexOf('    function publishPlayerState('));
 assert.match(p,/position: info\.position/);assert.match(p,/duration: info\.duration/);
});
