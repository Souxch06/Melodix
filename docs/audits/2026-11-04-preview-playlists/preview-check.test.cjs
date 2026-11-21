'use strict';
// Run against the patched candidate with MELODIX_SOURCE_ROOT; static/source
// checks and JSDOM only: does not prove Android execution or HTTP outcomes.
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_SOURCE_ROOT; if(!root) throw Error('Set MELODIX_SOURCE_ROOT to patched candidate');
const read=p=>fs.readFileSync(path.join(root,p),'utf8');
const factory=read('smali/m9.smali'); const client=read('smali/c91.smali');
test('bundled hosts empty; both stored-file branches use bundled asset',()=>{
 assert.equal(read('assets/adblock_hosts.txt'),''); const j=factory.match(/\.method public static j\(\)V([\s\S]*?)\.end method/)[1];
 assert.match(j,/ignore an existing downloaded hosts file\.\s+goto :cond_0/);
 assert.match(j,/use only the empty bundled asset\.\s+goto :cond_8/);
});
test('service-worker blocking injection is unreachable from its normal entry',()=>{
 assert.match(factory,/:catch_0\s+# Preview diagnostic: skip the document-start SW blocker\.\s+goto :cond_0\s+:try_sw_feature_start/);
});
test('desktop script does not call or replace service worker APIs',async()=>{
 const w=new JSDOM('<body></body>',{url:'https://open.spotify.com/',runScripts:'outside-only'}).window;
 let calls=0; const reg=()=>Promise.resolve(); const get=()=>{calls++;return Promise.resolve([{unregister(){calls++}}])};
 Object.defineProperty(w.navigator,'serviceWorker',{value:{register:reg,getRegistrations:get},configurable:true});
 w.setInterval=()=>0;w.setTimeout=()=>0;w.MutationObserver=class{observe(){}disconnect(){}};
 try{w.eval(read('assets/desktop_spoof.js'));await Promise.resolve();assert.equal(calls,0);assert.equal(w.navigator.serviceWorker.register,reg);assert.equal(w.navigator.serviceWorker.getRegistrations,get)}finally{w.close()}
});
test('both client paths do not evaluate the playlist sorting asset',()=>{
 assert.equal((client.match(/Preview diagnostic: do not execute playlist_sort\.js\.\s+nop/g)||[]).length,2);
 for (const r of ['v0, v1, v8','p1, p0, p3']) {
   const register=r.split(',')[1].trim();
   assert.doesNotMatch(client,new RegExp('const-string '+register+', "playlist_sort\\.js"[\\s\\S]{0,400}invoke-virtual \\{'+r+'\\}, Landroid/webkit/WebView;->evaluateJavascript'));
 }
});
test('WebView debugger is gated by exact Preview package',()=>{
 assert.match(factory,/getPackageName\(\)Ljava\/lang\/String;[\s\S]{0,250}const-string v2, "com\.melodix\.music\.preview"[\s\S]{0,200}String;->equals[\s\S]{0,100}setWebContentsDebuggingEnabled/);
});
