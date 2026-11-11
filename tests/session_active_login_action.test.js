'use strict';
// Executes the actual session-action Smali branches with view doubles, not Android.
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const read = path => fs.readFileSync(path, 'utf8');
const src = read('smali/com/melodix/music/NativeSessionSurface.smali');
function decision(state, loginActive) {
  const begin = src.indexOf('    const-string v3, "sessionAction"');
  const end = src.indexOf('    :action_done', begin);
  assert.ok(begin >= 0 && end > begin);
  const code=src.slice(begin,end).split('\n').map(s=>s.trim());
  const labels=Object.fromEntries(code.map((s,i)=>[s,i]));
  labels[':action_done']=code.length;
  const button={visible:false, text:null, action:null};
  const r={p0:{},v0:{},v1:state,v2:loginActive?1:0}; let result;
  for(let pc=0, steps=0;pc<code.length && steps++<100;pc++){
    const line=code[pc]; let m;
    if(!line || /^[.#:]/.test(line))continue;
    if((m=line.match(/^const-string (\w+), (.*)$/))){r[m[1]]=JSON.parse(m[2]);continue;}
    if((m=line.match(/^const\/4 (\w+), (.*)$/))){r[m[1]]=Number(m[2]);continue;}
    if((m=line.match(/^move-result-object (\w+)$/))){r[m[1]]=result;continue;}
    if((m=line.match(/^if-(eqz|nez) (\w+), (:\w+)$/))){if(m[1]==='eqz'?!r[m[2]]:!!r[m[2]])pc=labels[m[3]];continue;}
    if((m=line.match(/^if-(eq|ne) (\w+), (\w+), (:\w+)$/))){if((r[m[2]]===r[m[3]])===(m[1]==='eq'))pc=labels[m[4]];continue;}
    if((m=line.match(/^goto (:\w+)$/))){pc=labels[m[1]];continue;}
    if((m=line.match(/^new-instance (\w+),/))){r[m[1]]={};continue;}
    if((m=line.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))){
      const a=m[1].split(', ').map(k=>r[k]), call=m[2];
      if(call.includes('Surface;->text')) result=button;
      else if(call.includes('->setText')) a[0].text=a[1];
      else if(call.includes('->setVisibility')) a[0].visible=a[1]===0;
      else if(call.includes('SurfaceAction;-><init>')) a[0].action=a[2];
      else if(call.includes('->setOnClickListener')) a[0].action=a[1].action;
      else assert.fail('unknown call '+call);
      continue;
    }
    assert.fail('unknown opcode '+line);
  }
  return button;
}
test('no retry or login action is exposed over an active official login, including error states',()=>{
  for(const state of [0,1,2,4]) {
    const b=decision(state,true);
    assert.deepEqual(b,{visible:false,text:null,action:null},'state '+state);
  }
});
test('ordinary no-login retry and login actions are unchanged',()=>{
  for(const state of [2,4])assert.deepEqual(decision(state,false),{visible:true,text:'Réessayer',action:0});
  assert.deepEqual(decision(1,false),{visible:true,text:'Se connecter à Spotify',action:1});
  assert.deepEqual(decision(0,false),{visible:false,text:null,action:null});
});
test('the real login header defaults action to gone and preview still contains its separate demo entry',()=>{
  const xml=read('res/layout/native_session_login_header.xml');
  assert.match(xml,/id="@\+id\/sessionAction"[^>]*visibility="gone"/);
  const prep=read('scripts/prepare_demo_preview.py');
  assert.match(prep,/native_session_login_header\.xml/);
  assert.match(prep,/onPreviewDemoClick/);
  const action=read('smali/com/melodix/music/NativeSessionSurfaceAction.smali');
  assert.match(action,/->hasCookie\(\)Z[\s\S]*?->verify\(Lcom\/melodix\/music\/MainActivity;\)V/);
  assert.match(read('smali/com/melodix/music/NativeSessionGate.smali'),/begin\(Lcom\/melodix\/music\/MainActivity;\)V[\s\S]*?sput-boolean v1, Lcom\/melodix\/music\/NativeSessionGate;->loginActive:Z/);
});
