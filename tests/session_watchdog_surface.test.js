'use strict';
// Execute the control flow of the real Smali with minimal Android doubles.
// This is not an Android emulator or an authenticated Spotify test.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const source = fs.readFileSync('smali/com/melodix/music/StartupUnstickRunnable.smali','utf8');
function codeFor(signature) {
  const start = source.indexOf(signature);
  assert.ok(start >= 0);
  const code = source.slice(start, source.indexOf('.end method', start)).split('\n').map(x => x.trim());
  return {code, labels:Object.fromEntries(code.map((s,i)=>[s,i]))};
}
function execute(signature, params, state, stopAt) {
  const {code, labels} = codeFor(signature); const r = {...params}; let result;
  for (let pc=0, steps=0; pc<code.length && steps++<200; pc++) {
    const line=code[pc]; let m;
    if (stopAt && line===stopAt) return line;
    if (!line || /^[.#:]/.test(line)) continue;
    if ((m=line.match(/^const\/4 (\w+), (\S+)$/))) {r[m[1]]=Number(m[2]);continue;}
    if ((m=line.match(/^const-string (\w+), (.+)$/))) {r[m[1]]=JSON.parse(m[2]);continue;}
    if ((m=line.match(/^sget(?:-object)? (\w+), .*NativeSessionGate;->(\w+):/))) {r[m[1]]=state[m[2]];continue;}
    if ((m=line.match(/^iget(?:-object|-boolean)? (\w+), (\w+), .*;->(\w+):/))) {r[m[1]]=r[m[2]][m[3]];continue;}
    if ((m=line.match(/^move-result(?:-object)? (\w+)$/))) {r[m[1]]=result;continue;}
    if ((m=line.match(/^if-(eqz|nez) (\w+), (:\w+)$/))) {if ((m[1]==='eqz') ? !r[m[2]] : !!r[m[2]]) {if (m[3]===stopAt) return stopAt;pc=labels[m[3]];}continue;}
    if ((m=line.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))) {if ((r[m[2]]===r[m[3]]) === (m[1]==='eq')) {if (m[4]===stopAt) return stopAt;pc=labels[m[4]];}continue;}
    if ((m=line.match(/^return (\w+)$/))) return r[m[1]];
    if (line==='return-void') return 'return';
    if ((m=line.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
      const a=m[1].split(', ').map(k=>r[k]), method=m[2];
      if (method.includes('->isShown()')) result=a[0].shown;
      else if (method.includes('->getRootView()')) result=a[0].root;
      else if (method.includes('->getWindow()')) result=a[0].window;
      else if (method.includes('->getDecorView()')) result=a[0].decor;
      else if (method.includes('->isLoginWebPath()')) result=a[0].loginPath;
      else if (method.includes('->startsWith(')) result=a[0].startsWith(a[1]);
      else if (method.includes('->sessionSurfaceVisible(')) result=execute('.method public static sessionSurfaceVisible(',{p0:a[0]},state);
      else assert.fail('unsupported call '+method);
      continue;
    }
    assert.fail('unsupported instruction '+line);
  }
  assert.fail('execution did not terminate');
}
function setup(state=1) {
  const decor={}, other={};
  const activity={window:{decor},G:{shown:false},loginPath:false};
  return {activity, state:{state,overlay:null},decor,other};
}
const sig='.method public static sessionSurfaceVisible(';
const runSig='.method public final run()V';
function visible(f) { return execute(sig,{p0:f.activity},f.state); }
function action(f,report='CONTENT STUCK - snapshot',unstick=0) {
  // Returning before :show_report suppresses both the full-screen panel and probes.
  return execute(runSig,{p0:{activity:f.activity,report,unstick}},f.state,':show_report');
}
test('visible current session overlay is not confused with a missing home',()=>{
  for (const s of [0,1,2,4]) {
    const f=setup(s);f.state.overlay={shown:true,root:f.decor};
    assert.equal(visible(f),1);assert.equal(action(f),'return');
  }
});
test('a visible official login page is protected even if loginActive is false',()=>{
  const f=setup(1);f.activity.G.shown=true;f.activity.loginPath=true;
  assert.equal(visible(f),1);assert.equal(action(f),'return');
});
test('hidden, stale or absent session surfaces do not silence the watchdog',()=>{
  for (const mode of ['hidden','old-activity','missing','hidden-login','other-page']) {
    const f=setup();
    if(mode==='hidden') f.state.overlay={shown:false,root:f.decor};
    if(mode==='old-activity') f.state.overlay={shown:true,root:f.other};
    if(mode==='hidden-login') f.activity.loginPath=true;
    if(mode==='other-page') f.activity.G.shown=true;
    assert.equal(visible(f),0,mode);assert.equal(action(f),':show_report',mode);
  }
});
test('valid sessions and real startup hangs retain their diagnostics and recovery',()=>{
  const f=setup(3);f.state.overlay={shown:true,root:f.decor};f.activity.G.shown=true;f.activity.loginPath=true;
  assert.equal(visible(f),0);assert.equal(action(f),':show_report');
  f.state.state=1;assert.equal(action(f,'STARTUP STUCK - snapshot',1),':show_report');
  assert.equal(action(f,'another error',0),':show_report');
});
test('only content presentation and probes are deferred; report remains recorded and session unchanged',()=>{
  const run=codeFor(runSig).code.join('\n');
  assert.ok(run.indexOf('->sessionSurfaceVisible(')<run.indexOf('->show(Landroid/app/Activity;'));
  assert.ok(run.indexOf('->show(Landroid/app/Activity;')<run.indexOf('->runProbe('));
  assert.match(run,/if-nez v2, :unstick_done/);
  assert.doesNotMatch(source,/sput(?:-boolean)? .*NativeSessionGate;|removeAllCookies|deleteAllData|->loadUrl\(/);
  const watchdog=fs.readFileSync('smali/com/melodix/music/StartupHangWatchdog.smali','utf8');
  assert.ok(watchdog.indexOf('NativeCrashGuard;->write(Ljava/lang/String;)V',watchdog.indexOf(':content_hang')) < watchdog.indexOf('StartupUnstickRunnable;-><init>',watchdog.indexOf(':content_hang')));
});
