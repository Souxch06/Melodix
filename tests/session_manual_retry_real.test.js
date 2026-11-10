'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
function retryContext(opts={}){
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8'),a=s.indexOf('    window.__sfRequestSessionVerification = function (expectedGeneration = 0) {'),b=s.indexOf('\n    };',a)+7;
 const events=[],ctx={window:{__sfMediaLibError:'',__sfMediaLibRetryAt:0,AndBridge:opts.bridge||{getSessionGeneration:()=>2,isSessionRetryActive:()=>true}},mediaLibraryCheckPromise:opts.pending||null,
  publishSessionRelanceDiagnostic:(s,r)=>events.push(r),mediaLibraryAuthReady:()=>opts.auth!==false,
  dropWebPlayerToken:()=>events.push('drop-cache'),checkMediaLib:(force,source)=>{events.push([force,source]);return Promise.resolve('complete');}};
 const h=s.indexOf('    function readNativeSessionGeneration()'),end=s.indexOf('\n    }',h)+6;vm.createContext(ctx);vm.runInContext(s.slice(h,end)+'\n'+s.slice(a,b),ctx);return {ctx,events};
}
test('manual retry discards cached bearer and launches the actual forced verification',async()=>{
 const {ctx,events}=retryContext();await ctx.window.__sfRequestSessionVerification();assert.deepEqual(events,['drop-cache',[true,'native-retry']]);
});
test('manual retry waits for an older flight before discarding bearer and launching a distinct verification',async()=>{
 let finish;const pending=new Promise(resolve=>finish=resolve),{ctx,events}=retryContext({pending});const result=ctx.window.__sfRequestSessionVerification();assert.deepEqual(events,[]);finish();await result;assert.deepEqual(events,['drop-cache',[true,'native-retry']]);
});
test('auth guard blocks explicitly without clearing the cached bearer or starting requests',()=>{
 const {ctx,events}=retryContext({auth:false});assert.equal(ctx.window.__sfRequestSessionVerification(),false);assert.deepEqual(events,['blocage=dom-auth-required']);
});
test('native launch failure has fixed reasons, releases lock and cannot mutate a stale generation',()=>{
 const gate=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8');const a=gate.indexOf('.method public static retryFailed('),b=gate.indexOf('.end method',a),m=gate.slice(a,b);
 assert.match(m,/generation:I[\s\S]*?if-ne p0, v0, :done/);assert.match(m,/->fail\(I\)V[\s\S]*?->transition/);
 const cb=fs.readFileSync('smali/com/melodix/music/NativeSessionRetryDiagnosticCallback.smali','utf8');for(const reason of ['retry-js-unavailable','retry-blocked','retry-launch-failed'])assert.ok(cb.includes(reason));
 const rec=fs.readFileSync('smali/com/melodix/music/NativeSessionRecovery.smali','utf8');assert.match(fs.readFileSync('smali/com/melodix/music/NativeSessionRetryLaunch.smali','utf8'),/r===false\?'verification-bloquee':'verification-dispatched'/);assert.match(rec,/retry-webview-unavailable/);
});

test('queued retry never starts after generation change, flight expiry, login, or missing bridge',async()=>{
 for(const situation of ['new-generation','expired-flight','login','missing-bridge','invalid-generation','throws']){
  let finish,gen=4,active=true;const pending=new Promise(r=>finish=r);
  const bridge={getSessionGeneration:()=>gen,isSessionRetryActive:()=>active};
  const {ctx,events}=retryContext({pending,bridge});const result=ctx.window.__sfRequestSessionVerification();
  if(situation==='new-generation')gen=5;
  if(situation==='expired-flight'||situation==='login')active=false;
  if(situation==='missing-bridge')delete ctx.window.AndBridge;
  if(situation==='invalid-generation')gen='4';
  if(situation==='throws')bridge.isSessionRetryActive=()=>{throw Error('private');};
  finish();assert.equal(await result,false,situation);assert.deepEqual(events,[],situation);
 }
});
test('queued retry refuses invalid initial generation or unavailable native flight check',()=>{
 for(const bridge of [{getSessionGeneration:()=>undefined,isSessionRetryActive:()=>true},{getSessionGeneration:()=>1},{getSessionGeneration:()=>{throw Error('private');},isSessionRetryActive:()=>true}]){
  const {ctx,events}=retryContext({pending:new Promise(()=>{}),bridge});assert.equal(ctx.window.__sfRequestSessionVerification(),false);assert.deepEqual(events,[]);
 }
});
test('flight readback is generation scoped, bounded and visible across JavaScript bridge threads',()=>{
 const bridge=fs.readFileSync('smali/com/melodix/music/AndBridge.smali','utf8');const a=bridge.indexOf('.method public final isSessionRetryActive('),m=bridge.slice(a,bridge.indexOf('.end method',a));
 assert.match(m,/JavascriptInterface/);assert.match(m,/generation:I[\s\S]*?if-ne p1, v0, :no[\s\S]*?VerificationFlight;->busy\(\)Z/);assert.doesNotMatch(m,/Cookie|loadUrl|remove|delete|result\(/);
 const gate=fs.readFileSync('smali/com/melodix/music/NativeSessionGate.smali','utf8'),flight=fs.readFileSync('smali/com/melodix/music/NativeSessionVerificationFlight.smali','utf8');
 for(const field of ['generation:I','loginActive:Z'])assert.ok(gate.includes('static volatile '+field));
 for(const field of ['generation:I','until:J'])assert.ok(flight.includes('static volatile '+field));
});

test('a rejected older request also cannot revive a stale queued retry',async()=>{
 let reject,gen=2;const pending=new Promise((_,r)=>reject=r);const bridge={getSessionGeneration:()=>gen,isSessionRetryActive:()=>true};
 const {ctx,events}=retryContext({pending,bridge});const result=ctx.window.__sfRequestSessionVerification();gen=3;reject(Error('private'));assert.equal(await result,false);assert.deepEqual(events,[]);
});

test('expected retry generation requires an active matching native flight before launch',()=>{
 for(const [gen,active,expected] of [[2,false,2],[3,true,2],[2,true,3]]){const {ctx,events}=retryContext({bridge:{getSessionGeneration:()=>gen,isSessionRetryActive:()=>active}});assert.equal(ctx.window.__sfRequestSessionVerification(expected),false);assert.deepEqual(events,[]);}
});
test('queued retry can use canonical native text without accepting stale or malformed values',async()=>{
 for(const [text,expected,go] of [['4',4,true],['5',4,false],['04',4,false],['PRIVATE',4,false]]){
  let finish;const pending=new Promise(r=>finish=r),bridge={getSessionGeneration:()=>undefined,getSessionGenerationText:()=>text,isSessionRetryActive:()=>true};
  const {ctx,events}=retryContext({pending,bridge}),result=ctx.window.__sfRequestSessionVerification(expected);finish();const v=await result;
  if(go){assert.equal(v,'complete');assert.deepEqual(events,['drop-cache',[true,'native-retry']]);}else{assert.equal(v,false);assert.deepEqual(events,[]);}
 }
});

test('native generation reader accepts only canonical bounded decimal fallback and never replaces a different integer',()=>{
 for(const [value,text,want] of [[undefined,'1',1],[undefined,'2147483647',2147483647],[undefined,'0',0],[undefined,'2147483648',0],[undefined,'01',0],[undefined,'+1',0],[undefined,' 1',0],[undefined,1,0],[NaN,'3',3],[2,'3',2],[0,'3',0],[-1,'3',0]]){
  const {ctx}=retryContext({bridge:{getSessionGeneration:()=>value,getSessionGenerationText:()=>text}});assert.equal(ctx.readNativeSessionGeneration(),want,JSON.stringify([value,text]));
 }
});
