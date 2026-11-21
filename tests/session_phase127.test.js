'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
const {diagnosticVm}=require('./helpers/session_diagnostic_vm');
test('actual native diagnostics retain HTTPs/completion/source across empty and reason-only updates',()=>{
 const d=diagnosticVm();d.record({generation:1,attempt:1,source:'shell-update',completed:true,apiHttp:400,fallbackHttp:403,libraryHttp:401,tokenResult:'refused'});
 d.record({generation:1,attempt:1,reason:'rejet=generation-perimee'});d.record({generation:1,attempt:1,completed:false,apiHttp:null,fallbackHttp:0,libraryHttp:null,tokenResult:'unknown'});
 const t=d.text();assert.match(t,/token API=400 · repli=403 · bibliothèque=401 · terminée=oui · cookie=c1/);assert.match(t,/source=shell-update · token=refusé/);assert.match(t,/rejet=generation-perimee/);assert.equal(d.rows.size,1);
});
test('actual native relance rows never fabricate a network attempt and preserve started fact after late block',()=>{
 const d=diagnosticVm();d.record({generation:2,attempt:0,reason:'relance-demandee'});assert.match(d.text(),/démarrage réseau=inconnu/);assert.doesNotMatch(d.text(),/Tentative|terminée=oui/);
 d.record({generation:2,attempt:0,reason:'blocage=dom-auth-required'});assert.match(d.text(),/relance demandée, aucune tentative réseau démarrée/);
 d.record({generation:2,attempt:1,completed:false});assert.doesNotMatch(d.text(),/relance demandée, tentative réseau démarrée/);d.run('started',2,1);d.record({generation:2,attempt:0,reason:'blocage=fonction-js-indisponible'});assert.match(d.text(),/relance demandée, tentative réseau démarrée/);assert.equal(d.rows.size,2);
});
test('native diagnostic aliases change with identity; reasons cannot sample a historical cookie or export secrets',()=>{
 const d=diagnosticVm();d.record({generation:1,attempt:1,completed:false});d.cookie('synthetic-B');d.record({generation:1,attempt:2,completed:false});d.record({generation:1,attempt:3,reason:'rejet=generation-perimee'});
 assert.match(d.text(),/cookie=c1/);assert.match(d.text(),/cookie=c2/);assert.match(d.text(),/Tentative 1\/3.*cookie=inconnu/);assert.doesNotMatch(d.text(),/synthetic|SHA|Bearer/);
 d.record({generation:1,attempt:2,reason:'https://PRIVATE'});assert.doesNotMatch(d.text(),/PRIVATE/);
 for(let i=4;i<40;i++)d.record({generation:1,attempt:i,completed:false});assert.equal(d.rows.size,16);
});
test('native JS availability callback records a closed failure for its original generation',()=>{
 const s=fs.readFileSync('smali/com/melodix/music/NativeSessionRetryDiagnosticCallback.smali','utf8');
 assert.match(s,/->generation:I/);assert.match(s,/blocage=fonction-js-indisponible/);assert.match(s,/->retryFailed/);assert.doesNotMatch(s,/->transition|->begin|->verify|Evidence|sput|loadUrl|removeAllCookies/);
});
test('DOM/429 diagnostic events have attempt 0 and never call proof publication',()=>{
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');const a=s.indexOf('    function publishSessionRelanceDiagnostic('),b=s.indexOf('\n    }',a)+6,notes=[];
 const window={AndBridge:{getSessionGeneration:()=>3,onSessionAttemptDiagnostic:x=>notes.push(JSON.parse(x))}};
 const f=vm.runInNewContext('('+s.slice(a,b)+')',{window,boundedMediaLibraryCount:(x,m)=>Math.min(m,Number(x)||0),readNativeSessionGeneration:()=>3});
 f('native-retry','blocage=attente-429');f('native-retry','blocage=dom-auth-required');f('native-retry','PRIVATE');f('shell-update','blocage=dom-auth-required');assert.equal(notes.length,2);assert.ok(notes.every(n=>n.attempt===0&&!('completed'in n)));
});
test('actual JS finally annotates obsolete attempts before exiting, without publishing session proof',async()=>{
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');const a=s.indexOf('    async function runMediaLibraryCheck('),b=s.indexOf('    // Phase 1 diagnostics only.',a);
 const events=[],window={__sfSpotifyAuthEpoch:3},c={window,mediaLibraryRequestGeneration:2,boundedMediaLibraryCount:(x,m)=>Math.min(m,Number(x)||0),fetchAllLibrary:async()=>[],observeSessionAttempt:(d,k,v)=>{d.sessionObservation[k]=v;events.push(v);},publishSessionAttemptDiagnostic:(d,done)=>events.push(done),publishSessionVerification:()=>assert.fail('obsolete request cannot publish proof')};
 vm.createContext(c);vm.runInContext(s.slice(a,b),c);const d={sessionObservation:{apiHttp:400,fallbackHttp:403,libraryHttp:401}};await c.runMediaLibraryCheck(d,1,2);
 assert.deepEqual(events,['abandon=requete-perimee','abandon=contexte-auth-perime',true]);assert.equal(d.sessionObservation.apiHttp,400);
});
test('actual JS Retry-After path records the block and does not call checkMediaLib',()=>{
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8'),a=s.indexOf('    window.__sfRequestSessionVerification = function (expectedGeneration = 0) {'),b=s.indexOf('\n    };',a)+7,events=[];
 const c={window:{__sfMediaLibError:'http-429',__sfMediaLibRetryAt:Date.now()+60000,AndBridge:{isSessionRetryActive:()=>true}},readNativeSessionGeneration:()=>2,mediaLibraryCheckPromise:null,publishSessionRelanceDiagnostic:(source,reason)=>events.push({source,reason}),checkMediaLib:()=>assert.fail('blocked')};vm.createContext(c);vm.runInContext('let nativeRetryGeneration=0,nativeRetryPromise=null;\n'+s.slice(a,b),c);assert.equal(c.window.__sfRequestSessionVerification(2),false);assert.deepEqual(events,[{source:'native-retry',reason:'blocage=attente-429'}]);
});
