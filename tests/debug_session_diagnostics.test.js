'use strict';
// Independent diagnostic unit tests. These do not alter the Android fixtures.
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const vm=require('node:vm');
const source=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
const code=source.slice(source.indexOf('    function sessionDebugEnabled()'),source.indexOf('    function traceTokenEndpoint('));
function harness(enabled=true){
 const records=[];
 const bridge={isSessionDebugEnabled:()=>enabled,onSessionDebug:s=>records.push(s)};
 const win={AndBridge:bridge};win.top=win;
 const ctx={window:win,location:{protocol:'https:',hostname:'open.spotify.com',port:'',pathname:'/app'},document:{readyState:'interactive'},TextDecoder,Uint8Array};
 vm.createContext(ctx);vm.runInContext(code,ctx);return {ctx,records};
}
test('getter output contains only types, route category and load state, never returned values',()=>{
 const {ctx,records}=harness();ctx.sessionDebugGetter('number',null,false);ctx.sessionDebugGetter('text','SECRET_TOKEN',false);
 assert.match(records[0],/^getter=number type=object null=yes origin=https:\/\/open\.spotify\.com route=app load=interactive frame=top$/);
 assert.match(records[1],/^getter=text type=string null=no /);assert.doesNotMatch(records.join('\n'),/SECRET_TOKEN/);
 ctx.location.pathname='/user/private-id';ctx.window.top={};ctx.sessionDebugGetter('text','x',true);
 assert.match(records[2],/type=exception .*route=other .*frame=child/);assert.doesNotMatch(records[2],/private-id/);
 const off=harness(false);off.ctx.sessionDebugGetter('number',42,false);assert.deepEqual(off.records,[]);
});
test('response diagnostics classify only bounded safe codes and do not consume the original body',async()=>{
 const {ctx,records}=harness();const response=new Response('{"error":"invalid_token"}',{status:401});
 await ctx.traceDebugLibraryResponse(response,'api');
 assert.match(records[0],/method=POST endpoint=https:\/\/api-partner\.spotify\.com\/pathfinder\/v2\/query status=401 token=api body=invalid_token$/);
 assert.equal(await response.text(),'{"error":"invalid_token"}');
 const secret='private-cookie-123 bearer-token-456';
 await ctx.traceDebugLibraryResponse(new Response(JSON.stringify({error:secret,account:secret}),{status:403}),'cache-fallback');
 assert.match(records[1],/status=403 token=cache-fallback body=redacted$/);assert.doesNotMatch(records.join('\n'),/private-cookie|bearer-token/);
 await ctx.traceDebugLibraryResponse(new Response(secret,{status:400}),'not-safe');
 assert.match(records[2],/status=400 token=unknown body=redacted$/);assert.doesNotMatch(records[2],/private-cookie|bearer-token/);
 await ctx.traceDebugLibraryResponse(new Response(secret,{status:200}),'api');assert.equal(records.length,3);
 const off=harness(false);await off.ctx.traceDebugLibraryResponse(new Response(secret,{status:401}),'api');assert.deepEqual(off.records,[]);
});
test('native channel checks debuggable flag and validates fixed vocabulary before retaining anything',()=>{
 const native=fs.readFileSync('smali/com/melodix/music/NativeSessionDebug.smali','utf8');
 assert.match(native,/getApplicationInfo\(\)[\s\S]*?flags:I[\s\S]*?and-int\/lit8 v0, v0, 0x2/);
 assert.match(native,/->enabled\(Landroid\/content\/Context;\)Z[\s\S]*?->matches\(Ljava\/lang\/String;\)Z[\s\S]*?StringBuffer;->append/);
 assert.match(native,/const\/16 v2, 0x1000/);assert.doesNotMatch(native,/CookieManager|SharedPreferences|openFileOutput|android\/util\/Log/);
 const retry=fs.readFileSync('smali/com/melodix/music/NativeSessionRetryLaunch.smali','utf8');
 assert.match(retry,/window\.top!==window/);assert.match(retry,/session-probe result=interface/);assert.match(retry,/evaluateJavascript\(Ljava\/lang\/String;Landroid\/webkit\/ValueCallback;\)V/);
});
test('independent evaluateJavascript callback reports absent and null getters without inventing generation',()=>{
 const smali=fs.readFileSync('smali/com/melodix/music/NativeSessionGetterProbe.smali','utf8');
 const script=smali.match(/    const-string v1, "(\(function\(\).*?)"\n    invoke-virtual \{p1, v1, v0\}/)[1];
 const make=bridge=>{const window={AndBridge:bridge};window.top=window;return {window,location:{protocol:'https:',hostname:'open.spotify.com',port:'',pathname:'/app'},document:{readyState:'complete'}};};
 let context=make(undefined);let result=vm.runInNewContext(script,context);
 assert.match(result.a,/getter=number type=absent/);assert.match(result.b,/getter=text type=absent/);
 context=make({getSessionGeneration:()=>null,getSessionGenerationText:()=>null});result=vm.runInNewContext(script,context);
 assert.match(result.a,/type=object null=yes/);assert.match(result.b,/type=object null=yes/);assert.match(result.a,/load=complete frame=top/);
 let calls=0;context=make({getSessionGeneration:()=>{calls++;return 1;}});context.window.top={};result=vm.runInNewContext(script,context);
 assert.equal(calls,0);assert.match(result.a,/type=absent/);assert.match(result.a,/frame=child/);
 assert.match(smali,/evaluateJavascript\(Ljava\/lang\/String;Landroid\/webkit\/ValueCallback;\)V/);
});
test('generation reads reject subframes and untrusted origins without invoking native getters',()=>{
 const a=source.indexOf('    function readNativeSessionGeneration()'),b=source.indexOf('    function checkMediaLib(',a);
 let calls=0;const window={location:{origin:'https://open.spotify.com'},AndBridge:{getSessionGeneration:()=>{calls++;return 7;}}};window.top=window;
 const ctx={window};vm.createContext(ctx);vm.runInContext(source.slice(a,b),ctx);
 assert.equal(ctx.readNativeSessionGeneration(),7);assert.equal(calls,1);
 window.top={};assert.equal(ctx.readNativeSessionGeneration(),0);assert.equal(calls,1);
 window.top=window;window.location.origin='https://open.spotify.com.evil.test';assert.equal(ctx.readNativeSessionGeneration(),0);assert.equal(calls,1);
});

test('historical normalization pins debug changes and retains the complete byte comparison',()=>{
 const cp=require('node:child_process');const normalize=require('./helpers/session_debug_normalize');
 const before=cp.execFileSync('git',['show','89a02b1c88f8e4bf909f231da0b0eefd4343cdfe:scripts/spotify_bridge.source.js'],{encoding:'utf8'});
 assert.equal(normalize.full(source),before,'all bytes outside the four explicitly reviewed changes are unchanged');
 for(const [oldText,newText] of [
  ['source: \'api\'','source: \'other\''],
  ["void traceDebugLibraryResponse(resp, trace.debugTokenOrigin)","void traceDebugLibraryResponse(resp, 'other')"],
  ["if (window.location && window.location.origin !== 'https://open.spotify.com') return 0;","if (false) return 0;"],
  ['bytes.subarray(0, 1024)','bytes.subarray(0, 1025)']
 ]) {
  assert.ok(source.includes(oldText),oldText);
  assert.throws(()=>normalize.full(source.replace(oldText,newText)),undefined,'changed reviewed block must not silently normalize: '+oldText);
 }
 const unrelated=source.replace('        const limit = 50;','        const limit = 51;');
 assert.notEqual(normalize.full(unrelated),before,'historical comparison still sees unrelated edits');
});
