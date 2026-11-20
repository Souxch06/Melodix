'use strict';
const test=require('node:test');const assert=require('node:assert');const fs=require('fs');const path=require('path');
// Minimal fake of Spotify's preferences page: headings and controls in document order.
function setup(){
 const order=[];let path_='/playlist/P1';const timers=[];const sent=[];const storage={};
 const node=(o)=>{o.compareDocumentPosition=(other)=>order.indexOf(other)>order.indexOf(o)?4:2;o.getAttribute=(k)=>o.attrs&&o.attrs[k]||null;order.push(o);return o;};
 node({tag:'H2',textContent:'Lecture'});
 const cross=node({tagName:'INPUT',id:'cf',checked:false,attrs:{},clicks:0,click(){this.checked=!this.checked;this.clicks++;}});
 const norm=node({tagName:'BUTTON',attrs:{'role':'switch','aria-checked':'true','aria-label':'Normaliser le volume'},click(){this.attrs['aria-checked']=this.attrs['aria-checked']==='true'?'false':'true';}});
 node({tag:'H2',textContent:'Qualité audio'});
 const q=node({tagName:'SELECT',attrs:{'aria-label':'Qualité du streaming'},options:[{value:'a',textContent:'Automatique'},{value:'h',textContent:'Élevée'}],selectedIndex:0,events:0,dispatchEvent(){this.events++;}});
 const lang=node({tagName:'SELECT',attrs:{'aria-label':'Langue'},options:Array.from({length:30},(_,i)=>({value:'l'+i,textContent:'L'+i})),selectedIndex:0});
 const locked=node({tagName:'INPUT',id:'ex',checked:true,disabled:true,attrs:{}});
 const labels={cf:{textContent:'Fondu enchaîné'},ex:{textContent:'Contenu explicite'}};
 const controls=[cross,norm,q,lang,locked];
 const main={querySelectorAll:(s)=>s.startsWith('h1')?order.filter(o=>o.tag):path_==='/preferences'?controls:[]};
 const w={localStorage:{getItem:k=>storage[k]||null,setItem:(k,v)=>storage[k]=v},CSS:{escape:s=>s},
  location:{get pathname(){return path_;}},
  history:{state:null,pushState(_,__,p){path_=p;},back(){path_='/playlist/P1';}},
  PopStateEvent:function(){},Event:function(){},dispatchEvent(){},
  HTMLSelectElement:{prototype:{}},setTimeout:(f)=>{timers.push(f);return timers.length;}};
 Object.defineProperty(w.HTMLSelectElement.prototype,'value',{set(v){this.selectedIndex=this.options.findIndex(o=>o.value===v);},configurable:true});
 const document={querySelector:(s)=>s==='main'?main:s.startsWith('label')?labels[/"(.*)"/.exec(s)[1]]||null:null,getElementById:()=>null,body:main};
 const toggled=[];
 const base=[{section:'Compte Spotify',title:'Compte',uri:''},{section:'Compte Spotify',title:'Se déconnecter',uri:'spotify:settings:logout'},{section:'Lecture',title:'Gapless',settingValue:'Indisponible',uri:''},{section:'À propos',title:'Melodix',uri:''}];
 const src=fs.readFileSync(path.join(__dirname,'preview-settings.js'),'utf8');
 w.__sfToggleSpotifySetting=(u)=>toggled.push(u);
 new Function('window','document','sendNativeUiData','buildSpotifySettingsRows',src)(w,document,(k,rows)=>sent.push([k,rows]),()=>base.map(r=>Object.assign({},r)));
 const run=()=>{for(let i=0;i<200&&timers.length;i++)timers.shift()();};
 run();// installs the wrappers
 return {w,sent,run,cross,norm,q,lang,locked,toggled,storage,path:()=>path_};
}
test('settings: real Spotify preferences are read, listed by section, and the WebView goes back',()=>{
 const x=setup();x.w.__sfRequestSpotifySettings();
 assert.equal(x.sent[0][1].find(r=>/Chargement/.test(r.title)).uri,'','loading row first, not tappable');
 x.run();const rows=x.sent.at(-1)[1];
 assert.deepEqual(rows.map(r=>r.title),['Compte','Se déconnecter','Fondu enchaîné','Normaliser le volume','Qualité du streaming','Langue','Contenu explicite','Melodix']);
 assert.equal(rows[2].section,'Lecture');assert.equal(rows[4].section,'Qualité audio');
 assert.equal(rows[2].settingValue,'OFF');assert.equal(rows[3].settingValue,'ON');assert.equal(rows[4].settingValue,'Automatique');
 assert.equal(rows[5].uri,'','language list is not changed from Melodix (would reload Spotify)');assert.equal(rows[6].uri,'','disabled setting is not tappable');
 assert.ok(!rows.some(r=>r.settingValue==='Indisponible'),'old fake rows removed');
 assert.equal(x.path(),'/playlist/P1','back where it was');
});
test('settings: a tap changes exactly that setting and nothing on its own',()=>{
 const x=setup();x.w.__sfRequestSpotifySettings();x.run();
 assert.equal(x.cross.clicks,0,'reading never changes anything');
 const uri=x.sent.at(-1)[1].find(r=>r.title==='Fondu enchaîné').uri;x.w.__sfToggleSpotifySetting(uri);x.run();
 assert.equal(x.cross.checked,true);assert.equal(x.norm.attrs['aria-checked'],'true','other switch untouched');
 assert.equal(x.sent.at(-1)[1].find(r=>r.title==='Fondu enchaîné').settingValue,'ON');
 x.w.__sfToggleSpotifySetting(x.sent.at(-1)[1].find(r=>r.title==='Qualité du streaming').uri);x.run();
 assert.equal(x.q.selectedIndex,1);assert.equal(x.q.events,1);
 x.w.__sfToggleSpotifySetting('spotify:settings:logout');assert.deepEqual(x.toggled,['spotify:settings:logout'],'Melodix rows keep their own action');
 x.w.__sfToggleSpotifySetting('spotify:settings:sp6');x.run();assert.equal(x.locked.checked,true,'locked setting never clicked');
 assert.equal(x.path(),'/playlist/P1');
});
