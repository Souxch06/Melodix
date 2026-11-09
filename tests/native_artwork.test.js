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
   if(c.includes('->getContext()') || c.includes('NativeArtworkPlaceholder;->get')) {result={};continue;}
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
  `image stage=decode ${id} result=failed width=0 height=0 bytes=0`,
  `image stage=decode ${id} result=ok width=444 height=444 bytes=788544`,
  `image stage=drawable ${id} width=444 height=444`,`image stage=view ${id} width=444 height=444 shown=true`]) assert.ok(rule.test(prefix+event),event);
 for(const host of ['i.scdn.co/private','user.secret.example','i.scdn.co?token=secret'])
  assert.ok(!rule.test(prefix+`image stage=request host=${host} key=01234567`));
 const trace=read('smali/com/melodix/music/NativeImageTrace.smali');
 assert.match(trace,/SHA-256/);
 assert.doesNotMatch(trace,/getMessage\(|getQuery\(|getCookie\(|Authorization/);
 const net=read('smali/com/squareup/picasso/NetworkRequestHandler.smali');
 assert.match(net,/downloader;->load|Downloader;->load/);
 assert.match(net,/move-result-object p2\s+invoke-static \{p1, p2, v5, v6\}.*NativeImageTrace;->http/);
});


test('shared memory/disk caches, bounded prefetch and identical pending/error placeholder remain in the native path',()=>{
 const loader=read('smali/com/melodix/music/NativeImageLoader.smali');
 assert.match(loader,/const\/16 v6, 0xc/);
 assert.match(loader,/HashSet;->add/);
 assert.match(loader,/RequestCreator;->fetch\(\)V/);
 assert.doesNotMatch(loader,/memoryPolicy|networkPolicy|noFade/);
 assert.match(loader,/RequestCreator;->placeholder\(Landroid\/graphics\/drawable\/Drawable;\)/);
 assert.match(loader,/RequestCreator;->error\(Landroid\/graphics\/drawable\/Drawable;\)/);
 assert.match(loader,/image_load_error[\s\S]*?\{p0, v5\}.*setImageDrawable/);
 assert.match(read('smali/com/squareup/picasso/Picasso$Builder.smali'),/new-instance v0, Lcom\/squareup\/picasso\/LruCache/);
 assert.match(read('smali/com/squareup/picasso/OkHttp3Downloader.smali'),/calculateDiskCacheSize/);
 assert.match(read('res/drawable/native_artwork_placeholder.xml'),/<gradient/);
 assert.match(read('res/drawable/native_artwork_placeholder.xml'),/@drawable\/native_cover_placeholder/);
 const helper=read('smali/com/melodix/music/NativeArtworkPlaceholder.smali');
 assert.match(helper,/getIdentifier/); assert.doesNotMatch(helper,/0x7f/);
});

test('native and Web Home explicitly retain nonwrapping horizontal tracks and contained titles',()=>{
 const renderer=read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
 const entry=renderer.slice(renderer.indexOf('.method public static render('),renderer.indexOf('.method private static renderHomeStatus'));
 assert.doesNotMatch(entry,/->renderQuickGrid\(/,'no duplicate vertical quick grid precedes the carousel');
 assert.match(entry,/const\/4 v8, 0x0\s+invoke-virtual \{v7, v8\}.*setOrientation/);
 assert.match(entry,/HorizontalScrollView/);
 assert.match(entry,/if-nez v7, :shelf_header_done/,'nonempty real section heading is rendered');
 assert.match(entry,/TextView;->setMinLines\(I\)V/);
 assert.match(entry,/TextView;->setMaxLines\(I\)V/);
 assert.match(entry,/TruncateAt;->END/);
 for(const qualifier of ['values','values-sw600dp']) {
  const xml=read('res/'+qualifier+'/mel_dimens.xml');
  const dim=n=>Number(xml.match(new RegExp('name="mel_shelf_'+n+'">([0-9.]+)dip'))[1]);
  assert.equal(dim('card_width'),dim('art_height'),'square in '+qualifier);
 }
 const css=read('assets/css_hacks.css');
 const rule=name=>css.slice(css.indexOf('#sf-melodix-home .sf-melodix-home__'+name+' {')).split('}')[0];
 assert.match(rule('cards'),/flex-direction: row !important/);
 assert.match(rule('cards'),/flex-wrap: nowrap !important/);
 assert.match(rule('card'),/height: auto !important/);
 assert.match(rule('card'),/148px/);
 assert.match(rule('title'),/-webkit-line-clamp: 2/);
 assert.doesNotMatch(rule('card'),/backdrop-filter/);
 assert.match(read('tests/android/HomeRenderInstrumentation.java'),/art.getWidth\(\) != art.getHeight\(\)/);
});

test('image and layout observations survive the exact copied-journal filter',()=>{
 const os=require('node:os'), cp=require('node:child_process');
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'mdx-image-'));
 try {
  const events=['image stage=payload 4 https=3 missing=1 invalid=0',
    'image stage=request host=i.scdn.co key=01234567',
    'image stage=http host=i.scdn.co key=01234567 code=200 duration=30 bytes=4096 type=jpeg',
    'shelf stage=layout cards=4 orientation=0 width=1800 height=600 overlaps=0 overflow=0'];
  const lines=events.map((x,i)=>`sid=abcd1234 t=${100+i} ${x}`);
  const input=path.join(dir,'input'), output=path.join(dir,'output');
  fs.writeFileSync(input,['MDXPERF-BEGIN v=1 dropped=0',...lines,
    'sid=abcd1234 t=200 image stage=request host=i.scdn.co/PRIVATE key=01234567','MDXPERF-END'].join('\n'));
  cp.execFileSync('python3',[path.join(__dirname,'../scripts/startup_timing_journal.py'),'--filter-log',input,output]);
  assert.equal(fs.readFileSync(output,'utf8'),lines.join('\n')+'\n');
 } finally {fs.rmSync(dir,{recursive:true,force:true});}
});


test('decoder instrumentation preserves BitmapFactory decisions and reports actual null decoding results',()=>{
 const hunter=read('smali/com/squareup/picasso/BitmapHunter.smali');
 const start=hunter.indexOf('.method public static decodeStream(');
 const method=hunter.slice(start,hunter.indexOf('.end method',start));
 assert.match(method,/move-object v7, p1/);
 assert.equal((method.match(/NativeImageTrace;->decode/g)||[]).length,3);
 assert.match(method,/:cond_1\s+invoke-static \{v7, p0\}.*NativeImageTrace;->decode[\s\S]*?Failed to decode stream/);
 const trace=read('smali/com/melodix/music/NativeImageTrace.smali');
 assert.match(trace,/Bitmap;->getByteCount/);
 assert.doesNotMatch(trace,/getMessage\(/);
});
