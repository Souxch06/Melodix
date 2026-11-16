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
 const x=run(bar('<button data-testid="add-button" aria-checked="false" aria-haspopup="menu"></button>'),'like');assert.equal(x.command,'menu');assert.equal(x.state,'false');
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
 const d=new JSDOM(bar('<a data-testid="context-item-link" href="/track/secret">Private title</a><button data-testid="add-button" aria-checked="false"></button>'),{runScripts:'outside-only',url:'https://open.spotify.com/'});
 try{
  let js=`(function(){var r=JSON.parse((${control})("like","query","","",""));r.diagnostic=(${code})("like");return JSON.stringify(r);})()`;
  let result=JSON.parse(d.window.eval(js)),diag=JSON.parse(result.diagnostic);
  assert.equal(result.title,'Private title');assert.equal(diag.state,'false');assert.equal(diag.reason,'observed');assert.ok(!result.diagnostic.includes('Private'));assert.ok(!result.diagnostic.includes('secret'));
 }finally{d.window.close();}
});
