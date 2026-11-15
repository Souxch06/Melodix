'use strict';
// Synthetic end-to-end contract: execute the packaged shell in JSDOM and the
// decoded Smali instructions in a deliberately small fail-closed interpreter.
// This does not execute ART, Android views, Spotify, or a real device.
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root) throw new Error('MELODIX_CANDIDATE_ROOT required');
const activity=fs.readFileSync(path.join(root,'smali/com/melodix/music/MainActivity.smali'),'utf8');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
const widget=fs.readFileSync(path.join(root,'smali/com/melodix/music/a.smali'),'utf8');
function method(name,source=activity){
 const r=new RegExp('^\\.method [^\\n]*\\b'+name+'\\([^\\n]*\\n([\\s\\S]*?)^\\.end method','m');
 const match=source.match(r); assert.ok(match,`missing ${name}`);return match[1];
}
function interpret(name,params,source=activity){
 const text=method(name,source), labels={}, code=[];
 for(const raw of text.split('\n')){
  const line=raw.trim().replace(/\s+#.*$/,'');
  if(!line||line.startsWith('.')||line.startsWith('#'))continue;
  if(line.startsWith(':')){labels[line]=code.length;continue}
  code.push(line);
 }
 let r={...params},result,pc=0,steps=0;
 const val=x=>r[x.trim()];
 const number=x=>Number(x);
 const literal=x=>Number(x);
 while(pc<code.length){
  if(++steps>1000)throw Error('interpreter step limit');
  const line=code[pc++], match=line.match(/^(\S+)(?:\s+(.*))?$/),op=match[1],args=match[2]||'';
  const a=args.split(',').map(x=>x.trim());
  if(/^const(?:\/4|\/16)?$/.test(op)||op==='const-wide/16')r[a[0]]=literal(a[1]);
  else if(op==='const-string')r[a[0]]=JSON.parse(args.slice(args.indexOf(',')+1).trim());
  else if(op==='sget-object')r[a[0]]='ROOT';
  else if(op==='new-instance')r[a[0]]={};
  else if(op==='check-cast'){}
  else if(op==='new-array')r[a[0]]=new Array(val(a[1]));
  else if(op==='aput-object')val(a[1])[val(a[2])]=val(a[0]);
  else if(op==='move-result'||op==='move-result-wide'||op==='move-result-object')r[a[0]]=result;
  else if(op==='long-to-int')r[a[0]]=Math.trunc(val(a[1]));
  else if(op==='cmp-long')r[a[0]]=Math.sign(val(a[1])-val(a[2]));
  else if(op==='rem-long')r[a[0]]=val(a[1])%val(a[2]);
  else if(op==='rem-long/2addr')r[a[0]]=val(a[0])%val(a[1]);
  else if(op==='div-long')r[a[0]]=Math.trunc(val(a[1])/val(a[2]));
  else if(op==='mul-long')r[a[0]]=val(a[1])*val(a[2]);
  else if(op==='sub-long')r[a[0]]=val(a[1])-val(a[2]);
  else if(op==='move-wide')r[a[0]]=val(a[1]);
  else if(op==='goto')pc=labels[args];
  else if(op==='if-eqz'||op==='if-nez'||op==='if-ltz'||op==='if-gez'||op==='if-lez'){
   const x=val(a[0]), pass=op==='if-eqz'?!x:op==='if-nez'?!!x:op==='if-ltz'?x<0:op==='if-gez'?x>=0:x<=0;
   if(pass)pc=labels[a[1]];
  }
  else if(op==='iget-object')r[a[0]]=val(a[1]).screen;
  else if(op==='iput-boolean')val(a[1]).hasTrack=!!val(a[0]);
  else if(op.startsWith('invoke-')){
   const m=args.match(/^\{([^}]*)\},\s*(\S+)$/);if(!m)throw Error(line);
   const regs=m[1].split(',').map(x=>x.trim()), values=regs.map(val), target=m[2];
   if(target.includes('JSONObject;-><init>'))values[0].json=JSON.parse(values[1]);
   else if(target.includes('StringBuilder;-><init>'))values[0].value='';
   else if(target.includes('StringBuilder;->append')){values[0].value+=String(values[1]);result=values[0];}
   else if(target.includes('StringBuilder;->toString'))result=values[0].value;
   else if(target.includes('JSONObject;->optString'))result=String(values[0].json[values[1]]??values[2]);
   else if(target.includes('JSONObject;->optLong'))result=Math.trunc(number(values[0].json[values[1]]??values[2]));
   else if(target.includes('JSONObject;->optBoolean'))result=values[0].json[values[1]]??!!values[2];
   else if(target.includes('String;->isEmpty'))result=values[0].length===0;
   else if(target.includes('String;->equals'))result=values[0]===values[1];
   else if(target.includes('Activity;->findViewById'))result=values[0].views[values[1]]??null;
   else if(target.includes('View;->findViewWithTag'))result=values[0].tags[values[1]]??null;
   else if(target.includes('MainActivity;->updateLot1Remaining'))interpret('updateLot1Remaining',{p0:values[0],p1:values[1],p3:values[3]});
   else if(target.includes('MainActivity;->formatNativeTime'))result=interpret('formatNativeTime',{p0:values[0]});
   else if(target.includes('Long;->valueOf'))result=values[0];
   else if(target.includes('String;->format')){
    let i=0;result=values[1].replace(/%0?(\d*)d/g,(_,w)=>String(values[2][i++]).padStart(Number(w||0),'0'));
   }
   else if(target.includes('NativeImageLoader;->load')){}
   else if(target.includes(';->setText'))values[0].text=values[1];
   else if(target.includes(';->setProgress'))values[0].progress=values[1];
   else if(target.includes(';->setMax'))values[0].max=values[1];
   else if(target.includes(';->setImageResource'))values[0].image=values[1];
   else if(target.includes(';->setVisibility'))values[0].visibility=values[1];
   else throw Error(`unsupported invoke ${target}`);
  }
  else if(op==='return-object')return val(args);
  else if(op==='return-void')return;
  else throw Error(`unsupported opcode: ${line}`);
  if(!Number.isInteger(pc)||pc<0)throw Error(`invalid branch: ${line}`);
 }
 throw Error(`no return in ${name}`);
}
function capturePayload(position,duration,useMedia=false){
 const html=`<!doctype html><body><main id="main-view"></main><div data-testid="now-playing-bar"><a data-testid="context-item-link">Fixture</a></div><span data-testid="playback-position">${position}</span><span data-testid="playback-duration">${duration}</span>${useMedia?'<audio></audio>':''}</body>`;
 const dom=new JSDOM(html,{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()});
 const w=dom.window,events=[];
 if(useMedia){const audio=w.document.querySelector('audio');Object.defineProperty(audio,'currentTime',{value:38});Object.defineProperty(audio,'duration',{value:141});}
 w.AndBridge={onNativeUiData:(type,json)=>{if(type==='player')events.push(JSON.parse(json))},onNativeUiReady(){},onNativeUiRoute(){}};
 w.setTimeout=()=>1;w.setInterval=()=>1;w.clearTimeout=w.clearInterval=()=>{};
 w.MutationObserver=class{observe(){}disconnect(){}};
 w.eval(shell);
 assert.equal(w.__sfNativeUiShellCompleted,true,'shell must finish installation');
 assert.ok(events.length,'shell must publish player payload');
 dom.window.close();return events[0];
}
function render(payload){
 const views={};
 for(const id of [0x7f090236,0x7f09023b,0x7f090237,0x7f09023c,0x7f090244,0x7f090245,0x7f09023d,0x7f09024d,0x7f09024a,0x7f09024b,0x7f090238,0x7f09023e,0x7f09024c])views[id]={};
 const remaining={}; views[0x7f09023a]={tags:{nativePlayerRemaining:remaining}};
 const native={screen:'player',views};
 interpret('updateNativePlayer',{p0:native,p1:JSON.stringify(payload)});
 return {position:views[0x7f09024a].text,duration:views[0x7f09024b].text,remaining:remaining.text};
}
for(const [clock,seconds] of [['0:05',5],['0:59',59],['1:00',60],['9:59',599],['10:00',600],['59:59',3599],['1:00:00',3600],['1:01:01',3661]]){
 test(`shell → native labels: ${clock} (${seconds} seconds)`,()=>{
  const payload=capturePayload(clock,clock);assert.equal(payload.position,seconds);assert.equal(payload.duration,seconds);
  assert.deepEqual(render(payload),{position:clock,duration:clock,remaining:'Temps restant : 0:00'});
  const remainingPayload=capturePayload('0:00',clock);
  assert.equal(render(remainingPayload).remaining,`Temps restant : ${clock}`);
 });
 test(`decoded widget formatter: ${clock} (${seconds * 1000} ms)`,()=>{
  assert.equal(interpret('b',{p0:seconds*1000},widget),clock);
 });
}
test('HTML media values are seconds and are not divided by 1000',()=>{
 const p=capturePayload('0:00','0:00',true);assert.equal(p.position,38);assert.equal(p.duration,141);
 assert.deepEqual(render(p),{position:'0:38',duration:'2:21',remaining:'Temps restant : 1:43'});
});
test('remaining duration handles missing and out-of-range input',()=>{
 assert.equal(render({duration:0,position:0}).remaining,'Temps restant : —');
 assert.equal(render({duration:3600,position:3661}).remaining,'Temps restant : 0:00');
 assert.equal(render({duration:3661,position:-10}).remaining,'Temps restant : 1:01:01');
});
test('clamps negative native input and pads both hour components',()=>{
 assert.equal(interpret('formatNativeTime',{p0:-5}),'0:00');
 assert.equal(interpret('formatNativeTime',{p0:3665}),'1:01:05');
});
