'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm'),cp=require('node:child_process');
const {diagnosticVm}=require('./helpers/session_diagnostic_vm');
const read=n=>fs.readFileSync(n,'utf8'),dir='smali/com/melodix/music/';
const js=read('scripts/spotify_bridge.source.js');
const fn=(s,n)=>{const a=s.indexOf('    function '+n+'(');assert.ok(a>=0,n);return s.slice(a,s.indexOf('\n    }',a)+6);};
// Execute the real admission/finish smali. Clock and static fields replace Android only.
function flightVm(){
 const src=read(dir+'NativeSessionVerificationFlight.smali');let now=1000;
 const fields={Gate:{generation:1,loginActive:false},Flight:{generation:-1,until:0}},timers=[];let refreshes=0;
 function run(name,...args){
  const a=src.search(new RegExp('^\\.method public (?:static |final )?'+name+'\\(','m')),code=src.slice(a,src.indexOf('.end method',a)).split('\n').map(s=>s.trim());
  const labels=Object.fromEntries(code.map((s,i)=>[s,i])),r=Object.fromEntries(args.map((v,i)=>['p'+i,v]));let result;
  for(let pc=0,steps=0;pc<code.length&&steps++<1000;pc++){
   const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
   if((m=l.match(/^const-string (\w+), (.*)$/))){r[m[1]]=JSON.parse(m[2]);continue;}
   if((m=l.match(/^const(?:-wide)?(?:\/4|\/16)? (\w+), (.*)$/))){r[m[1]]=Number(m[2]);continue;}
   if((m=l.match(/^(sget|sput)(?:-wide|-boolean)? (\w+), .*NativeSession(Gate|VerificationFlight);->(\w+):/))){const f=fields[m[3]==='Gate'?'Gate':'Flight'];if(m[1]==='sget')r[m[2]]=f[m[4]];else f[m[4]]=r[m[2]];continue;}
   if((m=l.match(/^move-result(?:-wide|-object)? (\w+)$/))){r[m[1]]=result;continue;}
   if((m=l.match(/^add-long\/2addr (\w+), (\w+)$/))){r[m[1]]+=r[m[2]];continue;}
   if((m=l.match(/^cmp-long (\w+), (\w+), (\w+)$/))){r[m[1]]=Math.sign(r[m[2]]-r[m[3]]);continue;}
   if((m=l.match(/^if-(eqz|nez|gez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:m[1]==='nez'?!!r[m[2]]:r[m[2]]>=0)pc=labels[m[3]];continue;}
   if((m=l.match(/^if-ne (\w+), (\w+), (:\w+)$/))){if(r[m[1]]!==r[m[2]])pc=labels[m[3]];continue;}
   if((m=l.match(/^iget (\w+), (\w+), .*->(\w+):/))){r[m[1]]=r[m[2]][m[3]];continue;}
   if(l.startsWith('new-instance ')){r[l.split(/[ ,]+/)[1]]={};continue;}
   if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const args=m[1]?m[1].split(', ').map(k=>r[k]):[],c=m[2];
    if(c.includes('SystemClock;->elapsedRealtime'))result=now;
    else if(c.includes('Looper;->getMainLooper'))result={main:true};
    else if(c.includes('Handler;-><init>')){}
    else if(c.includes('VerificationFlight;-><init>'))args[0].expectedGeneration=args[1];
    else if(c.includes('Handler;->postDelayed')){timers.push({task:args[1],at:now+args[2]});result=true;}
    else if(c.includes('SurfaceExtras;->retryState'))refreshes++;
    else if(c.includes('JSONObject;-><init>'))Object.assign(args[0],JSON.parse(args[1]));
    else if(c.includes('->optBoolean'))result=args[0][args[1]]===true;
    else if(c.includes('->optInt'))result=Number(args[0][args[1]])||0;
    else assert.fail(c);continue;
   }
   if((m=l.match(/^return (\w+)$/)))return r[m[1]];
   if(l==='return-void')return;
   assert.fail('unsupported '+l);
  }assert.fail('no return');
 }
 return {fields,run,timers,get refreshes(){return refreshes;},at:v=>{now=v;},finish:o=>run('finish',JSON.stringify(o))};
}
test('real native lock survives presentation deadline, ignores taps without extending its 15s window',()=>{
 const f=flightVm();f.run('start');const until=f.fields.Flight.until;
 for(const time of [1000,1500,4000,10000,15999]){f.at(time);assert.equal(f.run('busy'),1);assert.equal(f.fields.Flight.until,until);assert.equal(f.fields.Gate.generation,1);}
 f.at(16000);assert.equal(f.run('busy'),0);
 // Bounded admission opens, but no evidence/HTTP/state is fabricated.
 assert.deepEqual(Object.keys(f.fields.Flight).sort(),['generation','until']);
});
test('real finish releases only completed current generation; old result cannot unlock newer verification',()=>{
 const f=flightVm();f.run('start');f.finish({generation:1,completed:false});assert.equal(f.run('busy'),1);
 f.finish({generation:0,completed:true});assert.equal(f.run('busy'),1);
 f.finish({generation:1,completed:true});assert.equal(f.run('busy'),0);
 f.fields.Gate.generation=2;f.run('start');f.finish({generation:1,completed:true});assert.equal(f.run('busy'),1);
 f.fields.Gate.loginActive=true;assert.equal(f.run('busy'),0,'login return must not be swallowed');
});
test('admission guard precedes begin/JS; flight release follows classification and is not in 3s deadline',()=>{
 const r=read(dir+'NativeSessionRecovery.smali');assert.ok(r.indexOf('->busy()Z')<r.indexOf('->begin('));
 const block=r.slice(r.indexOf('->busy()Z'),r.indexOf('\n    :verify_begin\n'));assert.match(block,/relance=ignoree-verification-en-cours/);assert.match(block,/goto :verify_done/);
 const t=read(dir+'NativeSessionGateTask.smali');assert.ok(t.indexOf('->result(')<t.indexOf('->finish('));assert.doesNotMatch(t.slice(t.indexOf('    :deadline')),/VerificationFlight/);
});
test('independent native start creates a visible unknown attempt and does not fabricate token/HTTP observations',()=>{
 const d=diagnosticVm();d.record({generation:2,attempt:0,reason:'relance-demandee'});d.run('started',2,2);
 assert.match(d.text(),/Tentative 2\/2.*token API=inconnu · repli=inconnu · bibliothèque=inconnu · terminée=non · cookie=c1.*token=inconnu/);
 assert.match(d.text(),/Relance 2\/0 · relance demandée, tentative réseau démarrée/);
 d.record({generation:2,attempt:2,completed:true,apiHttp:400,fallbackHttp:403,libraryHttp:401,tokenResult:'refused'});
 d.run('started',2,2);assert.match(d.text(),/bibliothèque=401 · terminée=oui/);
});
test('closed channel failure fallback enriches only diagnostics and never logs private exception text',()=>{
 const d=diagnosticVm(),failures=[];
 const c={window:{AndBridge:{onSessionAttemptDiagnostic:()=>{throw Error('SECRET');},onSessionDiagnosticFailure:(g,a,r)=>{failures.push(r);d.run('failure',g,a,r);}}},boundedMediaLibraryCount:(x,m)=>Math.max(0,Math.min(m,Number(x)||0)),safeMediaLibraryCheckSource:()=> 'native-retry'};
 vm.createContext(c);vm.runInContext(fn(js,'reportSessionDiagnosticFailure')+'\n'+fn(js,'publishSessionAttemptDiagnostic'),c);
 assert.doesNotThrow(()=>c.publishSessionAttemptDiagnostic({nativeGeneration:3,attempt:2,sessionObservation:{}},false));
 assert.deepEqual(failures,['canal=exception-js']);assert.match(d.text(),/canal=exception-js/);assert.doesNotMatch(d.text(),/SECRET/);
 delete c.window.AndBridge.onSessionAttemptDiagnostic;c.publishSessionAttemptDiagnostic({nativeGeneration:3,attempt:2,sessionObservation:{}},false);assert.equal(failures.at(-1),'canal=indisponible');
 c.window.AndBridge.onSessionDiagnosticFailure=()=>{throw Error('SECRET');};assert.doesNotThrow(()=>c.publishSessionAttemptDiagnostic({sessionObservation:{}},false));
 d.run('failure',3,2,'https://SECRET');assert.doesNotMatch(d.text(),/SECRET/);
});
test('actual checkMediaLib acknowledges native start before network even if detailed channel is unavailable',async()=>{
 const d=diagnosticVm(),events=[];
 const noop=()=>{};const c={window:{AndBridge:{getSessionGeneration:()=>2,onSessionAttemptStarted:(g,a)=>{events.push('start');d.run('started',g,a);},onSessionDiagnosticFailure:(g,a,r)=>d.run('failure',g,a,r)}},
 boundedMediaLibraryCount:(x,m)=>Math.max(0,Math.min(m,Number(x)||0)),safeMediaLibraryCheckSource:()=> 'native-retry',mediaLibraryAuthReady:()=>true,
 traceLibraryEvent:noop,traceHomeLibraryStage:noop,spotifyAuthUiState:()=> 'unknown',createMediaLibraryDiagnostic:()=>({attempt:2,source:'native-retry'}),mediaLibraryRequestGeneration:0,mediaLibraryCheckPromise:null,
 runMediaLibraryCheck:()=>{events.push('network');return new Promise(()=>{});},emitMediaLibraryDiagnostic:noop,notifyMediaLibUiChange:noop};
 vm.createContext(c);vm.runInContext(['reportSessionDiagnosticFailure','acknowledgeSessionAttemptStart','publishSessionAttemptDiagnostic','checkMediaLib'].map(n=>fn(js,n)).join('\n'),c);
 c.checkMediaLib(true,'native-retry');assert.deepEqual(events,['start']);await Promise.resolve();assert.deepEqual(events,['start','network']);
 assert.match(d.text(),/Tentative 2\/2.*bibliothèque=inconnu/);assert.match(d.text(),/canal=indisponible/);
});
test('generation guards, reconnect, Spotify request functions and proof publication unchanged from 127',()=>{
 const old=p=>cp.execFileSync('git',['show','6c6a22d:'+p],{encoding:'utf8'});
 const gate=read(dir+'NativeSessionGate.smali'),oldGate=old(dir+'NativeSessionGate.smali');
 const method=(s,n)=>{const a=s.indexOf('.method public static '+n+'(');return s.slice(a,s.indexOf('.end method',a));};
 assert.match(method(gate,'result'),/if-ne v1, v2, :rejected_generation/);
 assert.match(method(gate,'result'),/if-le v1, v2, :rejected_attempt/);
 assert.equal(method(gate,'begin').replace('    invoke-static {}, Lcom/melodix/music/NativeSessionVerificationFlight;->start()V\n',''),method(oldGate,'begin'));
 assert.equal(read(dir+'NativeSessionReconnect.smali'),old(dir+'NativeSessionReconnect.smali'));
 assert.match(read(dir+'NativeSessionEvidence.smali'),/canClear\(\)Z[\s\S]*?const\/4 v1, 0x1[\s\S]*?->current\(\)Ljava\/lang\/String;[\s\S]*?->equals/);
 assert.equal(fn(js,'publishSessionVerification'),fn(old('scripts/spotify_bridge.source.js'),'publishSessionVerification'));
 const asyncFn=(s,n,end)=>s.slice(s.indexOf('    async function '+n+'('),s.indexOf(end,s.indexOf('    async function '+n+'(')));
 assert.equal(asyncFn(js,'fetchWebPlayerToken','    function dropWebPlayerToken'),asyncFn(old('scripts/spotify_bridge.source.js'),'fetchWebPlayerToken','    function dropWebPlayerToken'));
 assert.equal(asyncFn(js,'fetchAllLibrary','    window.fetchAllLibrary'),asyncFn(old('scripts/spotify_bridge.source.js'),'fetchAllLibrary','    window.fetchAllLibrary'));
 const flight=read(dir+'NativeSessionVerificationFlight.smali');assert.doesNotMatch(flight,/Evidence|transition|loadUrl|Cookie|recordCurrent/);
});
test('relance and start acknowledgement failures use the same closed, non-recursive fallback',()=>{
 const notes=[],c={window:{AndBridge:{getSessionGeneration:()=>5,onSessionAttemptDiagnostic:()=>{throw Error('PRIVATE');},onSessionAttemptStarted:()=>{throw Error('PRIVATE');},onSessionDiagnosticFailure:(g,a,r)=>notes.push({g,a,r})}},boundedMediaLibraryCount:(x,m)=>Math.max(0,Math.min(m,Number(x)||0))};
 vm.createContext(c);vm.runInContext(['reportSessionDiagnosticFailure','publishSessionRelanceDiagnostic','acknowledgeSessionAttemptStart'].map(n=>fn(js,n)).join('\n'),c);
 c.publishSessionRelanceDiagnostic('native-retry','blocage=attente-429');c.acknowledgeSessionAttemptStart({nativeGeneration:5,attempt:7});
 assert.deepEqual(notes,[{g:5,a:0,r:'canal=exception-js'},{g:5,a:7,r:'canal=exception-js'}]);assert.doesNotMatch(JSON.stringify(notes),/PRIVATE/);
});

// Execute the real presentation method, replacing TextView/clock calls only.
function retryButtonVm(state,busy,loginActive=false){
 const primary={text:'Réessayer',enabled:true},secondary={text:'Réessayer',enabled:true};
 const fields={state,loginActive,overlay:{sessionAction:primary,sessionSecondary:secondary}};
 const src=read(dir+'NativeSessionSurfaceExtras.smali'),a=src.indexOf('.method public static retryState(');
 const code=src.slice(a,src.indexOf('.end method',a)).split('\n').map(s=>s.trim()),labels=Object.fromEntries(code.map((l,i)=>[l,i])),r={};let result;
 for(let pc=0,steps=0;pc<code.length&&steps++<1000;pc++){
  const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
  if((m=l.match(/^sget(?:-object|-boolean)? (\w+), .*->(\w+):/))){r[m[1]]=fields[m[2]];continue;}
  if((m=l.match(/^const-string (\w+), (.*)$/))){r[m[1]]=JSON.parse(m[2]);continue;}
  if((m=l.match(/^const\/4 (\w+), (.*)$/))){r[m[1]]=Number(m[2]);continue;}
  if((m=l.match(/^move-result(?:-object)? (\w+)$/))){r[m[1]]=result;continue;}
  if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
  if((m=l.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))){if(m[1]==='eq'?r[m[2]]===r[m[3]]:r[m[2]]!==r[m[3]])pc=labels[m[4]];continue;}
  if((m=l.match(/^goto (:\w+)$/))){pc=labels[m[1]];continue;}
  if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const args=m[1]?m[1].split(', ').map(k=>r[k]):[],call=m[2];
   if(call.includes('Surface;->text'))result=args[0][args[1]];
   else if(call.includes('VerificationFlight;->busy'))result=busy;
   else if(call.includes('->setText'))args[0].text=args[1];
   else if(call.includes('->setEnabled'))args[0].enabled=!!args[1];
   else assert.fail(call);continue;
  }
  if(l==='return-void')return {primary,secondary};
  assert.fail(l);
 }assert.fail('no return');
}
test('real retry button shows and disables ongoing verification, restores Retry at release; other actions untouched',()=>{
 for(const state of [4,2]){
  const locked=retryButtonVm(state,true),key=state===4?'primary':'secondary',other=state===4?'secondary':'primary';
  assert.equal(locked[key].text,'Vérification en cours…');assert.equal(locked[key].enabled,false);
  assert.equal(locked[other].text,'Réessayer');assert.equal(locked[other].enabled,true);
  const ready=retryButtonVm(state,false);assert.equal(ready[key].text,'Réessayer');assert.equal(ready[key].enabled,true);
 }
 for(const state of [0,1,3])assert.equal(retryButtonVm(state,true).primary.enabled,true);
 assert.equal(retryButtonVm(4,true,true).primary.text,'Réessayer','interactive login is not modified');
 const surface=read(dir+'NativeSessionSurface.smali'),extras=read(dir+'NativeSessionSurfaceExtras.smali');
 assert.match(surface,/->retryState\(\)V\n\s+invoke-virtual \{v0\}.*bringToFront/,'cached paint also refreshes button');
 const bind=extras.slice(extras.indexOf('.method public static bind('),extras.indexOf('.method public static motion('));assert.match(bind,/->retryState\(\)V/);
});
test('15s presentation wake and completion restore state without proof changes; stale wake cannot affect new generation',()=>{
 const f=flightVm();f.run('start');assert.equal(f.timers.length,1);assert.equal(f.timers[0].at,16000);
 const old=f.timers[0].task;f.at(16000);f.run('run',old);assert.equal(f.refreshes,1);assert.equal(f.run('busy'),0);
 f.fields.Gate.generation=2;f.run('start');const bound=f.fields.Flight.until;
 f.run('run',old);assert.equal(f.refreshes,1,'old timer does not repaint newer verification');assert.equal(f.fields.Flight.until,bound);
 f.finish({generation:2,completed:true});assert.equal(f.refreshes,2);assert.equal(f.run('busy'),0);
 const s=read(dir+'NativeSessionVerificationFlight.smali'),a=s.indexOf('.method public final run()');
 assert.doesNotMatch(s.slice(a),/Evidence|->transition|->begin|->finish|sput|Cookie/);
});
