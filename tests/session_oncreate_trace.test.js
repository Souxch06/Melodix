'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const source=fs.readFileSync('smali/com/melodix/music/AppSingleton.smali','utf8');
const method=source.slice(source.indexOf('.method public final onCreate()V'),source.indexOf('.end method',source.indexOf('.method public final onCreate()V')));

function startupWindow(){
 const a=method.indexOf('    const-string v3, "ServiceOn"');
 const b=method.indexOf('    const-string v3, "APlayMode"',a);
 assert.ok(a>=0&&b>a);
 return method.slice(a,b).split('\n').map(l=>l.trim()).filter(l=>l&&!l.startsWith('.')&&!l.startsWith('#'));
}
function simulate(serviceOn,initialProof){
 const code=startupWindow(),registers={v0:undefined},state={A:undefined,B:initialProof,trace:null};
 let ready=false;
 for(const line of code){
  if(line==='move-result v0'){registers.v0=serviceOn;ready=true;continue;}
  if(!ready)continue;
  if(line==='sput-boolean v0, Lcom/melodix/music/AppSingleton;->A:Z')state.A=registers.v0;
  else if(line==='const/4 v0, 0x0')registers.v0=false;
  else if(line==='sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z')state.B=registers.v0;
  else if(line==='invoke-static {v0}, Lcom/melodix/music/AppSingleton;->proofClearOncreate(Z)V')state.trace=registers.v0;
  else if(line==='invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;'||line==='move-result-object v0')break;
  else assert.fail('Unexpected instruction in startup window: '+line);
 }
 return state;
}
test('onCreate traces the stored proof, not the unrelated ServiceOn preference',()=>{
 for(const serviceOn of [false,true])for(const initialProof of [false,true]){
  const state=simulate(serviceOn,initialProof);
  assert.deepEqual(state,{A:serviceOn,B:false,trace:false});
 }
 const code=startupWindow(),store=code.indexOf('sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z'),trace=code.indexOf('invoke-static {v0}, Lcom/melodix/music/AppSingleton;->proofClearOncreate(Z)V');
 assert.ok(store>=0&&trace===store+1,'one trace instruction directly after the original proof store');
});
test('startup trace contains only the original boolean and never touches session or cookies',()=>{
 const code=startupWindow().join('\n');
 assert.doesNotMatch(code,/CookieManager|removeAllCookies|NativeSessionEvidence|NativeSessionGate|loadUrl|fetch|putBoolean/);
 const a=source.indexOf('.method public static proofClearOncreate(Z)V'),b=source.indexOf('.end method',a),helper=source.slice(a,b);
 assert.match(helper,/const-string v0, "clear-oncreate"/);
 assert.match(helper,/proofTraceValue\(Ljava\/lang\/String;Z\)V/);
});
