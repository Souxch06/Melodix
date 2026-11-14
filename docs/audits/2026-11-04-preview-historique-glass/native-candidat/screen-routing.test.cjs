// Interprets selected actual Smali instructions with synthetic objects. No Android runtime.
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {run}=require('../native-routing-characterization.test.cjs');
const {dispatch}=require('../native-dispatch-characterization.test.cjs');
const root=process.env.MELODIX_SMALI_ROOT || process.env.MELODIX_HISTORICAL_ROOT;
const source=fs.readFileSync(path.join(root,'smali/com/melodix/music/MainActivity.smali'),'utf8');
function method(name) {
 const start=source.indexOf('.method public final '+name+'('),end=source.indexOf('.end method',start);
 assert.ok(start>=0 && end>start);return source.slice(start,end);
}
const rows='[{"title":"Fictive","uri":"spotify:playlist:fake"}]';
for (const screen of ['search','library','detail','settings','player']) {
 test(`late Home payload caches data without switching ${screen}`,()=>{
   const r=run('home',rows,{nativeCurrentScreen:screen});
   assert.equal(r.state.nativeHomeJson,rows);assert.equal(r.state.nativeCurrentScreen,screen);
   assert.equal(r.renders.length,0);assert.equal(r.screens.length,0);
 });
}
test('Home payload paints while Home is visible',()=>{
 const r=run('home',rows,{nativeCurrentScreen:'home'});
 assert.equal(r.state.nativeHomeJson,rows);assert.equal(r.renders.length,1);assert.equal(r.renders[0].payload,rows);
});
test('initial Home payload also paints with no current screen',()=>{
 const r=run('home',rows,{});assert.equal(r.renders.length,1);assert.equal(r.state.nativeCurrentScreen,'home');
});
test('empty Home reuses cache only while on Home',()=>{
 let r=run('home','[]',{nativeCurrentScreen:'home',nativeHomeJson:rows});
 assert.equal(r.renders[0].payload,rows);
 r=run('home','[]',{nativeCurrentScreen:'library',nativeHomeJson:rows});
 assert.equal(r.renders.length,0);assert.equal(r.state.nativeHomeJson,rows);
});
test('matching library playlists are cached; albums are not cached as playlists',()=>{
 let r=run('media:playlists',rows,{nativeCurrentScreen:'library',nativeExpectedId:'playlists'});
 assert.equal(r.renders[0].payload,rows);assert.equal(r.state.nativeLibraryJson,rows);
 r=run('media:albums',rows,{nativeCurrentScreen:'library',nativeExpectedId:'albums'});
 assert.equal(r.renders[0].payload,rows);assert.equal(r.state.nativeLibraryJson,undefined);
});
test('stale or off-screen library results cannot paint or populate cache',()=>{
 for(const state of [{nativeCurrentScreen:'library',nativeExpectedId:'albums'},{nativeCurrentScreen:'search',nativeExpectedId:'playlists'}]) {
  const r=run('media:playlists',rows,state);assert.equal(r.renders.length,0);assert.equal(r.state.nativeLibraryJson,undefined);
 }
});
test('matching search result renders only on the search screen',()=>{
 let r=run('search:query',rows,{nativeCurrentScreen:'search',nativeExpectedSearch:'query'});assert.equal(r.renders.length,1);
 r=run('search:query',rows,{nativeCurrentScreen:'library',nativeExpectedSearch:'query'});assert.equal(r.renders.length,0);
 r=run('search:old',rows,{nativeCurrentScreen:'search',nativeExpectedSearch:'new'});assert.equal(r.renders.length,0);
});
test('bridge dispatch uses live weak activity before falling back to context',()=>{
 const a={kind:'activity'},other={kind:'activity'},app={kind:'application'};
 assert.equal(dispatch(a,app).length,1);assert.equal(dispatch(a,app)[0].activity,a);
 assert.equal(dispatch(a,other)[0].activity,a);assert.equal(dispatch(null,other)[0].activity,other);
 assert.equal(dispatch(null,app).length,0);
});
test('empty non-Home rows replace the stale view, Home fallback remains',()=>{
 const m=method('renderNativeRows');
 assert.match(m, /NativeHomeFeed;->paint[\s\S]*?"Accueil"[\s\S]*?invoke-virtual \{v2\}, Landroid\/widget\/LinearLayout;->removeAllViews/);
});
test('search grid hides old rows and category/search branches allow nonempty input',()=>{
 const m=method('onNativeSearchClick');assert.match(m,/0x7f090239[\s\S]+?setVisibility\(I\)V[\s\S]+?0x7f09024f/);
 assert.match(method('performNativeLiveSearch'),/isEmpty\(\)Z\s+move-result v1\s+if-nez v1/);
 assert.match(method('onNativeSearchSubmit'),/isEmpty\(\)Z\s+move-result v2\s+if-nez v2/);
 assert.match(method('onNativeGenreClick'),/isEmpty\(\)Z\s+move-result v1\s+if-nez v1/);
});
test('tabs and category chips check null and type before casting',()=>{
 assert.match(method('styleNativeTab'),/instance-of v3, v1, Landroid\/widget\/TextView;\s+if-eqz v3/);
 assert.match(method('styleNativeLibraryChips'),/getChildAt\(I\)Landroid\/view\/View;\s+move-result-object v3\s+if-eqz v3[\s\S]+?getTag\(\)Ljava\/lang\/Object;\s+move-result-object v4\s+if-eqz v4/);
});
test('library does not treat currently visible Home JSON as library cache',()=>{
 const m=method('onNativeLibraryClick');assert.doesNotMatch(m,/nativeCurrentJson/);
 assert.match(m,/nativeExpectedId[\s\S]+?"\[\]"[\s\S]+?renderNativeRows[\s\S]+?nativeLibraryJson/);
});
test('typing changes the native expected query before debounced dispatch',()=>{
 const watcher=fs.readFileSync(path.join(root,'smali/com/melodix/music/NativeSearchWatcher.smali'),'utf8');
 const start=watcher.indexOf('.method public final afterTextChanged('),end=watcher.indexOf('.end method',start);
 assert.match(watcher.slice(start,end),/trim\(\)Ljava\/lang\/String;[\s\S]+?updateNativeSearchDraft[\s\S]+?length\(\)I[\s\S]+?postDelayed/);
 assert.match(method('updateNativeSearchDraft'),/"search"[\s\S]+?nativeExpectedSearch/);
 for (const draft of ['new','']) {
  const r=run('search:old',rows,{nativeCurrentScreen:'search',nativeExpectedSearch:draft});assert.equal(r.renders.length,0);
 }
});
