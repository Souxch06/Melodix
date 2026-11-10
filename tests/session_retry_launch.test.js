'use strict';
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs'), vm=require('node:vm');
const source=fs.readFileSync('smali/com/melodix/music/NativeSessionRetryLaunch.smali','utf8');
function method(name){let a=source.indexOf('.method '+name);assert.ok(a>=0);return source.slice(a,source.indexOf('.end method',a)).split('\n').map(x=>x.trim());}
// Run the actual smali branches with small fake WebView/Handler/clock primitives.
function harness(){
 const f={generation:9,documentGeneration:1,loginActive:0,state:0,now:0,queue:[],calls:[],failures:[],events:[],notes:[],pendingCallbacks:[]};
 f.window={AndBridge:{getSessionGeneration:()=>f.generation},__sfNativeUiShellStarted:true}; f.location={protocol:'https:',hostname:'open.spotify.com'};
 const obj={generation:9,documentGeneration:1,deadline:8000,pending:0,finished:0,webview:{}};
 const cls={Gate:f,Trace:f,NativeSessionRetryLaunch:obj};
 function run(name,arg){const code=method(name),labels=Object.fromEntries(code.map((x,i)=>[x,i])),r={p0:obj,p1:arg};let result;
  for(let pc=0,n=0;pc<code.length&&n++<1000;pc++){let x=code[pc],m;if(!x||/^[.#:]/.test(x))continue;
   if((m=x.match(/^const-string (\w+), (".*")$/))){r[m[1]]=JSON.parse(m[2]);continue;}
   if((m=x.match(/^const(?:\/4|\/16|-wide\/16)? (\w+), (\S+)/))){r[m[1]]=Number(m[2]);continue;}
   if((m=x.match(/^sget(?:-boolean)? (\w+), Lcom\/melodix\/music\/NativeSession(Gate|Trace);->(\w+):/))){r[m[1]]=cls[m[2]][m[3]];continue;}
   if((m=x.match(/^iget(?:-boolean|-object|-wide)? (\w+), (\w+), .*->(\w+):/))){r[m[1]]=r[m[2]][m[3]];continue;}
   if((m=x.match(/^iput(?:-boolean|-object)? (\w+), (\w+), .*->(\w+):/))){r[m[2]][m[3]]=r[m[1]];continue;}
   if((m=x.match(/^if-(eqz|nez|gez) (\w+), (:\w+)/))){if(m[1]==='eqz'?!r[m[2]]:m[1]==='nez'?!!r[m[2]]:r[m[2]]>=0)pc=labels[m[3]];continue;}
   if((m=x.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
   if((m=x.match(/^instance-of (\w+), (\w+), Ljava\/lang\/String;/))){r[m[1]]=typeof r[m[2]]==='string';continue;}
   if((m=x.match(/^add-int\/lit8 (\w+), (\w+), (\S+)/))){r[m[1]]=r[m[2]]+(m[3].startsWith('-0x')?-parseInt(m[3].slice(1),16):Number(m[3]));continue;}
   if((m=x.match(/^cmp-long (\w+), (\w+), (\w+)/))){r[m[1]]=Math.sign(r[m[2]]-r[m[3]]);continue;}
   if((m=x.match(/^new-instance (\w+), (\S+)/))){r[m[1]]=m[2].includes('StringBuilder')?{str:''}:{};continue;}
   if((m=x.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const args=m[1]?m[1].split(', ').map(k=>r[k]):[],c=m[2];result=undefined;
    if(c.includes('elapsedRealtime'))result=f.now;
    else if(c.includes('Reference;->get'))result=args[0];
    else if(c.includes('getMainLooper'))result={};
    else if(c.includes('-><init>')){} 
    else if(c.includes('StringBuilder;->append')){args[0].str+=args[1];result=args[0];}
    else if(c.includes('StringBuilder;->toString'))result=args[0].str;
    else if(c.includes('String;->equals'))result=args[0]===args[1];
    else if(c.includes('String;->matches'))result=new RegExp('^(?:'+args[1]+')$').test(args[0]);
    else if(c.includes('String;->length'))result=args[0].length;
    else if(c.includes('String;->substring'))result=args[0].slice(args[1],args[2]);
    else if(c.includes('evaluateJavascript')){f.calls.push(args[1]);f.pendingCallbacks.push(args[2]);}
    else if(c.includes('postDelayed')){f.queue.push(f.now+args[2]);result=1;}
    else if(c.includes('->fail(Ljava/lang/String;)'))run('private fail(',args[1]);
    else if(c.includes('->retryFailed'))f.failures.push(args[1]);
    else if(c.includes('->note'))f.notes.push(args[2]);
    else if(c.includes('->sessionMark'))f.events.push(args[0]);
    else assert.fail('unsupported '+c);continue;}
   if((m=x.match(/^move-result(?:-object|-wide)? (\w+)/))){r[m[1]]=result;continue;}
   if(x.startsWith('check-cast '))continue;
   if(x==='return-void')return;
   assert.fail('unsupported instruction '+x);
  }assert.fail('did not return');
 }
 f.tick=()=>{assert.ok(f.queue.length);f.now=f.queue.shift();run('public final run(');};
 f.start=()=>run('public final run(');
 f.reply=(response)=>{assert.ok(f.pendingCallbacks.length);f.pendingCallbacks.shift();run('public final onReceiveValue(',response);};
 f.evaluate=()=>vm.runInNewContext(f.calls.at(-1),{window:f.window,location:f.location});
 f.obj=obj;return f;
}
test('the actual poller waits for the hook, then dispatches once; repeated ticks do not duplicate',()=>{
 const f=harness();let loads=0,requests=0;f.window.__sfLoadBundledBridge=()=>loads++;
 f.start();assert.equal(f.evaluate(),'session-probe result=hook');f.reply('"session-probe result=hook"');f.tick();assert.equal(f.evaluate(),'session-probe result=hook');f.reply('"session-probe result=hook"');assert.equal(loads,1);
 f.window.__sfRequestSessionVerification=()=>{requests++;return Promise.resolve();};f.tick();assert.equal(f.evaluate(),'verification-dispatched');f.reply('"verification-dispatched"');f.tick();assert.equal(requests,1);assert.deepEqual(f.failures,[]);assert.ok(f.events.includes('session-verify result=dispatched'));
});
test('unavailable hook or missing callback ends boundedly with explicit failure',()=>{
 for(const respond of [true,false]){const f=harness();f.start();while(f.queue.length){if(respond&&f.pendingCallbacks.length)f.reply('"session-probe result=hook"');f.tick();}assert.deepEqual(f.failures,[respond?'retry-js-unavailable':'retry-launch-failed']);assert.ok(f.now>=8000);}
});
test('navigation replacement, generation change and stale callback cannot dispatch or mutate newer verification',()=>{
 let f=harness();f.start();f.documentGeneration++;f.reply('"verification-dispatched"');assert.deepEqual(f.failures,['retry-launch-failed']);f.tick();assert.equal(f.calls.length,1);
 f=harness();f.start();f.generation++;assert.equal(f.evaluate(),'session-probe result=generation-newer');f.reply('"verification-dispatched"');f.tick();assert.deepEqual(f.failures,[]);assert.equal(f.calls.length,1);
});
test('blocked hook returns a fixed failure and does not loop; non-player never invokes it',()=>{
 const f=harness();let n=0;f.window.__sfRequestSessionVerification=()=>{n++;return false;};f.start();f.location.hostname='accounts.spotify.com';assert.equal(f.evaluate(),'session-probe result=page');assert.equal(n,0);f.location.hostname='open.spotify.com';assert.equal(f.evaluate(),'verification-bloquee');f.reply('"verification-bloquee"');f.tick();assert.equal(n,1);assert.deepEqual(f.failures,['retry-blocked']);
});
test('navigation epoch and admission guard are wired to real main-frame and gate paths',()=>{
 const t=fs.readFileSync('smali/com/melodix/music/NativeSessionTrace.smali','utf8'),client=fs.readFileSync('smali/c91.smali','utf8'),rec=fs.readFileSync('smali/com/melodix/music/NativeSessionRecovery.smali','utf8');
 assert.match(client,/onPageStarted[\s\S]*?NativeSessionTrace;->start/);assert.match(t,/start\(Ljava\/lang\/String;\)V[\s\S]*?documentGeneration:I/);assert.match(rec,/VerificationFlight;->busy\(\)Z[\s\S]*?NativeSessionRetryLaunch;-><init>/);
});

test('probe distinguishes page, missing native interface, shell, loader, hook, and generation without sensitive values',()=>{
 const f=harness();f.start();delete f.window.AndBridge;assert.equal(f.evaluate(),'session-probe result=interface');f.reply('"session-probe result=interface"');assert.ok(f.events.includes('session-probe result=interface'));
 f.tick();f.window.AndBridge={getSessionGeneration:()=>9};f.window.__sfNativeUiShellStarted=false;assert.equal(f.evaluate(),'session-probe result=shell');f.reply('"session-probe result=shell"');
 f.tick();f.window.__sfNativeUiShellStarted=true;assert.equal(f.evaluate(),'session-probe result=loader');f.reply('"session-probe result=loader"');
 f.tick();f.window.__sfLoadBundledBridge=()=>{};assert.equal(f.evaluate(),'session-probe result=hook');f.reply('"session-probe result=hook"');
 assert.deepEqual(f.events.filter(x=>x.startsWith('session-probe')),['session-probe result=interface','session-probe result=shell','session-probe result=loader','session-probe result=hook']);
});
test('closed timing grammar admits retry and probe labels, rejects arbitrary content',()=>{
 const s=fs.readFileSync('smali/com/melodix/music/NativeStartupTiming.smali','utf8'),a=s.indexOf('.method public static sessionMark('),b=s.indexOf('.end method',a);const literal=s.slice(a,b).match(/const-string v0, "(session-history stage=.*)"/)[1],re=new RegExp('^(?:'+literal+')$');
 for(const x of ['session-verify result=waiting','session-verify result=dispatched','session-verify result=document-changed','session-probe result=interface','session-probe result=shell','session-probe result=generation-type','session-probe result=generation-older','session-probe result=generation-newer','session-probe result=generation-null','session-probe result=generation-undefined','session-probe result=generation-string','session-probe result=generation-boolean','session-probe result=generation-other','session-probe result=generation-number-invalid'])assert.ok(re.test(x),x);
 for(const x of ['session-probe result=token','session-probe result=interface url=private','session-verify result=private'])assert.equal(re.test(x),false);
});
test('login return waits for an actual player start rather than getUrl changing on an earlier finish',()=>{
 const t=fs.readFileSync('smali/com/melodix/music/NativeSessionTrace.smali','utf8'),client=fs.readFileSync('smali/c91.smali','utf8'),g=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8');
 const origin=t.slice(t.indexOf('.method public static playerOrigin('),t.indexOf('.end method',t.indexOf('.method public static playerOrigin(')));
 for(const x of ['getScheme()','https','getHost()','open.spotify.com','getPort()','0x1bb'])assert.ok(origin.includes(x),x);
 const start=t.slice(t.indexOf('.method public static start('),t.indexOf('.end method',t.indexOf('.method public static start(')));
 assert.match(start,/playerOrigin\(Ljava\/lang\/String;\)Z[\s\S]*?lastStartedPlayer:Z/);
 const gate=g.slice(g.indexOf('.method public static pageFinished('),g.indexOf('.end method',g.indexOf('.method public static pageFinished(')));
 assert.match(gate,/lastStartedPlayer:Z[\s\S]*?if-nez v0, :player_started[\s\S]*?goto :done[\s\S]*?:player_started[\s\S]*?->verify/);
 assert.match(client,/onPageStarted[\s\S]*?NativeSessionTrace;->start/);
});
// Interpret the actual pageFinished smali for the observed finish/start/finish ordering.
function runPageFinished(f){
 const src=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8'),a=src.indexOf('.method public static pageFinished('),lines=src.slice(a,src.indexOf('.end method',a)).split('\n').map(x=>x.trim()),labels=Object.fromEntries(lines.map((l,i)=>[l,i]));
 const r={p0:f.activity},refs={loginActive:f.loginActive,lastStartedPlayer:f.lastStartedPlayer};let result;
 for(let pc=0,n=0;pc<lines.length&&n++<200;pc++){let x=lines[pc],m;if(!x||/^[.#:]/.test(x))continue;
  if((m=x.match(/^sget-boolean (\w+), .*->(\w+):Z/))){r[m[1]]=refs[m[2]];continue;}
  if((m=x.match(/^iget(?:-boolean|-object)? (\w+), (\w+), .*->(\w+):/))){r[m[1]]=r[m[2]][m[3]];continue;}
  if((m=x.match(/^iput-boolean (\w+), (\w+), .*->(\w+):/))){r[m[2]][m[3]]=r[m[1]];continue;}
  if((m=x.match(/^const\/4 (\w+), (\S+)/))){r[m[1]]=Number(m[2]);continue;}
  if((m=x.match(/^const-string (\w+), (".*")$/))){r[m[1]]=JSON.parse(m[2]);continue;}
  if((m=x.match(/^if-(eqz|nez) (\w+), (:\w+)/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
  if((m=x.match(/^goto (:\w+)/))){pc=labels[m[1]];continue;}
  if((m=x.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const args=m[1]?m[1].split(', ').map(k=>r[k]):[],c=m[2];result=undefined;
   if(c.includes('isLoginWebPath'))result=f.loginPath;
   else if(c.includes('applySessionLoginSurface'))f.calls.push('surface');
   else if(c.includes('getUrl'))result=f.url;
   else if(c.includes('Uri;->parse'))result=new URL(args[0]);
   else if(c.includes('getHost'))result=args[0].hostname;
   else if(c.includes('String;->equals'))result=args[0]===args[1];
   else if(c.includes('sessionMark'))f.calls.push(args[0]);
   else if(c.includes('flushCookies'))f.calls.push('flush');
   else if(c.includes('->verify')){f.calls.push('verify');f.loginActive=false;}
   else assert.fail('unsupported '+c);continue;
  }
  if((m=x.match(/^move-result(?:-object)? (\w+)/))){r[m[1]]=result;continue;}
  if(x==='return-void')return;assert.fail('unsupported '+x);
 }assert.fail('did not return');
}
test('actual login-return method waits across the observed stale finish, then launches once after player start',()=>{
 const f={loginActive:true,lastStartedPlayer:false,loginPath:false,url:'https://open.spotify.com/',activity:{G:{},nativeLoginPageCommitted:1,nativeLoginWebRequested:1},calls:[]};
 runPageFinished(f);assert.deepEqual(f.calls,['session-verify result=await-player-start']);assert.equal(f.activity.nativeLoginPageCommitted,1);assert.equal(f.loginActive,true);
 f.lastStartedPlayer=true;runPageFinished(f);assert.deepEqual(f.calls,['session-verify result=await-player-start','flush','verify']);assert.equal(f.activity.nativeLoginPageCommitted,0);assert.equal(f.loginActive,false);
 runPageFinished(f);assert.equal(f.calls.filter(x=>x==='verify').length,1);
});

test('generation mismatch diagnosis remains strict and emits only fixed categories',()=>{
 for(const [value,want] of [[8,'generation-older'],[10,'generation-newer'],['9','generation-string'],['secret','generation-string'],[null,'generation-null'],[undefined,'generation-undefined'],[true,'generation-boolean'],[{},'generation-other'],[NaN,'generation-number-invalid'],[1.5,'generation-number-invalid']]){
  const f=harness();let calls=0;f.window.AndBridge.getSessionGeneration=()=>value;f.window.__sfRequestSessionVerification=()=>{calls++;return true;};f.start();
  const label='session-probe result='+want;assert.equal(f.evaluate(),label);f.reply(JSON.stringify(label));assert.equal(calls,0);assert.ok(f.events.includes(label));
 }
});

test('unusable primitive falls back only to an exact native text generation, never a stale number',()=>{
 for (const [value,text,want] of [[undefined,'9',true],[null,'9',true],['9','9',true],[NaN,'9',true],[8,'9',false],[10,'9',false],[undefined,'8',false],[undefined,'09',false],[undefined,9,false],[undefined,'PRIVATE',false]]) {
  const f=harness();let calls=0,seen=null;f.window.AndBridge.getSessionGeneration=()=>value;f.window.AndBridge.getSessionGenerationText=()=>text;f.window.__sfRequestSessionVerification=g=>{calls++;seen=g;return true;};f.start();const result=f.evaluate();
  if(want){assert.equal(result,'verification-dispatched');assert.equal(calls,1);assert.equal(seen,9);}else{assert.match(result,/^session-probe result=generation-/);assert.equal(calls,0);assert.doesNotMatch(result,/PRIVATE/);}
 }
});
test('fallback with throwing or absent getters fails closed without leaking exception text',()=>{
 for(const text of [undefined,()=>{throw Error('PRIVATE');},()=>null]){const f=harness();let n=0;f.window.AndBridge.getSessionGeneration=()=>{throw Error('PRIVATE');};if(text)f.window.AndBridge.getSessionGenerationText=text;f.window.__sfRequestSessionVerification=()=>{n++;};f.start();assert.equal(f.evaluate(),'session-probe result=generation-undefined');assert.equal(n,0);}
});
