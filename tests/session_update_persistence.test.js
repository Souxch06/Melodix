'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
function method(src,sig){const i=src.indexOf(sig);assert.ok(i>=0,sig);return src.slice(i,src.indexOf('.end method',i));}
test('automatic update is released only after the cookie flush, including its worker flag',()=>{
 const onStop=method(read('smali/com/melodix/music/MainActivity.smali'),'.method public final onStop()V');
 const flush=onStop.indexOf('CookieManager;->flush()V'),flag=onStop.indexOf('SelfUpdater;->noteStopped()V'),install=onStop.indexOf('SelfUpdater;->installPending(');
 assert.ok(flush>=0 && flag>flush && install>flag);assert.match(onStop,/if-eqz v0, :flush_failed/);
 assert.match(onStop,/:catch_flush\s+move-exception v0\s+:flush_failed[\s\S]*?goto :selfupd_done\s+:flush_done/);
 assert.doesNotMatch(onStop,/removeAllCookies|removeSessionCookies|deleteAllData/);
 const updater=read('smali/com/melodix/music/SelfUpdater.smali');assert.match(updater,/stoppedFlag:Z[\s\S]*?if-eqz v3, :wait_background[\s\S]*?installPending/);
});
test('login return flushes WebView cookies without reading, rewriting, clearing or proving session',()=>{
 const gate=method(read('smali/com/melodix/music/NativeSessionGate.smali'),'.method public static pageFinished(');
 assert.ok(gate.indexOf('open.spotify.com')<gate.indexOf('flushCookies()V'));assert.ok(gate.indexOf('flushCookies()V')<gate.indexOf('->verify('));
 const flush=method(read('smali/com/melodix/music/NativeSessionRecovery.smali'),'.method public static flushCookies()V');
 assert.match(flush,/CookieManager;->flush\(\)V/);assert.match(flush,/\.catch Ljava\/lang\/RuntimeException/);
 assert.doesNotMatch(flush,/getCookie|setCookie|remove|delete|Evidence|transition|put|Log/);
});
test('cold-start cleanup flag is initialized false and set true only in the explicit settings logout handler',()=>{
 const {execFileSync}=require('node:child_process');const text=execFileSync('rg',['-n','-e','sput-boolean .*MainActivity;->l0:Z','smali'],{encoding:'utf8'}).trim().split('\n');
 assert.equal(text.length,2);assert.ok(text.some(x=>x.startsWith('smali/y51.smali:')&&x.includes('sput-boolean p1')));assert.ok(text.some(x=>x.startsWith('smali/s4.smali:')&&x.includes('sput-boolean v5')));
 assert.match(read('smali/y51.smali'),/:pswitch_0[\s\S]*?const\/4 p1, 0x1[\s\S]*?sput-boolean p1, Lcom\/melodix\/music\/MainActivity;->l0:Z/);
 assert.match(method(read('smali/com/melodix/music/MainActivity.smali'),'.method public final A()V'),/sget-boolean v1, Lcom\/melodix\/music\/MainActivity;->l0:Z[\s\S]*?if-eqz v1, :cond_0[\s\S]*?removeAllCookies[\s\S]*?:cond_0/);
});
test('user-facing builds gate upload on the pinned public signer, exact package and version floor',()=>{
 const w=read('.github/workflows/preview-apk.yml'),check=w.indexOf('Check Preview update identity and version'),upload=w.indexOf('Upload APK as workflow artifact');
 assert.ok(check>0&&upload>check);const s=w.slice(check,upload);assert.match(s,/inputs.target_debuggable != true/);assert.match(s,/apksigner" verify --print-certs/);assert.match(s,/verify_preview_update.py/);assert.doesNotMatch(s,/pm clear|uninstall/);
});
test('actual verifier rejects incompatible keys, packages, versions, ambiguity and malformed data',()=>{
 const {execFileSync,spawnSync}=require('node:child_process'),os=require('node:os'),path=require('node:path');const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'mel-update-'));
 const cert=path.join(tmp,'cert'),badging=path.join(tmp,'badging'),digest='e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f';
 const goodcert=`Signer #1 certificate SHA-256 digest: ${digest}\n`,goodpkg="package: name='com.melodix.music.preview' versionCode='1021474' versionName='test'\n";
 try {for(const [c,b,pass] of [[goodcert,goodpkg,true],[goodcert.toUpperCase(),goodpkg,false],[goodcert.replace(digest,'f'.repeat(64)),goodpkg,false],[goodcert+goodcert,goodpkg,false],[goodcert,goodpkg.replace('1021474','1021473'),false],[goodcert,goodpkg.replace('com.melodix.music.preview','com.melodix.music'),false],[goodcert,goodpkg+goodpkg,false],['',goodpkg,false]]){fs.writeFileSync(cert,c);fs.writeFileSync(badging,b);const r=spawnSync('python3',['scripts/verify_preview_update.py',cert,badging],{encoding:'utf8'});assert.equal(r.status===0,pass,`${c.slice(0,55)} ${b.slice(0,80)}`);}}finally{fs.rmSync(tmp,{recursive:true,force:true});}
});
test('upgrade emulator fixture exercises synthetic cookie and WebStorage through install -r without clearing data',()=>{
 const fixture=read('tests/android/UpdatePersistenceInstrumentation.java'),script=read('scripts/update_persistence_emulator.sh'),workflow=read('.github/workflows/test-session-gate.yml');
 assert.match(fixture,/melodix-update-fixture\.invalid/);assert.match(fixture,/cookies\.setCookie[\s\S]*?cookies\.flush/);assert.match(fixture,/cookies\.getCookie/);assert.match(fixture,/localStorage\.setItem[\s\S]*?localStorage\.getItem/);assert.doesNotMatch(fixture,/open\.spotify\.com|sp_dc|authorization|Bearer/i);
 assert.match(script,/adb install "\$old"[\s\S]*?-e mode seed[\s\S]*?adb install -r "\$new"[\s\S]*?-e mode verify/);assert.doesNotMatch(script,/pm clear|adb uninstall/);
 assert.match(workflow,/update-persistence:[\s\S]*?update_persistence_emulator\.sh/);
});
test('manual and background installer must flush before PackageInstaller; manual failure is shown',()=>{
 const recovery=read('smali/com/melodix/music/NativeSessionRecovery.smali'),flush=method(recovery,'.method public static flushForUpdate()Z');
 assert.match(flush,/CookieManager;->flush\(\)V[\s\S]*?const\/4 v1, 0x1[\s\S]*?return v1/);assert.match(flush,/\.catch Ljava\/lang\/Throwable/);assert.doesNotMatch(flush,/remove|delete|getCookie|setCookie/);
 const install=method(read('smali/com/melodix/music/SelfUpdater.smali'),'.method public static install(');assert.match(install,/:do_install[\s\S]*?flushForUpdate\(\)Z[\s\S]*?if-nez v1, :cookie_flush_ok[\s\S]*?goto(?:\/16)? :done[\s\S]*?:cookie_flush_ok[\s\S]*?getPackageInstaller/);
 const manual=read('smali/com/melodix/music/SelfUpdater$OnInstall.smali');assert.match(manual,/flushForUpdate\(\)Z[\s\S]*?Toast;->show\(\)V[\s\S]*?:flush_ok[\s\S]*?SelfUpdater;->install/);
});

test('upgrade failure controls use distinct offline origins and do not weaken the strict replacement assertion',()=>{
 const fixture=read('tests/android/UpdatePersistenceInstrumentation.java'),script=read('scripts/update_persistence_emulator.sh');
 for(const marker of ['melodix-restart-fixture.invalid','melodix-force-stop-fixture.invalid','melodix-same-process-fixture.invalid','melodix-settled-fixture.invalid','melodix-update-fixture.invalid'])assert.ok(fixture.includes(marker));
 assert.match(script,/run_probe restart[\s\S]*?run_probe force_stop[\s\S]*?run_probe settled[\s\S]*?phase=seed[\s\S]*?adb install -r "\$new"[\s\S]*?grep -Fq 'INSTRUMENTATION_RESULT: overall=passed'/);
 assert.doesNotMatch(script,/pm clear|adb uninstall/);assert.doesNotMatch(fixture,/open\.spotify\.com|sp_dc|authorization|Bearer/i);
});
