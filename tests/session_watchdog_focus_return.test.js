'use strict';
// Real Smali control flow with Android view doubles; not an emulator test.
const test=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs');
const overlay=fs.readFileSync('smali/com/melodix/music/StartupDiagnosticOverlay.smali','utf8');
const main=fs.readFileSync('smali/com/melodix/music/MainActivity.smali','utf8');
function method(src,sig){const a=src.indexOf(sig);assert.ok(a>=0,sig);return src.slice(a,src.indexOf('.end method',a));}
function execute({activity=true, content=true, panel=true, currentRoot=true, session=true, window=true}) {
  const code=method(overlay,'.method public static dismissContentForSession(').split('\n').map(x=>x.trim());
  const labels=Object.fromEntries(code.map((x,i)=>[x,i]));const decor={},other={};
  const state={contentReport:content,panel:panel?{root:currentRoot?decor:other}:null,dismissed:0};
  const a=activity?{window:window?{decor}:null,session}:null;const r={p0:a};let result;
  for(let pc=0,n=0;pc<code.length&&n++<200;pc++){
    const line=code[pc];let m;if(!line||/^[.#:]/.test(line))continue;
    if((m=line.match(/^sget(?:-boolean|-object)? (\w+), .*StartupDiagnosticOverlay;->(\w+):/))){r[m[1]]=state[m[2]];continue;}
    if((m=line.match(/^move-result(?:-object)? (\w+)$/))){r[m[1]]=result;continue;}
    if((m=line.match(/^if-(eqz|nez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
    if((m=line.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
    if((m=line.match(/^goto (:\w+)$/))){pc=labels[m[1]];continue;}
    if((m=line.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const args=m[1]?m[1].split(', ').map(k=>r[k]):[],call=m[2];
      if(call.includes('->getRootView()'))result=args[0].root;
      else if(call.includes('->getWindow()'))result=args[0].window;
      else if(call.includes('->getDecorView()'))result=args[0].decor;
      else if(call.includes('->sessionSurfaceVisible('))result=args[0].session;
      else if(call.includes('->dismissIfShowing()'))state.dismissed++;
      else assert.fail(call);
      continue;
    }
    if(line==='return-void')return state;
    assert.fail('unknown instruction '+line);
  }
  assert.fail('did not return');
}
test('a content diagnostic posted while in the demo is removed on return to a visible session',()=>{
  assert.equal(execute({}).dismissed,1);
});
test('startup diagnostics, other activities and non-session screens are not hidden',()=>{
  for(const opts of [{content:false},{panel:false},{currentRoot:false},{session:false},{activity:false},{window:false}]){
    assert.equal(execute(opts).dismissed,0,JSON.stringify(opts));
  }
});
test('focus callback and marker target only the existing content panel without altering authentication or reports',()=>{
  const focus=method(main,'.method public final onWindowFocusChanged(Z)V');
  assert.match(focus,/invoke-super \{p0, p1\}, Le6;->onWindowFocusChanged\(Z\)V/);
  assert.match(focus,/if-eqz p1, :done[\s\S]*?->dismissContentForSession/);
  const show=method(overlay,'.method public static show(Landroid/app/Activity;Ljava/lang/String;)V');
  assert.match(show,/const-string v2, "CONTENT STUCK"[\s\S]*?String;->startsWith[\s\S]*?->contentReport:Z/);
  const fn=method(overlay,'.method public static dismissContentForSession(');
  assert.doesNotMatch(fn,/NativeCrashGuard;->write|Cookie|WebStorage|loadUrl|->transition|sput.*NativeSessionGate/);
  assert.match(fn,/\.catch Ljava\/lang\/Throwable;/);
});
