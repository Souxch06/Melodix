'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('fs'),path=require('path'),{JSDOM}=require('jsdom');
const code=fs.readFileSync(path.join(__dirname,'control.js'),'utf8');
function boot(){const d=new JSDOM('<div data-testid="now-playing-widget"><a data-testid="context-item-link" href="/track/abc">Titre</a><div><button data-testid="add-button" aria-checked="false" aria-label="Save to your Library"></button></div></div><button data-testid="control-button-shuffle" aria-checked="false"></button><button data-testid="control-button-repeat" aria-checked="mixed"></button>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=d.window,counts={like:0,shuffle:0,repeat:0};w.actAddToFav=()=>counts.like++;w.actShuffle=()=>counts.shuffle++;w.actRepeat=()=>counts.repeat++;w.fetch=()=>{throw Error('network forbidden')};const fn=w.eval(code);return {w,counts,fn,close:()=>d.window.close()}}
const q=(x,k)=>JSON.parse(x.fn(k,'query','','',''));
const invoke=(x,k,s,t='',n='')=>JSON.parse(x.fn(k,'invoke',s,t,n)).sent;
test('unavailable or ambiguous DOM is never claimed as false',()=>{const x=boot();try{assert.equal(q(x,'like').state,'false');x.w.document.querySelector('div>div>button').removeAttribute('aria-checked');x.w.document.querySelector('div>div>button').removeAttribute('aria-label');assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);x.w.document.querySelector('[data-testid=control-button-shuffle]').remove();assert.equal(q(x,'shuffle').state,'unknown');assert.equal(invoke(x,'shuffle','false'),false)}finally{x.close()}});
test('like rechecks exact title, track and real state immediately before invocation',()=>{const x=boot();try{let clicks=0;x.w.document.querySelector('div>div>button').addEventListener('click',()=>clicks++);let p=q(x,'like');assert.deepEqual([p.state,p.track,p.title],['false','track:abc','Titre']);assert.equal(invoke(x,'like',p.state,p.track,p.title),true);assert.equal(clicks,1);x.w.document.querySelector('a').setAttribute('href','/track/different');assert.equal(invoke(x,'like',p.state,p.track,p.title),false);x.w.document.querySelector('a').setAttribute('href','/track/abc');x.w.document.querySelector('div>div>button').setAttribute('aria-checked','true');assert.equal(invoke(x,'like',p.state,p.track,p.title),false);assert.equal(clicks,1)}finally{x.close()}});
test('shuffle and three repeat states use only existing commands, once per invocation',()=>{const x=boot();try{let repeats=0;x.w.document.querySelector('[data-testid=control-button-repeat]').addEventListener('click',()=>repeats++);assert.equal(q(x,'repeat').state,'mixed');assert.equal(invoke(x,'repeat','mixed'),true);assert.equal(repeats,1);assert.equal(x.counts.repeat,0);assert.equal(invoke(x,'repeat','false'),false);let clicks=0;x.w.document.querySelector('[data-testid=control-button-shuffle]').addEventListener('click',()=>clicks++);assert.equal(invoke(x,'shuffle','false'),true);assert.equal(clicks,1);assert.equal(x.counts.shuffle,0);x.w.document.querySelector('[data-testid=control-button-shuffle]').disabled=true;assert.equal(q(x,'shuffle').state,'unknown');assert.equal(invoke(x,'shuffle','false'),false)}finally{x.close()}});
test('no credentials, network, storage or auto-retry code',()=>{for(const forbidden of ['fetch(', 'spotAuthToken','localStorage','sessionStorage','cookie','Authorization','setTimeout','setInterval','location.assign']) assert.ok(!code.includes(forbidden),forbidden)});

test('a checked positional button is not assumed to be a save control',()=>{const x=boot();try{let b=x.w.document.querySelector('div>div>button');b.removeAttribute('data-testid');b.removeAttribute('aria-label');assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);b.setAttribute('aria-label','Save to your Library');assert.equal(q(x,'like').state,'false')}finally{x.close()}});

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
 x.w.document.querySelector('a').remove();let np=q(x,'like');assert.equal(np.track,'');assert.equal(invoke(x,'like',np.state,np.track,np.title),false);b.remove();assert.ok(['page','control'].includes(q(x,'shuffle').reason));
 }finally{x.close()}});

test('supported localized action labels do not invent state for unknown phrases',()=>{const x=boot();try{
 let b=x.w.document.querySelector('div>div>button');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');
 for(const [text,state] of [['Añadir a tu biblioteca','false'],['Quitar de tu biblioteca','true'],['In deine Bibliothek aufnehmen','false'],['Aus deiner Bibliothek entfernen','true'],['Adicionar à biblioteca','false'],['Remover da biblioteca','true']]){b.setAttribute('aria-label',text);assert.equal(q(x,'like').state,state,text)}
 b=x.w.document.querySelector('[data-testid=control-button-shuffle]');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');
 for(const [text,state] of [['Enable shuffle','false'],['Disable shuffle','true'],['Ativar a reprodução aleatória','false'],['Desativar a reprodução aleatória','true'],['Zufallswiedergabe deaktivieren','true']]){b.setAttribute('aria-label',text);assert.equal(q(x,'shuffle').state,state,text)}
 b.setAttribute('aria-label','modo desconhecido');assert.equal(q(x,'shuffle').state,'unknown');
 }finally{x.close()}});

test('invalid explicit aria is not overridden by a translated action label',()=>{const x=boot();try{const b=x.w.document.querySelector('div>div>button');b.setAttribute('aria-label','Save to your Library');b.setAttribute('aria-checked','mixed');assert.equal(q(x,'like').reason,'state');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);}finally{x.close()}});

test('like never removes and explicitly announced menu is not clicked',()=>{const x=boot();try{let b=x.w.document.querySelector('div>div>button'), clicks=0;b.addEventListener('click',()=>clicks++);b.setAttribute('aria-checked','true');assert.equal(invoke(x,'like','true','track:abc','Titre'),false);b.setAttribute('aria-checked','false');b.setAttribute('aria-haspopup','menu');assert.equal(q(x,'like').reason,'menu');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);assert.equal(clicks,0)}finally{x.close()}});

test('explicit shuffle restriction is distinguished from disabled',()=>{const x=boot();try{const b=x.w.document.querySelector('[data-testid=control-button-shuffle]');b.disabled=true;b.setAttribute('aria-description','Shuffle is not available for this account');assert.equal(q(x,'shuffle').reason,'restriction');assert.equal(invoke(x,'shuffle','false'),false);b.removeAttribute('aria-description');assert.equal(q(x,'shuffle').reason,'disabled')}finally{x.close()}});
test('identified current-bar track allows a uniquely labelled control in now-playing view',()=>{const x=boot();try{let original=x.w.document.querySelector('div>div>button');original.remove();let panel=x.w.document.createElement('div');panel.setAttribute('data-testid','now-playing-view');panel.innerHTML='<button aria-label="Add to liked songs" aria-checked="false"></button>';x.w.document.body.append(panel);let clicks=0;panel.querySelector('button').addEventListener('click',()=>clicks++);let p=q(x,'like');assert.equal(p.state,'false');assert.equal(invoke(x,'like',p.state,p.track,p.title),true);assert.equal(clicks,1)}finally{x.close()}});

test('conflicting removal controls and generic unlabelled add controls are never clicked',()=>{const x=boot();try{
 const b=x.w.document.querySelector('div>div>button');let clicks=0;b.addEventListener('click',()=>clicks++);
 b.setAttribute('aria-label','Remove from your library');assert.equal(q(x,'like').reason,'conflict');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);
 b.removeAttribute('aria-label');b.setAttribute('data-testid','remove-button');assert.equal(q(x,'like').reason,'conflict');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);
 b.setAttribute('data-testid','add-button');assert.equal(q(x,'like').reason,'unverified');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);
 b.setAttribute('data-testid','add-to-library-button');assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);assert.equal(clicks,0);
 }finally{x.close()}});

test('localized repeat action uses a unique button, never the helper with playback side effects',()=>{const x=boot();try{
 const b=x.w.document.querySelector('[data-testid=control-button-repeat]');b.removeAttribute('data-testid');b.removeAttribute('aria-checked');let clicks=0;b.addEventListener('click',()=>clicks++);
 b.setAttribute('aria-label','Activer la répétition');assert.equal(q(x,'repeat').state,'false');assert.equal(invoke(x,'repeat','false'),true);assert.equal(clicks,1);assert.equal(x.counts.repeat,0);
 b.setAttribute('aria-label','Désactiver la répétition');assert.equal(q(x,'repeat').state,'true');assert.equal(invoke(x,'repeat','false'),false);b.setAttribute('aria-checked','mixed');assert.equal(q(x,'repeat').state,'mixed');
 let clone=b.cloneNode();x.w.document.body.append(clone);assert.equal(q(x,'repeat').reason,'ambiguous');assert.equal(invoke(x,'repeat','mixed'),false);assert.equal(clicks,1);
 }finally{x.close()}});

test('no such control with the player bar present is reported as absent, never as a state',()=>{const x=boot();try{
 Object.defineProperty(x.w.document,'readyState',{value:'complete',configurable:true});
 x.w.document.querySelector('[data-testid=control-button-shuffle]').remove();
 const p=q(x,'shuffle');assert.equal(p.state,'unknown');assert.equal(p.reason,'absent');
 x.w.document.querySelector('[data-testid=now-playing-widget]').removeAttribute('data-testid');assert.equal(q(x,'shuffle').reason,'bar');
 }finally{x.close()}});


test('hidden like exposes only a unique bar identity, never an inferred state',()=>{const x=boot();try{
 x.w.document.querySelector('div>div>button').remove();let p=q(x,'like');assert.equal(p.state,'unknown');assert.equal(p.track,'track:abc');assert.equal(p.title,'Titre');
 let other=x.w.document.createElement('a');other.setAttribute('data-testid','context-item-link');other.href='/track/other';other.textContent='Titre';x.w.document.querySelector('[data-testid=now-playing-widget]').append(other);
 p=q(x,'like');assert.equal(p.track,'');assert.equal(p.title,'');assert.equal(p.state,'unknown');
}finally{x.close()}});


test('menu like exposes current-track identity but never claims a liked state',()=>{const x=boot();try{
 let b=x.w.document.querySelector('div>div>button');b.setAttribute('aria-haspopup','menu');let p=q(x,'like');assert.equal(p.reason,'menu');assert.equal(p.state,'unknown');assert.equal(p.track,'track:abc');assert.equal(p.title,'Titre');
}finally{x.close()}});


test('generic player links can supply identity without claiming like state',()=>{const x=boot();try{
 let bar=x.w.document.querySelector('[data-testid=now-playing-widget]');bar.querySelector('button').remove();bar.querySelector('a').removeAttribute('data-testid');
 let image=x.w.document.createElement('a');image.href='/track/abc';bar.append(image);
 let r=q(x,'like');assert.equal(r.state,'unknown');assert.equal(r.track,'track:abc');assert.equal(r.title,'Titre');
 bar.querySelector('a').setAttribute('href','https://open.spotify.com/intl-fr/track/abc?si=ignored');r=q(x,'like');assert.equal(r.track,'track:abc');
 let unrelated=x.w.document.createElement('a');unrelated.href='/track/other';unrelated.textContent='Same or another';x.w.document.body.append(unrelated);assert.equal(q(x,'like').track,'track:abc');
 bar.append(unrelated);assert.equal(q(x,'like').track,'');
 bar.innerHTML='<a href="https://evil.example/track/abc">Titre</a>';assert.equal(q(x,'like').track,'');
 bar.innerHTML='<a data-testid="context-item-link" href="/album/z">Titre</a><a href="/track/abc">Titre</a>';assert.equal(q(x,'like').track,'');
}finally{x.close()}});

test('a recognized role button in the player widget is observed',()=>{const x=boot();try{
 let b=x.w.document.querySelector('div>div>button');let r=x.w.document.createElement('div');r.setAttribute('role','button');r.setAttribute('data-testid','add-to-library-button');r.setAttribute('aria-checked','false');r.setAttribute('aria-label','Save to your library');b.replaceWith(r);
 assert.equal(q(x,'like').state,'false');assert.equal(q(x,'like').track,'track:abc');
}finally{x.close()}});


test('generic playlist controls and album-only identity never claim or send a like',()=>{const x=boot();try{
 const b=x.w.document.querySelector('div>div>button'),a=x.w.document.querySelector('a');let clicks=0;b.onclick=()=>clicks++;
 b.setAttribute('aria-label','Ajouter à la playlist');for(const state of ['true','false']){b.setAttribute('aria-checked',state);assert.equal(q(x,'like').state,'unknown');assert.equal(invoke(x,'like',state,'track:abc','Titre'),false);}
 b.setAttribute('aria-label','Save to your library');b.setAttribute('aria-checked','false');a.href='/album/same';assert.equal(q(x,'like').track,'');assert.equal(invoke(x,'like','false','album:same','Titre'),false);assert.equal(clicks,0);
 }finally{x.close()}});


test('like state is unknown for inherited disabled, contradictory ARIA or announced popups',()=>{const x=boot();try{
 const b=x.w.document.querySelector('div>div>button');let clicks=0;b.onclick=()=>clicks++;
 b.setAttribute('aria-pressed','true');assert.equal(q(x,'like').reason,'conflict');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);b.removeAttribute('aria-pressed');
 for(const popup of ['listbox','tree','grid']){b.setAttribute('aria-haspopup',popup);assert.equal(q(x,'like').reason,'menu');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);}b.removeAttribute('aria-haspopup');
 b.parentElement.setAttribute('aria-disabled','true');assert.equal(q(x,'like').reason,'disabled');assert.equal(invoke(x,'like','false','track:abc','Titre'),false);assert.equal(clicks,0);
 }finally{x.close()}});

test('explicit current-title track URI supplies identity; unrelated or conflicting markers do not',()=>{const x=boot();try{
 const bar=x.w.document.querySelector('[data-testid=now-playing-widget]');let anchor=bar.querySelector('a');anchor.remove();
 const title=x.w.document.createElement('div');title.setAttribute('data-testid','context-item-info-title');title.setAttribute('data-uri','spotify:track:abc');title.textContent='Titre';bar.append(title);
 let p=q(x,'like');assert.equal(p.track,'track:abc');assert.equal(p.title,'Titre');assert.equal(p.state,'false');
 title.setAttribute('data-track-uri','spotify:track:other');p=q(x,'like');assert.equal(p.track,'');assert.equal(p.title,'');title.removeAttribute('data-track-uri');
 const other=x.w.document.createElement('a');other.href='/track/other';other.textContent='Titre';bar.append(other);assert.equal(q(x,'like').track,'');other.remove();
 title.removeAttribute('data-uri');title.setAttribute('data-track-uri','spotify:album:abc');assert.equal(q(x,'like').track,'');
 title.remove();x.w.document.body.append(title);title.setAttribute('data-track-uri','spotify:track:abc');assert.equal(q(x,'like').track,'');
 }finally{x.close()}});
