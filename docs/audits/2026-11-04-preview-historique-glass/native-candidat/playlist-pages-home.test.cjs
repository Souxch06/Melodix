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
function init(respond){const x=bootstrap(respond);x.w.eval(bridge);x.w.__sfMelodixBridgeStarted=true;x.nav=[];x.w.__sfNativeOpenUri=uri=>{x.nav.push(uri);x.w.__sfCancelPendingCollection();return true};return x}
function fire(x){for(const t of x.timers.filter(t=>t.ms===6000&&!t.cleared)){t.cleared=true;t.fn()}}
function media(x,id){return x.calls.filter(c=>c.event==='media'&&c.id===id)}


const plitem=(id)=>({itemV2:{data:{uri:'spotify:track:'+id,name:'Song '+id,artists:{items:[{profile:{name:'Artist'}}]}}}});
const plpage=(items,total)=>({ok:true,json:async()=>({data:{playlistV2:{content:{items,...(total===undefined?{}:{totalCount:total})}}}})});
const pageItems=(start,count)=>Array.from({length:count},(_,i)=>plitem(String(start+i)));
const rowsof=(x,id)=>media(x,id).map(e=>e.rows);
test('loads all advertised pages progressively in original order and caches only the complete result',async()=>{let x=init(({body})=>plpage(pageItems(body.variables.offset,Math.min(80,195-body.variables.offset)),195));try{const id='spotify:playlist:all';x.w.__sfOpenCollection(id);await wait();const rows=rowsof(x,id);assert.deepEqual(x.requests.map(r=>r.body.variables.offset),[0,80,160]);assert.equal(rows[0].length,80);assert.equal(rows.at(-1).length,195);assert.equal(rows.at(-1)[194].id,'spotify:track:194');assert.equal(x.w.__sfCurrentTrackUris.length,195);assert.equal(x.w.__sfCompleteNativePlaylistTokens.get(id),x.w.spotAuthToken);x.calls.length=0;x.w.__sfOpenCollection(id);assert.equal(media(x,id)[0].rows.length,195);assert.equal(x.requests.length,3);fire(x);assert.equal(x.nav.length,0)}finally{x.close()}});
test('does not cache partial pages and indicates a later network failure without inventing a media item',async()=>{const x=init(({body})=>body.variables.offset===0?plpage(pageItems(0,80),160):{ok:false});try{const id='spotify:playlist:broken';x.w.__sfOpenCollection(id);await wait();assert.equal(media(x,id).at(-1).rows.length,80);assert.equal(x.w.__sfMediaItemsCache.has(id),false);const notice=x.calls.filter(c=>c.event==='native'&&c.id==='media:'+id).at(-1);assert.ok(notice);assert.equal(notice.rows.length,81);assert.equal(notice.rows.at(-1).settingValue,'Info');assert.equal(notice.rows.at(-1).uri,'');assert.equal(x.w.__sfCurrentTrackUris.length,80)}finally{x.close()}});
test('server-sized pages use total and raw offset even with a short intermediate page',async()=>{const x=init(({body})=>plpage(pageItems(body.variables.offset,Math.min(35,90-body.variables.offset)),90));try{const id='spotify:playlist:short';x.w.__sfOpenCollection(id);await wait();assert.deepEqual(x.requests.map(r=>r.body.variables.offset),[0,35,70]);assert.equal(media(x,id).at(-1).rows.length,90)}finally{x.close()}});
test('repeated tracks on different advertised pages are kept rather than deduplicated',async()=>{const same=pageItems(0,80),x=init(()=>plpage(same,160));try{const id='spotify:playlist:repeated';x.w.__sfOpenCollection(id);await wait();const rows=media(x,id).at(-1).rows;assert.equal(rows.length,160);assert.equal(rows[0].id,rows[80].id)}finally{x.close()}});
test('replayed page without a total stops safely and marks the result partial',async()=>{const same=pageItems(0,80),x=init(()=>plpage(same));try{const id='spotify:playlist:replayed';x.w.__sfOpenCollection(id);await wait();assert.equal(x.requests.length,2);assert.equal(media(x,id).at(-1).rows.length,80);assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:'+id&&c.rows.at(-1).settingValue==='Info'));assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('late second page after back navigation neither renders nor caches',async()=>{const d=deferred(),x=init(({body})=>body.variables.offset===0?plpage(pageItems(0,80),160):d.promise);try{const id='spotify:playlist:stale';x.w.__sfOpenCollection(id);await wait();assert.equal(media(x,id).length,1);x.w.__sfCancelPendingCollection();d.resolve(plpage(pageItems(80,80),160));await wait();assert.equal(media(x,id).length,1);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('token change mid-pagination drops the old account response',async()=>{const d=deferred(),x=init(({body})=>body.variables.offset===0?plpage(pageItems(0,80),160):d.promise);try{const id='spotify:playlist:account';x.w.__sfOpenCollection(id);await wait();x.w.spotAuthToken='Bearer other';d.resolve(plpage(pageItems(80,80),160));await wait();assert.equal(media(x,id).length,1);assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('unverified legacy cache is not treated as a complete native playlist',async()=>{const x=init(()=>plpage(pageItems(0,2),2));try{const id='spotify:playlist:legacy';x.w.__sfMediaItemsCache.set(id,[{id:'spotify:track:old',name:'old'}]);x.w.__sfOpenCollection(id);await wait();assert.equal(x.requests.length,1);assert.equal(media(x,id).at(-1).rows.length,2)}finally{x.close()}});
test('unsupported elements are not fabricated and partial state is explicit',async()=>{const x=init(()=>plpage([plitem('real'),{itemV2:{data:{name:'unavailable'}}}],2));try{const id='spotify:playlist:missing';x.w.__sfOpenCollection(id);await wait();assert.equal(media(x,id).at(-1).rows.length,1);assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:'+id&&c.rows.at(-1).settingValue==='Info'));assert.equal(x.w.__sfMediaItemsCache.has(id),false)}finally{x.close()}});
test('personal Home rows carry explicit provenance and come before real Spotify Home rows',()=>{const x=bootstrap();try{x.w.history.replaceState({},'', '/');x.w.document.querySelector('#main-view').innerHTML='<section><h2>Mixes réels</h2><a href="/playlist/public"><img src="https://i.scdn.co/image/public" alt="Public"><span>Public</span></a></section>';x.w.__sfNativeUiRefresh();x.w.mediaLib={playlists:[{id:'spotify:playlist:mine',name:'Mine'}]};x.calls.length=0;x.w.__sfNativeUiRefresh();const rows=x.calls.filter(c=>c.event==='native'&&c.id==='home').at(-1).rows;assert.deepEqual(rows.map(r=>r.homeOrigin),['library','spotify']);assert.deepEqual(rows.map(r=>r.uri),['spotify:playlist:mine','spotify:playlist:public']);assert.equal(rows[0].section,'Vos playlists');assert.equal(rows[1].section,'Mixes réels')}finally{x.close()}});
test('when only a Spotify DOM preview is available it is clearly marked as potentially incomplete',()=>{const x=bootstrap();try{x.w.history.replaceState({},'', '/playlist/demo');x.w.document.querySelector('#main-view').innerHTML='<div data-testid="tracklist-row"><a href="/track/a">Actual song</a></div>';x.calls.length=0;x.w.__sfNativeUiRefresh();const rows=x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows;assert.equal(rows[0].uri,'spotify:track:a');assert.equal(rows.at(-1).settingValue,'Info');assert.match(rows.at(-1).subtitle,/incomplète/)}finally{x.close()}});
test('offset metadata identifying an ignored offset stops the copy instead of adding fake duplicates',async()=>{const x=init(({body})=>({ok:true,json:async()=>({data:{playlistV2:{content:{offset:0,totalCount:160,items:pageItems(0,80)}}}})}));try{const id='spotify:playlist:offset';x.w.__sfOpenCollection(id);await wait();assert.equal(x.requests.length,2);assert.equal(media(x,id).at(-1).rows.length,80);assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:'+id&&c.rows.at(-1).settingValue==='Info'))}finally{x.close()}});
test('first page shows loading state while the next page is pending, then removes it on completion',async()=>{const d=deferred(),x=init(({body})=>body.variables.offset===0?plpage(pageItems(0,80),100):d.promise);try{const id='spotify:playlist:pending';x.w.__sfOpenCollection(id);await wait();const pending=x.calls.filter(c=>c.event==='native'&&c.id==='media:'+id).at(-1);assert.equal(pending.rows.at(-1).title,'Chargement de la playlist');d.resolve(plpage(pageItems(80,20),100));await wait();assert.equal(media(x,id).at(-1).rows.length,100);assert.equal(x.w.__sfMediaItemsCache.get(id).length,100)}finally{x.close()}});
test('DOM fallback does not artificially truncate more than 100 visible track rows',()=>{const x=bootstrap();try{x.w.history.replaceState({},'', '/playlist/demo');x.w.document.querySelector('#main-view').innerHTML=Array.from({length:120},(_,i)=>`<div data-testid="tracklist-row"><a href="/track/${i}">Song ${i}</a></div>`).join('');x.calls.length=0;x.w.__sfNativeUiRefresh();const rows=x.calls.filter(c=>c.event==='native'&&c.id==='detail').at(-1).rows;assert.equal(rows.filter(r=>r.uri).length,120);assert.equal(rows.at(-1).settingValue,'Info')}finally{x.close()}});
test('missing total does not truncate a server that returns short pages',async()=>{const x=init(({body})=>plpage(pageItems(body.variables.offset,Math.max(0,Math.min(35,75-body.variables.offset)))));try{const id='spotify:playlist:unknown-total';x.w.__sfOpenCollection(id);await wait();assert.deepEqual(x.requests.map(r=>r.body.variables.offset),[0,35,70,75]);assert.equal(media(x,id).at(-1).rows.length,75);assert.equal(x.w.__sfMediaItemsCache.get(id).length,75)}finally{x.close()}});
test('identical playlist entry UIDs on the next advertised page stop a replay, not duplicate tracks',async()=>{const same=pageItems(0,80).map((x,i)=>({...x,uid:'uid-'+i}));const x=init(()=>plpage(same,160));try{const id='spotify:playlist:uids';x.w.__sfOpenCollection(id);await wait();assert.equal(x.requests.length,2);assert.equal(media(x,id).at(-1).rows.length,80);assert.ok(x.calls.some(c=>c.event==='native'&&c.id==='media:'+id&&c.rows.at(-1).title==='Playlist partiellement chargée'))}finally{x.close()}});
