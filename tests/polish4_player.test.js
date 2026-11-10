'use strict';
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
test('phone player measures all other content before constraining a square cover',()=>{
 const s=read('smali/com/melodix/music/NativePlayerScroll.smali');
 assert.match(s,/getMeasuredHeight\(\)I[\s\S]*?getMeasuredHeight\(\)I[\s\S]*?sub-int\/2addr v7, v8/);
 assert.match(s,/mul-int\/lit8 v8, v8, 0x55[\s\S]*?div-int\/lit8 v8, v8, 0x64/);
 assert.match(s,/Math;->min\(II\)I/);assert.match(s,/mel_tab_bar_height/);assert.match(s,/setPadding\(IIII\)V/);
 for(const folder of ['layout','layout-land']){let x=read(`res/${folder}/activity_main.xml`);assert.match(x,/<com\.melodix\.music\.NativePlayerScroll\s+android:id="@id\/nativePlayerPanel"[\s\S]*?android:fillViewport="false"/);}
});
test('radial halo is transparent at its edge and full shell sits underneath the tint',()=>{
 const h=read('res/drawable/native_player_art_halo.xml');assert.match(h,/gradientRadius="50%"/);assert.match(h,/centerY="0.5"/);assert.match(read('res/values/colors.xml'),/name="mel_player_halo_outer">#00/);
 assert.match(read('res/drawable/native_player_background.xml'),/@drawable\/native_shell_background/);
 for(const folder of ['layout','layout-land','layout-sw600dp','layout-sw600dp-land']){let x=read(`res/${folder}/activity_main.xml`);let panel=x.slice(x.indexOf('@id/nativePlayerPanel'),x.indexOf('@id/nativeMiniPlayerContainer'));assert.match(panel,/android:background="@android:color\/transparent"/);}
 const tint=read('smali/com/melodix/music/NativePlayerTint.smali');assert.match(tint,/LayerDrawable/);assert.match(tint,/0x7f09022f/);
});
test('loading-only shimmer and stagger are attached to the actual native paths',()=>{
 const state=read('smali/com/melodix/music/NativeStateView.smali');assert.match(state,/native_state_loading[\s\S]*?NativeSkeleton;->attach/);
 const home=read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');assert.match(home,/home_status_no_spinner[\s\S]*?NativeSkeleton;->attach/);assert.match(home,/NativeSkeleton;->reveal/);
 assert.match(read('res/anim/native_skeleton_shimmer.xml'),/repeatCount="infinite"/);
});
test('CI asserts fixed demo badge and unclipped actions at phone, tablet and 360x640dp',()=>{
 const d=read('demo/src/com/melodix/demo/DemoActivity.java');assert.match(d,/root\.addView\(playerBadge,1,bp\)/);assert.match(d,/actionsParent=body\.getOrientation\(\)==LinearLayout\.HORIZONTAL/);
 const s=read('scripts/capture_demo_emulator.py');assert.match(s,/360x640/);assert.match(s,/pill clipped/);assert.match(s,/player unexpectedly scrolls/);assert.match(s,/badge moved during scroll/);
 assert.match(read('.github/workflows/demo-preview.yml'),/profile: \[phone, tablet, small\]/);
});
