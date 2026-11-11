'use strict';
// Execute the real watchdog report preparation with doubles, not an emulator.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const watchdog=fs.readFileSync('smali/com/melodix/music/StartupHangWatchdog.smali','utf8');
const overlay=fs.readFileSync('smali/com/melodix/music/StartupDiagnosticOverlay.smali','utf8');
const runnable=fs.readFileSync('smali/com/melodix/music/StartupUnstickRunnable.smali','utf8');
function prepareReport() {
  const start=watchdog.indexOf('    :content_hang\n');
  const end=watchdog.indexOf('    const-string v0, "content-hang"',start);
  assert.ok(start>=0&&end>start);
  const code=watchdog.slice(start,end).split('\n').map(x=>x.trim());
  const regs={};let result,stored;
  const reportMethod=overlay.slice(overlay.indexOf('.method public static buildReport('),overlay.indexOf('.end method',overlay.indexOf('.method public static buildReport(')));
  const header=reportMethod.match(/const-string v1, ("MELODIX DIAGNOSTIC[^\n]+")/);
  assert.ok(header,'real report header');
  for(const line of code){let m;if(!line||/^[.#:]/.test(line))continue;
    if((m=line.match(/^const-string (\w+), (.+)$/))){regs[m[1]]=JSON.parse(m[2]);continue;}
    if((m=line.match(/^move-object (\w+), (\w+)$/))){regs[m[1]]=regs[m[2]];continue;}
    if((m=line.match(/^move-result-object (\w+)$/))){regs[m[1]]=result;continue;}
    if((m=line.match(/^new-instance (\w+), Ljava\/lang\/StringBuilder;$/))){regs[m[1]]={value:''};continue;}
    if((m=line.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){
      const args=m[1].split(', ').map(k=>regs[k]);const call=m[2];
      if(call.includes('StartupDiagnosticOverlay;->buildReport')) result=JSON.parse(header[1])+'tap = fermer\n\nversion: test\n'+args[0]+'\nappareil: test';
      else if(call.includes('NativeCrashGuard;->write')) stored=args[0];
      else if(call.includes('StringBuilder;-><init>')) {}
      else if(call.includes('StringBuilder;->append')) {args[0].value+=args[1];result=args[0];}
      else if(call.includes('StringBuilder;->toString')) result=args[0].value;
      else assert.fail('unknown call '+call);
      continue;
    }
    assert.fail('unknown instruction '+line);
  }
  return {stored,dispatch:regs.v6};
}
test('the actual content report sent to the runnable matches its content guard',()=>{
  const {stored,dispatch}=prepareReport();
  const run=runnable.slice(runnable.indexOf('.method public final run()V'),runnable.indexOf('.end method',runnable.indexOf('.method public final run()V')));
  const guard=run.match(/const-string v2, ("CONTENT STUCK")\s+invoke-virtual \{v1, v2\}, Ljava\/lang\/String;->startsWith/);
  assert.ok(guard,'content guard exists');
  assert.equal(dispatch.startsWith(JSON.parse(guard[1])),true,'formatted report must reach the session-surface guard');
  assert.match(stored,/^MELODIX DIAGNOSTIC/,'the original diagnostic is retained');
  assert.ok(dispatch.includes(stored),'the full report is still passed to the UI');
  assert.match(run,/->sessionSurfaceVisible\(Lcom\/melodix\/music\/MainActivity;\)Z[\s\S]*?if-nez v2, :unstick_done/);
});
test('the genuine startup-stuck branch is unaffected and cannot be suppressed by the content guard',()=>{
  const content=watchdog.indexOf('    :content_gate\n');
  assert.match(watchdog.slice(0,content),/const\/4 v5, 0x1\s+goto :post_panel/);
  const run=runnable.slice(runnable.indexOf('.method public final run()V'));
  assert.match(run,/iget-boolean v2, p0, .*->unstick:Z\s+if-nez v2, :show_report/);
});
