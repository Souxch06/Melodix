'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
function retryContext(opts={}){
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8'),a=s.indexOf('    window.__sfRequestSessionVerification = function () {'),b=s.indexOf('\n    };',a)+7;
 const events=[],ctx={window:{__sfMediaLibError:'',__sfMediaLibRetryAt:0},mediaLibraryCheckPromise:opts.pending||null,
  publishSessionRelanceDiagnostic:(s,r)=>events.push(r),mediaLibraryAuthReady:()=>opts.auth!==false,
  dropWebPlayerToken:()=>events.push('drop-cache'),checkMediaLib:(force,source)=>{events.push([force,source]);return Promise.resolve('complete');}};
 vm.createContext(ctx);vm.runInContext(s.slice(a,b),ctx);return {ctx,events};
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
