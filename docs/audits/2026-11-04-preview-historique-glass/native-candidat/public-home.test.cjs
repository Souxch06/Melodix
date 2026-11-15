'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path'),vm=require('node:vm');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_CANDIDATE_ROOT;if(!root)throw Error('MELODIX_CANDIDATE_ROOT required');
const shell=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8'),bridge=fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8');
function boot(html,route='/') {
 const dom=new JSDOM(`<!doctype html><body><button data-testid="user-widget-link"></button>${html}</body>`,{url:'https://open.spotify.com'+route});
 dom.window.document.addEventListener=()=>{};
 const calls=[],timers=[],observers=[];let next=0;
 const w={location:{hostname:'open.spotify.com',pathname:route,href:'https://open.spotify.com'+route,assign(){}},AndBridge:{onNativeUiData:(screen,json)=>calls.push({screen,data:json}),onNativeUiReady(){},onNativeUiRoute(){}},addEventListener(){},setTimeout(fn,ms){const t={id:++next,fn,ms,cancelled:false};timers.push(t);return t.id},clearTimeout(id){const t=timers.find(t=>t.id===id);if(t)t.cancelled=true},MutationObserver:class{constructor(fn){this.fn=fn;observers.push(this)}observe(root,options){this.root=root;this.options=options;this.disconnected=false}disconnect(){this.disconnected=true}}};
 vm.runInNewContext(shell,{window:w,document:dom.window.document,URL,console,Promise});assert.equal(w.__sfNativeUiShellCompleted,true);
 return {w,document:dom.window.document,calls,timers,observers,close:()=>dom.window.close()};
}
function home(b){return JSON.parse(b.calls.filter(c=>c.screen==='home').at(-1)?.data||'[]')}
function take(b,ms){const t=b.timers.find(t=>t.ms===ms&&!t.cancelled&&!t.ran);assert.ok(t,'missing timer '+ms);t.ran=true;t.fn();}
const sidebar='<nav id="Desktop_LeftSidebar_Id"><a href="/playlist/private"><img src="https://i.scdn.co/image/a">Personal</a></nav>';
test('personal artwork does not cancel bounded retries while public shelves are absent',()=>{
 const b=boot('<main id="main-view"></main>'+sidebar);try{assert.ok(home(b).some(r=>r.uri==='spotify:playlist:private'));for(let i=0;i<4;i++)take(b,500);assert.ok(b.timers.some(t=>t.ms===500&&!t.cancelled&&!t.ran));assert.equal(home(b).length,1)}finally{b.close()}
});
test('public content arriving on an existing element is sent after attribute observer',()=>{
 const b=boot('<main id="main-view"><section><h2>À découvrir</h2><a id="placeholder">Public mix<img></a></section></main>'+sidebar);
 try{const obs=b.observers.find(o=>o.options?.attributes);assert.ok(obs);assert.equal(obs.root.id,'main-view');assert.ok(obs.options.attributeFilter.includes('href'));assert.ok(obs.options.attributeFilter.includes('src'));assert.equal(obs.options.characterData,true);
 const a=b.document.getElementById('placeholder');a.setAttribute('href','/playlist/public');a.querySelector('img').setAttribute('src','https://i.scdn.co/image/public');obs.fn([]);take(b,120);
 const rows=home(b);assert.ok(rows.some(r=>r.uri==='spotify:playlist:private'));assert.ok(rows.some(r=>r.uri==='spotify:playlist:public'&&r.section==='À découvrir'));assert.ok(!b.timers.some(t=>t.ms===500&&!t.cancelled&&!t.ran));
 }finally{b.close()}
});
test('an empty main root never mistakes sidebar playlists for public rows',()=>{
 const b=boot('<main id="main-view"></main>'+sidebar);try{const rows=home(b);assert.equal(rows.length,1);assert.equal(rows[0].section,'Vos playlists');assert.ok(b.timers.some(t=>t.ms===500&&!t.cancelled))}finally{b.close()}
});
test('after leaving Home, its observer disconnects and retries stop',()=>{
 const b=boot('<main id="main-view"></main>'+sidebar);try{const obs=b.observers.find(o=>o.options?.attributes);assert.ok(obs);b.w.location.pathname='/collection/tracks';b.w.location.href='https://open.spotify.com/collection/tracks';b.w.__sfNativeUiRefresh();assert.equal(obs.disconnected,true);assert.ok(!b.timers.some(t=>t.ms===500&&!t.cancelled&&!t.ran));}finally{b.close()}
});
test('retries are capped when no public content arrives',()=>{
 const b=boot('<main id="main-view"></main>'+sidebar);try{for(let i=0;i<40;i++)take(b,500);assert.ok(!b.timers.some(t=>t.ms===500&&!t.cancelled&&!t.ran));}finally{b.close()}
});
function bridgeDOM(native){
 const html='<style>body.sf-melodix-home-active #main-view {display:none!important}</style><main id="main-view"><section><h2>Discover</h2><div data-testid="card"><a href="/playlist/a"><img src="https://i.scdn.co/image/a">A</a></div><div data-testid="card"><a href="/playlist/b"><img src="https://i.scdn.co/image/b">B</a></div></section></main>';
 const dom=new JSDOM(html,{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=dom.window;w.SF_CONFIG={guiMode:'csshack'};w.__sfNativeUiShellReady=native;
 const start=bridge.indexOf('    function melodixHomeCopy() {'),end=bridge.indexOf('    function initializeMobileShell() {',start);assert.ok(start>=0&&end>start);
 w.eval(bridge.slice(start,end)+'\nwindow.testUpdateMelodixHome=updateMelodixHome; window.testInitializeMelodixHome=initializeMelodixHome;');return dom;
}
test('native UI leaves actual Spotify Home mounted rather than hiding it behind a duplicate',()=>{
 const d=bridgeDOM(true),w=d.window;try{w.document.body.classList.add('sf-melodix-home-active');const old=w.document.createElement('main');old.id='sf-melodix-home';w.document.body.appendChild(old);assert.equal(w.getComputedStyle(w.document.querySelector('#main-view')).display,'none');w.testUpdateMelodixHome();assert.equal(w.document.getElementById('sf-melodix-home'),null);assert.notEqual(w.getComputedStyle(w.document.querySelector('#main-view')).display,'none');w.testInitializeMelodixHome();assert.notEqual(w._sfMelodixHomeListenersAttached,true)}finally{w.close()}
});
test('legacy WebView-only mode retains its existing custom Home',()=>{
 const d=bridgeDOM(false),w=d.window;try{w.testUpdateMelodixHome();assert.ok(w.document.getElementById('sf-melodix-home'));assert.equal(w.getComputedStyle(w.document.querySelector('#main-view')).display,'none')}finally{w.close()}
});
test('an empty personal sidebar does not relabel public recommendations as personal',()=>{
 const b=boot('<main id="main-view"><section><h2>Découvrir</h2><a href="/playlist/public"><img src="https://i.scdn.co/image/p">Public mix</a></section></main><nav id="Desktop_LeftSidebar_Id"></nav>');
 try{const publicRow=home(b).find(r=>r.uri==='spotify:playlist:public');assert.ok(publicRow);assert.equal(publicRow.section,'Découvrir')}finally{b.close()}
});
test('replacing the Home root reconnects the focused attribute observer',()=>{
 const b=boot('<main id="main-view"></main>'+sidebar);try{const first=b.observers.find(o=>o.options?.attributes);const newer=b.document.createElement('main');newer.id='main-view';b.document.getElementById('main-view').replaceWith(newer);b.w.__sfNativeUiRefresh();assert.equal(first.disconnected,true);const second=b.observers.filter(o=>o.options?.attributes).at(-1);assert.equal(second.root,newer);assert.notEqual(second,first)}finally{b.close()}
});
test('transition from legacy renderer to native removes the duplicate source hiding',()=>{
 const d=bridgeDOM(false),w=d.window;try{w.testUpdateMelodixHome();assert.ok(w.document.body.classList.contains('sf-melodix-home-active'));w.__sfNativeUiShellReady=true;w.testUpdateMelodixHome();assert.ok(!w.document.body.classList.contains('sf-melodix-home-active'));assert.notEqual(w.getComputedStyle(w.document.querySelector('#main-view')).display,'none')}finally{w.close()}
});
