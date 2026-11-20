'use strict';
// Simulated fetch: checks paging past the bridge's 100-track page. Not a Spotify benchmark.
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const src=fs.readFileSync(path.join(__dirname,'preview-playlist-paging.js'),'utf8');
function setup(total){
 const calls=[],sent=[],timers=[];
 const w={spotAuthToken:'Bearer T',__sfNativeCollectionUri:'spotify:playlist:P1',AbortController:undefined,
  AndBridge:{onMediaItemsLoaded:(u,j)=>sent.push([u,JSON.parse(j)])},
  setTimeout:(f)=>{timers.push(f);return timers.length},clearTimeout(){},
  fetch:(u,o)=>{const v=JSON.parse(o.body).variables;calls.push(v);const n=Math.max(0,Math.min(v.limit,total-v.offset));
   return Promise.resolve({ok:true,json:async()=>({data:{playlistV2:{content:{totalCount:total,items:Array.from({length:n},(_,i)=>({itemV2:{data:{uri:'spotify:track:t'+(v.offset+i),name:'N'+(v.offset+i),artists:{items:[{profile:{name:'A'}}]},trackDuration:{totalMilliseconds:204000+(v.offset+i)}}}}))}}}})});}};
 const api=new Function('window',src+'\nreturn previewPlaylistPages;')(w);
 return {w,calls,sent,timers,api};
}
const settle=()=>new Promise(r=>setTimeout(r,20));
test('237-track playlist: three pages, full list delivered to the bridge callback',async()=>{
 const x=setup(237);x.api('spotify:playlist:P1');x.timers.shift()();for(let i=0;i<10;i++)await settle();
 assert.deepEqual(x.calls.map(c=>c.offset),[0,100,200]);
 assert.equal(x.sent.length,2);x.timers.slice(-4).forEach(f=>f());assert.equal(x.sent.length,6);for(let k=0;k<5;k++)x.timers.at(-1)();assert.equal(x.sent.length,11,'keeps resending while open (1022308)');x.w.__sfNativeCollectionUri='spotify:playlist:Other';x.timers.at(-1)();assert.equal(x.sent.length,11,'stops after leaving');const last=x.sent.at(-1);assert.equal(last[0],'spotify:playlist:P1');assert.equal(last[1].length,237);assert.equal(last[1][236].id,'spotify:track:t236');assert.deepEqual(last[1][0].artists,['A • 3:24'],'row length like Spotify');
});
test('playlist of 100 or fewer: one page, full list delivered (the bridge can stop short, phone 1022271: 26 shown)',async()=>{
 const x=setup(60);x.api('spotify:playlist:P1');x.timers.shift()();for(let i=0;i<5;i++)await settle();
 assert.equal(x.calls.length,1);assert.equal(x.sent.length,1);assert.equal(x.sent[0][1].length,60);
});
test('empty or failed page: nothing delivered',async()=>{
 const x=setup(0);x.api('spotify:playlist:P1');x.timers.shift()();for(let i=0;i<5;i++)await settle();
 assert.equal(x.sent.length,0);
});
test('leaving the playlist stops paging',async()=>{
 const x=setup(500);x.api('spotify:playlist:P1');x.w.__sfNativeCollectionUri=null;x.timers.shift()();for(let i=0;i<5;i++)await settle();
 assert.equal(x.calls.length,0);assert.equal(x.sent.length,0);
});
