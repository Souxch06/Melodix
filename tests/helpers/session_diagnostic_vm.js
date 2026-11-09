'use strict';
// Executes actual diagnostic smali; Android cookie sampling is replaced with a synthetic digest.
const fs=require('node:fs'),assert=require('node:assert/strict');
function smaliVm(className){
 const src=fs.readFileSync('smali/com/melodix/music/'+className+'.smali','utf8');
 const rows=new Map(),aliases=new Map(),fields={rows,aliases,count:0,fingerprint:null};let cookie='synthetic-A';
 function run(name,...args){
  if(name==='current')return cookie;
  const match=new RegExp('^\\.method[^\\n]* '+name+'\\(','m').exec(src);assert.ok(match,name);
  const code=src.slice(match.index,src.indexOf('.end method',match.index)).split('\n').map(s=>s.trim()),labels=Object.fromEntries(code.map((s,i)=>[s,i]));
  const r=Object.fromEntries(args.map((a,i)=>['p'+i,a]));let result;
  for(let pc=0,steps=0;pc<code.length&&steps++<20000;pc++){
   const l=code[pc];let m;if(!l||/^[.#:]/.test(l))continue;
   if((m=l.match(/^const-string (\w+), (.*)$/))){r[m[1]]=JSON.parse(m[2]);continue;}
   if((m=l.match(/^const(?:\/4|\/16)? (\w+), (.*)$/))){r[m[1]]=Number(m[2]);continue;}
   if((m=l.match(/^new-instance (\w+), (.*)$/))){r[m[1]]={type:m[2],data:{},text:''};continue;}
   if((m=l.match(/^sget(?:-object)? (\w+), .*->(\w+):/))){r[m[1]]=fields[m[2]];continue;}
   if((m=l.match(/^sput(?:-object)? (\w+), .*->(\w+):/))){fields[m[2]]=r[m[1]];continue;}
   if((m=l.match(/^move-result(?:-object)? (\w+)$/))){r[m[1]]=result;continue;}
   if((m=l.match(/^or-int\/2addr (\w+), (\w+)$/))){r[m[1]]=Number(!!r[m[1]]||!!r[m[2]]);continue;}
   if((m=l.match(/^add-int\/lit8 (\w+), (\w+), (.*)$/))){r[m[1]]=r[m[2]]+Number(m[3]);continue;}
   if(l.startsWith('check-cast '))continue;
   if((m=l.match(/^if-(eqz|nez|ltz|lez) (\w+), (:\w+)$/))){const v=r[m[2]];if(m[1]==='eqz'?!v:m[1]==='nez'?!!v:m[1]==='ltz'?v<0:v<=0)pc=labels[m[3]];continue;}
   if((m=l.match(/^if-(gt|ge|le|lt) (\w+), (\w+), (:\w+)$/))){const a=r[m[2]],b=r[m[3]];if(m[1]==='gt'?a>b:m[1]==='ge'?a>=b:m[1]==='lt'?a<b:a<=b)pc=labels[m[4]];continue;}
   if((m=l.match(/^goto (:\w+)$/))){pc=labels[m[1]];continue;}
   if((m=l.match(/^return(?:-object)? (\w+)$/)))return r[m[1]];
   if(l==='return-void')return;
   if((m=l.match(/^invoke-\S+ \{([^}]*)\}, (L[^;]+;)->([^ (]+)\((.*)$/))){
    const a=m[1]?m[1].split(', ').map(k=>r[k]):[],cls=m[2],method=m[3];
    if(cls.includes(className)){result=run(method,...a);continue;}
    if(cls==='Lorg/json/JSONObject;'){
     const obj=a[0];assert.ok(obj,'json object');if(method==='<init>'){obj.data=a.length>1?JSON.parse(a[1]):{};result=undefined;}
     else if(method==='has')result=Object.hasOwn(obj.data,a[1]);
     else if(method==='optInt'){const n=Number(obj.data[a[1]]);result=Number.isFinite(n)?Math.trunc(n):0;}
     else if(method==='optBoolean')result=obj.data[a[1]]===true||obj.data[a[1]]===1;
     else if(method==='optString')result=obj.data[a[1]]==null?'':String(obj.data[a[1]]);
     else if(method==='put'){obj.data[a[1]]=a[2];result=obj;}
     else if(method==='toString')result=JSON.stringify(obj.data);else assert.fail(method);
    }else if(cls==='Ljava/lang/StringBuilder;'){
     if(method==='<init>')a[0].text='';else if(method==='append'){a[0].text+=String(a[1]);result=a[0];}else if(method==='toString')result=a[0].text;else assert.fail(method);
    }else if(cls==='Ljava/lang/String;'){
     if(method==='length')result=a[0].length;else if(method==='equals')result=a[0]===a[1];else if(method==='matches')result=new RegExp('^(?:'+a[1]+')$').test(a[0]);else if(method==='contains')result=a[0].includes(a[1]);else if(method==='endsWith')result=a[0].endsWith(a[1]);else if(method==='concat')result=a[0]+a[1];else assert.fail(method);
    }else if(cls==='Ljava/lang/Integer;')result=String(a[0]);
    else if(cls.includes('Map$Entry'))result=method==='getKey'?a[0][0]:a[0][1];
    else if(/HashMap;|LinkedHashMap;/.test(cls)){
     if(method==='get')result=a[0].get(a[1])||null;else if(method==='put'){a[0].set(a[1],a[2]);result=null;}else if(method==='size')result=a[0].size;else if(method==='clear')a[0].clear();else if(method==='keySet')result={map:a[0],list:[...a[0].keys()]};else if(method==='entrySet')result={map:a[0],list:[...a[0].entries()]};else assert.fail(method);
    }else if(cls==='Ljava/util/Set;')result={...a[0],index:0,last:undefined};
    else if(cls==='Ljava/util/Iterator;'){
     if(method==='hasNext')result=a[0].index<a[0].list.length;
     else if(method==='next'){result=a[0].list[a[0].index++];a[0].last=result;}
     else if(method==='remove')a[0].map.delete(a[0].last);else assert.fail(method);
    }else assert.fail(cls+' '+method);
    continue;
   }
   assert.fail('unsupported '+name+': '+l);
  }assert.fail('did not terminate '+name);
 }
 return {rows,aliases,fields,run,record:o=>run('record',JSON.stringify(o)),text:()=>run('appendTo',''),cookie:v=>{cookie=v;}};
}
module.exports={diagnosticVm:()=>smaliVm('NativeSessionAttemptDiagnostic'),evidenceVm:()=>smaliVm('NativeSessionEvidence')};
