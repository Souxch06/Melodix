'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('fs'),path=require('path'),{JSDOM}=require('jsdom');
const code=fs.readFileSync(path.join(__dirname,'tiles-control.js'),'utf8');
function boot(html){const d=new JSDOM(html,{runScripts:'outside-only',url:'https://open.spotify.com/'});const w=d.window;w.fetch=()=>{throw Error('network forbidden')};const fn=w.eval(code);return {w,fn:(a,k)=>JSON.parse(fn(a,k)),close:()=>d.window.close()};}
for(const [k,id,fr] of [['queue','control-button-queue',"File d'attente"],['lyrics','lyrics-button','Paroles'],['connect','connect-button','Connecter à un appareil']]) {
 test(`${k}: page prête, absent, présent, désactivé et recontrôle`,()=>{const x=boot(`<div data-testid="now-playing-bar"></div>`);try{
 Object.defineProperty(x.w.document,'readyState',{value:'loading',configurable:true});assert.equal(x.fn('query','')[k+'Reason'],'page');
 Object.defineProperty(x.w.document,'readyState',{value:'complete',configurable:true});assert.equal(x.fn('query','')[k+'Reason'],'control');assert.equal(x.fn('invoke',k).sent,false);
 const b=x.w.document.createElement('button');b.setAttribute('data-testid',id);x.w.document.body.append(b);let clicks=0;b.addEventListener('click',()=>clicks++);
 assert.equal(x.fn('query','')[k],'available');assert.equal(x.fn('invoke',k).sent,true);assert.equal(clicks,1);
 b.setAttribute('aria-expanded','true');assert.equal(x.fn('invoke',k).sent,true);assert.equal(clicks,1);
 b.disabled=true;assert.equal(x.fn('query','')[k+'Reason'],'disabled');assert.equal(x.fn('invoke',k).sent,false);b.disabled=false;
 b.removeAttribute('data-testid');b.setAttribute('aria-label',fr);assert.equal(x.fn('query','')[k],'available');let clone=b.cloneNode();x.w.document.body.append(clone);assert.equal(x.fn('query','')[k+'Reason'],'ambiguous');assert.equal(x.fn('invoke',k).sent,false);clone.remove();b.remove();assert.equal(x.fn('invoke',k).sent,false);assert.equal(clicks,1);
 }finally{x.close()}});
}
test('fixtures pause zéro, pause 0:10 et lecture 10 s ne changent pas la détection',()=>{for(const label of ['pause zéro','pause 0:10','lecture 10 s']){const x=boot('<div data-testid="now-playing-bar"></div><button data-testid="queue-button"></button><button data-testid="lyrics-button"></button><button data-testid="connect-button"></button>');try{Object.defineProperty(x.w.document,'readyState',{value:'complete'});let s=x.fn('query','');for(const k of ['queue','lyrics','connect'])assert.equal(s[k],'available',label)}finally{x.close()}}});
test('pas de réseau, accès session ni stockage programmés',()=>{for(const s of ['fetch(', 'XMLHttpRequest','localStorage','sessionStorage','cookie','Authorization','setTimeout','setInterval','api.spotify.com'])assert.ok(!code.includes(s),s)});

test('présence reconnue utilisable dès le chargement avant readyState complete',()=>{const x=boot('<button data-testid="queue-button"></button>');try{Object.defineProperty(x.w.document,'readyState',{value:'loading'});assert.equal(x.fn('query','').queue,'available');}finally{x.close()}});
