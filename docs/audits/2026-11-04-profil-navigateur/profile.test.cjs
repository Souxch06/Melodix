'use strict';
// Interprets actual BrowserProfile Smali with fake WebSettings and runs the
// bundled desktop_spoof.js in JSDOM. This is not an Android or network test.
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const {JSDOM}=require('jsdom');
const root=process.env.MELODIX_SOURCE_ROOT||path.resolve(__dirname,'../../..');
const src=fs.readFileSync(path.join(root,'smali/com/melodix/music/BrowserProfile.smali'),'utf8');
const start=src.indexOf('.method public static desktopUserAgent('),end=src.indexOf('.end method',start);
assert.ok(start>=0&&end>start);
const lines=src.slice(start,end).split(/\r?\n/).map(x=>x.replace(/#.*/,'').trim()).filter(x=>x&&!x.startsWith('.'));
const labels=new Map(lines.flatMap((x,i)=>x.startsWith(':')?[[x.slice(1),i]]:[]));
function native(defaultUA,hasContext=true){
 const r={p0:hasContext?{}:null};let pc=0,pending,steps=0;
 function jump(l){assert.ok(labels.has(l));pc=labels.get(l);}
 while(pc<lines.length){
  assert.ok(++steps<100);const line=lines[pc++];let m;
  if(line.startsWith(':'))continue;
  if((m=/^const-string (\w+), "(.*)"$/.exec(line)))r[m[1]]=m[2];
  else if((m=/^const\/4 (\w+), (-?0x[0-9a-f]+)$/.exec(line)))r[m[1]]=m[2][0]==='-'?-parseInt(m[2].slice(3),16):parseInt(m[2],16);
  else if((m=/^add-int\/lit8 (\w+), (\w+), (0x[0-9a-f]+)$/.exec(line)))r[m[1]]=r[m[2]]+parseInt(m[3],16);
  else if((m=/^move-result(?:-object)? (\w+)$/.exec(line)))r[m[1]]=pending;
  else if((m=/^new-instance (\w+), Ljava\/lang\/StringBuilder;$/.exec(line)))r[m[1]]={value:''};
  else if((m=/^if-(eqz|lez) (\w+), :([\w_]+)$/.exec(line))){const v=r[m[2]];if(m[1]==='eqz'?v==null||v===0:v<=0)jump(m[3]);}
  else if((m=/^if-(eq|ne|le) (\w+), (\w+), :([\w_]+)$/.exec(line))){const a=r[m[2]],b=r[m[3]];if(m[1]==='eq'?a===b:m[1]==='ne'?a!==b:a<=b)jump(m[4]);}
  else if((m=/^invoke-(static|direct|virtual) \{([^}]*)\}, (L[^;]+;)->([^\(]+)\(/.exec(line))){
   const a=m[2]?m[2].split(', ').map(x=>r[x]):[], cls=m[3],name=m[4];
   if(name==='getDefaultUserAgent')pending=defaultUA;
   else if(cls==='Ljava/lang/String;'&&name==='indexOf')pending=a[0].indexOf(a[1],a.length===3?a[2]:0);
   else if(cls==='Ljava/lang/String;'&&name==='length')pending=a[0].length;
   else if(cls==='Ljava/lang/String;'&&name==='substring')pending=a[0].substring(a[1],a[2]);
   else if(cls==='Ljava/lang/StringBuilder;'&&name==='<init>')a[0].value=a[1];
   else if(cls==='Ljava/lang/StringBuilder;'&&name==='append'){a[0].value+=a[1];pending=a[0];}
   else if(cls==='Ljava/lang/StringBuilder;'&&name==='toString')pending=a[0].value;
   else throw Error('unreviewed invoke: '+line);
  } else if((m=/^return-object (\w+)$/.exec(line)))return r[m[1]];
  else throw Error('unreviewed instruction: '+line);
 }
 throw Error('native UA model did not return');
}
const spoof=fs.readFileSync(path.join(root,'assets/desktop_spoof.js'),'utf8');
for(const version of ['134.0.0.0','142.0.1.7','150.2.3.4'])test('native and JS identities follow fixture Chromium '+version,async()=>{
 const platform='Mozilla/5.0 (Linux; Android 14; wv) AppleWebKit/537.36 Chrome/'+version+' Mobile Safari/537.36';
 const ua=native(platform);assert.equal(ua,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/'+version+' Safari/537.36');
 const dom=new JSDOM('<!doctype html><body></body>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=dom.window;
 try{
  Object.defineProperty(w.navigator,'userAgent',{value:ua,configurable:true});
  w.setInterval=()=>0;w.setTimeout=()=>0;w.MutationObserver=class{observe(){}disconnect(){}};
  w.eval(spoof);
  assert.equal(w.navigator.platform,'Win32');assert.equal(w.navigator.userAgent,ua);
  assert.equal(w.navigator.userAgentData.brands.find(x=>x.brand==='Chromium').version,version.split('.')[0]);
  assert.equal(w.navigator.userAgentData.brands.find(x=>x.brand==='Google Chrome').version,version.split('.')[0]);
  const hints=await w.navigator.userAgentData.getHighEntropyValues(['uaFullVersion','fullVersionList']);
  assert.equal(hints.uaFullVersion,version);assert.equal(hints.fullVersionList.find(x=>x.brand==='Chromium').version,version);
 }finally{w.close();}
});

test('without a Chrome token the native UA is retained and JS hints are not fabricated',()=>{
 const platform='Example WebView';assert.equal(native(platform),platform);assert.equal(native(null),'');assert.equal(native(platform,false),'');
 const dom=new JSDOM('<body></body>',{url:'https://open.spotify.com/',runScripts:'outside-only'});const w=dom.window;
 try{
  const existing={brands:[{brand:'Example',version:'1'}]};Object.defineProperty(w.navigator,'userAgent',{value:platform,configurable:true});
  Object.defineProperty(w.navigator,'userAgentData',{value:existing,configurable:true});
  w.setInterval=()=>0;w.setTimeout=()=>0;w.MutationObserver=class{observe(){}disconnect(){}};w.eval(spoof);
  assert.equal(w.navigator.userAgentData,existing);
 }finally{w.close();}
});
