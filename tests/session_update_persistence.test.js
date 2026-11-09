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
test('Preview builds compare their package, version and signer against the exact installed reference before uploading',()=>{
 const w=read('.github/workflows/preview-apk.yml'),download=w.indexOf('Download installed Preview compatibility reference'),check=w.indexOf('Check update compatibility with Preview137'),upload=w.indexOf('Upload APK as workflow artifact');
 assert.ok(download>0&&check>download&&upload>check);const s=w.slice(download,upload);
 assert.match(s,/run-id: 42659601759/);assert.match(s,/65736a870192dfab10101912002d77c731cb64bf1fd0ee095bf9b4046a3a9122/);
 assert.match(s,/apksigner" verify --print-certs "\$reference"/);assert.match(s,/\$old_cert" == "\$new_cert/);
 assert.match(s,/\$new_package" == "\$old_package/);assert.match(s,/new_version > old_version/);assert.doesNotMatch(s,/pm clear|uninstall/);
});
