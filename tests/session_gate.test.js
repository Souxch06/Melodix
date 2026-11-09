'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const read = f => fs.readFileSync(require('node:path').join(__dirname, '..', f), 'utf8');
const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
function body(src, name) { const a = src.indexOf('.method public static '+name+'('); assert.ok(a>=0,name); return src.slice(a,src.indexOf('.end method',a)); }
// Execute actual decision instructions, not a duplicate JS state machine.
function machine(overrides={}) {
 const fields = {state:0,generation:1,lastAttempt:0,autoUsed:false,freshLogin:false,loginActive:false,expiredEvidence:false,...overrides};
 const calls=[], transitions=[];
 function run(name, ...args) {
  const lines=body(gate,name).split('\n').map(l=>l.trim()), labels=Object.fromEntries(lines.map((l,i)=>[l,i]));
  const regs=Object.fromEntries(args.map((a,i)=>['p'+i,a])); let result;
  for(let pc=0, steps=0;pc<lines.length && steps++<1000;pc++) {
   const l=lines[pc]; let m;
   if(!l||/^[.#:]/.test(l))continue;
   if((m=l.match(/^const-string (\w+), (.*)$/))) {regs[m[1]]=JSON.parse(m[2]);continue;}
   if((m=l.match(/^const(?:\/4|\/16) (\w+), (.*)$/))) {regs[m[1]]=Number(m[2]);continue;}
   if((m=l.match(/^sget(?:-boolean)? (\w+), .*;->(\w+):/))) {regs[m[1]]=fields[m[2]];continue;}
   if((m=l.match(/^sput(?:-boolean)? (\w+), .*;->(\w+):/))) {fields[m[2]]=regs[m[1]];continue;}
   if((m=l.match(/^new-instance (\w+), Lorg\/json\/JSONObject/))) {regs[m[1]]={};continue;}
   if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
    const a=m[1]?m[1].split(', ').map(r=>regs[r]):[], c=m[2];
    if(c.includes('JSONObject;-><init>')) Object.assign(a[0],JSON.parse(a[1]));
    else if(c.includes('NativeSessionGate;->http')) { const n=Number(a[0][a[1]]);result=n>=100&&n<=599?n:0; }
    else if(c.includes('NativeSessionGate;->refused')) result=[400,401,403].includes(a[0]);
    else if(c.includes('->optInt')) result=Number(a[0][a[1]])||0;
    else if(c.includes('->optBoolean')) result=a[0][a[1]]===true;
    else if(c.includes('->transition')) {transitions.push({from:fields.state,to:a[0],reason:a[1]});fields.state=a[0];}
    else if(c.includes('->navigateLogin')) {calls.push('login');fields.loginActive=true;fields.generation++;}
    else if(c.includes('->hasCookie')) result=fields.cookie!==false;
    else if(c.includes('->verify')) calls.push('verify');
    else if(c.includes('->paint')||c.includes('->showNativeUi')||c.includes('->runNativeJavascript')) calls.push(c.match(/->(\w+)/)[1]);
    else assert.fail('unsupported '+c);
    continue;
   }
   if((m=l.match(/^move-result(?:-object)? (\w+)/))) {regs[m[1]]=result;continue;}
   if((m=l.match(/^iput-boolean (\w+), (\w+), .*;->(\w+):/))) {regs[m[2]][m[3]]=regs[m[1]];continue;}
   if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)/))) {if(m[1]==='eqz'?!regs[m[2]]:!!regs[m[2]])pc=labels[m[3]];continue;}
   if((m=l.match(/^if-(eq|ne|le|lt|gt) (\w+), (\w+), (:\w+)/))) {const a=regs[m[2]], b=regs[m[3]];if(m[1]==='eq'?a===b:m[1]==='ne'?a!==b:m[1]==='lt'?a<b:m[1]==='gt'?a>b:a<=b)pc=labels[m[4]];continue;}
   if((m=l.match(/^goto (:\w+)/))) {pc=labels[m[1]];continue;}
   if((m=l.match(/^return(?:-object)? (\w+)/)))return regs[m[1]];
   if(l==='return-void')return;
   assert.fail('unsupported '+l);
  }
  assert.fail('did not return');
 }
 return {fields,calls,transitions,run,send:payload=>run('result',{},JSON.stringify({generation:fields.generation,attempt:1,completed:true,libraryHttp:payload.libraryOk?200:0,tokenApiHttp:payload.tokenRefused?400:0,tokenFallbackHttp:payload.tokenRefused?403:0,...payload}))};
}

test('case 1: no cookie chooses login once, never player/home or cookie deletion',()=>{
 const m=machine({cookie:false});assert.match(m.run('initialUrl'),/^https:\/\/accounts/);assert.equal(m.fields.state,1);
 assert.equal(m.run('initialUrl'),0);assert.equal(m.fields.autoUsed,1);
 assert.doesNotMatch(gate,/removeAllCookies|deleteAllData|UserAgent|spotify-app-version/);
});
test('case 2: cookie merely routes to hidden player; only token AND validated library unlock home',()=>{
 const m=machine();assert.equal(m.run('initialUrl'),'https://open.spotify.com/');assert.equal(m.fields.state,0);
 m.send({token:true,libraryOk:true});assert.equal(m.fields.state,3);assert.ok(m.calls.includes('showNativeUi'));
 for(const result of [{token:true,libraryOk:false},{token:false,libraryOk:true}]) {const n=machine();n.send(result);assert.equal(n.fields.state,4);assert.ok(!n.calls.includes('login'));}
});
test('case 3: completed correlated token refusal + library401 auto routes only once, preserves cookie',()=>{
 const m=machine();m.send({token:false,tokenRefused:true,libraryHttp:401});assert.equal(m.fields.state,2);assert.equal(m.run('canReconnect'),0, 'login navigation invalidates destructive action');assert.equal(m.calls.filter(c=>c==='login').length,1);
 m.send({attempt:2,tokenRefused:true,libraryHttp:401});assert.equal(m.calls.filter(c=>c==='login').length,1);
});
test('case 4: timeout/network/isolated 401/403 never imply expiry or destructive recovery',()=>{
 for(const payload of [{},{tokenRefused:true,libraryHttp:0},{libraryHttp:401},{tokenRefused:true,libraryHttp:403}]) {
  const m=machine();m.send(payload);assert.equal(m.fields.state,4);assert.equal(m.run('canReconnect'),0);assert.ok(!m.calls.includes('login'));
 }
});
test('case 5: fresh-login refusal stays error without a redirect loop',()=>{
 const m=machine({freshLogin:true,autoUsed:true});m.send({tokenRefused:true,libraryHttp:401});assert.equal(m.fields.state,4);assert.equal(m.run('canReconnect'),0);assert.ok(!m.calls.includes('login'));
});
test('case 6: stale, duplicate, incomplete and login-page callbacks cannot unlock home',()=>{
 for(const payload of [{generation:0},{attempt:0},{completed:false}]) {const m=machine();m.send({...payload,token:true,libraryOk:true});assert.equal(m.fields.state,0);}
 const m=machine({loginActive:true});m.send({token:true,libraryOk:true});assert.equal(m.fields.state,0);
 const n=machine();n.send({token:true,libraryOk:true});n.send({token:false,libraryHttp:401});assert.equal(n.fields.state,3);
});
test('retry is non-destructive; expiry guard precedes removeAllCookies',()=>{
 const r=read('smali/com/melodix/music/NativeSessionReconnect.smali');assert.ok(r.indexOf('canReconnect()Z')<r.indexOf('removeAllCookies'));
 assert.match(read('smali/com/melodix/music/NativeSessionRecovery.smali'),/NativeSessionGate;->begin/);
 const m=machine({cookie:true});m.run('requestLogin',{});assert.deepEqual(m.calls,['verify']);
});
test('rotation/background preserve process budget; 3s presentation deadline cannot navigate',()=>{
 const task=read('smali/com/melodix/music/NativeSessionGateTask.smali');
 assert.match(task,/NativeSessionGate;->owner/);assert.match(task,/if-ne v1, v2, :done/);assert.match(task,/presentation-deadline-not-expiration/);
 assert.doesNotMatch(task,/navigateLogin|removeAllCookies|loadUrl/);
 assert.match(body(gate,'begin'),/const-wide\/16 v3, 0xbb8/);
 assert.match(body(gate,'destroy'),/isFinishing/);
});
test('publication exports only closed, same-attempt observations at completion',()=>{
 const source=read('scripts/spotify_bridge.source.js');const fn=source.match(/    function publishSessionVerification\(diagnostic\) \{[\s\S]*?\n    \}/)[0];
 for(const [diag,expected] of [[{tokenApiHttp:400,tokenFallbackHttp:403,http:401},true],[{tokenApiHttp:0,tokenFallbackHttp:403,http:401},false],[{bearer:true,tokenApiHttp:400,tokenFallbackHttp:403,http:200},false]]) {
  let sent;const window={AndBridge:{onSessionVerification:s=>sent=JSON.parse(s)}};
  vm.runInNewContext('('+fn+')(diagnostic)',{window,diagnostic:{nativeGeneration:7,attempt:8,...diag},boundedMediaLibraryCount:(n,max)=>Math.max(0,Math.min(max,Number(n)||0))});
  assert.equal(sent.tokenRefused,expected);assert.equal(sent.generation,7);assert.equal(sent.attempt,8);assert.equal(sent.completed,true);
  assert.deepEqual(Object.keys(sent),['generation','attempt','completed','token','tokenApiHttp','tokenFallbackHttp','tokenRefused','libraryHttp','libraryOk']);
 }
 assert.ok(source.indexOf('publishSessionVerification(diagnostic)')>source.indexOf('} finally {\n            if (requestGeneration'));
});
test('native glass surface has named resources, real 48dp actions, collapsed details and no Spotify CSS',()=>{
 const xml=read('res/layout/native_session_surface.xml');
 assert.match(xml,/<ScrollView/);assert.match(xml,/@drawable\/session_glass_background/);
 for(const id of ['sessionAction','sessionDisclosure'])assert.match(xml,new RegExp('android:id="@\\+id/'+id+'"[^>]*android:layout_height="48dp"'));
 assert.match(xml,/android:id="@\+id\/sessionDetails"[^>]*android:visibility="gone"/);
 const ui=read('smali/com/melodix/music/NativeSessionSurface.smali');
 assert.doesNotMatch(ui,/0x7f[0-9a-f]+|evaluateJavascript|backdrop-filter|loadUrl/);
 assert.match(ui,/getIdentifier/);assert.match(ui,/NativeSessionSurfaceLayout/);
 assert.match(read('smali/com/melodix/music/NativeSessionSurfaceLayout.smali'),/getPaddingTop/);
 const main=read('smali/com/melodix/music/MainActivity.smali');assert.match(main,/handleNativeSystemBack\(\)Z[\s\S]*?->finish\(\)V/);
 for(const sig of ['showNativeUiFrom','activateNativeUiRoute','applyNativeUiData','renderNativeRows']) {
  const start=main.indexOf('.method public final '+sig+'(');assert.ok(start>=0);const method=main.slice(start,main.indexOf('.end method',start));
  assert.ok(method.indexOf('NativeSessionGate;->blocked')<method.indexOf(':session_'),'ingress gated '+sig);
 }
});
test('MDXPERF accepts fixed state transitions but rejects private reasons',()=>{
 const src=read('smali/com/melodix/music/NativeStartupTiming.smali');const literal=src.match(/const-string v0, "(\^sid=[^"\n]+)"/)[1];const rule=new RegExp(JSON.parse('"'+literal+'"'));
 assert.ok(rule.test('sid=1234abcd t=1 session-state from=verifying state=error reason=presentation-deadline-not-expiration'));
 assert.ok(!rule.test('sid=1234abcd t=1 session-state from=verifying state=error reason=https://private'));
});

test('destructive reconnect is disabled during official login, even after old expiry evidence',()=>{
 const m=machine({state:2,expiredEvidence:true,loginActive:false});assert.equal(m.run('canReconnect'),true);
 m.fields.loginActive=true;assert.equal(m.run('canReconnect'),0);
});
test('foreground revalidates a previously valid session, preserving redirect budget',()=>{
 const m=machine({state:3,autoUsed:true});m.run('resume',{});assert.deepEqual(m.calls,['verify']);assert.equal(m.fields.autoUsed,true);
 const n=machine({state:4,autoUsed:true});n.run('resume',{});assert.deepEqual(n.calls,[]);
});
test('new helpers never illegally access private MainActivity fields',()=>{
 const main=read('smali/com/melodix/music/MainActivity.smali');
 const fields=new Map([...main.matchAll(/^\.field\s+(.+?)\s+(\w+):/gm)].map(m=>[m[2],m[1]]));
 for(const name of ['NativeSessionGate','NativeSessionGateTask','NativeSessionSurface','NativeSessionSurfaceLayout']) {
  const src=read('smali/com/melodix/music/'+name+'.smali');
  for(const match of src.matchAll(/MainActivity;->(\w+):/g)) assert.match(fields.get(match[1])||'',/public/,name+' field '+match[1]);
 }
});

test('inconsistent HTTP/proof claims never unlock home or trigger expiry',()=>{
 for(const payload of [{token:true,libraryOk:true,libraryHttp:401},{token:true,libraryOk:true,libraryHttp:0},
   {tokenRefused:true,libraryHttp:401,tokenApiHttp:0},{tokenRefused:true,libraryHttp:401,tokenFallbackHttp:500}]) {
  const m=machine();m.send(payload);assert.equal(m.fields.state,4);assert.ok(!m.calls.includes('login'));
 }
});
test('post-verification resend resets presentation dedup only after existing library proof',()=>{
 const src=read('scripts/native_ui_shell.source.js');const fn=src.match(/window\.__sfNativeSessionVerified = function\(\) \{[\s\S]*?\n    \};/)[0];
 for(const proven of [false,true]) {
  const context={window:{},libraryProvesSession:()=>proven,runUpdate:()=>context.updates++,updates:0,
   lastHomeSignature:'old',lastSearchSignature:'old',lastLibrarySignature:'old',lastInitialDetailSignature:'old'};
  vm.runInNewContext(fn,context);assert.equal(context.window.__sfNativeSessionVerified(),proven);
  assert.equal(context.updates,proven?1:0);assert.equal(context.lastHomeSignature,proven?null:'old');
  assert.equal(context.lastLibrarySignature,proven?null:'old');
 }
 assert.doesNotMatch(fn,/navigate|checkMediaLib|fetch\(|removeAllCookies/);
 assert.match(gate,/__sfNativeSessionVerified/);
});

test('unverified content is hidden visually and from accessibility, not just covered',()=>{
 const src=read('smali/com/melodix/music/NativeSessionSurface.smali');
 const protect=body(src,'protectUnderlyingViews');
 assert.match(protect,/"nativeRoot"/);assert.match(protect,/setVisibility\(I\)V/);
 assert.match(protect,/const\/4 v1, 0x4[\s\S]*?setImportantForAccessibility/);
 assert.match(protect,/:valid[\s\S]*?const\/4 v1, 0x0[\s\S]*?setImportantForAccessibility/);
});

test('factory pending load cannot be cancelled by ensure while WebView.getUrl is still null',()=>{
 for(const cookie of [true,false]) {
  const m=machine({cookie});const first=m.run('initialUrl');assert.match(first,/^https:/);
  assert.equal(m.run('initialUrl'),0,'second router must issue no navigation');
 }
 const main=read('smali/com/melodix/music/MainActivity.smali');
 const start=main.indexOf('.method public final ensureWebPageLoaded');const ensure=main.slice(start,main.indexOf('.end method',start));
 assert.match(ensure,/initialUrl[\s\S]*?move-result-object v1\s+if-eqz v1, :done/);
 assert.doesNotMatch(ensure,/about:blank/);
});

test('MainActivity never overrides a final method in its packaged superclass chain',()=>{
 const main=read('smali/com/melodix/music/MainActivity.smali');
 const declared=new Set([...main.matchAll(/^\.method[^\n]*? (\S+\([^\n]+)$/gm)].map(m=>m[1]));
 let name=main.match(/^\.super L([^;]+);/m)[1];
 const visited=new Set();
 while(!visited.has(name)) {
  visited.add(name);const path='smali/'+name+'.smali';if(!fs.existsSync(require('node:path').join(__dirname,'..',path)))break;
  const parent=read(path);
  for(const m of parent.matchAll(/^\.method[^\n]*?\bfinal\b[^\n]*? (\S+\([^\n]+)$/gm)) assert.ok(!declared.has(m[1]),'cannot override final '+name+'->'+m[1]);
  name=parent.match(/^\.super L([^;]+);/m)[1];
 }
});
