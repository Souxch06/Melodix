'use strict';
// Home cards: the first usable Spotify image wins, not the first non-empty attribute.
const {test}=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'), path=require('node:path'), {JSDOM}=require('jsdom');
const src=fs.readFileSync(path.join(__dirname,'..','..','..','..','assets','melodix_home.js'),'utf8');
const fn=(name)=>{const i=src.indexOf('function '+name+'(');assert.ok(i>=0,name);let d=0,j=src.indexOf('{',i);for(;j<src.length;j++){if(src[j]==='{')d++;else if(src[j]==='}'&&--d===0)break;}return src.slice(i,j+1);};
const pick=(html)=>{const d=new JSDOM('<!doctype html><body>'+html+'</body>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const card=d.window.document.body;const img=card.querySelector('img');
  d.window.eval(fn('safeMelodixHomeImage')+';'+fn('melodixHomeImage')+';globalThis.r=melodixHomeImage;');return d.window.r(card,img);};
const good='https://i.scdn.co/image/ab67616d0000b273abc';
test('a data: placeholder in src does not hide the real data-src',()=>{
  assert.equal(pick(`<img src="data:image/gif;base64,R0lGOD" data-src="${good}">`),good);
});
test('an invalid or foreign src falls through to a valid srcset candidate',()=>{
  assert.equal(pick(`<img src="http://evil.example/x.jpg" srcset="${good} 300w, https://other.example/y.jpg 600w">`),good);
});
test('a valid currentSrc still wins first',()=>{
  const d=new JSDOM('<!doctype html><body><img src="data:image/gif;base64,AA"></body>',{url:'https://open.spotify.com/',runScripts:'outside-only'});
  const img=d.window.document.querySelector('img');Object.defineProperty(img,'currentSrc',{value:good});
  d.window.eval(fn('safeMelodixHomeImage')+';'+fn('melodixHomeImage')+';globalThis.r=melodixHomeImage;');
  assert.equal(d.window.r(d.window.document.body,img),good);
});
test('nothing usable returns an empty string',()=>{
  assert.equal(pick('<img src="data:image/gif;base64,AA">'),'');
});

// Late images: Spotify often sets src/srcset on an existing <img>. Those are attribute changes, not new nodes,
// so the home observer must watch them (debounced by scheduleMelodixHomeUpdate, so it does not re-render per change).
test('the home observer also watches late src and srcset changes',()=>{
  const seen={};
  const d=new JSDOM('<!doctype html><body></body>',{url:'https://open.spotify.com/',runScripts:'outside-only'});
  d.window.MutationObserver=function(cb){this.observe=(node,opts)=>{seen.opts=opts;seen.node=node;};};
  d.window.setTimeout=()=>0;
  d.window.eval('var window=globalThis;');
  d.window.eval(fn('scheduleMelodixHomeUpdate')+';'+fn('observeMelodixHomeDom')+';globalThis.run=observeMelodixHomeDom;');
  d.window.run();
  assert.equal(seen.opts.attributes,true);
  assert.deepEqual([...seen.opts.attributeFilter].sort(),['data-src','src','srcset']);
});
