'use strict';
// Diagnostics only: no account, no network, no modifications to the Android fixture.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const vm=require('node:vm');
const source=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
const a=source.indexOf('    // Token refusal diagnostics, debug builds only.');
const b=source.indexOf('    // Successful token responses',a);
assert.ok(a>=0 && b>a);
const native=fs.readFileSync('smali/com/melodix/music/NativeSessionDebug.smali','utf8');
const grammar=native.match(/const-string v0, "(\(\?:probe result=interface.*)"/)[1];
const allowed=new RegExp('^(?:'+grammar+')$');
function harness(enabled=true){
 const records=[];
 const context={window:{AndBridge:{onSessionDebug:s=>records.push(s)}},TextDecoder,Uint8Array,sessionDebugEnabled:()=>enabled,
  mediaLibraryResponseMime:r=>{const t=r.headers.get('content-type')||'';return t.startsWith('application/json')?'json':t.startsWith('text/html')?'html':'other';}};
 vm.createContext(context);vm.runInContext(source.slice(a,b),context);return {context,records};
}
function response(chunks,status,type){
 const enc=new TextEncoder();const body=new ReadableStream({start(controller){for(const c of chunks)controller.enqueue(enc.encode(c));controller.close();}});
 return new Response(body,{status,headers:{'Content-Type':type}});
}
test('JSON 400 reports closed code, body status and message category across chunks, without consuming response',async()=>{
 const {context:c,records}=harness();
 const body=['{"error":{"code":"invalid_request",','"status":400,"message":"missing required parameter ', 'private@example.com","token":"SECRET"}}'];
 const r=response(body,400,'application/json');await c.traceDebugTokenError('api',r);
 assert.equal(records.length,2);assert.match(records[0],/body=waiting/);
 assert.match(records[1],/endpoint=api http=400 body=json code=invalid_request status=400 message=missing_parameter$/);
 assert.ok(records.every(x=>allowed.test(x)));assert.doesNotMatch(records.join('\n'),/private@example|SECRET/);
 assert.equal(await r.text(),body.join(''));
});
test('numeric code and status are bounded; arbitrary private strings never appear',async()=>{
 const {context:c,records}=harness();
 await c.traceDebugTokenError('api',new Response('{"error":{"code":"234","status":"403","message":"SECRET_COOKIE"}}',{status:400,headers:{'content-type':'application/json'}}));
 assert.match(records.at(-1),/body=json code=234 status=403 message=other$/);
 await c.traceDebugTokenError('api',new Response('{"code":"SECRET_TOKEN","status":"123456","message":"token Bearer SECRET_TOKEN"}',{status:400,headers:{'content-type':'application/json'}}));
 assert.match(records.at(-1),/code=other status=unknown message=other$/);
 assert.ok(records.every(x=>allowed.test(x)));assert.doesNotMatch(records.join('\n'),/SECRET|COOKIE|Bearer/);
});
test('HTML 403 reports only known exact title and generic markers, never page content',async()=>{
 const {context:c,records}=harness();const body=['<!doctype html><title>Just a ','moment...</title><div class="cf-chl">','CAPTCHA secret-private-token</div>'];
 const r=response(body,403,'text/html');await c.traceDebugTokenError('fallback',r);
 assert.match(records.at(-1),/body=html title=just_a_moment marker=captcha cloudflare=yes$/);
 assert.equal(await r.text(),body.join(''));assert.ok(records.every(x=>allowed.test(x)));assert.doesNotMatch(records.join('\n'),/secret-private-token/);
 await c.traceDebugTokenError('fallback',new Response('<title>Account secret-private-token</title>',{status:403,headers:{'content-type':'text/html'}}));
 assert.match(records.at(-1),/title=other marker=none cloudflare=no$/);assert.doesNotMatch(records.at(-1),/secret-private-token/);
});
test('large, malformed, unexpected, or unreadable responses fail closed; no diagnostic for release or success',async()=>{
 const {context:c,records}=harness();
 await c.traceDebugTokenError('api',new Response('{"message":"'+ 'X'.repeat(9000) +'"}',{status:400,headers:{'content-type':'application/json'}}));
 assert.match(records.at(-1),/body=truncated code=absent status=unknown message=absent$/);
 await c.traceDebugTokenError('api',new Response('{broken',{status:400,headers:{'content-type':'application/json'}}));
 assert.match(records.at(-1),/body=invalid_json/);
 await c.traceDebugTokenError('fallback',new Response('SECRET',{status:403,headers:{'content-type':'application/json'}}));assert.match(records.at(-1),/body=wrong_mime/);
 const bad={status:400,headers:{get:()=> 'application/json'},clone(){throw Error('SECRET');}};
 await c.traceDebugTokenError('api',bad);assert.match(records.at(-1),/body=unavailable/);
 const n=records.length;await c.traceDebugTokenError('api',new Response('SECRET',{status:200}));assert.equal(records.length,n);
 const off=harness(false);await off.context.traceDebugTokenError('api',bad);assert.deepEqual(off.records,[]);
 assert.ok(records.every(x=>allowed.test(x)));assert.doesNotMatch(records.join('\n'),/SECRET|X{20}/);
 assert.equal(allowed.test('token-error endpoint=api http=400 body=json code=SECRET status=400 message=other'),false);
});
test('actual response tracing invokes diagnostic without waiting or changing requests',()=>{
 const trace=source.slice(source.indexOf('    function traceTokenResponse('),source.indexOf('    // Token refusal diagnostics'));
 assert.match(trace,/void traceDebugTokenError\(endpoint, response\)/);
 const fetch=source.slice(source.indexOf('    async function fetchWebPlayerToken('),source.indexOf('    function dropWebPlayerToken'));
 const old=require('node:child_process').execFileSync('git',['show','611bac4b:scripts/spotify_bridge.source.js'],{encoding:'utf8'});
 const baseline=old.slice(old.indexOf('    async function fetchWebPlayerToken('),old.indexOf('    function dropWebPlayerToken'));
 assert.equal(fetch,baseline,'token request function is byte-identical');
 assert.equal((fetch.match(/oriFetch\(/g)||[]).length,2);
});

test('pending stream emits waiting synchronously and never holds up fallback',async()=>{
 const {context:c,records}=harness();let clones=0;
 const stalled={status:400,headers:{get:()=> 'application/json'},clone(){clones++;return {body:{getReader(){return {read(){return new Promise(()=>{});},cancel(){return Promise.resolve();}};}}};}};
 const work=c.traceDebugTokenError('api',stalled);
 assert.equal(clones,1);assert.match(records[0],/body=waiting/);
 const outcome=await Promise.race([work.then(()=> 'completed'),new Promise(resolve=>setTimeout(()=>resolve('pending'),15))]);
 assert.equal(outcome,'pending');
 const disabled=harness(false);await disabled.context.traceDebugTokenError('api',stalled);assert.equal(clones,1);
});
test('chunk count is bounded even when every chunk is tiny',async()=>{
 const {context:c,records}=harness();const chunks=Array(100).fill(' ');
 const r=response(chunks,400,'application/json');await c.traceDebugTokenError('api',r);
 assert.match(records.at(-1),/body=truncated/);assert.equal((await r.text()).length,100);
});
