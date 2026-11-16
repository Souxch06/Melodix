'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('fs'),path=require('path'),{JSDOM}=require('jsdom');
const code=fs.readFileSync(path.join(__dirname,'control.js'),'utf8');
function boot(){const d=new JSDOM('<div data-testid="now-playing-widget"><a data-testid="context-item-link" href="/track/abc">Titre</a><div><button data-testid="add-button" aria-checked="false"></button></div></div><button data-testid="control-button-shuffle" aria-checked="false"></button><button data-testid="control-button-repeat" aria-checked="mixed"></button>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=d.window,counts={like:0,shuffle:0,repeat:0};w.actAddToFav=()=>counts.like++;w.actShuffle=()=>counts.shuffle++;w.actRepeat=()=>counts.repeat++;w.fetch=()=>{throw Error('network forbidden')};const fn=w.eval(code);return {w,counts,fn,close:()=>d.window.close()}}
const q=(x,k)=>JSON.parse(x.fn(k,'query','','',''));
const invoke=(x,k,s,t='',n='')=>JSON.parse(x.fn(k,'invoke',s,t,n)).sent;
test('unavailable or ambiguous DOM is never claimed as false',()=>{const x=boot();try{assert.equal(q(x,'like').state,'false');x.w.document.querySelector('div>div>button').removeAttribute('aria-checked');assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);x.w.document.querySelector('[data-testid=control-button-shuffle]').remove();assert.equal(q(x,'shuffle').state,'unknown');assert.equal(invoke(x,'shuffle','false'),false)}finally{x.close()}});
test('like rechecks exact title, track and real state immediately before invocation',()=>{const x=boot();try{let p=q(x,'like');assert.deepEqual([p.state,p.track,p.title],['false','track:abc','Titre']);assert.equal(invoke(x,'like',p.state,p.track,p.title),true);assert.equal(x.counts.like,1);x.w.document.querySelector('a').setAttribute('href','/track/different');assert.equal(invoke(x,'like',p.state,p.track,p.title),false);x.w.document.querySelector('a').setAttribute('href','/track/abc');x.w.document.querySelector('div>div>button').setAttribute('aria-checked','true');assert.equal(invoke(x,'like',p.state,p.track,p.title),false);assert.equal(x.counts.like,1)}finally{x.close()}});
test('shuffle and three repeat states use only existing commands, once per invocation',()=>{const x=boot();try{assert.equal(q(x,'repeat').state,'mixed');assert.equal(invoke(x,'repeat','mixed'),true);assert.equal(x.counts.repeat,1);assert.equal(invoke(x,'repeat','false'),false);assert.equal(invoke(x,'shuffle','false'),true);assert.equal(x.counts.shuffle,1);x.w.document.querySelector('[data-testid=control-button-shuffle]').disabled=true;assert.equal(q(x,'shuffle').state,'unknown');assert.equal(invoke(x,'shuffle','false'),false)}finally{x.close()}});
test('no credentials, network, storage or auto-retry code',()=>{for(const forbidden of ['fetch(', 'spotAuthToken','localStorage','sessionStorage','cookie','Authorization','setTimeout','setInterval','location.assign']) assert.ok(!code.includes(forbidden),forbidden)});

test('a checked positional button is not assumed to be a save control',()=>{const x=boot();try{let b=x.w.document.querySelector('div>div>button');b.removeAttribute('data-testid');assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);b.setAttribute('aria-label','Save to your Library');assert.equal(q(x,'like').state,'false')}finally{x.close()}});

test('localized shuffle controls use exact one-click fallback and reject ambiguous or unknown state',()=>{const x=boot();try{
 const b=x.w.document.querySelector('[data-testid=control-button-shuffle]');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');b.setAttribute('aria-label','Activer la lecture aléatoire');let clicks=0;b.addEventListener('click',()=>clicks++);
 assert.equal(q(x,'shuffle').state,'false');assert.equal(invoke(x,'shuffle','false'),true);assert.equal(clicks,1);assert.equal(x.counts.shuffle,0);
 b.setAttribute('aria-label','Désactiver la lecture aléatoire');assert.equal(q(x,'shuffle').state,'true');assert.equal(invoke(x,'shuffle','false'),false);
 b.setAttribute('aria-label','Zufallswiedergabe aktivieren');assert.equal(q(x,'shuffle').state,'false');b.setAttribute('aria-label','Activar la reproducción aleatoria');assert.equal(q(x,'shuffle').state,'false');
 const clone=b.cloneNode();x.w.document.body.appendChild(clone);assert.equal(q(x,'shuffle').reason,'ambiguous');assert.equal(invoke(x,'shuffle','false'),false);clone.remove();b.setAttribute('aria-label','Aleatorio');assert.equal(q(x,'shuffle').state,'unknown');
 }finally{x.close()}});

test('localized save control outside legacy position is clicked once only after identity recheck',()=>{const x=boot();try{
 const b=x.w.document.querySelector('div>div>button');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');b.setAttribute('aria-label','Enregistrer dans votre bibliothèque');let clicks=0;b.addEventListener('click',()=>clicks++);
 const bar=x.w.document.querySelector('[data-testid=now-playing-widget]');bar.insertBefore(b,bar.firstChild);let p=q(x,'like');assert.equal(p.state,'false');assert.equal(invoke(x,'like',p.state,p.track,p.title),true);assert.equal(clicks,1);assert.equal(x.counts.like,0);
 b.setAttribute('aria-label','Supprimer de votre bibliothèque');assert.equal(q(x,'like').state,'true');assert.equal(invoke(x,'like','false',p.track,p.title),false);assert.equal(clicks,1);
 b.setAttribute('aria-label','Guardar');assert.equal(q(x,'like').state,'unknown');
 }finally{x.close()}});

test('explicit diagnostics distinguish absent, disabled, unreadable and identity mismatch',()=>{const x=boot();try{
 let b=x.w.document.querySelector('[data-testid=control-button-shuffle]');b.disabled=true;assert.equal(q(x,'shuffle').reason,'disabled');b.disabled=false;b.removeAttribute('aria-checked');assert.equal(q(x,'shuffle').reason,'state');
 x.w.document.querySelector('a').remove();assert.equal(q(x,'like').reason,'identity');b.remove();assert.ok(['page','control'].includes(q(x,'shuffle').reason));
 }finally{x.close()}});

test('supported localized action labels do not invent state for unknown phrases',()=>{const x=boot();try{
 let b=x.w.document.querySelector('div>div>button');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');
 for(const [text,state] of [['Añadir a tu biblioteca','false'],['Quitar de tu biblioteca','true'],['In deine Bibliothek aufnehmen','false'],['Aus deiner Bibliothek entfernen','true'],['Adicionar à biblioteca','false'],['Remover da biblioteca','true']]){b.setAttribute('aria-label',text);assert.equal(q(x,'like').state,state,text)}
 b=x.w.document.querySelector('[data-testid=control-button-shuffle]');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');
 for(const [text,state] of [['Enable shuffle','false'],['Disable shuffle','true'],['Ativar a reprodução aleatória','false'],['Desativar a reprodução aleatória','true'],['Zufallswiedergabe deaktivieren','true']]){b.setAttribute('aria-label',text);assert.equal(q(x,'shuffle').state,state,text)}
 b.setAttribute('aria-label','modo desconhecido');assert.equal(q(x,'shuffle').state,'unknown');
 }finally{x.close()}});

test('invalid explicit aria is not overridden by a translated action label',()=>{const x=boot();try{const b=x.w.document.querySelector('div>div>button');b.setAttribute('aria-label','Save to your Library');b.setAttribute('aria-checked','mixed');assert.equal(q(x,'like').reason,'state');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);}finally{x.close()}});
