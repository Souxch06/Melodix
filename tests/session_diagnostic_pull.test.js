'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
const {diagnosticVm}=require('./helpers/session_diagnostic_vm');
const root='smali/com/melodix/music/';
const read=p=>fs.readFileSync(p,'utf8');
const js=read('scripts/spotify_bridge.source.js');
function fn(n){const a=js.indexOf('    function '+n+'(');assert.ok(a>=0,n);return js.slice(a,js.indexOf('\n    }',a)+6);}
function pullVm(){
 const src=read(root+'NativeSessionDiagnosticPull.smali'),d=diagnosticVm(),logs=[],scheduled=[],evaluations=[];
 let currentGeneration=2,now=0;
 const web={alive:true},self={webview:{value:web},generation:2,remaining:30,deadline:30000,lastPayload:null,lastStatus:null};
 function run(name,...args){
  const m=new RegExp('^\\.method[^\\n]* '+name+'\\(','m').exec(src);assert.ok(m,name);
  const code=src.slice(m.index,src.indexOf('.end method',m.index)).split('\n').map(s=>s.trim());
  const labels=Object.fromEntries(code.map((s,i)=>[s,i])),r={p0:self,...Object.fromEntries(args.map((v,i)=>['p'+(i+1),v]))};let result;
  for(let pc=0,steps=0;pc<code.length&&steps++<2000;pc++){
   const l=code[pc];let x;if(!l||/^[.#:]/.test(l))continue;
   if((x=l.match(/^const-string (\w+), (.*)$/))){r[x[1]]=JSON.parse(x[2]);continue;}
   if((x=l.match(/^const(?:-wide)?(?:\/4|\/16)? (\w+), (.*)$/))){r[x[1]]=Number(x[2]);continue;}
   if((x=l.match(/^move-result(?:-object|-wide)? (\w+)$/))){r[x[1]]=result;continue;}
   if((x=l.match(/^iget(?:-object|-wide)? (\w+), (\w+), .*->(\w+):/))){r[x[1]]=r[x[2]][x[3]];continue;}
   if((x=l.match(/^iput(?:-object)? (\w+), (\w+), .*->(\w+):/))){r[x[2]][x[3]]=r[x[1]];continue;}
   if((x=l.match(/^sget (\w+), .*->generation:I/))){r[x[1]]=currentGeneration;continue;}
   if((x=l.match(/^cmp-long (\w+), (\w+), (\w+)$/))){r[x[1]]=Math.sign(r[x[2]]-r[x[3]]);continue;}
   if((x=l.match(/^add-int\/lit8 (\w+), (\w+), (.*)$/))){r[x[1]]=r[x[2]]+(x[3].startsWith('-0x')?-Number(x[3].slice(1)):Number(x[3]));continue;}
   if((x=l.match(/^instance-of (\w+), (\w+), Ljava\/lang\/String;$/))){r[x[1]]=typeof r[x[2]]==='string';continue;}
   if(l.startsWith('check-cast '))continue;
   if((x=l.match(/^new-instance (\w+), (.*)$/))){r[x[1]]={type:x[2]};continue;}
   if((x=l.match(/^if-(eqz|nez|lez|gez) (\w+), (:\w+)$/))){const v=r[x[2]];if(x[1]==='eqz'?!v:x[1]==='nez'?!!v:x[1]==='gez'?v>=0:v<=0)pc=labels[x[3]];continue;}
   if((x=l.match(/^if-(ne|gt) (\w+), (\w+), (:\w+)$/))){if(x[1]==='ne'?r[x[2]]!==r[x[3]]:r[x[2]]>r[x[3]])pc=labels[x[4]];continue;}
   if((x=l.match(/^goto (:\w+)$/))){pc=labels[x[1]];continue;}
   if(l==='return-void')return;
   if((x=l.match(/^invoke-\S+ \{([^}]*)\}, (L[^;]+;)->([^ (]+)\((.*)$/))){
    const a=x[1]?x[1].split(', ').map(k=>r[k]):[],c=x[2],method=x[3];
    if(c.includes('NativeSessionDiagnosticPull;')){result=run(method,...a.slice(1));continue;}
    if(c==='Ljava/lang/String;'){
     if(method==='equals')result=a[0]===a[1];else if(method==='length')result=a[0].length;else assert.fail(method);
    }else if(c==='Ljava/lang/StringBuilder;'){
     if(method==='<init>')a[0].text='';else if(method==='append'){a[0].text+=String(a[1]);result=a[0];}else if(method==='toString')result=a[0].text;else assert.fail(method);
    }else if(c==='Lorg/json/JSONObject;'){
     if(method==='<init>')a[0].data=JSON.parse(a[1]);
     else if(method==='optString')result=String(a[0].data[a[1]]??'');
     else if(method==='optInt'){const v=a[0].data[a[1]];result=Number.isFinite(Number(v))&&v!=null?Math.trunc(Number(v)):(a[2]??0);}else assert.fail(method);
    }else if(c==='Lcom/melodix/music/NativeStartupTiming;')logs.push(a[0]);
    else if(c==='Lcom/melodix/music/NativeSessionAttemptDiagnostic;'){
     if(method==='<init>')a[0].payload=a[1];else if(method==='run')d.run('record',a[0].payload);else assert.fail(method);
    }else if(c==='Ljava/lang/ref/Reference;')result=a[0].value?.alive?a[0].value:null;
    else if(c==='Landroid/webkit/WebView;')evaluations.push(a[1]);
    else if(c==='Landroid/os/SystemClock;')result=now;
    else if(c==='Landroid/os/Looper;')result={};
    else if(c==='Landroid/os/Handler;'){
     if(method==='postDelayed'){scheduled.push(a[2]);result=true;}else if(method!=='<init>')assert.fail(method);
    }else assert.fail(c+' '+method);
    continue;
   }
   assert.fail('unsupported '+name+': '+l);
  }assert.fail('did not terminate '+name);
 }
 return {self,web,d,logs,scheduled,evaluations,run,gen:v=>{currentGeneration=v;},at:v=>{now=v;}};
}
const payload=(g=2,a=2,more={})=>JSON.stringify({generation:g,attempt:a,source:'native-retry',apiHttp:null,fallbackHttp:null,libraryHttp:null,completed:false,tokenResult:'unknown',reason:'',...more});
test('JS stores only bounded sanitized retry snapshots even if detailed bridge throws',()=>{
 const failures=[],c={window:{AndBridge:{onSessionAttemptDiagnostic:()=>{throw Error('secret');},onSessionDiagnosticFailure:(g,a,r)=>failures.push(r)}},boundedMediaLibraryCount:(n,max)=>Math.max(0,Math.min(max,Number(n)||0)),safeMediaLibraryCheckSource:v=>v};
 vm.createContext(c);vm.runInContext([fn('reportSessionDiagnosticFailure'),fn('publishSessionAttemptDiagnostic')].join('\n'),c);
 const diag={nativeGeneration:2,attempt:2,source:'native-retry',sessionObservation:{apiHttp:400,fallbackHttp:403,libraryHttp:401,tokenResult:'refused',reason:'secret'}};
 c.publishSessionAttemptDiagnostic(diag,false);assert.equal(c.window.__sfSessionRetrySnapshot.generation,2);assert.equal(c.window.__sfSessionRetrySnapshot.libraryHttp,401);assert.equal(c.window.__sfSessionRetrySnapshot.reason,'');assert.deepEqual(failures,['canal=exception-js']);
 c.publishSessionAttemptDiagnostic(diag,true);assert.equal(c.window.__sfSessionRetrySnapshot.completed,true);
 const snapshot=c.window.__sfSessionRetrySnapshot;diag.source='shell-update';c.publishSessionAttemptDiagnostic(diag,false);assert.equal(c.window.__sfSessionRetrySnapshot,snapshot);
});
test('actual pull smali records and updates a 2/2 row without the bridge; duplicates do not regress completion',()=>{
 const p=pullVm();p.run('run');assert.equal(p.evaluations.length,1);assert.equal(p.self.remaining,29);
 p.run('onReceiveValue',payload());assert.match(p.d.text(),/Tentative 2\/2/);assert.match(p.d.text(),/terminée=non/);assert.equal(p.scheduled.length,1);
 p.run('onReceiveValue',payload(2,2,{completed:true,apiHttp:400,fallbackHttp:403,libraryHttp:401}));assert.match(p.d.text(),/bibliothèque=401/);assert.match(p.d.text(),/terminée=oui/);
 p.run('onReceiveValue',payload());assert.match(p.d.text(),/terminée=oui/);assert.match(p.d.text(),/bibliothèque=401/);
 assert.equal(p.d.rows.size,1);assert.ok(p.logs.every(x=>/^session-pull result=(accepted|empty|invalid|generation-mismatch|exception)$/.test(x)));
});
test('actual pull smali rejects foreign generation and invalid/empty payload without fabricating an attempt',()=>{
 const p=pullVm();p.run('onReceiveValue','null');p.run('onReceiveValue',payload(1));p.run('onReceiveValue',payload(2,0));p.run('onReceiveValue','x'.repeat(513));
 assert.equal(p.d.rows.size,0);assert.ok(p.logs.includes('session-pull result=empty'));assert.ok(p.logs.includes('session-pull result=generation-mismatch'));assert.ok(p.logs.includes('session-pull result=invalid'));
});
test('polling is bounded, weakly holds WebView, stops on generation change and cannot affect proof',()=>{
 const p=pullVm();p.self.remaining=1;p.run('run');assert.equal(p.self.remaining,0);p.run('onReceiveValue','null');assert.equal(p.scheduled.length,0);p.run('run');assert.equal(p.evaluations.length,1);
 const q=pullVm();q.gen(3);q.run('run');q.run('onReceiveValue',payload());assert.equal(q.evaluations.length,0);assert.equal(q.d.rows.size,0);
 const r=pullVm();r.web.alive=false;r.run('run');assert.equal(r.evaluations.length,0);
 const expired=pullVm();expired.at(30000);expired.run('run');expired.run('onReceiveValue',payload());assert.equal(expired.evaluations.length,0);assert.equal(expired.d.rows.size,0);
 const source=read(root+'NativeSessionDiagnosticPull.smali');assert.match(source,/Ljava\/lang\/ref\/WeakReference;/);assert.doesNotMatch(source,/NativeSessionEvidence|NativeSessionGate;->result|NativeSessionVerificationFlight/);
});
test('snapshot and telemetry do not modify requests, proof or export sensitive data',()=>{
 const native=read(root+'NativeSessionRecovery.smali'),pull=read(root+'NativeSessionDiagnosticPull.smali'),pattern=read(root+'NativeStartupTiming.smali');
 assert.match(native,/__sfSessionRetrySnapshot=null/);assert.match(native,/NativeSessionDiagnosticPull;->run\(\)V/);
 assert.match(pattern,/session-pull result=\(accepted\|empty\|invalid\|generation-mismatch\|exception\)/);
 assert.doesNotMatch(pull,/cookie|https?:\/\/|authorization|printStackTrace|->getMessage\(/i);
 const previous=require('node:child_process').execFileSync('git',['show','04a26c8131691c9d0814254053ab359f024c342c:scripts/spotify_bridge.source.js'],{encoding:'utf8'});
 const start=s=>s.slice(s.indexOf('    async function fetchAllLibrary('),s.indexOf('    function ',s.indexOf('    async function fetchAllLibrary(')+10));
 assert.equal(start(js),start(previous));
});
test('real retry check supplies an independent initial snapshot before work when both observation interfaces are absent',async()=>{
 const noop=()=>{},events=[];
 const c={window:{AndBridge:{getSessionGeneration:()=>2}},boundedMediaLibraryCount:(x,m)=>Math.max(0,Math.min(m,Number(x)||0)),safeMediaLibraryCheckSource:v=>v,
  mediaLibraryAuthReady:()=>true,traceLibraryEvent:noop,traceHomeLibraryStage:noop,spotifyAuthUiState:()=> 'unknown',
  createMediaLibraryDiagnostic:()=>({attempt:2,source:'native-retry'}),mediaLibraryRequestGeneration:0,mediaLibraryCheckPromise:null,
  runMediaLibraryCheck:d=>{events.push('network');c.observeSessionAttempt(d,'libraryHttp',401);c.publishSessionAttemptDiagnostic(d,true);return Promise.resolve();},
  emitMediaLibraryDiagnostic:noop,notifyMediaLibUiChange:noop};
 vm.createContext(c);vm.runInContext(['reportSessionDiagnosticFailure','acknowledgeSessionAttemptStart','publishSessionAttemptDiagnostic','observeSessionAttempt','checkMediaLib'].map(fn).join('\n'),c);
 const work=c.checkMediaLib(true,'native-retry');assert.deepEqual(events,[]);assert.equal(c.window.__sfSessionRetrySnapshot.completed,false);
 const p=pullVm();p.run('onReceiveValue',JSON.stringify(c.window.__sfSessionRetrySnapshot));assert.match(p.d.text(),/Tentative 2\/2.*bibliothèque=inconnu/);
 await work;assert.deepEqual(events,['network']);p.run('onReceiveValue',JSON.stringify(c.window.__sfSessionRetrySnapshot));assert.match(p.d.text(),/bibliothèque=401 · terminée=oui/);
});
test('pull expression exports only closed fields and never attacker-supplied arbitrary text',()=>{
 const s=read(root+'NativeSessionDiagnosticPull.smali');const match=s.match(/^    const-string v0, ("\(function\(\).*__sfSessionRetrySnapshot.*)$/m);assert.ok(match);
 const expression=JSON.parse(match[1]);const c={window:{__sfSessionRetrySnapshot:{source:'native-retry',generation:2,attempt:2,apiHttp:'PRIVATE',fallbackHttp:403,libraryHttp:401,completed:true,tokenResult:'secret',reason:'secret',extra:'private'}}};
 vm.createContext(c);const value=vm.runInContext(expression,c);assert.equal(value.generation,2);assert.equal(value.apiHttp,null);assert.equal(value.fallbackHttp,403);assert.equal(value.tokenResult,'unknown');assert.equal(value.reason,'');assert.doesNotMatch(JSON.stringify(value),/PRIVATE|secret|private/);
 c.window.__sfSessionRetrySnapshot.source='shell-update';assert.equal(vm.runInContext(expression,c),null);
});
test('session telemetry is in-memory, bounded by a closed grammar, and does not commit preferences on UI',()=>{
 const s=read(root+'NativeStartupTiming.smali'),a=s.indexOf('.method public static sessionMark('),b=s.indexOf('.end method',a),body=s.slice(a,b);
 assert.ok(a>=0);assert.match(body,/NativeStartupTiming;->record\(Ljava\/lang\/String;\)V/);assert.doesNotMatch(body,/SharedPreferences|->commit\(|NativeCrashGuard;->diagLine/);
 const m=body.match(/const-string v0, "(session-history stage=.*)"/);assert.ok(m);const re=new RegExp('^(?:'+m[1]+')$');
 for(const v of ['session-history stage=start-received','session-history stage=view-updated','session-pull result=accepted','session-pull result=generation-mismatch'])assert.ok(re.test(v),v);
 for(const v of ['session-pull result=secret','session-history stage=view-updated url=https://secret','session-history stage=PRIVATE'])assert.equal(re.test(v),false);
});
