'use strict';
// Local, synthetic checks only; no Spotify connection or Android execution.
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const {JSDOM}=require('jsdom');
const here=__dirname;
const sourceRoot=process.env.MELODIX_SOURCE_ROOT || path.resolve(here,'../../..');
const original=fs.readFileSync(path.join(here,'css_hacks_original.css'),'utf8');
const variant=fs.readFileSync(path.join(here,'css_hacks_sans_section9.css'),'utf8');
const sha=s=>crypto.createHash('sha256').update(s).digest('hex');
test('whole CSS differs exclusively by the complete section 9',()=>{
 assert.equal(sha(original),'0d1ab6aa71f6978c5b5e1268566306d2811dfcf30c83831027293d36c38ab2f3');
 assert.equal(sha(variant),'4c700997e6e5f816abe5743f5001ac1307f50d7ed547880ef6c39427f2393405');
 const pattern=/\/\* ={10,}\s*\n   SECTION 9: MELODIX MOBILE HOME & NAVIGATION POLISH[\s\S]*?(?=\/\* ={10,}\s*\n   SECTION 10: TOUCH APP SHELL)/g;
 assert.equal([...original.matchAll(pattern)].length,1);assert.equal(original.replace(pattern,''),variant);
 assert.match(variant,/SECTION 10: TOUCH APP SHELL/);assert.doesNotMatch(variant,/--melodix-mobile-/);
 for(const css of [original,variant]){
  const d=new JSDOM('');const style=d.window.document.createElement('style');style.textContent=css;d.window.document.head.appendChild(style);
  assert.ok(style.sheet);assert.ok(style.sheet.cssRules.length>0);d.window.close();
 }
});

test('libraryV3 passes through playlist sort unchanged in a synthetic fetch',async()=>{
 const d=new JSDOM('<!doctype html><html><body></body></html>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=d.window;
 try{
  w.setInterval=()=>0;w.setTimeout=()=>0;w.MutationObserver=class{observe(){}disconnect(){}};
  const result=new Response(JSON.stringify({data:{me:{libraryV3:{items:[{fixture:1}]}}}}),{status:200,headers:{'content-type':'application/json'}});let calls=[];
  w.fetch=(url,init)=>{calls.push([url,init]);return Promise.resolve(result);};
  w.eval(fs.readFileSync(path.join(sourceRoot,'assets/playlist_sort.js'),'utf8'));
  const url='https://api-partner.spotify.com/pathfinder/v2/query';const init={method:'POST',body:JSON.stringify({operationName:'libraryV3'})};
  assert.equal(await w.fetch(url,init),result);assert.equal(calls.length,1);assert.equal(calls[0][0],url);assert.equal(calls[0][1],init);assert.equal(result.bodyUsed,false);
 }finally{w.close();}
});

for(const operationName of ['fetchPlaylist','fetchPlaylistContents'])test(operationName+' in default order returns the same synthetic response and request',async()=>{
 const d=new JSDOM('<!doctype html><html><body></body></html>',{url:'https://open.spotify.com/playlist/abc',runScripts:'outside-only'});const w=d.window;
 try{
  w.setInterval=()=>0;w.setTimeout=()=>0;w.MutationObserver=class{observe(){}disconnect(){}};
  const result=new Response(JSON.stringify({data:{playlistV2:{content:{items:[{name:'fixture'}]}}}}),{status:200,headers:{'content-type':'application/json'}});let calls=[];
  w.fetch=(url,init)=>{calls.push([url,init]);return Promise.resolve(result);};
  w.eval(fs.readFileSync(path.join(sourceRoot,'assets/playlist_sort.js'),'utf8'));
  const url='https://api-partner.spotify.com/pathfinder/v2/query';const init={method:'POST',body:JSON.stringify({operationName,variables:{uri:'spotify:playlist:abc'}})};
  assert.equal(await w.fetch(url,init),result);assert.equal(calls.length,1);assert.equal(calls[0][1],init);assert.equal(result.bodyUsed,false);
 }finally{w.close();}
});
