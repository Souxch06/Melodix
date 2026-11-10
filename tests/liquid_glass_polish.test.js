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
