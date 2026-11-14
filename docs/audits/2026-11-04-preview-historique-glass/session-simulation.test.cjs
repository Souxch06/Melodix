'use strict';
// Historical JS fragments, synthetic storage/requests only. No real network,
// cookies, credentials, Android WebView, or Spotify account are accessed.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const root=process.env.MELODIX_HISTORICAL_ROOT;
if(!root) throw new Error('MELODIX_HISTORICAL_ROOT is required');
const source=fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8');
function block(from,to){const start=source.indexOf(from), end=source.indexOf(to,start);assert.ok(start>=0&&end>start);return source.slice(start,end);}
function store(initial={}){
    const map=new Map(Object.entries(initial));
    return {getItem:k=>map.has(k)?map.get(k):null, setItem:(k,v)=>map.set(k,String(v)), clear:()=>map.clear()};
}
function auth(initial={}, storage=store(), onTick=()=>{}){
    let ticks=0,delays=[];
    const w={...initial};
    const ctx=vm.createContext({window:w,localStorage:storage,setTimeout(fn,ms){delays.push(ms);onTick(++ticks,w,storage);fn();}});
    vm.runInContext(block('    async function ensureAuthToken() {','    function pickOptimalArtwork('),ctx);
    return {w,storage,delays};
}
function interceptor(initial={}, storage=store()){
    const forwarded=[],calls=[];
    const w={SF_CONFIG:{isCanvasDisabled:false}, fetch:async (...args)=>{forwarded.push(args);return {status:200,ok:true};},...initial};
    const ctx=vm.createContext({window:w,localStorage:storage,Headers,Response,TextEncoder,
        checkMediaLib:()=>calls.push('checkMediaLib'),ffDone:false,AndBridge:{},console:{log(){},warn(){},error(){}}});
    vm.runInContext(block('    const oriFetch = window.fetch;','    // =========================================================================\n    // SECTION 3:'),ctx);
    return {w,storage,forwarded,calls};
}
const TOKEN='Bearer fixture-A';
const TOKEN_B='Bearer fixture-B';

test('session fixture: already-present in-memory value is accepted without validity or expiry check',async()=>{
    const x=auth({spotAuthToken:'synthetic-non-bearer'});
    assert.equal(await x.w.ensureAuthToken(),true);
    assert.equal(x.delays.length,0);
});
test('session fixture: absent in-memory value is restored from synthetic storage',async()=>{
    const x=auth({},store({spot_auth_token:TOKEN,spot_cli_token:'fixture-client',spot_device_id:'fixture-device'}));
    assert.equal(await x.w.ensureAuthToken(),true);
    assert.equal(x.w.spotAuthToken,TOKEN);
    assert.equal(x.w.spotCliToken,'fixture-client');
    assert.equal(x.w.spotDevId,'fixture-device');
    assert.equal(x.delays.length,0);
});
test('session fixture: cleared storage does not replace an existing in-memory value',async()=>{
    const storage=store({spot_auth_token:TOKEN_B});
    const x=auth({spotAuthToken:TOKEN},storage);
    storage.clear();
    assert.equal(await x.w.ensureAuthToken(),true);
    assert.equal(x.w.spotAuthToken,TOKEN);
});
test('session fixture: missing value finishes after 30 mocked 40 ms waits',async()=>{
    const x=auth();
    assert.equal(await x.w.ensureAuthToken(),false);
    assert.equal(x.delays.length,30);
    assert.ok(x.delays.every(ms=>ms===40));
});
test('session fixture: value arriving during a mocked wait is loaded',async()=>{
    const x=auth({},store(),(n,w,storage)=>{if(n===3)storage.setItem('spot_auth_token',TOKEN);});
    assert.equal(await x.w.ensureAuthToken(),true);
    assert.equal(x.delays.length,3);
});
test('session fixture: inaccessible storage is caught and returns false after mocked waits',async()=>{
    const x=auth({}, {getItem(){throw new Error('fixture storage blocked');}});
    assert.equal(await x.w.ensureAuthToken(),false);
    assert.equal(x.delays.length,30);
});
test('fetch fixture: plain-object authentication headers are captured and request is forwarded',async()=>{
    const x=interceptor();
    await x.w.fetch('https://example.invalid/fixture',{headers:{authorization:TOKEN,'client-token':'fixture-client'}});
    assert.equal(x.w.spotAuthToken,TOKEN);
    assert.equal(x.storage.getItem('spot_auth_token'),TOKEN);
    assert.equal(x.w.spotCliToken,'fixture-client');
    assert.equal(x.forwarded.length,1);
});
test('fetch fixture: Headers instance is forwarded but is not captured by object-property lookup',async()=>{
    const x=interceptor();
    await x.w.fetch('https://example.invalid/fixture',{headers:new Headers({Authorization:TOKEN,'Client-Token':'fixture-client'})});
    assert.equal(x.forwarded.length,1);
    assert.equal(x.w.spotAuthToken,undefined);
    assert.equal(x.w.spotCliToken,undefined);
    assert.equal(x.storage.getItem('spot_auth_token'),null);
});
test('fetch fixture: lowercase bearer scheme is not captured by the case-sensitive prefix check',async()=>{
    const x=interceptor();
    await x.w.fetch('https://example.invalid/fixture',{headers:{Authorization:'bearer fixture-A'}});
    assert.equal(x.w.spotAuthToken,undefined);
    assert.equal(x.forwarded.length,1);
});
test('fetch fixture: interceptor attempts string methods on Request when canvas disabling is enabled',async()=>{
    const x=interceptor({SF_CONFIG:{isCanvasDisabled:true}});
    const input=new Request('https://example.invalid/fixture');
    await assert.rejects(x.w.fetch(input),/includes is not a function/);
    assert.equal(x.forwarded.length,0);
});

// Static characterization of the native branch only: never invoke Android APIs.
const smaliRoot=process.env.MELODIX_SMALI_ROOT||root;
const readSmali=name=>fs.readFileSync(path.join(smaliRoot,'smali/com/melodix/music',name),'utf8');
function smaliMethod(text,signature){
    const start=text.indexOf(signature),end=text.indexOf('.end method',start);
    assert.ok(start>=0&&end>start);
    return text.slice(start,end).replace(/^\s*\.line\s+\d+\s*$/gm,'');
}
function cleanupBranch(flag){
    const activity=readSmali('MainActivity.smali');
    const method=smaliMethod(activity,'.method public final A()V');
    const m=method.match(/sget-boolean (v\d+), Lcom\/melodix\/music\/MainActivity;->l0:Z[\s\S]*?if-(eqz|nez) \1, :(\w+)/);
    assert.ok(m);
    const after=method.slice(m.index+m[0].length);
    const target=after.search(new RegExp('^\\s*:'+m[3]+'\\s*$','m'));
    assert.ok(target>=0);
    const guarded=after.slice(0,target);
    assert.match(guarded,/CookieManager;->removeSessionCookies/);
    assert.match(guarded,/CookieManager;->removeAllCookies/);
    assert.match(guarded,/WebStorage;->deleteAllData/);
    assert.match(after.slice(target),/WebView;/);
    const jumps=m[2]==='eqz'?!flag:flag;
    return !jumps;
}
test('native logout characterization: conditional flag false skips native cleanup block',()=>{
    assert.equal(cleanupBranch(false),false);
});
test('native logout characterization: conditional flag true enters native cleanup block',()=>{
    assert.equal(cleanupBranch(true),true);
});
test('native logout characterization: bridge posts runnable that invokes A, without setting its flag locally',()=>{
    const bridge=smaliMethod(readSmali('AndBridge.smali'),'.method public final nativeLogout()V');
    const runnable=smaliMethod(readSmali('NativeLogoutRunnable.smali'),'.method public final run()V');
    assert.match(bridge,/NativeLogoutRunnable;-><init>/);
    assert.match(bridge,/Activity;->runOnUiThread/);
    assert.match(runnable,/MainActivity;->A\(\)V/);
    assert.doesNotMatch(bridge,/sput-boolean[^\n]*MainActivity;->l0:Z/);
    assert.doesNotMatch(runnable,/sput-boolean[^\n]*MainActivity;->l0:Z/);
});

function shellWithFakeStorage(native=true){
    const {JSDOM}=require('jsdom');
    const dom=new JSDOM('<!doctype html><body><main id="main-view"></main></body>',{url:'https://example.invalid/'});
    const localStorage=store({spot_auth_token:TOKEN}),sessionStorage=store({key:'fixture'}),events=[];
    const w={location:{hostname:'open.spotify.com',pathname:'/',href:'https://open.spotify.com/',assign:url=>events.push(['navigate',url])},
        localStorage,sessionStorage,spotAuthToken:TOKEN,
        AndBridge:native?{nativeLogout:()=>events.push(['nativeLogout']),onNativeUiData(){},onNativeUiReady(){}}:{onNativeUiData(){},onNativeUiReady(){}},
        addEventListener(){},setTimeout(){return 1;},clearTimeout(){},MutationObserver:class{observe(){}}};
    const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
    vm.runInNewContext(shell,{window:w,document:dom.window.document,URL,console});
    return {w,events,localStorage,sessionStorage,close:()=>dom.window.close()};
}
test('shell logout fixture clears simulated stores and calls simulated native logout',()=>{
    const x=shellWithFakeStorage();
    try{
        assert.equal(x.w.__sfToggleSpotifySetting('spotify:settings:logout'),true);
        assert.equal(x.localStorage.getItem('spot_auth_token'),null);
        assert.equal(x.sessionStorage.getItem('key'),null);
        assert.deepEqual(x.events,[['nativeLogout']]);
        // The fake callback does not destroy the window; real native behavior is not executed.
        assert.equal(x.w.spotAuthToken,TOKEN);
    } finally {x.close();}
});
test('shell logout fixture without native bridge requests navigation instead',()=>{
    const x=shellWithFakeStorage(false);
    try{
        assert.equal(x.w.__sfToggleSpotifySetting('spotify:settings:logout'),true);
        assert.equal(x.localStorage.getItem('spot_auth_token'),null);
        assert.deepEqual(x.events,[['navigate','https://accounts.spotify.com/logout']]);
    } finally {x.close();}
});
test('shell logout fixture: local storage failure skips the following session clear but still calls native callback',()=>{
    const x=shellWithFakeStorage();
    try{
        x.localStorage.clear=()=>{throw new Error('synthetic storage failure');};
        assert.equal(x.w.__sfToggleSpotifySetting('spotify:settings:logout'),true);
        assert.equal(x.sessionStorage.getItem('key'),'fixture');
        assert.deepEqual(x.events,[['nativeLogout']]);
    } finally {x.close();}
});
