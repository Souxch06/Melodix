'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {JSDOM}=require('jsdom');
const source=fs.readFileSync(path.join(__dirname,'../scripts/native_ui_shell.source.js'),'utf8');
const bridge=fs.readFileSync(path.join(__dirname,'../scripts/spotify_bridge.source.js'),'utf8');
const helper=bridge.slice(bridge.indexOf('    // >>> sf-liked-visible-rows'),bridge.indexOf('    // <<< sf-liked-visible-rows'));
function fixture(url,proven=true,content=null,installHelper=true){
  const dom=new JSDOM('<!doctype html><html><body><main id="main-view"><h1>Titres likés</h1><div data-testid="tracklist-row"><a href="/track/abc123">Exemple réel de test</a><a href="/artist/def456">Artiste de test</a></div></main></body></html>',{url,runScripts:'outside-only'});
  const w=dom.window,calls=[],routes=[];
  if(content!==null)w.document.querySelector("main").innerHTML=content;
  w.__sfMediaLibSessionProofKnown=true;w.__sfMediaLibSessionProven=proven;
  w.AndBridge={onNativeUiData:(type,value)=>calls.push({type,value}),onNativeUiRoute:route=>routes.push(route),onNativeUiReady:()=>{}};
  w.setTimeout=()=>1;w.clearTimeout=()=>{};w.setInterval=()=>1;w.clearInterval=()=>{};
  w.MutationObserver=class{observe(){} disconnect(){}};
  if(installHelper)w.eval(helper);w.eval(source);return {w,calls,routes,close:()=>dom.window.close()};
}
test('the liked tracks page is sent to the detail screen, not the playlist category',()=>{
  const f=fixture('https://open.spotify.com/intl-fr/collection/tracks');
  assert.ok(f.routes.includes('detail'));const detail=f.calls.find(c=>c.type==='media:spotify:collection:tracks');
  assert.ok(detail,'real track rows reach detail');
  const rows=JSON.parse(detail.value);assert.ok(rows.some(x=>x.uri==='spotify:track:abc123'));
  assert.ok(!f.calls.some(c=>c.type==='media:playlists'));
  f.close();
});
test('an unproven session never publishes liked rows',()=>{
  const f=fixture('https://open.spotify.com/collection/tracks',false);
  assert.ok(!f.calls.some(c=>c.type==='media:spotify:collection:tracks'||c.type==='media:playlists'));f.close();
});
test('native media callbacks are protected by the expected collection id',()=>{
  const smali=fs.readFileSync(path.join(__dirname,'../smali/com/melodix/music/MainActivity.smali'),'utf8');
  const block=smali.slice(smali.indexOf('    :check_media'),smali.indexOf('    :check_settings'));
  assert.match(block,/nativeExpectedId:Ljava\/lang\/String;[\s\S]*?equals\(Ljava\/lang\/Object;\)Z[\s\S]*?if-eqz v4, :apply_done/);
});
test('the playlists category remains a library route',()=>{
  const f=fixture('https://open.spotify.com/collection/playlists');assert.ok(f.routes.includes('library'));f.close();
});

test('liked rows ignore artist and album links, preserve order, and suppress duplicate track rows',()=>{
  const row=(id,n)=>`<div data-testid="tracklist-row"><a href="/track/${id}">${n}</a><a href="/artist/artist1">The Artist</a><a href="/album/album1">The Album</a><img src="https://i.scdn.co/image/example"></div>`;
  const content=Array.from({length:40},(_,i)=>row('id'+i,'Title '+i)).join('')+row('id0','Title 0');
  const f=fixture('https://open.spotify.com/collection/tracks',true,content);
  const detail=f.calls.find(c=>c.type==='media:spotify:collection:tracks');assert.ok(detail);const rows=JSON.parse(detail.value);
  assert.equal(rows.length,40);assert.deepEqual(rows.map(r=>r.uri),Array.from({length:40},(_,i)=>'spotify:track:id'+i));
  assert.equal(rows[0].title,'Title 0');assert.equal(rows[0].subtitle,'The Artist');assert.equal(rows[0].image,'https://i.scdn.co/image/example');f.close();
});

test('a real liked-tracks link in the library is mapped to the canonical collection URI',()=>{
  const f=fixture('https://open.spotify.com/collection/playlists',true,'<div data-testid="card"><a href="/intl-fr/collection/tracks">Titres likés</a></div>');
  const data=f.calls.find(c=>c.type==='media:playlists');assert.ok(data);
  assert.ok(JSON.parse(data.value).some(x=>x.uri==='spotify:collection:tracks'));
  f.close();
});

test('late bridge enables a refresh, while the missing bridge never invents rows',()=>{
  const f=fixture('https://open.spotify.com/collection/tracks',true,null,false);
  assert.ok(!f.calls.some(c=>c.type==='media:spotify:collection:tracks'));
  f.w.eval(helper);f.w.__sfNativeUiRefresh();
  assert.ok(f.calls.some(c=>c.type==='media:spotify:collection:tracks'));f.close();
});
test('untrusted track URLs and artwork are not mapped to liked items',()=>{
  const html='<div data-testid="tracklist-row"><a href="https://evil.example/track/123">Fake</a></div>'+
    '<div data-testid="tracklist-row"><a href="/track/abc123">Real</a><img src="https://evil.example/image.png"></div>';
  const f=fixture('https://open.spotify.com/collection/tracks',true,html);
  const rows=JSON.parse(f.calls.find(c=>c.type==='media:spotify:collection:tracks').value);
  assert.equal(rows.length,1);assert.equal(rows[0].uri,'spotify:track:abc123');assert.equal(rows[0].image,'');f.close();
});
