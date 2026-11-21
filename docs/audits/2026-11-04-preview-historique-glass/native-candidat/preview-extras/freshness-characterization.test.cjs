'use strict';
// Passing characterization assertions below document limitations, not success.
// Synthetic DOM and clock only: no Spotify, Android, real devices or sound.
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs'), path=require('node:path'),{JSDOM,VirtualConsole}=require('jsdom');
const src=Object.fromEntries(['queue-job','panel-job'].map(k=>[k,fs.readFileSync(path.join(__dirname,k+'.js'),'utf8')]));
function make(html){const dom=new JSDOM(`<!doctype html><body>${html}</body>`,{url:'https://open.spotify.com/',runScripts:'outside-only',virtualConsole:new VirtualConsole()}),w=dom.window,q=new Map();let n=0,t=100000;w.Date.now=()=>t;w.setTimeout=(fn,ms=0)=>{q.set(++n,{fn,at:t+Number(ms)});return n};w.clearTimeout=id=>q.delete(id);return{w,d:w.document,close:()=>w.close(),advance(ms){const end=t+ms;while(true){const e=[...q].filter(([,v])=>v.at<=end).sort((a,b)=>a[1].at-b[1].at||a[0]-b[0])[0];if(!e)break;q.delete(e[0]);t=e[1].at;e[1].fn()}t=end},run(k,...args){return JSON.parse(w.eval('('+src[k]+')('+args.map(JSON.stringify).join(',')+')'))}}}
const cases=[
 {kind:'queue',root:'queue-page',old:'<div role="row"><a href="/track/old">Ancien</a></div>',fresh:'<div role="row"><a href="/track/new">Nouveau</a></div>',script:'queue-job',start:['run'],poll:['poll'],field:'next'},
 {kind:'lyrics',root:'lyrics-container',old:'<p>Ancien</p>',fresh:'<p>Nouveau</p>',script:'panel-job',start:['lyrics','run',''],poll:['lyrics','poll',''],field:'body'},
 {kind:'devices',root:'connect-device-list',old:'<div role="option">Ancien</div>',fresh:'<div role="option">Nouveau</div>',script:'panel-job',start:['devices','run',''],poll:['devices','poll',''],field:'body'}
];
for(const c of cases){
 test(`${c.kind}: known limitation, stale nonempty content is accepted before later refresh`,()=>{const x=make(`<section data-testid="${c.root}">${c.old}</section>`);try{x.w.setTimeout(()=>x.d.querySelector('section').innerHTML=c.fresh,300);x.run(c.script,...c.start);x.advance(700);const r=x.run(c.script,...c.poll);assert.equal(r.ok,true);assert.match(r[c.field],/Ancien/);assert.doesNotMatch(r[c.field],/Nouveau/)}finally{x.close()}});
 test(`${c.kind}: an initially empty panel waits for synthetic content arriving at 300ms`,()=>{const x=make(`<section data-testid="${c.root}"></section>`);try{x.w.setTimeout(()=>x.d.querySelector('section').innerHTML=c.fresh,300);x.run(c.script,...c.start);x.advance(700);const r=x.run(c.script,...c.poll);assert.equal(r.ok,true);assert.match(r[c.field],/Nouveau/)}finally{x.close()}});
}
