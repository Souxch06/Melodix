'use strict';
// Executes the real listener control flow using Android/dialog doubles.
// This is not a test of Spotify or Android UI rendering.
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const src=fs.readFileSync('smali/com/melodix/music/NativeSessionSurfaceAction.smali','utf8');
function body(signature){const i=src.indexOf(signature);assert.ok(i>=0,signature);return src.slice(i,src.indexOf('.end method',i)).split('\n').map(s=>s.trim());}
function harness(options={}) {
 const activity={finishing:false,destroyed:false,nativeReconnectPending:false},listener={activity:{referent:activity},action:2,generation:7};
 Object.assign(activity,options.activity||{});if(options.missing)listener.activity.referent=null;
 const env={events:[],dialog:null,cookie:true,generation:7};
 function run(signature,p1,p2,target=listener){const code=body(signature),labels=Object.fromEntries(code.map((x,i)=>[x,i])),r={p0:target,p1,p2};let result;
  for(let pc=0,n=0;pc<code.length&&n++<250;pc++){const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
   if((m=l.match(/^const-string (\w+), (.*)$/))){r[m[1]]=JSON.parse(m[2]);continue;}
   if((m=l.match(/^const\/4 (\w+), (.*)$/))){r[m[1]]=m[2].startsWith('-0x')?-parseInt(m[2].slice(1),16):Number(m[2]);continue;}
   if((m=l.match(/^sget (\w+), .*NativeSessionGate;->generation:I$/))){r[m[1]]=env.generation;continue;}
   if((m=l.match(/^iget(?:-boolean|-object)? (\w+), (\w+), .*;->(\w+):/))){r[m[1]]=r[m[2]][m[3]];continue;}
   if((m=l.match(/^move-result(?:-object)? (\w+)$/))){r[m[1]]=result;continue;}
   if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
   if((m=l.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
   if((m=l.match(/^goto (:\w+)$/))){pc=labels[m[1]];continue;}
   if((m=l.match(/^new-instance (\w+), (\S+)$/))){r[m[1]]={type:m[2]};continue;}
   if(l.startsWith('check-cast '))continue;
   if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){const a=m[1]?m[1].split(', ').map(x=>r[x]):[],c=m[2];result=undefined;
    if(c.includes('Reference;->get'))result=a[0].referent;
    else if(c.includes('Activity;->isFinishing'))result=a[0].finishing;
    else if(c.includes('Activity;->isDestroyed'))result=a[0].destroyed;
    else if(c.includes('performHapticFeedback')){}
    else if(c.includes('AlertDialog$Builder;-><init>'))a[0].activity=a[1];
    else if(c.includes('NativeSessionSurfaceAction;-><init>'))Object.assign(a[0],{activity:{referent:a[1]},action:a[2],generation:env.generation});
    else if(c.includes('AlertDialog$Builder;->setTitle')){a[0].title=a[1];result=a[0];}
    else if(c.includes('AlertDialog$Builder;->setMessage')){a[0].message=a[1];result=a[0];}
    else if(c.includes('AlertDialog$Builder;->setPositiveButton')){a[0].positive=a[1];a[0].callback=a[2];result=a[0];}
    else if(c.includes('AlertDialog$Builder;->setNegativeButton')){a[0].negative=a[1];result=a[0];}
    else if(c.includes('AlertDialog$Builder;->show')){env.dialog=a[0];env.events.push('dialog');result={};}
    else if(c.includes('NativeSessionReconnect;->start'))env.events.push('reconnect');
    else if(c.includes('NativeSessionRecovery;->hasCookie'))result=env.cookie;
    else if(c.includes('NativeSessionRecovery;->verify'))env.events.push('verify');
    else if(c.includes('->openSpotifyLogin'))env.events.push('login');
    else if(c.includes('SurfaceExtras;->toggle'))env.events.push('toggle');
    else if(c.includes('SurfaceExtras;->copy'))env.events.push('copy');
    else assert.fail('unknown '+c);continue;
   }
   if(l==='return-void')return;
   assert.fail('unknown opcode '+l);
  }assert.fail('no return');
 }
 return {activity,listener,env,viewClick:()=>run('.method public final onClick(Landroid/view/View;)V',{}),dialogClick:(which,target=listener)=>run('.method public final onClick(Landroid/content/DialogInterface;I)V',{},which,target)};
}
test('reconnect requests explicit confirmation before any destructive action',()=>{
 const f=harness();f.viewClick();assert.deepEqual(f.env.events,['dialog']);
 assert.match(f.env.dialog.message,/effac/i);assert.match(f.env.dialog.message,/ne garantit pas/i);
 assert.match(f.env.dialog.positive,/effacer/i);assert.match(f.env.dialog.negative,/annuler/i);
 assert.notEqual(f.env.dialog.callback,f.listener);
 const callback=f.env.dialog.callback;
 f.dialogClick(-2,callback);assert.deepEqual(f.env.events,['dialog'],'cancellation cannot clear anything');
 f.dialogClick(-1,callback);assert.deepEqual(f.env.events,['dialog','reconnect'],'only explicit confirmation starts existing guarded flow');
});
test('stale, destroyed, pending, unrelated actions and non-positive buttons cannot clear',()=>{
 for(const opts of [{missing:true},{activity:{finishing:true}},{activity:{destroyed:true}},{activity:{nativeReconnectPending:true}}]){
  const f=harness(opts);f.dialogClick(-1);assert.deepEqual(f.env.events,[],JSON.stringify(opts));
 }
 const f=harness();f.listener.action=1;f.dialogClick(-1);assert.deepEqual(f.env.events,[]);
 const stale=harness();stale.viewClick();const old=stale.env.dialog.callback;stale.env.generation++;stale.dialogClick(-1,old);assert.deepEqual(stale.env.events,['dialog'],'old confirmation must not erase a newer session');
 for(const which of [0,-2,-3]){const q=harness();q.dialogClick(which);assert.deepEqual(q.env.events,[]);}
});
test('other session actions retain their non-destructive routing',()=>{
 for(const [kind,event] of [[0,'verify'],[1,'login'],[3,'toggle'],[4,'copy']]){const f=harness();f.listener.action=kind;f.viewClick();assert.deepEqual(f.env.events,[event]);}
});
test('screen no longer suggests another destructive login as the default remedy',()=>{
 const surface=fs.readFileSync('smali/com/melodix/music/NativeSessionSurface.smali','utf8');
 const a=surface.indexOf('    :expired_labels'),b=surface.indexOf('    :labels',a);
 assert.match(surface.slice(a,b),/Réessaie sans effacer/);
});

test('the existing reconnect guard itself permits only states 2 and 4 outside interactive login',()=>{
 const reconnect=fs.readFileSync('smali/com/melodix/music/NativeSessionReconnect.smali','utf8');
 const from=reconnect.indexOf('.method public static allowed()Z'),end=reconnect.indexOf('.end method',from);
 assert.ok(from>=0&&end>from);const lines=reconnect.slice(from,end).split('\n').map(s=>s.trim());
 const labels=Object.fromEntries(lines.map((s,i)=>[s,i]));
 function allowed(state,loginActive){const r={};for(let pc=0,steps=0;pc<lines.length&&steps++<100;pc++){
  const l=lines[pc];let m;if(!l||/^[.#:]/.test(l))continue;
  if((m=l.match(/^sget(?:-boolean)? (\w+), .*NativeSessionGate;->(state|loginActive):/))){r[m[1]]=m[2]==='state'?state:loginActive;continue;}
  if((m=l.match(/^const\/4 (\w+), (.*)$/))){r[m[1]]=Number(m[2]);continue;}
  if((m=l.match(/^if-(eqz|nez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
  if((m=l.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
  if((m=l.match(/^return (\w+)$/)))return !!r[m[1]];
  assert.fail('unknown guard opcode '+l);
 }assert.fail('no guard return');}
 for(const state of [0,1,2,3,4,5])for(const active of [0,1])assert.equal(allowed(state,active),!active&&[2,4].includes(state),`state=${state}, login=${active}`);
 const start=reconnect.slice(reconnect.indexOf('.method public static start('),from);
 assert.ok(start.indexOf('->allowed()Z')>=0&&start.indexOf('->allowed()Z')<start.indexOf('->deleteAllData()V'));
});
