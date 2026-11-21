// Small Smali interpreter for the actual historical applyNativeUiData method.
// Characterization, not an Android integration test. All inputs are fictitious.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const root=process.env.MELODIX_SMALI_ROOT || process.env.MELODIX_HISTORICAL_ROOT;
if (!root) throw new Error('MELODIX_SMALI_ROOT or MELODIX_HISTORICAL_ROOT required');
const src=fs.readFileSync(path.join(root,'smali/com/melodix/music/MainActivity.smali'),'utf8');
const begin=src.indexOf('.method public final applyNativeUiData('),end=src.indexOf('.end method',begin);
assert.ok(begin>=0&&end>begin);
const lines=src.slice(begin,end).split('\n').map(s=>s.trim()).filter(s=>s&&!s.startsWith('.')&&!s.startsWith('#'));
const labels=new Map(lines.map((v,i)=>[v,i]).filter(([v])=>v.startsWith(':')));

function run(channel,payload,initial={}) {
    const state={nativeCurrentScreen:null,nativeCurrentTitle:null,nativeExpectedId:null,nativeExpectedSearch:null,nativeHomeJson:null,nativeListBlob:null,...initial};
    const regs={p0:state,p1:channel,p2:payload};
    const renders=[],screens=[],actions=[];
    let result,steps=0;
    const value=x=>{assert.ok(x in regs,`uninitialized ${x}`);return regs[x];};
    const isZero=x=>x===null||x===0; // Empty Java strings are references, not null.
    for(let pc=0;pc<lines.length;pc++) {
        if(++steps>1000) throw new Error('instruction limit');
        const line=lines[pc]; let m;
        if(line.startsWith(':')) continue;
        if(line==='return-void') break;
        if((m=line.match(/^goto(?:\/\d+)? :(\w+)$/))) {assert.ok(labels.has(':'+m[1]));pc=labels.get(':'+m[1]);continue;}
        if((m=line.match(/^if-(eqz|nez) ([vp]\d+), :(\w+)$/))) {
            const branch=m[1]==='eqz'?isZero(value(m[2])):!isZero(value(m[2]));
            if(branch){assert.ok(labels.has(':'+m[3]));pc=labels.get(':'+m[3]);}
            continue;
        }
        if((m=line.match(/^if-(le|gt) ([vp]\d+), ([vp]\d+), :(\w+)$/))) {
            const branch=m[1]==='le'?value(m[2])<=value(m[3]):value(m[2])>value(m[3]);
            if(branch){assert.ok(labels.has(':'+m[4]));pc=labels.get(':'+m[4]);}
            continue;
        }
        if((m=line.match(/^const-string(?:\/jumbo)? ([vp]\d+), "(.*)"$/))) {regs[m[1]]=m[2];continue;}
        if((m=line.match(/^const(?:\/4|\/16)? ([vp]\d+), (0x[0-9a-f]+|-?\d+)$/))) {regs[m[1]]=Number(m[2]);continue;}
        if((m=line.match(/^move-result(?:-object)? ([vp]\d+)$/))) {regs[m[1]]=result;continue;}
        if((m=line.match(/^move-object(?:\/from16)? ([vp]\d+), ([vp]\d+)$/))) {regs[m[1]]=value(m[2]);continue;}
        if((m=line.match(/^iget-object ([vp]\d+), p0, .*?->(\w+):/))) {regs[m[1]]=state[m[2]]??null;continue;}
        if((m=line.match(/^iput-object ([vp]\d+), p0, .*?->(\w+):/))) {state[m[2]]=value(m[1]);continue;}
        if(line.startsWith('check-cast ')) continue;
        if((m=line.match(/^invoke-virtual \{([^}]+)\}, (.+)$/))) {
            const args=m[1].split(',').map(s=>s.trim()).map(value),target=m[2];
            if(target.includes('Ljava/lang/String;->equals(')) result=args[0]===args[1]?1:0;
            else if(target.includes('Ljava/lang/String;->startsWith(')) result=args[0].startsWith(args[1])?1:0;
            else if(target.includes('Ljava/lang/String;->isEmpty(')) result=args[0].length===0?1:0;
            else if(target.includes('Ljava/lang/String;->length(')) result=args[0].length;
            else if(target.includes('Ljava/lang/String;->substring(')) result=args[0].slice(args[1]);
            else if(target.includes('->renderNativeRows(')) renders.push({title:args[1],payload:args[2]});
            else if(target.includes('->setNativeScreen(')) {state.nativeCurrentScreen=args[1];screens.push(args[1]);}
            else if(target.includes('->findViewById(')) result=null;
            else if(target.includes('->applyNativeListText(')) actions.push('list-text');
            else if(target.includes('->setNativeProfileImage(')) actions.push('profile-image');
            else if(target.includes('->updateNativePlayer(')) actions.push('player');
            else if(target.includes('->runNativeFunction(')) actions.push('run-function');
            else throw new Error(`Unhandled invocation: ${line}`);
            continue;
        }
        throw new Error(`Unhandled instruction: ${line}`);
    }
    return {state,renders,screens,actions};
}
module.exports={run};
if (require.main === module) {
const rows='[{"title":"Fictive","uri":"spotify:playlist:fake1"}]';

test('matching library response renders when current screen and expected ID agree',()=>{
    const r=run('media:playlists',rows,{nativeExpectedId:'playlists',nativeCurrentScreen:'library',nativeCurrentTitle:'Bibliothèque'});
    assert.equal(r.renders.length,1);assert.equal(r.renders[0].payload,rows);assert.equal(r.renders[0].title,'Bibliothèque');
});
test('old media response is ignored after expected ID changes',()=>{
    const r=run('media:playlists',rows,{nativeExpectedId:'albums',nativeCurrentScreen:'library'});
    assert.equal(r.renders.length,0);
});
test('media response is ignored when current screen is home',()=>{
    const r=run('media:playlists',rows,{nativeExpectedId:'playlists',nativeCurrentScreen:'home'});
    assert.equal(r.renders.length,0);
});
test('matching playlist detail response renders for the active detail',()=>{
    const r=run('media:spotify:playlist:fake1',rows,{nativeExpectedId:'spotify:playlist:fake1',nativeCurrentScreen:'detail'});
    assert.equal(r.renders.length,1);assert.equal(r.renders[0].title,'Playlist');
});
test('delayed Home payload can repaint and switch from library to home',()=>{
    const r=run('home',rows,{nativeExpectedId:'playlists',nativeCurrentScreen:'library'});
    assert.equal(r.renders.length,1);assert.equal(r.state.nativeCurrentScreen,'home');
    assert.equal(r.state.nativeHomeJson,rows);
});
test('empty Home payload reuses previous JSON and switches back to home',()=>{
    const r=run('home','[]',{nativeHomeJson:rows,nativeCurrentScreen:'library'});
    assert.equal(r.renders.length,1);assert.equal(r.renders[0].payload,rows);assert.equal(r.state.nativeCurrentScreen,'home');
});
test('empty Home without cache is ignored',()=>{
    const r=run('home','[]',{nativeCurrentScreen:'library'});
    assert.equal(r.renders.length,0);assert.equal(r.state.nativeCurrentScreen,'library');
});
test('a non-empty detail title is rejected by historical isEmpty branch',()=>{
    const r=run('screen-title','Playlist fictive',{nativeCurrentScreen:'detail',nativeCurrentTitle:'Ancien'});
    assert.equal(r.state.nativeCurrentTitle,'Ancien');
});
test('an empty detail title passes that same branch and replaces current title',()=>{
    const r=run('screen-title','',{nativeCurrentScreen:'detail',nativeCurrentTitle:'Ancien'});
    assert.equal(r.state.nativeCurrentTitle,'');
});
test('detail DOM response does not paint while library is active',()=>{
    const r=run('detail',rows,{nativeCurrentScreen:'library'});assert.equal(r.renders.length,0);
});

}
