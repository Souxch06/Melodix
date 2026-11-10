'use strict';
const test=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs'),cp=require('node:child_process'),os=require('node:os'),path=require('node:path');
const read=p=>fs.readFileSync(p,'utf8');
test('demo sources do not access session state or network or WebView',()=>{
 for(const n of ['DemoRuntime','DemoSettingsActivity','DemoActivity']){
  const s=read(`demo/src/com/melodix/demo/${n}.java`);
  assert.doesNotMatch(s,/CookieManager|WebStorage|new\s+WebView|android\.webkit\.WebView|https?:\/\/|HttpURLConnection|OkHttp|SpotifyApi|AppSingleton|NativeSessionGate|NativeSessionEvidence/);
 }
});
test('only isolated opt-in build modifies the temporary manifest and session code stays unchanged',()=>{
 const w=read('.github/workflows/preview-apk.yml'), r=read('.github/workflows/release-apk.yml');
 assert.match(w,/demo_build:\s+required: false\s+default: false/);
 assert.match(w,/if \[\[ "\$DEMO_BUILD" == "true" \]\][\s\S]*?\[\[ "\$BUILD_ONLY" == "true" \]\]/);
 assert.match(w,/prepare_demo_preview\.py/);assert.doesNotMatch(r,/demo_build|prepare_demo_preview|demo\/src/);
 assert.doesNotMatch(read('AndroidManifest.xml'),/com\.melodix\.demo/);
 assert.doesNotMatch(read('smali/com/melodix/music/AppSingleton.smali'),/com\/melodix\/demo/);
});
test('temporary injection adds isolated launcher and passive clone without changing proof gate',()=>{
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'melodix-demo-'));try{
  fs.cpSync('AndroidManifest.xml',path.join(dir,'AndroidManifest.xml'));
  const d=path.join(dir,'smali/com/melodix/music');fs.mkdirSync(d,{recursive:true});
  for(const n of ['AppSingleton','NativeSettingsRowFactory'])fs.copyFileSync(`smali/com/melodix/music/${n}.smali`,path.join(d,n+'.smali'));
  cp.execFileSync('python3',['scripts/prepare_demo_preview.py',dir]);
  const manifest=fs.readFileSync(path.join(dir,'AndroidManifest.xml'),'utf8');
  assert.match(manifest,/name="com\.melodix\.demo\.DemoSettingsActivity"[^>]*process=":demo"[^>]*exported="true"/);
  assert.match(manifest,/name="com\.melodix\.demo\.DemoActivity"[^>]*process=":demo"[^>]*exported="false"/);
  const app=fs.readFileSync(path.join(d,'AppSingleton.smali'),'utf8');assert.match(app,/DemoRuntime;->isDemoProcess\(\)Z[\s\S]*?if-nez v0, :updater_done/);
  const clone=fs.readFileSync(path.join(d,'DemoSettingsRowFactory.smali'),'utf8');
  assert.match(clone,/create\(Landroid\/app\/Activity;Lorg\/json\/JSONObject;\)/);assert.match(clone,/native_cover_placeholder/);assert.match(clone,/setTrackResource/);
  assert.doesNotMatch(clone,/NativeRowClickListener|NativeSession|AppSingleton/);
 }finally{fs.rmSync(dir,{recursive:true,force:true});}
});
test('activation requires a long press on the version and demo has local screens only',()=>{
 const entry=read('demo/src/com/melodix/demo/DemoSettingsActivity.java'),ui=read('demo/src/com/melodix/demo/DemoActivity.java');
 assert.match(entry,/version\.setOnLongClickListener[\s\S]*?new Intent\(this,DemoActivity\.class\)/);
 for(const route of ['home','search','library','playlist','settings','player'])assert.ok(ui.includes('"'+route+'"'),route);
 assert.match(ui,/MODE DÉMO/);assert.match(ui,/DemoSettingsRowFactory/);assert.doesNotMatch(ui,/MainActivity|NativeSession/);
});
test('capture workflow uses one exact APK and requires all screens in both profiles before bundling',()=>{
 const w=read('.github/workflows/demo-preview.yml'),s=read('scripts/capture_demo_emulator.py');
 assert.match(w,/demo_build: true/);assert.match(w,/profile: \[phone, tablet\]/);assert.match(w,/needs: \[build, capture\]/);
 assert.match(w,/accueil recherche bibliotheque playlist reglages lecteur mini-lecteur/);
 assert.match(s,/svc','wifi','disable/);assert.match(s,/svc','data','disable/);assert.match(s,/user_rotation',rotation/);
 for(const screen of ['accueil','recherche','bibliotheque','playlist','reglages','lecteur','mini-lecteur'])assert.ok(s.includes(`snap('${screen}'`),screen);
});

test('demo hides the native launch overlay before enabling the native shell',()=>{
 const s=read('demo/src/com/melodix/demo/DemoActivity.java');assert.match(s,/show\("splashOverlay",false\);show\("nativeRoot",true\)/);
});

test('a demo preview cannot build before the exact source passes the unskipped complete suite',()=>{
 const w=read('.github/workflows/demo-preview.yml');
 const suite=w.slice(w.indexOf('  suite:'),w.indexOf('  build:'));
 const build=w.slice(w.indexOf('  build:'),w.indexOf('  capture:'));
 assert.match(suite,/if: inputs\.evidence_run == '0'/);
 assert.match(suite,/ref: \${\{ inputs\.source_ref \}\}/);
 assert.match(suite,/npm ci/);assert.match(suite,/npm test 2>&1 \| tee/);
 assert.match(suite,/# fail 0/);assert.match(suite,/# skipped 0/);
 assert.match(build,/needs: suite/);assert.doesNotMatch(build,/always\(\)/);
});
