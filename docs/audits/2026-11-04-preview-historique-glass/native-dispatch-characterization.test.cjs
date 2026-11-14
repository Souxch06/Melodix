// Interpret exact historical dispatchNativeUi instructions with synthetic objects.
// No Android runtime, Spotify, credentials, or network is involved.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const root=process.env.MELODIX_SMALI_ROOT || process.env.MELODIX_HISTORICAL_ROOT;
if(!root) throw new Error('MELODIX_SMALI_ROOT or MELODIX_HISTORICAL_ROOT required');
const read=p=>fs.readFileSync(path.join(root,'smali',p),'utf8');
const bridge=read('com/melodix/music/AndBridge.smali');
function method(src,prefix) {
 const a=src.indexOf(prefix),b=src.indexOf('.end method',a);
 assert.ok(a>=0&&b>a,`Missing ${prefix}`);return src.slice(a,b);
}
const body=method(bridge,'.method private final dispatchNativeUi(');
const lines=body.split('\n').map(s=>s.trim()).filter(s=>s&&!s.startsWith('.')&&!s.startsWith('#'));
const labels=new Map(lines.map((s,i)=>[s,i]).filter(([s])=>s.startsWith(':')));
function dispatch(weakActivity,context) {
 const regs={p0:{a:context},p1:'media:playlists',p2:'[{"title":"Fictive"}]'};
 const staticRef=weakActivity?{referent:weakActivity}:null;
 const posts=[];let result,steps=0;
 const val=x=>{assert.ok(x in regs,`uninitialized register ${x}`);return regs[x];};
 const zero=x=>x===null||x===0;
 for(let pc=0;pc<lines.length;pc++){
  if(++steps>100)throw new Error('instruction limit');
  const line=lines[pc];let m;
  if(line.startsWith(':'))continue;
  if(line==='return-void')break;
  if((m=line.match(/^if-(eqz|nez) ([vp]\d+), :(\w+)$/))){
   const jump=m[1]==='eqz'?zero(val(m[2])):!zero(val(m[2]));
   if(jump){assert.ok(labels.has(':'+m[3]));pc=labels.get(':'+m[3]);}continue;
  }
  if((m=line.match(/^const(?:\/4|\/16)? ([vp]\d+), (0x[0-9a-f]+|\d+)$/))){regs[m[1]]=Number(m[2]);continue;}
  if((m=line.match(/^sget-object ([vp]\d+), .*?AppSingleton;->t:Ljava\/lang\/ref\/WeakReference;$/))){regs[m[1]]=staticRef;continue;}
  if((m=line.match(/^iget-object ([vp]\d+), p0, .*?AndBridge;->a:Landroid\/content\/Context;$/))){regs[m[1]]=context;continue;}
  if((m=line.match(/^move-result(?:-object)? ([vp]\d+)$/))){regs[m[1]]=result;continue;}
  if((m=line.match(/^move-object(?:\/from16)? ([vp]\d+), ([vp]\d+)$/))){regs[m[1]]=val(m[2]);continue;}
  if((m=line.match(/^instance-of ([vp]\d+), ([vp]\d+), Lcom\/melodix\/music\/MainActivity;$/))){regs[m[1]]=val(m[2])?.kind==='activity'?1:0;continue;}
  if(line.startsWith('check-cast '))continue;
  if((m=line.match(/^invoke-virtual \{([^}]+)\}, (.+)$/))){
   const args=m[1].split(',').map(x=>val(x.trim())),target=m[2];
   if(target.includes('Ljava/lang/ref/Reference;->get('))result=args[0].referent;
   else if(target.includes('MainActivity;->postNativeUiData('))posts.push({activity:args[0],screen:args[1],data:args[2]});
   else throw new Error(`Unhandled invocation: ${line}`);
   continue;
  }
  throw new Error(`Unhandled instruction: ${line}`);
 }
 return posts;
}
const a={kind:'activity',name:'weak-activity'}, c={kind:'activity',name:'context-activity'},app={kind:'application'};

test('application context drops media dispatch even with a live activity reference',()=>{
 assert.deepEqual(dispatch(a,app),[]);
});
test('without activity reference, even an activity context is not used',()=>{
 assert.deepEqual(dispatch(null,c),[]);
});
test('with both available, the context activity receives the dispatch',()=>{
 const posts=dispatch(a,c);assert.equal(posts.length,1);assert.equal(posts[0].activity,c);assert.equal(posts[0].screen,'media:playlists');
});
test('with neither available, nothing is dispatched',()=>{
 assert.deepEqual(dispatch(null,app),[]);
});
test('WebView bridge is constructed with the stored application context',()=>{
 const m9=read('m9.smali'),appClass=read('com/melodix/music/AppSingleton.smali');
 const factory=method(m9,'.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;');
 const getCtx=method(m9,'.method public static c()Landroid/content/Context;');
 assert.match(factory,/Lm9;->c\(\)Landroid\/content\/Context;[\s\S]*?AndBridge;-><init>\(Landroid\/content\/Context;\)V[\s\S]*?addJavascriptInterface/);
 assert.match(getCtx,/AppSingleton;->s:Landroid\/content\/Context;/);
 assert.match(appClass,/getApplicationContext\(\)Landroid\/content\/Context;[\s\S]*?AppSingleton;->s:Landroid\/content\/Context;/);
});
test('generic UI data and media callback both route through dispatchNativeUi',()=>{
 assert.match(method(bridge,'.method public final onNativeUiData('),/dispatchNativeUi/);
 const media=method(bridge,'.method public final onMediaItemsLoaded(');
 assert.match(media,/"media:"[\s\S]*?dispatchNativeUi/);
});
test('separate Home callback reaches postNativeUiData via the weak activity',()=>{
 const home=method(bridge,'.method public final onNativeHomeRows(');
 const runnable=read('com/melodix/music/NativeHomePaintRunnable.smali');
 assert.match(home,/AppSingleton;->t:Ljava\/lang\/ref\/WeakReference;[\s\S]*?NativeHomePaintRunnable;-><init>/);
 assert.match(runnable,/"home"[\s\S]*?postNativeUiData/);
});
