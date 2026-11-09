'use strict';
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs'), vm=require('node:vm');
const source=fs.readFileSync('smali/com/melodix/music/NativeSessionRetryLaunch.smali','utf8');
function method(name){let a=source.indexOf('.method '+name);assert.ok(a>=0);return source.slice(a,source.indexOf('.end method',a)).split('\n').map(x=>x.trim());}
// Run the actual smali branches with small fake WebView/Handler/clock primitives.
function harness(){
 const f={generation:9,documentGeneration:1,loginActive:0,state:0,now:0,queue:[],calls:[],failures:[],events:[],notes:[],pendingCallbacks:[]};
 f.window={AndBridge:{getSessionGeneration:()=>f.generation}}; f.location={protocol:'https:',hostname:'open.spotify.com'};
 const obj={generation:9,documentGeneration:1,deadline:8000,pending:0,finished:0,webview:{}};
 const cls={Gate:f,Trace:f,NativeSessionRetryLaunch:obj};
 function run(name,arg){const code=method(name),labels=Object.fromEntries(code.map((x,i)=>[x,i])),r={p0:obj,p1:arg};let result;
  for(let pc=0,n=0;pc<code.length&&n++<1000;pc++){let x=code[pc],m;if(!x||/^[.#:]/.test(x))continue;
   if((m=x.match(/^const-string (\w+), (".*")$/))){r[m[1]]=JSON.parse(m[2]);continue;}
   if((m=x.match(/^const(?:\/4|\/16|-wide\/16)? (\w+), (\S+)/))){r[m[1]]=Number(m[2]);continue;}
   if((m=x.match(/^sget(?:-boolean)? (\w+), Lcom\/melodix\/music\/NativeSession(Gate|Trace);->(\w+):/))){r[m[1]]=cls[m[2]][m[3]];continue;}
   if((m=x.match(/^iget(?:-boolean|-object|-wide)? (\w+), (\w+), .*->(\w+):/))){r[m[1]]=r[m[2]][m[3]];continue;}
   if((m=x.match(/^iput(?:-boolean)? (\w+), (\w+), .*->(\w+):/))){r[m[2]][m[3]]=r[m[1]];continue;}
   if((m=x.match(/^if-(eqz|nez|gez) (\w+), (:\w+)/))){if(m[1]==='eqz'?!r[m[2]]:m[1]==='nez'?!!r[m[2]]:r[m[2]]>=0)pc=labels[m[3]];continue;}
   if((m=x.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
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
 f.start();assert.equal(f.evaluate(),'fonction-js-indisponible');f.reply('"fonction-js-indisponible"');f.tick();assert.equal(f.evaluate(),'fonction-js-indisponible');f.reply('"fonction-js-indisponible"');assert.equal(loads,1);
 f.window.__sfRequestSessionVerification=()=>{requests++;return Promise.resolve();};f.tick();assert.equal(f.evaluate(),'verification-dispatched');f.reply('"verification-dispatched"');f.tick();assert.equal(requests,1);assert.deepEqual(f.failures,[]);assert.ok(f.events.includes('session-verify result=dispatched'));
});
test('unavailable hook or missing callback ends boundedly with explicit failure',()=>{
 for(const respond of [true,false]){const f=harness();f.start();while(f.queue.length){if(respond&&f.pendingCallbacks.length)f.reply('"fonction-js-indisponible"');f.tick();}assert.deepEqual(f.failures,[respond?'retry-js-unavailable':'retry-launch-failed']);assert.ok(f.now>=8000);}
});
test('navigation replacement, generation change and stale callback cannot dispatch or mutate newer verification',()=>{
 let f=harness();f.start();f.documentGeneration++;f.reply('"verification-dispatched"');assert.deepEqual(f.failures,['retry-launch-failed']);f.tick();assert.equal(f.calls.length,1);
 f=harness();f.start();f.generation++;assert.equal(f.evaluate(),'fonction-js-indisponible');f.reply('"verification-dispatched"');f.tick();assert.deepEqual(f.failures,[]);assert.equal(f.calls.length,1);
});
test('blocked hook returns a fixed failure and does not loop; non-player never invokes it',()=>{
 const f=harness();let n=0;f.window.__sfRequestSessionVerification=()=>{n++;return false;};f.start();f.location.hostname='accounts.spotify.com';assert.equal(f.evaluate(),'fonction-js-indisponible');assert.equal(n,0);f.location.hostname='open.spotify.com';assert.equal(f.evaluate(),'verification-bloquee');f.reply('"verification-bloquee"');f.tick();assert.equal(n,1);assert.deepEqual(f.failures,['retry-blocked']);
});
test('navigation epoch and admission guard are wired to real main-frame and gate paths',()=>{
 const t=fs.readFileSync('smali/com/melodix/music/NativeSessionTrace.smali','utf8'),client=fs.readFileSync('smali/c91.smali','utf8'),rec=fs.readFileSync('smali/com/melodix/music/NativeSessionRecovery.smali','utf8');
 assert.match(client,/onPageStarted[\s\S]*?NativeSessionTrace;->start/);assert.match(t,/start\(Ljava\/lang\/String;\)V[\s\S]*?documentGeneration:I/);assert.match(rec,/VerificationFlight;->busy\(\)Z[\s\S]*?NativeSessionRetryLaunch;-><init>/);
});
