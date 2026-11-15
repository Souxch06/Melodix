'use strict';
// Real historical scripts in JSDOM; fake native interface, timer queue and
// fake network only. There is no Android WebView or live Spotify request.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root) throw new Error('MELODIX_CANDIDATE_ROOT is required');
const asset=name=>fs.readFileSync(path.join(root,'assets',name),'utf8');
const bridge=asset('spotify_bridge.js'),shell=asset('native_ui_shell.js'),login=asset('classic_login.js');
function bootstrap(respond=null){
    const dom=new JSDOM('<!doctype html><html><head></head><body><main id="main-view"><a href="/playlist/fake1">Fictive</a></main></body></html>',{
        url:'https://open.spotify.com/search',runScripts:'outside-only',virtualConsole:new VirtualConsole()
    });
    const w=dom.window,calls=[],requests=[],timers=[];
    w.fetch=async(url,init)=>{
        const body=init?.body ? JSON.parse(init.body) : null;
        requests.push({url:String(url),body});
        if(respond) return respond({url:String(url),body,signal:init?.signal});
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
        onSearchCompleted:(query,json)=>calls.push({event:'search',query,rows:JSON.parse(json)}),
        onNativeUiData:(id,json)=>{let rows;try{rows=JSON.parse(json)}catch(_){rows=json}calls.push({event:'native',id,rows})},
        onNativeHomeRows:json=>calls.push({event:'home',rows:JSON.parse(json)}),
        onNativeUiReady(){},onNativeUiRoute(){}};
    w.AndBridge=new Proxy(callbacks,{get:(target,key)=>key in target?target[key]:()=>{}});
    w.setTimeout=(fn,ms)=>{timers.push({kind:'timeout',ms,fn});return timers.length;};
    w.setInterval=(fn,ms)=>{timers.push({kind:'interval',ms,fn});return timers.length;};
    w.clearInterval=w.clearTimeout=id=>{if(timers[id-1])timers[id-1].cleared=true;};
    w.MutationObserver=class{observe(){}disconnect(){}};
    w.eval(shell);
    return {w,dom,calls,requests,timers,close:()=>dom.window.close()};
}

const flush=async()=>{for(let i=0;i<20;i++)await Promise.resolve()};
const item=name=>({item:{data:{__typename:'Playlist',uri:'spotify:playlist:'+name,name}}});
const good=name=>({ok:true,json:async()=>({data:{me:{libraryV3:{items:[item(name)]}}}})});
function deferred(){let resolve;const promise=new Promise(r=>resolve=r);return {resolve,promise}}
const operation=(op,hash)=>({method:'POST',body:JSON.stringify({operationName:op,extensions:{persistedQuery:{sha256Hash:hash}}})});
// Synthetic web environment and network only; no Android runtime.
const wait=async()=>{for(let i=0;i<40;i++)await Promise.resolve()};
function response(track){return {ok:true,json:async()=>({data:{playlistV2:{content:{items:track?[{itemV2:{data:{uri:'spotify:track:'+track,name:track,artists:{items:[]}}}}]:[]}}}})}}
function init(respond){const x=bootstrap(req=>req.body?.operationName==='fetchPlaylist' && req.body?.variables?.offset>0 ? response(null) : respond?.(req));x.w.eval(bridge);x.w.__sfMelodixBridgeStarted=true;x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);x.w.__sfCancelPendingCollection();return true};return x}
function fire(x){for(const t of x.timers.filter(t=>t.ms===6000&&!t.cleared)){t.cleared=true;t.fn()}}
function media(x,id){return x.calls.filter(c=>c.event==='media'&&c.id===id)}

function page(x,html){x.w.history.replaceState({},'', '/playlist/demo');x.w.document.querySelector('#main-view').innerHTML=html;x.calls.length=0;x.w.__sfNativeUiRefresh()}
function detail(x){return (x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1)?.rows||[]).filter(r=>r.settingValue!=='Info')}
const trackrow=(id,title,artist)=>`<div data-testid="tracklist-row" role="row" aria-rowindex="2"><a href="/track/${id}"><img src="https://i.scdn.co/image/${id}" alt="cover"></a><a data-testid="internal-track-link" href="/track/${id}">${title}</a><span aria-label="Explicit">E</span><a href="/artist/${artist}">${artist}</a><a href="/album/album${id}">Album</a></div>`;
test('one physical row creates one track despite cover, artist, album, and explicit badge links',()=>{const x=bootstrap();try{page(x,`<h1>Real playlist</h1>${trackrow('first','First song','Artist One')}${trackrow('second','Second song','Artist Two')}`);const rows=detail(x);assert.equal(rows.length,2);assert.deepEqual(rows.map(r=>r.uri),['spotify:track:first','spotify:track:second']);assert.deepEqual(rows.map(r=>r.subtitle),['Artist One','Artist Two']);assert.deepEqual(rows.map(r=>r.title),['First song','Second song']);assert.ok(rows.every(r=>!r.section))}finally{x.close()}});
test('actual repeated playlist entries in separate rows are retained',()=>{const x=bootstrap();try{page(x,trackrow('same','Track','Artist')+trackrow('same','Track','Artist'));const rows=detail(x);assert.equal(rows.length,2);assert.equal(rows[0].uri,rows[1].uri)}finally{x.close()}});
test('without known track rows only track links are emitted once, never album or artist',()=>{const x=bootstrap();try{page(x,'<a href="/track/a">A</a><a href="/track/a">A duplicate link</a><a href="/artist/artist">Artist</a><a href="/album/album">Album</a><a href="/track/b">B</a>');const rows=detail(x);assert.deepEqual(rows.map(r=>r.uri),['spotify:track:a','spotify:track:b'])}finally{x.close()}});
test('structured non-track rows are not fabricated into tracks',()=>{const x=bootstrap();try{page(x,'<div data-testid="tracklist-row"><a href="/artist/one">Artist</a><a href="/album/a">Album</a></div>');assert.equal(detail(x).length,0)}finally{x.close()}});
test('bridge result is authoritative over later same-route DOM updates',async()=>{const x=init(()=>response('authoritative'));try{x.w.history.replaceState({},'', '/playlist/demo');x.w.__sfOpenCollection('spotify:playlist:demo');await wait();assert.equal(media(x,'spotify:playlist:demo').length,1);page(x,trackrow('partial','Partial','Artist'));assert.equal(detail(x).length,0)}finally{x.close()}});
test('DOM result stops fallback but retains pending request; nonempty bridge can upgrade it',async()=>{const d=deferred(),x=init(()=>d.promise);try{x.w.history.replaceState({},'', '/playlist/demo');x.w.__sfOpenCollection('spotify:playlist:demo');await wait();page(x,trackrow('partial','Partial','Artist'));assert.equal(detail(x).length,1);fire(x);assert.equal(x.nav.length,0);d.resolve(response('full'));await wait();assert.equal(media(x,'spotify:playlist:demo').length,1);page(x,trackrow('partial2','Old','Artist'));assert.equal(detail(x).length,0)}finally{x.close()}});
test('empty or failed bridge cannot erase already rendered DOM detail',async()=>{for(const fail of [false,true]){const d=deferred(),x=init(()=>d.promise);try{x.w.history.replaceState({},'', '/playlist/demo');x.w.__sfOpenCollection('spotify:playlist:demo');await wait();page(x,trackrow('partial','Partial','Artist'));assert.equal(detail(x).length,1);d.resolve(fail?{ok:false,statusText:'fixture'}:response(null));await wait();assert.equal(media(x,'spotify:playlist:demo').length,0);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}}});
test('fallback prefers a real title link over an earlier image-only link',()=>{const x=bootstrap();try{page(x,'<a href="/track/a"><img alt="cover" src="https://i.scdn.co/image/a"></a><a href="/track/a">Actual title</a>');const rows=detail(x);assert.equal(rows.length,1);assert.equal(rows[0].title,'Actual title')}finally{x.close()}});
test('artist detail retains browsable album links on the legacy discovery path',()=>{const x=bootstrap();try{x.w.history.replaceState({},'', '/artist/demo');x.w.document.querySelector('#main-view').innerHTML='<a href="/album/example">Real album</a>';x.calls.length=0;x.w.__sfNativeUiRefresh();assert.ok(detail(x).some(r=>r.uri==='spotify:album:example'))}finally{x.close()}});
