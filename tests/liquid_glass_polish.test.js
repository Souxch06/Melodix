'use strict';
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
test('shared glass tokens, gradient and explicit fallback contain no view blur',()=>{
 const colors=read('res/values/colors.xml');
 for(const [name,value] of [['mel_background','#0B0B14'],['mel_glass_surface','#12FFFFFF'],['mel_glass_edge','#24FFFFFF'],['mel_glass_reflection','#2EFFFFFF'],['mel_gradient_start','#7C3AED'],['mel_gradient_end','#DB2777']]) assert.ok(colors.includes(`name="${name}">${value}`));
 for(const f of ['native_glass_surface','native_glass_pill','native_tabbar_glass','native_mini_player_bg']) {let s=read(`res/drawable/${f}.xml`);assert.match(s,/mel_glass_surface/);assert.match(s,/mel_glass_edge/);assert.match(s,/mel_glass_reflection/);assert.doesNotMatch(s,/RenderEffect|blur/i);}
});
test('all shell layouts share the glass navigation, search, and progress assets',()=>{
 for(const folder of ['layout','layout-land','layout-sw600dp','layout-sw600dp-land']){let s=read(`res/${folder}/activity_main.xml`);assert.match(s,/android:padding="@dimen\/mel_liquid_inset"/);assert.match(s,/@drawable\/native_search_field/);assert.equal((s.match(/@drawable\/native_progress_glass/g)||[]).length,2);assert.match(s,/android:maxLines="2"/);}
});
test('demo uses shared resources, and no active diagnostic toast is emitted',()=>{
 const d=read('demo/src/com/melodix/demo/DemoActivity.java');for(const r of ['native_glass_surface','native_glass_pill','native_tab_active','native_demo_art'])assert.ok(d.includes(r));
 assert.doesNotMatch(read('smali/com/melodix/music/NativeCrashGuard.smali'),/Melodix preview diag-5 : actif/);
 assert.match(read('smali/com/melodix/music/MainActivity.smali'),/melodix:action:copy-diagnostic/);
});

test('settings rows actually resolve symmetric 20dp margins in the real and passive demo factory',()=>{
 const {loadDimens, resolveSize, PHONE, TABLET}=require('./helpers/mel_dimens');
 for (const profile of [PHONE,TABLET]) assert.equal(resolveSize('@dimen/mel_settings_outer_inset',loadDimens(profile)),20);
 const factory=read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
 assert.match(factory,/const-string v1, "mel_settings_outer_inset"[\s\S]*?NativeUiRowFactory;->metric[\s\S]*?move-result v1[\s\S]*?iput v1, v0, Landroid\/view\/ViewGroup\$MarginLayoutParams;->leftMargin:I[\s\S]*?iput v1, v0, Landroid\/view\/ViewGroup\$MarginLayoutParams;->rightMargin:I/);
 assert.match(read('scripts/prepare_demo_preview.py'),/DemoSettingsRowFactory/);
});
test('header title reserves two lines and scales text without changing route handlers',()=>{
 for(const folder of ['layout','layout-land','layout-sw600dp','layout-sw600dp-land']){
  const s=read(`res/${folder}/activity_main.xml`);const start=s.indexOf('android:id="@id/nativeScreenTitle"');assert.ok(start>=0);const title=s.slice(start,s.indexOf('/>',start));
  assert.match(title,/android:maxLines="2"/);assert.match(title,/android:autoSizeTextType="uniform"/);
  assert.match(title,/@dimen\/mel_header_auto_min/);assert.match(title,/@dimen\/mel_header_title/);assert.match(title,/@dimen\/mel_header_auto_step/);
 }
 // Structural constraints only: without rendering we cannot guarantee that
 // arbitrary long labels or extreme font scales will never be ellipsized.
});

test('demo tints the active navigation icon white and the inactive icons tertiary',()=>{
 const d=read('demo/src/com/melodix/demo/DemoActivity.java');
 const start=d.indexOf('private void tab('), end=d.indexOf('private void render(',start);assert.ok(start>=0&&end>start);const tab=d.slice(start,end);
 assert.match(tab,/setSelected\(selected\)/);assert.match(tab,/setTextColor\(selected\?white:secondary\)/);
 assert.match(tab,/setCompoundDrawableTintList\(ColorStateList\.valueOf\(selected\?white:secondary\)\)/);
 assert.match(d,/white=0xffffffff, secondary=0xffa1a1b5/);
 assert.match(tab,/selected\?"native_tab_active":"native_tab_ripple"/);
});

test('three radial lights cover top, middle and bottom and the mini player clears the dock',()=>{
 const bg=read('res/drawable/native_shell_background.xml');
 assert.equal((bg.match(/android:type="radial"/g)||[]).length,3);
 for(const token of ['mel_glow_left','mel_glow_right','mel_glow_bottom'])assert.ok(bg.includes('@color/'+token));
 assert.match(bg,/android:gravity="top\|left"/);assert.match(bg,/android:gravity="center_vertical\|right"/);assert.match(bg,/android:gravity="bottom\|left"/);
 const c=read('res/values/colors.xml');for(const hex of ['#0B0B14','#BB3B1D7A','#AA6B1A55','#AA2A1A6E'])assert.ok(c.includes(hex));
 const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
 for(const cfg of [PHONE,TABLET])assert.ok(resolveSize('@dimen/mel_mini_margin_bottom',loadDimens(cfg))>=8);
 const demo=read('demo/src/com/melodix/demo/DemoActivity.java');const onCreate=demo.slice(demo.indexOf('void onCreate('),demo.indexOf('private void tab('));
 assert.match(onCreate,/nativePlayerArtwork[\s\S]*?nativePlayerLargeArtwork[\s\S]*?setImageResource\(drawable\("native_demo_art"\)\)[\s\S]*?render\("home"\)/);
});
