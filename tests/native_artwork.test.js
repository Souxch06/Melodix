'use strict';
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const read=p=>fs.readFileSync(path.join(__dirname,'..',p),'utf8');

// Executes the loader's actual branch instructions up to Picasso load(), with
// trace/Android side effects stubbed. A nonempty HTTPS URL used to clear here.
function loaderPath(url) {
 const code=read('smali/com/melodix/music/NativeImageLoader.smali').split('\n').map(l=>l.trim());
 const labels=Object.fromEntries(code.map((l,i)=>[l,i]));
 const r={p0:{},p1:url,p2:148}; let result;
 for(let pc=0,steps=0;pc<code.length&&steps++<200;pc++) {
  let l=code[pc],m;
  if(!l||/^[.#:]/.test(l)) continue;
  if((m=l.match(/^const-string (\w+), (.*)$/))) {r[m[1]]=JSON.parse(m[2]);continue;}
  if((m=l.match(/^const\/4 (\w+), (.*)$/))) {r[m[1]]=Number(m[2]);continue;}
  if((m=l.match(/^move-result(?:-object|-wide)? (\w+)/))) {r[m[1]]=result;continue;}
  if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)/))) {if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]]) pc=labels[m[3]];continue;}
  if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
   const a=m[1]?m[1].split(', ').map(x=>r[x]):[], c=m[2];
   if(c.includes('Picasso;->load(')) return 'load';
   if(c.includes('->setImageDrawable')) return 'clear';
   if(c.includes('->isEmpty()')) result=a[0].length===0;
   else if(c.includes('->startsWith(')) result=a[0].startsWith(a[1]);
   else if(c.includes('Picasso;->get()')) result={};
   else if(c.includes('elapsedRealtime')) result=100;
   else if(c.includes('NativeImageTrace;->identity')) result='host=other key=00000000';
   else if(/NativeImageTrace;->(start|result)|Picasso;->cancelRequest/.test(c)) {}
   else assert.fail(c);
   continue;
  }
  if(l==='return-void') return 'none';
  assert.fail(l);
 }
 assert.fail('no path');
}

test('nonempty HTTPS artwork reaches Picasso, empty and other schemes never issue a request',()=>{
 assert.equal(loaderPath('https://i.scdn.co/image/fixture'),'load');
 for(const url of ['',null,'http://i.scdn.co/image/test','spotify:image:fixture']) assert.equal(loaderPath(url),'clear');
 const callback=read('smali/com/melodix/music/NativeImageLoader$FirstImageMark.smali');
 const api=read('smali/com/squareup/picasso/Callback.smali');
 for(const signature of [...api.matchAll(/\.method public abstract (\S+)/g)].map(x=>x[1]))
  assert.ok(callback.includes('.method public final '+signature),signature);
});

test('every artwork stage is accepted by the actual clipboard grammar, never raw URL or secrets',()=>{
 const literal=read('smali/com/melodix/music/NativeStartupTiming.smali').match(/const-string v0, "(\^sid=[^"\n]+)"/)[1];
 const rule=new RegExp(JSON.parse('"'+literal+'"'));
 const prefix='sid=abcd1234 t=200 ';
 const id='host=i.scdn.co key=01234567';
 for(const event of ['image stage=payload 12 https=8 missing=3 invalid=1',
  `image stage=source ${id} form=https`,`image stage=start ${id} form=https px=444`,
  `image stage=request ${id}`,`image stage=http ${id} code=200 duration=35 bytes=4500 type=jpeg`,
  `image stage=result ${id} result=failed-network duration=42`,
  `image stage=decoded ${id} width=444 height=444`,`image stage=view ${id} width=444 height=444 shown=true`]) assert.ok(rule.test(prefix+event),event);
 for(const host of ['i.scdn.co/private','user.secret.example','i.scdn.co?token=secret'])
  assert.ok(!rule.test(prefix+`image stage=request host=${host} key=01234567`));
 const trace=read('smali/com/melodix/music/NativeImageTrace.smali');
 assert.match(trace,/SHA-256/);
 assert.doesNotMatch(trace,/getMessage\(|getQuery\(|getCookie\(|Authorization/);
 const net=read('smali/com/squareup/picasso/NetworkRequestHandler.smali');
 assert.match(net,/downloader;->load|Downloader;->load/);
 assert.match(net,/move-result-object p2\s+invoke-static \{p1, p2, v5, v6\}.*NativeImageTrace;->http/);
});
