'use strict';
// Unit check of the on-device playlist copy inside preview-collection-retry.js (slice evaluated with a fake shell).
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path'),{JSDOM}=require('jsdom');
const src=fs.readFileSync(path.join(__dirname,'preview-collection-retry.js'),'utf8');
const a=src.indexOf('    var PREVIEW_PLAYLIST_STORE'),b=src.indexOf('    })();\n',a)+10;
function shell(){const w=new JSDOM('',{url:'https://open.spotify.com/'}).window,sent=[];
 const f=new Function('window','sent','function sendNativeUiData(s,i){sent.push([s,i]);}\n'+src.slice(a,b)+'\nreturn {send:function(s,i){return sendNativeUiData(s,i);},rows:previewStoredRows};');
 return Object.assign(f(w,sent),{w,sent});}
test('real playlist rows are stored and returned; placeholders and stale copies are not stored',()=>{
 const x=shell(),u='spotify:playlist:AbC1';
 x.send('media:'+u,[{title:'Chargement des titres…',uri:''}]);assert.equal(x.rows(u),null);
 x.send('media:'+u,[{title:'T',uri:'spotify:track:Xy1'},{title:'Info',uri:''}]);assert.deepEqual(x.rows(u).map(r=>r.uri),['spotify:track:Xy1']);
 x.send('media:'+u,[{title:'Old',uri:'spotify:track:Old'},{title:'Copie enregistrée',uri:''}]);assert.deepEqual(x.rows(u).map(r=>r.uri),['spotify:track:Xy1']);
 x.send('detail',[{title:'T',uri:'spotify:track:Zz'}]);assert.equal(x.sent.length,4);
 assert.ok(!/token|cookie|Bearer/i.test(x.w.localStorage.getItem('melodix:playlists:v1')));
});
test('store keeps at most 30 playlists, newest first',()=>{
 const x=shell();let t=0;x.w.Date.now=()=>++t;
 for(let i=0;i<35;i++)x.send('media:spotify:playlist:p'+i,[{title:'T',uri:'spotify:track:t'+i}]);
 assert.equal(x.rows('spotify:playlist:p0'),null);assert.ok(x.rows('spotify:playlist:p34'));
 assert.equal(Object.keys(JSON.parse(x.w.localStorage.getItem('melodix:playlists:v1'))).length,30);
});
