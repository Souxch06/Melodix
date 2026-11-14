'use strict';
// Real historical scripts in JSDOM; fake native interface, timer queue and
// fake network only. There is no Android WebView or live Spotify request.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_HISTORICAL_ROOT;
if(!root) throw new Error('MELODIX_HISTORICAL_ROOT is required');
const asset=name=>fs.readFileSync(path.join(root,'assets',name),'utf8');
const bridge=asset('spotify_bridge.js'),shell=asset('native_ui_shell.js'),login=asset('classic_login.js');
function bootstrap(respond=null){
    const dom=new JSDOM('<!doctype html><html><head></head><body><main id="main-view"><a href="/playlist/fake1">Fictive</a></main></body></html>',{
        url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()
    });
    const w=dom.window,calls=[],requests=[],timers=[];
    w.fetch=async(url,init)=>{
        const body=init?.body ? JSON.parse(init.body) : null;
        requests.push({url:String(url),body});
        if(respond) return respond({url:String(url),body});
        if(body?.operationName==='libraryV3') return {ok:true,status:200,json:async()=>({data:{me:{libraryV3:{items:[{item:{data:{__typename:'Playlist',uri:'spotify:playlist:fake1',name:'Fictive'}}}]}}}})};
        if(String(url).includes('connect-state')) return {ok:true,status:200};
        throw new Error('unhandled synthetic request');
    };
    w.XMLHttpRequest=class {open(){throw new Error('network blocked');}};
    w.WebSocket=class {constructor(){throw new Error('network blocked');}};
    w.Headers=Headers;w.Response=Response;w.TextEncoder=TextEncoder;
    w.SF_CONFIG={guiMode:'csshack',isCanvasDisabled:false};
    w.spotAuthToken='Bearer fixture';w.spotCliToken='client-fixture';w.spotDevId='device-fixture';
    const callbacks={readBundledAsset:()=>bridge,nativeFetch:()=>null,
        onMediaItemsLoaded:(id,json)=>calls.push({event:'media',id,rows:JSON.parse(json)}),
        onNativeUiData:(id,json)=>calls.push({event:'native',id,rows:JSON.parse(json)}),
        onNativeHomeRows:json=>calls.push({event:'home',rows:JSON.parse(json)}),
        onNativeUiReady(){},onNativeUiRoute(){}};
    w.AndBridge=new Proxy(callbacks,{get:(target,key)=>key in target?target[key]:()=>{}});
    w.setTimeout=(fn,ms)=>{timers.push({kind:'timeout',ms,fn});return timers.length;};
    w.setInterval=(fn,ms)=>{timers.push({kind:'interval',ms,fn});return timers.length;};
    w.clearInterval=w.clearTimeout=()=>{};
    w.MutationObserver=class{observe(){}disconnect(){}};
    w.eval(shell);
    return {w,dom,calls,requests,timers,close:()=>dom.window.close()};
}

test('full shell creates one same-origin loader tag; full bridge completes when manually evaluated',()=>{
    const x=bootstrap();
    try {
        const w=x.w;
        assert.equal(w.__sfNativeUiShellCompleted,true);
        assert.equal(w.__sfLoadBundledBridge('spotify_bridge.js'),true);
        assert.equal(w.__sfLoadBundledBridge('spotify_bridge.js'),true);
        const tags=w.document.querySelectorAll('script[data-sf-melodix-bridge="1"]');
        assert.equal(tags.length,1);
        assert.equal(tags[0].src,'https://open.spotify.com/__melodix__/spotify_bridge.js');
        assert.equal(w.__sfBridgeSourceChars,bridge.length);
        assert.notEqual(w.__sfMelodixBridgeCompleted,true);
        // JSDOM is not an Android WebResourceResponse; simulate delivery manually.
        w.eval(bridge);
        assert.equal(w.__sfMelodixBridgeCompleted,true);
        assert.equal(w.__sfMelodixBridgeBootstrapErrors,0);
        assert.equal(typeof w.fetchMediaItems,'function');
        assert.equal(typeof w.playFromUri,'function');
        const wrapped=w.fetch;
        w.eval(bridge);
        assert.equal(w.fetch,wrapped,'re-evaluation should not wrap fetch again');
        assert.equal(x.requests.length,0);
    } finally{x.close();}
});

test('loader recovery fixture leaves the failed script tag in place through four retry callbacks',()=>{
    const x=bootstrap();
    try {
        assert.equal(x.w.__sfLoadBundledBridge('spotify_bridge.js'),true);
        const tag=x.w.document.querySelector('script[data-sf-melodix-bridge="1"]');
        assert.ok(tag && typeof tag.onerror==='function');
        tag.onerror(); // synthetic failure, no network was attempted
        assert.equal(x.w.__sfBridgeLoadStage,'script-error');
        const first=x.timers.find(t=>t.kind==='timeout'&&t.ms===1200);
        assert.ok(first);
        first.fn();
        for(let n=2;n<=4;n++) {
            const next=x.timers.filter(t=>t.kind==='timeout'&&t.ms===2500)[n-2];
            assert.ok(next);
            next.fn();
            assert.equal(x.w.__sfNativeUiBridgeRecoveryAttempts,n);
            assert.equal(x.w.document.querySelector('script[data-sf-melodix-bridge="1"]'),tag);
        }
        assert.equal(x.timers.filter(t=>t.kind==='timeout'&&t.ms===2500).length,3);
        assert.equal(x.w.__sfMelodixBridgeStarted,undefined);
        assert.equal(x.requests.length,0);
    } finally{x.close();}
});

test('full bridge handles one synthetic library response and shell refresh sends synthetic Home',async()=>{
    const x=bootstrap();
    try {
        x.w.eval(bridge);
        await x.w.fetchMediaItems('playlists');
        assert.equal(x.requests.length,1);
        assert.equal(x.requests[0].body.operationName,'libraryV3');
        assert.equal(x.w.mediaLib.playlists.length,1);
        assert.ok(x.calls.some(c=>c.event==='media'&&c.id==='playlists'&&c.rows[0]?.id==='spotify:playlist:fake1'));
        x.w.__sfNativeUiRefresh();
        assert.ok(x.calls.some(c=>c.event==='home'&&c.rows.some(r=>r.uri==='spotify:playlist:fake1')));
    } finally{x.close();}
});

// Responses are completely synthetic. Deferred promises let the test explicitly
// decide arrival order; the scheduler and Android device are not simulated.
function libraryResponse(name){return {ok:true,status:200,json:async()=>({data:{me:{libraryV3:{items:[{item:{data:{__typename:'Playlist',uri:'spotify:playlist:'+name,name}}}]}}}})};}
function refusal(status){return {ok:false,status,statusText:'synthetic refusal'};}
const yieldTurn=()=>new Promise(resolve=>setImmediate(resolve));

test('full bridge concurrency: two simultaneous library requests can overwrite a newer result with an older one',async()=>{
    const pending=[];
    const x=bootstrap(()=>new Promise(resolve=>pending.push(resolve)));
    try {
        x.w.eval(bridge);
        const old=x.w.fetchMediaItems('playlists');
        const fresh=x.w.fetchMediaItems('playlists');
        await yieldTurn();
        assert.equal(x.requests.length,2);
        assert.equal(pending.length,2);
        pending[1](libraryResponse('new'));
        await fresh;
        assert.equal(x.w.mediaLib.playlists[0].name,'new');
        pending[0](libraryResponse('old'));
        await old;
        assert.equal(x.w.mediaLib.playlists[0].name,'old');
        assert.ok(x.calls.some(c=>c.event==='media'&&c.rows[0]?.name==='new'));
        assert.ok(x.calls.some(c=>c.event==='media'&&c.rows[0]?.name==='old'));
    } finally{x.close();}
});

test('full bridge concurrency: a late earlier refusal replaces a successful later library with empty rows',async()=>{
    const pending=[];
    const x=bootstrap(()=>new Promise(resolve=>pending.push(resolve)));
    try {
        x.w.eval(bridge);
        const old=x.w.fetchMediaItems('playlists');
        const fresh=x.w.fetchMediaItems('playlists');
        await yieldTurn();
        assert.equal(pending.length,2);
        pending[1](libraryResponse('new'));
        await fresh;
        assert.equal(x.w.mediaLib.playlists.length,1);
        pending[0](refusal(403));
        await old;
        assert.equal(x.w.mediaLib.playlists.length,0);
        assert.ok(x.calls.some(c=>c.event==='media'&&c.id==='playlists'&&c.rows.length===0));
    } finally{x.close();}
});

test('full bridge concurrency: one completed overlapping fetch clears busy guard while another remains in flight',async()=>{
    const pending=[];
    const x=bootstrap(()=>new Promise(resolve=>pending.push(resolve)));
    try {
        x.w.eval(bridge);
        const first=x.w.checkMediaLib();
        const second=x.w.checkMediaLib();
        await yieldTurn();
        assert.equal(pending.length,2);
        pending[1](libraryResponse('second'));
        await second;
        // The first promise is still unresolved. A third non-forced check starts.
        const third=x.w.checkMediaLib();
        await yieldTurn();
        assert.equal(pending.length,3);
        pending[2](libraryResponse('third'));
        await third;
        pending[0](libraryResponse('first'));
        await first;
        assert.equal(x.w.mediaLib.playlists[0].name,'first');
    } finally{x.close();}
});

test('full bridge concurrency: request made after fetch starts is queued and delivered by the first response',async()=>{
    const pending=[];
    const x=bootstrap(()=>new Promise(resolve=>pending.push(resolve)));
    try {
        x.w.eval(bridge);
        const first=x.w.fetchMediaItems('playlists');
        await yieldTurn();
        assert.equal(pending.length,1);
        await x.w.fetchMediaItems('playlists');
        assert.equal(pending.length,1);
        assert.equal(x.w.pendingMediaRequests.has('playlists'),true);
        pending[0](libraryResponse('first'));
        await first;
        assert.equal(x.w.pendingMediaRequests.size,0);
        assert.ok(x.calls.some(c=>c.event==='media'&&c.rows[0]?.name==='first'));
    } finally{x.close();}
});

for (const status of [401,403,429]) {
    test(`full bridge fixture: HTTP ${status} yields empty library and a subsequent request can succeed`,async()=>{
        let count=0;
        const x=bootstrap(()=>++count===1?refusal(status):libraryResponse('retry'));
        try {
            x.w.eval(bridge);
            await x.w.fetchMediaItems('playlists');
            assert.equal(x.w.mediaLib.playlists.length,0);
            assert.ok(x.calls.some(c=>c.event==='media'&&c.id==='playlists'&&c.rows.length===0));
            await x.w.fetchMediaItems('playlists');
            assert.equal(count,2);
            assert.equal(x.w.mediaLib.playlists[0].name,'retry');
        } finally{x.close();}
    });
}

function playlistResponse(ids){return {ok:true,status:200,json:async()=>({data:{playlistV2:{content:{items:ids.map(id=>({itemV2:{data:{uri:'spotify:track:'+id,name:id,artists:{items:[]}}}}))}}}})};}
async function reversedPlaylistResponses(aTracks,bTracks){
    const pending=new Map();
    const x=bootstrap(req=>{
        if(req.body?.operationName==='fetchPlaylist') return new Promise(resolve=>pending.set(req.body.variables.uri,resolve));
        if(req.body?.command?.endpoint==='play') return {ok:true,status:200};
        throw new Error('unexpected synthetic request');
    });
    const a='spotify:playlist:old',b='spotify:playlist:new';
    x.w.eval(bridge);
    const first=x.w.fetchMediaItems(a),second=x.w.fetchMediaItems(b);
    await yieldTurn();
    assert.equal(pending.size,2);
    pending.get(b)(playlistResponse(bTracks));
    await second;
    assert.equal(x.w.__sfCurrentContextUri,b);
    pending.get(a)(playlistResponse(aTracks));
    await first;
    assert.equal(x.w.__sfCurrentContextUri,a);
    return {x,a,b};
}
function latestCommand(x){return x.requests.filter(r=>r.body?.command).at(-1)?.body.command;}

test('playlist response race fixture: delayed old playlist replaces queue and shared track uses old context',async()=>{
    const {x,a,b}=await reversedPlaylistResponses(['shared','oldOther'],['shared','newOther']);
    try {
        assert.equal(x.w.__sfNativeOpenUri('spotify:track:shared'),true);
        const cmd=latestCommand(x);
        assert.equal(cmd.context.uri,a);
        assert.notEqual(cmd.context.uri,b);
        assert.deepEqual(cmd.context.pages[0].tracks.map(t=>t.uri),['spotify:track:shared','spotify:track:oldOther']);
        assert.equal(cmd.options.skip_to.track_uri,'spotify:track:shared');
    } finally{x.close();}
});

test('playlist response race fixture: new-only track falls back to a one-track queue after old response',async()=>{
    const {x}=await reversedPlaylistResponses(['old1','old2'],['new1','new2']);
    try {
        assert.equal(x.w.__sfNativeOpenUri('spotify:track:new2'),true);
        const cmd=latestCommand(x);
        assert.equal(cmd.context.uri,'spotify:track:new2');
        assert.deepEqual(cmd.context.pages[0].tracks.map(t=>t.uri),['spotify:track:new2']);
    } finally{x.close();}
});

test('playlist response race fixture: explicit context chooses new playlist despite stale remembered queue',async()=>{
    const {x,b}=await reversedPlaylistResponses(['shared','oldOther'],['shared','newOther']);
    try {
        x.w.playFromUri('spotify:track:shared',b);
        const cmd=latestCommand(x);
        assert.equal(cmd.context.uri,b);
        assert.equal(cmd.options.skip_to.track_uri,'spotify:track:shared');
    } finally{x.close();}
});

test('playlist response race fixture: native ID guard can reject old rows while JS queue is already overwritten',async()=>{
    const {run:interpretRoute}=require('./native-routing-characterization.test.cjs');
    const {x,a,b}=await reversedPlaylistResponses(['shared','oldOther'],['shared','newOther']);
    try {
        const media=x.calls.filter(c=>c.event==='media'&&(c.id===a||c.id===b));
        assert.deepEqual(media.map(c=>c.id),[b,a]);
        const state={nativeExpectedId:b,nativeCurrentScreen:'detail'};
        const fresh=interpretRoute('media:'+b,JSON.stringify(media[0].rows),state);
        const old=interpretRoute('media:'+a,JSON.stringify(media[1].rows),state);
        assert.equal(fresh.renders.length,1);
        assert.equal(old.renders.length,0);
        assert.equal(x.w.__sfCurrentContextUri,a);
        // This bypasses the already-known generic native dispatch defect; only
        // the native receive guard is interpreted under hypothetical delivery.
    } finally{x.close();}
});

test('empty playlist fixture leaves earlier nonempty remembered queue untouched',async()=>{
    const a='spotify:playlist:old',b='spotify:playlist:new';
    const x=bootstrap(req=>{
        if(req.body?.operationName==='fetchPlaylist') return playlistResponse(req.body.variables.uri===a?['shared','oldOther']:[]);
        if(req.body?.command?.endpoint==='play') return {ok:true,status:200};
        throw new Error('unexpected synthetic request');
    });
    try {
        x.w.eval(bridge);
        await x.w.fetchMediaItems(a);
        await x.w.fetchMediaItems(b);
        assert.equal(x.w.__sfCurrentContextUri,a);
        assert.ok(x.calls.some(c=>c.event==='media'&&c.id===b&&c.rows.length===0));
        x.w.__sfNativeOpenUri('spotify:track:shared');
        assert.equal(latestCommand(x).context.uri,a);
    } finally{x.close();}
});

for(const missing of ['spotAuthToken','spotDevId']) {
    test(`native-open fixture reports true even when ${missing} is absent and no play command is made`,()=>{
        const x=bootstrap();
        try {
            x.w.eval(bridge);
            x.w[missing]=null;
            assert.equal(x.w.__sfNativeOpenUri('spotify:track:fake'),true);
            assert.equal(x.requests.filter(r=>r.body?.command).length,0);
        } finally{x.close();}
    });
}

test('full bridge play function builds a fictional command without sending it to Spotify',async()=>{
    const x=bootstrap();
    try {
        x.w.eval(bridge);
        x.w.playFromUri('spotify:track:fake1','spotify:playlist:fake2');
        assert.equal(x.requests.length,1);
        assert.equal(x.requests[0].body.command.endpoint,'play');
        assert.equal(x.requests[0].body.command.context.uri,'spotify:playlist:fake2');
        assert.equal(x.requests[0].body.command.options.skip_to.track_uri,'spotify:track:fake1');
    } finally{x.close();}
});

function loginPage(url,body='<a data-testid="login-username-password" href="/login">Original</a>'){
    const dom=new JSDOM(`<!doctype html><html><head></head><body><div id="root">${body}</div></body></html>`,{url,runScripts:'outside-only',virtualConsole:new VirtualConsole()});
    return {w:dom.window,close:()=>dom.window.close()};
}
function classicLink(w){return w.document.querySelector('a.fuckd');}
test('classic login script adds synthetic password link and fixed viewport',()=>{
    const x=loginPage('https://accounts.spotify.com/login');
    try{x.w.eval(login);const a=classicLink(x.w);assert.ok(a);assert.equal(new URL(a.href).searchParams.get('allow_password'),'1');
        assert.match(x.w.document.querySelector('meta[name="viewport"]').content,/viewport-fit=cover/);
        assert.ok(x.w.document.getElementById('sf-login-fixed-style'));
    }finally{x.close();}
});
test('classic login script retains existing query in synthetic URL',()=>{
    const x=loginPage('https://accounts.spotify.com/login?fixture=1');
    try{x.w.eval(login);const u=new URL(classicLink(x.w).href);assert.equal(u.searchParams.get('fixture'),'1');assert.equal(u.searchParams.get('allow_password'),'1');}finally{x.close();}
});
test('classic login link appends option after fragment instead of query for synthetic fragment URL',()=>{
    const x=loginPage('https://accounts.spotify.com/login#fixture');
    try{x.w.eval(login);const u=new URL(classicLink(x.w).href);assert.equal(u.searchParams.get('allow_password'),null);assert.equal(u.hash,'#fixture?allow_password=1');}finally{x.close();}
});
test('classic login script adds a second link if injected twice in unchanged fixture DOM',()=>{
    const x=loginPage('https://accounts.spotify.com/login');
    try{x.w.eval(login);x.w.eval(login);assert.equal(x.w.document.querySelectorAll('a.fuckd').length,2);assert.equal(x.w.document.querySelectorAll('#sf-login-fixed-style').length,1);}finally{x.close();}
});
test('classic login script adds no link when neither supported login selector exists',()=>{
    const x=loginPage('https://accounts.spotify.com/login','<p>Fixture</p>');
    try{x.w.eval(login);assert.equal(classicLink(x.w),null);}finally{x.close();}
});
