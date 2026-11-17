'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('fs'),path=require('path'),{JSDOM}=require('jsdom');
const code=fs.readFileSync(path.join(__dirname,'control-diagnostic.js'),'utf8');
function run(html,kind){const d=new JSDOM(html,{url:'https://open.spotify.com/',runScripts:'outside-only'});try{d.window.fetch=()=>{throw Error('network')};return JSON.parse(d.window.eval(code)(kind));}finally{d.window.close();}}
const bar=(b)=>'<div data-testid="now-playing-widget">'+b+'</div>';
test('French apostrophe and smart state are observable, never inferred from account',()=>{
 let x=run('<button aria-label="Activer l’aléatoire"></button>','shuffle');assert.equal(x.state,'false');assert.equal(x.reason,'observed');
 x=run('<button data-testid="control-button-shuffle" aria-checked="mixed"></button>','shuffle');assert.equal(x.smart,true);assert.equal(x.state,'mixed');
 x=run('<button data-testid="control-button-shuffle" disabled aria-label="enable shuffle"></button>','shuffle');assert.equal(x.reason,'disabled');assert.equal(x.disabled,true);assert.ok(!JSON.stringify(x).includes('restriction'));
});
test('a menu is not represented as a direct liked-songs command',()=>{
 const x=run(bar('<button data-testid="add-button" aria-checked="false" aria-haspopup="menu"></button>'),'like');assert.equal(x.command,'menu');assert.equal(x.state,'unknown');
 const y=run(bar('<button data-testid="add-button" aria-checked="false"></button>'),'like');assert.equal(y.command,'unspecified');
});
test('unknown invalid mixed absent ambiguous and no sensitive page data',()=>{
 let x=run(bar('<button data-testid="add-button" aria-checked="mixed" aria-label="PRIVATE USER TITLE"></button>'),'like');assert.equal(x.state,'unknown');assert.equal(x.label,'unrecognized');assert.ok(!JSON.stringify(x).includes('PRIVATE'));
 x=run('<div></div>','shuffle');assert.ok(['page','absent'].includes(x.reason));
 x=run('<button data-testid="shuffle-a"></button><button data-testid="shuffle-b"></button>','shuffle');assert.equal(x.reason,'ambiguous');assert.equal(x.count,2);
});
test('probe is passive and does not access session or network',()=>{for(const s of ['.click(', 'fetch(', 'XMLHttpRequest','localStorage','sessionStorage','cookie','Authorization','api.spotify.com','setTimeout','setInterval'])assert.ok(!code.includes(s),s)});

test('restriction only when explicitly described, never from disabled alone',()=>{let x=run('<button data-testid="shuffle" disabled aria-description="Shuffle is not available for this account"></button>','shuffle');assert.equal(x.reason,'restriction');x=run('<button data-testid="shuffle" disabled></button>','shuffle');assert.equal(x.reason,'disabled')});

test('embedded WebView wrapper keeps diagnostic categorical while control retains identity guard',()=>{
 const control=fs.readFileSync(path.join(__dirname,'control.js'),'utf8');
 const java=fs.readFileSync(path.join(__dirname,'PreviewPlayerMode.java'),'utf8');
 const embedded=(name)=>JSON.parse(java.match(new RegExp("private static final String "+name+" = (\".*\");"))[1]);
 assert.equal(embedded("SCRIPT"),control);assert.equal(embedded("DIAGNOSTIC"),code);
 const d=new JSDOM(bar('<a data-testid="context-item-link" href="/track/secret">Private title</a><button data-testid="add-button" aria-checked="false" aria-label="Save to your library"></button>'),{runScripts:'outside-only',url:'https://open.spotify.com/'});
 try{
  let js=`(function(){var r=JSON.parse((${control})("like","query","","",""));r.diagnostic=(${code})("like");return JSON.stringify(r);})()`;
  let result=JSON.parse(d.window.eval(js)),diag=JSON.parse(result.diagnostic);
  assert.equal(result.title,'Private title');assert.equal(diag.state,'false');assert.equal(diag.reason,'observed');assert.ok(!result.diagnostic.includes('Private'));assert.ok(!result.diagnostic.includes('secret'));
 }finally{d.window.close();}
});

test('structural counts redact arbitrary testids, labels, title and account',()=>{
 let x=run(bar('<button data-testid="control-button-playpause" aria-label="Pause"></button><button data-testid="account-Alice" aria-label="Song by Private Artist"></button><input type="range" role="slider" data-testid="volume-slider">'),'shuffle');
 let st=JSON.parse(x.structure);assert.equal(st.bar,1);assert.equal(st.nodes,3);assert.equal(st.playpause,1);assert.equal(st.volume,1);assert.equal(st.aria_other,1);assert.equal(st.aria_pause,1);assert.ok(!x.structure.includes('Alice'));assert.ok(!x.structure.includes('Private'));
});

test('contradictory and unspecified like actions are categorized without raw labels',()=>{
 let x=run(bar('<button data-testid="remove-button" aria-checked="false" aria-label="Remove from your library"></button>'),'like');assert.equal(x.reason,'conflict');assert.ok(!JSON.stringify(x).includes('Remove from'));
 x=run(bar('<button data-testid="add-button" aria-checked="false"></button>'),'like');assert.equal(x.reason,'unverified');
});

test('repeat probe is categorical and preserves explicit mixed state',()=>{let x=run('<button data-testid="control-button-repeat" aria-checked="mixed" aria-label="Private title"></button>','repeat');assert.equal(x.state,'mixed');assert.equal(x.reason,'observed');assert.ok(!JSON.stringify(x).includes('Private'));x=run('<button aria-label="Activer la répétition"></button>','repeat');assert.equal(x.state,'false')});


test('identity and view-opener probe returns counts only, never track or title',()=>{
 const x=run(bar('<a href="/track/secret">PRIVATE TITLE</a><a href="/artist/ArtistSecret">Artist</a><button data-testid="control-button-npv" aria-label="Now playing view"></button>'),'like');
 const st=JSON.parse(x.structure);assert.equal(st.track_links,1);assert.equal(st.track_named,1);assert.equal(st.track_generic,1);assert.equal(st.npv_opener,1);
 assert.ok(!JSON.stringify(x).includes('PRIVATE'));assert.ok(!JSON.stringify(x).includes('secret'));assert.ok(!JSON.stringify(x).includes('ArtistSecret'));
});


test('outside-player candidates are counted but never identified or acted upon',()=>{
 const html=bar('<a href="/track/bar-private">Bar</a><button data-testid="add-button" aria-label="Add to your library"></button>')+'<div><button data-testid="remove-button" aria-label="Remove from your library">Private</button><a href="/track/secret123">Private track</a><button aria-label="PRIVATE USER">X</button></div>';
 const x=run(html,'like'),st=JSON.parse(x.structure);assert.equal(st.outside_like_id,1);assert.equal(st.outside_like_label,1);assert.equal(st.outside_track_links,1);assert.equal(st.like,1);assert.ok(!JSON.stringify(x).includes('secret123'));assert.ok(!JSON.stringify(x).includes('PRIVATE'));assert.ok(!JSON.stringify(x).includes('Remove from'));
});

test('outside counts are bounded and do not promote unrelated candidates to a like',()=>{
 const html=Array(120).fill('<button data-testid="add-button" aria-label="Add to your library"></button><a href="/track/a">x</a>').join('');const x=run(html,'like'),st=JSON.parse(x.structure);
 assert.equal(st.outside_like_id,99);assert.equal(st.outside_like_label,99);assert.equal(st.outside_track_links,99);assert.equal(x.count,0);
});


test('generic checked playlist controls never claim a liked state in diagnostics',()=>{
 for(const checked of ['true','false']){const x=run(bar('<button data-testid="add-button" aria-label="Ajouter à la playlist" aria-checked="'+checked+'"></button>'),'like');assert.equal(x.state,'unknown');assert.equal(x.reason,'unverified');}
});
