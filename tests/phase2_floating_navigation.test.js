'use strict';
const {test}=require('node:test');const assert=require('node:assert/strict');const fs=require('node:fs');const {JSDOM}=require('jsdom');
const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
const paths=['res/layout/activity_main.xml','res/layout-land/activity_main.xml','res/layout-sw600dp/activity_main.xml','res/layout-sw600dp-land/activity_main.xml'];
const get=(d,id)=>Array.from(d.getElementsByTagName('*')).find(n=>n.getAttribute('android:id')==='@id/'+id);
test('native navigation floats within the reserved shell flow on every form factor',()=>{
 for(const path of paths){
  const document=new JSDOM(fs.readFileSync(path,'utf8'),{contentType:'text/xml'}).window.document;
  const root=get(document,'nativeRoot'),bar=get(document,'nativeTabBar'),mini=get(document,'nativeMiniPlayerContainer');
  assert.ok(root&&bar&&mini,path);assert.equal(bar.parentElement,root);assert.equal(mini.parentElement,root);
  assert.ok([...root.children].indexOf(mini)<[...root.children].indexOf(bar));
  assert.equal(bar.getAttribute('android:layout_gravity'),'center_horizontal');
  for(const side of ['Left','Right'])assert.equal(bar.getAttribute('android:layout_margin'+side),'@dimen/mel_tab_side_inset');
  assert.equal(bar.getAttribute('android:layout_marginBottom'),'@dimen/mel_tab_bottom_lift');
  assert.equal(bar.getAttribute('android:layout_width'),path.includes('sw600dp')?'@dimen/mel_tab_tablet_max_width':'fill_parent');
  for(const [id,click] of [['nativeHomeTab','onNativeHomeClick'],['nativeSearchTab','onNativeSearchClick'],['nativeLibraryTab','onNativeLibraryClick']]){
   const tab=get(document,id);assert.equal(tab.parentElement,bar);assert.equal(tab.getAttribute('android:onClick'),click);
   assert.equal(tab.getAttribute('android:clickable'),'true');assert.equal(tab.getAttribute('android:focusable'),'true');assert.ok(tab.getAttribute('android:contentDescription'));
  }
 }
});
test('navigation dimensions preserve touch targets and cap tablet width without constraining small phones',()=>{
 const phone=loadDimens(PHONE),tablet=loadDimens(TABLET),v=(n,d)=>resolveSize('@dimen/'+n,d);
 for(const dims of [phone,tablet]){
  assert.ok(v('mel_tab_height',dims)>=44);assert.ok(v('mel_tab_bar_height',dims)>=v('mel_tab_height',dims));
  assert.equal(v('mel_liquid_inset',dims),4);
  assert.ok(v('mel_tab_bar_height',dims)-2*v('mel_liquid_inset',dims)>=44,'actual padded tab hit target remains at least 44dp');
  assert.ok(v('mel_tab_side_inset',dims)>=12);assert.ok(v('mel_tab_bottom_lift',dims)>0);
  assert.ok((320-2*v('mel_tab_side_inset',dims))/3>=44);
 }
 assert.ok(v('mel_tab_tablet_max_width',tablet)+2*v('mel_tab_side_inset',tablet)<=600);
});
test('floating bar has a fully rounded palette-driven fallback, selected state and unchanged handlers',()=>{
 const shape=fs.readFileSync('res/drawable/native_tabbar_glass.xml','utf8');
 assert.match(shape,/corners android:radius="@dimen\/mel_tab_radius"/);assert.match(shape,/android:width="1dp" android:color="@color\/mel_glass_edge"/);
 assert.match(shape,/@color\/mel_glass_surface/);assert.match(shape,/@color\/mel_glass_reflection/);assert.match(shape,/@color\/mel_glass_clear/);assert.doesNotMatch(shape,/backdrop|RenderEffect|https?:\/\/(?!schemas.android.com)/);
 const activity=fs.readFileSync('smali/com/melodix/music/MainActivity.smali','utf8');
 const a=activity.indexOf('.method public final styleNativeTab('),b=activity.indexOf('.end method',a),method=activity.slice(a,b);
 assert.match(method,/String;->equals\(Ljava\/lang\/Object;\)Z[\s\S]*?setSelected\(Z\)V/);
 assert.doesNotMatch(method,/loadUrl|CookieManager|NativeSessionEvidence|->setNativeScreen/);
});
