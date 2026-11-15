'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path'),vm=require('node:vm');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const bridge=fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8'),shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
function block(a,b){let i=bridge.indexOf(a),j=bridge.indexOf(b,i);assert.ok(i>=0&&j>i);return bridge.slice(i,j)}
function deferred(){let resolve;const promise=new Promise(r=>resolve=r);return {resolve,promise}}
const item=i=>({item:{data:{__typename:'Playlist',uri:`spotify:playlist:fake${i}`,name:`Playlist ${i}`}}});
const response=rows=>({ok:true,json:async()=>({data:{me:{libraryV3:{items:rows}}}})});
function fixture(fetch){const calls=[],offsets=[],updates=[];const w={spotAuthToken:'Bearer tokenA',spotCliToken:null,__sfNativeLibraryUpdated(){updates.push(true)}};
 const ctx=vm.createContext({window:w,AndBridge:{onMediaItemsLoaded:(id,data)=>calls.push({id,rows:JSON.parse(data)})},console:{log(){},warn(){},error(){}},ensureAuthToken:async()=>Boolean(w.spotAuthToken),getGqlHash:(n,h)=>h,oriFetch:async(url,init)=>{const body=JSON.parse(init.body);offsets.push(body.variables.offset);return fetch(body.variables.offset,init.headers.Authorization)}});
 vm.runInContext(block('    window.pendingMediaRequests = ','    // =========================================================================\n    // SECTION 5:'),ctx);
 vm.runInContext(block('    window.__sfMediaItemsCache = ','    window.fetchMediaItems = fetchMediaItems;')+'\nwindow.fetchMediaItems = fetchMediaItems;',ctx);
 return {w,calls,offsets,updates};}
const flush=async()=>{for(let i=0;i<12;i++)await Promise.resolve()};
test('first page reaches Home and library before a blocked second page; subsequent page completes list',async()=>{
 const later=deferred();const b=fixture(offset=>offset===0?response(Array.from({length:50},(_,i)=>item(i))):later.promise);
 const done=b.w.fetchMediaItems('playlists');await flush();
 assert.deepEqual(b.offsets,[0,50]);assert.equal(b.w.mediaLib.playlists.length,50);assert.equal(b.calls.at(-1).rows.length,50);assert.equal(b.updates.length,1);
 later.resolve(response([item(50),item(51)]));await done;assert.equal(b.calls.at(-1).rows.length,52);assert.equal(b.w.mediaLib.playlists.length,52);assert.equal(b.updates.length,2);
});
test('simultaneous requests share the same fetch and both categories receive completion',async()=>{
 const later=deferred();const b=fixture(()=>later.promise);const a=b.w.fetchMediaItems('playlists'),c=b.w.fetchMediaItems('albums');await flush();assert.deepEqual(b.offsets,[0]);later.resolve(response([item(1)]));await Promise.all([a,c]);assert.deepEqual(b.calls.map(x=>x.id).sort(),['albums','playlists']);
});
test('token changes prevent stale in-flight pages from publishing',async()=>{
 const old=deferred(),b=fixture((offset,token)=>token==='Bearer tokenA'?old.promise:response([item(99)]));
 const a=b.w.fetchMediaItems('playlists');await flush();b.w.spotAuthToken='Bearer tokenB';const fresh=b.w.checkMediaLib();await fresh;old.resolve(response([item(1)]));await a;
 assert.equal(b.w.mediaLib.playlists[0].id,'spotify:playlist:fake99');assert.ok(!b.calls.some(x=>x.rows.some(r=>r.id==='spotify:playlist:fake1')));
});
test('HTTP failure does not fabricate or publish empty data over fallback',async()=>{
 const b=fixture(()=>({ok:false,status:401,statusText:'refused'}));await b.w.fetchMediaItems('playlists');assert.equal(b.calls.length,0);assert.equal(b.w.mediaLib,undefined);
});
test('later-page refusal retains already-published real first page',async()=>{
 const b=fixture(offset=>offset===0?response(Array.from({length:50},(_,i)=>item(i))):({ok:false,status:429,statusText:'refused'}));await b.w.fetchMediaItems('playlists');assert.equal(b.w.mediaLib.playlists.length,50);assert.equal(b.calls.at(-1).rows.length,50);
});
test('late category subscription receives existing page and later updates',async()=>{
 const later=deferred(),b=fixture(offset=>offset===0?response(Array.from({length:50},(_,i)=>item(i))):later.promise);const first=b.w.checkMediaLib();await flush();const second=b.w.fetchMediaItems('playlists');await flush();assert.equal(b.calls.at(-1).rows.length,50);later.resolve(response([item(50)]));await Promise.all([first,second]);assert.equal(b.calls.at(-1).rows.length,51);
});
function boot(route,html,extra={}){const dom=new JSDOM(`<!doctype html><body>${html}</body>`,{url:'https://open.spotify.com'+route});dom.window.document.addEventListener=()=>{};let calls=[],nav=[],timers=[];const w={location:{hostname:'open.spotify.com',pathname:route,href:'https://open.spotify.com'+route,assign:x=>nav.push(x)},AndBridge:{onNativeUiData:(screen,s)=>calls.push({screen,data:s}),onNativeUiReady(){},onNativeUiRoute(){}},addEventListener(){},setTimeout(fn,ms){timers.push({fn,ms});return timers.length},clearTimeout(){},MutationObserver:class{observe(){}},...extra};vm.runInNewContext(shell,{window:w,document:dom.window.document,URL,console,Promise});return{w,calls,nav,timers,close:()=>dom.window.close()};}
function rows(b,id){return JSON.parse(b.calls.filter(c=>c.screen===id).at(-1)?.data||'[]')}
test('Library tab uses real visible sidebar playlists even if the page is Liked Songs',()=>{
 const b=boot('/collection/tracks','<main id="main-view"><a href="/track/t">Liked song</a></main><nav id="Desktop_LeftSidebar_Id"><a href="/playlist/p1">Playlist A</a><a href="/track/t">Song</a><a href="/playlist/p1">Duplicate</a><a href="/album/a">Album</a></nav>');
 try{b.w.__sfOpenLibrary();assert.deepEqual(rows(b,'media:playlists').map(r=>r.uri),['spotify:playlist:p1']);assert.equal(b.nav.length,0)}finally{b.close()}
});
test('filter is applied before 32-row limit',()=>{
 const tracks=Array.from({length:40},(_,i)=>`<a href="/track/t${i}">Song ${i}</a>`).join('');const b=boot('/','<main id="main-view"></main><nav id="Desktop_LeftSidebar_Id">'+tracks+'<a href="/playlist/p">Playlist</a></nav>');
 try{b.w.__sfOpenLibrary();assert.equal(rows(b,'media:playlists')[0].uri,'spotify:playlist:p')}finally{b.close()}
});
test('an empty sidebar never scrapes unrelated main view',()=>{
 const b=boot('/','<main id="main-view"><a href="/playlist/recommendation">Recommended</a></main><nav id="Desktop_LeftSidebar_Id"></nav>');
 try{b.w.__sfOpenLibrary();assert.deepEqual(rows(b,'media:playlists'),[]);assert.equal(b.nav.length,1)}finally{b.close()}
});
test('partial bridge results are not overwritten by a later DOM scrape',()=>{
 const b=boot('/collection/playlists','<main id="main-view"><a href="/playlist/dom">Old DOM</a></main>',{__sfNativeMediaHasLibraryData:true});
 try{assert.deepEqual(rows(b,'media:playlists'),[])}finally{b.close()}
});
test('HTTP 200 GraphQL errors do not replace sidebar with an empty library',async()=>{
 const b=fixture(()=>({ok:true,json:async()=>({errors:[{message:'fake'}]})}));await b.w.fetchMediaItems('playlists');assert.equal(b.calls.length,0);assert.equal(b.w.mediaLib,undefined);
});
test('a changed token invalidates the published snapshot before new response',async()=>{
 const later=deferred(),b=fixture((offset,token)=>token==='Bearer tokenA'?response([item(1)]):later.promise);await b.w.fetchMediaItems('playlists');assert.equal(b.w.mediaLib.playlists.length,1);
 b.w.spotAuthToken='Bearer tokenB';const update=b.w.checkMediaLib();assert.equal(b.w.mediaLib,null);assert.equal(b.w.__sfNativeMediaHasLibraryData,false);later.resolve(response([item(2)]));await update;assert.equal(b.w.mediaLib.playlists[0].id,'spotify:playlist:fake2');
});
test('first-page notification schedules real Home shell rendering',()=>{
 const b=boot('/','<main id="main-view"></main>');
 try{for(const t of b.timers.filter(t=>t.ms===120))t.fn();b.timers.length=0;b.w.mediaLib={playlists:[{name:'Saved',id:'spotify:playlist:p1'}]};b.w.__sfNativeLibraryUpdated();const update=b.timers.find(t=>t.ms===120);assert.ok(update);update.fn();assert.ok(rows(b,'home').some(r=>r.uri==='spotify:playlist:p1'))}finally{b.close()}
});
test('notifications for background Home do not schedule a Home update',()=>{
 const b=boot('/collection/tracks','<main id="main-view"></main>');
 try{for(const t of b.timers.filter(t=>t.ms===120))t.fn();b.timers.length=0;b.w.__sfNativeLibraryUpdated();assert.ok(!b.timers.some(t=>t.ms===120))}finally{b.close()}
});
